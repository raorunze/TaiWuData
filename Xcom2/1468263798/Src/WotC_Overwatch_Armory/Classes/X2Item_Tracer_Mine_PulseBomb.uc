
class X2Item_Tracer_Mine_PulseBomb extends X2Item config(Weapon_MD_WOTC_OW_PULSE_BOMB);

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

struct GrenadeAbilitiesDefs
{
	var name AbilityName;
	var string IconOverrideName;

	structdefaultproperties
	{
		AbilityName = none;
		IconOverrideName = "";
	}
};

//E3245: Custom Config Declarations
var config string P_MINE_OW_PULSEBOMB_UIIMAGE;
var config string P_MINE_OW_PULSEBOMB_ARCHETYPEPATH;
var config string P_MINE_OW_PULSEBOMB_EQUIPSOUND;

var config name P_MINE_OW_PULSEBOMB_WEAPONCATEGORY;
var config name P_MINE_OW_PULSEBOMB_ITEMCATEGORY;

var config array<GrenadeAbilitiesDefs> GrenadeAbilities;
var config array<EngineeringBuildDefs> BuildGrenadeinEngineering;

var config name P_MINE_OW_PULSEBOMB_DAMAGETYPE;
var config int P_MINE_OW_PULSEBOMB_TIER;
var config int P_MINE_OW_PULSEBOMB_PHYSICSIMPULSE;

var config name P_MINE_OW_PULSEBOMB_REQUIREDTECH;
var config bool P_MINE_OW_PULSEBOMB_STARTINGITEM; //true
var config bool P_MINE_OW_PULSEBOMB_CANBEBUILT; //false
var config bool P_MINE_OW_PULSEBOMB_INFINITEITEM; //true

var config name P_MINE_OW_PULSEBOMB_VOICE_BARK;

var config WeaponDamageValue P_MINE_OW_PULSEBOMB_BASEDAMAGE;
var config int P_MINE_OW_PULSEBOMB_ISOUNDRANGE;
var config int P_MINE_OW_PULSEBOMB_IENVIRONMENTDAMAGE;
var config int P_MINE_OW_PULSEBOMB_ISUPPLIES;
var config int P_MINE_OW_PULSEBOMB_TRADINGPOSTVALUE;
var config int P_MINE_OW_PULSEBOMB_IPOINTS;
var config int P_MINE_OW_PULSEBOMB_ICLIPSIZE;
var config int P_MINE_OW_PULSEBOMB_RANGE;
var config int P_MINE_OW_PULSEBOMB_RADIUS;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Grenades;

	Grenades.AddItem(CreateOWPulseBomb());

	return Grenades;
}

