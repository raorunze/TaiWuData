//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_AmmoandVestSlotsV2.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_AmmoAndVestSlotsV2 extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{
	`Log("AVS : Activating mod on LoadedSaveGame");
	if(class'X2Item_DefaultUtilityItems_AVS'.default.XCOM_SHIRT_ENABLED)
	{
		`Log("AVS : Shirt is Enabled");
		UpdateStorage_AVS('XcomShirt');
	}

	if(class'X2Item_DefaultUtilityItems_AVS'.default.VEST_SLOT_ICON_ENABLED)
	{
		`Log("AVS : Shirt is Enabled");
		UpdateStorage_AVS('VestSlotIcon');
	}
}

/// <summary>
/// This method is run when the player loads a saved game directly into Strategy while this DLC is installed
/// </summary>
static event OnLoadedSavedGameToStrategy()
{
	`Log("AVS : Activating mod on LoadedSaveGameToStrategy");
	if(class'X2Item_DefaultUtilityItems_AVS'.default.XCOM_SHIRT_ENABLED)
	{
		`Log("AVS : Shirt is Enabled");
		UpdateStorage_AVS('XcomShirt');
	}

	if(class'X2Item_DefaultUtilityItems_AVS'.default.VEST_SLOT_ICON_ENABLED)
	{
		`Log("AVS : Icon is Enabled");
		UpdateStorage_AVS('VestSlotIcon');
	}
}

static function UpdateStorage_AVS(name ItemName)
{
	local XComGameState NewGameState;
	local XComGameState_HeadquartersXCom XComHQ;
	local X2ItemTemplateManager ItemTemplateMgr;
	local XComGameState_Item NewItemState;
	local X2ItemTemplate ItemTemplate;
	local XComGameStateHistory History;

	`Log("AVS : Updating Storage");

	History = `XCOMHISTORY;

	NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add" @ ItemName);

	XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	XComHQ = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));

	NewGameState.AddStateObject(XComHQ);
	ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();

	ItemTemplate = ItemTemplateMgr.FindItemTemplate(ItemName);

	if(ItemTemplate != none && XComHQ.GetNumItemInInventory(ItemName) < 1 )
	{
		`Log("AVS : Template Was Not None");
		NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
		NewGameState.AddStateObject(NewItemState);
		XComHQ.AddItemToHQInventory(NewItemState);
		History.AddGameStateToHistory(NewGameState);
	} else {
		History.CleanupPendingGameState(NewGameState);
	}
}