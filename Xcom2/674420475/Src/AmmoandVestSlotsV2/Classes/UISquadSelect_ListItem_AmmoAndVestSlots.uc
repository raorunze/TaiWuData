// This is an Unreal Script
class UISquadSelect_ListItem_AmmoAndVestSlots extends UISquadSelect_ListItem
		config(AmmoAndVestSlotsV2);

simulated function UpdateData(optional int Index = -1, optional bool bDisableEdit, optional bool bDisableDismiss, optional bool bDisableLoadout, optional array<EInventorySlot> CannotEditSlotsList)
{
	local bool bCanPromote;
	local string ClassStr, NameStr;
	local int i, NumUtilitySlots, UtilityItemIndex, NumUnitUtilityItems;
	local float UtilityItemWidth, UtilityItemHeight;
	local UISquadSelect_UtilityItem_AmmoAndVestSlots UtilityItem;
	local array<XComGameState_Item> EquippedItems;
	local XComGameState_Unit Unit;
	local XComGameState_Item PrimaryWeapon, HeavyWeapon;
	local X2WeaponTemplate PrimaryWeaponTemplate, HeavyWeaponTemplate;
	local X2AbilityTemplate HeavyWeaponAbilityTemplate;
	local X2AbilityTemplateManager AbilityTemplateManager;


	//`LOG("AAV: ListItem UpdateData");
	if(bDisabled)
		return;

	SlotIndex = Index != -1 ? Index : SlotIndex;

	bDisabledEdit = bDisableEdit;
	bDisabledDismiss = bDisableDismiss;
	bDisabledLoadout = bDisableLoadout;
	CannotEditSlots = CannotEditSlotsList;

	if( UtilitySlots == none )
	{
		UtilitySlots = Spawn(class'UIList', DynamicContainer).InitList(, 0, 138, 282, 70, true);
		UtilitySlots.bStickyHighlight = false;
		UtilitySlots.ItemPadding = 5;
	}

	if( AbilityIcons == none )
	{
		AbilityIcons = Spawn(class'UIPanel', DynamicContainer).InitPanel().SetPosition(4, 92);
		AbilityIcons.Hide(); // starts off hidden until needed
	}

	// -------------------------------------------------------------------------------------------------------------

	// empty slot
	if(GetUnitRef().ObjectID <= 0)
	{
		AS_SetEmpty(m_strSelectUnit);
		AS_SetUnitHealth(-1, -1);

		AbilityIcons.Remove();
		AbilityIcons = none;

		DynamicContainer.Hide();
		if( !Movie.IsMouseActive() )
			HandleEmptyListItemFocus();
	}
	else
	{
		Unit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(GetUnitRef().ObjectID));
		bCanPromote = (Unit.ShowPromoteIcon());

		UtilitySlots.Show();
		DynamicContainer.Show();
		//Backpack controlled separately by the heavy weapon info. 

//		if( Navigator.SelectedIndex == -1 )
//			Navigator.SelectFirstAvailable();

		NumUtilitySlots = 2;
		if(Unit.HasGrenadePocket()) NumUtilitySlots++;

		NumUnitUtilityItems = Unit.GetCurrentStat(eStat_UtilityItems); // Check how many utility items this unit can use

		if(class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_AMMO_POCKET) NumUtilitySlots++;

		if(class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_VEST_SLOT) NumUtilitySlots++;
		
		UtilityItemWidth = (UtilitySlots.GetTotalWidth() - (UtilitySlots.ItemPadding * (NumUtilitySlots - 1))) / NumUtilitySlots;
		UtilityItemHeight = UtilitySlots.Height;

		if(UtilitySlots.ItemCount != NumUtilitySlots)
			UtilitySlots.ClearItems();

		for(i = 0; i < NumUtilitySlots; ++i)
		{
			if(i >= UtilitySlots.ItemCount)
			{
				UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.CreateItem(class'UISquadSelect_UtilityItem_AmmoAndVestSlots').InitPanel());
				UtilityItem.SetSize(UtilityItemWidth, UtilityItemHeight);
				UtilityItem.CannotEditSlots = CannotEditSlotsList;
				UtilitySlots.OnItemSizeChanged(UtilityItem);
			}
		}
		
		UtilityItemIndex = 0;

		UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.GetItem(UtilityItemIndex++));

		`LOG("AVS: NumUnitUtilityItems " @NumUnitUtilityItems);

		if (NumUnitUtilityItems > 0)
		{
			EquippedItems = class'UIUtilities_Strategy_AmmoAndVestSlots'.static.GetEquippedItemsInSlot(Unit, eInvSlot_Utility);
			if (bDisableLoadout)
				UtilityItem.SetDisabled(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_Utility, 0, NumUtilitySlots);
			else
				UtilityItem.SetAvailable(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_Utility, 0, NumUtilitySlots);
		}
		else
		{
			UtilityItem.SetLocked(m_strNoUtilitySlots); // If the unit has no utility slots allowed, lock the slot
		}

		if(class'XComGameState_HeadquartersXCom'.static.GetObjectiveStatus('T0_M5_EquipMedikit') == eObjectiveState_InProgress)
		{
			// spawn the attention icon externally so it draws on top of the button and image 
			Spawn(class'UIPanel', UtilityItem).InitPanel('attentionIconMC', class'UIUtilities_Controls'.const.MC_AttentionIcon)
			.SetPosition(2, 4)
			.SetSize(70, 70); //the animated rings count as part of the size. 
		} else if(GetChildByName('attentionIconMC', false) != none) {
			GetChildByName('attentionIconMC').Remove();
		}

		if(class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_VEST_SLOT)
		{
			UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.GetItem(UtilityItemIndex++));
			EquippedItems = class'UIUtilities_Strategy_AmmoAndVestSlots'.static.GetEquippedItemsInSlot(Unit, eInvSlot_Utility);
			if (bDisableLoadout)
				UtilityItem.SetDisabled(EquippedItems.Length > 1 ? EquippedItems[1] : none, eInvSlot_Utility, 1, NumUtilitySlots);
			else if(NumUnitUtilityItems < 2)
				UtilityItem.SetLocked(m_strNoUtilitySlots);
			else
				UtilityItem.SetAvailable(EquippedItems.Length > 1 ? EquippedItems[1] : none, eInvSlot_Utility, 1, NumUtilitySlots);
		}

		UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.GetItem(UtilityItemIndex++));

		if (Unit.HasExtraUtilitySlot())
		{
			if (bDisableLoadout)
				UtilityItem.SetDisabled(EquippedItems.Length > UtilityItemIndex - 1 ? EquippedItems[UtilityItemIndex - 1] : none, eInvSlot_Utility, UtilityItemIndex - 1, NumUtilitySlots);
			else if(NumUnitUtilityItems < 3 && class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_VEST_SLOT)
				UtilityItem.SetLocked(m_strNoUtilitySlots);
			else if(NumUnitUtilityItems < 2 && !class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_VEST_SLOT)
				UtilityItem.SetLocked(m_strNoUtilitySlots);
			else
				UtilityItem.SetAvailable(EquippedItems.Length > UtilityItemIndex - 1 ? EquippedItems[UtilityItemIndex - 1] : none, eInvSlot_Utility, UtilityItemIndex - 1, NumUtilitySlots);
		}
		else
			UtilityItem.SetLocked(NumUnitUtilityItems > 0 ? m_strNeedsMediumArmor : m_strNoUtilitySlots);

		if(Unit.HasGrenadePocket())
		{
			UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.GetItem(UtilityItemIndex++));
			EquippedItems = class'UIUtilities_Strategy'.static.GetEquippedItemsInSlot(Unit, eInvSlot_GrenadePocket); 
			if (bDisableLoadout)
				UtilityItem.SetDisabled(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_GrenadePocket, 0, NumUtilitySlots);
			else
				UtilityItem.SetAvailable(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_GrenadePocket, 0, NumUtilitySlots);
		}

		if(class'UIArmory_Loadout_AmmoAndVestSlots'.default.bHAS_AMMO_POCKET)
		{
			UtilityItem = UISquadSelect_UtilityItem_AmmoAndVestSlots(UtilitySlots.GetItem(UtilityItemIndex++));
			EquippedItems = class'UIUtilities_Strategy_AmmoAndVestSlots'.static.GetEquippedItemsInSlot(Unit, eInvSlot_AmmoPocket);
			if (bDisableLoadout)
				UtilityItem.SetDisabled(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_AmmoPocket, 0, NumUtilitySlots);
			else if(NumUnitUtilityItems == 0 && class'UIArmory_Loadout_AmmoAndVestSlots'.default.bSparks_Ammo_Pocket)
				UtilityItem.SetAvailable(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_AmmoPocket, 0, NumUtilitySlots);
			else if(NumUnitUtilityItems == 0 && !class'UIArmory_Loadout_AmmoAndVestSlots'.default.bSparks_Ammo_Pocket)
				UtilityItem.SetLocked(m_strNoUtilitySlots);
			else
				UtilityItem.SetAvailable(EquippedItems.Length > 0 ? EquippedItems[0] : none, eInvSlot_AmmoPocket, 0, NumUtilitySlots);
		}

		// Don't show class label for rookies since their rank is shown which would result in a duplicate string
		if(Unit.GetRank() > 0)
			ClassStr = class'UIUtilities_Text'.static.GetColoredText(Caps(Unit.GetSoldierClassTemplate().DisplayName), eUIState_Faded, 17);
		else
			ClassStr = "";

		PrimaryWeapon = Unit.GetItemInSlot(eInvSlot_PrimaryWeapon);
		if(PrimaryWeapon != none)
		{
			PrimaryWeaponTemplate = X2WeaponTemplate(PrimaryWeapon.GetMyTemplate());
		}

		NameStr = Unit.GetName(eNameType_Last);
		if (NameStr == "") // If the unit has no last name, display their first name instead
		{
			NameStr = Unit.GetName(eNameType_First);
		}

		// TUTORIAL: Disable buttons if tutorial is enabled
		if(bDisableEdit)
			MC.FunctionVoid("disableEdit");
		if(bDisableDismiss)
			MC.FunctionVoid("disableDismiss");
		bEditDisabled = bDisableEdit; //Used in controller nav
		bDismissDisabled = bDisableDismiss; //used in controller nav

		AS_SetFilled( class'UIUtilities_Text'.static.GetColoredText(Caps(class'X2ExperienceConfig'.static.GetRankName(Unit.GetRank(), Unit.GetSoldierClassTemplateName())), eUIState_Normal, 18),
					  class'UIUtilities_Text'.static.GetColoredText(Caps(NameStr), eUIState_Normal, 22),
					  class'UIUtilities_Text'.static.GetColoredText(Caps(Unit.GetName(eNameType_Nick)), eUIState_Header, 28),
					  Unit.GetSoldierClassTemplate().IconImage, class'UIUtilities_Image'.static.GetRankIcon(Unit.GetRank(), Unit.GetSoldierClassTemplateName()),
					  class'UIUtilities_Text'.static.GetColoredText(m_strEdit, bDisableEdit ? eUIState_Disabled : eUIState_Normal),
					  class'UIUtilities_Text'.static.GetColoredText(m_strDismiss, bDisableDismiss ? eUIState_Disabled : eUIState_Normal),
					  class'UIUtilities_Text'.static.GetColoredText(PrimaryWeaponTemplate.GetItemFriendlyName(PrimaryWeapon.ObjectID), bDisableLoadout ? eUIState_Disabled : eUIState_Normal),
					  class'UIUtilities_Text'.static.GetColoredText(class'UIArmory_loadout'.default.m_strInventoryLabels[eInvSlot_PrimaryWeapon], bDisableLoadout ? eUIState_Disabled : eUIState_Normal),
					  class'UIUtilities_Text'.static.GetColoredText(GetHeavyWeaponName(), bDisableLoadout ? eUIState_Disabled : eUIState_Normal),
					  class'UIUtilities_Text'.static.GetColoredText(GetHeavyWeaponDesc(), bDisableLoadout ? eUIState_Disabled : eUIState_Normal),
					  (bCanPromote ? m_strPromote : ""), Unit.IsPsiOperative() || (Unit.HasPsiGift() && Unit.GetRank() < 2), ClassStr);

		
		AS_SetUnitHealth(class'UIUtilities_Strategy'.static.GetUnitCurrentHealth(Unit), class'UIUtilities_Strategy'.static.GetUnitMaxHealth(Unit));
		

		PsiMarkup.SetVisible(Unit.HasPsiGift());

		HeavyWeapon = Unit.GetItemInSlot(eInvSlot_HeavyWeapon);
		if(HeavyWeapon != none)
		{
			HeavyWeaponTemplate = X2WeaponTemplate(HeavyWeapon.GetMyTemplate());

			// Only show one icon for heavy weapon abilities
			if(HeavyWeaponTemplate.Abilities.Length > 0)
			{
				AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
				HeavyWeaponAbilityTemplate = AbilityTemplateManager.FindAbilityTemplate(HeavyWeaponTemplate.Abilities[0]);
				if(HeavyWeaponAbilityTemplate != none)
					Spawn(class'UIIcon', AbilityIcons).InitIcon(, HeavyWeaponAbilityTemplate.IconImage, false);
			}

			AbilityIcons.Show();
			AS_HasHeavyWeapon(true);
		}
		else
		{
			AbilityIcons.Hide();
			AS_HasHeavyWeapon(false);
		}
	}
	RefreshFocus();
	//bsg-cballinger (7.8.16): disable update optimization on SquadSelect for now (dirty is now always set). Causes items to not update properly on the SquadSelect screen when changes are made to the squad loadout

}