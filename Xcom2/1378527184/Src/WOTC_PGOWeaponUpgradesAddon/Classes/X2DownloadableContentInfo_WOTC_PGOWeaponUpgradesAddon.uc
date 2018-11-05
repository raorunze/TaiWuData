class X2DownloadableContentInfo_WOTC_PGOWeaponUpgradesAddon extends X2DownloadableContentInfo
	config(PGOWeaponUpgradesAddon);

// Basic Weapon Upgrades
var config array<ArtifactCost>		BasicAutoLoader_ResourceCosts;
var config array<ArtifactCost>		BasicAutoLoader_ArtifactCosts;
var config int						BasicAutoLoader_TradingPostValue;

var config array<ArtifactCost>		BasicExpandedMagazine_ResourceCosts;
var config array<ArtifactCost>		BasicExpandedMagazine_ArtifactCosts;
var config int						BasicExpandedMagazine_TradingPostValue;

var config array<ArtifactCost>		BasicHairTrigger_ResourceCosts;
var config array<ArtifactCost>		BasicHairTrigger_ArtifactCosts;
var config int						BasicHairTrigger_TradingPostValue;

var config array<ArtifactCost>		BasicLaserSight_ResourceCosts;
var config array<ArtifactCost>		BasicLaserSight_ArtifactCosts;
var config int						BasicLaserSight_TradingPostValue;

var config array<ArtifactCost>		BasicRepeater_ResourceCosts;
var config array<ArtifactCost>		BasicRepeater_ArtifactCosts;
var config int						BasicRepeater_TradingPostValue;

var config array<ArtifactCost>		BasicScope_ResourceCosts;
var config array<ArtifactCost>		BasicScope_ArtifactCosts;
var config int						BasicScope_TradingPostValue;

var config array<ArtifactCost>		BasicStock_ResourceCosts;
var config array<ArtifactCost>		BasicStock_ArtifactCosts;
var config int						BasicStock_TradingPostValue;

// Advanced Weapon Upgrades
var config array<ArtifactCost>		AdvancedAutoLoader_ResourceCosts;
var config array<ArtifactCost>		AdvancedAutoLoader_ArtifactCosts;
var config int						AdvancedAutoLoader_TradingPostValue;

var config array<ArtifactCost>		AdvancedExpandedMagazine_ResourceCosts;
var config array<ArtifactCost>		AdvancedExpandedMagazine_ArtifactCosts;
var config int						AdvancedExpandedMagazine_TradingPostValue;

var config array<ArtifactCost>		AdvancedHairTrigger_ResourceCosts;
var config array<ArtifactCost>		AdvancedHairTrigger_ArtifactCosts;
var config int						AdvancedHairTrigger_TradingPostValue;

var config array<ArtifactCost>		AdvancedLaserSight_ResourceCosts;
var config array<ArtifactCost>		AdvancedLaserSight_ArtifactCosts;
var config int						AdvancedLaserSight_TradingPostValue;

var config array<ArtifactCost>		AdvancedRepeater_ResourceCosts;
var config array<ArtifactCost>		AdvancedRepeater_ArtifactCosts;
var config int						AdvancedRepeater_TradingPostValue;

var config array<ArtifactCost>		AdvancedScope_ResourceCosts;
var config array<ArtifactCost>		AdvancedScope_ArtifactCosts;
var config int						AdvancedScope_TradingPostValue;

var config array<ArtifactCost>		AdvancedStock_ResourceCosts;
var config array<ArtifactCost>		AdvancedStock_ArtifactCosts;
var config int						AdvancedStock_TradingPostValue;

// Superior Weapon Upgrades
var config array<ArtifactCost>		SuperiorAutoLoader_ResourceCosts;
var config array<ArtifactCost>		SuperiorAutoLoader_ArtifactCosts;
var config int						SuperiorAutoLoader_TradingPostValue;

var config array<ArtifactCost>		SuperiorExpandedMagazine_ResourceCosts;
var config array<ArtifactCost>		SuperiorExpandedMagazine_ArtifactCosts;
var config int						SuperiorExpandedMagazine_TradingPostValue;

var config array<ArtifactCost>		SuperiorHairTrigger_ResourceCosts;
var config array<ArtifactCost>		SuperiorHairTrigger_ArtifactCosts;
var config int						SuperiorHairTrigger_TradingPostValue;

var config array<ArtifactCost>		SuperiorLaserSight_ResourceCosts;
var config array<ArtifactCost>		SuperiorLaserSight_ArtifactCosts;
var config int						SuperiorLaserSight_TradingPostValue;

