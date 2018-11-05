class X2Ability_PulseBomb extends X2Ability config(Weapon_MD_WOTC_OW_PULSE_BOMB);

var name PulseBombDetonationAbilityName;

var config string PulseBombExplosionFX;       //  Particle effect for explosion

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	Templates.AddItem(PulseBombDetonation());

	return Templates;

}

static function X2AbilityTemplate PulseBombDetonation()
{
	local X2AbilityTemplate							Template;
	local X2AbilityToHitCalc_StandardAim			ToHit;
	local X2Condition_UnitProperty					UnitPropertyCondition;
	local X2Condition_AbilitySourceWeapon			GrenadeCondition;
	local X2AbilityTarget_Cursor					CursorTarget;
	local X2AbilityMultiTarget_Radius               RadiusMultiTarget;
	local X2Effect_ApplyWeaponDamage				WeaponDamage;

	`CREATE_X2ABILITY_TEMPLATE(Template, default.PulseBombDetonationAbilityName);

	ToHit = new class'X2AbilityToHitCalc_StandardAim';
	ToHit.bIndirectFire = true;
	Template.AbilityToHitCalc = ToHit;

	CursorTarget = new class'X2AbilityTarget_Cursor';
	CursorTarget.IncreaseWeaponRange = 2;
	Template.AbilityTargetStyle = CursorTarget;

	Template.AddShooterEffect(new class'X2Effect_BreakUnitConcealment');

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.bUseWeaponRadius = true;
	RadiusMultiTarget.fTargetRadius = 2;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeDead = true;
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeHostileToSource = false;
	UnitPropertyCondition.FailOnNonUnits = false; //The grenade can affect interactive objects, others
	Template.AbilityMultiTargetConditions.AddItem(UnitPropertyCondition);

	GrenadeCondition = new class'X2Condition_AbilitySourceWeapon';
	GrenadeCondition.CheckGrenadeFriendlyFire = true;
	Template.AbilityMultiTargetConditions.AddItem(GrenadeCondition);

	WeaponDamage = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamage.bExplosiveDamage = true;
	Template.AddMultiTargetEffect(WeaponDamage);

	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_Placeholder');      //  ability is activated by effect detecting movement in range of mine

	Template.AbilitySourceName = 'eAbilitySource_Standard';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_grenade_proximitymine";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_GRENADE_PRIORITY;
	Template.bUseAmmoAsChargesForHUD = true;
	Template.bDisplayInUITooltip = false;
	Template.bDisplayInUITacticalText = false;

	Template.FrameAbilityCameraType = eCameraFraming_Never;

	Template.ActivationSpeech = 'Explosion';
	Template.bSkipFireAction = true;
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = PulseBombDetonation_BuildVisualization;
	//  cannot interrupt this explosion

	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.GrenadeLostSpawnIncreasePerUse;
	Template.bFrameEvenWhenUnitIsHidden = true;

	return Template;
}

function PulseBombDetonation_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateContext_Ability AbilityContext;
	//local XComGameStateVisualizationMgr VisMgr;
	local VisualizationActionMetadata VisTrack;
	local int ShooterTrackIdx;
	local X2Action_PlayEffect EffectAction;	
	local X2Action_CameraLookAt LookAtAction;
	local X2Action_Delay DelayAction;
	local X2Action_StartStopSound SoundAction;
	//local XComGameStateHistory History;

	//VisMgr = `XCOMVISUALIZATIONMGR;
	ShooterTrackIdx = INDEX_NONE;
	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	VisTrack.StateObjectRef = AbilityContext.InputContext.SourceObject;
	TypicalAbility_BuildVisualization(VisualizeGameState);

	`assert(ShooterTrackIdx != INDEX_NONE);

	//Camera comes first
	LookAtAction = X2Action_CameraLookAt(class'X2Action_CameraLookAt'.static.CreateVisualizationAction(AbilityContext));
	LookAtAction.LookAtLocation = AbilityContext.InputContext.TargetLocations[0];
	LookAtAction.BlockUntilFinished = true;
	LookAtAction.LookAtDuration = 2.0f;
	
	//Do the detonation
	EffectAction = X2Action_PlayEffect(class'X2Action_PlayEffect'.static.AddToVisualizationTree(VisTrack, AbilityContext, false));
	EffectAction.EffectName = default.PulseBombExplosionFX;
	EffectAction.EffectLocation = AbilityContext.InputContext.TargetLocations[0];
	EffectAction.EffectRotation = Rotator(vect(0, 0, 1));
	EffectAction.bWaitForCompletion = false;
	EffectAction.bWaitForCameraCompletion = false;

	SoundAction = X2Action_StartStopSound(class'X2Action_StartStopSound'.static.AddToVisualizationTree(VisTrack, AbilityContext, false));
	SoundAction.Sound = new class'SoundCue';
	SoundAction.Sound.AkEventOverride = AkEvent'SoundX2CharacterFX.Proximity_Mine_Explosion';
	SoundAction.bIsPositional = true;
	SoundAction.vWorldPosition = AbilityContext.InputContext.TargetLocations[0];
	
	//Keep the camera there after things blow up
	DelayAction = X2Action_Delay(class'X2Action_Delay'.static.CreateVisualizationAction(AbilityContext));
	DelayAction.Duration = 0.5;	

}

//  Special handling for proximity mine damage as they do not deal damage until they explode and therefore don't have damage effects for throw/launch
function bool GrenadeDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	local XComGameState_Item ItemState;
	local X2GrenadeTemplate GrenadeTemplate;
	local XComGameState_Ability DetonationAbility;
	local XComGameState_Unit SourceUnit;
	local XComGameStateHistory History;
	local StateObjectReference AbilityRef;

	ItemState = AbilityState.GetSourceAmmo();
	if (ItemState == none)
		ItemState = AbilityState.GetSourceWeapon();

	if (ItemState == none)
		return false;

	GrenadeTemplate = X2GrenadeTemplate(ItemState.GetMyTemplate());
	if (GrenadeTemplate == none)
		return false;

	if (GrenadeTemplate.DataName != 'MD_WOTC_OW_PULSE_BOMB')
		return false;

	History = `XCOMHISTORY;
	SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
	AbilityRef = SourceUnit.FindAbility(default.PulseBombDetonationAbilityName);
	DetonationAbility = XComGameState_Ability(History.GetGameStateForObjectID(AbilityRef.ObjectID));
	if (DetonationAbility == none)
		return false;

	DetonationAbility.GetDamagePreview(TargetRef, MinDamagePreview, MaxDamagePreview, AllowsShield);
	return true;
}

DefaultProperties
{
	PulseBombDetonationAbilityName = "PulseBombDetonation"
}