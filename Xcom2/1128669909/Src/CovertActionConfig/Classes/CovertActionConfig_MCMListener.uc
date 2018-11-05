//Set up the MCM menu here. The config must be a non-existent config in the mod folder, so that it will be created by xcom2.

class CovertActionConfig_MCMListener extends UIScreenListener config(CovertActionConfig);

`include(CovertActionConfig/Src/ModConfigMenuAPI/MCM_API_Includes.uci);
`include(CovertActionConfig/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci);

var config int CONFIG_VERSION;
var config float CovertActionDuration_min;
var config float CovertActionDuration_max;
var config bool bCovertActionAllCapture;
var config bool bCovertActionAllAmbush;

event OnInit(UIScreen Screen)
{
	if (MCM_API(Screen) != none)
	{
		`MCM_API_Register(Screen, ClientModCallback);
	}
}

simulated function ClientModCallback(MCM_API_Instance ConfigAPI, int GameMode)
{
    local MCM_API_SettingsPage Page;
    local MCM_API_SettingsGroup Group;
    
    LoadSavedSettings();
    
    Page = ConfigAPI.NewSettingsPage("Covert Action Config");
    Page.SetPageTitle("Covert Action Config");
    Page.SetSaveHandler(SaveButtonClicked);
    
    Group = Page.AddGroup('Group1', "General Settings");
    
    Group.AddSlider('caMinSlider', "Duration Minimum Mult", "Multiplies the minimum duration by this amount", 0.1, 5.0, 0.1, CovertActionDuration_min, , caMinSliderSaveHandler);
	Group.AddSlider('caMaxSlider', "Duration Maximum Mult", "Multiplies the maximum duration by this amount", 0.1, 5.0, 0.1, CovertActionDuration_max, , caMaxSliderSaveHandler);
	Group.AddCheckbox('caAllCaptureCb', "All actions risk Capture", "All actions will have the Capture risk enabled.", bCovertActionAllCapture, caAllCaptureSaveHandler);
	Group.AddCheckbox('caAllAmbushCb', "All actions risk Ambush", "All actions will have the Ambush risk enabled.", bCovertActionAllAmbush, caAllAmbushSaveHandler);
    
    Page.ShowSettings();
}

`MCM_CH_VersionChecker(class'CovertActionConfig_MCMConfig'.default.CONFIG_VERSION,CONFIG_VERSION)


simulated function LoadSavedSettings()
{
	CovertActionDuration_min = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.CovertActionDuration_min,CovertActionDuration_min);
	CovertActionDuration_max = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.CovertActionDuration_max,CovertActionDuration_max);
	bCovertActionAllAmbush = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.bCovertActionAllAmbush,bCovertActionAllAmbush);
	bCovertActionAllCapture = `MCM_CH_GetValue(class'CovertActionConfig_MCMConfig'.default.bCovertActionAllCapture,bCovertActionAllCapture);
}


//Every setting needs its own save handler here (slidersavehandler2, 3, etc...)
`MCM_API_BasicSliderSaveHandler(caMinSliderSaveHandler, CovertActionDuration_min);
`MCM_API_BasicSliderSaveHandler(caMaxSliderSaveHandler, CovertActionDuration_max);
`MCM_API_BasicCheckboxSaveHandler(caAllAmbushSaveHandler, bCovertActionAllAmbush);
`MCM_API_BasicCheckboxSaveHandler(caAllCaptureSaveHandler, bCovertActionAllCapture);

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
    self.CONFIG_VERSION = `MCM_CH_GetCompositeVersion();
    self.SaveConfig();
	//`log("cac: running savebutton DoChanges");
	//self.DoChanges();
}

defaultproperties
{
    ScreenClass = none;
}