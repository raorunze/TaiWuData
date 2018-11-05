class X2DownloadableContentInfo_CovertActionConfig extends X2DownloadableContentInfo;

//var config array<name> CovertActions;

static event OnPostTemplatesCreated()
{
	EditTemplates();
}

static function EditTemplates()
{
	local array<X2StrategyElementTemplate>		arrStratTemplates;
	//local X2CovertActionTemplate				CovertTemplate;
	local X2CovertActionTemplate				Template;
	local X2StrategyElementTemplateManager		StratMgr;
	local int									idx, ndx;
	local float									valueMin;
	local float									valueMax;
	//local int									ArtifactCount;
	//local name									Artifact;
	local X2DataTemplate						DifficultyTemplate;
	local array<X2DataTemplate>					DifficultyTemplates;
	local CAC_VariableGetter						Getter;
	local CovertActionVars						caVars;
	
	Getter = new class'CAC_VariableGetter';
	StratMgr = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	arrStratTemplates = StratMgr.GetAllTemplatesOfClass(class'X2CovertActionTemplate');
	
	for (idx = 0; idx < arrStratTemplates.Length; idx++)
	{
		Template = X2CovertActionTemplate(arrStratTemplates[idx]);
		StratMgr.FindDataTemplateAllDifficulties(Template.DataName, DifficultyTemplates);
		foreach DifficultyTemplates(DifficultyTemplate) 
		{
			Template = X2CovertActionTemplate(DifficultyTemplate);
			//duration
			valueMin = Getter.CovertActionDuration_min();
			valueMax = Getter.CovertActionDuration_max();
			
			if(valueMin > valueMax)
			{
				valueMax = valueMin;
			}
			Template.MinActionHours[0] *= valueMin;
			Template.MaxActionHours[0] *= valueMax;
			Template.MinActionHours[1] *= valueMin;
			Template.MaxActionHours[1] *= valueMax;
			Template.MinActionHours[2] *= valueMin;
			Template.MaxActionHours[2] *= valueMax;
			Template.MinActionHours[3] *= valueMin;
			Template.MaxActionHours[3] *= valueMax;
			
			caVars = Getter.GetVars(Template.DataName);
			//name checking
			if(caVars.ActionName != Template.DataName)
			{
				`log("critical template mismatch" @ Template.DataName @ caVars.ActionName,,'CovertActionConfig');
				continue;
			}
			//artifact cost slots
			Template.OptionalCosts.Length = 0;
			
			if(caVars.ca_OptionalArtifact)
			{
				for(ndx=0;ndx<caVars.ca_Artifact.Length;ndx++)
				{
				//todo: There should be errorchecking here
					Template.OptionalCosts.AddItem(CreateOptionalCostSlot(caVars.ca_Artifact[ndx], caVars.ca_Count[ndx]));
				}
			}
			//risks
			Template.Risks.Length = 0;
			if(caVars.ca_Wound)
			{
				Template.Risks.AddItem('CovertActionRisk_SoldierWounded');
			}
			if((caVars.ca_Capture) || (Getter.bCovertActionAllCapture()))
			{
				Template.Risks.AddItem('CovertActionRisk_SoldierCaptured');
			}
			if((caVars.ca_Ambush) || (Getter.bCovertActionAllAmbush()))
			{
				Template.Risks.AddItem('CovertActionRisk_Ambush');
			}
			
			//soldier/staff slots
			Template.Slots.Length=0;
			for(ndx=0; ndx<caVars.arrReqType.Length; ndx++)
			{
				if((caVars.arrReqType[ndx] == 'CovertActionSoldierStaffSlot') || (caVars.arrReqType[ndx] == 'CovertActionFormSoldierBondStaffSlot') || (caVars.arrReqType[ndx] == 'CovertActionImproveComIntStaffSlot'))
				{
					Template.Slots.AddItem(CreateDefaultSoldierSlot(caVars.arrReqType[ndx], caVars.arrReqRank[ndx], false, caVars.arrbReqResHero[ndx]));
				}
				else if(caVars.arrReqType[ndx] == 'CovertActionEngineerStaffSlot')
				{
					Template.Slots.AddItem(CreateDefaultStaffSlot(caVars.arrReqType[ndx]));
				}
				else if(caVars.arrReqType[ndx] == 'CovertActionScientistStaffSlot')
				{
					Template.Slots.AddItem(CreateDefaultStaffSlot(caVars.arrReqType[ndx]));
				}
			}
			if(caVars.arrOptionalType[0] != '')
			{
				for(ndx=0;ndx<caVars.arrOptionalType.Length;ndx++)
				{
					switch(caVars.arrOptionalType[ndx])
					{
						case 'CovertActionSoldierStaffSlot':
							Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionSoldierStaffSlot', caVars.arrOptionalRank[ndx], caVars.arrbResHero[ndx]));
							break;
						case 'CovertActionEngineerStaffSlot':
							Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionEngineerStaffSlot'));
							break;
						case 'CovertActionScientistStaffSlot':
							Template.Slots.AddItem(CreateDefaultOptionalSlot('CovertActionScientistStaffSlot'));
							break;
						default:
							`log("incorrect OptionalType for template " @ caVars.ActionName,,'CovertActionConfig');
							break;
					}
				}
			}
		}
	}
}

private static function CovertActionSlot CreateDefaultSoldierSlot(name SlotName, optional int iMinRank, optional bool bRandomClass, optional bool bFactionClass)
{
	local CovertActionSlot SoldierSlot;

	SoldierSlot.StaffSlot = SlotName;
	SoldierSlot.Rewards.AddItem('Reward_StatBoostHP');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostAim');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostMobility');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostDodge');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostWill');
	SoldierSlot.Rewards.AddItem('Reward_StatBoostHacking');
	SoldierSlot.Rewards.AddItem('Reward_RankUp');
	SoldierSlot.iMinRank = iMinRank;
	SoldierSlot.bChanceFame = false;
	SoldierSlot.bRandomClass = bRandomClass;
	SoldierSlot.bFactionClass = bFactionClass;

	if (SlotName == 'CovertActionRookieStaffSlot')
	{
		SoldierSlot.bChanceFame = false;
	}

	return SoldierSlot;
}

private static function CovertActionSlot CreateDefaultStaffSlot(name SlotName)
{
	local CovertActionSlot StaffSlot;
	
	// Same as Soldier Slot, but no rewards
	StaffSlot.StaffSlot = SlotName;
	StaffSlot.bReduceRisk = false;
	
	return StaffSlot;
}

private static function CovertActionSlot CreateDefaultOptionalSlot(name SlotName, optional int iMinRank, optional bool bFactionClass)
{
	local CovertActionSlot OptionalSlot;

	OptionalSlot.StaffSlot = SlotName;
	OptionalSlot.bChanceFame = false;
	OptionalSlot.bReduceRisk = true;
	OptionalSlot.iMinRank = iMinRank;
	OptionalSlot.bFactionClass = bFactionClass;

	return OptionalSlot;
}

private static function StrategyCostReward CreateOptionalCostSlot(name ResourceName, int Quantity)
{
	local StrategyCostReward ActionCost;
	local ArtifactCost Resources;

	Resources.ItemTemplateName = ResourceName;
	Resources.Quantity = Quantity;
	ActionCost.Cost.ResourceCosts.AddItem(Resources);
	ActionCost.Reward = 'Reward_DecreaseRisk';
	
	return ActionCost;
}