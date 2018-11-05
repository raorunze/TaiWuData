class X2StrategyElement_DefaultTechs_AmmoAndVestsSlots extends X2StrategyElement
	config(AmmoAndVestSlotsV2) dependsOn (X2StrategyElement_DefaultTechs);
	
var config bool bExperimentalVestReq; // If Nanofiber vest should be required to build Experimental Armor

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	`Log("AVS : Creating Vest Template");
	// super.CreateTemplates();
	if(default.bExperimentalVestReq)
	{
		`Log("AVS : Should create the template");
		Techs.AddItem(CreateExperimentalArmorTemplate_AVS());
	}
	else
		 `Log("AVS : Template ini disabled, ExperimentalVestReq is " @ default.bExperimentalVestReq);

	return Techs;
}

static function X2DataTemplate CreateExperimentalArmorTemplate_AVS()
{
	local X2TechTemplate Template;
	local ArtifactCost Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, 'ExperimentalArmor');
	Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, 12);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_ExperimentalArmor";
	Template.bProvingGround = true;
	Template.bArmor = true;
	Template.bRepeatable = true;
	Template.SortingTier = 3;
	Template.ResearchCompletedFn = class'X2StrategyElement_DefaultTechs'.static.GiveDeckedItemReward;
	
	Template.RewardDeck = 'ExperimentalArmorRewards';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventShieldbearer');

	Artifacts.ItemTemplateName = 'EleriumCore';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'NanofiberVest';
	Artifacts.Quantity = 1;
	Template.Cost.ArtifactCosts.AddItem(Artifacts);

	`Log("AVS : Vest Should Be Created");
	return Template;
}
