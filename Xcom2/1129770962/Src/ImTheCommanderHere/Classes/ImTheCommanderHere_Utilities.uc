// This is an Unreal Script
class ImTheCommanderHere_Utilities extends Object config(ImTheCommanderHere);

struct OwnedAbility
{
	var int iRank;
	var SoldierClassAbilityType AbilityType;
};

struct X2ClassAndDeckname
{
	var name Classname;
	var name Deckname;
};

struct DeckAndAbilityname
{
	var name Deckname;
	var name Abilityname;
};


var config array<X2ClassAndDeckname> ClassAndDeckNames;
var config array<DeckAndAbilityname> Abilities2Add;
var config array<DeckAndAbilityname> Abilities2Rem;
var config array<name> UnlockAbilityAsCrossClass;
var config array<name> LockAbilityAsCrossClass;

var config bool xNormalizeAbilities;
var config bool xAppendHeroSoldiersWithTCAbilities;

static function array<DeckAndAbilityname> ReturnAbilities2Add()
{
	return default.Abilities2Add;
}

static function bool ReturnNormalizeAbilitiesState()
{
	return default.xNormalizeAbilities;
}

static function array<DeckAndAbilityname> ReturnAbilities2Rem()
{
	return default.Abilities2Rem;
}


static function array<SoldierClassAbilityType> GetAllAbilities()
{
	local array<SoldierClassAbilityType> AllAbilities;
	local array<X2SoldierClassTemplate> arrClassTemplates;
	local X2SoldierClassTemplate ClassTemplate;
	local array<SoldierClassAbilityType> AbilityTree;
	local int idx;
	local X2AbilityTemplate AbilityTemplate;

	arrClassTemplates = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().GetAllSoldierClassTemplates();
	foreach arrClassTemplates(ClassTemplate)
	{
		if(ClassTemplate.DataName != class'X2SoldierClassTemplateManager'.default.DefaultSoldierClass && 
			ClassTemplate.DataName != 'CentralOfficer' &&
			ClassTemplate.DataName != 'ChiefEngineer')
		{
			AbilityTree = ClassTemplate.GetAllPossibleAbilities();
			for(idx=0;idx < AbilityTree.length; idx++)	
				if(AllAbilities.Find('AbilityName',AbilityTree[idx].AbilityName) == -1)
					AllAbilities.AddItem(AbilityTree[idx]);
		}
	}

	for(idx = 0; idx < class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities.Length; idx++)
	{
		AbilityTemplate = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities[idx].AbilityName);

		if(AbilityTemplate != none && AbilityTemplate.bCrossClassEligible && AllAbilities.Find('AbilityName', class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities[idx].AbilityName) == -1)
		{
			AllAbilities.AddItem(class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities[idx]);
		}
	}

	return AllAbilities;
}


static function DetermineCrossClassAbilities()
{
	local X2AbilityTemplate AbilityTemplate2Add,AbilityTemplate2Rem;
	local array<SoldierClassAbilityType> AllAbilities;
	local SoldierClassAbilityType Ability;
    local int index;

	AllAbilities = GetAllAbilities();

    for(index = 0; index < default.UnlockAbilityAsCrossClass.length; index++)
    {
        AbilityTemplate2Add = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(default.UnlockAbilityAsCrossClass[index]);
        if (AbilityTemplate2Add != none)
		{
			AbilityTemplate2Add.bCrossClassEligible = true;
			if(AllAbilities.Find('AbilityName', AbilityTemplate2Add.DataName)==-1 && class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities.Find('AbilityName', AbilityTemplate2Add.DataName)==-1)
			{
				Ability.AbilityName = AbilityTemplate2Add.DataName;
				class'X2SoldierClassTemplateManager'.default.ExtraCrossClassAbilities.AddItem(Ability);
			}
		}

    }

    for(index = 0; index < default.LockAbilityAsCrossClass.length; index++)
    {
        AbilityTemplate2Rem = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(default.LockAbilityAsCrossClass[index]);
		if(AbilityTemplate2Rem != none)
			AbilityTemplate2Rem.bCrossClassEligible = false;
    }
}


