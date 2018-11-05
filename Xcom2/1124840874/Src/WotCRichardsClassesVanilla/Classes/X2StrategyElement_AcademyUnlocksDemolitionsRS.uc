// This is an Unreal Script
class X2StrategyElement_AcademyUnlocksDemolitionsRS extends X2StrategyElement;   //Class Data

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(DemolitionsPerkGTS());   //Skill Data

	return Templates;
}

static function X2SoldierAbilityUnlockTemplate DemolitionsPerkGTS()   //Skill Data
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'DemolitionsPerkGTS');   //Skill Data

	Template.AllowedClasses.AddItem('DemolitionsRS');   //Class Data
	Template.AbilityName = 'DemolitionsPerkGTS';   //Skill Data
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1"; //Icon

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 5;
	Template.Requirements.RequiredSoldierClass = 'DemolitionsRS';   //Class Data
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 75;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}