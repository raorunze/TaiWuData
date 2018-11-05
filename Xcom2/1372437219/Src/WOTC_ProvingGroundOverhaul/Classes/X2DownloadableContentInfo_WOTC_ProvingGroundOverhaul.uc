class X2DownloadableContentInfo_WOTC_ProvingGroundOverhaul extends X2DownloadableContentInfo
	config(ProvingGroundOverhaul);

// Skulljack
var config array<ArtifactCost>		Skulljack_ResourceCosts;
var config array<ArtifactCost>		Skulljack_ArtifactCosts;
var config int						Skulljack_TradingPostValue;

// Armors
var config array<ArtifactCost>		EXOSuit_ResourceCosts;
var config array<ArtifactCost>		EXOSuit_ArtifactCosts;
var config int						EXOSuit_TradingPostValue;

var config array<ArtifactCost>		SpiderSuit_ResourceCosts;
var config array<ArtifactCost>		SpiderSuit_ArtifactCosts;
var config int						SpiderSuit_TradingPostValue;

var config array<ArtifactCost>		WARSuit_ResourceCosts;
var config array<ArtifactCost>		WARSuit_ArtifactCosts;
var config int						WARSuit_TradingPostValue;

var config array<ArtifactCost>		WraithSuit_ResourceCosts;
var config array<ArtifactCost>		WraithSuit_ArtifactCosts;
var config int						WraithSuit_TradingPostValue;

// Grenades
var config array<ArtifactCost>		AcidGrenade_ResourceCosts;
var config array<ArtifactCost>		AcidGrenade_ArtifactCosts;
var config int						AcidGrenade_TradingPostValue;

var config array<ArtifactCost>		AcidBomb_ResourceCosts;
var config array<ArtifactCost>		AcidBomb_ArtifactCosts;
var config int						AcidBomb_TradingPostValue;

var config array<ArtifactCost>		GasGrenade_ResourceCosts;
var config array<ArtifactCost>		GasGrenade_ArtifactCosts;
var config int						GasGrenade_TradingPostValue;

var config array<ArtifactCost>		GasBomb_ResourceCosts;
var config array<ArtifactCost>		GasBomb_ArtifactCosts;
var config int						GasBomb_TradingPostValue;

var config array<ArtifactCost>		IncendiaryGrenade_ResourceCosts;
var config array<ArtifactCost>		IncendiaryGrenade_ArtifactCosts;
var config int						IncendiaryGrenade_TradingPostValue;

var config array<ArtifactCost>		IncendiaryBomb_ResourceCosts;
var config array<ArtifactCost>		IncendiaryBomb_ArtifactCosts;
var config int						IncendiaryBomb_TradingPostValue;

// Rounds
var config array<ArtifactCost>		APRounds_ResourceCosts;
var config array<ArtifactCost>		APRounds_ArtifactCosts;
var config int						APRounds_TradingPostValue;

var config array<ArtifactCost>		CorrosiveRounds_ResourceCosts;
var config array<ArtifactCost>		CorrosiveRounds_ArtifactCosts;
var config int						CorrosiveRounds_TradingPostValue;

var config array<ArtifactCost>		IncendiaryRounds_ResourceCosts;
var config array<ArtifactCost>		IncendiaryRounds_ArtifactCosts;
var config int						IncendiaryRounds_TradingPostValue;

var config array<ArtifactCost>		TalonRounds_ResourceCosts;
var config array<ArtifactCost>		TalonRounds_ArtifactCosts;
var config int						TalonRounds_TradingPostValue;

var config array<ArtifactCost>		TracerRounds_ResourceCosts;
var config array<ArtifactCost>		TracerRounds_ArtifactCosts;
var config int						TracerRounds_TradingPostValue;

var config array<ArtifactCost>		VenomRounds_ResourceCosts;
var config array<ArtifactCost>		VenomRounds_ArtifactCosts;
var config int						VenomRounds_TradingPostValue;

// Heavy Weapons
var config array<ArtifactCost>		Flamethrower_ResourceCosts;
var config array<ArtifactCost>		Flamethrower_ArtifactCosts;
var config int						Flamethrower_TradingPostValue;

var config array<ArtifactCost>		ShredderGun_ResourceCosts;
var config array<ArtifactCost>		ShredderGun_ArtifactCosts;
var config int						ShredderGun_TradingPostValue;

// Powered Weapons
var config array<ArtifactCost>		BlasterLauncher_ResourceCosts;
var config array<ArtifactCost>		BlasterLauncher_ArtifactCosts;
var config int						BlasterLauncher_TradingPostValue;

