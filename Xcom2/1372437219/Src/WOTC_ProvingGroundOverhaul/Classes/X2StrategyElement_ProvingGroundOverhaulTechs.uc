class X2StrategyElement_ProvingGroundOverhaulTechs extends X2StrategyElement_DefaultTechs
	config(ProvingGroundOverhaul);

// Skulljack Tech
var config int						BuildSkulljack_PointsToComplete;
var config array<ArtifactCost>		BuildSkulljack_ResourceCosts;
var config array<ArtifactCost>		BuildSkulljack_ArtifactCosts;

// Armor Techs
var config int						BuildEXOSuit_PointsToComplete;
var config array<ArtifactCost>		BuildEXOSuit_ResourceCosts;
var config array<ArtifactCost>		BuildEXOSuit_ArtifactCosts;

var config int						BuildSpiderSuit_PointsToComplete;
var config array<ArtifactCost>		BuildSpiderSuit_ResourceCosts;
var config array<ArtifactCost>		BuildSpiderSuit_ArtifactCosts;

var config int						BuildWARSuit_PointsToComplete;
var config array<ArtifactCost>		BuildWARSuit_ResourceCosts;
var config array<ArtifactCost>		BuildWARSuit_ArtifactCosts;

var config int						BuildWraithSuit_PointsToComplete;
var config array<ArtifactCost>		BuildWraithSuit_ResourceCosts;
var config array<ArtifactCost>		BuildWraithSuit_ArtifactCosts;

// Grenades and Rounds Techs
var config int						BuildGrenadesAndRounds_PointsToComplete;
var config array<ArtifactCost>		BuildGrenadesAndRounds_ResourceCosts;
var config array<ArtifactCost>		BuildGrenadesAndRounds_ArtifactCosts;

// Rounds Techs
var config int						BuildRounds_PointsToComplete;
var config array<ArtifactCost>		BuildRounds_ResourceCosts;
var config array<ArtifactCost>		BuildRounds_ArtifactCosts;

// Heavy Weapons Techs
var config int						BuildHeavyWeapons_PointsToComplete;
var config array<ArtifactCost>		BuildHeavyWeapons_ResourceCosts;
var config array<ArtifactCost>		BuildHeavyWeapons_ArtifactCosts;

// Powered Weapons Techs
var config int						BuildPoweredWeapons_PointsToComplete;
var config array<ArtifactCost>		BuildPoweredWeapons_ResourceCosts;
var config array<ArtifactCost>		BuildPoweredWeapons_ArtifactCosts;

// Vests Techs
var config int						BuildVests_PointsToComplete;
var config array<ArtifactCost>		BuildVests_ResourceCosts;
var config array<ArtifactCost>		BuildVests_ArtifactCosts;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Techs;

	// Grenades and Rounds Techs
	Techs.AddItem(CreateBuildGrenadesAndRoundsTemplate('IncendiaryBlast', 'AutopsyAdventPurifier'));
	Techs.AddItem(CreateBuildGrenadesAndRoundsTemplate('ToxicDelivery', 'AutopsyViper'));
	Techs.AddItem(CreateBuildGrenadesAndRoundsTemplate('CorrosiveTouch', 'AutopsyAndromedon'));

	// Rounds Techs
	Techs.AddItem(CreateBuildRoundsTemplate('APRounds'));
	Techs.AddItem(CreateBuildRoundsTemplate('TalonRounds'));
	Techs.AddItem(CreateBuildRoundsTemplate('TracerRounds'));

	// Heavy Weapons Techs
	Techs.AddItem(CreateBuildHeavyWeaponsTemplate('Flamethrower'));
	Techs.AddItem(CreateBuildHeavyWeaponsTemplate('ShredderGun'));
	
	// Powered Weapons Techs
	Techs.AddItem(CreateBuildPoweredWeaponsTemplate('BlasterLauncher'));
	Techs.AddItem(CreateBuildPoweredWeaponsTemplate('HellfireProjector'));
	Techs.AddItem(CreateBuildPoweredWeaponsTemplate('PlasmaBlaster'));
	Techs.AddItem(CreateBuildPoweredWeaponsTemplate('ShredstormCannon'));

	// Vests Techs
	Techs.AddItem(CreateBuildVestsTemplate('HazmatVest', 'AutopsyAdventShieldbearer'));
	Techs.AddItem(CreateBuildVestsTemplate('Hellweave', 'AutopsyChryssalid'));
	Techs.AddItem(CreateBuildVestsTemplate('PlatedVest', 'AutopsyAdventShieldbearer'));
	Techs.AddItem(CreateBuildVestsTemplate('StasisVest', 'AutopsyAdventPriest'));

	return Techs;
}

