// This is an Unreal Script
class ImTheCommanderHere_UI extends UIScreen dependson(ImTheCommanderHere_Utilities) config(ImTheCommanderHere);

struct IconPosition
{	
	var int X;
	var int Y;
};

//Unit needs to be set before the call
var XComGameState_Unit Unit;

var UIIcon PerkIcon, SideIcon;
var UIPanel Panel;
var UIScrollBar ScrollBar;
var UIButton PanelButtonAccept;

var array<UIIcon> PerkIconList,SideIconList;
var array<SoldierClassAbilityType> EligibleAbilities;
var array<SoldierClassAbilityType> AllAbilities;
var array<OwnedAbility> OwnedAbilities;
var array<X2AbilityTemplate> AbilityTemplate,SideAbilityTemplate;

var float fInitPosX, fInitPosY, EDGE_PADDING, ScrollbarPadding,fAlpha;
var int iVisibleWidth,iVisibleHeight,iSelectedPerkID,iSelectedSidePerkID,iIconSize,iMaxIconRows,iAbilitySwitchCost, iTotalCost;;
var config int iRespecAPCost;
var config bool xDontCompensatePowerfulAbility,xAllYourAbilitiesBelongToUs;

//builds the selection screen "PopUp"
simulated function InitScreen(XcomPlayerController InitController, UIMovie InitMovie, optional name InitName)
{
	super.InitScreen(InitController, InitMovie, InitName);

	iVisibleWidth = 700 - 2 * EDGE_PADDING;
	iVisibleHeight = 200 + 2 * EDGE_PADDING; //175
	
	if(iRespecAPCost < 1) iRespecAPCost = 1;
	
	//Sets the abilities to choose from
	SetAbilities();
	
	//Builds the UI
	BuildContainer();

	//Put eligable Perks in the Box
	PutPerks();

	//Puts the found abilities to the left so the user can choose which one to respecc
	PutFoundPerks();

	//If needed adds a scrollbar
	RealizeScrollbar(EligibleAbilities.length);

	//Updating the Cost of the switch
	UpdateSwitchCost(Unit.HasSoldierAbility(OwnedAbilities[iSelectedSidePerkID].AbilityType.Abilityname));
}

//Builds the UI
simulated function BuildContainer()
{
	local String strTitle;
	local UIBGBox Background,PanelDecoration, Side;
	local UIText PanelTitle;
	//Background
	Background = Spawn(class'UIBGBox', self);
	Background.bAnimateOnInit = false;
	Background.bCascadeFocus = false;
	Background.InitBG('SelectChoice_Background');
	Background.AnchorCenter();
	Background.SetPosition(fInitPosX,fInitPosY);
	Background.SetSize(700,350);
	Background.SetBGColor("cyan");
	Background.SetAlpha(fAlpha);	

	//Decoration >> makes it look better//
	PanelDecoration = Spawn(class'UIBGBox',self);
	PanelDecoration.bAnimateOnInit = false;
	PanelDecoration.InitBG('SelectChoice_TitleBackground');
	PanelDecoration.AnchorCenter();
	PanelDecoration.setPosition(fInitPosX,fInitPosY-40);
	PanelDecoration.setSize(700,40);
	PanelDecoration.SetBGColor("cyan");
	PanelDecoration.SetAlpha(fAlpha);

	//Side
	Side = Spawn(class'UIBGBox', self);
	Side.bAnimateOnInit = false;
	Side.bCascadeFocus = false;
	Side.InitBG('SelectChoice_Side');
	Side.AnchorCenter();
	Side.SetPosition(fInitPosX-(iIconsize+2*EDGE_PADDING)-EDGE_PADDING/4,fInitPosY);
	Side.SetSize(iIconsize+2*EDGE_PADDING,350);
	Side.SetBGColor("cyan");
	Side.SetAlpha(fAlpha);	

	//Container
	Panel = Spawn(class'UIPanel', self);
	Panel.bAnimateOnInit = false;
	Panel.bCascadeFocus = false;
	Panel.InitPanel();
	Panel.SetPosition(fInitPosX,fInitPosY);
	Panel.SetSize(700,250);
	
	//Accept-Button
	PanelButtonAccept = Spawn(class'UIButton', self);
	PanelButtonAccept.bAnimateOnInit = false;
	PanelButtonAccept.InitButton('PanelButtonAccept',"Accept (" $ -(iRespecAPCost+iAbilitySwitchCost) $ "AP)",OnPanelButtonAccept);
	PanelButtonAccept.AnchorCenter();
	PanelButtonAccept.setPosition(-70,130);
	PanelButtonAccept.setSize(70,30);
	
	PanelButtonAccept.SetSelected(false);
	PanelButtonAccept.SetFontSize(18);
	PanelButtonAccept.SetResizeToText(true);
	PanelButtonAccept.SetTooltipText("Select Perk");	
	
	//Title
	strTitle = "Change an ability for " $ ReturnFullSoldierName();
	PanelTitle = Spawn(class'UIText',self);
	PanelTitle.bAnimateOnInit = false;
	PanelTitle.InitText('PanelTitle',strTitle,false);
	PanelTitle.AnchorCenter();
	PanelTitle.SetPosition(fInitPosX+EDGE_PADDING,fInitPosY-35);
	PanelTitle.SetSize(700,40);
	PanelTitle.SetText(class'UIUtilities_Text'.static.GetColoredText(strTitle, eUIState_Header, 25));
}

