class X2Item_Katana_Weapon extends X2Item 
	config(KatanaMod); 

var config bool bNinjatoIsCosmetic;
var config bool bKatanaIsCosmetic;
var config bool bWakizashiIsCosmetic;
var config bool bHidePreviousTiers;
var config bool bUseSheaths;

var config WeaponDamageValue NINJATO_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue NINJATO_CONVENTIONAL_BASEDAMAGE_LW2;
var config int  NINJATO_CONVENTIONAL_AIM;
var config int  NINJATO_CONVENTIONAL_CRITCHANCE;
var config int  NINJATO_CONVENTIONAL_ICLIPSIZE;
var config int  NINJATO_CONVENTIONAL_ISOUNDRANGE;
var config int  NINJATO_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int  NINJATO_CONVENTIONAL_UPGRADESLOTS;
var config int  NINJATO_CONVENTIONAL_PANICCHANCE;
var config bool NINJATO_CONVENTIONAL_BURN;
var config bool NINJATO_CONVENTIONAL_DISORIENT;
var config int  NINJATO_CONVENTIONAL_STUNCHANCE;
var config string NINJATO_CONVENTIONAL_ARCHETYPE;
var config string NINJATO_CONVENTIONAL_ICON;
var config array<name> NINJATO_CONVENTIONAL_ABILITIES;

var config WeaponDamageValue NINJATO_MAGNETIC_BASEDAMAGE;
var config WeaponDamageValue NINJATO_MAGNETIC_BASEDAMAGE_LW2;
var config int  NINJATO_MAGNETIC_AIM;
var config int  NINJATO_MAGNETIC_CRITCHANCE;
var config int  NINJATO_MAGNETIC_ICLIPSIZE;
var config int  NINJATO_MAGNETIC_ISOUNDRANGE;
var config int  NINJATO_MAGNETIC_IENVIRONMENTDAMAGE;
var config int  NINJATO_MAGNETIC_UPGRADESLOTS;
var config int  NINJATO_MAGNETIC_PANICCHANCE;
var config bool NINJATO_MAGNETIC_BURN;
var config bool NINJATO_MAGNETIC_DISORIENT;
var config int  NINJATO_MAGNETIC_STUNCHANCE;
var config bool NINJATO_MAGNETIC_POISON;
var config string NINJATO_MAGNETIC_ARCHETYPE;
var config string NINJATO_MAGNETIC_ICON;
var config array<name> NINJATO_MAGNETIC_ABILITIES;

var config WeaponDamageValue NINJATO_BEAM_BASEDAMAGE;
var config WeaponDamageValue NINJATO_BEAM_BASEDAMAGE_LW2;
var config int  NINJATO_BEAM_AIM;
var config int  NINJATO_BEAM_CRITCHANCE;
var config int  NINJATO_BEAM_ICLIPSIZE;
var config int  NINJATO_BEAM_ISOUNDRANGE;
var config int  NINJATO_BEAM_IENVIRONMENTDAMAGE;
var config int  NINJATO_BEAM_UPGRADESLOTS;
var config int  NINJATO_BEAM_PANICCHANCE;
var config bool NINJATO_BEAM_BURN;
var config bool NINJATO_BEAM_DISORIENT;
var config int  NINJATO_BEAM_STUNCHANCE;
var config bool NINJATO_BEAM_POISON;
var config string NINJATO_BEAM_ARCHETYPE;
var config string NINJATO_BEAM_ICON;
var config array<name> NINJATO_BEAM_ABILITIES;

var config WeaponDamageValue KATANA_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue KATANA_CONVENTIONAL_BASEDAMAGE_LW2;
var config int  KATANA_CONVENTIONAL_AIM;
var config int  KATANA_CONVENTIONAL_CRITCHANCE;
var config int  KATANA_CONVENTIONAL_ICLIPSIZE;
var config int  KATANA_CONVENTIONAL_ISOUNDRANGE;
var config int  KATANA_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int  KATANA_CONVENTIONAL_UPGRADESLOTS;
var config int  KATANA_CONVENTIONAL_PANICCHANCE;
var config bool KATANA_CONVENTIONAL_BURN;
var config bool KATANA_CONVENTIONAL_DISORIENT;
var config int  KATANA_CONVENTIONAL_STUNCHANCE;
var config string KATANA_CONVENTIONAL_ARCHETYPE;
var config string KATANA_CONVENTIONAL_ICON;
var config array<name> KATANA_CONVENTIONAL_ABILITIES;