// #######################################################################################
// -------------------- TECH TEMPLATES ---------------------------------------------------
// #######################################################################################

static function X2DataTemplate CreateBuildGrenadesAndRoundsTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Bluescreen_Project";
	Template.PointsToComplete = StafferXDays(1, default.BuildGrenadesAndRounds_PointsToComplete);
	Template.SortingTier = 1;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildGrenadesAndRounds_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildGrenadesAndRounds_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildRoundsTemplate(name TemplateName)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Experimental_Ammo";
	Template.PointsToComplete = StafferXDays(1, default.BuildRounds_PointsToComplete);
	Template.SortingTier = 3;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');

	// Cost
	foreach default.BuildRounds_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildRounds_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildHeavyWeaponsTemplate(name TemplateName)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_Heavy_Weapons_Project";
	Template.PointsToComplete = StafferXDays(1, default.BuildHeavyWeapons_PointsToComplete);
	Template.SortingTier = 3;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.SpecialRequirementsFn = HeavyWeaponsTechRequirements;

	// Cost
	foreach default.BuildHeavyWeapons_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildHeavyWeapons_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildPoweredWeaponsTemplate(name TemplateName)
{
	local X2TechTemplate		Template;
	local StrategyRequirement	AltItemReq;
	local ArtifactCost			Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_AdvHeavy_Weapons_Project";
	Template.PointsToComplete = StafferXDays(1, default.BuildPoweredWeapons_PointsToComplete);
	Template.SortingTier = 3;

	Template.bProvingGround = true;

	// Requirements
	AltItemReq.RequiredItems.AddItem('HeavyAlienArmorMk2_Schematic');
	
	Template.Requirements.RequiredTechs.AddItem('WARSuit');
	Template.AlternateRequirements.AddItem(AltItemReq);

	// Cost
	foreach default.BuildPoweredWeapons_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildPoweredWeapons_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

static function X2DataTemplate CreateBuildVestsTemplate(name TemplateName, name TechRequirement)
{
	local X2TechTemplate	Template;
	local ArtifactCost		Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2TechTemplate', Template, TemplateName);
	Template.strImage = "img:///UILibrary_StrategyImages.ResearchTech.TECH_ExperimentalArmor";
	Template.PointsToComplete = StafferXDays(1, default.BuildVests_PointsToComplete);
	Template.SortingTier = 3;

	Template.bProvingGround = true;

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(TechRequirement);

	// Cost
	foreach default.BuildVests_ResourceCosts(Resources)
	{
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	foreach default.BuildVests_ArtifactCosts(Artifacts)
	{
		Template.Cost.ArtifactCosts.AddItem(Artifacts);
	}

	return Template;
}

// #######################################################################################
// -------------------- DELEGATE FUNCTIONS -----------------------------------------------
// #######################################################################################

static function bool HeavyWeaponsTechRequirements()
{
	local XComGameState_HeadquartersXCom	XComHQ;
	local XComGameState_Item				ItemState;
	local XComGameState_Tech				TechState;
	local int								i;

	// Get necessary references
	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	// Hide heavy weapons projects if R.A.G.E. armor is unlocked
	for (i = 0; i < XComHQ.Inventory.Length; i++)
	{
		ItemState = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(XComHQ.Inventory[i].ObjectID));

		if (ItemState.GetMyTemplate().DataName == 'HeavyAlienArmorMk2_Schematic')
			return false;
	}

	// Hide heavy weapons projects if W.A.R. suit project is completed
	for (i = 0; i < XComHQ.TechsResearched.Length; i++)
	{
		TechState = XComGameState_Tech(`XCOMHISTORY.GetGameStateForObjectID(XComHQ.TechsResearched[i].ObjectID));

		if (TechState.GetMyTemplate().DataName == 'WARSuit')
			return false;
	}

	// Show heavy weapons projects if E.X.O. suit or R.A.G.E. suit projects are completed
	for (i = 0; i < XComHQ.TechsResearched.Length; i++)
	{
		TechState = XComGameState_Tech(`XCOMHISTORY.GetGameStateForObjectID(XComHQ.TechsResearched[i].ObjectID));

		if (TechState.GetMyTemplate().DataName == 'EXOSuit' || TechState.GetMyTemplate().DataName == 'RAGESuit')
			return true;
	}
	
	return false;
}