class X2Item_Genji_Sword_Wakizashi extends X2Item config(Weapon_MD_WOTC_OW_WAKIZASHI_CLASSIC); 

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

//=======================================================================================
// Melee Weapon values (_T1) --- CONVENTIONAL
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T1;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T1;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T1;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T1;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_DAMAGETYPE_T1;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T1;


var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T1;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T1;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T1;

var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T1; //true
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T1; //false
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T1; //true


var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T1;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T1;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNLEVEL_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNCHANCE_T1;
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STUN_ISMENTALDMG_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T1;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T1;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T1;
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_ENABLE_STUN_EFFECT_T1;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T1;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T1;


//=======================================================================================
// Melee Weapon values (_T2) --- MAGNETIC
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T2;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T2;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T2;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T2;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_DAMAGETYPE_T2;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T2;


var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T2;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T2;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T2;

var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T2; //true
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T2; //false
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T2; //true


var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T2;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T2;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNLEVEL_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNCHANCE_T2;
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STUN_ISMENTALDMG_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T2;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T2;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T2;
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_ENABLE_STUN_EFFECT_T2;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T2;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T2;

//=======================================================================================
// Melee Weapon Values (_T3) --- BEAM
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T3;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T3;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T3;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T3;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T3;


var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T3;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T3;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T3;

var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T3; //true
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T3; //false
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T3; //true


var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T3;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T3;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_BURNDAMAGE_PER_TURN_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_BURNSPREAD_PER_TURN_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T3;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T3;
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_ENABLE_BURN_EFFECT_T3;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T3;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T3;

//=======================================================================================
// Melee Weapon Values (_T4) --- CHOSEN
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T4;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T4;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T4;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T4;
var config string MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T4;


var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T4;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T4;

var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T4;

var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T4; //true
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T4; //false
var config bool MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T4; //true


var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T4;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T4;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T4;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T4;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T4;
var config name MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T4;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T1());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T2());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T3());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T4());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T1()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_CLASSIC_T1');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T1;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T1;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T1;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T1;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T1;
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T1;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T1;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T1, true);

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T1;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T1;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T1;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T1;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T1;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T1;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T1;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T1;
	Template.BaseDamage.DamageType='Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T1.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T1.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T1.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNCHANCE_T1, , , "%");

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T1; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T1; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T1);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T1 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T1.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T1[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T1[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T1;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T1;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T1;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T2()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_CLASSIC_T2');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T2;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T2;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T2;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T2;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T2;
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T2;

	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T2;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T2, true);

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T2;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T2;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T2;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T2;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T2;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T2;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T2;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T2;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T2;
	Template.BaseDamage.DamageType='Melee';

		if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ENABLE_STUN_EFFECT_T2 == true)
		{
				Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNLEVEL_T2, default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNCHANCE_T2, default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STUN_ISMENTALDMG_T2));
		}

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T2.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T2.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T2.Shred);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STUNCHANCE_T2, , , "%");

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T2; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T2; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T2);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T2 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T2.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T2[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T2[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T2;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T2;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T2;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T3()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_CLASSIC_T3');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T3;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T3;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T3;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T3;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T3;
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T3;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T3, true);
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T3;

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T3;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T3;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T3;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T3;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T3;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T3;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T3;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T3;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T3;
	Template.BaseDamage.DamageType='Melee';


	if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ENABLE_BURN_EFFECT_T3 == true)
		{
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BURNDAMAGE_PER_TURN_T3, default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BURNSPREAD_PER_TURN_T3));
		}

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T3.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T3.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T3.Shred);

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T3; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T3; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T3);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T3 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T3.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T3[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T3[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T3;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T3;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T3;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_CLASSIC_T4()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_CLASSIC_T4');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONPANELIMAGE_T4;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_EQUIPSOUND_T4;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONCATEGORY_T4;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_WEAPONTECH_T4;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_UIIMAGE_T4;
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ARCHETYPEPATH_T4;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_CLASSIC_SHEATHMESH_T4, true);
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_TIER_T4;

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RADIUS_T4;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IUPGRADESLOTS_T4;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_PHYSICSIMPULSE_T4;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_RANGE_T4;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T4;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_AIM_T4;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CRITCHANCE_T4;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_ISOUNDRANGE_T4;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_IENVIRONMENTDAMAGE_T4;
	Template.BaseDamage.DamageType='Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T4.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T4.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASEDAMAGE_T4.Shred);

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CREATOR_TEMPLATE_T4; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_BASE_ITEM_T4; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_CLASSIC_REQUIREDTECH_T4);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T4 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T4.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T4[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T4[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_STARTINGITEM_T4;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_CANBEBUILT_T4;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_CLASSIC_INFINITEITEM_T4;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}