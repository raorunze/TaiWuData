// This is an Unreal Script
class RaiderRSUIScreenListener extends UIScreenListener config(RaiderRSAbilities); //GTS Class

// Set this value in the defaultproperties to filter UI signals based on class
//var class<UIScreen> ScreenClass;

var bool didUpdateTemplates;

// This event is triggered after a screen is initialized
event OnInit(UIScreen Screen)
{
    if(IsStrategyState())
    {
        if(!didUpdateTemplates)
        {
            AddRaiderPerkGTSTemplate(); //GTS SKILL
            didUpdateTemplates = true;
        }   
    }
}

function AddRaiderPerkGTSTemplate() //GTS SKILL
{
  local X2StrategyElementTemplateManager templateManager;
  local X2FacilityTemplate Template;

  templateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();

  Template = X2FacilityTemplate(templateManager.FindStrategyElementTemplate('OfficerTrainingSchool'));
  Template.SoldierUnlockTemplates.AddItem('RaiderPerkGTS'); //GTS SKILL

}

function bool IsStrategyState()
{
    return `HQGAME  != none && `HQPC != None && `HQPRES != none;
}

// This event is triggered after a screen receives focus
event OnReceiveFocus(UIScreen Screen);

// This event is triggered after a screen loses focus
event OnLoseFocus(UIScreen Screen);

// This event is triggered when a screen is removed
event OnRemoved(UIScreen Screen);

defaultproperties
{
	// Leaving this assigned to none will cause every screen to trigger its signals on this class
	ScreenClass = none;
}