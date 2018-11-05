//---------------------------------------------------------------------------------------
//  FILE:   X2Item_ModExample_Weapon.uc
//  AUTHOR:  Ryan McFall
//           
//	Template classes define new game mechanics & items. In this example a weapon template
//  is created that can be used to add a new type of weapon to the XCom arsenal
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------
class X2Item_Soldier76_Rifle_Classic extends X2Item config(Weapon_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC); 


//Weapon Definitons
struct WeaponAbilitiesDefs
{
	var name AbilityName;
	var string IconOverrideName;

	structdefaultproperties
	{
		AbilityName = none;
		IconOverrideName = "";
	}
};

//Engineering Definitions
struct EngineeringBuildDefs
{
	var name ResourcesItemTemplateName;
	var int Quantity;

	structdefaultproperties
	{
		ResourcesItemTemplateName = None;
		Quantity = 0;
	}
};


//Template classes are searched for by the game when it starts. Any derived classes have their CreateTemplates function called
//on the class default object. The game expects CreateTemplates to return a list of templates that it will add to the manager
//reponsible for those types of templates. Later, these templates will be automatically picked up by the game mechanics and systems.
//=======================================================================================
// Weapon Values (_T1) -- CONVENTIONAL
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T1;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T1;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ARCHETYPEPATH_T1;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T1;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T1;


var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T1;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T1;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T1;

var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T1; //true
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T1; //false
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T1; //true


var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T1;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T1;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T1;

var config array<int> MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T1;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T1;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T1;
var config WeaponDamageValue MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T1;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T1;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T1;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T1;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T1;

//=======================================================================================
// Weapon values (_T2) --- MAGNETIC
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T2;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T2;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ARCHETYPEPATH_T2;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T2;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T2;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T2;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T2;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T2;

var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T2; //true
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T2; //false
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T2; //true

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T2;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T2;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T2;

var config array<int> MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T2;
var config WeaponDamageValue MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T2;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T2;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T2;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T2;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T2;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T2;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T2;

//=======================================================================================
// Weapon Values (_T3) --- BEAM
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T3;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T3;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ARCHETYPEPATH_T3;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T3;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T3;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T3;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T3;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T3;

var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T3; //true
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T3; //false
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T3; //true

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T3;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T3;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T3;

var config array<int> MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T3;
var config WeaponDamageValue MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T3;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T3;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T3;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T3;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T3;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T3;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T3;

//=======================================================================================
// Weapon Values (_T4) --- CHOSEN
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T4;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T4;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ARCHETYPEPATH_T4;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T4;
var config string MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T4;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T4;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T4;

var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T4;

var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T4; //true
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T4; //false
var config bool MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T4; //true

var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T4;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T4;
var config float MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T4;

var config array<int> MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T4;
var config WeaponDamageValue MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T4;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T4;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T4;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T4;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T4;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T4;
var config name MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T4;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4());

	return ModWeapons;
}

