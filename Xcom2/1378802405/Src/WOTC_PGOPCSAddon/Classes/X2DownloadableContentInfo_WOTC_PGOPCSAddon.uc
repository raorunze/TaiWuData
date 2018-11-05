class X2DownloadableContentInfo_WOTC_PGOPCSAddon extends X2DownloadableContentInfo
	config(PGOPCSAddon);

// Basic PCS
var config array<ArtifactCost>		BasicPCSAgility_ResourceCosts;
var config array<ArtifactCost>		BasicPCSAgility_ArtifactCosts;
var config int						BasicPCSAgility_TradingPostValue;

var config array<ArtifactCost>		BasicPCSConditioning_ResourceCosts;
var config array<ArtifactCost>		BasicPCSConditioning_ArtifactCosts;
var config int						BasicPCSConditioning_TradingPostValue;

var config array<ArtifactCost>		BasicPCSFocus_ResourceCosts;
var config array<ArtifactCost>		BasicPCSFocus_ArtifactCosts;
var config int						BasicPCSFocus_TradingPostValue;

var config array<ArtifactCost>		BasicPCSPerception_ResourceCosts;
var config array<ArtifactCost>		BasicPCSPerception_ArtifactCosts;
var config int						BasicPCSPerception_TradingPostValue;

var config array<ArtifactCost>		BasicPCSSpeed_ResourceCosts;
var config array<ArtifactCost>		BasicPCSSpeed_ArtifactCosts;
var config int						BasicPCSSpeed_TradingPostValue;

// Advanced PCS
var config array<ArtifactCost>		AdvancedPCSAgility_ResourceCosts;
var config array<ArtifactCost>		AdvancedPCSAgility_ArtifactCosts;
var config int						AdvancedPCSAgility_TradingPostValue;

var config array<ArtifactCost>		AdvancedPCSConditioning_ResourceCosts;
var config array<ArtifactCost>		AdvancedPCSConditioning_ArtifactCosts;
var config int						AdvancedPCSConditioning_TradingPostValue;

var config array<ArtifactCost>		AdvancedPCSFocus_ResourceCosts;
var config array<ArtifactCost>		AdvancedPCSFocus_ArtifactCosts;
var config int						AdvancedPCSFocus_TradingPostValue;

var config array<ArtifactCost>		AdvancedPCSPerception_ResourceCosts;
var config array<ArtifactCost>		AdvancedPCSPerception_ArtifactCosts;
var config int						AdvancedPCSPerception_TradingPostValue;

var config array<ArtifactCost>		AdvancedPCSSpeed_ResourceCosts;
var config array<ArtifactCost>		AdvancedPCSSpeed_ArtifactCosts;
var config int						AdvancedPCSSpeed_TradingPostValue;

// Superior PCS
var config array<ArtifactCost>		SuperiorPCSAgility_ResourceCosts;
var config array<ArtifactCost>		SuperiorPCSAgility_ArtifactCosts;
var config int						SuperiorPCSAgility_TradingPostValue;

var config array<ArtifactCost>		SuperiorPCSConditioning_ResourceCosts;
var config array<ArtifactCost>		SuperiorPCSConditioning_ArtifactCosts;
var config int						SuperiorPCSConditioning_TradingPostValue;

var config array<ArtifactCost>		SuperiorPCSFocus_ResourceCosts;
var config array<ArtifactCost>		SuperiorPCSFocus_ArtifactCosts;
var config int						SuperiorPCSFocus_TradingPostValue;

var config array<ArtifactCost>		SuperiorPCSPerception_ResourceCosts;
var config array<ArtifactCost>		SuperiorPCSPerception_ArtifactCosts;
var config int						SuperiorPCSPerception_TradingPostValue;

var config array<ArtifactCost>		SuperiorPCSSpeed_ResourceCosts;
var config array<ArtifactCost>		SuperiorPCSSpeed_ArtifactCosts;
var config int						SuperiorPCSSpeed_TradingPostValue;

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
	UpdatePCSTemplates();
}

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
	TechNames.AddItem('BasicPCSAgility');
	TechNames.AddItem('BasicPCSConditioning');
	TechNames.AddItem('BasicPCSFocus');
	TechNames.AddItem('BasicPCSPerception');
	TechNames.AddItem('BasicPCSSpeed');

	TechNames.AddItem('AdvancedPCSAgility');
	TechNames.AddItem('AdvancedPCSConditioning');
	TechNames.AddItem('AdvancedPCSFocus');
	TechNames.AddItem('AdvancedPCSPerception');
	TechNames.AddItem('AdvancedPCSSpeed');

	TechNames.AddItem('SuperiorPCSAgility');
	TechNames.AddItem('SuperiorPCSConditioning');
	TechNames.AddItem('SuperiorPCSFocus');
	TechNames.AddItem('SuperiorPCSPerception');
	TechNames.AddItem('SuperiorPCSSpeed');

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

