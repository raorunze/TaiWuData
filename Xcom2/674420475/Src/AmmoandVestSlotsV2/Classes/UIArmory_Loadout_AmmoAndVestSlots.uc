// This is an Unreal Script
class UIArmory_Loadout_AmmoAndVestSlots extends UIArmory_Loadout
				config(AmmoAndVestSlotsV2);

var config bool bHAS_AMMO_POCKET;
var config bool bHAS_VEST_SLOT;
var config bool bSparks_Ammo_Pocket;

simulated function UpdateEquippedList()
{
	local int i, numUtilityItems;
	local UIArmory_LoadoutItem Item;
	local array<XComGameState_Item> UtilityItems;
	local XComGameState_Unit UpdatedUnit;
	local int prevIndex;

	prevIndex = EquippedList.SelectedIndex;
	UpdatedUnit = GetUnit();
	EquippedList.ClearItems();

	// Clear out tooltips from removed list items
	Movie.Pres.m_kTooltipMgr.RemoveTooltipsByPartialPath(string(EquippedList.MCPath));

	// units can only have one item equipped in the slots below
	Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
	if (CannotEditSlotsList.Find(eInvSlot_Armor) != INDEX_NONE)
		Item.InitLoadoutItem(GetEquippedItem(eInvSlot_Armor), eInvSlot_Armor, true, m_strCannotEdit);
	else
		Item.InitLoadoutItem(GetEquippedItem(eInvSlot_Armor), eInvSlot_Armor, true);

	Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
	if (CannotEditSlotsList.Find(eInvSlot_PrimaryWeapon) != INDEX_NONE)
		Item.InitLoadoutItem(GetEquippedItem(eInvSlot_PrimaryWeapon), eInvSlot_PrimaryWeapon, true, m_strCannotEdit);
	else
		Item.InitLoadoutItem(GetEquippedItem(eInvSlot_PrimaryWeapon), eInvSlot_PrimaryWeapon, true);

	// don't show secondary weapon slot on rookies
	if(UpdatedUnit.GetRank() > 0)
	{
		Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
		if (CannotEditSlotsList.Find(eInvSlot_SecondaryWeapon) != INDEX_NONE)
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_SecondaryWeapon), eInvSlot_SecondaryWeapon, true, m_strCannotEdit);
		else
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_SecondaryWeapon), eInvSlot_SecondaryWeapon, true);
	}

	if (UpdatedUnit.HasHeavyWeapon(CheckGameState))
	{
		Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
		if (CannotEditSlotsList.Find(eInvSlot_HeavyWeapon) != INDEX_NONE)
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_HeavyWeapon), eInvSlot_HeavyWeapon, true, m_strCannotEdit);
		else
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_HeavyWeapon), eInvSlot_HeavyWeapon, true);
	}

	// units can have multiple utility items
	numUtilityItems = GetNumAllowedUtilityItems();

	`Log("AVS : Unit is" @UpdatedUnit);

	`Log("AVS : numUtilityItems is" @numUtilityItems);

	`Log("AVS : UpdatedUnit eStat_UtilityItems is" @UpdatedUnit.GetCurrentStat(eStat_UtilityItems));
	

	UtilityItems = class'UIUtilities_Strategy'.static.GetEquippedUtilityItems(UpdatedUnit, CheckGameState);
	
	for(i = 0; i < numUtilityItems; ++i)
	{
		Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));

		if(UtilityItems.Length >= (i + 1))
		{
			if (CannotEditSlotsList.Find(eInvSlot_Utility) != INDEX_NONE)
				Item.InitLoadoutItem(UtilityItems[i], eInvSlot_Utility, true, m_strCannotEdit);
			else
				Item.InitLoadoutItem(UtilityItems[i], eInvSlot_Utility, true);
		}
		else
		{
			if (CannotEditSlotsList.Find(eInvSlot_Utility) != INDEX_NONE)
				Item.InitLoadoutItem(none, eInvSlot_Utility, true, m_strCannotEdit);
			else
				Item.InitLoadoutItem(none, eInvSlot_Utility, true);
		}
	}

	if (UpdatedUnit.HasGrenadePocket())
	{
		Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
		if (CannotEditSlotsList.Find(eInvSlot_GrenadePocket) != INDEX_NONE)
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_GrenadePocket), eInvSlot_GrenadePocket, true, m_strCannotEdit);
		else
			Item.InitLoadoutItem(GetEquippedItem(eInvSlot_GrenadePocket), eInvSlot_GrenadePocket, true);
	}

	`Log("AVS : Unit has ammo pocket:" @default.bHAS_AMMO_POCKET);

	`Log("AVS : Sparks have ammo pockets:" @default.bSparks_Ammo_Pocket);

	if(default.bSparks_Ammo_Pocket || UpdatedUnit.GetCurrentStat(eStat_UtilityItems) > 0)
	{
		if (default.bHAS_AMMO_POCKET)
		{
			Item = UIArmory_LoadoutItem(EquippedList.CreateItem(class'UIArmory_LoadoutItem'));
			if (CannotEditSlotsList.Find(eInvSlot_AmmoPocket) != INDEX_NONE)
				Item.InitLoadoutItem(GetEquippedItem(eInvSlot_AmmoPocket), eInvSlot_AmmoPocket, true, m_strCannotEdit);
			else
				Item.InitLoadoutItem(GetEquippedItem(eInvSlot_AmmoPocket), eInvSlot_AmmoPocket, true);
		}
	}
	EquippedList.SetSelectedIndex(prevIndex < EquippedList.ItemCount ? prevIndex : 0);
}

simulated function bool ShowInLockerList(XComGameState_Item Item, EInventorySlot SelectedSlot)
{
	local X2ItemTemplate ItemTemplate;
	local X2GrenadeTemplate GrenadeTemplate;
	local X2EquipmentTemplate EquipmentTemplate;

	ItemTemplate = Item.GetMyTemplate();
	
	if(MeetsAllStrategyRequirements(ItemTemplate.ArmoryDisplayRequirements) && MeetsDisplayRequirement(ItemTemplate))
	{
		switch(SelectedSlot)
		{
		case eInvSlot_GrenadePocket:
			GrenadeTemplate = X2GrenadeTemplate(ItemTemplate);
			return GrenadeTemplate != none;
		case eInvSlot_AmmoPocket:
			return ItemTemplate.ItemCat == 'ammo';
/*		case eInvSlot_Unknown:
			return ItemTemplate.ItemCat == 'defense';*/
		default:
			EquipmentTemplate = X2EquipmentTemplate(ItemTemplate);
			// xpad is only item with size 0, that is always equipped
			/*if(ItemTemplate.ItemCat == 'defense' && default.bHAS_VEST_SLOT)
				return false;
			else*/
			if(ItemTemplate.ItemCat == 'ammo' && default.bHAS_AMMO_POCKET)
				return false;
			else
				return (EquipmentTemplate != none && EquipmentTemplate.iItemSize > 0 && EquipmentTemplate.InventorySlot == SelectedSlot);
		}
	}

	return false;
}

simulated function bool EquipItem(UIArmory_LoadoutItem Item)
{
	local StateObjectReference PrevItemRef, NewItemRef;
	local XComGameState_Item PrevItem, NewItem;
	local bool CanEquip, EquipSucceeded, AddToFront;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComNarrativeMoment EquipNarrativeMoment;
	local XGWeapon Weapon;
	local array<XComGameState_Item> PrevUtilityItems;
	local XComGameState_Unit UpdatedUnit;
	local XComGameState UpdatedState;

	UpdatedState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Equip Item");
	UpdatedUnit = XComGameState_Unit(UpdatedState.CreateStateObject(class'XComGameState_Unit', GetUnit().ObjectID));
	UpdatedState.AddStateObject(UpdatedUnit);
	
	PrevUtilityItems = class'UIUtilities_Strategy'.static.GetEquippedUtilityItems(UpdatedUnit, UpdatedState);

	NewItemRef = Item.ItemRef;
	PrevItemRef = UIArmory_LoadoutItem(EquippedList.GetSelectedItem()).ItemRef;
	PrevItem = XComGameState_Item(`XCOMHISTORY.GetGameStateForObjectID(PrevItemRef.ObjectID));

	if(PrevItem != none)
	{
		PrevItem = XComGameState_Item(UpdatedState.CreateStateObject(class'XComGameState_Item', PrevItem.ObjectID));
		`LOG("AVS:  Previuos item is" @ PrevItem);
		UpdatedState.AddStateObject(PrevItem);
	}

	foreach UpdatedState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(UpdatedState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		UpdatedState.AddStateObject(XComHQ);
	}

	// Attempt to remove previously equipped primary or secondary weapons - NOT WORKING, TODO FIX ME
	if( PrevItem != none && 
		X2WeaponTemplate(PrevItem.GetMyTemplate()) != none && 
		X2WeaponTemplate(PrevItem.GetMyTemplate()).InventorySlot == eInvSlot_PrimaryWeapon || 
		X2WeaponTemplate(PrevItem.GetMyTemplate()).InventorySlot == eInvSlot_SecondaryWeapon)
	{
		Weapon = XGWeapon(PrevItem.GetVisualizer());
		// Weapon must be graphically detach, otherwise destroying it leaves a NULL component attached at that socket
		XComUnitPawn(ActorPawn).DetachItem(Weapon.GetEntity().Mesh);

		Weapon.Destroy();
	}


	//`LOG("AAV MOD: Checking if CanEquip .");

	// Bypassing the fact that ammopocket cannot be used by default
	if(default.bSparks_Ammo_Pocket || UpdatedUnit.GetCurrentStat(eStat_UtilityItems) > 0)
	{
		if(GetSelectedSlot() == eInvSlot_AmmoPocket && default.bHAS_AMMO_POCKET)
		{
			UpdatedUnit.bIgnoreItemEquipRestrictions = true;
			//`LOG("AAV MOD: Ammo detected, forcing true .");
		}
		else
		{
			//`LOG("AAV MOD: Something Else .");
		}
	}

	CanEquip = ((PrevItem == none || UpdatedUnit.RemoveItemFromInventory(PrevItem, UpdatedState)) && UpdatedUnit.CanAddItemToInventory(Item.ItemTemplate, GetSelectedSlot(), UpdatedState));

	if(CanEquip)
	{
		GetItemFromInventory(UpdatedState, NewItemRef, NewItem);
		NewItem = XComGameState_Item(UpdatedState.CreateStateObject(class'XComGameState_Item', NewItem.ObjectID));
		UpdatedState.AddStateObject(NewItem);

		// Fix for TTP 473, preserve the order of Utility items
		if(PrevUtilityItems.Length > 0)
		{
			AddToFront = PrevItemRef.ObjectID == PrevUtilityItems[0].ObjectID;
		}

		//If this is an unmodified primary weapon, transfer weapon customization options from the unit.
		if (!NewItem.HasBeenModified() && GetSelectedSlot() == eInvSlot_PrimaryWeapon)
		{
			NewItem.WeaponAppearance.iWeaponTint = UpdatedUnit.kAppearance.iWeaponTint;
			NewItem.WeaponAppearance.nmWeaponPattern = UpdatedUnit.kAppearance.nmWeaponPattern;
		}
		
		EquipSucceeded = UpdatedUnit.AddItemToInventory(NewItem, GetSelectedSlot(), UpdatedState, AddToFront);

		if(default.bSparks_Ammo_Pocket || UpdatedUnit.GetCurrentStat(eStat_UtilityItems) > 0)
		{	
			if(GetSelectedSlot() == eInvSlot_AmmoPocket && default.bHAS_AMMO_POCKET)
			{
				UpdatedUnit.bIgnoreItemEquipRestrictions = false;
				//`LOG("AAV MOD: Removing ignore .");
			}
		}

		if( EquipSucceeded )
		{
			`LOG("AVS MOD: Equip Succeeded .");
			if( PrevItem != none )
			{
				XComHQ.PutItemInInventory(UpdatedState, PrevItem);
			}

			if(class'XComGameState_HeadquartersXCom'.static.GetObjectiveStatus('T0_M5_EquipMedikit') == eObjectiveState_InProgress &&
			   NewItem.GetMyTemplateName() == class'UIInventory_BuildItems'.default.TutorialBuildItem)
			{
				`XEVENTMGR.TriggerEvent('TutorialItemEquipped', , , UpdatedState);
				bTutorialJumpOut = true;
			}
		}
		else
		{
			`LOG("AVS MOD: Equip Failed.");
			if(PrevItem != none)
			{
				UpdatedUnit.AddItemToInventory(PrevItem, GetSelectedSlot(), UpdatedState);
			}

			XComHQ.PutItemInInventory(UpdatedState, NewItem);
		}
	}

	//UpdatedUnit.ValidateLoadout(UpdatedState);
	ValidateLoadout_AVS(UpdatedState, UpdatedUnit);
	`XCOMGAME.GameRuleset.SubmitGameState(UpdatedState);

	if( EquipSucceeded && X2EquipmentTemplate(Item.ItemTemplate) != none)
	{
		if(X2EquipmentTemplate(Item.ItemTemplate).EquipSound != "")
		{
			`XSTRATEGYSOUNDMGR.PlaySoundEvent(X2EquipmentTemplate(Item.ItemTemplate).EquipSound);
		}

		if(X2EquipmentTemplate(Item.ItemTemplate).EquipNarrative != "")
		{
			EquipNarrativeMoment = XComNarrativeMoment(`CONTENT.RequestGameArchetype(X2EquipmentTemplate(Item.ItemTemplate).EquipNarrative));
			XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
			if(EquipNarrativeMoment != None)
			{
				if (Item.ItemTemplate.ItemCat == 'armor')
				{
					if (XComHQ.CanPlayArmorIntroNarrativeMoment(EquipNarrativeMoment))
					{
						UpdatedState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Update Played Armor Intro List");
						XComHQ = XComGameState_HeadquartersXCom(UpdatedState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
						UpdatedState.AddStateObject(XComHQ);
						XComHQ.UpdatePlayedArmorIntroNarrativeMoments(EquipNarrativeMoment);
						`XCOMGAME.GameRuleset.SubmitGameState(UpdatedState);

						`HQPRES.UIArmorIntroCinematic(EquipNarrativeMoment.nmRemoteEvent, 'CIN_ArmorIntro_Done', UnitReference);
					}
				}
				else if (XComHQ.CanPlayEquipItemNarrativeMoment(EquipNarrativeMoment))
				{
					UpdatedState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Update Equip Item Intro List");
					XComHQ = XComGameState_HeadquartersXCom(UpdatedState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
					UpdatedState.AddStateObject(XComHQ);
					XComHQ.UpdateEquipItemNarrativeMoments(EquipNarrativeMoment);
					`XCOMGAME.GameRuleset.SubmitGameState(UpdatedState);
					
					`HQPRES.UINarrative(EquipNarrativeMoment);
				}
			}
		}	
	}

	return EquipSucceeded;
}


function ValidateLoadout_AVS(XComGameState NewGameState, XComGameState_Unit UnitState)
{
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local XComGameState_Item EquippedArmor, EquippedPrimaryWeapon, EquippedSecondaryWeapon; // Default slots
	local XComGameState_Item EquippedHeavyWeapon, EquippedGrenade, EquippedAmmo, UtilityItem; // Special slots
	local array<XComGameState_Item> EquippedUtilityItems; // Utility Slots
	local int idx;

	// Grab HQ Object
	History = `XCOMHISTORY;
	
	foreach NewGameState.IterateByClassType(class'XComGameState_HeadquartersXCom', XComHQ)
	{
		break;
	}

	if(XComHQ == none)
	{
		XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
		XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
		NewGameState.AddStateObject(XComHQ);
	}

	// Armor Slot
	EquippedArmor = UnitState.GetItemInSlot(eInvSlot_Armor, NewGameState);
	if(EquippedArmor == none)
	{
		EquippedArmor = UnitState.GetDefaultArmor(NewGameState);
		UnitState.AddItemToInventory(EquippedArmor, eInvSlot_Armor, NewGameState);
	}

	// Primary Weapon Slot
	EquippedPrimaryWeapon = UnitState.GetItemInSlot(eInvSlot_PrimaryWeapon, NewGameState);
	if(EquippedPrimaryWeapon == none)
	{
		EquippedPrimaryWeapon = UnitState.GetBestPrimaryWeapon(NewGameState);
		UnitState.AddItemToInventory(EquippedPrimaryWeapon, eInvSlot_PrimaryWeapon, NewGameState);
	}

	// Check Ammo Item compatibility (utility slot)
	EquippedUtilityItems = UnitState.GetAllItemsInSlot(eInvSlot_Utility, NewGameState, ,true);

	for(idx = 0; idx < EquippedUtilityItems.Length; idx++)
	{
		if(X2AmmoTemplate(EquippedUtilityItems[idx].GetMyTemplate()) != none && 
		   !X2AmmoTemplate(EquippedUtilityItems[idx].GetMyTemplate()).IsWeaponValidForAmmo(X2WeaponTemplate(EquippedPrimaryWeapon.GetMyTemplate())))
		{
			EquippedAmmo = XComGameState_Item(NewGameState.CreateStateObject(class'XComGameState_Item', EquippedUtilityItems[idx].ObjectID));
			NewGameState.AddStateObject(EquippedAmmo);
			UnitState.RemoveItemFromInventory(EquippedAmmo, NewGameState);
			XComHQ.PutItemInInventory(NewGameState, EquippedAmmo);
			EquippedAmmo = none;
			EquippedUtilityItems.Remove(idx, 1);
			idx--;
			`LOG("AVS: Ammo is compatible with the weapon");
		}
		else
			`LOG("AVS: Ammo is not compatible with the weapon");
	}

	// Secondary Weapon Slot
	EquippedSecondaryWeapon = UnitState.GetItemInSlot(eInvSlot_SecondaryWeapon, NewGameState);
	if(EquippedSecondaryWeapon == none && UnitState.NeedsSecondaryWeapon())
	{
		EquippedSecondaryWeapon = UnitState.GetBestSecondaryWeapon(NewGameState);
		UnitState.AddItemToInventory(EquippedSecondaryWeapon, eInvSlot_SecondaryWeapon, NewGameState);
	}
	else if(EquippedSecondaryWeapon != none && !UnitState.NeedsSecondaryWeapon())
	{
		EquippedSecondaryWeapon = XComGameState_Item(NewGameState.CreateStateObject(class'XComGameState_Item', EquippedSecondaryWeapon.ObjectID));
		NewGameState.AddStateObject(EquippedSecondaryWeapon);
		UnitState.RemoveItemFromInventory(EquippedSecondaryWeapon, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedSecondaryWeapon);
		EquippedSecondaryWeapon = none;
	}

	// Heavy Weapon Slot
	EquippedHeavyWeapon = UnitState.GetItemInSlot(eInvSlot_HeavyWeapon, NewGameState);
	if(EquippedHeavyWeapon == none && UnitState.HasHeavyWeapon(NewGameState))
	{
		EquippedHeavyWeapon = UnitState.GetBestHeavyWeapon(NewGameState);
		UnitState.AddItemToInventory(EquippedHeavyWeapon, eInvSlot_HeavyWeapon, NewGameState);
	}
	else if(EquippedHeavyWeapon != none && !UnitState.HasHeavyWeapon(NewGameState))
	{
		EquippedHeavyWeapon = XComGameState_Item(NewGameState.CreateStateObject(class'XComGameState_Item', EquippedHeavyWeapon.ObjectID));
		NewGameState.AddStateObject(EquippedHeavyWeapon);
		UnitState.RemoveItemFromInventory(EquippedHeavyWeapon, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedHeavyWeapon);
		EquippedHeavyWeapon = none;
	}

	// Grenade Pocket
	EquippedGrenade = UnitState.GetItemInSlot(eInvSlot_GrenadePocket, NewGameState);
	if(EquippedGrenade == none && UnitState.HasGrenadePocket())
	{
		EquippedGrenade = UnitState.GetBestGrenade(NewGameState);
		UnitState.AddItemToInventory(EquippedGrenade, eInvSlot_GrenadePocket, NewGameState);
	}
	else if(EquippedGrenade != none && !UnitState.HasGrenadePocket())
	{
		EquippedGrenade = XComGameState_Item(NewGameState.CreateStateObject(class'XComGameState_Item', EquippedGrenade.ObjectID));
		NewGameState.AddStateObject(EquippedGrenade);
		UnitState.RemoveItemFromInventory(EquippedGrenade, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, EquippedGrenade);
		EquippedGrenade = none;
	}

	// UtilitySlots (Already grabbed equipped)
	if(!UnitState.IsMPCharacter())
	{
		if(X2ArmorTemplate(EquippedArmor.GetMyTemplate()).bAddsUtilitySlot)
		{
			UnitState.SetBaseMaxStat(eStat_UtilityItems, UnitState.GetMyTemplate().CharacterBaseStats[eStat_UtilityItems] + 1.0f);
			UnitState.SetCurrentStat(eStat_UtilityItems, UnitState.GetMyTemplate().CharacterBaseStats[eStat_UtilityItems] + 1.0f);
		}
		else
		{
			UnitState.SetBaseMaxStat(eStat_UtilityItems, UnitState.GetMyTemplate().CharacterBaseStats[eStat_UtilityItems]);
			UnitState.SetCurrentStat(eStat_UtilityItems, UnitState.GetMyTemplate().CharacterBaseStats[eStat_UtilityItems]);
		}
	}

	// Remove Extra Utility Items
	for(idx = UnitState.GetCurrentStat(eStat_UtilityItems); idx < EquippedUtilityItems.Length; idx++)
	{
		if(idx >= EquippedUtilityItems.Length)
		{
			break;
		}

		UtilityItem = XComGameState_Item(NewGameState.CreateStateObject(class'XComGameState_Item', EquippedUtilityItems[idx].ObjectID));
		NewGameState.AddStateObject(UtilityItem);
		UnitState.RemoveItemFromInventory(UtilityItem, NewGameState);
		XComHQ.PutItemInInventory(NewGameState, UtilityItem);
		UtilityItem = none;
		EquippedUtilityItems.Remove(idx, 1);
		idx--;
	}

	// Equip Default Utility Item in first slot if needed
	while(EquippedUtilityItems.Length < 1 && UnitState.GetCurrentStat(eStat_UtilityItems) > 0)
	{
		UtilityItem = UnitState.GetBestUtilityItem(NewGameState);
		UnitState.AddItemToInventory(UtilityItem, eInvSlot_Utility, NewGameState);
		EquippedUtilityItems.AddItem(UtilityItem);
	}
}
