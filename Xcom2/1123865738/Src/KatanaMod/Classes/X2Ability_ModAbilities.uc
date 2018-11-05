class X2Ability_ModAbilities extends X2Ability
	dependson (XComGameStateContext_Ability) config(KatanaMod);

var config int NINJATO_SPEED_BONUS;
var config int WAKIZASHI_SPEED_BONUS;
var config int KATANA_SPEED_BONUS;
var config int LIGHTNING_SLASH_COOLDOWN_T1;
var config int LIGHTNING_SLASH_COOLDOWN_T2;
var config int LIGHTNING_SLASH_COOLDOWN_T3;
var config int SILENT_TAKEDOWN_DURATION;
var config int SILENT_TAKEDOWN_CRITICAL_HIT_BONUS_T1;
var config int SILENT_TAKEDOWN_CRITICAL_DMG_BONUS_T1;
var config int SILENT_TAKEDOWN_CRITICAL_HIT_BONUS_T2;
var config int SILENT_TAKEDOWN_CRITICAL_DMG_BONUS_T2;
var config int SILENT_TAKEDOWN_CRITICAL_HIT_BONUS_T3;
var config int SILENT_TAKEDOWN_CRITICAL_DMG_BONUS_T3;
var config int SILENT_TAKEDOWN_CHARGES_T1;
var config int SILENT_TAKEDOWN_CHARGES_T2;
var config int SILENT_TAKEDOWN_CHARGES_T3;
var config int SILENT_TAKEDOWN_COOLDOWN_T1;
var config int SILENT_TAKEDOWN_COOLDOWN_T2;
var config int SILENT_TAKEDOWN_COOLDOWN_T3;
var config bool SILENT_TAKEDOWN_SHOW_GHOST_EFFECT;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(NinjatoSpeedBonus());
	ModWeapons.AddItem(WakizashiSpeedBonus());
	ModWeapons.AddItem(KatanaSpeedBonus());
	ModWeapons.AddItem(LightningStrike('MusashiLightningStrikeT1', 1));
	ModWeapons.AddItem(LightningStrike('MusashiLightningStrikeT2', 2));
	ModWeapons.AddItem(LightningStrike('MusashiLightningStrikeT3', 3));

	//ModWeapons.AddItem(ChosenAnim());
	return ModWeapons;
}

static function X2AbilityTemplate LightningStrike(name AbilityName, int tier)
{
	local X2AbilityTemplate									Template;
	local X2AbilityToHitCalc_StandardMelee					StandardMelee;
	local X2AbilityTarget_MovingMelee						MeleeTarget;
	local X2Effect_ApplyWeaponDamage						WeaponDamageEffect;
	local array<name>										SkipExclusions;
	local X2AbilityCooldown									Cooldown;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_HideSpecificErrors;
	Template.HideErrors.AddItem('AA_WeaponIncompatible');
	Template.CinescriptCameraType = "Ranger_Reaper";
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_lightninghands";
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";
	
	Cooldown = new class'X2AbilityCooldown';
	if (tier == 1) {
		Cooldown.iNumTurns = default.LIGHTNING_SLASH_COOLDOWN_T1;
	}
	if (tier == 2) {
		Cooldown.iNumTurns = default.LIGHTNING_SLASH_COOLDOWN_T2;
	}
	if (tier == 3) {
		Cooldown.iNumTurns = default.LIGHTNING_SLASH_COOLDOWN_T3;
	}
	
	Template.AbilityCooldown = Cooldown;

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	Template.AbilityToHitCalc = StandardMelee;
	
	MeleeTarget = new class'X2AbilityTarget_MovingMelee';
	MeleeTarget.MovementRangeAdjustment = 1;
	Template.AbilityTargetStyle = MeleeTarget;
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	// Target Conditions
	//
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	// Shooter Conditions
	//
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Damage Effect
	//
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	Template.AddTargetEffect(WeaponDamageEffect);
	
	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;
	
	// Voice events
	//
	Template.SourceMissSpeech = 'SwordMiss';

	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;

	return Template;
}


static function X2AbilityTemplate WakizashiSpeedBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WakizashiSpeedBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	if (!class'X2Item_Katana_Weapon'.default.bWakizashiIsCosmetic)
	{
		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.WAKIZASHI_SPEED_BONUS);
		Template.AddTargetEffect(PersistentStatChangeEffect);
	}
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;
}

static function X2AbilityTemplate KatanaSpeedBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'KatanaSpeedBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	if (!class'X2Item_Katana_Weapon'.default.bKatanaIsCosmetic)
	{
		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.KATANA_SPEED_BONUS);
		Template.AddTargetEffect(PersistentStatChangeEffect);
	}
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;
}

static function X2AbilityTemplate NinjatoSpeedBonus()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'NinjatoSpeedBonus');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	
	if (!class'X2Item_Katana_Weapon'.default.bNinjatoIsCosmetic)
	{
		PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
		PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
		PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
		PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.NINJATO_SPEED_BONUS);
		Template.AddTargetEffect(PersistentStatChangeEffect);
	}
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;
}

static function X2AbilityTemplate SpiderSuit()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_AdditionalAnimSets		AnimSets;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MusashiSpiderSuit');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	AnimSets = new class'X2Effect_AdditionalAnimSets';
	AnimSets.AddAnimSetWithPath("MusashAnimations.Anims.AS_Spider");
	AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);
	AnimSets.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(AnimSets);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//Template.BuildVisualizationFn = SpiderSuit_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate ChosenAnim()
{
	local X2AbilityTemplate                 Template;
	local X2Effect_AdditionalAnimSets		AnimSets;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ChosenAnim');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	AnimSets = new class'X2Effect_AdditionalAnimSets';
	AnimSets.AddAnimSetWithPath("ChosenAnim.Anims.AS_Sword");
	AnimSets.BuildPersistentEffect(1, true, false, false, eGameRule_PlayerTurnBegin);
	Template.AddTargetEffect(AnimSets);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

simulated function SpiderSuit_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory			History;
	local XComGameStateContext_Ability	Context;
	local StateObjectReference			InteractingUnitRef;
	local XComGameState_Unit			UnitState;
	local XGUnit						UnitActor;
	local XComUnitPawn					UnitPawn;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(InteractingUnitRef.ObjectID));
	UnitActor = XGUnit(UnitState.GetVisualizer());
	UnitPawn = UnitActor.GetPawn();
	UnitPawn.UpdateAnimations();
	`LOG("Musashi: Updated animations for" @ UnitState.GetMyTemplateName(),, 'SpiderSuit');
}

