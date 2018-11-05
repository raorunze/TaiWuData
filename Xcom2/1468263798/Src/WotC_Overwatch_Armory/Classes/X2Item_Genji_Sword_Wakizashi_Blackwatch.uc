class X2Item_Genji_Sword_Wakizashi_Blackwatch extends X2Item config(Weapon_MD_WOTC_OW_WAKIZASHI_BLACKWATCH); 

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
// Melee Weapon Values (_T3) --- BEAM
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_UIIMAGE_T3;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONPANELIMAGE_T3;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ARCHETYPEPATH_T3;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_SHEATHMESH_T3;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_EQUIPSOUND_T3;


var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONCATEGORY_T3;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONTECH_T3;

var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_REQUIREDTECH_T3;

var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_STARTINGITEM_T3; //true
var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T3; //false
var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_INFINITEITEM_T3; //true


var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TIER_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_PHYSICSIMPULSE_T3;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T3;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CRITCHANCE_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_AIM_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISOUNDRANGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IENVIRONMENTDAMAGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BURNDAMAGE_PER_TURN_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BURNSPREAD_PER_TURN_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RANGE_T3;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RADIUS_T3;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IUPGRADESLOTS_T3;
var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ENABLE_BURN_EFFECT_T3;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CREATOR_TEMPLATE_T3;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASE_ITEM_T3;

//=======================================================================================
// Melee Weapon Values (_T4) --- CHOSEN
//=======================================================================================

//E3245: Custom Config Declarations
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_UIIMAGE_T4;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONPANELIMAGE_T4;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ARCHETYPEPATH_T4;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_SHEATHMESH_T4;
var config string MD_WOTC_OW_WAKIZASHI_BLACKWATCH_EQUIPSOUND_T4;


var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONCATEGORY_T4;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONTECH_T4;

var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_REQUIREDTECH_T4;

var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_STARTINGITEM_T4; //true
var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T4; //false
var config bool MD_WOTC_OW_WAKIZASHI_BLACKWATCH_INFINITEITEM_T4; //true


var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TIER_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_PHYSICSIMPULSE_T4;

var config array<EngineeringBuildDefs> BuildWeaponInEngineering_T4;

var config WeaponDamageValue MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CRITCHANCE_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_AIM_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISOUNDRANGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IENVIRONMENTDAMAGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RANGE_T4;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RADIUS_T4;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISUPPLIES;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TRADINGPOSTVALUE;
//var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IPOINTS;
var config int MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IUPGRADESLOTS_T4;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CREATOR_TEMPLATE_T4;
var config name MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASE_ITEM_T4;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T3());
	ModWeapons.AddItem(CreateTemplate_MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T4());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T3()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T3');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONPANELIMAGE_T3;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_EQUIPSOUND_T3;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONCATEGORY_T3;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONTECH_T3;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_UIIMAGE_T3;
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ARCHETYPEPATH_T3;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_SHEATHMESH_T3, true);
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TIER_T3;

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RADIUS_T3;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IUPGRADESLOTS_T3;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_PHYSICSIMPULSE_T3;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RANGE_T3;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T3;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_AIM_T3;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CRITCHANCE_T3;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISOUNDRANGE_T3;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IENVIRONMENTDAMAGE_T3;
	Template.BaseDamage.DamageType='Melee';


	if (default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ENABLE_BURN_EFFECT_T3 == true)
		{
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BURNDAMAGE_PER_TURN_T3, default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BURNSPREAD_PER_TURN_T3));
		}

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T3.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T3.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T3.Shred);

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CREATOR_TEMPLATE_T3; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASE_ITEM_T3; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_REQUIREDTECH_T3);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T3 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T3.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T3[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T3[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_STARTINGITEM_T3;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T3;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_INFINITEITEM_T3;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}

static function X2DataTemplate CreateTemplate_MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T4()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T4');
	Template.WeaponPanelImage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONPANELIMAGE_T4;                       // used by the UI. Probably determines iconview of the weapon.
	Template.EquipSound = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_EQUIPSOUND_T4;

	Template.ItemCat = 'weapon';
	Template.WeaponCat = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONCATEGORY_T4;
	Template.WeaponTech = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_WEAPONTECH_T4;
	Template.strImage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_UIIMAGE_T4;
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ARCHETYPEPATH_T4;
    Template.AddDefaultAttachment('Sheath', default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_SHEATHMESH_T4, true);
	Template.Tier = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_TIER_T4;

	Template.iRadius = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RADIUS_T4;
	Template.NumUpgradeSlots = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IUPGRADESLOTS_T4;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_PHYSICSIMPULSE_T4;

	Template.iRange = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_RANGE_T4;
	Template.BaseDamage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T4;
	Template.Aim = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_AIM_T4;
	Template.CritChance = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CRITCHANCE_T4;
	Template.iSoundRange = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_ISOUNDRANGE_T4;
	Template.iEnvironmentDamage = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_IENVIRONMENTDAMAGE_T4;
	Template.BaseDamage.DamageType='Melee';

	Template.SetUIStatMarkup(class'XLocalizedData'.default.CritLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T4.Crit);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.PierceLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T4.Pierce);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASEDAMAGE_T4.Shred);

	Template.CreatorTemplateName = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CREATOR_TEMPLATE_T4; // The schematic which creates this item
	Template.BaseItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_BASE_ITEM_T4; // Which item this will be upgraded from

	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_REQUIREDTECH_T4);

	// Cost
	if (default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T4 == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildWeaponInEngineering_T4.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildWeaponInEngineering_T4[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildWeaponInEngineering_T4[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.StartingItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_STARTINGITEM_T4;
	Template.CanBeBuilt = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_CANBEBUILT_T4;
	Template.bInfiniteItem = default.MD_WOTC_OW_WAKIZASHI_BLACKWATCH_INFINITEITEM_T4;

	Template.DamageTypeTemplateName = 'Melee';
	
	return Template;
}