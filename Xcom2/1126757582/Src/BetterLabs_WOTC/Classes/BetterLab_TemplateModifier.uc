class BetterLab_TemplateModifier extends Object;

function ModifyTemplates() {
	local X2StrategyElementTemplate Template;
	local X2TechTemplate Tech;
	local X2StrategyElementTemplateManager TemplateManager;
	local array<X2StrategyElementTemplate> Templates;
	local array<X2DataTemplate> DiffTemplates;
	local X2DataTemplate Tmp;
	local BL_TechWrapper TechWrapper;

	TemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	Templates = TemplateManager.GetAllTemplatesOfClass(class'X2TechTemplate');

	foreach Templates(Template) {
		TemplateManager.FindDataTemplateAllDifficulties(Template.DataName, DiffTemplates);

		foreach DiffTemplates(Tmp) {
			Tech = X2TechTemplate(Template);

			if (Tech.bProvingGround) { continue; }

			`LOG("Wrapping tech: " @ Template.DataName);

			// wrap the research completed function in our own.  We store and call the original, so nothing breaks
			TechWrapper = new class'BL_TechWrapper';
			TechWrapper.Tech = Tech;
			TechWrapper.ResearchCompletedFn = Tech.ResearchCompletedFn;
			Tech.ResearchCompletedFn = TechWrapper.ProvideBonusRebate;
		}
	}
}

