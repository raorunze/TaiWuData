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
class X2Item_Tracer_Pistol_Cadet_Templar extends X2Item config(Weapon_MD_WOTC_TMP_OW_PULSEPISTOL_CADET); 

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
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T1;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T1;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T1;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T1;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T1;


var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T1;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T1;

var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T1;

var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T1; //true
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T1; //false
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T1; //true


var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T1;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T1;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T1;

var config array<int> MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T1;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T1;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T1;
var config WeaponDamageValue MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T1;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T1;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISUPPLIES;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TRADINGPOSTVALUE;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IPOINTS;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T1;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T1;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T1;

//=======================================================================================
// Weapon values (_T2) --- MAGNETIC
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T2;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T2;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T2;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T2;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T2;

var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T2;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T2;

var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T2;

var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T2; //true
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T2; //false
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T2; //true

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T2;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T2;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T2;

var config array<int> MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T2;
var config WeaponDamageValue MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T2;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T2;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T2;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T2;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISUPPLIES;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TRADINGPOSTVALUE;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IPOINTS;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T2;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T2;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T2;

//=======================================================================================
// Weapon Values (_T3) --- BEAM
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T3;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T3;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T3;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T3;
var config string MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T3;

var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T3;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T3;

var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T3;

var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T3; //true
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T3; //false
var config bool MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T3; //true

var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T3;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T3;
var config float MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T3;

var config array<int> MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T3;
var config WeaponDamageValue MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T3;
var config array<WeaponAbilitiesDefs> Weapon_Abilities_T3;
var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T3;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T3;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISUPPLIES;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TRADINGPOSTVALUE;
//var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IPOINTS;
var config int MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T3;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T3;
var config name MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T3;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3());

	return ModWeapons;
}

//=======================================================================================
// Weapon Template (_T1)
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1');
	Template.WeaponPanelImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T1;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T1;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T1;
	Template.WeaponTech = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T1;
	Template.strImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T1;
	Template.Tier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T1;

	Template.Abilities.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T1');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T1.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T1.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T1.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T1);

	Template.RangeAccuracy = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T1;
	Template.BaseDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T1;
	Template.Aim = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T1;
	Template.CritChance = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T1;
	Template.iClipSize = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T1;
	Template.iSoundRange = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T1;
	Template.iEnvironmentDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T1;
	Template.NumUpgradeSlots = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T1;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

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
		Template.Abilities.AddItem('PistolStandardShot');
		Template.Abilities.AddItem('PistolOverwatch');
		Template.Abilities.AddItem('PistolOverwatchShot');
		Template.Abilities.AddItem('PistolReturnFire');
		Template.Abilities.AddItem('HotLoadAmmo');
		Template.Abilities.AddItem('Reload');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T1;
	Template.fKnockbackDamageAmount = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T1;
	Template.fKnockbackDamageRadius = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T1;

	Template.StartingItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T1;
	Template.CanBeBuilt = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T1;
	Template.bInfiniteItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T1;

	Template.CreatorTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T1; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T1; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T1);

	// Cost
	if (default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T1 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T1.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T1[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T1[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.bHideClipSizeStat = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T1;	
	Template.GameArchetype = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T1; 
	
	return Template;
}

//=======================================================================================
// Weapon Template (_T2) --- MAGNETIC
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2');
	Template.WeaponPanelImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T2;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T2;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T2;
	Template.WeaponTech = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T2;
	Template.strImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T2;
	Template.Tier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T2;

	Template.Abilities.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T2');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T2.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T2.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T2.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T2);

	Template.RangeAccuracy = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T2;
	Template.BaseDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T2;
	Template.Aim = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T2;
	Template.CritChance = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T2;
	Template.iClipSize = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T2;
	Template.iSoundRange = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T2;
	Template.iEnvironmentDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T2;
	Template.NumUpgradeSlots = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T2;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

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
		Template.Abilities.AddItem('PistolStandardShot');
		Template.Abilities.AddItem('PistolOverwatch');
		Template.Abilities.AddItem('PistolOverwatchShot');
		Template.Abilities.AddItem('PistolReturnFire');
		Template.Abilities.AddItem('HotLoadAmmo');
		Template.Abilities.AddItem('Reload');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T2;
	Template.fKnockbackDamageAmount = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T2;
	Template.fKnockbackDamageRadius = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T2;

	Template.StartingItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T2;
	Template.CanBeBuilt = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T2;
	Template.bInfiniteItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T2;

	Template.CreatorTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T2; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T2; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T2);

	// Cost
	if (default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T2 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T2.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T2[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T2[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.bHideClipSizeStat = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T2;	
	Template.GameArchetype = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T2; 
	
	return Template;
}

//=======================================================================================
// Weapon Template (_T3) --- BEAM
//=======================================================================================
static function X2DataTemplate CreateTemplate_MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	// Main Properties of the weapon template
	//=====================================================================
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3');
	Template.WeaponPanelImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONPANELIMAGE_T3;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_EQUIPSOUND_T3;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONCATEGORY_T3;
	Template.WeaponTech = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_WEAPONTECH_T3;
	Template.strImage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_UIIMAGE_T3;
	Template.Tier = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_TIER_T3;

	Template.Abilities.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_StatModifier_T3');

	//From CVWP's scripts.
	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T3.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T3.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T3.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_Weapon_Modifiers'.default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_MOBILITY_T3);

	Template.RangeAccuracy = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_RANGE_T3;
	Template.BaseDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASEDAMAGE_T3;
	Template.Aim = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_AIM_T3;
	Template.CritChance = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CRITCHANCE_T3;
	Template.iClipSize = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ICLIPSIZE_T3;
	Template.iSoundRange = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ISOUNDRANGE_T3;
	Template.iEnvironmentDamage = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IENVIRONMENTDAMAGE_T3;
	Template.NumUpgradeSlots = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_IUPGRADESLOTS_T3;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;

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
		Template.Abilities.AddItem('PistolStandardShot');
		Template.Abilities.AddItem('PistolOverwatch');
		Template.Abilities.AddItem('PistolOverwatchShot');
		Template.Abilities.AddItem('PistolReturnFire');
		Template.Abilities.AddItem('HotLoadAmmo');
		Template.Abilities.AddItem('Reload');
	}

	Template.iPhysicsImpulse = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_PHYSICSIMPULSE_T3;
	Template.fKnockbackDamageAmount = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_AMOUNT_T3;
	Template.fKnockbackDamageRadius = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_KNOCKBACKDAMAGE_RADIUS_T3;

	Template.StartingItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_STARTINGITEM_T3;
	Template.CanBeBuilt = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T3;
	Template.bInfiniteItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_INFINITEITEM_T3;

	Template.CreatorTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CREATOR_TEMPLATE_T3; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_BASE_ITEM_T3; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_REQUIREDTECH_T3);

	// Cost
	if (default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_CANBEBUILT_T3 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T3.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T3[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T3[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.bHideClipSizeStat = true;
	Template.OverwatchActionPoint = class'X2CharacterTemplateManager'.default.PistolOverwatchReserveActionPoint;
	Template.InfiniteAmmo = true;

	Template.UIArmoryCameraPointTag = 'UIPawnLocation_WeaponUpgrade_AssaultRifle';
	Template.DamageTypeTemplateName = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_DAMAGETYPE_T3;	
	Template.GameArchetype = default.MD_WOTC_TMP_OW_PULSEPISTOL_CADET_ARCHETYPEPATH_T3; 
	
	return Template;
}

defaultproperties
{
bShouldCreateDifficultyVariants = true
}
