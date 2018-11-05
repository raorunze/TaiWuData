class X2Item_DefaultUtilityItems_AVS extends X2Item
	config(AmmoAndVestSlotsV2);

var config bool XCOM_SHIRT_ENABLED;
var config bool VEST_SLOT_ICON_ENABLED;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Items;

	if(default.XCOM_SHIRT_ENABLED)
	{
		Items.AddItem(CreateXcomShirt());
	}

	if(default.VEST_SLOT_ICON_ENABLED)
	{
		Items.AddItem(CreateVestSlotIconItem());
	}


	return Items;
}

static function X2DataTemplate CreateXcomShirt()
{
	local X2EquipmentTemplate Template;

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'XcomShirt');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///AVS_UILibrary_StrategyImages.X2InventoryIcons.avs_xcom_shirt";
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.Abilities.AddItem('XcomShirtBonus');

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	Template.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, class'X2Ability_ItemGrantedAbilitySet_AVS'.default.XCOM_SHIRT_WILL_BONUS);

	return Template;
}

static function X2DataTemplate CreateVestSlotIconItem()
{
	local X2EquipmentTemplate Template;

	

	`CREATE_X2TEMPLATE(class'X2EquipmentTemplate', Template, 'VestSlotIcon');
	Template.ItemCat = 'defense';
	Template.InventorySlot = eInvSlot_Utility;
	Template.strImage = "img:///AVS_UILibrary_StrategyImages.X2InventoryIcons." $ class'UISquadSelect_UtilityItem_AmmoAndVestSlots'.default.VEST_ICON;
	Template.EquipSound = "StrategyUI_Vest_Equip";

	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}