///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Every Mod gets one of these files, DO NOT MESS WITH THIS
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_WotCRichardsClassesVanilla.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_WotCRichardsClassesVanilla extends X2DownloadableContentInfo;

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

// Updates localization strings from config file values (Credit to shiremct for helping me with this)
static function bool AbilityTagExpandHandler(string InString, out string OutString)
{
	local name TagText;
	//local int i;
	
	TagText = name(InString);
	switch (TagText)
	{
//Shared Perks
	case 'ACTIONPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.ACTIONPROTOCOLRS_CHARGES);
			return true;
	case 'AIMASSISTRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.AIMASSISTRS_AIMBONUS);
			return true;
	case 'BARRIERRS_HEALTH':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BARRIERRS_HEALTH);
			return true;
	case 'BARRIERRS_DURATION':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BARRIERRS_DURATION);
			return true;
	case 'BLADEFIGHTERRS_AIM':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BLADEFIGHTERRS_AIM);
			return true;
	case 'BLADEFIGHTERRS_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BLADEFIGHTERRS_CRIT);
			return true;
	case 'BLITZRS_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BLITZRS_CRIT);
			return true;
	case 'BURNPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BURNPROTOCOLRS_CHARGES);
			return true;
	case 'BURNPROTOCOLRS_DAMAGEPERTICK':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.BURNPROTOCOLRS_DAMAGEPERTICK);
			return true;
	case 'CAPACITORDISCHARGERS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.CAPACITORDISCHARGERS_CHARGES);
			return true;
	case 'COMBATPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.COMBATPROTOCOLRS_CHARGES);
			return true;
	case 'DEATHMARKRS_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.DEATHMARKRS_CRIT);
			return true;
	case 'DISABLERS_STUNCHANCE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.DISABLERS_STUNCHANCE);
			return true;
	case 'DISTORTIONFIELDRS_DEFENSE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.DISTORTIONFIELDRS_DEFENSE);
			return true;
	case 'EXPLOSIVESHOTRS_RUPTURE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.EXPLOSIVESHOTRS_RUPTURE);
			return true;
	case 'EXTRADARTSRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.EXTRADARTSRS_CHARGES);
			return true;
	case 'EXTRALAYERSRS_ARMOR':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.EXTRALAYERSRS_ARMOR);
			return true;
	case 'FIELDMEDICRS_MEDIKITCHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.FIELDMEDICRS_MEDIKITCHARGES);
			return true;
	case 'FIRSTAIDERRS_MEDIKITCHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.FIRSTAIDERRS_MEDIKITCHARGES);
			return true;
	case 'FLASHFIRERS_AIM_PENALTY':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.FLASHFIRERS_AIM_PENALTY);
			return true;
	case 'FLASHROUNDRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.FLASHROUNDRS_AIMBONUS);
			return true;
	case 'FORTITUDERS_DEFENSE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.FORTITUDERS_DEFENSE);
			return true;
	case 'GATLINGFIRERS_AIMPENALTY':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.GATLINGFIRERS_AIMPENALTY);
			return true;
	case 'HEALINGDARTSRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.HEALINGDARTSRS_CHARGES);
			return true;
	case 'HIPFIRERS_PENALTY':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.HIPFIRERS_PENALTY);
			return true;
	case 'KILLCAMRS_CRITBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.KILLCAMRS_CRITBONUS);
			return true;
	case 'KILLCAMRS_DODGEBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.KILLCAMRS_DODGEBONUS);
			return true;
	case 'LACERATERS_CRITBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.LACERATERS_CRITBONUS);
			return true;
	case 'MAKEITCOUNTRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.MAKEITCOUNTRS_AIMBONUS);
			return true;
	case 'MARKTARGETRS_HIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.MARKTARGETRS_HIT);
			return true;
	case 'MERCILESSRS_DMG':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.MERCILESSRS_DMG);
			return true;
	case 'MERCILESSRS_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.MERCILESSRS_CRIT);
			return true;
	case 'MUTERS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.MUTERS_CHARGES);
			return true;
	case 'OVERCHARGERS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.OVERCHARGERS_CHARGES);
			return true;
	case 'PARAMEDICRS_MEDIKITCHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.PARAMEDICRS_MEDIKITCHARGES);
			return true;
	case 'POTSHOTRS_AIM_PENALTY':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.POTSHOTRS_AIM_PENALTY);
			return true;
	case 'PUGLISTRS_DMGBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.PUGLISTRS_DMGBONUS);
			return true;
	case 'PUGLISTRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.PUGLISTRS_AIMBONUS);
			return true;
	case 'PUNISHERRS_CRITBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.PUNISHERRS_CRITBONUS);
			return true;
	case 'REPAIRPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.REPAIRPROTOCOLRS_CHARGES);
			return true;
	case 'REPAIRPROTOCOLRS_AMOUNTREPAIRED':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.REPAIRPROTOCOLRS_AMOUNTREPAIRED);
			return true;
	case 'RESTORERS_HEAL':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.RESTORERS_HEAL);
			return true;
	case 'REVITALIZERS_ACTIONPOINTSRESTORED':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.REVITALIZERS_ACTIONPOINTSRESTORED);
			return true;
	case 'REVITALIZERS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.REVITALIZERS_CHARGES);
			return true;
	case 'SAPPERRS_DMGBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SAPPERRS_DMGBONUS);
			return true;
	case 'SCANNINGPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SCANNINGPROTOCOLRS_CHARGES);
			return true;
	case 'SEEKANDDESTROYRS_CHANCE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SEEKANDDESTROYRS_CHANCE);
			return true;
	case 'SHADEPROTOCOLRS_MOBILITYBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SHADEPROTOCOLRS_MOBILITYBONUS);
			return true;
	case 'SHADOWSHOTRS_AIM_BONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SHADOWSHOTRS_AIM_BONUS);
			return true;
	case 'SHADOWSHOTRS_CRIT_BONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SHADOWSHOTRS_CRIT_BONUS);
			return true;
	case 'SHOCKPROTOCOLRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SHOCKPROTOCOLRS_CHARGES);
			return true;
	case 'SHOCKPROTOCOLRS_STUNDURATION':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SHOCKPROTOCOLRS_STUNDURATION);
			return true;
	case 'SIDEARMSPECIALISTRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SIDEARMSPECIALISTRS_AIMBONUS);
			return true;
	case 'SIDEARMSPECIALISTRS_DMGBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SIDEARMSPECIALISTRS_DMGBONUS);
			return true;
	case 'SNAPSHOTRS_PENALTY_AIM':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SNAPSHOTRS_PENALTY_AIM);
			return true;
	case 'SNAPSHOTRS_PENALTY_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SNAPSHOTRS_PENALTY_CRIT);
			return true;
	case 'STICKANDMOVERS_DEFENSE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.STICKANDMOVERS_DEFENSE);
			return true;
	case 'STICKANDMOVERS_MOBILITY':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.STICKANDMOVERS_MOBILITY);
			return true;
	case 'STILLNESSRS_CHARGES':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.STILLNESSRS_CHARGES);
			return true;
	case 'SURPRISESHOTRS_AIM_BONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SURPRISESHOTRS_AIM_BONUS);
			return true;
	case 'SURPRISESHOTRS_CRIT_BONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SURPRISESHOTRS_CRIT_BONUS);
			return true;
	case 'SURPRISESHOTRS_STUN_TURNS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SURPRISESHOTRS_STUN_TURNS);
			return true;
	case 'SWATSHIELDRS_SHIELDPOINTS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SWATSHIELDRS_SHIELDPOINTS);
			return true;
	case 'SWATSHIELDRS_DURATION':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SWATSHIELDRS_DURATION);
			return true;
	case 'SWATTAKEDOWNRS_STUNCHANCE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SWATTAKEDOWNRS_STUNCHANCE);
			return true;
	case 'SWATTAKEDOWNRS_STUNDURATION':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.SWATTAKEDOWNRS_STUNDURATION);
			return true;
	case 'WALKFIRERS_AIM':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WALKFIRERS_AIM);
			return true;
	case 'WALKFIRERS_CRIT':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WALKFIRERS_CRIT);
			return true;
	case 'WARNINGSHOTRS_AIMBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WARNINGSHOTRS_AIMBONUS);
			return true;
	case 'WEAPONEXPERTRS_DMGBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WEAPONEXPERTRS_DMGBONUS);
			return true;
	case 'WEAPONSPECIALISTRS_DMGBONUS':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WEAPONSPECIALISTRS_DMGBONUS);
			return true;
	case 'WOUNDINGSHOTRS_RUPTURE':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.WOUNDINGSHOTRS_RUPTURE);
			return true;
	case 'ZEROINRS_AIM':
			OutString = string(class'X2Ability_SharedPerksRSAbilitySet'.default.ZEROINRS_AIM);
			return true;
