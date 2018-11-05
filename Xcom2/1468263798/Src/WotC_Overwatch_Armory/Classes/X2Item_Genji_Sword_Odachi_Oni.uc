class X2Item_Genji_Sword_Odachi_Oni extends X2Item config(Weapon_MD_WOTC_OW_ODACHI_ONI); 

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
// Melee Weapon Values (_T4) --- CHOSEN
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_ODACHI_ONI_UIIMAGE_T4;
var config string MD_WOTC_OW_ODACHI_ONI_WEAPONPANELIMAGE_T4;
var config string MD_WOTC_OW_ODACHI_ONI_ARCHETYPEPATH_T4;

var config string MD_WOTC_OW_ODACHI_ONI_SHEATHMESH_T4;

var config string MD_WOTC_OW_ODACHI_ONI_EQUIPSOUND_T4;

var config name MD_WOTC_OW_ODACHI_ONI_WEAPONCATEGORY_T4;
var config name MD_WOTC_OW_ODACHI_ONI_WEAPONTECH_T4;

var config name MD_WOTC_OW_ODACHI_ONI_REQUIREDTECH_T4;

var config bool MD_WOTC_OW_ODACHI_ONI_STARTINGITEM_T4; //true
var config bool MD_WOTC_OW_ODACHI_ONI_CANBEBUILT_T4; //false
var config bool MD_WOTC_OW_ODACHI_ONI_INFINITEITEM_T4; //true


var config int MD_WOTC_OW_ODACHI_ONI_TIER_T4;
var config int MD_WOTC_OW_ODACHI_ONI_PHYSICSIMPULSE_T4;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T4;

var config WeaponDamageValue MD_WOTC_OW_ODACHI_ONI_BASEDAMAGE_T4;
var config int MD_WOTC_OW_ODACHI_ONI_CRITCHANCE_T4;
var config int MD_WOTC_OW_ODACHI_ONI_AIM_T4;
var config int MD_WOTC_OW_ODACHI_ONI_ISOUNDRANGE_T4;
var config int MD_WOTC_OW_ODACHI_ONI_IENVIRONMENTDAMAGE_T4;
var config int MD_WOTC_OW_ODACHI_ONI_RANGE_T4;
var config int MD_WOTC_OW_ODACHI_ONI_RADIUS_T4;
//var config int MD_WOTC_OW_ODACHI_ONI_ISUPPLIES;
//var config int MD_WOTC_OW_ODACHI_ONI_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_ODACHI_ONI_IPOINTS;
var config int MD_WOTC_OW_ODACHI_ONI_IUPGRADESLOTS_T4;
var config name MD_WOTC_OW_ODACHI_ONI_CREATOR_TEMPLATE_T4;
var config name MD_WOTC_OW_ODACHI_ONI_BASE_ITEM_T4;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_ODACHI_ONI_T4());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_ODACHI_ONI_T4()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_ODACHI_ONI_T4');
	Template.WeaponPanelImage = default.MD_WOTC_OW_ODACHI_ONI_WEAPONPANELIMAGE_T4;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_ODACHI_ONI_EQUIPSOUND_T4;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_ODACHI_ONI_WEAPONCATEGORY_T4;
	Template.WeaponTech = default.MD_WOTC_OW_ODACHI_ONI_WEAPONTECH_T4;
	Template.strImage = default.MD_WOTC_OW_ODACHI_ONI_UIIMAGE_T4;
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_ODACHI_ONI_ARCHETYPEPATH_T4;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_ODACHI_ONI_SHEATHMESH_T4, true);
	Template.Tier = default.MD_WOTC_OW_ODACHI_ONI_TIER_T4;

	Template.iRadius = default.MD_WOTC_OW_ODACHI_ONI_RADIUS_T4;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_ODACHI_ONI_IUPGRADESLOTS_T4;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_ODACHI_ONI_PHYSICSIMPULSE_T4;

	Template.iRange = default.MD_WOTC_OW_ODACHI_ONI_RANGE_T4;
	Template.BaseDamage = default.MD_WOTC_OW_ODACHI_ONI_BASEDAMAGE_T4;
	Template.Aim = default.MD_WOTC_OW_ODACHI_ONI_AIM_T4;
	Template.CritChance = default.MD_WOTC_OW_ODACHI_ONI_CRITCHANCE_T4;
	Template.iSoundRange = default.MD_WOTC_OW_ODACHI_ONI_ISOUNDRANGE_T4;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_ODACHI_ONI_IENVIRONMENTDAMAGE_T4;
	Template.BaseDamage.DamageType='Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_ODACHI_ONI_BASEDAMAGE_T4.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_ODACHI_ONI_BASEDAMAGE_T4.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_ODACHI_ONI_BASEDAMAGE_T4.Shred);

	Template.CreatorTemplateName = default.MD_WOTC_OW_ODACHI_ONI_CREATOR_TEMPLATE_T4; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_ODACHI_ONI_BASE_ITEM_T4; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_ODACHI_ONI_REQUIREDTECH_T4);

	// Cost
	if (default.MD_WOTC_OW_ODACHI_ONI_CANBEBUILT_T4 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T4.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T4[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T4[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_ODACHI_ONI_STARTINGITEM_T4;
	Template.CanBeBuilt = default.MD_WOTC_OW_ODACHI_ONI_CANBEBUILT_T4;
	Template.bInfiniteItem = default.MD_WOTC_OW_ODACHI_ONI_INFINITEITEM_T4;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}