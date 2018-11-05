// This is an Unreal Script

class ImTheCommanderHere_Main extends UIScreenListener dependson(ImTheCommanderHere_Utilities) config (ImTheCommanderHere);

var config bool xShowChangelogBTN;
var config bool xAlwaysShowRespecBTN;

event OnInit(UIScreen Screen)
{
	local UIScreen Promotion_Screen;
	local XcomGameState_HeadquartersXCom XComHQ;
	local UIAlert Alert;
	local XComGameState_Unit Unit;
	local array<X2ClassAndDeckname> ClassAndDecknames;

	LoggerMcLogFace(false,"We are in Screen: " @ Screen);

	Alert = UIAlert(Screen);

	//normalizing Herosoldiers and Classmod Soldiers with Decks on recruit Alert
	if(Alert != none && Alert.eAlertName == 'eAlert_NewStaffAvailableSmall' && class'ImTheCommanderHere_Utilities'.static.ReturnNormalizeAbilitiesState())
	{
		LoggerMcLogface(false,"eAlert: " @ Alert.eAlertName);

		ClassAndDecknames = class'ImTheCommanderHere_Utilities'.static.ReturnAllClassAndDecknames();
		Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(class'X2StrategyGameRulesetDataStructures'.static.GetDynamicIntProperty(Alert.DisplayPropertySet, 'UnitRef')));
		if(ClassAndDeckNames.Find('Classname',Unit.GetSoldierClassTemplateName()) != -1)
		{
			class'ImTheCommanderHere_Utilities'.static.NormalizeAbilityCount(Unit);
			LoggerMcLogFace(false,"Unit normalized: " @ Unit.GetFirstName() @ " " @ Unit.GetLastName());
		}
			
	}

	Promotion_Screen = UIArmory_PromotionHero(Screen);
	if(Promotion_Screen != none)
	{
		LoggerMcLogFace(false,"We made it to the new Promotionscreen");

		XComHQ = class'UIUtilities_Strategy'.static.GetXComHQ();
		if (XComHQ.HasFacilityByName('Recoverycenter') || xAlwaysShowRespecBTN)
		{
			SpawnButton(Promotion_Screen);
			if(xShowChangelogBTN) SpawnChangelogButton(Promotion_Screen);
		}
	}
}

simulated function SpawnButton(UIScreen Promotion_Screen)
{
	local UIButton RespecButton;
	
	RespecButton = Promotion_Screen.Spawn(class 'UIButton', Promotion_Screen);
	RespecButton.SetResizeToText(false);
	RespecButton.bAnimateOnInit = false;
	RespecButton.InitButton('RespecBTN', "Respec", OnRespecButton).SetPosition(1195, 750).SetWidth(150);			
}

simulated function SpawnChangelogButton(UIScreen Promotion_Screen)
{
	local UIButton ChangelogButton;
	
	ChangelogButton = Promotion_Screen.Spawn(class 'UIButton', Promotion_Screen);
	ChangelogButton.SetResizeToText(false);
	ChangelogButton.bAnimateOnInit = false;
	ChangelogButton.InitButton('ChangelogBTN', "Changelog", OnChangelogButton).SetPosition(1195, 885).SetWidth(150);
			
}

simulated function ShowChangeLogPopup(UIScreen Screen)
{
	Local TDialogueBoxData DialogData;

	DialogData.eType = eDialog_Normal;
	DialogData.strTitle = "[WotC] I'm the Commander here changelog";
	DialogData.strText ="[15.04.2018]<br/>" $
						 "- You no longer need to enable RPGO in the config, mod should detect the mod himself<br/>" $
						 "- changed the code that with RPGO you can respec SPARKs <br/>" $
						"[14.04.2018]<br/>" $
						 "- Changed Cost for new slots to 20 AP<br/>" $
						 "- hopefully fixed an issue with Richards 3 Perk classes mod<br/>" $
						 "[13.04.2018]<br/>" $
						 "- Added the ability to purchase additional ability slots for a total of 30 AP per slot<br/>" $
						 "- xNormalizeAbilityCount should be disabled while wanting to purchase new Slots<br/>" $
						 "- if not disabled every savegame load will reset the number of abilities to NumAWCAbilities<br/>" $
						"[10.04.2018]<br/>" $
						 "- Added RPGO support, must be enabled in the config<br/>" $
						 "- Changelog Button is now hidden on default<br/>" $
						 "[12.10.2017]<br/>" $
						 "- Added another check which prevents displaying already owned abilities to the user<br/>" $
						 "- Displaying the changelog button can be disabled in the config<br/>" $
						 "- minor code improvements to use for the extension mod<br/><br/>" $
						 "[7.10.2017]<br/>" $
						 "- fixed Changelogbutton location <br/>" $
						 "- fixed Psi-Ops loosing 2 abilities if xNormalizeAbilities was enabeld <br/>" $
						 "- see mod-page on how to get those abilities back <br/>" $
						 "- added another securitycheck for classes without TC abilities<br/><br/>" $
						 "[6.10.2017] <br/> " $
						 "- The additonal abilities for herosoldiers got moved to a seperate mod, check the mod-page for the link<br/>" $
						 "- Added a new interface for the extension-mod to enable / disable abilities for crossclassing <br/>" $
						 "- xNormalizeAbilities default state in the config has been changed to false <br/>" $
						 "- xNormalizeAbilities also removes abilties if your herosoldiers surpasses 'XComHeadquarters_NumAWCAbilities'<br/><br/>" $
						 "- Don't forget to make the changes to your config again <br/>";
						  
	DialogData.strAccept = class'UIDialogueBox'.default.m_strDefaultAcceptLabel;
	Screen.Movie.Pres.UIRaiseDialog(DialogData);
}

//consumed mouse event: Open the selection screen
simulated function OnRespecButton(UIButton Button)
{
	OpenSelectionScreen(Button.Screen);
}

simulated function OnChangelogButton(UIButton Button)
{
	LoggerMcLogFace(false,"Upppppppppdate");
	ShowChangeLogPopup(Button.Screen);
}

simulated function OpenSelectionScreen(UIScreen Screen)
{
	local ImTheCommanderHere_UI SelectionPanel;
	local XComGameStateHistory History;
	local UIScreen Promotion_Screen;
	
	Promotion_Screen = Screen;

	History = `XCOMHISTORY;

	SelectionPanel = Promotion_Screen.Spawn(class'ImTheCommanderHere_UI',Promotion_Screen);
	SelectionPanel.Unit = XComGameState_Unit(History.GetGameStateForObjectID(UIArmory_PromotionHero(Promotion_Screen).UnitReference.ObjectID));
	Promotion_Screen.Movie.Stack.Push(SelectionPanel);
	SelectionPanel.Show();
}

simulated function LoggerMcLogFace(bool show, string DebugString)
{
	if(!show) return;
	`REDSCREEN(DebugString);
	`LOG(DebugString);
}

defaultproperties
{
	//setting it to a specific screen so it won't fire on every fucking screen we are in
	//setting it to none after all so it will work with overriden UIArmory_PromotionHero
	ScreenClass = none;
	//Debug variables
}