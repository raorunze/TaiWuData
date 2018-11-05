class X2Item_M23Katana_Schematic extends X2Item config(M23Katana);

var config int M23KATANA_MG_SCHEMATIC_SUPPLYCOST;
var config int M23KATANA_MG_SCHEMATIC_ALLOYCOST;
var config int M23KATANA_MG_SCHEMATIC_ELERIUMCOST;

var config int M23KATANA_BM_SCHEMATIC_SUPPLYCOST;
var config int M23KATANA_BM_SCHEMATIC_ALLOYCOST;
var config int M23KATANA_BM_SCHEMATIC_ELERIUMCOST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Schematics;
	
	Schematics.AddItem(M23Katana_MG_Schematic_Create());
	Schematics.AddItem(M23Katana_BM_Schematic_Create());

	return Schematics;
}

static function X2DataTemplate M23Katana_MG_Schematic_Create()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'M23Katana_MG_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///WP_M23Katana_CV.UILibrary.Inv_M23Katana";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.HideInLootRecovered = true;
	Template.PointsToComplete = 0;
	Template.Tier = 1;

	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;
	Template.ReferenceItemTemplate = 'WP_M23Katana_MG';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('MagnetizedWeapons');
	Template.Requirements.RequiredEngineeringScore = 0;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.M23Katana_MG_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.M23Katana_MG_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);
	
	// only add elerium cost if configured value greater than 0
	if (default.M23KATANA_MG_SCHEMATIC_ELERIUMCOST > 0) {
		Artifacts.ItemTemplateName = 'EleriumDust';
		Artifacts.Quantity = default.M23KATANA_MG_SCHEMATIC_ELERIUMCOST;
		Template.Cost.ResourceCosts.AddItem(Artifacts);
	}

	return Template;
}


static function X2DataTemplate M23Katana_BM_Schematic_Create()
{
	local X2SchematicTemplate Template;
	local ArtifactCost Resources, Artifacts;

	`CREATE_X2TEMPLATE(class'X2SchematicTemplate', Template, 'M23Katana_BM_Schematic');

	Template.ItemCat = 'weapon';
	Template.strImage = "img:///WP_M23Katana_CV.UILibrary.Inv_M23Katana";
	Template.CanBeBuilt = true;
	Template.bOneTimeBuild = true;
	Template.HideInInventory = true;
	Template.PointsToComplete = 0;
	Template.Tier = 3;
	Template.OnBuiltFn = class'X2Item_DefaultSchematics'.static.UpgradeItems;

	//Items being created
	Template.ReferenceItemTemplate = 'WP_M23Katana_BM';

	// Requirements
	Template.Requirements.RequiredTechs.AddItem('PlasmaRifle');
	Template.Requirements.RequiredEngineeringScore = 15;
	Template.Requirements.bVisibleIfPersonnelGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.M23KATANA_BM_SCHEMATIC_SUPPLYCOST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	Artifacts.ItemTemplateName = 'AlienAlloy';
	Artifacts.Quantity = default.M23KATANA_BM_SCHEMATIC_ALLOYCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	Artifacts.ItemTemplateName = 'EleriumDust';
	Artifacts.Quantity = default.M23KATANA_BM_SCHEMATIC_ELERIUMCOST;
	Template.Cost.ResourceCosts.AddItem(Artifacts);

	return Template;
}