//=======================================================================================
// Secondary Weapon Template (_T1)
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1');
	Template.WeaponPanelImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T1;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T1;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T1;
	Template.WeaponTech = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T1;
	Template.strImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T1;
	Template.Tier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T1;

	Template.Abilities.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T1');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T1.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T1.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T1.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T1);

	Template.RangeAccuracy = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T1;
	Template.BaseDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T1;
	Template.Aim = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T1;
	Template.CritChance = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T1;
	Template.iClipSize = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T1;
	Template.iSoundRange = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T1;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T1;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T1;

	Template.iTypicalActionCost = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T1;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	//Abilities Loop
	if (default.Weapon_Abilities_T1.Length > 0)
	{
		//Loop until the end of the length of the array
		for (i = 0; i < default.Weapon_Abilities_T1.Length; i++)
		{
			//Add the ability name at index [i]
			Template.Abilities.AddItem(default.Weapon_Abilities_T1[i].AbilityName);
			//Check if the name at index [i] also has a IconOverrideName string. 
			//It doesn't check if the string is valid though
			if (Len(default.Weapon_Abilities_T1[i].IconOverrideName) > 0)
			{
				Template.AddAbilityIconOverride(default.Weapon_Abilities_T1[i].AbilityName, default.Weapon_Abilities_T1[i].IconOverrideName);
			}
		}
	}
	else
	{
		//Add the default abilities
		Template.Abilities.AddItem('StandardShot');
		Template.Abilities.AddItem('Overwatch');
		Template.Abilities.AddItem('OverwatchShot');
		Template.Abilities.AddItem('Reload');
		Template.Abilities.AddItem('HotLoadAmmo');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T1;
	Template.fKnockbackDamageAmount = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T1;
	Template.fKnockbackDamageRadius = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T1;

	Template.StartingItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T1;
	Template.CanBeBuilt = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T1;
	Template.bInfiniteItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T1;

	Template.CreatorTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T1; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T1; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T1);

	// Cost
	if (default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T1 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T1.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T1[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T1[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T1;	
	Template.GameArchetype = "ZZZ_OW_Weapons_Data.Archetype.WP_HPR_Classic"; 
	
	return Template;
}

//=======================================================================================
// Secondary Weapon Template (_T2) --- MAGNETIC
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2');
	Template.WeaponPanelImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T2;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T2;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T2;
	Template.WeaponTech = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T2;
	Template.strImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T2;
	Template.Tier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T2;

	Template.Abilities.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T2');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T2.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T2.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T2.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T2);

	Template.RangeAccuracy = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T2;
	Template.BaseDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T2;
	Template.Aim = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T2;
	Template.CritChance = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T2;
	Template.iClipSize = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T2;
	Template.iSoundRange = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T2;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T2;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T2;

	Template.iTypicalActionCost = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T2;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	//Abilities Loop
	if (default.Weapon_Abilities_T2.Length > 0)
	{
		//Loop until the end of the length of the array
		for (i = 0; i < default.Weapon_Abilities_T2.Length; i++)
		{
			//Add the ability name at index [i]
			Template.Abilities.AddItem(default.Weapon_Abilities_T2[i].AbilityName);
			//Check if the name at index [i] also has a IconOverrideName string. 
			//It doesn't check if the string is valid though
			if (Len(default.Weapon_Abilities_T2[i].IconOverrideName) > 0)
			{
				Template.AddAbilityIconOverride(default.Weapon_Abilities_T2[i].AbilityName, default.Weapon_Abilities_T2[i].IconOverrideName);
			}
		}
	}
	else
	{
		//Add the default abilities
		Template.Abilities.AddItem('StandardShot');
		Template.Abilities.AddItem('Overwatch');
		Template.Abilities.AddItem('OverwatchShot');
		Template.Abilities.AddItem('Reload');
		Template.Abilities.AddItem('HotLoadAmmo');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T2;
	Template.fKnockbackDamageAmount = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T2;
	Template.fKnockbackDamageRadius = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T2;

	Template.StartingItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T2;
	Template.CanBeBuilt = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T2;
	Template.bInfiniteItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T2;

	Template.CreatorTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T2; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T2; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T2);

	// Cost
	if (default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T2 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T2.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T2[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T2[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T2;	
	Template.GameArchetype = "ZZZ_OW_Weapons_Data.Archetype.WP_HPR_Classic"; 
	
	return Template;
}

//=======================================================================================
// Secondary Weapon Template (_T3) --- BEAM
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3');
	Template.WeaponPanelImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T3;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T3;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T3;
	Template.WeaponTech = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T3;
	Template.strImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T3;
	Template.Tier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T3;

	Template.Abilities.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T3');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T3.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T3.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T3.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T3);

	Template.RangeAccuracy = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T3;
	Template.BaseDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T3;
	Template.Aim = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T3;
	Template.CritChance = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T3;
	Template.iClipSize = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T3;
	Template.iSoundRange = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T3;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T3;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T3;

	Template.iTypicalActionCost = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T3;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	//Abilities Loop
	if (default.Weapon_Abilities_T3.Length > 0)
	{
		//Loop until the end of the length of the array
		for (i = 0; i < default.Weapon_Abilities_T3.Length; i++)
		{
			//Add the ability name at index [i]
			Template.Abilities.AddItem(default.Weapon_Abilities_T3[i].AbilityName);
			//Check if the name at index [i] also has a IconOverrideName string. 
			//It doesn't check if the string is valid though
			if (Len(default.Weapon_Abilities_T3[i].IconOverrideName) > 0)
			{
				Template.AddAbilityIconOverride(default.Weapon_Abilities_T3[i].AbilityName, default.Weapon_Abilities_T3[i].IconOverrideName);
			}
		}
	}
	else
	{
		//Add the default abilities
		Template.Abilities.AddItem('StandardShot');
		Template.Abilities.AddItem('Overwatch');
		Template.Abilities.AddItem('OverwatchShot');
		Template.Abilities.AddItem('Reload');
		Template.Abilities.AddItem('HotLoadAmmo');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T3;
	Template.fKnockbackDamageAmount = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T3;
	Template.fKnockbackDamageRadius = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T3;

	Template.StartingItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T3;
	Template.CanBeBuilt = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T3;
	Template.bInfiniteItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T3;

	Template.CreatorTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T3; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T3; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T3);

	// Cost
	if (default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T3 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T3.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T3[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T3[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T3;	
	Template.GameArchetype = "ZZZ_OW_Weapons_Data.Archetype.WP_HPR_Classic"; 
	
	return Template;
}

//=======================================================================================
// Secondary Weapon Template (_T4) --- CHOSEN
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4');
	Template.WeaponPanelImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONPANELIMAGE_T4;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_EQUIPSOUND_T4;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONCATEGORY_T4;
	Template.WeaponTech = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_WEAPONTECH_T4;
	Template.strImage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_UIIMAGE_T4;
	Template.Tier = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TIER_T4;

	Template.Abilities.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_StatModifier_T4');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T4.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T4.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T4.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_MOBILITY_T4);

	Template.RangeAccuracy = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_RANGE_T4;
	Template.BaseDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASEDAMAGE_T4;
	Template.Aim = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_AIM_T4;
	Template.CritChance = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CRITCHANCE_T4;
	Template.iClipSize = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ICLIPSIZE_T4;
	Template.iSoundRange = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_ISOUNDRANGE_T4;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IENVIRONMENTDAMAGE_T4;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_IUPGRADESLOTS_T4;

	Template.iTypicalActionCost = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_TYPICAL_ACTIONCOST_T4;

	Template.InventorySlot = eInvSlot_PrimaryWeapon;

	//Unique to this template
	Template.OnAcquiredFn = class'X2Item_XpackWeapons'.static.OnChosenRifleAcquired;

	//Abilities Loop
	if (default.Weapon_Abilities_T4.Length > 0)
	{
		//Loop until the end of the length of the array
		for (i = 0; i < default.Weapon_Abilities_T4.Length; i++)
		{
			//Add the ability name at index [i]
			Template.Abilities.AddItem(default.Weapon_Abilities_T4[i].AbilityName);
			//Check if the name at index [i] also has a IconOverrideName string. 
			//It doesn't check if the string is valid though
			if (Len(default.Weapon_Abilities_T4[i].IconOverrideName) > 0)
			{
				Template.AddAbilityIconOverride(default.Weapon_Abilities_T4[i].AbilityName, default.Weapon_Abilities_T4[i].IconOverrideName);
			}
		}
	}
	else
	{
		//Add the default abilities
		Template.Abilities.AddItem('StandardShot');
		Template.Abilities.AddItem('Overwatch');
		Template.Abilities.AddItem('OverwatchShot');
		Template.Abilities.AddItem('Reload');
		Template.Abilities.AddItem('HotLoadAmmo');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_PHYSICSIMPULSE_T4;
	Template.fKnockbackDamageAmount = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_AMOUNT_T4;
	Template.fKnockbackDamageRadius = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_KNOCKBACKDAMAGE_RADIUS_T4;

	Template.StartingItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_STARTINGITEM_T4;
	Template.CanBeBuilt = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T4;
	Template.bInfiniteItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_INFINITEITEM_T4;

	Template.CreatorTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CREATOR_TEMPLATE_T4; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_BASE_ITEM_T4; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_REQUIREDTECH_T4);

	// Cost
	if (default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_CANBEBUILT_T4 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T4.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T4[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T4[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_DAMAGETYPE_T4;	
	Template.GameArchetype = "ZZZ_OW_Weapons_Data.Archetype.WP_HPR_Classic";  
	
	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}
