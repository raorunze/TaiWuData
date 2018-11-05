Class UIScreenListener_CommandersChoice extends UIScreenListener config(CommandersChoice);

var UIArmory_MainMenu ParentScreen;
var UIListItemString_SelfContained CCListItem;
var UIListItemString_SelfContained NewDismissListItem; // for replacing dismiss button to move to bottom of list
var UIListItemString DismissListItem;
var UIListItemString PromoteListItem;

var delegate<OnItemSelectedCallback> NextOnSelectionChanged;

var localized string strCCMenuOption;
var localized string strCCTooltip;
var string CCListItemDescription;

var config bool bDisableArmoryPromoteRookieButton;
var config bool bHideAfterActionPromoteRookieButton;
var config bool bDisableAfterActionPromoteRookieButton;

delegate OnItemSelectedCallback(UIList _list, int itemIndex);

event OnInit(UIScreen Screen)
{
	local UIPanel BG;
	local XComGameState_Unit Unit;
	local name Psi, Spark;

	if(UIArmory_MainMenu(Screen) != none)
	{
		ParentScreen = UIArmory_Mainmenu(Screen); 

		Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ParentScreen.UnitReference.ObjectID));

		Psi= name("PsiOperative");
		Spark= name("Spark");

		//update mousewheel controls so that mousewheel moves scrollbar when over list
		if(ParentScreen != none)
		{
				BG = ParentScreen.Spawn(class'UIPanel', ParentScreen).InitPanel('armoryMenuBG');
				BG.bShouldPlayGenericUIAudioEvents = false;  
				BG.ProcessMouseEvents(ParentScreen.List.OnChildMouseEvent); // hook mousewheel to scroll MainMenu list instead of rotating soldier
		}

		if(Unit.GetSoldierClassTemplate().DataName==Psi||Unit.GetSoldierClassTemplate().DataName==Spark)
		{
			`log("Class is "@Unit.GetSoldierClassTemplate().DataName@"Aborting");
			return;
		}

		else if (Unit.GetRank()==0 && Unit.CanRankUpSoldier()) 
		{
			NextOnSelectionChanged = ParentScreen.List.OnSelectionChanged;
			ParentScreen.List.OnSelectionChanged = OnSelectionChanged;

			InsertCCListButton(Unit);
		}
	}

	if(UIAfterAction(Screen) != none && (bHideAfterActionPromoteRookieButton || bDisableAfterActionPromoteRookieButton))
		HideDisablePromoteButtons(Screen);
}

event OnReceiveFocus(UIScreen Screen)
{
	local XComGameState_Unit Unit;
	local name Psi, Spark;

	if(UIArmory_MainMenu(Screen) != none)
	{
		ParentScreen = UIArmory_Mainmenu(Screen);
		Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ParentScreen.UnitReference.ObjectID));

		Psi= name("PsiOperative");
		Spark= name("Spark");

		if(Unit.GetSoldierClassTemplate().DataName==Psi||Unit.GetSoldierClassTemplate().DataName==Spark)
		{
			`log("Class is "@Unit.GetSoldierClassTemplate().DataName@"Aborting");
			return;
		}

		else if (Unit.GetRank()==0 && Unit.CanRankUpSoldier()) 
		{
			InsertCCListButton(Unit);
		}
	}

	if(UIAfterAction(Screen) != none && (bHideAfterActionPromoteRookieButton || bDisableAfterActionPromoteRookieButton))
		HideDisablePromoteButtons(Screen);
}

event OnLoseFocus(UIScreen Screen);

event OnRemoved(UIScreen Screen)
{
	//clear reference to UIScreen so it can be garbage collected
	if(UIArmory_MainMenu(Screen) != none || UIAfterAction(Screen) != none)
		ParentScreen = none;
}

simulated function HideDisablePromoteButtons(UIScreen Screen)
{
	local int SlotIndex;	//Index into the list of places where a soldier can stand in the after action scene, from left to right
	local int SquadIndex;	//Index into the HQ's squad array, containing references to unit state objects
	local int ListItemIndex;//Index into the array of list items the player can interact with to view soldier status and promote
	local UIAfterAction_ListItem ListItem;
	local UIList m_kSlotList;
	local UIAfterAction AfterActionScreen;
	local XComGameState_Unit Unit;

	AfterActionScreen = UIAfterAction(Screen);
	m_kSlotList = AfterActionScreen.m_kSlotList;

	//`log("SCREENLISTENER ONINIT");

	ListItemIndex = 0;
	for (SlotIndex = 0; SlotIndex < AfterActionScreen.SlotListOrder.Length; ++SlotIndex)
	{
		//`log("in for loop");
		SquadIndex = AfterActionScreen.SlotListOrder[SlotIndex];
		if (SquadIndex < AfterActionScreen.XComHQ.Squad.Length)
		{	
			if (AfterActionScreen.XComHQ.Squad[SquadIndex].ObjectID > 0)
			{
				Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AfterActionScreen.XComHQ.Squad[SquadIndex].ObjectID));
				//`log("Unit rank is" @ Unit.GetRank());
				if(Unit.GetRank()==0 && Unit.CanRankUpSoldier() && Unit.isAlive())
				{
					//`log("Looking for listitem");
					if (m_kSlotList.itemCount > ListItemIndex)
					{
						//`log("listitem found?");
						ListItem = UIAfterAction_ListItem(m_kSlotList.GetItem(ListItemIndex));
						if(bHideAfterActionPromoteRookieButton)
						{
							ListItem.PromoteButton.Hide();
							//`log("promote button hidden");
						}
						else if(bDisableAfterActionPromoteRookieButton)
						{
							ListItem.PromoteButton.DisableButton();
							//`log("promote button disabled");
						}
					}
				}
				++ListItemIndex;
			}
		}
	}
}

