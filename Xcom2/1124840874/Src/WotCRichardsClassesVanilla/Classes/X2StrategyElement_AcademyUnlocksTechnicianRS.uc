// This is an Unreal Script
class X2StrategyElement_AcademyUnlocksTechnicianRS extends X2StrategyElement;   //Class Data

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(TechnicianPerkGTS());   //Skill Data

	return Templates;
}

static function X2SoldierAbilityUnlockTemplate TechnicianPerkGTS()   //Skill Data
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'TechnicianPerkGTS');   //Skill Data

	Template.AllowedClasses.AddItem('TechnicianRS');   //Class Data
	Template.AbilityName = 'TechnicianPerkGTS';   //Skill Data
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1"; //Icon

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 5;
	Template.Requirements.RequiredSoldierClass = 'TechnicianRS';   //Class Data
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 75;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}