static function array<OwnedAbility> GetOwnedAbilitiesAndRanks(XComGameState_Unit Unit,out array<SoldierClassAbilityType> EligibleAbilities)
{
	local int idx,iRank,iMaxRank;
	local array<OwnedAbility> OwnedAbilities;
	local array<SoldierClassAbilityType> AllAbilities;
	local OwnedAbility FoundAbility;

	iMaxRank = Unit.GetSoldierClassTemplate().GetMaxConfiguredRank();

	AllAbilities = GetAllAbilities();

		//we iterate through all the soldier-ranks
	for(iRank=1;iRank < iMaxRank;iRank++)
	{
		idx = GetHighestAbilityIndex(Unit);
		

		LoggerMcLogFace(false,"Found Abilityname: " @ Unit.AbilityTree[iRank].Abilities[idx].AbilityName @ " Index: " @ EligibleAbilities.Find('AbilityName',Unit.AbilityTree[iRank].Abilities[idx].AbilityName));

		//calling this if in case we have an ability which is no longer eligible, for example it was removed in the config
		//meaning you still need to be able to respec it by adding it to the owned abilities array
		if(EligibleAbilities.Find('AbilityName',Unit.AbilityTree[iRank].Abilities[idx].AbilityName) == -1 && AllAbilities.Find('AbilityName',Unit.AbilityTree[iRank].Abilities[idx].AbilityName) != -1 )
		{

			LoggerMcLogFace(false,"Found Trainingcenterability: " @ iRank);

			FoundAbility.iRank = iRank;
			FoundAbility.AbilityType = Unit.AbilityTree[iRank].Abilities[idx];
			OwnedAbilities.AddItem(FoundAbility);
		}
				
		//remove any owned abilitiy from the eligible array and add them to the owned abilities array
		if(EligibleAbilities.Find('AbilityName',Unit.AbilityTree[iRank].Abilities[idx].AbilityName) != -1)
		{

			LoggerMcLogFace(false,"Found Trainingcenterability: " @ iRank );

			FoundAbility.iRank = iRank;
			FoundAbility.AbilityType = Unit.AbilityTree[iRank].Abilities[idx];
			OwnedAbilities.AddItem(FoundAbility);
			//Removing the found Ability from the EligibleAbilities array so we can't choose it again
			EligibleAbilities.RemoveItem(FoundAbility.AbilityType);

			LoggerMcLogFace(false,"Removedability: " @ FoundAbility.AbilityType.AbilityName);
		}
		else if(!default.xNormalizeAbilities)
		{
			FoundAbility.iRank = iRank;
			FoundAbility.AbilityType.AbilityName = name("None");
			OwnedAbilities.AddItem(FoundAbility);
		}

	}

	return OwnedAbilities;
}

static function array<OwnedAbility> GetOwnedAbilitiesAndRanksRPGO(XComGameState_Unit Unit,out array<SoldierClassAbilityType> EligibleAbilities)
{
	local int iRank,iMaxRank;
	local array<OwnedAbility> OwnedAbilities;
	local array<SoldierClassAbilityType> AllAbilities;
	local OwnedAbility FoundAbility;

	iMaxRank = 1;

	AllAbilities = GetAllAbilities();

		//we iterate through all the soldier-ranks
	for(iRank=0;iRank <=iMaxRank ;iRank++)
	{
		//idx = GetHighestAbilityIndex(Unit);
		

		//LoggerMcLogFace(false,"Found Abilityname: " @ Unit.AbilityTree[iRank].Abilities[idx].AbilityName @ " Index: " @ EligibleAbilities.Find('AbilityName',Unit.AbilityTree[iRank].Abilities[idx].AbilityName));

		//calling this in case we have an ability which is no longer eligible, for example it was removed in the config
		//meaning you still need to be able to respec it by adding it to the owned abilities array
		if(EligibleAbilities.Find('AbilityName',Unit.AbilityTree[0].Abilities[iRank].AbilityName) == -1 && AllAbilities.Find('AbilityName',Unit.AbilityTree[0].Abilities[iRank].AbilityName) != -1 )
		{

			LoggerMcLogFace(false,"Found Trainingcenterability: " @ iRank);

			FoundAbility.iRank = iRank;
			FoundAbility.AbilityType = Unit.AbilityTree[0].Abilities[iRank];
			OwnedAbilities.AddItem(FoundAbility);

			LoggerMcLogFace(false,"Removedability: " @ FoundAbility.AbilityType.AbilityName);
		}
		
		//remove any owned abilitiy from the eligible array and add them to the owned abilities array
		if(EligibleAbilities.Find('AbilityName',Unit.AbilityTree[0].Abilities[iRank].AbilityName) != -1)
		{

			LoggerMcLogFace(false,"Found Trainingcenterability: " @ iRank);

			FoundAbility.iRank = iRank;
			FoundAbility.AbilityType = Unit.AbilityTree[0].Abilities[iRank];
			OwnedAbilities.AddItem(FoundAbility);
			//Removing the found Ability from the EligibleAbilities array so we can't choose it again
			EligibleAbilities.RemoveItem(FoundAbility.AbilityType);

			LoggerMcLogFace(false,"Removedability: " @ FoundAbility.AbilityType.AbilityName);
		}

	}

	return OwnedAbilities;
}

static function array<X2ClassAndDeckname> ReturnAllClassAndDecknames()
{
	return default.ClassAndDeckNames;
}

