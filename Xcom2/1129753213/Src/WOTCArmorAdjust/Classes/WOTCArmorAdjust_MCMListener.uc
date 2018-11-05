//Set up the MCM menu here. The config must be a non-existent config in the mod folder, so that it will be created by xcom2.

class WOTCArmorAdjust_MCMListener extends UIScreenListener config(WOTCArmorAdjust);

`include(WOTCArmorAdjust/Src/ModConfigMenuAPI/MCM_API_Includes.uci);
`include(WOTCArmorAdjust/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci);

var config float BetaStrikifyShields;
var config int CONFIG_VERSION;

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
    
    Page = ConfigAPI.NewSettingsPage("Armor & Vest Config");
    Page.SetPageTitle("Armor & Vest Config");
    Page.SetSaveHandler(SaveButtonClicked);
    
    Group = Page.AddGroup('Group1', "General Settings");
    
    Group.AddSlider('betastrike', "Shield Multiplier", "Similar to Beta Strike, multiply all shields from armor & vests by this amount. 1.0 to use the exact values in the config.", 0.0, 4.0, 0.1, BetaStrikifyShields, , SliderSaveHandler);
	//Group.AddCheckbox('betastrike', "Beta-Strike Shields", "Tooltip", bSETTING, CheckboxSaveHandler);
    
    Page.ShowSettings();
}

`MCM_CH_VersionChecker(class'WOTCArmorAdjust_MCMConfig'.default.CONFIG_VERSION,CONFIG_VERSION)

simulated function LoadSavedSettings()
{
    BetaStrikifyShields = `MCM_CH_GetValue(class'WOTCArmorAdjust_MCMConfig'.default.BetaStrikifyShields,BetaStrikifyShields);
	//bSETTING = `MCM_CH_GetValue(class'WOTCArmorAdjust_MCMConfig'.default.bSETTING,bSETTING);
}

//Every setting needs its own save handler here (slidersavehandler2, 3, etc...)
`MCM_API_BasicSliderSaveHandler(SliderSaveHandler, BetaStrikifyShields)
//`MCM_API_BasicCheckboxSaveHandler(CheckboxSaveHandler, bSETTING)

simulated function SaveButtonClicked(MCM_API_SettingsPage Page)
{
    self.CONFIG_VERSION = `MCM_CH_GetCompositeVersion();
    self.SaveConfig();
}

/* //these example functions can be added to other classes to get the values out
function float GetValue()
{
	local float value;
	value = `MCM_CH_GetValue(class'WOTCArmorAdjust_MCMConfig'.default.SETTING,class'WOTCArmorAdjust_MCMListener'.default.SETTING);
    return value;
}

function bool GetBool()
{
    return `MCM_CH_GetValue(class'WOTCArmorAdjust_MCMConfig'.default.bSETTING,class'WOTCArmorAdjust_MCMListener'.default.bSETTING);;
}
*/

defaultproperties
{
    ScreenClass = none;
}
