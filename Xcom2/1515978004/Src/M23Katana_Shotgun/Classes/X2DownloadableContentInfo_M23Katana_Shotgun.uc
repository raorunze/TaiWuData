//---------------------------------------------------------------------------------------
//  FILE:   XComDownloadableContentInfo_M23Katana_Shotgun.uc                                    
//           
//	Use the X2DownloadableContentInfo class to specify unique mod behavior when the 
//  player creates a new campaign or loads a saved game.
//  
//---------------------------------------------------------------------------------------
//  Copyright (c) 2016 Firaxis Games, Inc. All rights reserved.
//---------------------------------------------------------------------------------------

class X2DownloadableContentInfo_M23Katana_Shotgun extends X2DownloadableContentInfo;

/// <summary>
/// This method is run if the player loads a saved game that was created prior to this DLC / Mod being installed, and allows the 
/// DLC / Mod to perform custom processing in response. This will only be called once the first time a player loads a save that was
/// create without the content installed. Subsequent saves will record that the content was installed.
/// </summary>
static event OnLoadedSavedGame()
{

local XComGameStateHistory History;
local XComGameState NewGameState;
local XComGameState_HeadquartersXCom OldXComHQState;    
local XComGameState_HeadquartersXCom NewXComHQState;
local XComGameState_Item ItemState;
local X2ItemTemplateManager ItemMgr;
local X2ItemTemplate ItemTemplate;


local int i;
local array<name> AllBaseWeapons;

AllBaseWeapons.AddItem('WP_M23Katana');


ItemMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
History = `XCOMHISTORY; 

NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Adding M-23 Katana");

OldXComHQState = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));

NewXComHQState = XComGameState_HeadquartersXCom(NewGameState.CreateStateObject(class'XComGameState_HeadquartersXCom', OldXComHQState.ObjectID));

for (i = 0; i < AllBaseWeapons.Length; i++)
{
    ItemTemplate = ItemMgr.FindItemTemplate(AllBaseWeapons[i]);
    ItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
    NewXComHQState.AddItemToHQInventory(ItemState); 
}

//Commit the new HQ state object to the state change that we built
NewGameState.AddStateObject(NewXComHQState);

//Commit the state change into the history.
History.AddGameStateToHistory(NewGameState);
}