var config WeaponDamageValue KATANA_BEAM_BASEDAMAGE;
var config WeaponDamageValue KATANA_BEAM_BASEDAMAGE_LW2;
var config int  KATANA_BEAM_AIM;
var config int  KATANA_BEAM_CRITCHANCE;
var config int  KATANA_BEAM_ICLIPSIZE;
var config int  KATANA_BEAM_ISOUNDRANGE;
var config int  KATANA_BEAM_IENVIRONMENTDAMAGE;
var config int  KATANA_BEAM_UPGRADESLOTS;
var config int  KATANA_BEAM_PANICCHANCE;
var config bool KATANA_BEAM_BURN;
var config bool KATANA_BEAM_DISORIENT;
var config int  KATANA_BEAM_STUNCHANCE;
var config string KATANA_BEAM_ARCHETYPE;
var config string KATANA_BEAM_ICON;
var config array<name> KATANA_BEAM_ABILITIES;

var config WeaponDamageValue KATANA_PLASMA_BASEDAMAGE;
var config WeaponDamageValue KATANA_PLASMA_BASEDAMAGE_LW2;
var config int  KATANA_PLASMA_AIM;
var config int  KATANA_PLASMA_CRITCHANCE;
var config int  KATANA_PLASMA_ICLIPSIZE;
var config int  KATANA_PLASMA_ISOUNDRANGE;
var config int  KATANA_PLASMA_IENVIRONMENTDAMAGE;
var config int  KATANA_PLASMA_UPGRADESLOTS;
var config int  KATANA_PLASMA_PANICCHANCE;
var config bool KATANA_PLASMA_BURN;
var config bool KATANA_PLASMA_DISORIENT;
var config int  KATANA_PLASMA_STUNCHANCE;
var config string KATANA_PLASMA_ARCHETYPE;
var config string KATANA_PLASMA_ICON;
var config array<name> KATANA_PLASMA_ABILITIES;


var config WeaponDamageValue WAKIZASHI_CONVENTIONAL_BASEDAMAGE;
var config WeaponDamageValue WAKIZASHI_CONVENTIONAL_BASEDAMAGE_LW2;
var config int  WAKIZASHI_CONVENTIONAL_AIM;
var config int  WAKIZASHI_CONVENTIONAL_CRITCHANCE;
var config int  WAKIZASHI_CONVENTIONAL_ICLIPSIZE;
var config int  WAKIZASHI_CONVENTIONAL_ISOUNDRANGE;
var config int  WAKIZASHI_CONVENTIONAL_IENVIRONMENTDAMAGE;
var config int  WAKIZASHI_CONVENTIONAL_UPGRADESLOTS;
var config int  WAKIZASHI_CONVENTIONAL_PANICCHANCE;
var config bool WAKIZASHI_CONVENTIONAL_BURN;
var config bool WAKIZASHI_CONVENTIONAL_DISORIENT;
var config int  WAKIZASHI_CONVENTIONAL_STUNCHANCE;
var config string WAKIZASHI_CONVENTIONAL_ARCHETYPE;
var config string WAKIZASHI_CONVENTIONAL_ICON;
var config array<name> WAKIZASHI_CONVENTIONAL_ABILITIES;

var config WeaponDamageValue WAKIZASHI_BEAM_BASEDAMAGE;
var config WeaponDamageValue WAKIZASHI_BEAM_BASEDAMAGE_LW2;
var config int  WAKIZASHI_BEAM_AIM;
var config int  WAKIZASHI_BEAM_CRITCHANCE;
var config int  WAKIZASHI_BEAM_ICLIPSIZE;
var config int  WAKIZASHI_BEAM_ISOUNDRANGE;
var config int  WAKIZASHI_BEAM_IENVIRONMENTDAMAGE;
var config int  WAKIZASHI_BEAM_UPGRADESLOTS;
var config int  WAKIZASHI_BEAM_PANICCHANCE;
var config bool WAKIZASHI_BEAM_BURN;
var config bool WAKIZASHI_BEAM_DISORIENT;
var config int  WAKIZASHI_BEAM_STUNCHANCE;
var config string WAKIZASHI_BEAM_ARCHETYPE;
var config string WAKIZASHI_BEAM_ICON;
var config array<name> WAKIZASHI_BEAM_ABILITIES;

var config WeaponDamageValue WAKIZASHI_PLASMA_BASEDAMAGE;
var config WeaponDamageValue WAKIZASHI_PLASMA_BASEDAMAGE_LW2;
var config int  WAKIZASHI_PLASMA_AIM;
var config int  WAKIZASHI_PLASMA_CRITCHANCE;
var config int  WAKIZASHI_PLASMA_ICLIPSIZE;
var config int  WAKIZASHI_PLASMA_ISOUNDRANGE;
var config int  WAKIZASHI_PLASMA_IENVIRONMENTDAMAGE;
var config int  WAKIZASHI_PLASMA_UPGRADESLOTS;
var config int  WAKIZASHI_PLASMA_PANICCHANCE;
var config bool WAKIZASHI_PLASMA_BURN;
var config bool WAKIZASHI_PLASMA_DISORIENT;
var config int  WAKIZASHI_PLASMA_STUNCHANCE;
var config string WAKIZASHI_PLASMA_ARCHETYPE;
var config string WAKIZASHI_PLASMA_ICON;
var config array<name> WAKIZASHI_PLASMA_ABILITIES;