var config array<ArtifactCost>		HellfireProjector_ResourceCosts;
var config array<ArtifactCost>		HellfireProjector_ArtifactCosts;
var config int						HellfireProjector_TradingPostValue;

var config array<ArtifactCost>		PlasmaBlaster_ResourceCosts;
var config array<ArtifactCost>		PlasmaBlaster_ArtifactCosts;
var config int						PlasmaBlaster_TradingPostValue;

var config array<ArtifactCost>		ShredstormCannon_ResourceCosts;
var config array<ArtifactCost>		ShredstormCannon_ArtifactCosts;
var config int						ShredstormCannon_TradingPostValue;

// Vests
var config array<ArtifactCost>		HazmatVest_ResourceCosts;
var config array<ArtifactCost>		HazmatVest_ArtifactCosts;
var config int						HazmatVest_TradingPostValue;

var config array<ArtifactCost>		Hellweave_ResourceCosts;
var config array<ArtifactCost>		Hellweave_ArtifactCosts;
var config int						Hellweave_TradingPostValue;

var config array<ArtifactCost>		PlatedVest_ResourceCosts;
var config array<ArtifactCost>		PlatedVest_ArtifactCosts;
var config int						PlatedVest_TradingPostValue;

var config array<ArtifactCost>		StasisVest_ResourceCosts;
var config array<ArtifactCost>		StasisVest_ArtifactCosts;
var config int						StasisVest_TradingPostValue;

static event InstallNewCampaign(XComGameState StartState)
{
	RemoveResistanceOrders(StartState);
}

static event OnLoadedSavedGame()
{
	AddNewTechs();
}

static event OnLoadedSavedGameToStrategy()
{
	AddNewTechs();
}

static event OnPostTemplatesCreated()
{
	// Techs
	UpdateExistingTechTemplates();
	
	// Items
	UpdateSkulljackTemplates();
	UpdateArmorTemplates();
	UpdateGrenadeTemplates();
	UpdateRoundsTemplates();
	UpdateHeavyWeaponTemplates();
	UpdateVestTemplates();

	// Hide Techs
	HideExperimentalTechTemplates();
}

// #######################################################################################
// -------------------- REMOVE RESISTANCE ORDERS FUNCTIONS -------------------------------
// #######################################################################################

