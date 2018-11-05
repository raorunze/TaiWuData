///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//File Title/Reference. For anyone reading, I have merged all the individual AbilitySets into two files, this set is for GTS Abilities only.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class X2Ability_GTSPerksRSAbilitySet extends X2Ability config(RS_SoldierSkills);


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//These are the lines you need to reference stuff in the config file (RS_SoldierSkills)
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

var config int IRONRESOLVERS_DEFENSE, IRONRESOLVERS_WILL;
var config int HIDDENPOTENTIAL_PSIOFFENSE;
var config int FOCUSEDFIRERS_AIM, FOCUSEDFIRERS_CRIT;
var config int COMBATVIGILANCERS_AIM, COMBATVIGILANCERS_CRIT, COMBATVIGILANCERS_WILL, COMBATVIGILANCERS_DODGE, COMBATIGILANCERS_DEFENSE;
var config int LETHALITYRS_CRIT;
var config int SHAKEITOFFRS_DODGE;
var config int RAPIDRESPONSERS_MOBILITY, RAPIDRESPONSERS_CRIT;
var config int OVERCLOCKRS_HACK;


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//This is the list of my custom perks held in this file, with all the individual code wayyyy below. Use Ctrl + F to find the perk you need.
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	//GTS Handles
	Templates.AddItem(AddAssassinPerkGTSAbility());
	Templates.AddItem(AddDemolitionsPerkGTSAbility());
	Templates.AddItem(AddGunnerPerkGTSAbility());
	Templates.AddItem(AddMagePerkGTSAbility());
	Templates.AddItem(AddMarksmanPerkGTSAbility());
	Templates.AddItem(AddMedicPerkGTSAbility());
	Templates.AddItem(AddRaiderPerkGTSAbility());
	Templates.AddItem(AddRiflemanPerkGTSAbility());
	Templates.AddItem(AddScoutPerkGTSAbility());
	Templates.AddItem(AddSurvivalistPerkGTSAbility());
	Templates.AddItem(AddSWATPerkGTSAbility());
	Templates.AddItem(AddTechnicianPerkGTSAbility());

	//Specific Abilities
	Templates.AddItem(ShadowFireRS());
	Templates.AddItem(ShadowFireNonSniperRS());
	Templates.AddItem(ShadowFireRS2());
	Templates.AddItem(IronResolveRS());
	Templates.AddItem(HiddenPotentialRS());
	Templates.AddItem(FocusedFireRS());
	Templates.AddItem(CombatVigilanceRS());
	Templates.AddItem(LethalityRS());
	Templates.AddItem(ShakeItOffRS());
	Templates.AddItem(IncognitoRS());
	Templates.AddItem(RapidResponseRS());
	Templates.AddItem(OverclockRS());

	return Templates;
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//All the Code is below this - CTRL + F is recommended to find what you need as it's a mess...
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//#############################################################
// Asassin GTS - Shadowfire, allows the Assassin to kill without breaking concealment (as long as they are kill shots)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddAssassinPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'AssassinPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('ShadowFireRS');
	Template.AdditionalAbilities.AddItem('ShadowFireNonSniperRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Shadow Fire Ability
static function X2AbilityTemplate ShadowFireRS()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local array<name>                       SkipExclusions;
	//local X2Effect_Knockback				KnockbackEffect;
	local X2Condition_Visibility            VisibilityCondition;
	local X2Condition_UnitProperty          ShooterCondition;	 //here

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShadowFireRS');

	// Icon Properties
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_shotfocused";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY;
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailableOrNoTargets;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';  
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Targeting Details
	// Can only shoot visible enemies
	VisibilityCondition = new class'X2Condition_Visibility';
	VisibilityCondition.bRequireGameplayVisible = true;
	VisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(VisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	//here
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	
	ShooterCondition = new class'X2Condition_UnitProperty';
	//ShooterCondition.IsUnspotted = true;  //fix this here needs to only be activateable while concealed.
	Template.AbilityShooterConditions.AddItem(ShooterCondition);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.bAddWeaponTypicalCost = true;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	// Ammo
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = true; // 	
	Template.bAllowBonusWeaponEffects = true;

	//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());	
	// Damage Effect
	Template.AddTargetEffect(default.WeaponUpgradeMissDamage);
	Template.bAllowAmmoEffects = true;
	// Weapon Upgrade Compatibility
	Template.bAllowFreeFireWeaponUpgrade = true;                        // Flag that permits action to become 'free action' via 'Hair Trigger' or similar upgrade / effects

	// Hit Calculation (Different weapons now have different calculations for range)
	Template.AbilityToHitCalc = default.SimpleStandardAim;
	Template.AbilityToHitOwnerOnMissCalc = default.SimpleStandardAim;
		
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "StandardGunFiring";	

	Template.AssociatedPassives.AddItem('HoloTargeting');

	//here conceal
	Template.ConcealmentRule = eConceal_KillShot;

	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;	
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	//KnockbackEffect = new class'X2Effect_Knockback';
	//KnockbackEffect.KnockbackDistance = 2;
	//KnockbackEffect.bUseTargetLocation = true;
	//Template.AddTargetEffect(KnockbackEffect);
	
	Template.AdditionalAbilities.AddItem('ShadowFireRS2');
	Template.OverrideAbilities.AddItem('SniperStandardFire');

	return Template;	
}

static function X2AbilityTemplate ShadowFireNonSniperRS()
{
	local X2AbilityTemplate                 Template;	
	local X2AbilityCost_Ammo                AmmoCost;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local array<name>                       SkipExclusions;
	//local X2Effect_Knockback				KnockbackEffect;
	local X2Condition_Visibility            VisibilityCondition;
	local X2Condition_UnitProperty          ShooterCondition;	 //here

	// Macro to do localisation and stuffs
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShadowFireNonSniperRS');

	// Icon Properties
	Template.bDontDisplayInAbilitySummary = false;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_shotfocused";
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.STANDARD_SHOT_PRIORITY;
	Template.Hostility = eHostility_Offensive;
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_ShowIfAvailableOrNoTargets;
	Template.DisplayTargetHitChance = true;
	Template.AbilitySourceName = 'eAbilitySource_Standard';  
	// Activated by a button press; additionally, tells the AI this is an activatable
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";

	SkipExclusions.AddItem(class'X2AbilityTemplateManager'.default.DisorientedName);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	// Targeting Details
	// Can only shoot visible enemies
	VisibilityCondition = new class'X2Condition_Visibility';
	VisibilityCondition.bRequireGameplayVisible = true;
	VisibilityCondition.bAllowSquadsight = true;
	Template.AbilityTargetConditions.AddItem(VisibilityCondition);
	// Can't target dead; Can't target friendlies
	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	//here
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);	
	ShooterCondition = new class'X2Condition_UnitProperty';
	//ShooterCondition.IsUnspotted = true;  //fix this here needs to only be activateable while concealed.
	Template.AbilityShooterConditions.AddItem(ShooterCondition);
	// Only at single targets that are in range.
	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	// Action Point
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	// Ammo
	AmmoCost = new class'X2AbilityCost_Ammo';	
	AmmoCost.iAmmo = 1;
	Template.AbilityCosts.AddItem(AmmoCost);
	Template.bAllowAmmoEffects = true; // 	
	Template.bAllowBonusWeaponEffects = true;

	//  Put holo target effect first because if the target dies from this shot, it will be too late to notify the effect.
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.HoloTargetEffect());
	Template.AddTargetEffect(class'X2Ability_GrenadierAbilitySet'.static.ShredderDamageEffect());	
	// Damage Effect
	Template.AddTargetEffect(default.WeaponUpgradeMissDamage);
	Template.bAllowAmmoEffects = true;
	// Weapon Upgrade Compatibility
	Template.bAllowFreeFireWeaponUpgrade = true;                        // Flag that permits action to become 'free action' via 'Hair Trigger' or similar upgrade / effects

	// Hit Calculation (Different weapons now have different calculations for range)
	Template.AbilityToHitCalc = default.SimpleStandardAim;
	Template.AbilityToHitOwnerOnMissCalc = default.SimpleStandardAim;
		
	// Targeting Method
	Template.TargetingMethod = class'X2TargetingMethod_OverTheShoulder';
	Template.bUsesFiringCamera = true;
	Template.CinescriptCameraType = "StandardGunFiring";	

	Template.AssociatedPassives.AddItem('HoloTargeting');

	//here conceal
	Template.ConcealmentRule = eConceal_KillShot;

	Template.bDisplayInUITooltip = true;
	Template.bDisplayInUITacticalText = true;

	// MAKE IT LIVE!
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;	
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;

	//KnockbackEffect = new class'X2Effect_Knockback';
	//KnockbackEffect.KnockbackDistance = 2;
	//KnockbackEffect.bUseTargetLocation = true;
	//Template.AddTargetEffect(KnockbackEffect);
	
	Template.AdditionalAbilities.AddItem('ShadowFireRS2');
	Template.OverrideAbilities.AddItem('StandardShot');

	return Template;	
}