var config WeaponDamageValue NINJATO_VORTEX_BASEDAMAGE;
var config WeaponDamageValue NINJATO_VORTEX_BASEDAMAGE_LW2;
var config int  NINJATO_VORTEX_AIM;
var config int  NINJATO_VORTEX_CRITCHANCE;
var config int  NINJATO_VORTEX_ICLIPSIZE;
var config int  NINJATO_VORTEX_ISOUNDRANGE;
var config int  NINJATO_VORTEX_IENVIRONMENTDAMAGE;
var config int  NINJATO_VORTEX_UPGRADESLOTS;
var config int  NINJATO_VORTEX_PANICCHANCE;
var config bool NINJATO_VORTEX_BURN;
var config bool NINJATO_VORTEX_DISORIENT;
var config int  NINJATO_VORTEX_STUNCHANCE;
var config bool NINJATO_VORTEX_POISON;
var config string NINJATO_VORTEX_ARCHETYPE;
var config string NINJATO_VORTEX_ICON;
var config array<name> NINJATO_VORTEX_ABILITIES;

var config WeaponDamageValue KATANA_VORTEX_BASEDAMAGE;
var config WeaponDamageValue KATANA_VORTEX_BASEDAMAGE_LW2;
var config int  KATANA_VORTEX_AIM;
var config int  KATANA_VORTEX_CRITCHANCE;
var config int  KATANA_VORTEX_ICLIPSIZE;
var config int  KATANA_VORTEX_ISOUNDRANGE;
var config int  KATANA_VORTEX_IENVIRONMENTDAMAGE;
var config int  KATANA_VORTEX_UPGRADESLOTS;
var config int  KATANA_VORTEX_PANICCHANCE;
var config bool KATANA_VORTEX_BURN;
var config bool KATANA_VORTEX_DISORIENT;
var config int  KATANA_VORTEX_STUNCHANCE;
var config string KATANA_VORTEX_ARCHETYPE;
var config string KATANA_VORTEX_ICON;
var config array<name> KATANA_VORTEX_ABILITIES;

var config WeaponDamageValue WAKIZASHI_VORTEX_BASEDAMAGE;
var config WeaponDamageValue WAKIZASHI_VORTEX_BASEDAMAGE_LW2;
var config int  WAKIZASHI_VORTEX_AIM;
var config int  WAKIZASHI_VORTEX_CRITCHANCE;
var config int  WAKIZASHI_VORTEX_ICLIPSIZE;
var config int  WAKIZASHI_VORTEX_ISOUNDRANGE;
var config int  WAKIZASHI_VORTEX_IENVIRONMENTDAMAGE;
var config int  WAKIZASHI_VORTEX_UPGRADESLOTS;
var config int  WAKIZASHI_VORTEX_PANICCHANCE;
var config bool WAKIZASHI_VORTEX_BURN;
var config bool WAKIZASHI_VORTEX_DISORIENT;
var config int  WAKIZASHI_VORTEX_STUNCHANCE;
var config string WAKIZASHI_VORTEX_ARCHETYPE;
var config string WAKIZASHI_VORTEX_ICON;
var config array<name> WAKIZASHI_VORTEX_ABILITIES;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> ModWeapons;

	ModWeapons.AddItem(CreateTemplate_Ninjato());
	ModWeapons.AddItem(CreateTemplate_Ninjato_MG());
	ModWeapons.AddItem(CreateTemplate_Ninjato_BM());
	ModWeapons.AddItem(CreateTemplate_Katana());
	ModWeapons.AddItem(CreateTemplate_Katana_Stun());
	ModWeapons.AddItem(CreateTemplate_Katana_Plasma());
	ModWeapons.AddItem(CreateTemplate_Wakizashi());
	ModWeapons.AddItem(CreateTemplate_Wakizashi_Stun());
	ModWeapons.AddItem(CreateTemplate_Wakizashi_Plasma());

	//ModWeapons.AddItem(CreateTemplate_VortexNinjato_BM());
	//ModWeapons.AddItem(CreateTemplate_VortexKatana_BM());
	//ModWeapons.AddItem(CreateTemplate_VortexWakizashi_BM());

	return ModWeapons;
}