static function RemoveResistanceOrders(XComGameState StartState)
{
	local X2StrategyElementTemplateManager		StratMgr;
	local array<name>							BlacklistCardNames;
	local array<X2StrategyElementTemplate>		CardTemplates;
	local array<XComGameState_StrategyCard>		CardStates, BlacklistCardStates;
	local XComGameState_StrategyCard			CardState;
	local XComGameState_Continent				ContinentState;
	local int									i, RandRoll;

	// Get necessary references
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Blacklist of resistance cards
	BlacklistCardNames.AddItem('ResCard_SuitUp');
	BlacklistCardNames.AddItem('ResCard_BombSquad');
	BlacklistCardNames.AddItem('ResCard_MunitionsExperts');

	// Get all strategy card templates
	CardTemplates = StratMgr.GetAllTemplatesOfClass(class'X2StrategyCardTemplate');

	for (i = 0; i < CardTemplates.Length; i++)
	{
		// Ignore strategy card templates that aren't resistance cards/continent bonuses
		if (X2StrategyCardTemplate(CardTemplates[i]).Category != "ResistanceCard" || !X2StrategyCardTemplate(CardTemplates[i]).bContinentBonus)
		{
			CardTemplates.Remove(i, 1);
			i--;
		}
	}

	foreach StartState.IterateByClassType(class'XComGameState_StrategyCard', CardState)
	{
		// Get all eligible card state objects
		if (CardTemplates.Find(CardState.GetMyTemplate()) != INDEX_NONE)
		{
			CardStates.AddItem(CardState);
			CardTemplates.RemoveItem(CardState.GetMyTemplate());
		}
	}

	for (i = 0; i < CardStates.Length; i++)
	{		
		// Remove blacklisted card state objects from play and store them in another array for later
		if (BlacklistCardNames.Find(CardStates[i].GetMyTemplate().DataName) != INDEX_NONE)
		{
			CardStates[i].bDrawn = true;
			BlacklistCardStates.AddItem(CardStates[i]);
			CardStates.RemoveItem(CardStates[i]);
		}
		// Remove card state objects that are already in play
		else if (CardStates[i].bDrawn)
		{
			CardStates.RemoveItem(CardStates[i]);
		}
	}

	for (i = 0; i < BlacklistCardStates.Length; i++)
	{
		foreach StartState.IterateByClassType(class'XComGameState_Continent', ContinentState)
		{
			// Assign new continent bonus if the current bonus is blacklisted
			if (ContinentState.ContinentBonusCard == BlacklistCardStates[i].GetReference())
			{		
				RandRoll = `SYNC_RAND_STATIC(CardStates.Length);

				CardState = CardStates[RandRoll];
				ContinentState.ContinentBonusCard = CardState.GetReference();
				CardState.bDrawn = true;

				CardStates.RemoveItem(CardState);
			}
		}
	}
}

// #######################################################################################
// -------------------- TECHS FUNCTIONS --------------------------------------------------
// #######################################################################################

static function AddNewTechs()
{
	local X2StrategyElementTemplateManager		StratMgr;
	local XComGameState							NewGameState;
	local array<name>							TechNames;
	local name									TechName;
	local bool									bTechExists;
	local XComGameState_Tech					TechState;
	local X2TechTemplate						TechTemplate;

	// Get necessary references
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	
	// Set up new gamestate
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Add Build Grenades and Rounds Techs");

	// Iterate through new tech templates
	TechNames.AddItem('IncendiaryBlast');
	TechNames.AddItem('ToxicDelivery');
	TechNames.AddItem('CorrosiveTouch');

	TechNames.AddItem('APRounds');
	TechNames.AddItem('TalonRounds');
	TechNames.AddItem('TracerRounds');

	TechNames.AddItem('Flamethrower');
	TechNames.AddItem('ShredderGun');

	TechNames.AddItem('BlasterLauncher');
	TechNames.AddItem('HellfireProjector');
	TechNames.AddItem('ShredstormCannon');
	TechNames.AddItem('PlasmaBlaster');

	TechNames.AddItem('HazmatVest');
	TechNames.AddItem('Hellweave');
	TechNames.AddItem('PlatedVest');
	TechNames.AddItem('StasisVest');

	foreach TechNames(TechName)
	{		
		// Check if tech state object exists
		bTechExists = false;

		foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Tech', TechState)
		{
			if (TechState.GetMyTemplateName() == TechName)
			{
				bTechExists = true;
				break;
			}
		}

		// Build tech state object if it didn't exist before
		if (!bTechExists)
		{
			TechTemplate = X2TechTemplate(StratMgr.FindStrategyElementTemplate(TechName));
			
			if (TechTemplate != none)
			{
				TechState = XComGameState_Tech(NewGameState.CreateNewStateObject(class'XComGameState_Tech', TechTemplate));
				NewGameState.AddStateObject(TechState);
			}
		}
	}

	// Submit new gamestate
	if (NewGameState.GetNumGameStateObjects() > 0)
	{
		`GAMERULES.SubmitGameState(NewGameState);
	}
	else
	{
		`XCOMHISTORY.CleanupPendingGameState(NewGameState);
	}
}

static function UpdateExistingTechTemplates()
{
	local X2StrategyElementTemplateManager		StratMgr;
	local array<name>							TechNames;
	local X2TechTemplate						Template;
	local array<X2DataTemplate>					AllDifficultiesTemplates;
	local ArtifactCost							Resources, Artifacts;
	local int									i, j;

	// Get necessary references
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Iterate through existing tech templates
	TechNames.AddItem('Skulljack');
	TechNames.AddItem('EXOSuit');
	TechNames.AddItem('SpiderSuit');
	TechNames.AddItem('WARSuit');
	TechNames.AddItem('WraithSuit');

	for (i = 0; i < TechNames.Length; i++)
	{		
		// Reset tech templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get existing tech templates for all difficulties
		StratMgr.FindDataTemplateAllDifficulties(TechNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get existing tech template
			Template = X2TechTemplate(AllDifficultiesTemplates[j]);
		
			// Make existing tech template non-repeatable
			Template.bRepeatable = false;

			// Reset reward
			Template.ResearchCompletedFn = none;

			// Reset cost
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'Skulljack')
			{
				Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSkulljack_PointsToComplete);
				
				// Remove reward
				Template.ItemRewards.RemoveItem('SKULLJACK');

				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AutopsyAdventOfficer');

				// Cost
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSkulljack_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSkulljack_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}
			}
			else if (Template.DataName == 'EXOSuit')
			{
				Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildEXOSuit_PointsToComplete);
				
				// Remove reward
				Template.ItemRewards.RemoveItem('HeavyPlatedArmor');

				// Requirements
				Template.UnavailableIfResearched = 'WARSuit';

				// Cost
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildEXOSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildEXOSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}
			}
			else if (Template.DataName == 'SpiderSuit')
			{
				Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSpiderSuit_PointsToComplete);
				
				// Remove reward
				Template.ItemRewards.RemoveItem('LightPlatedArmor');

				// Requirements
				Template.UnavailableIfResearched = 'WraithSuit';

				// Cost
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSpiderSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildSpiderSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}
			}
			else if (Template.DataName == 'WARSuit')
			{
				Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWARSuit_PointsToComplete);
				
				// Remove reward
				Template.ItemRewards.RemoveItem('HeavyPoweredArmor');

				// Cost
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWARSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWARSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}
			}
			else if (Template.DataName == 'WraithSuit')
			{
				Template.PointsToComplete = class'X2StrategyElement_DefaultTechs'.static.StafferXDays(1, class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWraithSuit_PointsToComplete);
				
				// Remove reward
				Template.ItemRewards.RemoveItem('LightPoweredArmor');

				// Cost
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWraithSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach class'X2StrategyElement_ProvingGroundOverhaulTechs'.default.BuildWraithSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}
			}
		}
	}
}

// #######################################################################################
// -------------------- ITEM FUNCTIONS --------------------------------------------------
// #######################################################################################

static function UpdateSkulljackTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local X2WeaponTemplate					Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Get skulljack templates for all difficulties
	ItemMgr.FindDataTemplateAllDifficulties('SKULLJACK', AllDifficultiesTemplates);

	for (i = 0; i < AllDifficultiesTemplates.Length; i++)
	{
		// Get skulljack template
		Template = X2WeaponTemplate(AllDifficultiesTemplates[i]);

		// Make skulljack buildable
		Template.CanBeBuilt = true;

		// Reset requirements and cost
		Template.AlternateRequirements.Length = 0;
		Template.Requirements.RequiredTechs.Length = 0;
		Template.Cost.ResourceCosts.Length = 0;
		Template.Cost.ArtifactCosts.Length = 0;

		// Requirements
		Template.Requirements.RequiredTechs.AddItem('Skulljack');

		// Cost
		foreach default.Skulljack_ResourceCosts(Resources)
		{
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
		foreach default.Skulljack_ArtifactCosts(Artifacts)
		{
			Template.Cost.ArtifactCosts.AddItem(Artifacts);
		}

		// Black Market Value
		Template.TradingPostValue = default.Skulljack_TradingPostValue;
	}
}

static function UpdateArmorTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						ArmorNames;
	local X2ArmorTemplate					Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through armor templates
	ArmorNames.AddItem('HeavyPlatedArmor');
	ArmorNames.AddItem('LightPlatedArmor');
	ArmorNames.AddItem('HeavyPoweredArmor');
	ArmorNames.AddItem('LightPoweredArmor');

	for (i = 0; i < ArmorNames.Length; i++)
	{
		// Reset armor templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get armor templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(ArmorNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get armor template
			Template = X2ArmorTemplate(AllDifficultiesTemplates[j]);
			
			// Make armor buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'HeavyPlatedArmor')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('EXOSuit');
				Template.HideIfResearched = 'WARSuit';
				
				// Cost
				foreach default.EXOSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.EXOSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.EXOSuit_TradingPostValue;
			}
			else if (Template.DataName == 'LightPlatedArmor')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SpiderSuit');
				Template.HideIfResearched = 'WraithSuit';

				// Cost
				foreach default.SpiderSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SpiderSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SpiderSuit_TradingPostValue;
			}
			else if (Template.DataName == 'HeavyPoweredArmor')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('WARSuit');

				// Cost
				foreach default.WARSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.WARSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.WARSuit_TradingPostValue;
			}
			else if (Template.DataName == 'LightPoweredArmor')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('WraithSuit');

				// Cost
				foreach default.WraithSuit_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.WraithSuit_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.WraithSuit_TradingPostValue;
			}
		}
	}
}

static function UpdateGrenadeTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						GrenadeNames;
	local X2GrenadeTemplate					Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through grenades templates
	GrenadeNames.AddItem('AcidGrenade');
	GrenadeNames.AddItem('AcidGrenadeMk2');
	GrenadeNames.AddItem('GasGrenade');
	GrenadeNames.AddItem('GasGrenadeMk2');
	GrenadeNames.AddItem('Firebomb');
	GrenadeNames.AddItem('FirebombMK2');

	for (i = 0; i < GrenadeNames.Length; i++)
	{
		// Reset grenade templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get grenade templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(GrenadeNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get grenade template
			Template = X2GrenadeTemplate(AllDifficultiesTemplates[j]);
			
			// Make grenade buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'AcidGrenade')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('CorrosiveTouch');
				Template.HideIfResearched = 'AdvancedGrenades';

				// Cost
				foreach default.AcidGrenade_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AcidGrenade_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AcidGrenade_TradingPostValue;
			}
			else if (Template.DataName == 'AcidGrenadeMk2')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('CorrosiveTouch');
				Template.Requirements.RequiredTechs.AddItem('AdvancedGrenades');

				// Cost
				foreach default.AcidBomb_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AcidBomb_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AcidBomb_TradingPostValue;
			}
			else if (Template.DataName == 'GasGrenade')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('ToxicDelivery');
				Template.HideIfResearched = 'AdvancedGrenades';

				// Cost
				foreach default.GasGrenade_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.GasGrenade_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.GasGrenade_TradingPostValue;
			}
			else if (Template.DataName == 'GasGrenadeMk2')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('ToxicDelivery');
				Template.Requirements.RequiredTechs.AddItem('AdvancedGrenades');

				// Cost
				foreach default.GasBomb_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.GasBomb_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.GasBomb_TradingPostValue;
			}
			else if (Template.DataName == 'FireBomb')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('IncendiaryBlast');
				Template.HideIfResearched = 'AdvancedGrenades';

				// Cost
				foreach default.IncendiaryGrenade_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.IncendiaryGrenade_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.IncendiaryGrenade_TradingPostValue;
			}
			else if (Template.DataName == 'FirebombMK2')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('IncendiaryBlast');
				Template.Requirements.RequiredTechs.AddItem('AdvancedGrenades');

				// Cost
				foreach default.IncendiaryBomb_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.IncendiaryBomb_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.IncendiaryBomb_TradingPostValue;
			}
		}
	}
}

static function UpdateRoundsTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						RoundsNames;
	local X2AmmoTemplate					Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through rounds templates
	RoundsNames.AddItem('APRounds');
	RoundsNames.AddItem('CorrosiveRounds');
	RoundsNames.AddItem('IncendiaryRounds');
	RoundsNames.AddItem('TalonRounds');
	RoundsNames.AddItem('TracerRounds');
	RoundsNames.AddItem('VenomRounds');

	for (i = 0; i < RoundsNames.Length; i++)
	{
		// Reset rounds templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get rounds templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(RoundsNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get rounds template
			Template = X2AmmoTemplate(AllDifficultiesTemplates[j]);
			
			// Make rounds buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'APRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('APRounds');
				
				// Cost
				foreach default.APRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.APRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.APRounds_TradingPostValue;
			}
			else if (Template.DataName == 'CorrosiveRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('CorrosiveTouch');

				// Cost
				foreach default.CorrosiveRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.CorrosiveRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.CorrosiveRounds_TradingPostValue;
			}
			else if (Template.DataName == 'IncendiaryRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('IncendiaryBlast');

				// Cost
				foreach default.IncendiaryRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.IncendiaryRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.IncendiaryRounds_TradingPostValue;
			}
			else if (Template.DataName == 'TalonRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('TalonRounds');

				// Cost
				foreach default.TalonRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.TalonRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.TalonRounds_TradingPostValue;
			}
			else if (Template.DataName == 'TracerRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('TracerRounds');

				// Cost
				foreach default.TracerRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.TracerRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.TracerRounds_TradingPostValue;
			}
			else if (Template.DataName == 'VenomRounds')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('ToxicDelivery');

				// Cost
				foreach default.VenomRounds_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.VenomRounds_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.VenomRounds_TradingPostValue;
			}
		}
	}
}

static function UpdateHeavyWeaponTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						HeavyWeaponNames;
	local X2WeaponTemplate					Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through heavy weapon templates
	HeavyWeaponNames.AddItem('Flamethrower');
	HeavyWeaponNames.AddItem('ShredderGun');
	HeavyWeaponNames.AddItem('BlasterLauncher');
	HeavyWeaponNames.AddItem('FlamethrowerMk2');
	HeavyWeaponNames.AddItem('PlasmaBlaster');
	HeavyWeaponNames.AddItem('ShredstormCannon');

	for (i = 0; i < HeavyWeaponNames.Length; i++)
	{
		// Reset heavy weapon templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get heavy weapon templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(HeavyWeaponNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{			
			// Get heavy weapon template
			Template = X2WeaponTemplate(AllDifficultiesTemplates[j]);
			
			// Make heavy weapon buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'Flamethrower')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('Flamethrower');
				Template.HideIfResearched = 'HellfireProjector';
				
				// Cost
				foreach default.Flamethrower_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.Flamethrower_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.Flamethrower_TradingPostValue;
			}
			else if (Template.DataName == 'ShredderGun')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('ShredderGun');
				Template.HideIfResearched = 'ShredstormCannon';

				// Cost
				foreach default.ShredderGun_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.ShredderGun_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.ShredderGun_TradingPostValue;
			}
			else if (Template.DataName == 'BlasterLauncher')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BlasterLauncher');

				// Cost
				foreach default.BlasterLauncher_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BlasterLauncher_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BlasterLauncher_TradingPostValue;
			}
			else if (Template.DataName == 'FlamethrowerMk2')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('HellfireProjector');

				// Cost
				foreach default.HellfireProjector_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.HellfireProjector_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.HellfireProjector_TradingPostValue;
			}
			else if (Template.DataName == 'PlasmaBlaster')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('PlasmaBlaster');

				// Cost
				foreach default.PlasmaBlaster_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.PlasmaBlaster_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.PlasmaBlaster_TradingPostValue;
			}
			else if (Template.DataName == 'ShredstormCannon')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('ShredstormCannon');

				// Cost
				foreach default.ShredstormCannon_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.ShredstormCannon_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.ShredstormCannon_TradingPostValue;

				// Fixing a bug with vanilla code
				Template.PointsToComplete = 0;
			}
		}
	}
}

static function UpdateVestTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						VestNames;
	local X2EquipmentTemplate				Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through vest templates
	VestNames.AddItem('HazmatVest');
	VestNames.AddItem('Hellweave');
	VestNames.AddItem('PlatedVest');
	VestNames.AddItem('StasisVest');

	for (i = 0; i < VestNames.Length; i++)
	{
		// Reset vest templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get vest templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(VestNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get vest template
			Template = X2EquipmentTemplate(AllDifficultiesTemplates[j]);
			
			// Make vest buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'HazmatVest')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('HazmatVest');
				
				// Cost
				foreach default.HazmatVest_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.HazmatVest_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.HazmatVest_TradingPostValue;
			}
			else if (Template.DataName == 'Hellweave')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('Hellweave');

				// Cost
				foreach default.Hellweave_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.Hellweave_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.Hellweave_TradingPostValue;
			}
			else if (Template.DataName == 'PlatedVest')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('PlatedVest');

				// Cost
				foreach default.PlatedVest_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.PlatedVest_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.PlatedVest_TradingPostValue;
			}
			else if (Template.DataName == 'StasisVest')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('StasisVest');

				// Cost
				foreach default.StasisVest_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.StasisVest_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.StasisVest_TradingPostValue;
			}
		}
	}
}

// #######################################################################################
// -------------------- HIDE EXPERIMENTAL TECHS FUNCTIONS --------------------------------
// #######################################################################################

static function HideExperimentalTechTemplates()
{
	local X2StrategyElementTemplateManager		StratMgr;
	local array<name>							TechNames;
	local X2TechTemplate						Template;
	local array<X2DataTemplate>					AllDifficultiesTemplates;
	local int									i, j;

	// Get necessary references
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

	// Iterate through experimental tech templates
	TechNames.AddItem('ExperimentalGrenade');
	TechNames.AddItem('ExperimentalAmmo');
	TechNames.AddItem('HeavyWeapons');
	TechNames.AddItem('AdvancedHeavyWeapons');
	TechNames.AddItem('ExperimentalArmor');

	for (i = 0; i < TechNames.Length; i++)
	{		
		// Reset tech templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
		
		// Get experimental tech templates for all difficulties
		StratMgr.FindDataTemplateAllDifficulties(TechNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get experimental tech template
			Template = X2TechTemplate(AllDifficultiesTemplates[j]);
		
			// Reset alternate requirements
			Template.AlternateRequirements.Length = 0;

			// Hide experimental tech
			Template.Requirements.SpecialRequirementsFn = HideTech;
		}
	}
}

static function bool HideTech()
{
	return false;
}