//GTS Perks
	case 'IRONRESOLVERS_DEFENSE':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.IRONRESOLVERS_DEFENSE);
			return true;
	case 'IRONRESOLVERS_WILL':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.IRONRESOLVERS_WILL);
			return true;
	case 'HIDDENPOTENTIAL_PSIOFFENSE':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.HIDDENPOTENTIAL_PSIOFFENSE);
			return true;
	case 'FOCUSEDFIRERS_AIM':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.FOCUSEDFIRERS_AIM);
			return true;
	case 'FOCUSEDFIRERS_CRIT':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.FOCUSEDFIRERS_CRIT);
			return true;
	case 'COMBATVIGILANCERS_AIM':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.COMBATVIGILANCERS_AIM);
			return true;
	case 'COMBATVIGILANCERS_CRIT':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.COMBATVIGILANCERS_CRIT);
			return true;
	case 'COMBATVIGILANCERS_WILL':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.COMBATVIGILANCERS_WILL);
			return true;
	case 'COMBATVIGILANCERS_DODGE':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.COMBATVIGILANCERS_DODGE);
			return true;
	case 'COMBATIGILANCERS_DEFENSE':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.COMBATIGILANCERS_DEFENSE);
			return true;
	case 'LETHALITYRS_CRIT':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.LETHALITYRS_CRIT);
			return true;
	case 'SHAKEITOFFRS_DODGE':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.SHAKEITOFFRS_DODGE);
			return true;
	case 'RAPIDRESPONSERS_MOBILITY':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.RAPIDRESPONSERS_MOBILITY);
			return true;
	case 'RAPIDRESPONSERS_CRIT':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.RAPIDRESPONSERS_CRIT);
			return true;
	case 'OVERCLOCKRS_HACK':
			OutString = string(class'X2Ability_GTSPerksRSAbilitySet'.default.OVERCLOCKRS_HACK);
			return true;
//End
	default:
            return false;
    }  
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END FILE
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////