static function X2DataTemplate CreateTemplate_Ninjato()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Ninjato_CV');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.NINJATO_CONVENTIONAL_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.NINJATO_CONVENTIONAL_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_ConvNinjato_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bNinjatoIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.NINJATO_CONVENTIONAL_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.NINJATO_CONVENTIONAL_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.NINJATO_CONVENTIONAL_UPGRADESLOTS;
		Template.Aim = default.NINJATO_CONVENTIONAL_AIM;
		Template.CritChance = default.NINJATO_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange = default.NINJATO_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.NINJATO_CONVENTIONAL_IENVIRONMENTDAMAGE;

		foreach default.NINJATO_CONVENTIONAL_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'NinjatoSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.NINJATO_SPEED_BONUS);
			}
		}

		if(default.NINJATO_CONVENTIONAL_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.NINJATO_CONVENTIONAL_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.NINJATO_CONVENTIONAL_STUNCHANCE));
		}
		if (default.NINJATO_CONVENTIONAL_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.NINJATO_CONVENTIONAL_PANICCHANCE));}
		if (default.NINJATO_CONVENTIONAL_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.NINJATO_CONVENTIONAL_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}
	Template.DamageTypeTemplateName = 'Melee';
	Template.BaseDamage.DamageType = 'Melee';

	Template.UpgradeItem = 'Ninjato_MG'; // Which item this can be upgraded to
	
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;
	
	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_MG_Schematic';

	return Template;
}

static function X2DataTemplate CreateTemplate_Ninjato_MG()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Ninjato_MG');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.NINJATO_MAGNETIC_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_MG_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.NINJATO_MAGNETIC_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_MagNinjato_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bNinjatoIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;

		Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");
		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.NINJATO_MAGNETIC_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.NINJATO_MAGNETIC_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.NINJATO_MAGNETIC_UPGRADESLOTS;
		Template.Aim = default.NINJATO_MAGNETIC_AIM;
		Template.CritChance = default.NINJATO_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = default.NINJATO_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.NINJATO_MAGNETIC_IENVIRONMENTDAMAGE;
		
		foreach default.NINJATO_MAGNETIC_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'NinjatoSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.NINJATO_SPEED_BONUS);
			}
		}

		if(default.NINJATO_MAGNETIC_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.NINJATO_MAGNETIC_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.NINJATO_MAGNETIC_STUNCHANCE, false));
		}
		if (default.NINJATO_MAGNETIC_POISON)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());}
		if (default.NINJATO_MAGNETIC_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.NINJATO_MAGNETIC_PANICCHANCE));}
		if (default.NINJATO_MAGNETIC_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.NINJATO_MAGNETIC_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}
	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.UpgradeItem = 'Ninjato_BM'; // Which item this can be upgraded to
	Template.BaseItem = 'Ninjato_CV'; // Which item this will be upgraded from
	
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_BM_Schematic';

	return Template;
}

static function X2DataTemplate CreateTemplate_Ninjato_BM()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Ninjato_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.NINJATO_BEAM_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_BM_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.NINJATO_BEAM_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_BeamNinjato_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bNinjatoIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;

		Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");
		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.NINJATO_BEAM_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.NINJATO_BEAM_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.NINJATO_BEAM_UPGRADESLOTS;
		Template.Aim = default.NINJATO_BEAM_AIM;
		Template.CritChance = default.NINJATO_BEAM_CRITCHANCE;
		Template.iSoundRange = default.NINJATO_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.NINJATO_BEAM_IENVIRONMENTDAMAGE;
		
		foreach default.NINJATO_BEAM_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'NinjatoSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.NINJATO_SPEED_BONUS);
			}
		}

		if(default.NINJATO_BEAM_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.NINJATO_BEAM_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.NINJATO_BEAM_STUNCHANCE, false));
		}
		if (default.NINJATO_BEAM_POISON)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());}
		if (default.NINJATO_BEAM_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.NINJATO_BEAM_PANICCHANCE));}
		if (default.NINJATO_BEAM_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.NINJATO_BEAM_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}
	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.BaseItem = 'Ninjato_MG'; // Which item this will be upgraded from
	
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_Katana()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Katana_CV');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.KATANA_CONVENTIONAL_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.KATANA_CONVENTIONAL_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_ConvKatana_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bKatanaIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.KATANA_CONVENTIONAL_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.KATANA_CONVENTIONAL_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.KATANA_CONVENTIONAL_UPGRADESLOTS;
		Template.Aim = default.KATANA_CONVENTIONAL_AIM;
		Template.CritChance = default.KATANA_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange = default.KATANA_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.KATANA_CONVENTIONAL_IENVIRONMENTDAMAGE;
		// Template.SetAnimationNameForAbility('WhirlwindStrike', 'FF_MeleeWhirlwhindStrike');

		foreach default.KATANA_CONVENTIONAL_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'KatanaSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.KATANA_SPEED_BONUS);
			}
		}

		if(default.KATANA_CONVENTIONAL_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.KATANA_CONVENTIONAL_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.KATANA_CONVENTIONAL_STUNCHANCE));
		}
		if (default.KATANA_CONVENTIONAL_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.KATANA_CONVENTIONAL_PANICCHANCE));}
		if (default.KATANA_CONVENTIONAL_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.KATANA_CONVENTIONAL_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}
	Template.DamageTypeTemplateName = 'Melee';
	Template.BaseDamage.DamageType = 'Melee';

	Template.UpgradeItem = 'Katana_MG'; // Which item this can be upgraded to
	
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_MG_Schematic';

	return Template;
}