static function UpdatePCSTemplates()
{
	local X2ItemTemplateManager				ItemMgr;
	local array<name>						PCSNames;
	local X2EquipmentTemplate				Template;
	local array<X2DataTemplate>				AllDifficultiesTemplates;
	local ArtifactCost						Resources, Artifacts;
	local int								i, j;

	// Get necessary references
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	// Iterate through PCS templates
	PCSNames.AddItem('CommonPCSAgility');
	PCSNames.AddItem('CommonPCSConditioning');
	PCSNames.AddItem('CommonPCSFocus');
	PCSNames.AddItem('CommonPCSPerception');
	PCSNames.AddItem('CommonPCSSpeed');

	PCSNames.AddItem('RarePCSAgility');
	PCSNames.AddItem('RarePCSConditioning');
	PCSNames.AddItem('RarePCSFocus');
	PCSNames.AddItem('RarePCSPerception');
	PCSNames.AddItem('RarePCSSpeed');

	PCSNames.AddItem('EpicPCSAgility');
	PCSNames.AddItem('EpicPCSConditioning');
	PCSNames.AddItem('EpicPCSFocus');
	PCSNames.AddItem('EpicPCSPerception');
	PCSNames.AddItem('EpicPCSSpeed');

	for (i = 0; i < PCSNames.Length; i++)
	{
		// Get PCS templates for all difficulties
		ItemMgr.FindDataTemplateAllDifficulties(PCSNames[i], AllDifficultiesTemplates);

		for (j = 0; j < AllDifficultiesTemplates.Length; j++)
		{
			// Get PCS template
			Template = X2EquipmentTemplate(AllDifficultiesTemplates[j]);
			
			// Make PCS buildable
			Template.CanBeBuilt = true;

			// Reset requirements and cost
			Template.AlternateRequirements.Length = 0;
			Template.Requirements.RequiredTechs.Length = 0;
			Template.Cost.ResourceCosts.Length = 0;
			Template.Cost.ArtifactCosts.Length = 0;

			if (Template.DataName == 'CommonPCSAgility')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicPCSAgility');
				Template.HideIfResearched = 'AdvancedPCSAgility';
				
				// Cost
				foreach default.BasicPCSAgility_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicPCSAgility_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicPCSAgility_TradingPostValue;
			}
			else if (Template.DataName == 'CommonPCSConditioning')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicPCSConditioning');
				Template.HideIfResearched = 'AdvancedPCSConditioning';
				
				// Cost
				foreach default.BasicPCSConditioning_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicPCSConditioning_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicPCSConditioning_TradingPostValue;
			}
			else if (Template.DataName == 'CommonPCSFocus')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicPCSFocus');
				Template.HideIfResearched = 'AdvancedPCSFocus';
				
				// Cost
				foreach default.BasicPCSFocus_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicPCSFocus_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicPCSFocus_TradingPostValue;
			}
			else if (Template.DataName == 'CommonPCSPerception')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicPCSPerception');
				Template.HideIfResearched = 'AdvancedPCSPerception';
				
				// Cost
				foreach default.BasicPCSPerception_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicPCSPerception_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicPCSPerception_TradingPostValue;
			}
			else if (Template.DataName == 'CommonPCSSpeed')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('BasicPCSSpeed');
				Template.HideIfResearched = 'AdvancedPCSSpeed';
				
				// Cost
				foreach default.BasicPCSSpeed_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.BasicPCSSpeed_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.BasicPCSSpeed_TradingPostValue;
			}
			else if (Template.DataName == 'RarePCSAgility')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedPCSAgility');
				Template.HideIfResearched = 'SuperiorPCSAgility';
				
				// Cost
				foreach default.AdvancedPCSAgility_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedPCSAgility_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedPCSAgility_TradingPostValue;
			}
			else if (Template.DataName == 'RarePCSConditioning')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedPCSConditioning');
				Template.HideIfResearched = 'SuperiorPCSConditioning';
				
				// Cost
				foreach default.AdvancedPCSConditioning_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedPCSConditioning_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedPCSConditioning_TradingPostValue;
			}
			else if (Template.DataName == 'RarePCSFocus')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedPCSFocus');
				Template.HideIfResearched = 'SuperiorPCSFocus';
				
				// Cost
				foreach default.AdvancedPCSFocus_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedPCSFocus_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedPCSFocus_TradingPostValue;
			}
			else if (Template.DataName == 'RarePCSPerception')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedPCSPerception');
				Template.HideIfResearched = 'SuperiorPCSPerception';
				
				// Cost
				foreach default.AdvancedPCSPerception_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedPCSPerception_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedPCSPerception_TradingPostValue;
			}
			else if (Template.DataName == 'RarePCSSpeed')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('AdvancedPCSSpeed');
				Template.HideIfResearched = 'SuperiorPCSSpeed';
				
				// Cost
				foreach default.AdvancedPCSSpeed_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.AdvancedPCSSpeed_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.AdvancedPCSSpeed_TradingPostValue;
			}
			else if (Template.DataName == 'EpicPCSAgility')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorPCSAgility');
				
				// Cost
				foreach default.SuperiorPCSAgility_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorPCSAgility_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorPCSAgility_TradingPostValue;
			}
			else if (Template.DataName == 'EpicPCSConditioning')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorPCSConditioning');
				
				// Cost
				foreach default.SuperiorPCSConditioning_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorPCSConditioning_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorPCSConditioning_TradingPostValue;
			}
			else if (Template.DataName == 'EpicPCSFocus')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorPCSFocus');
				
				// Cost
				foreach default.SuperiorPCSFocus_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorPCSFocus_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorPCSFocus_TradingPostValue;
			}
			else if (Template.DataName == 'EpicPCSPerception')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorPCSPerception');
				
				// Cost
				foreach default.SuperiorPCSPerception_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorPCSPerception_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorPCSPerception_TradingPostValue;
			}
			else if (Template.DataName == 'EpicPCSSpeed')
			{
				// Requirements
				Template.Requirements.RequiredTechs.AddItem('SuperiorPCSSpeed');
				
				// Cost
				foreach default.SuperiorPCSSpeed_ResourceCosts(Resources)
				{
					Template.Cost.ResourceCosts.AddItem(Resources);
				}
				foreach default.SuperiorPCSSpeed_ArtifactCosts(Artifacts)
				{
					Template.Cost.ArtifactCosts.AddItem(Artifacts);
				}

				// Black Market Value
				Template.TradingPostValue = default.SuperiorPCSSpeed_TradingPostValue;
			}
		}

		// Reset PCS templates for all difficulties
		AllDifficultiesTemplates.Length = 0;
	}
}