// This is an Unreal Script
class X2StrategyElement_AcademyUnlocksMarksmanRS extends X2StrategyElement;   //Class Data

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(MarksmanPerkGTS());   //Skill Data

	return Templates;
}

static function X2SoldierAbilityUnlockTemplate MarksmanPerkGTS()   //Skill Data
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'MarksmanPerkGTS');   //Skill Data

	Template.AllowedClasses.AddItem('MarksmanRS');   //Class Data
	Template.AbilityName = 'MarksmanPerkGTS';   //Skill Data
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1"; //Icon

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 5;
	Template.Requirements.RequiredSoldierClass = 'MarksmanRS';   //Class Data
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = 75;
	Template.Cost.ResourceCosts.AddItem(Resources);

	return Template;
}