class X2StrategyElement_PGOPCSAddonTechs extends X2StrategyElement_DefaultTechs
	config(PGOPCSAddon);

var config int						BuildBasicPCS_PointsToComplete;
var config array<ArtifactCost>		BuildBasicPCS_ResourceCosts;
var config array<ArtifactCost>		BuildBasicPCS_ArtifactCosts;

var config int						BuildAdvancedPCS_PointsToComplete;
var config array<ArtifactCost>		BuildAdvancedPCS_ResourceCosts;
var config array<ArtifactCost>		BuildAdvancedPCS_ArtifactCosts;

var config int						BuildSuperiorPCS_PointsToComplete;
var config array<ArtifactCost>		BuildSuperiorPCS_ResourceCosts;
var config array<ArtifactCost>		BuildSuperiorPCS_ArtifactCosts;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Basic PCS
	Techs.AddItem(CreateBuildBasicPCSTemplate('BasicPCSAgility', 'AutopsyViper'));
	Techs.AddItem(CreateBuildBasicPCSTemplate('BasicPCSConditioning', 'AutopsyBerserker'));
	Techs.AddItem(CreateBuildBasicPCSTemplate('BasicPCSFocus', 'AutopsyArchon'));
	Techs.AddItem(CreateBuildBasicPCSTemplate('BasicPCSPerception', 'AutopsyMuton'));
	Techs.AddItem(CreateBuildBasicPCSTemplate('BasicPCSSpeed', 'AutopsyChryssalid'));

	// Advanced PCS
	Techs.AddItem(CreateBuildAdvancedPCSTemplate('AdvancedPCSAgility', 'BasicPCSAgility'));
	Techs.AddItem(CreateBuildAdvancedPCSTemplate('AdvancedPCSConditioning', 'BasicPCSConditioning'));
	Techs.AddItem(CreateBuildAdvancedPCSTemplate('AdvancedPCSFocus', 'BasicPCSFocus'));
	Techs.AddItem(CreateBuildAdvancedPCSTemplate('AdvancedPCSPerception', 'BasicPCSPerception'));
	Techs.AddItem(CreateBuildAdvancedPCSTemplate('AdvancedPCSSpeed', 'BasicPCSSpeed'));

	// Superior PCS
	Techs.AddItem(CreateBuildSuperiorPCSTemplate('SuperiorPCSAgility', 'AdvancedPCSAgility'));
	Techs.AddItem(CreateBuildSuperiorPCSTemplate('SuperiorPCSConditioning', 'AdvancedPCSConditioning'));
	Techs.AddItem(CreateBuildSuperiorPCSTemplate('SuperiorPCSFocus', 'AdvancedPCSFocus'));
	Techs.AddItem(CreateBuildSuperiorPCSTemplate('SuperiorPCSPerception', 'AdvancedPCSPerception'));
	Techs.AddItem(CreateBuildSuperiorPCSTemplate('SuperiorPCSSpeed', 'AdvancedPCSSpeed'));

	return Techs;
}

static function X2DataTemplate CreateBuildBasicPCSTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.GOLDTECH_Alien_Biotech";
	Template.PointsToComplete = StafferXDays(1, default.BuildBasicPCS_PointsToComplete);
	Template.SortingTier = 6;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildBasicPCS_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildBasicPCS_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildAdvancedPCSTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.GOLDTECH_Alien_Biotech";
	Template.PointsToComplete = StafferXDays(1, default.BuildAdvancedPCS_PointsToComplete);
	Template.SortingTier = 6;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildAdvancedPCS_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildAdvancedPCS_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildSuperiorPCSTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.GOLDTECH_Alien_Biotech";
	Template.PointsToComplete = StafferXDays(1, default.BuildSuperiorPCS_PointsToComplete);
	Template.SortingTier = 6;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildSuperiorPCS_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildSuperiorPCS_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}