simulated function InsertCCListButton(XComGameState_Unit Unit)
{
	DismissListItem = FindDismissListItem(ParentScreen.List);
	DismissListItem.Hide(); // TODO: change this to remove if remove glitches for UIList is fixed
	AddListButton();
	CreateDismissButton(Unit);
	ParentScreen.List.MoveItemToBottom(DismissListItem);
	if(bDisableArmoryPromoteRookieButton)
	{
		PromoteListItem = FindPromoteListItem(ParentScreen.List);
		PromoteListItem.DisableListItem();
	}
}

//adds a button to the existing MainMenu list
simulated function AddListButton()
{
	local string PromoteIcon;

	CCListItem = UIListItemString_SelfContained(ParentScreen.Spawn(class'UIListItemString_SelfContained', ParentScreen.List.ItemContainer).InitListItem(Caps(strCCMenuOption)).SetDisabled(false, strCCTooltip));
	CCListItem.SetButtonBGClickHander (OnCCButtonCallback);

	PromoteIcon = class'UIUtilities_Text'.static.InjectImage(class'UIUtilities_Image'.const.HTML_PromotionIcon, 20, 20, 0) $ " ";
	CCListItem.SetText(PromoteIcon $ Caps(strCCMenuOption));
}

simulated function CreateDismissButton(XComGameState_Unit Unit)
{
	local bool bTutorialObjectInProgress, bInTutorialPromote, bUnitIsTraining, bCantDismiss;

	bInTutorialPromote = !class'XComGameState_HeadquartersXCom'.static.IsObjectiveCompleted('T0_M2_WelcomeToArmory');
	bTutorialObjectInProgress = class'XComGameState_HeadquartersXCom'.static.AnyTutorialObjectivesInProgress();
	bUnitIsTraining = Unit.IsTraining() || Unit.IsPsiTraining() || Unit.IsPsiAbilityTraining();

	bCantDismiss = bInTutorialPromote || bTutorialObjectInProgress || bUnitIsTraining;

	NewDismissListItem = UIListItemString_SelfContained(ParentScreen.Spawn(class'UIListItemString_SelfContained', ParentScreen.List.ItemContainer).InitListItem(ParentScreen.m_strDismiss).SetDisabled(bCantDismiss, strCCTooltip));
	NewDismissListItem.SetButtonBGClickHander (OnDismissButtonCallback);
}


simulated function OnCCButtonCallback(UIButton kButton)
{
	local XComHQPresentationLayer HQPres;
	local UIChooseClass_CommandersChoice ChooseClassScreen;
	local XcomGameState_Unit Unit;

	Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ParentScreen.UnitReference.ObjectID));
	HQPres = `HQPRES;
	ChooseClassScreen = UIChooseClass_CommandersChoice(HQPres.ScreenStack.Push(HQPres.Spawn(class'UIChooseClass_CommandersChoice', HQPres), HQPres.Get3DMovie()));
	ChooseClassScreen.ParentScreen=ParentScreen;
	ChooseClassScreen.Unit=Unit;
}

//callback handler for list button -- invokes the base-game dismiss functionality
simulated function OnDismissButtonCallback(UIButton kButton)
{
	ParentScreen.OnDismissUnit();
}

simulated function OnSelectionChanged(UIList ContainerList, int ItemIndex)
{
	if (ContainerList.GetItem(ItemIndex) == CCListitem) 
	{
		ParentScreen.MC.ChildSetString("descriptionText", "htmlText", class'UIUtilities_Text'.static.AddFontInfo(CCListItemDescription, true));
		return;
	}
	if (ContainerList.GetItem(ItemIndex) == DismissListitem) 
	{
		ParentScreen.MC.ChildSetString("descriptionText", "htmlText", class'UIUtilities_Text'.static.AddFontInfo(ParentScreen.m_strDismissDesc, true));
		return;
	}
	NextOnSelectionChanged(ContainerList, ItemIndex);
}

simulated function UIListItemString FindDismissListItem(UIList List)
{
	local int Idx;
	local UIListItemString Current;

	for (Idx = 0; Idx < List.ItemCount ; Idx++)
	{
		Current = UIListItemString(List.GetItem(Idx));
		//`log("Dismiss Search: Text=" $ Current.Text $ ", DismissName=" $ ParentScreen.m_strDismiss);
		if (Current.Text == ParentScreen.m_strDismiss)
			return Current;
	}
	return none;
}

simulated function UIListItemString FindPromoteListItem(UIList List)
{
	local int Idx;
	local String PromoteIcon, strPromote;
	local UIListItemString Current;

	PromoteIcon="<img src='promote_icon' width='20' height='20'>";
	strPromote=PromoteIcon @ ParentScreen.m_strPromote;

	for (Idx = 0; Idx < List.ItemCount ; Idx++)
	{
		Current = UIListItemString(List.GetItem(Idx));
		//`log("Promote Search: Text=" $ Current.Text $ ", PromoteName=" $ strPromote);
		if (Current.Text == strPromote)
			return Current;
	}
	return none;
}

defaultproperties
{
	ScreenClass=none; //conditional filter in Event calls
}