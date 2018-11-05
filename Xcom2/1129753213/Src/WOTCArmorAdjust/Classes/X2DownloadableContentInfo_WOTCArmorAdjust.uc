//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_WOTCArmorAdjust.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_WOTCArmorAdjust extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	EditItems();
}

static function EditItems()
{
	local X2ItemTemplateManager				ItemMgr;
	local X2ArmorTemplate					ArmorTemplate, Armor;
	local X2DataTemplate					DifficultyTemplate, Iter;
	local array<X2DataTemplate>				DifficultyTemplates;
	local X2EquipmentTemplate				VestTemplate, Vest;
	local int								idx, ndx;
	local aa_ChrmAA							Getter;
	local VestStats							VestConfigVars;
	local ArmorStats						ArmorConfigVars;
	
	Getter = new class'aa_ChrmAA';
	
	ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	foreach ItemMgr.IterateTemplates(Iter, none)
	{
		//Vests block
		VestTemplate = X2EquipmentTemplate(Iter);
		for(ndx=0;ndx<class 'aa_X2Ability_ArmorBonii'.default.VestList.Length;ndx++)
		{
			if(class 'aa_X2Ability_ArmorBonii'.default.VestList[ndx].ItemName == VestTemplate.DataName)
			{
				VestConfigVars = Getter.GrabVestConfigVars(VestTemplate.DataName);
				ItemMgr.FindDataTemplateAllDifficulties(VestTemplate.DataName, DifficultyTemplates);
				foreach DifficultyTemplates(DifficultyTemplate) 
				{
					Vest = X2EquipmentTemplate(DifficultyTemplate);
					//Purge original abilities
					Vest.Abilities.Length = 0;
					//Add the core ability
					Vest.Abilities.AddItem(VestConfigVars.AbilityName);
					/*//Add the sub abilities???
					for(idx=0;idx<VestConfigVars.abilities.Length;idx++)
					{
						Vest.Abilities.AddItem(VestConfigVars.abilities)
					}
					*/
					Vest.UIStatMarkups.Length=0;
					if(VestConfigVars.hp != 0)
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, VestConfigVars.hp, true);
					if(VestConfigVars.armor != 0)
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, VestConfigVars.armor, true);
					if(VestConfigVars.mob != 0)
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, VestConfigVars.mob, true);
					if(VestConfigVars.dodge != 0)
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, VestConfigVars.dodge, true);
					if(VestConfigVars.defense != 0)
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, VestConfigVars.defense, true);
					if(VestConfigVars.aim != 0)	
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, VestConfigVars.aim, true);
					if(VestConfigVars.hack != 0)	
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.TechLabel, eStat_Hacking, VestConfigVars.hack, true);
					if(VestConfigVars.will != 0)	
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, VestConfigVars.will, true);
					if(VestConfigVars.psi != 0)	
						Vest.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseLabel, eStat_PsiOffense, VestConfigVars.psi, true);
				}
			}
		}
		//Armors block
		ArmorTemplate = X2ArmorTemplate(Iter);
		for(ndx=0;ndx<class 'aa_X2Ability_ArmorBonii'.default.ArmorList.Length;ndx++)
		{
			if(class 'aa_X2Ability_ArmorBonii'.default.ArmorList[ndx].ItemName == ArmorTemplate.DataName)
			{
				ArmorConfigVars = Getter.GrabArmorConfigVars(ArmorTemplate.DataName);
				ItemMgr.FindDataTemplateAllDifficulties(ArmorTemplate.DataName, DifficultyTemplates);
				foreach DifficultyTemplates(DifficultyTemplate) 
				{
					Armor = X2ArmorTemplate(DifficultyTemplate);
					//Purge original abilities
					Armor.Abilities.Length = 0;
					//Add the core ability
					Armor.Abilities.AddItem(ArmorConfigVars.AbilityName);
					
					//For armors, also need the heavyweapon and utilityslot bools.
					Armor.bHeavyWeapon = ArmorConfigVars.heavyweapon;
					Armor.bAddsUtilitySlot = ArmorConfigVars.utilityslot;
					/*//Add the sub abilities? It is ~probably~ fine for these to be bound to the core ability rather than the armor.
					for(idx=0;idx<ArmorConfigVars.abilities.Length;idx++)
					{
						Armor.Abilities.AddItem(ArmorConfigVars.abilities)
					}
					*/
					//Purge markups, if markup needed, add it.
					Armor.UIStatMarkups.Length=0;
					if(ArmorConfigVars.hp != 0)
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.HealthLabel, eStat_HP, ArmorConfigVars.hp, true);
					if(ArmorConfigVars.armor != 0)
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.ArmorLabel, eStat_ArmorMitigation, ArmorConfigVars.armor, true);
					if(ArmorConfigVars.mob != 0)
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.MobilityLabel, eStat_Mobility, ArmorConfigVars.mob, true);
					if(ArmorConfigVars.dodge != 0)
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.DodgeLabel, eStat_Dodge, ArmorConfigVars.dodge, true);
					if(ArmorConfigVars.defense != 0)
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.DefenseLabel, eStat_Defense, ArmorConfigVars.defense, true);
					if(ArmorConfigVars.aim != 0)	
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.AimLabel, eStat_Offense, ArmorConfigVars.aim, true);
					if(ArmorConfigVars.hack != 0)	
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.TechLabel, eStat_Hacking, ArmorConfigVars.hack, true);
					if(ArmorConfigVars.will != 0)	
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.WillLabel, eStat_Will, ArmorConfigVars.will, true);
					if(ArmorConfigVars.psi != 0)	
						Armor.SetUIStatMarkup(class'XLocalizedData'.default.PsiOffenseLabel, eStat_PsiOffense, ArmorConfigVars.psi, true);
				}
			}
		}
	}
}

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}