static function X2DataTemplate CreateTemplate_Katana_Stun()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Katana_MG');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.KATANA_BEAM_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_MG_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.KATANA_BEAM_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_MagKatana_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bKatanaIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;

		Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");
		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.KATANA_BEAM_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.KATANA_BEAM_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.KATANA_BEAM_UPGRADESLOTS;
		Template.Aim = default.KATANA_BEAM_AIM;
		Template.CritChance = default.KATANA_BEAM_CRITCHANCE;
		Template.iSoundRange = default.KATANA_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.KATANA_BEAM_IENVIRONMENTDAMAGE;
		
		foreach default.KATANA_BEAM_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'KatanaSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.KATANA_SPEED_BONUS);
			}
		}
		
		if(default.KATANA_BEAM_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.KATANA_BEAM_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.KATANA_BEAM_STUNCHANCE, false));
		}
		if (default.KATANA_BEAM_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.KATANA_BEAM_PANICCHANCE));}
		if (default.KATANA_BEAM_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.KATANA_BEAM_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}
	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.UpgradeItem = 'Katana_BM'; // Which item this can be upgraded to
	Template.BaseItem = 'Katana_CV'; // Which item this will be upgraded from
	
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_BM_Schematic';

	return Template;
}

static function X2DataTemplate CreateTemplate_Katana_Plasma()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Katana_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.KATANA_PLASMA_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_BM_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.KATANA_PLASMA_ARCHETYPE;
	if (default.bUseSheaths)
	{
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_BeamKatana_Sheath", true);
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iRange = 0;

	if(default.bKatanaIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;

		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.KATANA_PLASMA_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.KATANA_PLASMA_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.KATANA_PLASMA_UPGRADESLOTS;
		Template.Aim = default.KATANA_PLASMA_AIM;
		Template.CritChance = default.KATANA_PLASMA_CRITCHANCE;
		Template.iSoundRange = default.KATANA_PLASMA_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.KATANA_PLASMA_IENVIRONMENTDAMAGE;

		foreach default.KATANA_PLASMA_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'KatanaSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.KATANA_SPEED_BONUS);
			}
		}

		if(default.KATANA_PLASMA_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.KATANA_PLASMA_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.KATANA_PLASMA_STUNCHANCE, false));
		}
		if (default.KATANA_PLASMA_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.KATANA_PLASMA_PANICCHANCE));}
		if (default.KATANA_PLASMA_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.KATANA_PLASMA_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}

	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.BaseItem = 'Katana_MG'; // Which item this will be upgraded from
	
	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}

static function X2DataTemplate CreateTemplate_Wakizashi()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Wakizashi_CV');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.WAKIZASHI_CONVENTIONAL_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.WAKIZASHI_CONVENTIONAL_ARCHETYPE;
	if (default.bUseSheaths)
	{
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_ConvWakizashi_Sheath", true);
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iRange = 0;

	if(default.bWakizashiIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_CONVENTIONAL_IENVIRONMENTDAMAGE;
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage =     default.WAKIZASHI_CONVENTIONAL_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage =     default.WAKIZASHI_CONVENTIONAL_BASEDAMAGE;
		}
		Template.NumUpgradeSlots =	  default.WAKIZASHI_CONVENTIONAL_UPGRADESLOTS;
		Template.Aim =			      default.WAKIZASHI_CONVENTIONAL_AIM;
		Template.CritChance =         default.WAKIZASHI_CONVENTIONAL_CRITCHANCE;
		Template.iSoundRange =        default.WAKIZASHI_CONVENTIONAL_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.WAKIZASHI_CONVENTIONAL_IENVIRONMENTDAMAGE;
		
		foreach default.WAKIZASHI_CONVENTIONAL_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'WakizashiSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.WAKIZASHI_SPEED_BONUS);
			}
		}
		
		if(default.WAKIZASHI_CONVENTIONAL_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.WAKIZASHI_CONVENTIONAL_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.WAKIZASHI_CONVENTIONAL_STUNCHANCE, false));
		}
		if (default.WAKIZASHI_CONVENTIONAL_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.WAKIZASHI_CONVENTIONAL_PANICCHANCE));}
		if (default.WAKIZASHI_CONVENTIONAL_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.WAKIZASHI_CONVENTIONAL_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}

	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.UpgradeItem = 'Wakizashi_MG'; // Which item this can be upgraded to
	
	Template.StartingItem = true;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_MG_Schematic';
		
	return Template;
}

