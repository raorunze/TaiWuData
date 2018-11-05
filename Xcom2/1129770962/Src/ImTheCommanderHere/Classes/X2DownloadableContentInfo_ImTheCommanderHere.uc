//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ImTheCommanderHere.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_ImTheCommanderHere extends X2DownloadableContentInfo dependson(ImTheCommanderHere_Utilities);

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{

}

static event OnLoadedSavedGameToStrategy()
{
	NormalizeSoldiers();
}

static event OnPostTemplatesCreated()
{
	UpdateDecks();
	class'ImTheCommanderHere_Utilities'.static.DetermineCrossClassAbilities();
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}

static function NormalizeSoldiers()
{
	local XComGameState_Unit Unit;
	local XComGameState_HeadquartersXCom HQState;
	local int i;

	if (class'ImTheCommanderHere_Utilities'.static.ReturnNormalizeAbilitiesState())
	{

		HQState = class'UIUtilities_Strategy'.static.GetXComHQ();

		for(i = 0; i < HQState.Crew.Length; i++)
		{
			Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(HQState.Crew[i].ObjectID));

			if(Unit.IsAlive() && 
			   Unit.IsSoldier() && 
			   Unit.GetSoldierRank()>0 && 
			   (Unit.GetSoldierClassTemplate().bAllowAWCAbilities || class'ImTheCommanderHere_Utilities'.static.HasDeck(Unit))
			   )
			{
				class'ImTheCommanderHere_Utilities'.static.NormalizeAbilityCount(Unit);
				LoggerMcLogFace(false,"Unit normalized: " @ Unit.GetFirstName() @ " " @ Unit.GetLastName());
			}

		}
	}
}

static function UpdateDecks()
{
	local array<X2SoldierClassTemplate> arrClassTemplates;
	local X2SoldierClassTemplate ClassTemplate;
	local int idx,j;
	local SoldierClassRandomAbilityDeck RandomAbilityDeck;
	local array<SoldierClassAbilityType> EligibleAbilities;
	local array<DeckAndAbilityname> Abilities2Add,Abilities2Rem;

	Abilities2Add = class'ImTheCommanderHere_Utilities'.static.ReturnAbilities2Add();
	LoggerMcLogFace(false,"Number of Abilities 2 add: " @ Abilities2Add.Length);


	Abilities2Rem = class'ImTheCommanderHere_Utilities'.static.ReturnAbilities2Rem();

	LoggerMcLogFace(false,"Number of Abilities 2 rem: " @ Abilities2Rem.Length);

	arrClassTemplates = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().GetAllSoldierClassTemplates();

	//first we get all abilities out there and save them into EligibleAbilities
	EligibleAbilities = class'ImTheCommanderHere_Utilities'.static.GetAllAbilities();

	//now we iterate through all templates and look for the decknames in Abilities2Add and Abilitie2Remove
	// and add or remove those abilities: care structs are not references thats why we use
	//ClassTemplate.RandomAbilityDecks(RandomAbilityDeck,j) thx robojumper
	foreach arrClassTemplates(ClassTemplate)
	{
		for(idx = 0; idx < Abilities2Add.Length; idx++)
		{
			foreach ClassTemplate.RandomAbilityDecks(RandomAbilityDeck,j)
			{
				if(RandomAbilityDeck.DeckName == Abilities2Add[idx].Deckname && RandomAbilityDeck.Abilities.Find('Abilityname',Abilities2Add[idx].Abilityname) == -1)
				{
					ClassTemplate.RandomAbilityDecks[j].Abilities.AddItem(EligibleAbilities[EligibleAbilities.Find('Abilityname',Abilities2Add[idx].Abilityname)]);
				}
			}
		}

		for(idx = 0; idx < Abilities2Rem.Length; idx++)
		{
			foreach ClassTemplate.RandomAbilityDecks(RandomAbilityDeck,j)
			{
				if(RandomAbilityDeck.DeckName == Abilities2Rem[idx].Deckname && RandomAbilityDeck.Abilities.Find('Abilityname',Abilities2Rem[idx].Abilityname) != -1)
				{
					ClassTemplate.RandomAbilityDecks[j].Abilities.RemoveItem(EligibleAbilities[EligibleAbilities.Find('Abilityname',Abilities2Rem[idx].Abilityname)]);
				}
			}
		}
	}
}

static function LoggerMcLogFace(bool show, string DebugString)
{
	if(!show) return;
	`REDSCREEN(DebugString);
	`LOG(DebugString);
}

exec function UpdateDecksByConsole()
{
	UpdateDecks();
}

//console command for Gamepad users to "click" on the Respec button
exec function ClickRespecButtonByConsole()
{
	local ImTheCommanderHere_Main Main;
	local XcomGameState_HeadquartersXCom XComHQ;
	local UIScreen Promotion_Screen;
	
	Promotion_Screen = UIArmory_PromotionHero(`SCREENSTACK.GetCurrentScreen());

	XComHQ = class'UIUtilities_Strategy'.static.GetXComHQ();
	if (XComHQ.HasFacilityByName('Recoverycenter') && (Promotion_Screen != none))
	{
		Main = ImTheCommanderHere_Main(class'Engine'.static.FindClassDefaultObject("ImTheCommanderHere_Main"));
		Main.OpenSelectionScreen(Promotion_Screen);		
	}
}

exec function ReplaceAbility(int iRank, int iBranch, Name NewAbility, string UnitName)
{
	local XComGameState_Unit Unit;
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2SoldierClassTemplate SoldierClassTemplate;
	local array<SoldierClassAbilityType> AbilityTree;
	local int idx;
	local string CheckUnitName;

	History = `XCOMHISTORY;
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	foreach History.IterateByClassType(class'XComGameState_Unit', Unit)
	{
		if(XComHQ.Crew.Find('ObjectID', Unit.ObjectID) != INDEX_NONE )
		{
			CheckUnitName = Unit.GetFullName();

			if( CheckUnitName ~= UnitName )
			{
				SoldierClassTemplate = Unit.GetSoldierClassTemplate();
				AbilityTree = SoldierClassTemplate.GetAllPossibleAbilities();
				idx = AbilityTree.Find('AbilityName',NewAbility);
				if(idx != -1)
				{
					Unit.AbilityTree[iRank].Abilities[iBranch] = AbilityTree[idx];
					NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Cheater Cheater compulsive eater");
					Unit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit',Unit.ObjectID));
					`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
					UIArmory_PromotionHero(`SCREENSTACK.GetFirstInstanceOf(class'UIArmory_PromotionHero')).PopulateData();	 
				}
			}

		}
	}
}
