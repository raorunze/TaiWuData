//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_ConfigureUpgradeSlots.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_ConfigureUpgradeSlots extends X2DownloadableContentInfo
	config (UpgradeSlots);

struct SlotConfigEntry
{
	var name TemplateName;
	var int NumUpgradeSlots;
};

var config array<SlotConfigEntry> SlotConfig;

static event OnPostTemplatesCreated()
{
	local X2ItemTemplateManager ItemTemplateMananger;
	local SlotConfigEntry SlotConfigItem;
	local array<X2DataTemplate> Templates;
	local X2DataTemplate Template;
	local X2WeaponTemplate WeaponTemplate;

	local array<name> TemplateNames;
	local name TemplateName;
	local X2WeaponUpgradeTemplate UpgradeTemplate;
	
	ItemTemplateMananger = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	foreach default.SlotConfig(SlotConfigItem)
	{
		ItemTemplateMananger.FindDataTemplateAllDifficulties(SlotConfigItem.TemplateName, Templates);
		foreach Templates(Template)
		{
			WeaponTemplate = X2WeaponTemplate(Template);
			if (WeaponTemplate == none)
				continue;

			WeaponTemplate.NumUpgradeSlots = SlotConfigItem.NumUpgradeSlots;
		}
	}

	ItemTemplateMananger.GetTemplateNames(TemplateNames);

	foreach TemplateNames(TemplateName)
	{
		ItemTemplateMananger.FindDataTemplateAllDifficulties(TemplateName, Templates);

		foreach Templates(Template)
		{
			UpgradeTemplate = X2WeaponUpgradeTemplate(Template);
			if (UpgradeTemplate == none)
				continue;

			if (InStr(string(UpgradeTemplate.DataName), "AimUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "FreeFireUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "MissDamageUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "FreeKillUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "CritUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "ClipSizeUpgrade") != INDEX_NONE ||
				InStr(string(UpgradeTemplate.DataName), "ReloadUpgrade") != INDEX_NONE)
			{
				UpgradeTemplate.CanApplyUpgradeToWeaponFn = CanApplyUpgradeToWeaponPatched;
				`LOG("Patch" @ UpgradeTemplate.DataName @ "CanApplyUpgradeToWeaponFn",, 'ConfigureUpgradeSlots');
			}
			//WeaponTemplate = X2WeaponTemplate(Template);
			//if (WeaponTemplate == none)
			//	continue;
			//
			//`LOG(WeaponTemplate.DataName @ WeaponTemplate.iRadius @ WeaponTemplate.iRange,, 'ConfigureUpgradeSlots');
		}
	}
}


static function bool CanApplyUpgradeToWeaponPatched(X2WeaponUpgradeTemplate UpgradeTemplate, XComGameState_Item Weapon, int SlotIndex)
{
	local X2WeaponTemplate WeaponTemplate;
	local array<name> DefaultRangedWeaponCategories;

	WeaponTemplate = X2WeaponTemplate(Weapon.GetMyTemplate());

	DefaultRangedWeaponCategories.AddItem('pistol');
	DefaultRangedWeaponCategories.AddItem('rifle');
	DefaultRangedWeaponCategories.AddItem('shotgun');
	DefaultRangedWeaponCategories.AddItem('cannon');
	DefaultRangedWeaponCategories.AddItem('sniper_rifle');
	DefaultRangedWeaponCategories.AddItem('vektor_rifle');
	DefaultRangedWeaponCategories.AddItem('bullpup');
	DefaultRangedWeaponCategories.AddItem('sidearm');

	//`LOG(default.Class.Name @ GetFuncName() @ WeaponTemplate.DataName,, 'ConfigureUpgradeSlots');

	if (WeaponTemplate != none && WeaponTemplate.RangeAccuracy.Length > 0 && WeaponTemplate.iRange == INDEX_NONE)
	{
		return class'X2Item_DefaultUpgrades'.static.CanApplyUpgradeToWeapon(UpgradeTemplate, Weapon, SlotIndex);
	}

	if (WeaponTemplate != none && DefaultRangedWeaponCategories.Find(WeaponTemplate.WeaponCat) != INDEX_NONE)
	{
		return class'X2Item_DefaultUpgrades'.static.CanApplyUpgradeToWeapon(UpgradeTemplate, Weapon, SlotIndex);
	}

	`LOG(default.Class.Name @ GetFuncName() @ WeaponTemplate.DataName @ "bail no ranged weapon",, 'ConfigureUpgradeSlots');
	return false;
}