static function X2DataTemplate CreateTemplate_Wakizashi_Stun()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Wakizashi_MG');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.WAKIZASHI_BEAM_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_MG_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.WAKIZASHI_BEAM_ARCHETYPE;
	if (default.bUseSheaths)
	{
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_MagWakizashi_Sheath", true);
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	//Template.bAlwaysUnique = true; 
	Template.iRange = 0;

	if(default.bWakizashiIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;

		Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");
		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage =     default.WAKIZASHI_BEAM_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage =     default.WAKIZASHI_BEAM_BASEDAMAGE;
		}
		Template.NumUpgradeSlots =	  default.WAKIZASHI_BEAM_UPGRADESLOTS;
		Template.Aim =			      default.WAKIZASHI_BEAM_AIM;
		Template.CritChance =         default.WAKIZASHI_BEAM_CRITCHANCE;
		Template.iSoundRange =        default.WAKIZASHI_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.WAKIZASHI_BEAM_IENVIRONMENTDAMAGE;
	
		foreach default.WAKIZASHI_BEAM_ABILITIES  (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'WakizashiSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.WAKIZASHI_SPEED_BONUS);
			}
		}

		if(default.WAKIZASHI_BEAM_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.WAKIZASHI_BEAM_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.WAKIZASHI_BEAM_STUNCHANCE, false));
		}
		if (default.WAKIZASHI_BEAM_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.WAKIZASHI_BEAM_PANICCHANCE));}
		if (default.WAKIZASHI_BEAM_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.WAKIZASHI_BEAM_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}

	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';

	Template.UpgradeItem = 'Wakizashi_BM'; // Which item this can be upgraded to
	Template.BaseItem = 'Wakizashi_CV'; // Which item this will be upgraded from

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	if (default.bHidePreviousTiers)
		Template.HideIfPurchased = 'Sword_BM_Schematic';

	return Template;
}

static function X2DataTemplate CreateTemplate_Wakizashi_Plasma()
{
	local X2WeaponTemplate Template;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'Wakizashi_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.WAKIZASHI_PLASMA_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	Template.CreatorTemplateName = 'Sword_BM_Schematic';

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.WAKIZASHI_PLASMA_ARCHETYPE;
	if (default.bUseSheaths)
	{
		Template.AddDefaultAttachment('Sheath', "KatanaPkg.Meshes.SM_BeamWakizashi_Sheath", true);
		//Template.GameplayInstanceClass = class'XGWeaponTintableSheath';
	}

	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	
	Template.iRange = 0;
	
	if(default.bWakizashiIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;

		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage =     default.WAKIZASHI_PLASMA_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage =     default.WAKIZASHI_PLASMA_BASEDAMAGE;
		}
		Template.NumUpgradeSlots =	  default.WAKIZASHI_PLASMA_UPGRADESLOTS;
		Template.Aim =			      default.WAKIZASHI_PLASMA_AIM;Template.BaseDamage.DamageType = 'Melee';
		Template.CritChance =         default.WAKIZASHI_PLASMA_CRITCHANCE;
		Template.iSoundRange =        default.WAKIZASHI_PLASMA_ISOUNDRANGE;Template.UpgradeItem = 'Sword_MG';
		Template.iEnvironmentDamage = default.WAKIZASHI_PLASMA_IENVIRONMENTDAMAGE;
		
		foreach default.WAKIZASHI_PLASMA_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'WakizashiSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.WAKIZASHI_SPEED_BONUS);
			}
		}

		if(default.WAKIZASHI_PLASMA_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.WAKIZASHI_PLASMA_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.WAKIZASHI_PLASMA_STUNCHANCE, false));
		}
		if (default.WAKIZASHI_PLASMA_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.WAKIZASHI_PLASMA_PANICCHANCE));}
		if (default.WAKIZASHI_PLASMA_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.WAKIZASHI_PLASMA_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
	}

	Template.DamageTypeTemplateName = 'Melee';

	Template.BaseItem = 'Wakizashi_MG'; // Which item this will be upgraded from

	Template.StartingItem = false;
	Template.CanBeBuilt = false;
	Template.bInfiniteItem = true;

	return Template;
}