var config array<ArtifactCost>		SuperiorRepeater_ResourceCosts;
var config array<ArtifactCost>		SuperiorRepeater_ArtifactCosts;
var config int						SuperiorRepeater_TradingPostValue;

var config array<ArtifactCost>		SuperiorScope_ResourceCosts;
var config array<ArtifactCost>		SuperiorScope_ArtifactCosts;
var config int						SuperiorScope_TradingPostValue;

var config array<ArtifactCost>		SuperiorStock_ResourceCosts;
var config array<ArtifactCost>		SuperiorStock_ArtifactCosts;
var config int						SuperiorStock_TradingPostValue;

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
	UpdateWeaponUpgradesTemplates();
}

static function AddNewTechs()
{
	local X2StrategyElementTemplateManager		StratMgr;
	local XComGameState							NewGameState;
	local array<name>							TechNames;
	local Name									TechName;
	local bool									bTechExists;
	local XComGameState_Tech					TechState;
	local X2TechTemplate						TechTemplate;

	// Get necessary references
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	
	// Set up new gamestate
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Add Build Grenades and Rounds Techs");

	// Iterate through new tech templates
	TechNames.AddItem('BasicAutoLoader');
	TechNames.AddItem('BasicExpandedMagazine');
	TechNames.AddItem('BasicHairTrigger');
	TechNames.AddItem('BasicLaserSight');
	TechNames.AddItem('BasicRepeater');
	TechNames.AddItem('BasicScope');
	TechNames.AddItem('BasicStock');

	TechNames.AddItem('AdvancedAutoLoader');
	TechNames.AddItem('AdvancedExpandedMagazine');
	TechNames.AddItem('AdvancedHairTrigger');
	TechNames.AddItem('AdvancedLaserSight');
	TechNames.AddItem('AdvancedRepeater');
	TechNames.AddItem('AdvancedScope');
	TechNames.AddItem('AdvancedStock');

	TechNames.AddItem('SuperiorAutoLoader');
	TechNames.AddItem('SuperiorExpandedMagazine');
	TechNames.AddItem('SuperiorHairTrigger');
	TechNames.AddItem('SuperiorLaserSight');
	TechNames.AddItem('SuperiorRepeater');
	TechNames.AddItem('SuperiorScope');
	TechNames.AddItem('SuperiorStock');

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

static function UpdateWeaponUpgradesTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						WeaponUpgradeNames;
	local X2WeaponUpgradeTemplate			Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through weapon upgrade templates
	WeaponUpgradeNames.AddItem('ReloadUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('ClipSizeUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('FreeFireUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('CritUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('FreeKillUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('AimUpgrade_Bsc');
	WeaponUpgradeNames.AddItem('MissDamageUpgrade_Bsc');

	WeaponUpgradeNames.AddItem('ReloadUpgrade_Adv');
	WeaponUpgradeNames.AddItem('ClipSizeUpgrade_Adv');
	WeaponUpgradeNames.AddItem('FreeFireUpgrade_Adv');
	WeaponUpgradeNames.AddItem('CritUpgrade_Adv');
	WeaponUpgradeNames.AddItem('FreeKillUpgrade_Adv');
	WeaponUpgradeNames.AddItem('AimUpgrade_Adv');
	WeaponUpgradeNames.AddItem('MissDamageUpgrade_Adv');

	WeaponUpgradeNames.AddItem('ReloadUpgrade_Sup');
	WeaponUpgradeNames.AddItem('ClipSizeUpgrade_Sup');
	WeaponUpgradeNames.AddItem('FreeFireUpgrade_Sup');
	WeaponUpgradeNames.AddItem('CritUpgrade_Sup');
	WeaponUpgradeNames.AddItem('FreeKillUpgrade_Sup');
	WeaponUpgradeNames.AddItem('AimUpgrade_Sup');
	WeaponUpgradeNames.AddItem('MissDamageUpgrade_Sup');

	for (i = 0; i < WeaponUpgradeNames.Length; i++)
	{
		// Get weapon upgrade templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(WeaponUpgradeNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get weapon upgrade template
			Template = X2WeaponUpgradeTemplate(AllDifficultiesTemplates[j]);
			
			// Make weapon upgrade buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'ReloadUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicAutoLoader');
				Template.HideIfResearched = 'AdvancedAutoLoader';
				
				// Cost
				foreach default.BasicAutoLoader_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicAutoLoader_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicAutoLoader_TradingPostValue;
			}
			else if (Template.DataName == 'ClipSizeUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicExpandedMagazine');
				Template.HideIfResearched = 'AdvancedExpandedMagazine';
				
				// Cost
				foreach default.BasicExpandedMagazine_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicExpandedMagazine_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicExpandedMagazine_TradingPostValue;
			}
			else if (Template.DataName == 'FreeFireUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicHairTrigger');
				Template.HideIfResearched = 'AdvancedHairTrigger';
				
				// Cost
				foreach default.BasicHairTrigger_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicHairTrigger_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicHairTrigger_TradingPostValue;
			}
			else if (Template.DataName == 'CritUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicLaserSight');
				Template.HideIfResearched = 'AdvancedLaserSight';
				
				// Cost
				foreach default.BasicLaserSight_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicLaserSight_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicLaserSight_TradingPostValue;
			}
			else if (Template.DataName == 'FreeKillUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicRepeater');
				Template.HideIfResearched = 'AdvancedRepeater';
				
				// Cost
				foreach default.BasicRepeater_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicRepeater_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicRepeater_TradingPostValue;
			}
			else if (Template.DataName == 'AimUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicScope');
				Template.HideIfResearched = 'AdvancedScope';
				
				// Cost
				foreach default.BasicScope_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicScope_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicScope_TradingPostValue;
			}
			else if (Template.DataName == 'MissDamageUpgrade_Bsc')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicStock');
				Template.HideIfResearched = 'AdvancedStock';
				
				// Cost
				foreach default.BasicStock_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicStock_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicStock_TradingPostValue;
			}
			else if (Template.DataName == 'ReloadUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedAutoLoader');
				Template.HideIfResearched = 'SuperiorAutoLoader';
				
				// Cost
				foreach default.AdvancedAutoLoader_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedAutoLoader_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedAutoLoader_TradingPostValue;
			}
			else if (Template.DataName == 'ClipSizeUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedExpandedMagazine');
				Template.HideIfResearched = 'SuperiorExpandedMagazine';
				
				// Cost
				foreach default.AdvancedExpandedMagazine_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedExpandedMagazine_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedExpandedMagazine_TradingPostValue;
			}
			else if (Template.DataName == 'FreeFireUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedHairTrigger');
				Template.HideIfResearched = 'SuperiorHairTrigger';
				
				// Cost
				foreach default.AdvancedHairTrigger_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedHairTrigger_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedHairTrigger_TradingPostValue;
			}
			else if (Template.DataName == 'CritUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedLaserSight');
				Template.HideIfResearched = 'SuperiorLaserSight';
				
				// Cost
				foreach default.AdvancedLaserSight_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedLaserSight_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedLaserSight_TradingPostValue;
			}
			else if (Template.DataName == 'FreeKillUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedRepeater');
				Template.HideIfResearched = 'SuperiorRepeater';
				
				// Cost
				foreach default.AdvancedRepeater_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedRepeater_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedRepeater_TradingPostValue;
			}
			else if (Template.DataName == 'AimUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedScope');
				Template.HideIfResearched = 'SuperiorScope';
				
				// Cost
				foreach default.AdvancedScope_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedScope_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedScope_TradingPostValue;
			}
			else if (Template.DataName == 'MissDamageUpgrade_Adv')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedStock');
				Template.HideIfResearched = 'SuperiorStock';
				
				// Cost
				foreach default.AdvancedStock_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedStock_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedStock_TradingPostValue;
			}
			else if (Template.DataName == 'ReloadUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorAutoLoader');
				
				// Cost
				foreach default.SuperiorAutoLoader_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorAutoLoader_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorAutoLoader_TradingPostValue;
			}
			else if (Template.DataName == 'ClipSizeUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorExpandedMagazine');
				
				// Cost
				foreach default.SuperiorExpandedMagazine_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorExpandedMagazine_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorExpandedMagazine_TradingPostValue;
			}
			else if (Template.DataName == 'FreeFireUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorHairTrigger');
				
				// Cost
				foreach default.SuperiorHairTrigger_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorHairTrigger_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorHairTrigger_TradingPostValue;
			}
			else if (Template.DataName == 'CritUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorLaserSight');
				
				// Cost
				foreach default.SuperiorLaserSight_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorLaserSight_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorLaserSight_TradingPostValue;
			}
			else if (Template.DataName == 'FreeKillUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorRepeater');
				
				// Cost
				foreach default.SuperiorRepeater_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorRepeater_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorRepeater_TradingPostValue;
			}
			else if (Template.DataName == 'AimUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorScope');
				
				// Cost
				foreach default.SuperiorScope_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorScope_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorScope_TradingPostValue;
			}
			else if (Template.DataName == 'MissDamageUpgrade_Sup')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorStock');
				
				// Cost
				foreach default.SuperiorStock_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorStock_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorStock_TradingPostValue;
			}
		}

		// Reset weapon upgrade templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
	}
}