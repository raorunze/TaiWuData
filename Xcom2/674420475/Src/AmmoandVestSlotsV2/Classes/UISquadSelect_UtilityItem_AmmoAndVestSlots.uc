// This is an Unreal Script
class UISquadSelect_UtilityItem_AmmoAndVestSlots extends UISquadSelect_UtilityItem
			config(AmmoAndVestSlotsV2);

var config string AMMO_ICON;
var config string VEST_ICON;

var localized string VestSlot;

simulated function SetSlotType(EInventorySlot InventorySlot)
{
	switch(InventorySlot)
	{
	case eInvSlot_AmmoPocket:
		Image.LoadImage("img:///AVS_UILibrary_StrategyImages.X2InventoryIcons." $ default.AMMO_ICON);
		Image.SetScale(0.4);
		Image.Show();
		//SlotTypeText.SetText(AmmoSlot);
		//SlotTypeText.Show();
		break;
/*	case eInvSlot_VestSlot:
		Image.LoadImage("img:///AVS_UILibrary_StrategyImages.X2InventoryIcons." $ default.VEST_ICON);
		Image.SetScale(0.4);
		Image.Show();
		//SlotTypeText.SetText(VestSlot);
		//SlotTypeText.Show();
		break;*/
	case eInvSlot_GrenadePocket:
		SlotTypeText.SetText(GrenadeSlot);
		SlotTypeText.Show();
		break;
	default:
		SlotTypeText.Hide();
	}
}

simulated function SetAvailable(XComGameState_Item Item, EInventorySlot InventorySlot, optional int Index, optional int NumSlots )
{
	SlotIndex = Index;
	SlotType = InventorySlot;
	Button.EnableButton();

	SetItemImage(Item, NumSlots);

	if(Item != none)
		SlotTypeText.Hide();
	else
		SetSlotType(InventorySlot);
}

simulated function GoToUtilityItem()
{
	`HQPRES.UIArmory_Loadout(UISquadSelect_ListItem_AmmoAndVestSlots(GetParent(class'UISquadSelect_ListItem_AmmoAndVestSlots')).GetUnitRef(), CannotEditSlots);
	
	if (CannotEditSlots.Find(eInvSlot_Utility) == INDEX_NONE)
	{
		UIArmory_Loadout_AmmoAndVestSlots(Movie.Stack.GetScreen(class'UIArmory_Loadout_AmmoAndVestSlots')).SelectItemSlot(SlotType, SlotIndex);
		//DelayAction();
	}
}

event DelayAction()
{
	SetTimer(0.7f);	
}

function Timer()
{
	UIArmory_Loadout_AmmoAndVestSlots(Movie.Stack.GetScreen(class'UIArmory_Loadout_AmmoAndVestSlots')).SelectItemSlot(SlotType, SlotIndex);
}