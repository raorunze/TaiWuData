class BL_AlertListener extends UIScreenListener;

var string ExtraReportInfo;

event OnInit(UIScreen Screen) {
	local UIAlert Alert;

	Alert = UIAlert(Screen);
	if (Alert.eAlertName == 'eAlert_ResearchComplete' && default.ExtraReportInfo != "") {
		BuildResearchCompleteAlert(Alert);
	}
}

static function bool HasReportInfo() {
	return BL_AlertListener(class'Engine'.static.FindClassDefaultObject("BL_AlertListener")).ExtraReportInfo != "";
}

static function SetReportInfo(string ExtraInfo) {
	BL_AlertListener(class'Engine'.static.FindClassDefaultObject("BL_AlertListener")).ExtraReportInfo = ExtraInfo;
}

// copy and paste required ahead
simulated function BuildResearchCompleteAlert(UIAlert Alert)
{
	local XComGameStateHistory History;
	local XComGameState_Tech TechState;
	local XComGameState_WorldRegion RegionState;
	local TAlertCompletedInfo kInfo;
	local XGParamTag ParamTag;

	History = `XCOMHISTORY;
	TechState = XComGameState_Tech(History.GetGameStateForObjectID(
		class'X2StrategyGameRulesetDataStructures'.static.GetDynamicIntProperty(Alert.DisplayPropertySet, 'TechRef')));

	kInfo.strName = TechState.GetDisplayName();
	kInfo.strHeaderLabel = Alert.m_strResearchCompleteLabel;
	kInfo.strBody = Alert.m_strResearchProjectComplete;

	if (TechState.GetMyTemplate().UnlockedDescription != "")
	{
		ParamTag = XGParamTag(`XEXPANDCONTEXT.FindTag("XGParam"));

		// Datapads
		if (TechState.IntelReward > 0)
		{
			ParamTag.StrValue0 = string(TechState.IntelReward);
		}

		// Facility Leads
		if (TechState.RegionRef.ObjectID != 0)
		{
			RegionState = XComGameState_WorldRegion(`XCOMHISTORY.GetGameStateForObjectID(TechState.RegionRef.ObjectID));
			ParamTag.StrValue0 = RegionState.GetDisplayName();
		}

		kInfo.strBody $= "\n" $ `XEXPAND.ExpandString(TechState.GetMyTemplate().UnlockedDescription);
	}

	// NEW!! Add lab bonus info
	if (default.ExtraReportInfo != "") {
		if (kInfo.strBody != "") kInfo.strBody $= "\n";
		kInfo.strBody $= default.ExtraReportInfo;
		SetReportInfo("");
	}

	kInfo.strConfirm = Alert.m_strAssignNewResearch;
	kInfo.strCarryOn = Alert.m_strCarryOn;
	kInfo.strImage = TechState.GetImage();
	kInfo = Alert.FillInTyganAlertComplete(kInfo);
	kInfo.eColor = eUIState_Warning;
	kInfo.clrAlert = Alert.MakeLinearColor(0.75, 0.75, 0.0, 1);

	Alert.BuildCompleteAlert(kInfo);
}

defaultproperties {
	ScreenClass = UIAlert;
}