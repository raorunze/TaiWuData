// class for the new immunity abilities
class aa_X2Ability_Immunities extends X2Ability config(ArmorConfig);

var config int RegenM1HealPerTurn;
var config int RegenM2HealPerTurn;
var config int RegenM3HealPerTurn;

var config int RegenM1MaxHeal;
var config int RegenM2MaxHeal;
var config int RegenM3MaxHeal;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	
	Templates.AddItem(CreateImmunity('Chrm_MentalImmunity', 'Chrm_MentalImmunityEffect', 'Mental'));
	Templates.AddItem(CreateImmunity('Chrm_FireImmunity', 'Chrm_FireImmunityEffect', 'Fire'));
	Templates.AddItem(CreateImmunity('Chrm_AcidImmunity', 'Chrm_AcidImmunityEffect', 'Acid'));
	Templates.AddItem(CreateImmunity('Chrm_PoisonImmunity', 'Chrm_PoisonImmunityEffect', 'Poison'));
	Templates.AddItem(CreateImmunity('Chrm_FrostImmunity', 'Chrm_FrostImmunityEffect', 'Frost'));
	
	Templates.AddItem(CreateRegeneration('Chrm_RegenM1', 'Chrm_RegenM1Effect', default.RegenM1HealPerTurn, default.RegenM1MaxHeal));
	Templates.AddItem(CreateRegeneration('Chrm_RegenM2', 'Chrm_RegenM2Effect', default.RegenM2HealPerTurn, default.RegenM2MaxHeal));
	Templates.AddItem(CreateRegeneration('Chrm_RegenM3', 'Chrm_RegenM3Effect', default.RegenM3HealPerTurn, default.RegenM3MaxHeal));
	return Templates;
}

static function X2AbilityTemplate CreateImmunity(name AbilityName, name EffectName, name ImmunityType)
{
	local X2AbilityTemplate						Template;
	//local X2Effect_PersistentStatChange         PersistentStatChangeEffect;
	local X2Effect_DamageImmunity               ImmunityEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	ImmunityEffect = new class'X2Effect_DamageImmunity';
	ImmunityEffect.EffectName = EffectName;
	ImmunityEffect.ImmuneTypes.AddItem(ImmunityType);
	// additional immunities for 'mental' defense. Dazed and a few others are covered by the 'mental'
	if(ImmunityType == 'Mental')
	{
		ImmunityEffect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.DisorientDamageType);
		ImmunityEffect.ImmuneTypes.AddItem('stun');
		ImmunityEffect.ImmuneTypes.AddItem('Unconscious');
	}
	if(ImmunityType == 'Poison')
	{
		ImmunityEffect.ImmuneTypes.AddItem(class'X2Item_DefaultDamageTypes'.default.ParthenogenicPoisonType);
	}
	ImmunityEffect.BuildPersistentEffect(1, true, false, false);
	ImmunityEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.GetMyHelpText(), Template.IconImage, false, , Template.AbilitySourceName);
	Template.AddTargetEffect(ImmunityEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}

static function X2AbilityTemplate CreateRegeneration(name AbilityName, name EffectName, int HealPerTurn, int MaxHeal)
{
	local X2AbilityTemplate						Template;
	//local X2Effect_PersistentStatChange         PersistentStatChangeEffect;
	local X2Effect_Regeneration               RegenerationEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, AbilityName);

	Template.AbilitySourceName = 'eAbilitySource_Item';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_item_nanofibervest";

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	RegenerationEffect = new class'X2Effect_Regeneration';
	RegenerationEffect.BuildPersistentEffect(1, true, true, false, eGameRule_PlayerTurnBegin);
	RegenerationEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.GetMyLongDescription(), Template.IconImage, false, , Template.AbilitySourceName);
	RegenerationEffect.HealAmount = HealPerTurn;
	RegenerationEffect.MaxHealAmount = MaxHeal;
	RegenerationEffect.HealthRegeneratedName = 'StasisVestHealthRegenerated';
	Template.AddTargetEffect(RegenerationEffect);
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//  NOTE: No visualization on purpose!

	return Template;
}