static function X2GrenadeTemplate CreateOWPulseBomb()
{
	local X2GrenadeTemplate Template;
	local ArtifactCost Resources;
	local int i;

	`CREATE_X2TEMPLATE(class'X2GrenadeTemplate', Template, 'MD_WOTC_OW_PULSE_BOMB');

	Template.strImage = default.P_MINE_OW_PULSEBOMB_UIIMAGE;
	Template.EquipSound = default.P_MINE_OW_PULSEBOMB_EQUIPSOUND;
	Template.iRange = default.P_MINE_OW_PULSEBOMB_RANGE;
	Template.iRadius = default.P_MINE_OW_PULSEBOMB_RADIUS;
	Template.iClipSize = default.P_MINE_OW_PULSEBOMB_ICLIPSIZE;
	Template.WeaponCat = default.P_MINE_OW_PULSEBOMB_WEAPONCATEGORY; //'utility'
	Template.ItemCat = default.P_MINE_OW_PULSEBOMB_ITEMCATEGORY; //'utility'

	Template.BaseDamage = default.P_MINE_OW_PULSEBOMB_BASEDAMAGE;
	Template.iSoundRange = default.P_MINE_OW_PULSEBOMB_ISOUNDRANGE;
	Template.iEnvironmentDamage = default.P_MINE_OW_PULSEBOMB_IENVIRONMENTDAMAGE;
	Template.DamageTypeTemplateName = default.P_MINE_OW_PULSEBOMB_DAMAGETYPE;
	Template.Tier = default.P_MINE_OW_PULSEBOMB_TIER;

	Template.bOverrideConcealmentRule = true;               //  override the normal behavior for the throw or launch grenade ability
	Template.OverrideConcealmentRule = eConceal_Always;     //  always stay concealed when throwing or launching a proximity mine
	
	Template.GameArchetype = default.P_MINE_OW_PULSEBOMB_ARCHETYPEPATH;

	Template.iPhysicsImpulse = default.P_MINE_OW_PULSEBOMB_PHYSICSIMPULSE;

	Template.CanBeBuilt = default.P_MINE_OW_PULSEBOMB_CANBEBUILT;
	Template.StartingItem = default.P_MINE_OW_PULSEBOMB_STARTINGITEM;
	Template.bInfiniteItem = default.P_MINE_OW_PULSEBOMB_INFINITEITEM;
		
	Template.TradingPostValue = default.P_MINE_OW_PULSEBOMB_TRADINGPOSTVALUE;
	
	Template.Abilities.AddItem(class'X2Ability_PulseBomb'.default.PulseBombDetonationAbilityName);

	//Abilities Loop
	if (default.GrenadeAbilities.Length > 0)
	{
		//Loop until the end of the length of the array
		for (i = 0; i < default.GrenadeAbilities.Length; i++)
		{
			//Add the ability name at index [i]
			Template.Abilities.AddItem(default.GrenadeAbilities[i].AbilityName);
			//Check if the name at index [i] also has a IconOverrideName string. 
			//It doesn't check if the string is valid though
			if (Len(default.GrenadeAbilities[i].IconOverrideName) > 0)
			{
				//Special case. If the Abilty 'ThrowGrenade' is defined in the config file
				if (default.GrenadeAbilities[i].AbilityName == 'ThrowGrenade')
				{
					//Add Ability Icon Overrides for both ThrowGrenade and it's child ability, LaunchGrenade
					Template.AddAbilityIconOverride(default.GrenadeAbilities[i].AbilityName, default.GrenadeAbilities[i].IconOverrideName);
					Template.AddAbilityIconOverride('LaunchGrenade', default.GrenadeAbilities[i].IconOverrideName);
				}
				else
				{
					//Otherwise add the icon override
					Template.AddAbilityIconOverride(default.GrenadeAbilities[i].AbilityName, default.GrenadeAbilities[i].IconOverrideName);
				}
			}
		}
	}
	else
	{
		//Add the default abilities
		Template.Abilities.AddItem('ThrowGrenade');
		Template.Abilities.AddItem(class'X2Ability_PulseBomb'.default.PulseBombDetonationAbilityName);
		Template.Abilities.AddItem('GrenadeFuse');

		Template.AddAbilityIconOverride('ThrowGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_proximitymine");
		Template.AddAbilityIconOverride('LaunchGrenade', "img:///UILibrary_PerkIcons.UIPerk_grenade_proximitymine");
	}
	
	// Requirements
	Template.Requirements.RequiredTechs.AddItem(default.P_MINE_OW_PULSEBOMB_REQUIREDTECH);

	// Cost
	if (default.P_MINE_OW_PULSEBOMB_CANBEBUILT == true)
	{
		//Read from the struct in the config
		for(i = 0; i < default.BuildGrenadeinEngineering.Length; i++)
		{
			Resources.ItemTemplateName = default.BuildGrenadeinEngineering[i].ResourcesItemTemplateName;
			Resources.Quantity = default.BuildGrenadeinEngineering[i].Quantity;
			Template.Cost.ResourceCosts.AddItem(Resources);
		}
	}

	Template.SetUIStatMarkup(class'XLocalizedData'.default.RangeLabel, , default.P_MINE_OW_PULSEBOMB_RANGE);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.RadiusLabel, , default.P_MINE_OW_PULSEBOMB_RADIUS);
	Template.SetUIStatMarkup(class'XLocalizedData'.default.ShredLabel, , default.P_MINE_OW_PULSEBOMB_BASEDAMAGE.Shred);
	
	return Template;
}

defaultproperties
{
	bShouldCreateDifficultyVariants = true
}