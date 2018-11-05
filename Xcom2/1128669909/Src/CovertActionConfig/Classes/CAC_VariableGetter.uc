class CAC_VariableGetter extends Object config(CovertActionConfigList);

`include(CovertActionConfig/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci)

struct CovertActionVars
{
	var name ActionName;
	var bool ca_Wound;
	var bool ca_Capture;
	var bool ca_Ambush;
	var bool ca_OptionalArtifact;
	var array<name> ca_Artifact;
	var array<int> ca_Count;
	var array<name> arrReqType;
	var array<int> arrReqRank;
	var array<bool> arrbReqResHero;
	var array<name> arrOptionalType;
	var array<int> arrOptionalRank;
	var array<bool> arrbResHero;
};

var config array<CovertActionVars> arrCovertActions;

`MCM_CH_VersionChecker(class'CovertActionConfig_MCMConfig'.default.CONFIG_VERSION,class'CovertActionConfig_MCMListener'.default.CONFIG_VERSION)

function float CovertActionDuration_min() {return `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.CovertActionDuration_min,class'CovertActionConfig_MCMListener'.default.CovertActionDuration_min);} 
function float CovertActionDuration_max() {return `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.CovertActionDuration_max,class'CovertActionConfig_MCMListener'.default.CovertActionDuration_max);}
function bool bCovertActionAllAmbush() {return `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.bCovertActionAllAmbush,class'CovertActionConfig_MCMListener'.default.bCovertActionAllAmbush);}
function bool bCovertActionAllCapture() {return `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.bCovertActionAllCapture,class'CovertActionConfig_MCMListener'.default.bCovertActionAllCapture);}

function CovertActionVars GetVars(name TemplateName)
{
	//local array<CovertActionVars> arrTable;
	local int idx;//, ndx, numActions;
	//local array<int> subarrLengths;
	//arrTable = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.arrCovertActions,class'CovertActionConfig_MCMListener'.default.arrCovertActions);
	//`log("arrtable length check" @ arrTable.Length ,,'CovertActionConfig');
	//`log("arrtable name check" @ arrTable[0].ActionName ,,'CovertActionConfig');
	for(idx=0;idx<default.arrCovertActions.Length; idx++)
	{
		if(default.arrCovertActions[idx].ActionName == TemplateName)
			return default.arrCovertActions[idx];
	}
	/*numActions = default.arrCovertActions.Length;
	`log("numactions check" @ numActions ,,'CovertActionConfig');
	for(idx=0; idx<numActions; idx++)
	{
		subarrLengths[0] = default.arrCovertActions[idx].ca_Artifact.Length;
		`log("subarrlengths 0 check" @ subarrLengths[0] ,,'CovertActionConfig');
		subarrLengths[1] = default.arrCovertActions[idx].ca_Count.Length;
		`log("subarrlengths 1 check" @ subarrLengths[1] ,,'CovertActionConfig');
		subarrLengths[2] = default.arrCovertActions[idx].arrReqType.Length;
		subarrLengths[3] = default.arrCovertActions[idx].arrReqRank.Length;
		subarrLengths[4] = default.arrCovertActions[idx].arrbReqResHero.Length;
		subarrLengths[5] = default.arrCovertActions[idx].arrOptionalType.Length;
		subarrLengths[6] = default.arrCovertActions[idx].arrOptionalRank.Length;
		subarrLengths[7] = default.arrCovertActions[idx].arrbResHero.Length;
		arrTable[idx].ActionName = default.arrCovertActions[idx].ActionName;
		`log("actionname check" @ arrTable[idx].ActionName ,,'CovertActionConfig');
		arrTable[idx].ca_Wound = default.arrCovertActions[idx].ca_Wound;
		arrTable[idx].ca_Capture = default.arrCovertActions[idx].ca_Capture;
		arrTable[idx].ca_Ambush = default.arrCovertActions[idx].ca_Ambush;
		arrTable[idx].ca_OptionalArtifact = default.arrCovertActions[idx].ca_OptionalArtifact;
		for(ndx=0;ndx<subarrLengths[0];ndx++)
		{
			arrTable[idx].ca_Artifact[ndx] = default.arrCovertActions[idx].ca_Artifact[ndx];
		}
		for(ndx=0;ndx<subarrLengths[1];ndx++)
		{
			arrTable[idx].ca_Count[ndx] = default.arrCovertActions[idx].ca_Count[ndx];
		}
		for(ndx=0;ndx<subarrLengths[2];ndx++)
		{
			arrTable[idx].arrReqType[ndx] = default.arrCovertActions[idx].arrReqType[ndx];
		}
		for(ndx=0;ndx<subarrLengths[3];ndx++)
		{
			arrTable[idx].arrReqRank[ndx] = default.arrCovertActions[idx].arrReqRank[ndx];
		}
		for(ndx=0;ndx<subarrLengths[4];ndx++)
		{
			arrTable[idx].arrbReqResHero[ndx] = default.arrCovertActions[idx].arrbReqResHero[ndx];
		}
		for(ndx=0;ndx<subarrLengths[5];ndx++)
		{
			arrTable[idx].arrOptionalType[ndx] = default.arrCovertActions[idx].arrOptionalType[ndx];
		}
		for(ndx=0;ndx<subarrLengths[6];ndx++)
		{
			arrTable[idx].arrOptionalRank[ndx] = default.arrCovertActions[idx].arrOptionalRank[ndx];
		}
		for(ndx=0;ndx<subarrLengths[7];ndx++)
		{
			arrTable[idx].arrbResHero[ndx] = default.arrCovertActions[idx].arrbResHero[ndx];
		}
	}
	//arrTable = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.arrCovertActions,class'CovertActionConfig_MCMListener'.default.arrCovertActions);
	`log("arrtable length check" @ arrTable.Length ,,'CovertActionConfig');
	`log("arrtable first actionname check" @ arrTable[0].ActionName ,,'CovertActionConfig');
	for(idx=0; idx<arrTable.Length;idx++)
	{
		if(TemplateName == arrTable[idx].ActionName)
		{
			return arrTable[idx];
		}
	}*/
}