// -------------------------------------------------
// Specials
// -------------------------------------------------
static function X2DataTemplate CreateTemplate_VortexNinjato_BM()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'VortexNinjato_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.NINJATO_VORTEX_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.NINJATO_VORTEX_ARCHETYPE;
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;

	Template.iRange = 0;

	if(default.bNinjatoIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_IENVIRONMENTDAMAGE;

		Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, , , "%");
		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, class'X2Item_DefaultWeapons'.default.RANGERSWORD_MAGNETIC_STUNCHANCE, false));

		Template.CreatorTemplateName = 'Sword_BM_Schematic';
		Template.BaseItem = 'Ninjato_MG'; // Which item this will be upgraded from
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.NINJATO_VORTEX_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.NINJATO_VORTEX_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.NINJATO_VORTEX_UPGRADESLOTS;
		Template.Aim = default.NINJATO_VORTEX_AIM;
		Template.CritChance = default.NINJATO_VORTEX_CRITCHANCE;
		Template.iSoundRange = default.NINJATO_VORTEX_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.NINJATO_VORTEX_IENVIRONMENTDAMAGE;
		
		foreach default.NINJATO_VORTEX_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'NinjatoSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.NINJATO_SPEED_BONUS);
			}
		}
		//Template.Abilities.AddItem('MusashiSpiderSuit');

		if(default.NINJATO_VORTEX_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.NINJATO_VORTEX_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.NINJATO_VORTEX_STUNCHANCE, false));
		}
		if (default.NINJATO_VORTEX_POISON)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreatePoisonedStatusEffect());}
		if (default.NINJATO_VORTEX_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.NINJATO_VORTEX_PANICCHANCE));}
		if (default.NINJATO_VORTEX_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.NINJATO_VORTEX_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}

		// Requirements
		Template.Requirements.RequiredTechs.AddItem('CodexBrainPt1');
		Template.Requirements.RequiredEngineeringScore = 20;
		Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

		// Cost
		Resources.ItemTemplateName = 'CorpseCyberus';
		Resources.Quantity = 1;
		Template.Cost.ArtifactCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = 200;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}
	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';
		
	Template.StartingItem = false;
	Template.CanBeBuilt = !default.bNinjatoIsCosmetic;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate CreateTemplate_VortexKatana_BM()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'VortexKatana_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.KATANA_VORTEX_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;
	
	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.KATANA_VORTEX_ARCHETYPE;
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	Template.iRange = 0;

	if(default.bKatanaIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;

		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));

		Template.CreatorTemplateName = 'Sword_BM_Schematic';
		Template.BaseItem = 'Katana_MG'; // Which item this will be upgraded from
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage = default.KATANA_VORTEX_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage = default.KATANA_VORTEX_BASEDAMAGE;
		}
		Template.NumUpgradeSlots = default.KATANA_VORTEX_UPGRADESLOTS;
		Template.Aim = default.KATANA_VORTEX_AIM;
		Template.CritChance = default.KATANA_VORTEX_CRITCHANCE;
		Template.iSoundRange = default.KATANA_VORTEX_ISOUNDRANGE;
		Template.iEnvironmentDamage = default.KATANA_VORTEX_IENVIRONMENTDAMAGE;

		foreach default.KATANA_VORTEX_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'KatanaSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.KATANA_SPEED_BONUS);
			}
		}

		if(default.KATANA_VORTEX_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.KATANA_VORTEX_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.KATANA_VORTEX_STUNCHANCE, false));
		}
		if (default.KATANA_VORTEX_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.KATANA_VORTEX_PANICCHANCE));}
		if (default.KATANA_VORTEX_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.KATANA_VORTEX_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}
		
		// Requirements
		Template.Requirements.RequiredTechs.AddItem('CodexBrainPt1');
		Template.Requirements.RequiredEngineeringScore = 20;
		Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

		// Cost
		Resources.ItemTemplateName = 'CorpseCyberus';
		Resources.Quantity = 1;
		Template.Cost.ArtifactCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = 200;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	Template.BaseDamage.DamageType = 'Melee';
	Template.DamageTypeTemplateName = 'Melee';
		
	Template.StartingItem = false;
	Template.CanBeBuilt = !default.bKatanaIsCosmetic;
	Template.bInfiniteItem = false;

	return Template;
}