static function bool HasDeck(XComGameState_Unit Unit)
{
	local int idx;

	idx = default.ClassAndDeckNames.Find('Classname',Unit.GetSoldierClassTemplateName());

	switch(idx)
	{
		case -1: return false;

		default: return true;
	}
}

static function array<SoldierClassAbilityType> GetEligibleAbilities(XComGameState_Unit Unit)
{
	local X2SoldierClassTemplate SoldierClassTemplate;
	local int idx,Remidx;
	local array<SoldierClassRandomAbilityDeck> RandomAbilityDecks;
	local array<SoldierClassAbilityType> EligibleAbilities, DeckAbilities;
	local SoldierClassAbilityType NoneAbility;

	//saving the Soldierclass Template for convenience
	SoldierClassTemplate = Unit.GetSoldierClassTemplate();

	idx = default.ClassAndDeckNames.Find('Classname',SoldierClassTemplate.DataName);
	LoggerMcLogFace(false, "Index == -1 for no deck, Index <> -1 for decks: " @ idx @ " ClassAndDeckNames-length: " @ default.ClassAndDeckNames.Length);
	EligibleAbilities = class'X2SoldierClassTemplateManager'.static.GetSoldierClassTemplateManager().GetCrossClassAbilities(SoldierClassTemplate);
	LoggerMcLogFace(false, "Does a hero soldier have TC abilities: " @ EligibleAbilities.Length);
	//idx other then -1 are hero soldiers so we need the deck abilities
	if(idx != -1 )
	{
		RandomAbilityDecks = SoldierClassTemplate.RandomAbilityDecks; 
		DeckAbilities = RandomAbilityDecks[RandomAbilityDecks.Find('DeckName',default.ClassAndDeckNames[idx].Deckname)].Abilities;
		//if xAppendHeroSoldiersWithTCAbilities is false we only present to DeckAbilities otherwise we take all the TC abilities
		//and append the DeckAbilities, but only those which are not already there 
		if(default.xAppendHeroSoldiersWithTCAbilities)
		{
			for(idx = 0; idx < DeckAbilities.length; idx++)
			{
			if(EligibleAbilities.Find('Abilityname',DeckAbilities[idx].Abilityname) == -1)
				EligibleAbilities.AddItem(DeckAbilities[idx]);
			}
		}
		else EligibleAbilities = DeckAbilities;
	}

	//firaxis has empty abilities in place for possible? future abilities for the hero classes, which are title 'None' and screw up my list
	//it looks like those empty abilites are in place for herosoldiers, otherwise they would always roll the max abilities until 6
	//by getting a none ability they introduce a random amount to them 2-6
	//well lets remove them from the selection choices, noone ever wants a None-ability :D

	NoneAbility.AbilityName = 'None';
	EligibleAbilities.RemoveItem(NoneAbility);

	//remove the abilites from the ExcludedAbilities array
	for (Idx = 0; Idx < SoldierClassTemplate.ExcludedAbilities.Length; ++Idx)
	{
		RemIdx = EligibleAbilities.Find('AbilityName', SoldierClassTemplate.ExcludedAbilities[Idx]);
		if (RemIdx != -1)
		EligibleAbilities.Remove(RemIdx, 1);
	}

	return EligibleAbilities;
}

static function int GetHighestAbilityIndex(XComGameState_Unit Unit)
{
	local int iHighestAbilityIndex,iMaxRank,iRank;
	
	if(HasDeck(Unit) || Unit.IsResistanceHero())
		iHighestAbilityIndex = 3;
	Else
	{
		
		iHighestAbilityIndex = 0;
		
		iMaxRank = Unit.GetSoldierClassTemplate().GetMaxConfiguredRank();
		for(iRank = 1;iRank < iMaxRank;iRank++)
		{
			iHighestAbilityIndex = Max(Unit.AbilityTree[iRank].Abilities.Length-1, iHighestAbilityIndex);
		}

		iHighestAbilityIndex = Min(3,iHighestAbilityIndex);

	}
	
	return iHighestAbilityIndex;
}