static function X2AbilityTemplate ShadowFireRS2()
{
	local X2AbilityTemplate						Template;
	//local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
 
	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShadowFireRS2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_momentum";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	// Damage Effect
	//WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	//WeaponDamageEffect.
	//WeaponDamageEffect.EffectDamageValue.Damage = 0.25; //This will make weapon damage + set value
	//Template.AddTargetEffect(WeaponDamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Demolitions GTS - Biggest Booms (Same as Vanilla Grenadier GTS)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddDemolitionsPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'DemolitionsPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('BiggestBooms');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Gunner GTS - Iron Resolve (+10 Defense & +10 Willpower)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddGunnerPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'GunnerPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('IronResolveRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Iron Resolve Ability
static function X2AbilityTemplate IronResolveRS()
{
	local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange         DEF;
	local X2Effect_PersistentStatChange         WILL;

	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'IronResolveRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_beserk"; //ICON!

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	DEF = new class'X2Effect_PersistentStatChange';
	DEF.AddPersistentStatChange(eStat_Defense, default.IRONRESOLVERS_DEFENSE);
	DEF.BuildPersistentEffect(1, true, false, false);
	DEF.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(DEF);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, default.IRONRESOLVERS_DEFENSE);

	WILL = new class'X2Effect_PersistentStatChange';
	WILL.AddPersistentStatChange(eStat_Will, default.IRONRESOLVERS_WILL);
	WILL.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(WILL);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, default.IRONRESOLVERS_WILL);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Mage GTS - Hidden Potential (+25 Psi-Offense)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddMagePerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MagePerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('HiddenPotentialRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Hidden Potential Ability
static function X2AbilityTemplate HiddenPotentialRS()
{
	local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange         PSI;

	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'HiddenPotentialRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_adventpsiwitch_confuse"; //ICON!

	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PSI = new class'X2Effect_PersistentStatChange';
	PSI.AddPersistentStatChange(eStat_PsiOffense, default.HIDDENPOTENTIAL_PSIOFFENSE);
	PSI.BuildPersistentEffect(1, true, false, false);
	PSI.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(PSI);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseBonusLabel, eStat_PsiOffense, default.HIDDENPOTENTIAL_PSIOFFENSE); // eStat_PsiOffense has PsiOffenseBonusLabel for some reason.

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Marksman GTS - Focused Fire (Shot with Aim & Crit Bonus)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddMarksmanPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MarksmanPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('FocusedFireRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Focused Fire Ability
static function X2AbilityTemplate FocusedFireRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange         Hit;
	local X2Effect_PersistentStatChange         Crit;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'FocusedFireRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_burstfire";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Hit = new class'X2Effect_PersistentStatChange';
	Hit.AddPersistentStatChange(eStat_Offense, default.FOCUSEDFIRERS_AIM);
	Hit.BuildPersistentEffect(1, true, false, false);
	Hit.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(Hit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, default.FOCUSEDFIRERS_AIM);

	Crit = new class'X2Effect_PersistentStatChange';
	Crit.AddPersistentStatChange(eStat_CritChance, default.FOCUSEDFIRERS_CRIT);
	Crit.BuildPersistentEffect(1, true, false, false);
	Crit.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, ,Template.AbilitySourceName);
	Template.AddTargetEffect(Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritChanceLabel, eStat_CritChance, default.FOCUSEDFIRERS_CRIT);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Medic GTS - Vigilance (+5 Aim, Crit, Defesne, Dodge & Willpower)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddMedicPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MedicPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('CombatVigilanceRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Combat Vigilance Ability
static function X2AbilityTemplate CombatVigilanceRS()
{
	local X2AbilityTemplate						Template;
	local X2Effect_PersistentStatChange         stat1;
	local X2Effect_PersistentStatChange         stat2;
	local X2Effect_PersistentStatChange         stat3;
	local X2Effect_PersistentStatChange         stat4;
	local X2Effect_PersistentStatChange         stat5; //StatE is read as State for some reason lol

	// Icon Properties
	`CREATE_X2ABILITY_TEMPLATE(Template, 'CombatVigilanceRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_overwatch";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	stat1 = new class'X2Effect_PersistentStatChange';
	stat1.AddPersistentStatChange(eStat_Offense, default.COMBATVIGILANCERS_AIM);
	stat1.BuildPersistentEffect(1, true, false, false);
	stat1.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(stat1);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, default.COMBATVIGILANCERS_AIM); //Aim is known as eStat_Offense but still has AimLabel, Why Firaxis!?

	stat2 = new class'X2Effect_PersistentStatChange';
	stat2.AddPersistentStatChange(eStat_CritChance, default.COMBATVIGILANCERS_CRIT);
	stat2.BuildPersistentEffect(1, true, false, false);
	stat2.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, ,Template.AbilitySourceName);
	Template.AddTargetEffect(stat2);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritChanceLabel, eStat_CritChance, default.COMBATVIGILANCERS_CRIT);

	stat3 = new class'X2Effect_PersistentStatChange';
	stat3.AddPersistentStatChange(eStat_Will, default.COMBATVIGILANCERS_WILL);
	stat3.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(stat3);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, default.COMBATVIGILANCERS_WILL);

	stat4 = new class'X2Effect_PersistentStatChange';
	stat4.AddPersistentStatChange(eStat_Dodge, default.COMBATVIGILANCERS_DODGE);
	stat4.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(stat4);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, default.COMBATVIGILANCERS_DODGE);

	stat5 = new class'X2Effect_PersistentStatChange';
	stat5.AddPersistentStatChange(eStat_Defense, default.COMBATIGILANCERS_DEFENSE);
	stat5.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(stat5);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, default.COMBATIGILANCERS_DEFENSE);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!
	
	//AWC Allow
	Template.bCrossClassEligible = true;

	return Template;
}

//#############################################################
// Raider GTS - Lethality, +25 Crit Chance
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddRaiderPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'RaiderPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('LethalityRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Lethality Ability
static function X2AbilityTemplate LethalityRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange         CritChanceGTS;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'LethalityRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_deadeye";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	CritChanceGTS = new class'X2Effect_PersistentStatChange';
	CritChanceGTS.AddPersistentStatChange(eStat_CritChance, default.LETHALITYRS_CRIT);
	CritChanceGTS.BuildPersistentEffect(1, true, false, false);
	CritChanceGTS.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(CritChanceGTS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritChanceLabel, eStat_CritChance, default.LETHALITYRS_CRIT);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Rifleman GTS - Shake It Off (+25 Dodge)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddRiflemanPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'RiflemanPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('ShakeItOffRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Shake It Off Ability
static function X2AbilityTemplate ShakeItOffRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange         DodgeGTS;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ShakeItOffRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combatstim_metabolism";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	DodgeGTS = new class'X2Effect_PersistentStatChange';
	DodgeGTS.AddPersistentStatChange(eStat_Dodge, default.SHAKEITOFFRS_DODGE);
	DodgeGTS.BuildPersistentEffect(1, true, false, false);
	DodgeGTS.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(DodgeGTS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, default.SHAKEITOFFRS_DODGE);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Scout GTS - Incognito (-20% Detection Range)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddScoutPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'ScoutPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('IncognitoRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Incognito Ability
static function X2AbilityTemplate IncognitoRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange			PersistentEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'IncognitoRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_cloudinthemind";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);
	
	//Stealth Effect
	PersistentEffect = new class'X2Effect_PersistentStatChange';
	PersistentEffect.BuildPersistentEffect(1, true, false);
	PersistentEffect.AddPersistentStatChange(eStat_DetectionModifier, 0.20f);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(PersistentEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Survivalist GTS - Conceal and Carry (Allows Survivalists to take on a stealth role in battle)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddSurvivalistPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SurvivalistPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('ConcealandCarryRS');
	Template.AdditionalAbilities.AddItem('Phantom');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// SWAT GTS - Rapid Response (+2 Mobility & +10 Crit Chance)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddSWATPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'SWATPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('RapidResponseRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Rapid Response Ability
static function X2AbilityTemplate RapidResponseRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange         MobilityGTS;
	local X2Effect_PersistentStatChange         CritChanceGTS;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'RapidResponseRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_stickandmove";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	MobilityGTS = new class'X2Effect_PersistentStatChange';
	MobilityGTS.AddPersistentStatChange(eStat_Mobility, default.RAPIDRESPONSERS_MOBILITY);
	MobilityGTS.BuildPersistentEffect(1, true, false, false);
	MobilityGTS.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(MobilityGTS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, default.RAPIDRESPONSERS_MOBILITY);

	CritChanceGTS = new class'X2Effect_PersistentStatChange';
	CritChanceGTS.AddPersistentStatChange(eStat_CritChance, default.RAPIDRESPONSERS_CRIT);
	CritChanceGTS.BuildPersistentEffect(1, true, false, false);
	CritChanceGTS.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, ,Template.AbilitySourceName);
	Template.AddTargetEffect(CritChanceGTS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritChanceLabel, eStat_CritChance, default.RAPIDRESPONSERS_CRIT);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

//#############################################################
// Technician - Overclock (+25 Hack Score)
//#############################################################

// GTS Handle
static function X2AbilityTemplate AddTechnicianPerkGTSAbility()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'TechnicianPerkGTS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	Template.AdditionalAbilities.AddItem('OverclockRS');

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

// Overclock Ability
static function X2AbilityTemplate OverclockRS()
{
	local X2AbilityTemplate						Template;
	local X2AbilityTargetStyle                  TargetStyle;
	local X2AbilityTrigger						Trigger;
	local X2Effect_PersistentStatChange         HackGTS;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'OverclockRS');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_combathacker";

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;

	TargetStyle = new class'X2AbilityTarget_Self';
	Template.AbilityTargetStyle = TargetStyle;

	Trigger = new class'X2AbilityTrigger_UnitPostBeginPlay';
	Template.AbilityTriggers.AddItem(Trigger);

	HackGTS = new class'X2Effect_PersistentStatChange';
	HackGTS.AddPersistentStatChange(eStat_Hacking, default.OVERCLOCKRS_HACK);
	HackGTS.BuildPersistentEffect(1, true, false, false);
	HackGTS.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage,,,Template.AbilitySourceName);
	Template.AddTargetEffect(HackGTS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.TechLabel, eStat_Hacking, default.OVERCLOCKRS_HACK); //Hacking Stat uses Tech Label to be confusing

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END FILE
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////