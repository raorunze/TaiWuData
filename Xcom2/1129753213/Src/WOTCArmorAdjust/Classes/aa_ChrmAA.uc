// Utility class for Charmed's armor adjust.
class aa_ChrmAA extends Object;
`include(WOTCArmorAdjust/Src/ModConfigMenuAPI/MCM_API_CfgHelpers.uci);

struct VestStats
{
	var name ItemName;
	var name AbilityName;
	var int hp;
	var int shield;
	var int armor;
	var int mob;
	var int dodge;
	var int defense;
	var int aim;
	var int hack;
	var int will;
	var int crit;
	var int pierce;
	var int psi;
	var int flankcrit;
	var int flankaim;
	var float sneak;
	var array<name> abilities;
};

struct ArmorStats
{
	var name ItemName;
	var name AbilityName;
	var int hp;
	var int shield;
	var int armor;
	var int mob;
	var int dodge;
	var int defense;
	var int aim;
	var int hack;
	var int will;
	var int crit;
	var int pierce;
	var int psi;
	var int flankcrit;
	var int flankaim;
	var float sneak;
	var bool utilityslot;
	var bool heavyweapon;
	var array<name> abilities;
};

`MCM_CH_VersionChecker(class'WOTCArmorAdjust_MCMConfig'.default.CONFIG_VERSION,class'WOTCArmorAdjust_MCMListener'.default.CONFIG_VERSION)

function VestStats GrabVestConfigVars(name ItemName)
{
	//local array<VestStats> List;
	local int idx;
	for(idx=0;idx<class 'aa_X2Ability_ArmorBonii'.default.VestList.Length;idx++)
	{
		if(ItemName == class'aa_X2Ability_ArmorBonii'.default.VestList[idx].ItemName)
			return class'aa_X2Ability_ArmorBonii'.default.VestList[idx];
		//List.AddItem(class 'aa_X2Ability_ArmorBonii'.VestList[idx]);
	}
}

function ArmorStats GrabArmorConfigVars(name ItemName)
{
	local int idx;
	for(idx=0;idx<class'aa_X2Ability_ArmorBonii'.default.ArmorList.Length;idx++)
	{
		if(ItemName == class'aa_X2Ability_ArmorBonii'.default.ArmorList[idx].ItemName)
			return class'aa_X2Ability_ArmorBonii'.default.ArmorList[idx];
		//List.AddItem(class 'aa_X2Ability_ArmorBonii'.VestList[idx]);
	}
}

function float BetaStrikifyShields()
{
	return `MCM_CH_GetValue(class'WOTCArmorAdjust_MCMConfig'.default.BetaStrikifyShields,class'WOTCArmorAdjust_MCMListener'.default.BetaStrikifyShields);
}