//sets the abilities to choose from
simulated function SetAbilities()
{
	local int iRank, iBranch, iMaxRank;
	local X2SoldierClassTemplate SoldierClassTemplate;

	SoldierClassTemplate = Unit.GetSoldierClassTemplate();

	AllAbilities = class'ImTheCommanderHere_Utilities'.static.GetAllAbilities();

	if(!xAllYourAbilitiesBelongToUs)
		EligibleAbilities = class'ImTheCommanderHere_Utilities'.static.GetEligibleAbilities(Unit);
	Else 
		EligibleAbilities = class'ImTheCommanderHere_Utilities'.static.GetAllAbilities();
	
	iMaxRank = Unit.GetSoldierClassTemplate().GetMaxConfiguredRank();
		
	Switch(SoldierClassTemplate.DataName)
	{
		case 'UniversalSoldier': //RPG  Overhaul StandardClass
			OwnedAbilities = class'ImTheCommanderHere_Utilities'.static.GetOwnedAbilitiesAndRanksRPGO(Unit,EligibleAbilities);
			break;
		default:
			OwnedAbilities = class'ImTheCommanderHere_Utilities'.static.GetOwnedAbilitiesAndRanks(Unit,EligibleAbilities);
	}
			
	//safety clause, due to sloppy programming of classmod authors users are presented with TC choices from their own class
	//so we remove any item from the EligibleAbilities-array which is found on the soldiers abilitytree
	for(iRank = 0; iRank < iMaxRank; iRank++)
		for(iBranch = 0; iBranch < Unit.Abilitytree[iRank].Abilities.length; iBranch ++)
			if(EligibleAbilities.Find('Abilityname', Unit.Abilitytree[iRank].Abilities[iBranch].Abilityname) != -1)
				EligibleAbilities.RemoveItem(Unit.Abilitytree[iRank].Abilities[iBranch]);
}

simulated function UpdateSwitchCost(bool xIsPurchased)
{
	local int iHighestAbilityIndex;

	iHighestAbilityIndex = class'ImTheCommanderHere_Utilities'.static.GetHighestAbilityIndex(Unit);

	iAbilitySWitchCost =  GetAbilityPointCost(OwnedAbilities[iSelectedSidePerkID].iRank,iHighestAbilityIndex,EligibleAbilities[iSelectedPerkID]); 
	iAbilitySWitchCost -= GetAbilityPointCost(OwnedAbilities[iSelectedSidePerkID].iRank,iHighestAbilityIndex,OwnedAbilities[iSelectedSidePerkID].AbilityType);
	
	if(xDontCompensatePowerfulAbility || !xIsPurchased) 
		iAbilitySWitchCost = 0;

	//10 AP for each Slot purchased
	if(OwnedAbilities[iSelectedSidePerkID].AbilityType.AbilityName == name("None"))
		iAbilitySWitchCost += 18;
	//determine Accept-Button status
	iTotalCost = iRespecAPCost+iAbilitySwitchCost;
	if(CanAffordAbility(iTotalCost)) PanelButtonAccept.EnableButton();
	Else PanelButtonAccept.DisableButton();

	if(-iTotalCost > 0) PanelButtonAccept.SetText("Accept (+" $ -iTotalCost $ "AP)");
	else PanelButtonAccept.SetText("Accept (" $ -iTotalCost $ "AP)");
}

