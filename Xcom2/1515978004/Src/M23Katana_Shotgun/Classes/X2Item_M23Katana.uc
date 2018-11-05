class X2Item_M23Katana extends X2Item config(M23Katana);

// Weapon Stat Variables
var config WeaponDamageValue M23KATANA_BASEDAMAGE;
var config array<int> M23KATANA_RANGE;
var config int M23KATANA_AIM;
var config int M23KATANA_CRITCHANCE;
var config int M23KATANA_ICLIPSIZE;
var config int M23KATANA_ISOUNDRANGE;
var config int M23KATANA_IENVIRONMENTDAMAGE;
var config int M23KATANA_ISUPPLIES;
var config int M23KATANA_TRADINGPOSTVALUE;
var config int M23KATANA_IPOINTS;
var config int M23KATANA_IUPGRADESLOTS;

var config WeaponDamageValue M23KATANA_MG_BASEDAMAGE;
var config array<int> M23KATANA_MG_RANGE;
var config int M23KATANA_MG_AIM;
var config int M23KATANA_MG_CRITCHANCE;
var config int M23KATANA_MG_ICLIPSIZE;
var config int M23KATANA_MG_ISOUNDRANGE;
var config int M23KATANA_MG_IENVIRONMENTDAMAGE;
var config int M23KATANA_MG_ISUPPLIES;
var config int M23KATANA_MG_TRADINGPOSTVALUE;
var config int M23KATANA_MG_IPOINTS;
var config int M23KATANA_MG_IUPGRADESLOTS;

var config WeaponDamageValue M23KATANA_BM_BASEDAMAGE;
var config array<int> M23KATANA_BM_RANGE;
var config int M23KATANA_BM_AIM;
var config int M23KATANA_BM_CRITCHANCE;
var config int M23KATANA_BM_ICLIPSIZE;
var config int M23KATANA_BM_ISOUNDRANGE;
var config int M23KATANA_BM_IENVIRONMENTDAMAGE;
var config int M23KATANA_BM_ISUPPLIES;
var config int M23KATANA_BM_TRADINGPOSTVALUE;
var config int M23KATANA_BM_IPOINTS;
var config int M23KATANA_BM_IUPGRADESLOTS;
// Template Start
static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> M23KatanaWeaps;

	M23KatanaWeaps.AddItem(CreateTemplate_M23Katana());
	M23KatanaWeaps.AddItem(CreateTemplate_M23Katana_MG());
	M23KatanaWeaps.AddItem(CreateTemplate_M23Katana_BM());

	return M23KatanaWeaps;

}

// M-23 Katana Conventional Template
static function X2DataTemplate CreateTemplate_M23Katana()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'WP_M23Katana');
	Template.WeaponPanelImage = "_ConventionalRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";
	// Weapon Classifications
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'conventional';
	Template.strImage = "img:///WP_M23Katana_CV.UILibrary.Inv_M23Katana";
	Template.Tier = 0;
	// Weapon Stats
	Template.BaseDamage = default.M23KATANA_BASEDAMAGE;
	Template.RangeAccuracy = default.M23KATANA_RANGE;
	Template.Aim = default.M23KATANA_AIM;
	Template.CritChance = default.M23KATANA_CRITCHANCE;
	Template.iClipSize = default.M23KATANA_ICLIPSIZE;
	Template.iSoundRange = default.M23KATANA_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.M23KATANA_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.M23KATANA_IUPGRADESLOTS;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	//Weapon Abilities
	Template.Abilities.AddItem('StandardShot');	
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	// Weapon Buildability
	Template.iPhysicsImpulse = 5;
	Template.StartingItem = true;
	Template.CanBeBuilt = false;	
	Template.bInfiniteItem = true;
	// Knockback
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;
	// Weapon Asset
	Template.GameArchetype = "WP_M23Katana_CV.WP_M23Katana_CV";

	return Template;
}


// M-23 Katana Magnetic Template
static function X2DataTemplate CreateTemplate_M23Katana_MG()
{
	local X2WeaponTemplate Template;
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'WP_M23Katana_MG');
	Template.WeaponPanelImage = "_MagneticRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";
	// Weapon Classifications
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'magnetic';
	Template.strImage = "img:///WP_M23Katana_CV.UILibrary.Inv_M23Katana";
	Template.Tier = 2;
	// Weapon Stats
	Template.BaseDamage = default.M23KATANA_MG_BASEDAMAGE;
	Template.RangeAccuracy = default.M23KATANA_MG_RANGE;
	Template.Aim = default.M23KATANA_MG_AIM;
	Template.CritChance = default.M23KATANA_MG_CRITCHANCE;
	Template.iClipSize = default.M23KATANA_MG_ICLIPSIZE;
	Template.iSoundRange = default.M23KATANA_MG_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.M23KATANA_MG_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.M23KATANA_MG_IUPGRADESLOTS;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	//Weapon Abilities
	Template.Abilities.AddItem('StandardShot');	
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	// Weapon Buildability
	Template.iPhysicsImpulse = 5;
	Template.CanBeBuilt = false;	
	Template.bInfiniteItem = true;
	// Knockback
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;
	// Upgrade Data
	Template.CreatorTemplateName = 'M23Katana_MG_Schematic';
	Template.BaseItem = 'WP_M23Katana'; 
	// Weapon Asset
	Template.GameArchetype = "WP_M23Katana_CV.WP_M23Katana_CV";

	return Template;
}

//Template Beam Creation
static function X2DataTemplate CreateTemplate_M23Katana_BM()
{
	local X2WeaponTemplate Template;
	//Weapon Template
	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'WP_M23Katana_BM');
	Template.WeaponPanelImage = "_BeamRifle";
	Template.EquipSound = "Conventional_Weapon_Equip";
	//Weapon Classificayion pointers
	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'shotgun';
	Template.WeaponTech = 'beam';
	Template.strImage = "img:///WP_M23Katana_CV.UILibrary.Inv_M23Katana";
	Template.Tier = 4;
	//Weapon Stat pointers
	Template.BaseDamage = default.M23KATANA_BM_BASEDAMAGE;
	Template.RangeAccuracy = default.M23KATANA_BM_RANGE;
	Template.Aim = default.M23KATANA_BM_AIM;
	Template.CritChance = default.M23KATANA_BM_CRITCHANCE;
	Template.iClipSize = default.M23KATANA_BM_ICLIPSIZE;
	Template.iSoundRange = default.M23KATANA_BM_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.M23KATANA_BM_IENVIRONMENTDAMAGE;
	Template.NumUpgradeSlots = default.M23KATANA_BM_IUPGRADESLOTS;
	Template.InventorySlot = eInvSlot_PrimaryWeapon;
	//Weapon Ability pointers
	Template.Abilities.AddItem('StandardShot');	
	Template.Abilities.AddItem('Overwatch');	
	Template.Abilities.AddItem('OverwatchShot');
	Template.Abilities.AddItem('Reload');
	Template.Abilities.AddItem('HotLoadAmmo');
	//Can Be Built?
	Template.iPhysicsImpulse = 5;
	Template.CanBeBuilt = false;	
	Template.bInfiniteItem = true;
	//Physics
	Template.fKnockbackDamageAmount = 5.0f;
	Template.fKnockbackDamageRadius = 0.0f;
	//Upgrade Template
	Template.CreatorTemplateName = 'M23Katana_BM_Schematic';
	Template.BaseItem = 'WP_M23Katana_MG';  
	//Weapon Assets
	Template.GameArchetype = "WP_M23Katana_CV.WP_M23Katana_CV";
	
	return Template;
}