static function X2DataTemplate CreateTemplate_VortexWakizashi_BM()
{
	local X2WeaponTemplate Template;
	local ArtifactCost Resources;
	local name Ability;

	`CREATE_X2TEMPLATE(class'X2WeaponTemplate', Template, 'VortexWakizashi_BM');
	Template.WeaponPanelImage = "_Sword";                       // used by the UI. Probably determines iconview of the weapon.

	Template.ItemCat = 'weapon';
	Template.WeaponCat = 'sword';
	Template.WeaponTech = 'conventional';
	Template.strImage = default.WAKIZASHI_VORTEX_ICON;
	Template.EquipSound = "Sword_Equip_Conventional";
	Template.InventorySlot = eInvSlot_SecondaryWeapon;
	Template.StowedLocation = eSlot_RightBack;

	// This all the resources; sounds, animations, models, physics, the works.
	Template.GameArchetype = default.WAKIZASHI_VORTEX_ARCHETYPE;
	Template.Tier = 0;

	Template.iRadius = 1;
	Template.InfiniteAmmo = true;
	Template.iPhysicsImpulse = 5;
	
	Template.iRange = 0;
	
	if(default.bWakizashiIsCosmetic)
	{
		Template.NumUpgradeSlots = 1;
		Template.BaseDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_BASEDAMAGE;
		Template.Aim = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_AIM;
		Template.CritChance = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_CRITCHANCE;
		Template.iSoundRange = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_ISOUNDRANGE;
		Template.iEnvironmentDamage = class'X2Item_DefaultWeapons'.default.RANGERSWORD_BEAM_IENVIRONMENTDAMAGE;

		Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));

		Template.CreatorTemplateName = 'Sword_BM_Schematic';
		Template.BaseItem = 'Wakizashi_MG'; // Which item this will be upgraded from
	}
	else
	{
		if (IsLW2Installed())
		{
			Template.BaseDamage =     default.WAKIZASHI_VORTEX_BASEDAMAGE_LW2;
		}
		else
		{
			Template.BaseDamage =     default.WAKIZASHI_VORTEX_BASEDAMAGE;
		}
		Template.NumUpgradeSlots =    default.WAKIZASHI_VORTEX_UPGRADESLOTS;
		Template.Aim =			      default.WAKIZASHI_VORTEX_AIM;Template.BaseDamage.DamageType = 'Melee';
		Template.CritChance =         default.WAKIZASHI_VORTEX_CRITCHANCE;
		Template.iSoundRange =        default.WAKIZASHI_VORTEX_ISOUNDRANGE;Template.UpgradeItem = 'Sword_MG';
		Template.iEnvironmentDamage = default.WAKIZASHI_VORTEX_IENVIRONMENTDAMAGE;
		
		foreach default.WAKIZASHI_VORTEX_ABILITIES (Ability)
		{
			Template.Abilities.AddItem(Ability);
			if (Ability == 'WakizashiSpeedBonus')
			{
				Template.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, class'X2Ability_ModAbilities'.default.WAKIZASHI_SPEED_BONUS);
			}
		}

		if(default.WAKIZASHI_VORTEX_STUNCHANCE > 0)
		{
			Template.SetUIStatMarkup(class'XLocalizedData'.default.StunChanceLabel, , default.WAKIZASHI_VORTEX_STUNCHANCE, , , "%");
			Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.WAKIZASHI_VORTEX_STUNCHANCE, false));
		}
		if (default.WAKIZASHI_VORTEX_PANICCHANCE > 0)
			{Template.BonusWeaponEffects.AddItem(class'Musashi_Status_Effects'.static.CreatePanickedStatusEffectChance(default.WAKIZASHI_VORTEX_PANICCHANCE));}
		if (default.WAKIZASHI_VORTEX_BURN)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateBurningStatusEffect(2, 0));}
		if (default.WAKIZASHI_VORTEX_DISORIENT)
			{Template.BonusWeaponEffects.AddItem(class'X2StatusEffects'.static.CreateDisorientedStatusEffect());}

		// Requirements
		Template.Requirements.RequiredTechs.AddItem('CodexBrainPt1');
		Template.Requirements.RequiredEngineeringScore = 20;
		Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

		// Cost
		Resources.ItemTemplateName = 'CorpseCyberus';
		Resources.Quantity = 1;
		Template.Cost.ArtifactCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'Supplies';
		Resources.Quantity = 200;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'AlienAlloy';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);

		Resources.ItemTemplateName = 'EleriumDust';
		Resources.Quantity = 10;
		Template.Cost.ResourceCosts.AddItem(Resources);
	}

	Template.DamageTypeTemplateName = 'Melee';

	Template.StartingItem = false;
	Template.CanBeBuilt = !default.bWakizashiIsCosmetic;
	Template.bInfiniteItem = false;

	return Template;
}

static function bool IsLW2Installed()
{
	local X2DownloadableContentInfo Mod;
	foreach `ONLINEEVENTMGR.m_cachedDLCInfos (Mod)
	{
		if (Mod.Class.Name == 'X2DownloadableContentInfo_LW_Overhaul')
		{
			`Log("LW2 Mod installed:" @ Mod.Class);
			return true;
		}
	}

	return false;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}