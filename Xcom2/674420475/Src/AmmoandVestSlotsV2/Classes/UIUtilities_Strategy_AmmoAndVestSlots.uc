// This is an Unreal Script
class UIUtilities_Strategy_AmmoAndVestSlots extends UIUtilities_Strategy;

simulated static function array<XComGameState_Item> GetEquippedItemsInSlot(XComGameState_Unit Unit, EInventorySlot SlotType, optional XComGameState CheckGameState)
{
	local StateObjectReference ItemRef;
	local XComGameState_Item ItemState;
	local X2EquipmentTemplate EquipmentTemplate;
	local array<XComGameState_Item> arrItems;

	foreach Unit.InventoryItems(ItemRef)
	{
		ItemState = Unit.GetItemGameState(ItemRef, CheckGameState);
		EquipmentTemplate = X2EquipmentTemplate(ItemState.GetMyTemplate());

		// xpad is only item with size 0, that is always equipped
		if (ItemState.GetItemSize() > 0 && (ItemState.InventorySlot == SlotType || (EquipmentTemplate != None && EquipmentTemplate.InventorySlot == SlotType)))
		{
			// Ignore any items in the grenade pocket when checking for utility items, since otherwise grenades get added as utility items
			if (SlotType == eInvSlot_Utility)
			{
				if (ItemState.InventorySlot != eInvSlot_GrenadePocket && ItemState.InventorySlot != eInvSlot_AmmoPocket)
					arrItems.AddItem(ItemState);
			}
/*			else if (SlotType == eInvSlot_Unknown)
			{
				if (ItemState.InventorySlot != eInvSlot_GrenadePocket && ItemState.InventorySlot != eInvSlot_Utility && ItemState.InventorySlot != eInvSlot_AmmoPocket)
					arrItems.AddItem(ItemState);
			}*/
			else if (SlotType == eInvSlot_AmmoPocket)
			{
				if (ItemState.InventorySlot != eInvSlot_GrenadePocket && ItemState.InventorySlot != eInvSlot_Utility)
					arrItems.AddItem(ItemState);
			}
			else 
				arrItems.AddItem(ItemState);
		}
	}
	
	return arrItems;
}