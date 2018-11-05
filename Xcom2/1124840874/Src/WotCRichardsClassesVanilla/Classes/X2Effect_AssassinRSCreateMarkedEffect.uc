///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//This handles the Mark Effect for the Assassins Death Mark Perk
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
class X2Effect_AssassinRSCreateMarkedEffect extends X2StatusEffects
	config(GameCore);

static function X2Effect_Persistent CreateMarkedEffect(int NumTurns, bool bIsInfinite)
{
	local X2Effect_Persistent PersistentEffect;

	PersistentEffect = new class 'X2Effect_AssassinRSMarked';
	PersistentEffect.EffectName = default.MarkedName;
	PersistentEffect.DuplicateResponse = eDupe_Ignore;
	PersistentEffect.BuildPersistentEffect(NumTurns, bIsInfinite, true,,eGameRule_PlayerTurnEnd);
	PersistentEffect.SetDisplayInfo(ePerkBuff_Penalty, default.MarkedFriendlyName, default.MarkedFriendlyDesc, "img:///UILibrary_PerkIcons.UIPerk_muton_execute");
	PersistentEffect.VisualizationFn = MarkedVisualization;
	PersistentEffect.EffectTickedVisualizationFn = MarkedVisualizationTicked;
	PersistentEffect.EffectRemovedVisualizationFn = MarkedVisualizationRemoved;
	PersistentEffect.bRemoveWhenTargetDies = true;

	return PersistentEffect;
}