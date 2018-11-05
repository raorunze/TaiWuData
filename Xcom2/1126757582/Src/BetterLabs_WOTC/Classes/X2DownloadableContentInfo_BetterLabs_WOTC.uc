class X2DownloadableContentInfo_BetterLabs_WOTC extends X2DownloadableContentInfo;

static event OnPostTemplatesCreated()
{
	local BetterLab_TemplateModifier Exchanger;

	Exchanger = new class'BetterLab_TemplateModifier';
	Exchanger.ModifyTemplates();
}