//Puts the eligable perks into the selection screen
simulated function PutPerks()
{
	local int idx, iIconStartX, iIconStartY;
	local array<IconPosition> IconPosList;
	local IconPosition IconPos;

	//Initialize
	iIconStartX = fInitPosX+EDGE_PADDING;
	iIconStartY = fInitPosY+EDGE_PADDING;
	iMaxIconRows = iVisibleWidth / (iIconSize+EDGE_PADDING);
	iIconStartX += (EDGE_PADDING + iVisibleWidth - iMaxIconRows * (iIconSize+EDGE_PADDING))/2;
		
	//check if we have only one row of icons and make them center around the middle
	if(EligibleAbilities.Length < iMaxIconRows)
	{
		iIconStartX = iIconStartX - (iIconStartX/iMaxIconRows * (iMaxIconRows - EligibleAbilities.Length));
	}

	//calculate the x/y coordinates for the icons to show and save them in IconPosList
	for(idx=0; idx < EligibleAbilities.Length; idx++)
	{
		IconPos.X = PosOffsetX(idx, iMaxIconRows, iIconStartX, iIconSize, EDGE_PADDING);
		IconPos.Y = PosOffsetY(idx, iMaxIconRows, iIconStartY, iIconSize, EDGE_PADDING);
		IconPosList.AddItem(IconPos);
	}
	
	//place all icons from 				
	for(idx=0;idx < EligibleAbilities.Length;idx++)
	{
		//Save Abilities to template
		AbilityTemplate.AddItem(class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(EligibleAbilities[idx].AbilityName));
		//Spawn all Icons
		PerkIcon = Spawn(class'UIIcon',Panel);
		PerkIcon.bAnimateOnInit = false;
		PerkIcon.InitIcon('',AbilityTemplate[idx].IconImage,true,true,iIconSize);
		PerkIcon.AnchorCenter();
		PerkIcon.ProcessMouseEvents(OnChildMouseEvent);
		PerkIcon.SetPosition(IconPosList[idx].X,IconPosList[idx].Y);
		PerkIcon.SetTooltipText(AbilityTemplate[idx].LocHelpText,AbilityTemplate[idx].LocFriendlyName $ " (" $ EligibleAbilities[idx].Abilityname $ ")",25,20,,,true,0.1);
		PerkIcon.bDisableSelectionBrackets = true;
		//Every spawned icon saved into a list for later reference
		PerkIconList.AddItem(PerkIcon);
	}

	//set first Icon as active
	//PerkIconList[0].SetForegroundColor(class'UIUtilities_Colors'.const.SCIENCE_HTML_COLOR);
	PerkIconList[0].SetBGColor(class'UIUtilities_Colors'.const.WARNING_HTML_COLOR);
	iSelectedPerkID = 0;
}