static function NormalizeAbilityCount(XComGameState_Unit Unit)
{
	local array<OwnedAbility> OwnedAbilities;
	local array<SoldierClassAbilityType> EligibleAbilities;
	local int iCase, idx, iMaxRank, iMaxAbilities2Add,RankIdx,AbilityIdx,iMaxAbilities2Rem;
	local array<int> PossibleRanks,OwnedRanks;
	local OwnedAbility Ability2Add,Ability2Rem;
	local XComGameState NewGameState;

	EligibleAbilities = GetEligibleAbilities(Unit);
	OwnedAbilities = GetOwnedAbilitiesAndRanks(Unit,EligibleAbilities);

	iCase =  class'XcomGameState_HeadquartersXCom'.default.XComHeadquarters_NumAWCAbilities - OwnedAbilities.length;
	iMaxRank = Unit.GetSoldierClassTemplate().GetMaxConfiguredRank();


	if(iCase > 0)
	{
		for (Idx = 1; Idx < iMaxRank; Idx++)
		{
			PossibleRanks.AddItem(Idx);

			LoggerMcLogFace(false,"PossibleRanks: " @ Idx);
		}

		for(idx = 0; idx < OwnedAbilities.length; idx ++)
		{
			PossibleRanks.RemoveItem(OwnedAbilities[idx].iRank);
			LoggerMcLogFace(false,"PossibleRanks removed: " @ OwnedAbilities[idx].iRank);
		}

		if(false)
		{
			for(idx = 0; idx < PossibleRanks.Length; idx ++)
			{
				LoggerMcLogFace(true,"Eligable Ranks für new Ability: " @PossibleRanks[idx]);
			}
		}

		iMaxAbilities2Add = class'XcomGameState_HeadquartersXCom'.default.XComHeadquarters_NumAWCAbilities-OwnedAbilities.length;

		if(iMaxAbilities2Add < 1) iMaxAbilities2Add = 0;

		if(iMaxAbilities2Add > iMaxRank) iMaxAbilities2Add = iMaxRank;
		if(iMaxAbilities2Add > EligibleAbilities.length) iMaxAbilities2Add = EligibleAbilities.length;

		for(idx = 0; idx < iMaxAbilities2Add; idx++)
		{
			RankIdx = `SYNC_RAND_STATIC(PossibleRanks.Length);
			AbilityIdx = `SYNC_RAND_STATIC(EligibleAbilities.Length);

			LoggerMcLogFace(false,"Adding Ability at Rank: " @ PossibleRanks[RankIdx]  @ " at Position: " @ Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.Length);

			Ability2Add.iRank = PossibleRanks[RankIdx];
			Ability2Add.AbilityType = EligibleAbilities[AbilityIdx];

			if(Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.length == 4)
				Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.Remove(Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.length-1,Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.length);

			Unit.AbilityTree[PossibleRanks[RankIdx]].Abilities.Additem(Ability2Add.AbilityType);
			PossibleRanks.RemoveItem(Ability2Add.iRank); // Remove the rank which was chosen so it won't get picked again
			OwnedAbilities.AddItem(Ability2Add);
			EligibleAbilities.RemoveItem(Ability2Add.AbilityType); // Remove the ability which was chosen so it won't get picked again

			if(false)
			{	
				for(idx = 0; idx < PossibleRanks.Length; idx ++)
				{
					LoggerMcLogFace(true,"Eligable ranks for next iteration: " @ idx+1 @ "," @ PossibleRanks[idx]);
				}
			}
		}
	
		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding missed TC Abilities");
		Unit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit',Unit.ObjectID));
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);		
	}

	if(iCase < 0)
	{
		iMaxAbilities2Rem = class'XcomGameState_HeadquartersXCom'.default.XComHeadquarters_NumAWCAbilities-OwnedAbilities.length;
		
		for(idx = 0; idx < OwnedAbilities.length; idx ++)
		{
			OwnedRanks.AddItem(OwnedAbilities[idx].iRank);
		}

		if(iMaxAbilities2Rem > -1) iMaxAbilities2Rem = 0;
		if(iMaxAbilities2Rem < -iMaxRank) iMaxAbilities2Rem = -iMaxRank;

		loggerMcLogFace(false,"Number of Abilities to Remove: " @ iMaxAbilities2Rem);

		for(idx = 0; idx < -iMaxAbilities2Rem;idx++)
		{
			RankIdx = `SYNC_RAND_STATIC(OwnedRanks.Length-1);
			
			LoggerMcLogFace(false,"Rankindex: " @ RankIdx @ "Laenge: " @ OwnedRanks.Length);

			Ability2Rem = OwnedAbilities[RankIdx];		

			LoggerMcLogFace(false,"Removing Ability: " @ Ability2Rem.AbilityType.AbilityName @ " at Rank: " @ Ability2Rem.iRank);

			Unit.AbilityTree[Ability2Rem.iRank].Abilities.RemoveItem(Ability2Rem.AbilityType);
			OwnedRanks.RemoveItem(RankIdx);
			OwnedAbilities.RemoveItem(Ability2Rem);
		}

		NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Removing TC Abilities");
		Unit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit',Unit.ObjectID));
		`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	}
	//if(xFillUpMissedAbilities && ()) FillUpMissedAbilites();
	//if(xFillUpMissedAbilities && (OwnedAbilities.length > class'XcomGameState_HeadquartersXCom'.default.XComHeadquarters_NumAWCAbilities)) DelAbilites();
}


static function LoggerMcLogFace(bool show, string DebugString)
{
	if(!show) return;
	`REDSCREEN(DebugString);
	`LOG(DebugString);
}