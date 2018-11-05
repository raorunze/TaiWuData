class X2DownloadableContentInfo_OverwatchWeaponPack extends X2DownloadableContentInfo;

static event OnLoadedSavedGame()
{
	UpdateStorage();
}
 
exec function ForceUpdateHQStorage() {
    UpdateStorage();
}

static function UpdateStorage()
{
    local XComGameState NewGameState;
    local XComGameStateHistory History;
    local XComGameState_HeadquartersXCom XComHQ;
    local X2ItemTemplateManager ItemTemplateMgr;
    local X2ItemTemplate ItemTemplate;
    local XComGameState_Item NewItemState;
	local array<name> ReqNames, AddNames;
	local int x;
	
	ReqNames.AddItem('AssaultRifle_CV');
	AddNames.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T1');
	ReqNames.AddItem('AssaultRifle_MG');
	AddNames.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T2');
	ReqNames.AddItem('AssaultRifle_BM');
	AddNames.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T3');
	ReqNames.AddItem('ChosenRifle_XCOM');
	AddNames.AddItem('MD_WOTC_OW_HEAVYPULSERIFLE_CLASSIC_T4');

	ReqNames.AddItem('Bullpup_CV');
	AddNames.AddItem('MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T1');
	ReqNames.AddItem('Bullpup_MG');
	AddNames.AddItem('MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T2');
	ReqNames.AddItem('Bullpup_BM');
	AddNames.AddItem('MD_WOTC_SKR_OW_HEAVYPULSERIFLE_CLASSIC_T3');

	ReqNames.AddItem('Pistol_CV');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CADET_T1');
	ReqNames.AddItem('Pistol_MG');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CADET_T2');
	ReqNames.AddItem('Pistol_BM');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CADET_T3');
	ReqNames.AddItem('ChosenSniperPistol_XCOM');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CADET_T4');

	ReqNames.AddItem('Sidearm_CV');
	AddNames.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T1');
	ReqNames.AddItem('Sidearm_MG');
	AddNames.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T2');
	ReqNames.AddItem('Sidearm_BM');
	AddNames.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CADET_T3');

	ReqNames.AddItem('Pistol_MG');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CLASSIC_T2');
	ReqNames.AddItem('Pistol_BM');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CLASSIC_T3');
	ReqNames.AddItem('ChosenSniperPistol_XCOM');
	AddNames.AddItem('MD_WOTC_OW_PULSEPISTOL_CLASSIC_T4');

	ReqNames.AddItem('Sidearm_MG');
	AddNames.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T2');
	ReqNames.AddItem('Sidearm_BM');
	AddNames.AddItem('MD_WOTC_TMP_OW_PULSEPISTOL_CLASSIC_T3');

	ReqNames.AddItem('Sword_MG');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_CLASSIC_T2');
	ReqNames.AddItem('Sword_BM');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_CLASSIC_T3');
	ReqNames.AddItem('ChosenSword_XCOM');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_CLASSIC_T4');

	ReqNames.AddItem('Sword_BM');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_BLACKWATCH_T3');
	ReqNames.AddItem('ChosenSword_XCOM');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_BLACKWATCH_T4');

	ReqNames.AddItem('ChosenSword_XCOM');
	AddNames.AddItem('MD_WOTC_OW_ODACHI_ONI_T4');

	ReqNames.AddItem('Sword_CV');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_CLASSIC_T1');
	ReqNames.AddItem('Sword_MG');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_CLASSIC_T2');
	ReqNames.AddItem('Sword_BM');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_CLASSIC_T3');
	ReqNames.AddItem('ChosenSword_XCOM');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_CLASSIC_T4');

	ReqNames.AddItem('Sword_BM');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T3');
	ReqNames.AddItem('ChosenSword_XCOM');
	AddNames.AddItem('MD_WOTC_OW_WAKIZASHI_BLACKWATCH_T4');

	ReqNames.AddItem('ProximityMine');
	AddNames.AddItem('MD_WOTC_OW_PULSE_BOMB');
	
	History = `XCOMHISTORY;
    NewGameState = class'XComGameStateContext_ChangeContainer'.static.CreateChangeState("Updating HQ Storage to add Overwatch variants");
    XComHQ = XComGameState_HeadquartersXCom(History.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
    XComHQ = XComGameState_HeadquartersXCom(NewGameState.ModifyStateObject(class'XComGameState_HeadquartersXCom', XComHQ.ObjectID));
	
    ItemTemplateMgr = class'X2ItemTemplateManager'.static.GetItemTemplateManager();
	
    for(x = 0; x < ReqNames.Length; x++)
	{
		ItemTemplate = ItemTemplateMgr.FindItemTemplate(ReqNames[x]);
		if(XComHQ.HasItem(ItemTemplate)) // Does XComHQ have the required item?
		{
			ItemTemplate = ItemTemplateMgr.FindItemTemplate(AddNames[x]);
			if(!XComHQ.HasItem(ItemTemplate)) // Does XComHQ NOT have the Overwatch analogue?
			{
                `LOG("Adding to HQ" @ ItemTemplate.DataName,, 'WOTC_Overwatch_Pack');
                NewItemState = ItemTemplate.CreateInstanceFromTemplate(NewGameState);
                NewGameState.AddStateObject(NewItemState);
                XComHQ.AddItemToHQInventory(NewItemState);
			}
		}
	}
    History.AddGameStateToHistory(NewGameState);
    History.CleanupPendingGameState(NewGameState);
}

static event OnPostTemplatesCreated()
{
	// Fix up our vanilla throws to account for Stun Mine
	local X2AbilityTemplateManager AbilityTemplateManager;

	AbilityTemplateManager = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	FixUpAbility(AbilityTemplateManager.FindAbilityTemplate('ThrowGrenade'));
	FixUpAbility(AbilityTemplateManager.FindAbilityTemplate('LaunchGrenade'));

}

static function FixUpAbility(X2AbilityTemplate Template)
{

    local X2Effect_PulseBomb					 ProximityPulseBombEffect;
    local X2Condition_AbilitySourceWeapon        ProximityPulseBombCondition;

    ProximityPulseBombEffect = new class'X2Effect_PulseBomb';
    ProximityPulseBombEffect.BuildPersistentEffect(1, true, false, false);
    ProximityPulseBombCondition = new class'X2Condition_AbilitySourceWeapon';
    ProximityPulseBombCondition.MatchGrenadeType = 'MD_WOTC_OW_PULSE_BOMB';
    ProximityPulseBombEffect.TargetConditions.AddItem(ProximityPulseBombCondition);
    Template.AddShooterEffect(ProximityPulseBombEffect);

}