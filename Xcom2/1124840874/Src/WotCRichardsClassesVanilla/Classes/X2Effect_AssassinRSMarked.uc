///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//This handles the Mark Stats/Bonus for the Assassins Death Mark Perk
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class X2Effect_AssassinRSMarked extends X2Effect_Persistent
	config(GameCore);

var config int DEATHMARKRS_CRIT;

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, 
										const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	// This unit takes extra crit damage
	if (AppliedData.AbilityResultContext.HitResult == eHit_Crit)
	{
		return 0;
	}
}

function GetToHitAsTargetModifiers(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit Target, XComGameState_Ability AbilityState, class<X2AbilityToHitCalc> ToHitType, bool bMelee, bool bFlanking, bool bIndirectFire, out array<ShotModifierInfo> ShotModifiers)
{
	local ShotModifierInfo AccuracyInfo, CritInfo;

	AccuracyInfo.ModType = eHit_Success;
	AccuracyInfo.Value = 0;
	AccuracyInfo.Reason = FriendlyName;
	ShotModifiers.AddItem(AccuracyInfo);

	CritInfo.ModType = eHit_Crit;
	CritInfo.Value = 25; //CRIT BONUS FROM DEATH MARK
	CritInfo.Reason = FriendlyName;
	ShotModifiers.AddItem(CritInfo);
}

simulated function AddX2ActionsForVisualization_Tick(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const int TickIndex, XComGameState_Effect EffectState)
{
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;
	
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, FriendlyName, '', eColor_Bad);
}