// This class provides context for a callback that can provide bonus intel or materials if a Lab is up.
class BL_TechWrapper extends Object config (BetterLabs);

var delegate<X2TechTemplate.OnResearchCompleted> ResearchCompletedFn;
var X2TechTemplate Tech;

var config array<float> fLabIntelBonus, fLabRebate;
var config int iRewardVariance;

var localized string m_strIntelBonus;
var localized string m_strCostRebate;

function ProvideBonusRebate(XComGameState NewGameState, XComGameState_Tech TechState) {
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local int IntelAmount, RebateQty;
	local array<String> strBonuses;
	local string RebateInfo, Desc;
	local array<ArtifactCost> Costs;
	local ArtifactCost Cost;
	local float BonusMult;
	local XComGameState_FacilityXCom LabFacility;
	local X2ItemTemplate ItemTemplate;
	local XGParamTag ParamTag;

	// call the complete function for the base research, if it exists
	if (ResearchCompletedFn != none) {
		ResearchCompletedFn(NewGameState, TechState);
	}

	History = `XCOMHISTORY;

	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		NewGameState.AddStateObject(XComHQ);
	}

	// find lab and number of filled scientist slots
	LabFacility = XComHQ.GetFacilityByName('Laboratory');
	if (LabFacility == none) { 
		`LOG("No lab detected, not giving rebates/bonuses");
		return; 
	}

	// No bonus if already assigned (prevent addl bonus bugs)
	if (class'BL_AlertListener'.static.HasReportInfo()) {
		return;
	}

	// did this tech reward us with intel?  If so, increase it
	if (TechState.IntelReward > 0) {
		BonusMult = fLabIntelBonus[LabFacility.GetNumFilledStaffSlots()];

		`LOG("Intel bonus multiplier =" @ string(BonusMult));

		if (BonusMult > 0) {
			// intel lab bonus
			IntelAmount = Round(TechState.IntelReward * BonusMult * (100 + `SYNC_RAND(iRewardVariance*2 + 1) - iRewardVariance) / 100.0);

			ParamTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));
			ParamTag.StrValue0 = string(IntelAmount);

			class'BL_AlertListener'.static.SetReportInfo(`XEXPAND.ExpandString(default.m_strIntelBonus));

			XComHQ.AddResource(NewGameState, 'Intel', IntelAmount);
		}
	}

	// give rebate for tech costs
	Costs = TechState.GetMyTemplate().Cost.ResourceCosts;
	foreach Costs(Cost) {
		BonusMult = fLabRebate[LabFacility.GetNumFilledStaffSlots()];

		`LOG("Rebate multiplier = " @ string(BonusMult) @ " for resource " @ string(Cost.ItemTemplateName) @ " qty " @ string(Cost.Quantity));
		RebateQty = int(Cost.Quantity * BonusMult * (100.0 + `SYNC_RAND(iRewardVariance*2 + 1) - iRewardVariance) / 100.0);

		if (RebateQty > 0) {
			ItemTemplate = class'X2ItemTemplateManager'.static.GetItemTemplateManager().FindItemTemplate(Cost.ItemTemplateName);
			strBonuses.AddItem("+" $ string(RebateQty) @ ItemTemplate.GetItemFriendlyNamePlural());
			XComHQ.AddResource(NewGameState, Cost.ItemTemplateName, RebateQty);
		}
	}

	// describe the rebate to the player
	if (strBonuses.Length > 0) {
		foreach strBonuses(Desc) {
			if (RebateInfo != "") { RebateInfo $= ", "; }
			RebateInfo $= Desc;
		}
		RebateInfo $= "!";
		class'BL_AlertListener'.static.SetReportInfo(m_strCostRebate @ RebateInfo);
	}
}