//Puts the found perks into the side of the selection screen
simulated function PutFoundPerks()
{
	local int idx, iIconStartX, iIconStartY;
	local array<IconPosition> IconPosList;
	local IconPosition IconPos;

	//Initialize
	iIconStartX = fInitPosX-(iIconsize+EDGE_PADDING)-EDGE_PADDING/4;
	iIconStartY = fInitPosY+EDGE_PADDING;
	
	//calculate the x/y coordinates for the icons to show and save them in IconPosList
	for(idx=0; idx < OwnedAbilities.length; idx++)
	{
		IconPos.X = PosOffsetX(idx, 1, iIconStartX, iIconSize, EDGE_PADDING);
		IconPos.Y = PosOffsetY(idx, 1, iIconStartY, iIconSize, EDGE_PADDING/2);
		IconPosList.AddItem(IconPos);
	}
	
	//place all icons from 				
	for(idx=0;idx < OwnedAbilities.length;idx++)
	{
		//Save Abilities to template
		SideAbilityTemplate.AddItem(class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager().FindAbilityTemplate(OwnedAbilities[idx].AbilityType.AbilityName));
		//Spawn all Icons
		SideIcon = Spawn(class'UIIcon',self);
		SideIcon.bAnimateOnInit = false;
		if(OwnedAbilities[idx].AbilityType.AbilityName != name("None"))
			SideIcon.InitIcon('',SideAbilityTemplate[idx].IconImage,true,true,iIconSize);
		Else
			SideIcon.InitIcon('',class'UIUtilities_Image'.const.UnknownAbilityIcon,true,true,iIconSize);
		SideIcon.AnchorCenter();
		SideIcon.ProcessMouseEvents(OnChildMouseEvent);
		SideIcon.SetPosition(IconPosList[idx].X,IconPosList[idx].Y);
		SideIcon.SetTooltipText(SideAbilityTemplate[idx].LocHelpText,SideAbilityTemplate[idx].LocFriendlyName $ " (" $ OwnedAbilities[idx].AbilityType.Abilityname $ ")",25,20,,,true,0.1);
		SideIcon.bDisableSelectionBrackets = true;
		//Every spawned icon saved into a list for later reference
		SideIconList.AddItem(SideIcon);
	}

	//set first Icon as active
	//SideIconList[0].SetForegroundColor(class'UIUtilities_Colors'.const.SCIENCE_HTML_COLOR);
	SideIconList[0].SetBGColor(class'UIUtilities_Colors'.const.PSIONIC_HTML_COLOR);
	iSelectedSidePerkID = 0;
}

//Spawns a scrollbar if needed
simulated function RealizeScrollBar(int iIconCount)
{
	local int iHeight,iColumnCnt;
	local UIMask Mask;

	iColumnCnt = iIconCount / iMaxIconRows;

	iHeight = iColumnCnt * (iIconSize + EDGE_PADDING) - EDGE_PADDING;

	//compare the Hight from all the Icons "iHeight" with the heigt the user can see on the screen (iVisibleHeight)
	//if iHeight exceeds then we spawn a scrollbar
	if (iHeight > iVisibleHeight)
	{	
		//Mask
		if (Mask == none)
		{
			Mask = Spawn(class'UIMask', self);
			Mask.bAnimateOnInit = false;
			Mask.InitMask();
		}
		Mask.AnchorCenter();
		Mask.SetPosition(fInitPosX+EDGE_PADDING, fInitPosY+EDGE_PADDING);
		Mask.SetSize(iVisibleWidth, iVisibleHeight+EDGE_PADDING);
		Mask.SetMask(Panel);

		//Scrollbar
		if (SCrollBar == none)
			{
				ScrollBar = Spawn(class'UIScrollBar',self);
				ScrollBar.bAnimateOnInit = false;
				ScrollBar.InitScrollbar('ScrollBar');
			}
		ScrollBar.CenterOnScreen();
		ScrollBar.SnapToControl(Panel,-ScrollbarPadding);
		ScrollBar.SetHeight(350- 4 * EDGE_PADDING+25);
		ScrollBar.NotifyValueChange(Panel.SetY, fInitPosY, -iHeight);
	}
	else
	{
		if(Mask != none)
		{
			Mask.Remove();
			Mask = none;
		}
		
		if(SCrollBar != none)
		{
			SCrollBar.Remove();
			SCrollBar = none;
		}
	}
 }


