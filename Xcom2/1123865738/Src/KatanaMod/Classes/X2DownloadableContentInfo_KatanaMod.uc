class X2DownloadableContentInfo_KatanaMod extends X2DownloadableContentInfo;

static function UpdateWeaponMaterial(XGWeapon WeaponArchetype, MeshComponent MeshComp, MaterialInstanceConstant MIC)
{
	local int i, a;
	local MaterialInterface Mat;
	local MaterialInstanceConstant AttachmentMIC;

	//MIC.SetScalarParameterValue('PatternUse', 0);
	
	for (i = 0; i < WeaponArchetype.PawnAttachments.Length; ++i)
	{
		if (WeaponArchetype.PawnAttachments.Find(MeshComp) == INDEX_NONE)
		{
			for (a = 0; a < SkeletalMeshComponent(WeaponArchetype.PawnAttachments[i]).GetNumElements(); ++a)
			{
				Mat = SkeletalMeshComponent(WeaponArchetype.PawnAttachments[i]).GetMaterial(a);
				AttachmentMIC = MaterialInstanceConstant(Mat);
	
				if (AttachmentMIC != none)
				{
					WeaponArchetype.UpdateWeaponMaterial(SkeletalMeshComponent(WeaponArchetype.PawnAttachments[i]), AttachmentMIC);
				}
			}
		}
	}
}

static event OnPostTemplatesCreated()
{
	`LOG("X2DownloadableContentInfo_KatanaMod" @ GetFuncName(),, 'KatanaMod'); 
}

static event OnLoadedSavedGame()
{
	`Log("Musashi KatanaMod : Starting OnLoadedSavedGame");

	UpdateStorage();
}

// ******** HANDLE UPDATING STORAGE ************* //
static function UpdateStorage()
{
	local XComGameState NewGameState;
	local XComGameStateHistory History;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateMgr;
	local array<X2ItemTemplate> ItemTemplates;
	local XComGameState_Item NewItemState;
	local int i;

	History = `XCOMHISTORY;
	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Musashi: Updating HQ Storage to add CombatKnife");
	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('UtilityNinjato_CV'));
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('UtilityKatana_CV'));
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('UtilityWakizashi_CV'));
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('Ninjato_CV'));
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('Katana_CV'));
	ItemTemplates.AddItem(ItemTemplateMgr.FindItemTemplate('Wakizashi_CV'));

	for (i = 0; i < ItemTemplates.Length; ++i)
	{
		if(ItemTemplates[i] != none)
		{
			if (!XComHQ.HasItem(ItemTemplates[i]))
			{
				`Log("Musashi KatanaMod : " @ ItemTemplates[i].GetItemFriendlyName() @ " not found, adding to inventory");
				NewItemState = ItemTemplates[i].CreateInstanceFromTemplate(NewGameState);
				NewGameState.AddStateObject(NewItemState);
				XComHQ.AddItemToHQInventory(NewItemState);
				History.AddGameStateToHistory(NewGameState);
			} else {
				`Log("Musashi KatanaMod : " @ ItemTemplates[i].GetItemFriendlyName() @ " found, skipping inventory add");
				History.CleanupPendingGameState(NewGameState);
			}
		}
	}

	// Check Tier 2 & 3 for running campaigns that already bought the swords
	AddHigherTiers('UtilityNinjato_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('UtilityNinjato_BM', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('UtilityKatana_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('UtilityKatana_BM', 'Sword_BM', XComHQ, NewGameState);
	AddHigherTiers('UtilityWakizashi_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('UtilityWakizashi_BM', 'Sword_BM', XComHQ, NewGameState);
	AddHigherTiers('Ninjato_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('Ninjato_BM', 'Sword_BM', XComHQ, NewGameState);
	AddHigherTiers('Katana_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('Katana_BM', 'Sword_BM', XComHQ, NewGameState);
	AddHigherTiers('Wakizashi_MG', 'Sword_MG', XComHQ, NewGameState);
	AddHigherTiers('Wakizashi_BM', 'Sword_BM', XComHQ, NewGameState);
	//schematics should be handled already, as the BuildItem UI draws from ItemTemplates, which are automatically loaded
}

static function AddHigherTiers(
	name Template,
	name CheckTemplate,
	XComGameState_HeadquartersXCom XComHQ,
	XComGameState NewGameState
	)
{
	local XComGameState_Item NewItemState;
	local XComGameStateHistory History;
	local X2ItemTemplate ItemTemplate, CheckItemTemplate;
	local X2ItemTemplateManager ItemTemplateMgr;

	History = `XCOMHISTORY;

	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	ItemTemplate = ItemTemplateMgr.FindItemTemplate(Template);
	CheckItemTemplate = ItemTemplateMgr.FindItemTemplate(CheckTemplate);
	if(ItemTemplate != none)
	{
		if (!XComHQ.HasItem(ItemTemplate) && 
			XComHQ.HasItem(CheckItemTemplate))
		{
			`Log("Musashi KatanaMod : " @ ItemTemplate.GetItemFriendlyName() @ " not found, adding to inventory");
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			NewGameState.AddStateObject(NewItemState);
			XComHQ.AddItemToHQInventory(NewItemState);
			History.AddGameStateToHistory(NewGameState);
		} else if(XComHQ.HasItem(ItemTemplate) && !XComHQ.HasItem(CheckItemTemplate)) {
			NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
			XComHQ.RemoveItemFromInventory(NewGameState, NewItemState.GetReference(), 1);
			`Log("Musashi KatanaMod : " @ ItemTemplate.GetItemFriendlyName() @ " removed because coressponding tier not unlocked");
		} else {
			`Log("Musashi KatanaMod : " @ ItemTemplate.GetItemFriendlyName() @ " found or not unlocked yet, skipping inventory add");
			History.CleanupPendingGameState(NewGameState);
		}
	}
}

/// <summary>
/// Called when the player starts a new campaign while this DLC / Mod is installed
/// </summary>
static event InstallNewCampaign(XComGameState StartState)
{}