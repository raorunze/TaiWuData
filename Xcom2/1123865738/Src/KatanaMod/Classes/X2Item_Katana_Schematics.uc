class X2Item_Katana_Schematics extends X2Item;

//static function array<X2DataTemplate> CreateTemplates()
//{
//	local array<X2DataTemplate> Schematics;
//
//	Schematics.AddItem(CreateTemplate_VortexKatana_Schematic());
//
//	return Schematics;
//}
//
//static function X2DataTemplate CreateTemplate_VortexKatana_Schematic()
//{
//	local X2SchematicTemplate Template;
//	local ArtifactCost Resources;
//
//	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'VortexKatana_BM_Schematic');
//
//	Template.ItemCat = 'weapon';
//	Template.strImage = "img:///KatanaPkg.Textures.KatanaEnergy_BM";
//	Template.PointsToComplete = 0;
//	Template.Tier = 3;
//	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
//
//	// Reference Item
//	Template.ReferenceItemTemplate = 'VortexKatana_BM';
//
//	// Requirements
//	Template.Requirements.RequiredTechs.AddItem('CodexBrainPt1');
//	Template.Requirements.RequiredEngineeringScore = 20;
//	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;
//
//	// Cost
//	Resources.ItemTemplateName = 'CorpseCyberus';
//	Resources.Quantity = 1;
//	Template.Cost.ArtifactCosts.AddItem(Resources);
//
//	Resources.ItemTemplateName = 'Supplies';
//	Resources.Quantity = 200;
//	Template.Cost.ResourceCosts.AddItem(Resources);
//
//	Resources.ItemTemplateName = 'AlienAlloy';
//	Resources.Quantity = 10;
//	Template.Cost.ResourceCosts.AddItem(Resources);
//
//	Resources.ItemTemplateName = 'EleriumDust';
//	Resources.Quantity = 10;
//	Template.Cost.ResourceCosts.AddItem(Resources);
//
//	return Template;
//}