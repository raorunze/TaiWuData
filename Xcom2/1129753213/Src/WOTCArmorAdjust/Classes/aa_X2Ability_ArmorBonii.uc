class aa_X2Ability_ArmorBonii extends XMBAbility config(ArmorConfig);

var config array<VestStats> VestList;
var config array<ArmorStats> ArmorList;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
	local int idx;
	
	for(idx=0;idx<default.VestList.Length;idx++)
	{
		Templates.AddItem(CreateVestBonus(default.VestList[idx].AbilityName, default.VestList[idx].ItemName));
	}
	for(idx=0;idx<default.ArmorList.Length;idx++)
	{
		Templates.AddItem(CreateArmorBonus(default.ArmorList[idx].AbilityName, default.ArmorList[idx].ItemName));
	}
	//Templates.AddItem(CreateAmmoPocketAbility());
	//Templates.AddItem(CreateGrenadePocketAbility());
	
	return Templates;
}

static function X2AbilityTemplate CreateGrenadePocketAbility()
{
	//Template.SoldierAbilityPurchasedFn = class'X2Ability_GrenadierAbilitySet'.static.GrenadePocketPurchased;

	return Passive('ChrmAA_GrenadePocket', "img:///UILibrary_PerkIcons.UIPerk_command", false);
}

static function X2AbilityTemplate CreateAmmoPocketAbility()
{
	//Template.SoldierAbilityPurchasedFn = class'X2Ability_GrenadierAbilitySet'.static.GrenadePocketPurchased;

	return Passive('ChrmAA_AmmoPocket', "img:///UILibrary_PerkIcons.UIPerk_command", false);
}

static function X2AbilityTemplate CreateVestBonus(name AbilityName, name ItemName)
{
	local X2AbilityTemplate					AbilityTemplate;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local int								ShieldBonus, idx;
	local VestStats							ConfigVars;
	local aa_ChrmAA							Getter;
	
	Getter = new class'aa_ChrmAA';
	ConfigVars = Getter.GrabVestConfigVars(ItemName);
	//AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	`CREATE_X2ABILITY_TEMPLATE(AbilityTemplate, AbilityName);
	
	AbilityTemplate.AbilitySourceName = 'eAbilitySource_Item';
	AbilityTemplate.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	AbilityTemplate.Hostility = eHostility_Neutral;
	AbilityTemplate.bDisplayInUITacticalText = false;
	
	AbilityTemplate.AbilityToHitCalc = default.DeadEye;
	AbilityTemplate.AbilityTargetStyle = default.SelfTarget;
	AbilityTemplate.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, AbilityTemplate.LocFriendlyName, AbilityTemplate.GetMyLongDescription(), AbilityTemplate.IconImage, false, , AbilityTemplate.AbilitySourceName);
	
	ShieldBonus = ConfigVars.shield;
	
	if(Getter.BetaStrikifyShields() != 1.0)
	{
		ShieldBonus *= Getter.BetaStrikifyShields();
	}

	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, ShieldBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, ConfigVars.hp);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, ConfigVars.mob);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, ConfigVars.armor);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, ConfigVars.dodge);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, ConfigVars.defense);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, ConfigVars.hack);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, ConfigVars.will);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorPiercing, ConfigVars.pierce);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, ConfigVars.psi);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, ConfigVars.sneak);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_CritChance, ConfigVars.crit);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingCritChance, ConfigVars.flankcrit);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingAimBonus, ConfigVars.flankaim);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, ConfigVars.aim);
	AbilityTemplate.AddTargetEffect(PersistentStatChangeEffect);
	
	for(idx=0;idx<ConfigVars.abilities.Length;idx++)
	{
		AbilityTemplate.AdditionalAbilities.AddItem(ConfigVars.abilities[idx]);
	}
	
	
	AbilityTemplate.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return AbilityTemplate;
}

static function X2AbilityTemplate CreateArmorBonus(name AbilityName, name ItemName)
{
	local X2AbilityTemplate					AbilityTemplate;
	local X2Effect_PersistentStatChange		PersistentStatChangeEffect;
	local int								ShieldBonus, idx;
	local ArmorStats							ConfigVars;
	local aa_ChrmAA							Getter;
	
	Getter = new class'aa_ChrmAA';
	ConfigVars = Getter.GrabArmorConfigVars(ItemName);
	//AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	`CREATE_X2ABILITY_TEMPLATE(AbilityTemplate, AbilityName);
	
	AbilityTemplate.AbilitySourceName = 'eAbilitySource_Item';
	AbilityTemplate.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	AbilityTemplate.Hostility = eHostility_Neutral;
	AbilityTemplate.bDisplayInUITacticalText = false;
	
	AbilityTemplate.AbilityToHitCalc = default.DeadEye;
	AbilityTemplate.AbilityTargetStyle = default.SelfTarget;
	AbilityTemplate.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);

	PersistentStatChangeEffect = new class'X2Effect_PersistentStatChange';
	PersistentStatChangeEffect.BuildPersistentEffect(1, true, false, false);
	PersistentStatChangeEffect.SetDisplayInfo(ePerkBuff_Passive, AbilityTemplate.LocFriendlyName, AbilityTemplate.GetMyLongDescription(), AbilityTemplate.IconImage, false, , AbilityTemplate.AbilitySourceName);
	
	ShieldBonus = ConfigVars.shield;
	
	if(Getter.BetaStrikifyShields() != 1.0)
	{
		ShieldBonus *= Getter.BetaStrikifyShields();
	}

	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ShieldHP, ShieldBonus);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_HP, ConfigVars.hp);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Mobility, ConfigVars.mob);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorMitigation, ConfigVars.armor);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Dodge, ConfigVars.dodge);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Defense, ConfigVars.defense);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Hacking, ConfigVars.hack);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Will, ConfigVars.will);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_ArmorPiercing, ConfigVars.pierce);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_PsiOffense, ConfigVars.psi);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_DetectionModifier, ConfigVars.sneak);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_CritChance, ConfigVars.crit);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingCritChance, ConfigVars.flankcrit);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_FlankingAimBonus, ConfigVars.flankaim);
	PersistentStatChangeEffect.AddPersistentStatChange(eStat_Offense, ConfigVars.aim);
	AbilityTemplate.AddTargetEffect(PersistentStatChangeEffect);
	
	for(idx=0;idx<ConfigVars.abilities.Length;idx++)
	{
		AbilityTemplate.AdditionalAbilities.AddItem(ConfigVars.abilities[idx]);
	}
	
	
	AbilityTemplate.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	
	return AbilityTemplate;
}