//Adds the selcted perk to the soldiers ability pool and enables it
simulated function AcceptSelectedPerk()
{
	local XComGameState NewGameState;
	
	local SoldierClassAbilityType Ability2Rem,Ability2Add;

	local X2SoldierClassTemplate SoldierClassTemplate;

	SoldierClassTemplate = Unit.GetSoldierClassTemplate();

	Ability2Rem = OwnedAbilities[iSelectedSidePerkID].AbilityType;

	Ability2Add = EligibleAbilities[iSelectedPerkID];	


	Switch(SoldierClassTemplate.DataName)
	{
		case 'UniversalSoldier': //RPG Overhaul StandardClass
			Unit.AbilityTree[0].Abilities[OwnedAbilities[iSelectedSidePerkID].iRank] = Ability2Add;
			break;
		default:
			if(Ability2Rem.AbilityName != name("None")) //None-Name Abilities are new slots which can be added to the Soldier
			{	
				Unit.AbilityTree[OwnedAbilities[iSelectedSidePerkID].iRank].Abilities.RemoveItem(Ability2Rem);
				Unit.AbilityTree[OwnedAbilities[iSelectedSidePerkID].iRank].Abilities.AddItem(Ability2Add);
			}
			else
			{
				Unit.AbilityTree[OwnedAbilities[iSelectedSidePerkID].iRank].Abilities[class'ImTheCommanderHere_Utilities'.static.GetHighestAbilityIndex(Unit)] = Ability2Add;
				LoggerMcLogFace(false,"Adding new slot at Index: " @ class'ImTheCommanderHere_Utilities'.static.GetHighestAbilityIndex(Unit));
			}
	}

	CloseScreen();
	//now that you have an AWC Perk the Respec button can be clicked
	BuyRespec(iTotalCost);

    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating Soldier with new TC Ability");
	Unit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit',Unit.ObjectID));
	//NewGameState.AddStateObject(Unit);
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
	UIArmory_PromotionHero(`SCREENSTACK.GetFirstInstanceOf(class'UIArmory_Promotion')).PopulateData();	 
}

simulated function int PosOffsetX(int idx, int iIconRows, int iIconStartX, int iIconWidhtHeight, int iSpacing)
{
	return (idx % iIconRows) * (iIconWidhtHeight + iSpacing) + iIconStartX;
}

simulated function int PosOffsetY(int idx, int iIconRows, int iIconStartY, int iIconWidhtHeight, int iSpacing)
{
	return iIconStartY + (idx / iIconRows) * (iIconWidhtHeight + iSpacing);
}

public function OnPanelButtonAccept(UIButton Button)
{	
	AcceptSelectedPerk();
}

//Determine what has to happen if you click on an Icon -> Change Color to Yellow & save the ID
simulated function OnChildMouseEvent(UIPanel Control, int cmd)
{
	local int idx;
	local UIIcon ClickedIcon;
	local UIIcon ResetIcon;
	local int iSelectedIconID;
	
	switch(cmd)
	{
		case class'UIUtilities_Input'.const.FXS_L_MOUSE_DOWN:
			If (PerkIconList.Find(Control) != -1)
			{
				//Get the ID of which Item was clicked
				iSelectedIconID = PerkIconList.Find(Control);
				//Set the Icon
				ClickedIcon = PerkIconList[iSelectedIconID];
				//Set all other icon colors back to default
				for(idx=0; idx < PerkIconList.Length; idx++) 
				{
					ResetIcon = PerkIconList[idx];
					ResetIcon.SetBGColor(class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR);
				}
				//Change the clicked icon color to yellow
				ClickedIcon.SetBGColor(class'UIUtilities_Colors'.const.WARNING_HTML_COLOR);
				iSelectedPerkID = iSelectedIconID;
				UpdateSwitchCost(Unit.HasSoldierAbility(OwnedAbilities[iSelectedSidePerkID].AbilityType.Abilityname));
				return;
			}

			if (SideIconList.Find(Control) != -1)
			{
				iSelectedIconID = SideIconList.Find(Control);
				ClickedIcon = SideIconList[iSelectedIconID];
				//Set all other icon colors back to default
				for(idx=0; idx < SideIconList.Length; idx++) 
				{
					ResetIcon = SideIconList[idx];
					ResetIcon.SetBGColor(class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR);
				}
				//Change the clicked icon color to yellow
				ClickedIcon.SetBGColor(class'UIUtilities_Colors'.const.PSIONIC_HTML_COLOR);
				iSelectedSidePerkID = iSelectedIconID;
				UpdateSwitchCost(Unit.HasSoldierAbility(OwnedAbilities[iSelectedSidePerkID].AbilityType.Abilityname));
				return;
			}
			break;				
	}
}

simulated function SelectIcon(out int ID, array<UIIcon> IconList, int iDirection, string UnselectedColor, string SelectedColor)
{
	local UIIcon CurrentIcon;
	local UIICon NextIcon;
	local int iNextID;

	switch(iDirection)
	{
		case  1: for(iNextID = ID+1; iNextID < IconList.Length;iNextID++)
				{
					CurrentIcon = IconList[iD];
					CurrentIcon.SetBGColor(UnselectedColor);
					ID = iNextID;
					NextIcon = IconList[ID];
					NextIcon.SetBGColor(SelectedColor);
					return;
				}
				break;
				
		case -1: for(iNextID = ID-1;iNextID >= 0; iNextID--)
				{
					CurrentIcon = IconList[ID];
					CurrentIcon.SetBGColor(UnselectedColor);
					ID = iNextID;
					NextIcon = IconList[iD];
					NextIcon.SetBGColor(SelectedColor);
					return;
				}
				break;
		default: return;
	}
}

simulated function ShowAbilityInfoPopup()
{
	Local UIAbilityPopup AbilityInfoScreen;

	AbilityInfoScreen = Spawn(class'UIAbilityPopup', Movie.Pres.ScreenStack.GetCurrentScreen());
	Movie.Pres.ScreenStack.Push(AbilityInfoScreen);
	AbilityInfoScreen.InitAbilityPopup(AbilityTemplate[iSelectedPerkID]);
}

//Returns the Soldiername to show in the perk selection popup
simulated function string ReturnFullSoldierName()
{	
	//local XComGameState_Unit Unit;
	local string m_SoldierName;

	//Unit = GetUnit();

	m_SoldierName = Unit.GetFirstName() $ " " $
					Unit.GetNickName()  $ " " $
					Unit.GetLastName();

	return m_SoldierName;
}

//Kinda standard function if you press anything besides left mousedown while the selection popup is open -> will close it
//next time you go into soldier abilites should still let you choose a perk
simulated function bool OnUnrealCommand(int cmd, int arg)
{
	if ( !CheckInputIsReleaseOrDirectionRepeat(cmd, arg) )
		return true;

	switch( cmd )
	{
		//accepts the perk with Gamepad
		case class'UIUtilities_Input'.const.FXS_BUTTON_A: 
			AcceptSelectedPerk();
			break;

		case class'UIUtilities_Input'.const.FXS_BUTTON_L3:
			ShowAbilityInfoPopup();
			break;

		//handle all Gamepad right directions
		case class'UIUtilities_Input'.const.FXS_DPAD_RIGHT:
		case class'UIUtilities_Input'.const.FXS_BUTTON_RBUMPER:
		case class'UIUtilities_Input'.const.FXS_VIRTUAL_LSTICK_RIGHT:
			//SetNextIcon();
			SelectIcon(iSelectedperkID,PerkIconList,1,class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR,class'UIUtilities_Colors'.const.WARNING_HTML_COLOR);
			break;
		
		//handle all Gamepad left directions	
		case class'UIUtilities_Input'.const.FXS_DPAD_LEFT:
		case class'UIUtilities_Input'.const.FXS_BUTTON_LBUMPER:
		case class'UIUtilities_Input'.const.FXS_VIRTUAL_LSTICK_LEFT:
			SelectIcon(iSelectedperkID,PerkIconList,-1,class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR,class'UIUtilities_Colors'.const.WARNING_HTML_COLOR);
			//PrevIcon();
			break;	

		//owned abilities up
		case class'UIUtilities_Input'.const.FXS_DPAD_UP:
			SelectIcon(iSelectedSidePerkID,SideIconList,-1,class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR,class'UIUtilities_Colors'.const.PSIONIC_HTML_COLOR);
			//SetNextIconUp();
			break;

		//owned abilities down
		case class'UIUtilities_Input'.const.FXS_DPAD_DOWN:
			SelectIcon(iSelectedSidePerkID,SideIconList,1,class'UIUtilities_Colors'.const.NORMAL_HTML_COLOR,class'UIUtilities_Colors'.const.PSIONIC_HTML_COLOR);
			//SetNextIconDown();
			break;
		
		//closes perk screen without a selection
		case class'UIUtilities_Input'.const.FXS_BUTTON_B:
		case class'UIUtilities_Input'.const.FXS_KEY_ESCAPE:
		case class'UIUtilities_Input'.const.FXS_R_MOUSE_DOWN:
			CloseScreen();
			break;

		case class'UIUtilities_Input'.const.FXS_MOUSE_SCROLL_UP:
			ScrollBar.OnMouseScrollEvent(+1);
			break;

		case class'UIUtilities_Input'.const.FXS_MOUSE_SCROLL_DOWN:
			ScrollBar.OnMouseScrollEvent(-1);
			break;
	}
	return true; // consume all input
}

function bool CanAffordAbility(int RespecAPCost)
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	if (RespecAPCost <= Unit.AbilityPoints)
	{
		return true;
	}
	else if (RespecAPCost <= (Unit.AbilityPoints + XComHQ.GetAbilityPoints()))
	{
		return true;
	}

	return false;
}

simulated function BuyRespec(int AbilityPointCost)
{
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameStateHistory History;
	local XComGameState NewGameState;

	History = `XCOMHISTORY;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("TC-Ability Respec AP Costs");

	// If the unit must pay an Ability Point cost to purchase this ability
	
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

	if (Unit.AbilityPoints >= AbilityPointCost)
	{
		// If the unit can afford the ability on their own, spend their AP
		Unit.AbilityPoints -= AbilityPointCost;
		Unit.SpentAbilityPoints += AbilityPointCost; // Save the amount of AP spent
	}
	else if ((Unit.AbilityPoints + XComHQ.GetAbilityPoints()) >= AbilityPointCost)
	{
		// If the unit cannot afford ability on their own, spend all remaining AP and draw the difference from the Shared AP pool
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		//XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		XComHQ.AddResource(NewGameState, 'AbilityPoint', -(AbilityPointCost - Unit.AbilityPoints));
		Unit.SpentAbilityPoints += Unit.AbilityPoints; // The unit spent all of their remaining AP
		Unit.AbilityPoints = 0;
	}
	
	`XCOMGAME.GameRuleset.SubmitGameState(NewGameState);
}

function int GetAbilityPointCost(int Rank, int Branch, SoldierClassAbilityType Ability)
{
	local bool bPowerfulAbility;

	bPowerfulAbility = (class'X2StrategyGameRulesetDataStructures'.default.PowerfulAbilities.Find(Ability.AbilityName) != INDEX_NONE);
	
	if (!Unit.IsResistanceHero())
	{
		if (bPowerfulAbility && Branch >= 2)
		{
			// All powerful shared AWC abilities for base game soldiers have an increased cost, 
			// excluding any abilities they have in their normal progression tree
			return class'X2StrategyGameRulesetDataStructures'.default.PowerfulAbilityPointCost;
		}
	}

	// All Colonel level abilities for Faction Heroes and any powerful XCOM abilities have increased cost for Faction Heroes
	if (Unit.IsResistanceHero() && (bPowerfulAbility || (Rank >= 6 && Branch < 3)))
	{
		return class'X2StrategyGameRulesetDataStructures'.default.PowerfulAbilityPointCost;
	}
	
	return class'X2StrategyGameRulesetDataStructures'.default.AbilityPointCosts[Rank];
}

simulated function LoggerMcLogFace(bool show, string DebugString)
{
	if(!show) return;
	`REDSCREEN(DebugString);
	`LOG(DebugString);
}

defaultproperties
{
	EDGE_PADDING = 20;
	ScrollbarPadding = 15; 
	fInitPosX = -350;
	fInitPosY = -175;
	iIconSize = 35;
	fAlpha = 0.9f;
}