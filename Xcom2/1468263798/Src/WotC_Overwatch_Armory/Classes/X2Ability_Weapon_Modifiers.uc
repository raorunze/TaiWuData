//
// This script adds the Mobility and Reaction Fire abilities, for now. Taken notes from Zomby's Semi Automatic Weapons mod.
//
class X2Ability_Weapon_Modifiers extends X2Ability dependson (XComGameStateContext_Ability) config(Global_Stat_Modifiers);

var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T4;

var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T4;

var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T4;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_MOBILITY_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_MOBILITY_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_MOBILITY_T3;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T3;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T3;

var config int MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T4;

var config int MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T4;

var config int MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T1;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T2;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T3;
var config int MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T4;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T3;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T3;

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T3;

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T4;

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T4;

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T4;

var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T1;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T2;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T3;

var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T1;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T2;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T3;

var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T1;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T2;
var config int MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T3;

// Create the Templates
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T3());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T4());

	Templates.AddItem(AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T3());

	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T1());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T3());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T4());

	Templates.AddItem(AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3());

	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4());

	Templates.AddItem(AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T1());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T2());
	Templates.AddItem(AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T3());

	return Templates;
}

//
//
// PULSE PISTOL - CLASSIC
//
//

//
// Base: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CLASSIC_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CLASSIC_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}

//
// Base: Forged
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CLASSIC_T4()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CLASSIC_StatModifier_T4');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_MOBILITY_T4);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T4);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T4;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}


//
//War of the Chosen
//

//
// Templar: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Templar: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}

//
//
// PULSE PISTOL - CADET
//
//

//
// Base: Conventional
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T1()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CADET_StatModifier_T1');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T1);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T1;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CADET_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CADET_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Forged
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_PULSEPISTOL_CADET_T4()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_PULSEPISTOL_CADET_StatModifier_T4');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_PULSEPISTOL_CADET_MOBILITY_T4);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T4);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_PULSEPISTOL_CADET_REACTIONFIRE_T4;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}


//
//War of the Chosen
//


//
// Templar: Conventional
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T1');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T1);

	ReactionFire.ReactionModifier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T1;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Templar: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Templar: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}

//
//
// HEAVY PULSE RIFLE - CLASSIC
//
//

//
// Base: Conventional
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T1');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T1);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T1;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Base: Forged
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T4');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T4);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T4);

	ReactionFire.ReactionModifier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T4;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}

//
//War of the Chosen
//


//
// Templar: Conventional
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T1()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T1');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T1);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T1);

	ReactionFire.ReactionModifier = default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T1;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Templar: Magnetic
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T2()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T2');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T2);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T2);

	ReactionFire.ReactionModifier = default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T2;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}
//
// Templar: Beam
//
static function X2AbilityTemplate AddWeaponModifiers_MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T3()
{
	local X2AbilityTemplate                 Template;	
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local X2Effect_ModifyReactionFire           ReactionFire;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T3');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_standard"; 
	
	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bDisplayInUITacticalText = false;
	
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	ReactionFire = new class'X2Effect_ModifyReactionFire';

	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, "", "", Template.IconImage, false,,Template.AbilitySourceName);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T3);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_DETECTIONRADIUS_T3);

	ReactionFire.ReactionModifier = default.MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_REACTIONFIRE_T3;
	
	Template.AddTargetEffect(PersistentStatChangeEffect);
	Template.AddTargetEffect(ReactionFire);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return Template;	
}