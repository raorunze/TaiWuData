class X2StrategyElement_PGOWeaponUpgradesAddonTechs extends X2StrategyElement_DefaultTechs
	config(PGOWeaponUpgradesAddon);

var config int						BuildBasicWeaponUpgrades_PointsToComplete;
var config array<ArtifactCost>		BuildBasicWeaponUpgrades_ResourceCosts;
var config array<ArtifactCost>		BuildBasicWeaponUpgrades_ArtifactCosts;

var config int						BuildAdvancedWeaponUpgrades_PointsToComplete;
var config array<ArtifactCost>		BuildAdvancedWeaponUpgrades_ResourceCosts;
var config array<ArtifactCost>		BuildAdvancedWeaponUpgrades_ArtifactCosts;

var config int						BuildSuperiorWeaponUpgrades_PointsToComplete;
var config array<ArtifactCost>		BuildSuperiorWeaponUpgrades_ResourceCosts;
var config array<ArtifactCost>		BuildSuperiorWeaponUpgrades_ArtifactCosts;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Basic Weapon Upgrades
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicAutoLoader'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicExpandedMagazine'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicHairTrigger'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicLaserSight'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicRepeater'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicScope'));
	Techs.AddItem(CreateBuildBasicWeaponUpgradesTemplate('BasicStock'));

	// Advanced Weapon Upgrades
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedAutoLoader', 'BasicAutoLoader'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedExpandedMagazine', 'BasicExpandedMagazine'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedHairTrigger', 'BasicHairTrigger'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedLaserSight', 'BasicLaserSight'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedRepeater', 'BasicRepeater'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedScope', 'BasicScope'));
	Techs.AddItem(CreateBuildAdvancedWeaponUpgradesTemplate('AdvancedStock', 'BasicStock'));

	// Superior Weapon Upgrades
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorAutoLoader', 'AdvancedAutoLoader'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorExpandedMagazine', 'AdvancedExpandedMagazine'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorHairTrigger', 'AdvancedHairTrigger'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorLaserSight', 'AdvancedLaserSight'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorRepeater', 'AdvancedRepeater'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorScope', 'AdvancedScope'));
	Techs.AddItem(CreateBuildSuperiorWeaponUpgradesTemplate('SuperiorStock', 'AdvancedStock'));

	return Techs;
}

static function X2DataTemplate CreateBuildBasicWeaponUpgradesTemplate(name TemplateName)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Modular_Weapons";
	Template.PointsToComplete = StafferXDays(1, default.BuildBasicWeaponUpgrades_PointsToComplete);
	Template.SortingTier = 5;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('ModularWeapons');
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');

	// Cost
	foreach default.BuildBasicWeaponUpgrades_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildBasicWeaponUpgrades_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildAdvancedWeaponUpgradesTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Modular_Weapons";
	Template.PointsToComplete = StafferXDays(1, default.BuildAdvancedWeaponUpgrades_PointsToComplete);
	Template.SortingTier = 5;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildAdvancedWeaponUpgrades_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildAdvancedWeaponUpgrades_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildSuperiorWeaponUpgradesTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Modular_Weapons";
	Template.PointsToComplete = StafferXDays(1, default.BuildSuperiorWeaponUpgrades_PointsToComplete);
	Template.SortingTier = 5;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildSuperiorWeaponUpgrades_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildSuperiorWeaponUpgrades_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}