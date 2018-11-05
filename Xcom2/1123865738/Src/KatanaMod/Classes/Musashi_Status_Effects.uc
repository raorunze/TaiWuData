class Musashi_Status_Effects extends X2StatusEffects;

static function X2Effect_Panicked CreatePanickedStatusEffectChance(int ApplyChance)
{
	local X2Effect_Panicked PanickedEffect;

	PanickedEffect = super.CreatePanickedStatusEffect();
	PanickedEffect.ApplyChance = ApplyChance;

	return PanickedEffect;
}