local DepthDamageMultiplier = 0.0
local DuplicateMultiplier = -0.60
local DuplicateStrongMultiplier = -0.40
local DuplicateVeryStrongMultiplier = -0.20

TraitMultiplierData =
{
	DefaultDiminishingReturnsMultiplier = 0.7,
	DefaultMinMultiplier = 0.1,
}

TraitData =
{
	ShopTier1Trait =
	{
		Cost = 30,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 1.8,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.3,
				MaxMultiplier = 2.5,
			},
		}
	},

	ShopTier2Trait =
	{
		Cost = 60,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.5,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.7,
			}
		}
	},

	ShopTier3Trait =
	{
		Cost = 120,
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		}
	},

	SynergyTrait =
	{
		IsDuoBoon = true,
		Frame = "Duo",
		RequiredFalseRewardType = "Devotion",
		CustomRarityName = "Boon_Synergy",
		CustomRarityColor = {210, 255, 97, 255},
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		}
	},

	WeaponTrait =
	{
		Frame = "Hammer"
	},

	ShopTrait =
	{
		Frame = "Shop"
	},

	ChaosCurseTrait =
	{
		Icon = "Shop_Vial",
	},

	ChaosCurseRemainingEncounters =
	{
		RemainingUses =
		{
			BaseMin = 3,
			BaseMax = 4,
			AsInt = true,
		},
		UsesAsEncounters = true,
	},

	ChaosBlessingTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
		}
	},

	GiftTrait =
	{
		Frame = "Gift",
		Slot = "Keepsake",
		RecordCacheOnEquip = true,
		ChamberThresholds =  { 25, 50 },

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
	},

	AssistTrait =
	{
		Frame = "Gift",
		Slot = "Assist",
		Icon = "Keepsake_Unknown",
		ChamberThresholds =  { 25, 50 },

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4.0,
			},
			Legendary =
			{
				Multiplier = 5.0,
			},
		},
	},

	WeaponEnchantmentTrait =
	{
		IsWeaponEnchantment = true,

		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
	},

	GodModeTrait =
	{
		Icon = "GodMode",

		ExtractValues =
		{
			{
				ExtractAs = "TooltipEasyModeDefense",
				Format = "EasyModeMultiplier",
				SkipAutoExtract = true

			}
		}
	},

	LimitedTimeTrait =
	{
		LimitedTime = true,
	},

	-- Zeus
	RetaliateWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "LightningStrikeRetaliate" },
		Icon = "Boon_Zeus_01",
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 80,
				BaseMax = 80,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ZeusLightningDebuff =
	{
		InheritFrom = { "ShopTier1Trait" },
		PreEquipWeapons = { "ZeusAttackBolt" },
		Icon = "Boon_Zeus_12",
		PropertyChanges =
		{
			{
				WeaponName = "ZeusAttackBolt",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ZeusAttackBolt",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponName = "ChainLightning",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponNames = {"ZeusShieldLoadAmmoStrike"},
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusRushTrait",
				WeaponName = "LightningDash",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PerfectDashBoltTrait",
				WeaponName = "LightningPerfectDash",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ZeusShoutTrait",
				WeaponName = "LightningStrikeX",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AmmoBoltTrait",
				WeaponName = "ZeusAmmoWeapon",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "LightningCloudTrait",
				WeaponName = "ZeusDionysusCloudStrike",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PerfectDashBoltTrait",
				WeaponName = "LightningPerfectDash",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			
		},
	},

	SuperGenerationTrait =
	{
		Icon = "Boon_Zeus_09",
		InheritFrom = { "ShopTier1Trait" },
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		SuperGainMultiplier =
		{
			BaseMin = 1.1,
			BaseMax = 1.1,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "SuperGainMultiplier",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentDelta",
			}
		}
	},

	DefensiveSuperGenerationTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_10",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		DefensiveSuperGainMultiplier =
		{
			BaseMin = 1.4,
			BaseMax = 1.4,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "DefensiveSuperGainMultiplier",
				ExtractAs = "TooltipMultiplier",
				Format = "PercentDelta",
			}
		}
	},

	ZeusBoltAoETrait = {
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Zeus_10",
		God = "Zeus",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageRadius",
				BaseValue = 120,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "LightningStrikeSecondary",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "ZeusRushTrait",
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "PerfectDashBoltTrait",
				WeaponName = "LightningPerfectDash",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "ZeusShoutTrait",
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "AmmoBoltTrait",
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "LightningCloudTrait",
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponName = "ZeusShieldLoadAmmoStrike",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "ZeusSecondaryTrait"
			},
		},
	},

	ZeusBonusBoltTrait = {
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Zeus_11",
		God = "Zeus",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.2,
				MaxMultiplier = 1.2,
			},
			Epic =
			{
				MinMultiplier = 1.4,
				MaxMultiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		BonusBolts =
		{
			BaseValue = 0.25,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		PropertyChanges =
		{
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				WeaponProperty = "BonusProjectileChance",
				BaseValue = 0.25,
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent",
				}
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponName = "ZeusShieldLoadAmmoStrike",
				WeaponProperty = "BonusProjectileChance",
				DeriveValueFrom = "DeriveSource"
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponName = "ZeusShieldLoadAmmoStrike",
				WeaponProperty = "ProjectileInterval",
				BaseValue = 0.25,
				ChangeType = "Absolute",
			},
		},
	},

	ZeusBonusBounceTrait = {
		Icon = "Boon_Zeus_03",
		InheritFrom = { "ShopTier2Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ChainLightning" },
		RarityLevels = {
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "NumJumps",
				BaseMin = 2,
				BaseMax = 2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "BonusJumps",
				}
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				BaseMin = 3,
				BaseMax = 3,
				ChangeType = "Add",
			},
		},
	},

	ZeusWeaponTrait =
	{
		Icon = "Boon_Zeus_04",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Melee",
		AddOnDamageWeapons = { "ChainLightning" },
		OnDamageWeaponProperties = { FirstHitOnly = true, FireFromVictimLocation = true},
		LegalOnDamageWeapons = WeaponSets.HeroPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				DepthMult = DepthDamageMultiplier,
				AsInt = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ChainLightning",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxZeus",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeZeus",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Zeus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ZeusSecondaryTrait =
	{
		Icon = "Boon_Zeus_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Secondary",
		AddOnDamageWeapons = { "LightningStrikeSecondary" },
		OnDamageWeaponProperties = { FireFromVictimLocation = true},
		PreEquipWeapons = { "LightningStrikeSecondary" },
		LegalOnDamageWeapons = WeaponSets.HeroSecondaryWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeSecondary",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionZeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalZeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionZeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Zeus-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalZeus_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Zeus",
				ChangeType = "Absolute",
			},
		}
	},

	ZeusRangedTrait =
	{
		Icon = "Boon_Zeus_05",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "ZeusRangedTrait_Tray",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.17,
			},
			Epic =
			{
				Multiplier = 1.35,
			},
			Heroic =
			{
				Multiplier = 1.50,
			}
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/Leftovers/SFX/AuraCharge",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},

					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ElectricZapSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ElectricZapSmall",
						Brick = "/SFX/Player Sounds/ElectricZapSmall",
						Stone = "/SFX/Player Sounds/ElectricZapSmall",
						Organic = "/SFX/Player Sounds/ElectricZapSmall",
						StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
					},
				},
			},
		},

		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ZeusProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			-- Beowulf
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 300
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Zeus"
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "OnHitStun",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	PerfectDashBoltTrait =
	{
		Icon = "Boon_Zeus_15",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		PreEquipWeapons = { "LightningPerfectDash" },

		AddRush =
		{
			FunctionName = "ZeusPerfectDash",
			RunOnce = true,
			FunctionArgs =
			{
				Range = 700,
				-- Text = "PerfectDashBoltTraitActivated"
			},
		},
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningPerfectDash",
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 20,
				DepthMult = DepthDamageMultiplier,
				MinMultiplier = 0.30,
				IdenticalMultiplier =
				{
					Value = -0.5,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningPerfectDash",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},


		},
	},

	ZeusChargedBoltTrait =
	{
		Icon = "Boon_Zeus_02",
		InheritFrom = { "ShopTier3Trait" },
		God = "Zeus",
		PreEquipWeapons = { "ZeusLegendaryWeapon" },
		RequiredFalseTraits = { "ZeusChargedBoltTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				AutoRamp = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource",
			},
			{
				WeaponName = "ZeusLegendaryWeapon",
				ProjectileName = "LightningSpark",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		},
	},

	ZeusRushTrait =
	{
		Icon = "Boon_Zeus_06",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Rush",
		PreEquipWeapons = { "LightningDash" },

		AddRush =
		{
			FunctionName = "ZeusDash",
			RunOnce = true,
		},
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningDash",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Zeus",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Zeus",
				ChangeType = "Absolute",
			},


		},
	},

	ZeusShoutTrait =
	{
		Icon = "Boon_Zeus_07",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ZeusShoutTrait_Tray",
		God = "Zeus",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "ZeusShout",
			Cost = 25,
			SuperDuration = 1.5,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "LightningStrikeX" },
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeX",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	WrathDamageBuffTrait =
	{
		Icon = "Boon_Zeus_08",
		InheritFrom = { "ShopTier1Trait" },
		DamagePerSuperStock =
		{
			BaseValue = 0.15,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		SetupFunction =
		{
			Name = "SetupSuperDamageBonus",
			RunOnce = true,
		},
		ExtractValues =
		{
			{
				Key = "DamagePerSuperStock",
				ExtractAs = "TooltipDamage",
				Format = "Percent",
			}
		}
	},

	RetainTempHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
	},

	-- Athena
	AthenaWeaponTrait =
	{
		Icon = "Boon_Athena_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Melee",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.40,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldWeapon",
				EffectName = "ShieldAttackReflect",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				EffectName = "ShieldDashReflect",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireSelfReflection",
				EffectProperty = "Deflect",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Athena-Spike",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Athena-Spike",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAthena",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAthena",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Athena-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "ProjectileDefenseAngle",
				ChangeValue = math.rad(80),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	AthenaSecondaryTrait =
	{
		Icon = "Boon_Athena_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Secondary",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.6,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SwordParry", "ShieldThrow", "BowSplitShot", "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 450,
				ChangeType = "Absolute"
			},

			--[[
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfInvulnerable",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflectRange",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			]]

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAthena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAthena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAthena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Athena-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAthena_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Athena",
				ChangeType = "Absolute",
			},
		}
	},

	AthenaRangedTrait =
	{
		Icon = "Boon_Athena_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Ranged",
		CustomTrayText = "AthenaRangedTrait_Tray",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaDeflectingProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 85,
				BaseMax = 85,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			-- Beowulf changes
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 290
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Athena"
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "UseDetonationForProjectileDefense",
                ChangeValue = true
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "OnHitStun",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	AthenaRushTrait =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Athena",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AthenaRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrail-AthenaDark",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 60,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaDashShieldReflection",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaDashShieldReflect",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	AthenaShieldTrait =
	{
		Icon = "Boon_Athena_05",
		InheritFrom = { "ShopTier2Trait" },
		God = "Athena",
		EnemyIncomingDamageModifiers =
		{
			ProjectileDeflectedMultiplier =
			{
				BaseValue = 1.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "ProjectileDeflectedMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
	},

	AthenaBackstabDebuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_14",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ShieldLoadAmmo_AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "MagicShieldRetaliate",
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ShieldLoadAmmo_AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponName = "MagicShieldRetaliate",
				EffectName = "AthenaBackstabVulnerability",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{

			{
				ExtractAs = "TooltipStaggerDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "AthenaBackstabVulnerability",
				BaseProperty = "Duration",
			}
		}
	},

	AthenaShoutTrait =
	{
		Icon = "Boon_Athena_04",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AthenaShoutTrait_Tray",
		God = "Athena",
		-- ProcEmote = "/VO/ZagreusEmotes/EmoteRanged",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},

		AddShout =
		{
			FunctionName = "AthenaShout",
			Cost = 25,
			MaxDurationMultiplier = 6,
			AddDuration = true,
			SuperDuration = {
				BaseValue = 1.5,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "SuperDuration",
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				},
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipMaxDurationMultiplier",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndAthenaShout",
		PreEquipWeapons = { "AthenaShoutWeapon" },
	},

	EnemyDamageTrait =
	{
		Icon = "Boon_Athena_06",
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 0.95,
				BaseMax = 0.95,
				SourceIsMultiplier = true,
				MinMultiplier = 0.5,
				IdenticalMultiplier =
				{
					Value = -0.5,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
					DecimalPlaces = 1,
				},
			}	
		}
	},

	TrapDamageTrait =
	{
		Icon = "Boon_Athena_07",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "TrapDamageTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.585,
			},
		},
		AddIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseMin = 0.40,
				BaseMax = 0.40,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	LastStandHealTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_12",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		LastStandHealFraction =
		{
			BaseValue = 0.10,
		},
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},

	LastStandDurationTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_11",
		PreEquipWeapons = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "Duration",
				BaseValue = 2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				ChangeType = "Add",
			},
			{
				WeaponNames = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShieldInvincible",
				EffectProperty = "Duration",
				DeriveValueFrom = "MagicShield"
			},
			{
				WeaponNames = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "BackFx",
				ChangeValue= "AthenaProtectionBack",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "MagicShield",
				EffectProperty = "FrontFx",
				ChangeValue = "AthenaProtectionFront",
				ChangeType = "Absolute",
			},
		},
	},


	PreloadSuperGenerationTrait = {
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Athena_13",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		StartingSuperAmount =
		{
			BaseValue = 20,
			IdenticalMultiplier =
			{
				Value = -0.5,
			},
		},
		ExtractValues =
		{
			{
				Key = "StartingSuperAmount",
				ExtractAs = "TooltipCriticalSuperGain",
			}
		}
	},

	AthenaRetaliateTrait =
	{
		Icon = "Boon_Athena_08",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "MagicShieldRetaliate" },
		PropertyChanges =
		{
			{
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ShieldHitTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Athena_10",
		RequiredFalseTrait = "ShieldHitTrait",
		PreEquipWeapons = { "AthenaDefenseApplicator" },
		SetupFunction =
		{
			Name = "ReactivateInvulnerability",
		},
		CurrentCooldown = 20,
		TimeCooldown = 20,
		ReactivateFunction = "ReactivateInvulnerability",
		ExtractValues =
		{
			{
				Key = "TimeCooldown",
				ExtractAs = "TooltipCooldown",
			}
		}
	},

	-- Poseidon
	PoseidonWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Melee",
		Icon = "Boon_Poseidon_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.30,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash",},
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1600,
				BaseMax = 1600,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", "SwordWeaponDash", "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1600,
				BaseMax = 1600,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordWeapon3", "ShieldWeapon", "ShieldWeaponDash", "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordWeapon3", "ShieldWeapon", "ShieldWeaponDash", "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 900,
				BaseMax = 900,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash", "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash", "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = {  "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", "FistWeaponDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1300,
				BaseMax = 1300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2","FistWeapon3","FistWeapon4","FistWeapon5", "FistWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1300,
				BaseMax = 1300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxPoseidon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipePoseidon",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Poseidon-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	PoseidonSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Secondary",
		Icon = "Boon_Poseidon_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.7,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2300,
				BaseMax = 2300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2300,
				BaseMax = 2300,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1200,
				BaseMax = 1200,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash"  },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "FistWeaponSpecial", "FistWeaponSpecialDash"  },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 2500,
				BaseMax = 2500,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1100,
				BaseMax = 1100,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "ImpactVelocity",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeType = "Add",
				BaseMin = 1800,
				BaseMax = 1800,
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
				ExcludeLinked = true,
				IgnoreRarity = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "PoseidonSplashNovaSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionPoseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalPoseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionPoseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Poseidon-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalPoseidon_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Poseidon",
				ChangeType = "Absolute",
			},
		}
	},

	PoseidonRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Ranged",
		Icon = "Boon_Poseidon_02",
		TraitDependencyTextOverrides =
		{
			ShieldLoadAmmoTrait =
			{
				Name = "ShieldLoadAmmo_PoseidonRangedTrait",
				CustomTrayText = "ShieldLoadAmmo_PoseidonRangedTrait_Tray",
			},
		},
		CustomTrayText = "PoseidonRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "PoseidonProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Poseidon",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			-- Beowulf
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "ImpactVelocity",
                ChangeValue = 0.5,
                ChangeType = "Multiply",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "ImpactVelocityCap",
                ChangeValue = 0.5,
                ChangeType = "Multiply",
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	PoseidonRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Rush",
		Icon = "Boon_Poseidon_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "PoseidonRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "CancelAttachedProjectiles",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Poseidon",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Poseidon",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = -0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	PoseidonShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Slot = "Shout",
		Icon = "Boon_Poseidon_04",
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "PoseidonShoutTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		AddShout =
		{
			FunctionName = "PoseidonShout",
			Cost = 25,
			SuperDuration = 1.2,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndSurge",
		PreEquipWeapons = { "PoseidonSurfWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 250,
				BaseMax = 250,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponName = "PoseidonSurfWeapon",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 3500,
				ChangeType = "Absolute",
			},
		}
	},
	PoseidonShoutDurationTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_15",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		AddSuperDurationData =
		{
			RequiredTrait = "PoseidonShoutTrait",
			Amount =
			{
				BaseValue = 1,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
			},
			ExtractValues =
			{
				{
					Key = "Amount",
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				}
			}
		},
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "PoseidonSurfWeapon" },
			FunctionName = "PoseidonShoutVacuum",
			FunctionArgs =
			{
				Range = 550,
				Interval = 0.4,
				LeadAmount = 100,
				Overshoot = 50,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	},

	BonusCollisionTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		BonusCollisionVulnerability =
		{
			BaseValue = 3.0,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "BonusCollisionVulnerability",
				ExtractAs = "TooltipVulnerability",
				Format = "PercentDelta",
			}
		}
	},

	SlamStunTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_08",
		AddOnSlamWeapons = { "PoseidonCollisionBlast" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonCollisionBlast",
				EffectName = "WaterStun",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	SlamExplosionTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Poseidon",
		Icon = "Boon_Poseidon_08",
		AddOnSlamWeapons = { "PoseidonCollisionBlast" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonCollisionBlast",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "PoseidonCollisionBlast",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	EncounterStartOffenseBuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_14",
		EncounterStartWeapon = "EncounterStartBuff",
		PreEquipWeapons = { "EncounterStartBuff" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.77,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
			RequiredEffects = { "EncounterStartBuff" },
			RequiredSelfEffectsMultiplier =
			{
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					  Value = -0.8,
				},
			},
			ExtractValues =
			{
				{
					Key = "RequiredSelfEffectsMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "EncounterStartBuff",
				EffectName = "EncounterStartBuff",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true,
				},
			},
		},
	},

	OnEnemyDeathDefenseBuffTrait =
	{
		OnEnemyDeathWeapon =
		{
			Weapon = "PoseidonKillBuff"
		},
		PropertyChanges =
		{
			{
				WeaponName = "PoseidonKillBuff",
				EffectName = "KillDefenseBonus",
				EffectProperty = "Duration",
				BaseValue = 5,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	SlipperyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_11",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "BlizzardOrbTrait",
				ProjectileName = "IceSpark",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				BaseValue = 10,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "BlizzardOrbTrait",
				ProjectileName = "IceSpark",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "MaxTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DamageOverDistance",
				EffectProperty = "MinTriggerDamage",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipRuptureDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverDistance",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipSlipperyRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverDistance",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			},
		}
	},

	BossDamageTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		Icon = "Boon_Poseidon_12",
		AddOutgoingDamageModifiers =
		{
			BossDamageMultiplier =
			{
				BaseValue = 1.20,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidEnchantments =
			{
				TraitDependentWeapons = {
					PoseidonWeaponTrait = WeaponSets.HeroPhysicalWeapons,
					PoseidonSecondaryTrait = WeaponSets.HeroSecondaryWeapons,
					PoseidonRushTrait = WeaponSets.HeroRushWeapons,
					PoseidonRangedTrait = WeaponSets.HeroNonPhysicalWeapons,
				},
				ValidWeapons = {
					"PoseidonSurfWeapon",
				},
			},
			ExtractValues =
			{
				{
					Key = "BossDamageMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},

	},

	DoubleCollisionTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "DoubleCollisionTrait",
		Icon = "Boon_Poseidon_07",
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonAphroditeTouchTrait",
				WeaponName = "PoseidonAphroditeTouchWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "PoseidonShoutTrait",
				WeaponName = "PoseidonSurfWeapon",
				EffectName = "DelayedKnockback",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		}
	},

	FishingTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "FishingTrait",
		RequiredTextLines = { "PoseidonFishQuest01" },
		Icon = "Boon_Poseidon_13",
		FishingPointChanceBonus = 0.2,
		DisableFishRequirements = true,
		ExtractValues =
		{
			{
				Key = "FishingPointChanceBonus",
				ExtractAs = "TooltipBonus",
				Format = "Percent",
			}
		}
	},

	HealthRewardBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Aphrodite_11",
		RequiredFalseTraits = { "HealthRewardBonusTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		HealthRewardBonus =
		{
			BaseValue = 1.3,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "HealthRewardBonus",
				ExtractAs = "TooltipPercentIncrease",
				Format = "PercentDelta",
			}
		}
	},

	RoomRewardBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Poseidon_09",
		RequiredFalseTraits = { "RoomRewardBonusTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		MoneyRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		MetapointRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		GemRewardBonus =
		{
			BaseValue = 1.5,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "MoneyRewardBonus",
				ExtractAs = "TooltipPercentIncrease",
				Format = "PercentDelta",
			}
		}
	},

	ReducedEnemySpawnsTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		SpawnMultiplier =
		{
			BaseValue = 0.8,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "SpawnMultiplier",
				ExtractAs = "TooltipSpawnMultiplier",
				Format = "NegativePercentDelta",
			}
		}
	},

	UnusedWeaponBonusTrait =
	{
		Frame = "MetaUpgrade",
		Icon = "BonusDarkness_01",
		MetaPointMultiplier = 1.2,
		ExtractValues =
		{
			{
				Key = "MetaPointMultiplier",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta",
			}
		}
	},

	UnusedWeaponBonusTraitAddGems =
	{
		Frame = "MetaUpgrade",
		Icon = "BonusDarkness_02",
		MetaPointMultiplier = 1.2,
		GemMultiplier = 1.2,
		ExtractValues =
		{
			{
				Key = "MetaPointMultiplier",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta",
			}
		}
	},

	HealthBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 20,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	PoseidonPickedUpMinorLootTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		BoonInfoRequirementText = "RandomMinorLootDrop",
		LootSource = "PoseidonUpgrade",
		Hidden = true,
	},

	RoomRewardMaxHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	RoomRewardEmptyMaxHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				ChangeType = "Add",
				BlockHealing = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	-- Artemis
	ArtemisWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_01",
		God = "Artemis",
		Slot = "Melee",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxArtemis",
				ChangeType = "Absolute"
			},

			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeArtemis",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Artemis-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	ArtemisSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_00",
		God = "Artemis",
		Slot = "Secondary",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.20,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "ArtemisSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionArtemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalArtemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionArtemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Artemis-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalArtemis_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Artemis",
				ChangeType = "Absolute",
			},
		}
	},

	ArtemisRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Artemis",
		Slot = "Ranged",
		Icon = "Boon_Artemis_02",
		CustomTrayText = "ArtemisRangedTrait_Tray",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.145,
			},
			Epic =
			{
				Multiplier = 1.290,
			},
			Heroic =
			{
				Multiplier = 1.435,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ArtemisProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Artemis",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			-- Beowulf
			{
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 400
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Artemis"
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	ArtemisRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
		God = "Artemis",
		Icon = "Boon_Artemis_03",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = {
				BaseValue = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
			},
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Artemis",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Artemis",
				ChangeType = "Absolute",
			},
		},
	},

	ArtemisCriticalTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Artemis_05",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "CritMultiplierAddition",
				BaseValue = 0.15,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = -0.34,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCritDamageBonus",
					Format = "Percent",
				}
			},
		}
	},

	CriticalBufferMultiplierTrait =
	{
		Icon = "Boon_Artemis_09",
		InheritFrom = { "ShopTier2Trait" },
		CriticalHealthBufferMultiplier =
		{
			BaseValue = 2,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CriticalHealthBufferMultiplier",
				ExtractAs = "TooltipDamageBonus",
				Format = "PercentDelta",
			}
		}
	},

	CriticalSuperGenerationTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		Icon = "Boon_Artemis_13",
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		CriticalSuperGainAmount =
		{
			BaseValue = 0.25,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CriticalSuperGainAmount",
				ExtractAs = "TooltipCriticalSuperGain",
				DecimalPlaces = 2,
			}
		}
	},

	CriticalStunTrait =
	{
		Icon = "Boon_Artemis_05",
		InheritFrom = { "ShopTier2Trait" },
		AddOnDamageWeapons = { "CriticalStunApplier" },
		OnDamageWeaponProperties = { CritOnly = true },
		PropertyChanges =
		{
			{
				WeaponName = "CriticalStunApplier",
				EffectName = "CriticalStun",
				EffectProperty = "Duration",
				BaseValue = 1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ArtemisShoutTrait =
	{
		Icon = "Boon_Artemis_04",
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "ArtemisShoutTrait_Tray",
		God = "Artemis",
		-- ProcEmote = "/VO/ZagreusEmotes/EmoteRanged",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "ArtemisShout",
			MaxFunctionName = "ArtemisMaxShout",
			Cost = 20,
			SuperDuration = 0.8,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
			}
		},
		PreEquipWeapons = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
		PropertyChanges =
		{
			{
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponNames = {"ArtemisMaxShoutWeapon",},
				WeaponProperty = "NumProjectiles",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				}

			},
			{
				WeaponNames = {"ArtemisMaxShoutWeapon", "ArtemisShoutWeapon",},
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
		}
	},

	ArtemisShoutBuffTrait =
	{
		Icon = "Boon_Artemis_04",
		InheritFrom = { "ShopTier1Trait" },
		God = "Artemis",
		Slot = "Shout",
		AddShout =
		{
			FunctionName = "ArtemisShout",
			Cost = 25,
			SuperDuration =
			{
				BaseValue = 3,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "SuperDuration",
					ExtractAs = "TooltipDuration"
				}
			}
		},
		PreEquipWeapons = { "ArtemisShoutBuff" },
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisShoutBuff",
				EffectName = "ShoutCritChance",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	MarkedDropGoldTrait =
	{
		InheritFrom = { "ShopTier2Trait" },

		RarityLevels =
		{
				Common =
				{
					MinMultiplier = 1.0,
					MaxMultiplier = 1.0,
				},
				Rare =
				{
					MinMultiplier = 1.5,
					MaxMultiplier = 1.5,
				},
				Epic =
				{
					MinMultiplier = 2.0,
					MaxMultiplier = 2.0,
				},
				Heroic =
				{
					Multiplier = 2.5,
				},
		},
		Icon = "Boon_Artemis_06",
		PriorityDisplay = true,
		GoldBonusDrop =
		{
				Amount = 20,
				RoomCap = 1,
				RequiredEffect = "CritVulnerability",
				ExtractValues =
				{
					{
							Key = "Amount",
							ExtractAs = "TooltipBonusMoney",
					}
				}
		},
		ExtractValues =
		{

				{
					ExtractAs = "TooltipMarkDuration",
					SkipAutoExtract = true,
					External = true,
					BaseType = "Effect",
					WeaponName = "CritVulnerabilityWeapon",
					BaseName = "CritVulnerability",
					BaseProperty = "Duration",
				}
		}
	},

	ArtemisBonusProjectileTrait =
	{
		InheritFrom = { "SynergyTrait"},
		RequiredFalseTrait = "ArtemisBonusProjectileTrait",
		God = "Artemis",
		Icon = "Poseidon_Artemis_01",
		RequiredFalseTraits = { "PoseidonAresProjectileTrait" },
		PropertyChanges =
		{
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "NumProjectileWaves",
					ChangeValue = 2,
					ExtractValue =
					{
							ExtractAs = "TooltipProjectiles",
							SkipAutoExtract = true,
					},
					IdenticalMultiplier =
					{
							Value = -1,
							MinMultiplier = 0,
					},
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "ProjectileWaveInterval",
					ChangeValue = 0.15,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "AdditionalWaveDamageMultiplier",
					BaseValue = 0.30,
					MinMultiplier = 0.05,
					IdenticalMultiplier =
					{
							Value = -0.75,
					},
					ExtractValue =
					{
							ExtractAs = "TooltipDamage",
							Format ="Percent"
					}
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "ProjectileAngleOffsetMin",
					ChangeValue = -0.15,
					ChangeType = "Absolute",
				},
				{
					WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
					WeaponProperty = "ProjectileAngleOffsetMax",
					ChangeValue = 0.15,
					ChangeType = "Absolute",
				},
		},
	},

	MoreAmmoTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Artemis_07",
		RequiredFalseTrait = "MoreAmmoTrait",
		--[[
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		]]
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseValue = 2.0,
				ChangeType = "Add",
				MinMultiplier = 1,
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},

	},

	RoomAmmoTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RoomAmmoRestore = 3,
		Icon = "Boon_Artemis_10",
		ExtractValues =
		{
			{
				Key = "RoomAmmoRestore",
				ExtractAs = "TooltipAmmo",
			}
		}
	},

	UnstoredAmmoDamageTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTraits = {"UnstoredAmmoDamageTrait", "MagnetismTrait",},
		RequiredMetaUpgradeSelected = "ReloadAmmoMetaUpgrade",
		Icon = "Boon_Hermes_02",
		AddOutgoingDamageModifiers =
		{
			UnstoredAmmoMultiplier = 1.5,
			ExtractValues =
			{
				{
					Key = "UnstoredAmmoMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},

	},

	AmmoReloadTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomTrayText = "AmmoReloadTrait_Tray",
		RequiredMetaUpgradeSelected = "ReloadAmmoMetaUpgrade",
		Icon = "Boon_Hermes_03",
		RequiredFalseTrait = "AmmoReloadTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 2.75/2.5,
				MaxMultiplier = 2.75/2.5,
			},
			Epic =
			{
				MinMultiplier = 2.75/2.25,
				MaxMultiplier = 2.75/2.25,
			},
			Heroic =
			{
				Multiplier = 2.75/2,
			}
		},
		AmmoReloadTimeDivisor =
		{
			BaseValue = 3/2.75,
		},
		ExtractValues =
		{
			{
				Key = "AmmoReloadTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoReloadDivisor",
				DecimalPlaces = 2.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoReloadDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 2.0,
			}
		}
	},
	AmmoReclaimTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomTrayText = "AmmoReclaimTrait_Tray",
		RequiredMetaUpgradeSelected = "AmmoMetaUpgrade",
		Icon = "Boon_Hermes_03",
		RequiredFalseTraits = { "AresRangedTrait", "DionysusRangedTrait", "DemeterRangedTrait", "ShieldLoadAmmoTrait", "PoseidonAresProjectileTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Rare =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Epic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Heroic =
			{
				Multiplier = 5.0,
			}
		},
		AmmoReclaimTimeDivisor =
		{
			BaseValue = 1.6,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "AmmoReclaimTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoDelayDivisor",
				DecimalPlaces = 1.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoDropDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 1.0,
			}
		}
	},

	CritBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_08",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "CritAddition",
				BaseValue = 0.02,
				MinMultiplier = 0.333333,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipCritBonus",
					Format = "Percent",
				},
			},
		}
	},

	ArtemisAmmoExitTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AmmoDropWeapons = { "ArtemisAmmoWeapon" },
		Icon = "Boon_Artemis_10",
		RequiredFalseTraits = { "BlizzardOrbTrait", "AresRangedTrait", "DionysusRangedTrait", "DemeterRangedTrait", "ShieldLoadAmmoTrait", "PoseidonAresProjectileTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisAmmoWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "ArtemisAmmoWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	CritVulnerabilityTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_14",
		PreEquipWeapons = { "CritVulnerabilityWeapon" },
		OnEnemyCrittedFunction =
		{
			Name = "MarkRandomNearby",
			Args = { Range = 1200 }
		},
		PropertyChanges =
		{
			{
				WeaponName = "CritVulnerabilityWeapon",
				EffectName = "CritVulnerability",
				EffectProperty = "CritVulnerabilityAddition",
				BaseValue = 0.30,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipVulnerability",
					Format = "Percent",
				}
			},
		},
		ExtractValues =
		{

			{
				ExtractAs = "TooltipMarkDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "CritVulnerabilityWeapon",
				BaseName = "CritVulnerability",
				BaseProperty = "Duration",
			}
		}
	},

	ArtemisSupportingFireTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Artemis_12",
		AddOnDamageWeapons = {"ArtemisLegendary"},
		OnDamageWeaponProperties = { FirstHitOnly = true },
		LegalOnDamageWeapons = WeaponSets.HeroPrimarySecondaryWeapons,
		AddOnFireWeapons = { "ArtemisLegendary" },
		LegalOnFireWeapons = WeaponSets.HeroNonPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisLegendary",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.1,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
			},
			{
				WeaponName = "ArtemisLegendary",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	-- Aphrodite
	AphroditeDurationTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_05",
		PreEquipWeapons = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				BaseValue = 5,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Duration",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditePotencyTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_12",
		PreEquipWeapons = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
		RequiredFalseTrait = "AphroditePotencyTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				BaseValue = -0.1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipModifier",
					DecimalPlaces = 1,
					Format = "Percent",
					AbsoluteValue = true
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Melee",
		Icon = "Boon_Aphrodite_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.50,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DetonateChildGraphics",
				ChangeValue = "Cone180Athena",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeA-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipeC-Emitter-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAphrodite",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAphrodite",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Aphrodite-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Aphrodite",
				ChangeType = "Absoawlute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Secondary",
		Icon = "Boon_Aphrodite_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "AphroditeSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Aphrodite-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAphrodite_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Aphrodite",
				ChangeType = "Absolute",
			},

		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_02",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		Slot = "Ranged",
		UnloadAmmoOffset = -20,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.11,
			},
			Epic =
			{
				Multiplier = 1.22,
			},
			Heroic =
			{
				Multiplier = 1.33,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AphroditeProjectile",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			-- For adjusting aimline collisions -- @alice
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Scale",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "AimLineAnimation",
				ChangeValue = "AimLineExtraDamageCap",
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 25,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AutoLockRange",
				ChangeValue = 440,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DetonateChildGraphics",
				ChangeValue = "Cone180Athena",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Aphrodite",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 90,
				BaseMax = 90,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	ShieldLoadAmmo_AphroditeRangedTrait =
	{
        InheritFrom = { "ShopTier1Trait" },
        CustomTrayText = "ShieldLoadAmmo_AphroditeRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		Icon = "Boon_Aphrodite_02",
		God = "Aphrodite",
		Slot = "Ranged",
        RarityLevels =
        {
            Common =
            {
                Multiplier = 1.0,
            },
            Rare =
            {
                Multiplier = 1.2,
            },
            Epic =
            {
                Multiplier = 1.4,
            },
            Heroic =
            {
                Multiplier = 1.6,
            }
        },
        PropertyChanges =
        {
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "Projectile",
                ChangeValue = "AphroditeBeowulfProjectile",
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireFx",
                ChangeValue = "ProjectileFireRing-Aphrodite",
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageLow",
                BaseMin = 80,
                BaseMax = 80,
                DepthMult = DepthDamageMultiplier,
                IdenticalMultiplier =
                {
                    Value = DuplicateStrongMultiplier,
                },
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                }
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageHigh",
                DeriveValueFrom = "DamageLow"
            },
            {
				WeaponName = "RangedWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},
        },
        ExtractValues =
        {
            {
                ExtractAs = "BaseRangedDamage",
                External = true,
                BaseType = "Projectile",
                BaseName = "RangedWeapon",
                BaseProperty = "DamageLow",
            },
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
        }
	},

  ShieldLoadAmmo_AresRangedTrait =
  {
        InheritFrom = { "ShopTier1Trait" },
        CustomTrayText = "ShieldLoadAmmo_AresRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		Icon = "Boon_Ares_02",
		God = "Ares",
		Slot = "Ranged",
        RarityLevels =
        {
            Common =
            {
                Multiplier = 1.0,
            },
            Rare =
            {
                Multiplier = 1.2,
            },
            Epic =
            {
                Multiplier = 1.4,
            },
            Heroic =
            {
                Multiplier = 1.6,
            }
        },
        PropertyChanges =
        {
        	{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "Projectile",
                ChangeValue = "AresProjectile",
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileName = "AresProjectile",
                ProjectileProperty = "DamageRadius",
                ChangeValue = 270,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileName = "AresProjectile",
                ProjectileProperty = "Fuse",
                ChangeValue = 0.2,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileName = "AresProjectile",
                ProjectileProperty = "TotalFuse",
                ChangeValue = 0.8,
                ChangeType = "Absolute",
            },
            {
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
				AsInt = true,
				MinMultiplier = 0.05,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
        	--[[
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "Projectile",
                ChangeValue = "AresBeowulfProjectile",
                ChangeType = "Absolute",
            },

            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
                EffectProperty = "Amount",
                BaseMin = 100,
                BaseMax = 100,
                AsInt = true,
                MinMultiplier = 0.025,
                IdenticalMultiplier =
                {
                    Value = -0.35,
                },
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                }
            },
              ]]--
        },

        ExtractValues =
        {
            {
                ExtractAs = "BaseRangedDamage",
                External = true,
                BaseType = "Projectile",
                BaseName = "RangedWeapon",
                BaseProperty = "DamageLow",
            }
        }
  },
	AphroditeRangedBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Icon = "Boon_Aphrodite_13",
		RequiredFalseTraits = { "AphroditeRangedBonusTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			--ExcludeLinked = true,
			HitMaxHealthMultiplier = { BaseValue = 1.5, SourceIsMultiplier = true },
			ExtractValues =
			{
				{
					Key = "HitMaxHealthMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Range",
				ChangeValue = 2,
				ChangeType = "Multiply"
			},
			{
				TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.3,
				ChangeType = "Multiply"
			},
		},
	},

	CastBackstabTrait =
	{
		InheritFrom = { "SynergyTrait" },
		God = "Aphrodite",
		Icon = "Aphrodite_Athena_01",
		RequiredFalseTraits = { "CastBackstabTrait", "DionysusRangedTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			--ExcludeLinked = true,
			HitVulnerabilityMultiplier = { BaseValue = 1.35, SourceIsMultiplier = true },
			ExtractValues =
			{
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
		}
	},

	AphroditeRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Aphrodite",
		Slot = "Rush",
		Icon = "Boon_Aphrodite_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AphroditeRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 20,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpointDelay",
				ChangeValue = 0.01,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "ReduceDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Aphrodite",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Aphrodite",
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AphroditeShoutTrait_Tray",
		God = "Aphrodite",
		-- ProcEmote = "/VO/ZagreusEmotes/EmoteRanged",
		Slot = "Shout",
		Icon = "Boon_Aphrodite_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		AddShout =
		{
			FunctionName = "AphroditeShout",
			MaxFunctionName = "AphroditeMaxShout",
			Cost = 25,
			SuperDuration = 0.25,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm", },
		PropertyChanges =
		{
			{
				WeaponNames = { "AphroditeSuperCharm", "AphroditeMaxSuperCharm",},
				EffectName = "Charm",
				EffectProperty = "Duration",
				BaseValue = 5,
				ChangeType = "Add",
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = -0.9,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
			},

			{
				WeaponNames = {"AphroditeMaxSuperCharm",},
				ProjectileProperty = "DamageLow",
				ChangeValue = 2500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					SkipAutoExtract = true
				}
			},
			{
				WeaponNames = {"AphroditeMaxSuperCharm",},
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	AphroditeWeakenTrait =
	{
		God = "Aphrodite",
		InheritFrom = {"ShopTier2Trait"},
		PreEquipWeapons = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon"},
		Icon = "Boon_Aphrodite_06",
		PropertyChanges =
		{
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ShieldLoadAmmo_AphroditeRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				BaseMin = 0.10,
				BaseMax = 0.10,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
				ChangeType = "Add",
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = {"AphroditeShoutWeapon", "AreaWeakenAphrodite", "PoseidonAphroditeTouchWeapon" },
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AphroditeDeathTrait",
				WeaponNames = {"DeathAreaWeakenAphrodite"},
				EffectName = "IncreaseDamageTaken",
				EffectProperty = "Modifier",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeRetaliateTrait =
	{
		God = "Aphrodite",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "AreaWeakenAphrodite" },
		Icon = "Boon_Aphrodite_09",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "AreaWeakenAphrodite",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "AreaWeakenAphrodite",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	AphroditeDeathTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Aphrodite_08",
		OnEnemyDeathWeapon = { Weapon = "DeathAreaWeakenAphrodite", FireAtDeathLocation = true },
		PropertyChanges =
		{
			{
				WeaponName = "DeathAreaWeakenAphrodite",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "DeathAreaWeakenAphrodite",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	ProximityArmorTrait =
	{
		Icon = "Boon_Aphrodite_07",
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		AddIncomingDamageModifiers =
		{
			ProximityThreshold = 400,
			ProximityMultiplier =
			{
				BaseValue = 0.9,
				MinMultiplier = 0.1,
				ToNearest = 0.01,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "ProximityMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	CharmTrait =
	{
		Icon = "Boon_Aphrodite_10",
		RequiredFalseTrait = "CharmTrait",
		God = "Aphrodite",
		InheritFrom = { "ShopTier3Trait" },
		AddOnEffectWeapons =
		{
			EffectName = "ReduceDamageOutput",
			Weapon = "AphroditeCharmWeapon",
			AffectChance = 0.15,
			ExtractValues =
			{
				{
					Key = "AffectChance",
					ExtractAs = "TooltipAffectChance",
					SkipAutoExtract = true,
					Format = "Percent",
				}
			}
			--IgnoreEnemies = { "Harpy", "Harpy2", "Harpy3", "HydraHead" },
		},
		PropertyChanges =
		{
			{
				WeaponName = "AphroditeCharmWeapon",
				EffectName = "Charm",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				DeriveTarget = "DurationTarget"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	-- Ares
	AresWeaponTrait =
	{
		Icon = "Boon_Ares_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Melee",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 50,
				BaseMax = 50,
				AsInt = true,
				MinMultiplier = 0.025,
				IdenticalMultiplier =
				{
					Value = -0.4,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAres",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeAres",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Ares-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	AresSecondaryTrait =
	{
		Icon = "Boon_Ares_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.34,
			},
			Epic =
			{
				Multiplier = 1.67,
			},
			Heroic =
			{
				Multiplier = 2.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 60,
				BaseMax = 60,
				IdenticalMultiplier =
				{
					Value = -0.34,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "AresSpearThrowStartFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAres",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAres",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionAres",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Ares-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalAres_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Ares",
				ChangeType = "Absolute",
			},
		},
	},

	OnSpawnSwordTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AddOnEnemySpawnWeapon = {
			Weapon = "SpawnDelayDamage",
			AffectChance = 0.5,
		},
		PropertyChanges =
		{
			{
				WeaponName = "SpawnDelayDamage",
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 50,
				BaseMax = 150,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
		}
	},

	AresRangedTrait =
	{
		Icon = "Boon_Ares_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Ranged",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AresProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 20,
				AsInt = true,
				MinMultiplier = 0.1,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			--[[
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "Speed",
				ChangeValue = 0.4,
				ChangeType = "Multiply",
			},
			]]
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	AresRushTrait =
	{
		Icon = "Boon_Ares_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Ares",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AresRushProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Ares",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Ares",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
		},
	},

	AresShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "AresShoutTrait_Tray",
		Icon = "Boon_Ares_04",
		God = "Ares",
		Slot = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		AddShout =
		{
			FunctionName = "AresShout",
			Cost = 25,
			SuperDuration = 1.2,
			MaxDurationMultiplier = 5.0,
			MaxWeaponDataOverride =
			{
				AresSurgeWeapon =
				{
					FireRumbleParameters =
					{
						{ ScreenPreWait = 0.1, RightFraction = 0.17, Duration = 6.5 },
					},
				},
			},
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					Format = "ExWrathDuration",
					ExtractAs = "TooltipMaxDuration",
					DecimalPlaces = 1,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndSurge",
		PreEquipWeapons = { "AresSurgeWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 30,
				BaseMax = 30,
				AsInt = true,
				MinMultiplier = 0.05,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				TraitName = "HermesShoutDodge",
                WeaponName = "HermesWrathBuff",
                EffectName = "DodgeBonus",
                EffectProperty = "BackFx",
                ChangeValue = "null",
                ChangeType = "Absolute",
			},
		}
	},

	AresAoETrait =
	{
		Icon = "Boon_Ares_07",
		InheritFrom = { "ShopTier2Trait" },
		God = "Ares",
		RequiresFalseTraits = { "AresAoETrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = 30,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "AresProjectile",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "AresRangedTrait"
			},

			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "AresRangedTrait"
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "AresRangedTrait"
			},

		},
	},

	AresDragTrait =
	{
		Icon = "Boon_Ares_08",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "AresDragTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 300,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 300,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 100,
				ChangeType = "Add",
			},

			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 600,
				ChangeType = "Add",
			},
			{
				TraitName = "AresShoutTrait",
				WeaponName = "AresSurgeWeapon",
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 200,
				ChangeType = "Add",
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumStrength",
				ChangeValue = 300,
				ChangeType = "Add",
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "VacuumDistance",
				ChangeValue = 100,
				ChangeType = "Add",
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 0.2,
				ChangeType = "Add",
				DeriveTarget = "TotalFuseTarget"
			},

			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 0.2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveTarget = "TotalFuseTarget"
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 0.2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				},
				DeriveTarget = "TotalFuseTarget"
			},
		},
	},

	AresLoadCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "AresLoadCurseTrait",
		Icon = "Boon_Ares_11",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.2,

			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue = true,
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
                EffectProperty = "Stacks",
                ChangeValue  = true,
            },
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue  = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Stacks",
				ChangeValue  = true,
			},
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				BaseMin = 10,
				BaseMax = 10,
				AsInt = true,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DamageSource",
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				DeriveValueFrom = "DamageSource"
            },
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "StackAmount",
				DeriveValueFrom = "DamageSource"
			},
		},
	},

	AresLongCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Ares_13",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,

			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.60,
				ToNearest = 0.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidEffects = { "DelayedDamage" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				BaseValue = 1.6,
				ChangeType = "Absolute",
				DeriveSource = "DurationSource",
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
            },
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		},
		DeriveDurationText = 0.5,
		ExtractValues =
		{
			{
				SkipAutoExtract = true,
				Key = "DeriveDurationText",
				ExtractAs = "TooltipDelay",
				DecimalPlaces = 1,
			}
		},
	},

	AresCursedRiftTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "AresCursedRiftTrait",
		Icon = "Boon_Ares_09",
		TextStore = "AresShoutTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 2,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "AresRushProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "AresRushProjectile",
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				DeriveValueFrom = "DamageSource"
			},

			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "DamagePerConsecutiveHit",
				DeriveValueFrom = "DamageSource"
			},
			{
				TraitName = "AresShoutTrait",
				WeaponNames = { "AresSurgeWeapon" },
				ProjectileName = "AresInvisibleAoE",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.55,
				ChangeType = "Absolute",
				DeriveSource = "WindowSource"
			},
		},
	},



	AresRetaliateTrait =
	{
		Icon = "Boon_Ares_05",
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "AresRetaliate" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.60,
			}
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponName = "AresRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "AresRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			]]

			{
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "Amount",
				BaseMin = 100,
				BaseMax = 100,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

		},
	},

	IncreasedDamageTrait =
	{
		Icon = "Boon_Ares_06",
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.3,

			},
			Epic =
			{
				Multiplier = 1.6,
			},
			Heroic =
			{
				Multiplier = 1.9,
			}
		},
		God = "Ares",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.1,
				MinMultiplier = 0.100,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = -0.6,
				},
				ToNearest = 0.01,
			},
			ValidWeapons = WeaponSets.HeroAllWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		}
	},

	OnWrathDamageBuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Zeus_13",
		OnSuperWeapons = { "AresShoutBuff" },
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,

			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "AresShoutBuff",
				EffectName = "ShoutDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 15,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "AresShoutBuff",
				EffectName = "ShoutDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 1.20,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta"
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	},

	LastStandDamageBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Ares_14",
		PreEquipWeapons = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
		RequiredMinMaximumLastStands = 1,
		RequiredFalseTrait = "LastStandDamageBonusTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "LastStandDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.15,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "Percent",
				},
				ChangeType = "Add",
			},
			{
				WeaponNames = {"LastStandMetaUpgradeShield", "LastStandReincarnateShield"},
				EffectName = "LastStandDamageBonus",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},
	OnEnemyDeathDamageInstanceBuffTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Ares_12",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			},
			Heroic =
			{
				Multiplier = 2.50,
			}
		},
		OnEnemyDeathWeapon =
		{
			Weapon = "AresKillBuff"
		},
		OnEnemyDeathKillBonus =
		{
			BaseValue = 1.00,
			IdenticalMultiplier =
			{
				Value = -0.7,
			},
		},
		ExtractValues =
		{
			{
				Key = "OnEnemyDeathKillBonus",
				ExtractAs = "TooltipKillBonus",
				Format = "Percent",
			}
		},
	},

	-- Dionysus
	DionysusSpreadTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_07",
		PreEquipEnemyWeapon = "DionysusPlagueWeapon",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DionysusPlagueWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
		EnemyPropertyChanges =
		{
			{
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 4,
				BaseMax = 4,
				AsInt = true,
				MinMultiplier = 0.25,
				ChangeType = "Add",
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
		},
		-- Display variable. Can be replaced later with a real extraction
		TooltipSpreadRate = 4,
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},
	DionysusSlowTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_06",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.5,

			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.2,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				BaseValue = 0.85,
				MinMultiplier = 0.2,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				DeriveSource = "ModifierSource",
				ExtractValue =
				{
					ExtractAs = "InitialSlow",
					Format = "NegativePercentDelta",
				}
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Absolute",
				DeriveSource = "DurationSource",
				ExtractValue =
				{
					ExtractAs = "SlowDuration",
				}
			},
			-- Active
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			-- Modifier
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			-- Duration
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName= "WineSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "DurationSource"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	DionysusAoETrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_05",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = 100,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},

				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "DionysusField",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				ProjectileProperty = "DamageRadius",
				DeriveValueFrom = "DionysusRangedTrait"
			},
		},
	},

	DionysusDefenseTrait =
	{
		InheritFrom = { "ShopTier2Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_11",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName= "WinePuddleDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.85,
				BaseMax = 0.90,
				SourceIsMultiplier = true,
				DeriveSource = "ModifierSource",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			-- Active
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "WinePuddleDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			-- Modifier
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "WinePuddleDefense",
				EffectProperty = "Modifier",
				DeriveValueFrom = "ModifierSource"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},


	DionysusComboVulnerability =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "DionysusComboVulnerability",
		God = "Dionysus",
		Icon = "Boon_Dionysus_08",
		AddOutgoingDamageModifiers =
		{
			RequiredEffects = { "DamageOverTime", "WinePuddleVulnerability" },
			RequiredEffectsMultiplier =
			{
				BaseValue = 1.6,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "RequiredEffectsMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},

	GiftHealthTrait =
	{
		Icon = "Boon_Dionysus_05",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,

			},
			Epic =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		GiftPointHealthMultiplier =
		{
			BaseValue = 20,
			AsInt = true,
			MinMultiplier = 0.05,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "GiftPointHealthMultiplier",
				ExtractAs = "TooltipHealthConversion",
			}
		}
	},
  FountainDamageBonusTrait =
  {
    Icon = "Boon_Dionysus_13",
    InheritFrom = { "ShopTier1Trait" },
    God = "Dionysus",
    CustomTrayText = "FountainDamageBonusTrait_Tray",
    RequiredFalseTrait = "FountainDamageBonusTrait",    
	RequiredCosmetics = { "TartarusReprieve" },
	CustomTrayNameWithMetaUpgrade =
	{
		MetaUpgradeName = "HealingReductionShrineUpgrade",
		Name = "FountainDamageBonusTrait_Tray_Reduced",
	},
	CustomNameWithMetaUpgrade =
	{
		MetaUpgradeName = "HealingReductionShrineUpgrade",
		Name = "FountainDamageBonusTrait_Reduced",
	},
	RarityLevels =
	{
		Common =
		{
			Multiplier = 1.0,
		},
		Rare =
		{
			Multiplier = 1.34,
		},
		Epic =
		{
			Multiplier = 1.67,
		},
		Heroic =
		{
			Multiplier = 2.00,
		},
	},
	FountainHealFractionOverride = 1,
    FountainDamageBonus =
    {
      BaseValue = 1.03,
      SourceIsMultiplier = true,
      DecimalPlaces = 2,
      MinMultiplier = 0.1,
	  IdenticalMultiplier =
	  {
		  Value = -0.8,
	  },
    },
    AddOutgoingDamageModifiers =
    {
      UseTraitValue = "AccumulatedFountainDamageBonus",
	  IsMultiplier = true,
	  Unique = true,
    },
    AccumulatedFountainDamageBonus = 1,
    ExtractValues =
    {
      {
        Key = "FountainDamageBonus",
        ExtractAs = "TooltipFountainBonus",
        Format = "PercentDelta",
        DecimalPlaces = 1,
      },
      {
        Key = "AccumulatedFountainDamageBonus",
        ExtractAs = "TooltipAccumulatedBonus",
        Format = "PercentDelta",
        DecimalPlaces = 1,
      },
		{
			ExtractAs = "HealingReduction",
			Format = "TotalMetaUpgradeChangeValue",
			MetaUpgradeName = "HealingReductionShrineUpgrade"
		},
		{
			Key = "FountainHealFractionOverride",
			ExtractAs = "TooltipHeal",
			Format = "PercentHeal",
		},
    },
  },

	DionysusMaxHealthTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Hidden = true,
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},
	DionysusWeaponTrait =
	{
		Icon = "Boon_Dionysus_01",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Slot = "Melee",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,

			},
			Epic =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 4,
				BaseMax = 4,
				MinMultiplier = 0.335,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDionysus",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeDionysus",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Dionysus-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	DionysusSecondaryTrait =
	{
		Icon = "Boon_Dionysus_00",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Slot = "Secondary",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.2,
				MaxMultiplier = 1.2,

			},
			Epic =
			{
				MinMultiplier = 1.4,
				MaxMultiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 5,
				BaseMax = 5,
				AsInt = true,
				MinMultiplier = 0.25,
				ChangeType = "Add",
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "DionysusImpactPieceSpearThrow",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Dionysus-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDionysus_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Dionysus",
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	DionysusRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Slot = "Ranged",
		Icon = "Boon_Dionysus_02",
		TraitDependencyTextOverrides =
		{
			ShieldLoadAmmoTrait =
			{
				Name = "ShieldLoadAmmo_DionysusRangedTrait",
				CustomTrayText = "ShieldLoadAmmo_DionysusRangedTrait_Tray",
			},
			BowLoadAmmoTrait =
			{
				Name = "BowLoadAmmo_DionysusRangedTrait",
				CustomTrayText = "BowLoadAmmo_DionysusRangedTrait_Tray",
			},
		},
		CustomTrayText = "DionysusRangedTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DionysusLobProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "SilentImpactOnInvulnerable",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAiming",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "AutoLockRange",
				ChangeValue = 900,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ManualAimingInitialOffset",
				ChangeValue = 420,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "GunGrenadeWarningDecal",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusRangedWeapon_ChargeDionysusLob",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 100,
				BaseMax = 100,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			-- Beowulf modifications
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageLow",
				BaseMin = 120,
				BaseMax = 120,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBeowulf",
				}
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ExcludeProjectileName = "DionysusLobProjectile",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "Blank",
			},
			-- In case bow load ammo is Active
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
			},
			-- Flurry Shot
			{
				TraitName = "RapidCastTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},

	DionysusRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Slot = "Rush",
		Icon = "Boon_Dionysus_03",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,

			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			}
		},
		WeaponDataOverride =
		{
			RushWeapon =
			{
				CauseImpactReaction = false,
				ImpactReactionHitsOverride = 0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "BlinkTrailVerticalB-Dionysus",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusDashNoCollide_Dionysus",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DionysusDashProjectile",
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 120,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "Range",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				BaseMin = 2,
				BaseMax = 2,
				ChangeType = "Add",
				AsInt = true,
				MinMultiplier = 0.5,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	AmmoFieldTrait =
	{
		Icon = "Boon_Zeus_08",
		InheritFrom = { "ShopTier1Trait" },
		PreEquipWeapons = { "DionysusAmmoWeapon" },
		AmmoFieldWeapon =
		{
			WeaponName = "DionysusAmmoWeapon",
			Interval = { Min = 1.5, Max = 1.5 }
		},
		PropertyChanges =
		{
			{
				WeaponName = "DionysusAmmoWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 5,
				BaseMax = 5,
				AsInt = true,
				MinMultiplier = 0.2,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
		}
	},

	AmmoBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Artemis_Zeus_01",
		RequiredFalseTrait = "AmmoBoltTrait",
		RequiredMetaUpgradeSelected = "AmmoMetaUpgrade",
		PreEquipWeapons = { "ZeusAmmoWeapon" },
		AmmoFieldWeapon =
		{
			WeaponName = "ZeusAmmoWeapon",
			Interval = { Min = 1.0, Max = 1.0 },
			Range = 900,
		},
		PropertyChanges =
		{
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ZeusAmmoWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				UnitProperty = "Magnetism",
				BaseValue = 0.5,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipMagnetism",
					Format = "PercentDelta"
				}
			},
		}
	},

	DionysusShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "DionysusShoutTrait_Tray",
		God = "Dionysus",
		Slot = "Shout",
		Icon = "Boon_Dionysus_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.10,
			},
			Epic =
			{
				Multiplier = 1.20,
			},
			Heroic =
			{
				Multiplier = 1.30,
			}
		},
		AddShout =
		{
			FunctionName = "DionysusShout",
			Cost = 25,
			SuperDuration = 1.5,
			MaxDurationMultiplier = 6,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		PreEquipWeapons = { "DionysusShoutWeapon" },
		PropertyChanges =
		{
			{
				WeaponName = "DionysusShoutWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Active",
				ChangeType = "Absolute",
				ChangeValue = true,
			},
			{
				WeaponName = "DionysusShoutWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "Amount",
				ChangeType = "Add",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.25,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	DionysusPoisonPowerTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		Icon = "Boon_Dionysus_09",
		AddOutgoingDamageModifiers =
		{
			EffectThresholdDamageMultiplier =
			{
				BaseValue = 1.50,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "EffectThresholdDamageMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "EffectDamageMultiplierName",
				ChangeValue = "DamageOverTime",
				ChangeType = "Absolute",
			},
			{
				UnitProperty = "EffectDamageMultiplierMinRequired",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipRequiredPoisonedEnemies",
					SkipAutoExtract = true,
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipPoisonRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	DoorHealTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		CustomNameWithMetaUpgrade =
		{
			MetaUpgradeName = "HealingReductionShrineUpgrade",
			Name = "DoorHealTrait_Reduced",
		},
		Icon = "Boon_Dionysus_10",
		RequiredFalseTraits = { "DoorHealTrait" },
		RarityLevels = {
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,

			},
			Epic =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 2.0,
			}
		},
		CombatEncounterHealthPercentFloor =
		{
			BaseValue = 0.3,
			ReducedByMetaupgradeValue = "HealingReductionShrineUpgrade",
			IdenticalMultiplier =
			{
				DiminishingReturnsMultiplier = 0.4,
				Value = DuplicateMultiplier,
			},
		},
		ExtractValues =
		{
			{
				Key = "CombatEncounterHealthPercentFloor",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			},
			{
				ExtractAs = "HealingReduction",
				Format = "TotalMetaUpgradeChangeValue",
				MetaUpgradeName = "HealingReductionShrineUpgrade"
			}
		}
	},

	-- Demeter


	DemeterWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Melee",
		Icon = "Boon_Demeter_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeB-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrustProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearDashSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin2",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponSpin3",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowCharge-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeFast-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldSwipeDash-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "ShieldCharge-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3D-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3D-Out-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "FireFx",
				ChangeValue = "GunFire-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeaponDash",
				ProjectileProperty = "ImpactFx",
				ChangeValue = "GunWeaponImpact-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDemeter",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "FistWeaponDash",
				ProjectileProperty = "StartFx",
				ChangeValue = "FistFxSwipeDemeter",
				ChangeType = "Absolute",
			},

			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Demeter-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter-Flipped",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "StartFx",
				ChangeValue = "SwordSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowWeapon" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				TraitName = "FistDetonateTrait",
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				TraitName = "FistDetonateTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},			
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	DemeterSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Secondary",
		Icon = "Boon_Demeter_00",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.6,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "Graphic",
				ChangeValue = "SpearThrowProjectile-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-SplitShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShield-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDemeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearRushWeapon",
				ProjectileName = "SpearRushWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearRushTrailFx-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				ProjectileProperty = "Graphic",
				WeaponName = "ShieldThrow",
				ChangeValue = "ProjectileShieldAlt02-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt01-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				ProjectileProperty = "Graphic",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash", "ChaosShieldThrow" },
				ChangeValue = "ProjectileShieldAlt03-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDemeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDemeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "LuciferOrbAoE-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-SplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Demeter-SplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectionalDemeter_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				LegalUnits = { "GunBombUnit" },
				ThingProperty = "Graphic",
				ChangeValue = "LuciferBomb-Demeter",
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	DemeterRangedTrait =
	{
		Icon = "Boon_Demeter_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "DemeterRangedTrait_Tray",
        RequiredFalseTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.15,
			},
			Epic =
			{
				Multiplier = 1.30,
			},
			Heroic =
			{
				Multiplier = 1.45,
			}
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				CauseImpactReaction = false,
				ImpactReactionHitsOverride = 0,
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/Leftovers/SFX/AuraCharge",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},
					FireSounds =
					{
						{
							-- StoppedBy = { "SpeechFromCue" }
						},
					},

					ImpactSounds =
					{

					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Demeter",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 8,
				BaseMax = 8,
				MinMultiplier = 0.1,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ExtractValue =
				{
					SkipAutoExtract = true,
					ExtractAs = "TooltipInterval",
					DecimalPlaces = 1,
				}

			},
			-- Beowulf
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 400
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageMultiplier",
                ChangeValue = 10
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "MultiDetonate",
                ChangeValue = false
            },
            {
                TraitName = "ShieldLoadAmmoTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Demeter"
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			},
			{
				ExtractAs = "TooltipDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DemeterProjectile",
				BaseProperty = "TotalFuse",
			}
		}
	},

	DemeterRangedBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Icon = "Boon_Demeter_14",
		--RequiredFalseTraits = { "DemeterRangedBonusTrait" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DemeterRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 2,
				ChangeType = "Add",
				MinMultiplier = 0.5,
				IdenticalMultiplier =
				{
					Value = -0.5,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				}

			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},
	DemeterRushTrait =
	{
		Icon = "Boon_Demeter_03",
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Slot = "Rush",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterRushProjectile",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "DemeterIce",
				ProjectileProperty = "DamageLow",
				BaseMin = 15,
				BaseMax = 15,
				AsInt = true,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileName = "DemeterIce",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	DemeterShoutTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredTextLines = { "PoseidonWrathIntro01" },
		CustomTrayText = "DemeterShoutTrait_Tray",
		God = "Demeter",
		Slot = "Shout",
		Icon = "Boon_Demeter_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			}
		},
		AddShout =
		{
			FunctionName = "DemeterShout",
			MaxFunctionName = "DemeterMaxShout",
			Cost = 25,
			MaxDurationMultiplier = 2,
			SuperDuration = 5,
			IsBurst = true,
			ExtractValues =
			{
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndDemeter",
		PreEquipWeapons = { "DemeterSuper", "DemeterMaxSuper", },
		PropertyChanges =
		{
			{
				WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = { "DemeterSuper", "DemeterMaxSuper", },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ExtractValue =
				{
					ExtractAs = "TooltipInterval",
					SkipAutoExtract = true,
					DecimalPlaces = 2,
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	HealingPotencyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Icon = "Boon_Demeter_09",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.075,
			},
			Epic =
			{
				Multiplier = 1.150,
			},
			Heroic =
			{
				Multiplier = 1.225,
			}
		},
		TraitHealingBonus =
		{
			BaseValue = 1.3,
			SourceIsMultiplier = true,
			IdenticalMultiplier =
			{
				Value = DuplicateMultiplier,
			},
		},

		ExtractValues =
		{
			{
				Key = "TraitHealingBonus",
				ExtractAs = "TooltipHeal",
				Format = "HealingDrop",
				ConsumableName = "RoomRewardHealDrop",
			},
			{
				Key = "TraitHealingBonus",
				ExtractAs = "TooltipHealing",
				Format = "PercentDelta"
			},
			{
				ExtractAs = "HealingReduction",
				Format = "TotalMetaUpgradeChangeValue",
				MetaUpgradeName = "HealingReductionShrineUpgrade"
			},
		}
	},

	CastNovaTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_05",
		God = "Demeter",
		AddOnFireWeapons = { "DemeterAmmoWind" },
		LegalOnFireWeapons = WeaponSets.HeroNonPhysicalWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "DemeterAmmoWind",
				ProjectileProperty = "DamageLow",
				BaseMin = 40,
				BaseMax = 40,
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterAmmoWind",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	HarvestBoonTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_08",
		RequiredFalseTrait = "HarvestBoonTrait",
		RarityLevels = {
			Common =
			{
				Multiplier = 1,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
		},
		UpgradedTraitNum = { BaseValue = 1 },
		RoomsPerUpgrade = 3,
		CurrentRoom = 0,
		ExtractValues =
		{
			{
				Key = "UpgradedTraitNum",
				ExtractAs = "TooltipTraitNum",
			},
			{
				Key = "RoomsPerUpgrade",
				ExtractAs = "TooltipRoomInterval",
			}
		},

	},
	ZeroAmmoBonusTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Demeter",
		Icon = "Boon_Demeter_11",
		RequiredFalseTrait = "ZeroAmmoBonusTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			},
			Heroic =
			{
				Multiplier = 4,
			}
		},
		AddOutgoingDamageModifiers =
		{
			ZeroRangedWeaponAmmoMultiplier =
			{
				BaseValue = 1.1,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "ZeroRangedWeaponAmmoMultiplier",
					ExtractAs = "TooltipAttack",
					Format = "PercentDelta",
				},
			}
		},
		AddIncomingDamageModifiers =
		{
			ZeroRangedWeaponAmmoMultiplier = 0.9,
			ExtractValues =
			{
				{
					Key = "ZeroRangedWeaponAmmoMultiplier",
					ExtractAs = "TooltipDefense",
					Format = "NegativePercentDelta",
					SkipAutoExtract = true
				},
			}
		},
	},
	MaximumChillBlast =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_07",
		God = "Demeter",
		PreEquipWeapons = { "DemeterMaxChill" },
		RequiredFalseTrait = "MaximumChillBlast",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.125,
			},
			Epic =
			{
				Multiplier = 1.250,
			},
			Heroic =
			{
				Multiplier = 1.375,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "DemeterMaxChill",
				ProjectileProperty = "DamageLow",
				BaseMin = 80,
				BaseMax = 80,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterMaxChill",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		MaximumChillLevel = 10,
		ExtractValues =
		{
			{
				Key = "MaximumChillLevel",
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},
	MaximumChillBonusSlow =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Demeter_12",
		God = "Demeter",
		RequiredFalseTrait = "MaximumChillBonusSlow",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		SetupFunction =
		{
			Name = "TrackMaximumChillBlast",
			RunOnce = true,
		},
		PreEquipWeapons = { "DemeterWorldChill" },
		PropertyChanges =
		{

			{
				WeaponName = "DemeterWorldChill",
				EffectName = "DemeterWorldChill",
				EffectProperty = "ElapsedTimeMultiplier",
				BaseValue = 0.9,
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Multiply",
			},

			{
				WeaponName = "DemeterWorldChill",
				EffectName = "DemeterWorldChill",
				EffectProperty = "Amount",
				BaseValue = 20,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "DemeterWorldChill",
				EffectName = "DemeterWorldChill",
				EffectProperty = "Cooldown",
				BaseValue = 0.5,
				ExtractValue =
				{
					ExtractAs = "TooltipTickRate",
					DecimalPlaces = 1,
				},
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	DemeterRetaliateTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		AddOnHitWeapons = { "ChillRetaliate" },
		Icon = "Boon_Demeter_13",
		RetaliateChillStacks = 10,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChillRetaliate",
				ProjectileProperty = "DamageLow",
				BaseMin = 10,
				BaseMax = 10,
				IdenticalMultiplier =
				{
					Value = DuplicateVeryStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "ChillRetaliate",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				Key = "RetaliateChillStacks",
				ExtractAs = "TooltipStacks",
				SkipAutoExtract = true,
			},
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	InstantChillKill =
	{
		InheritFrom = { "ShopTier3Trait" },
		Icon = "Boon_Demeter_10",
		RequiredFalseTrait = "InstantChillKill",
		OnDamageEnemyFunction = {
			FunctionName = "CheckChillKill",
			FunctionArgs = {
				ChillDeathThreshold = 0.10,
				ExtractValues =
				{
					{
						Key = "ChillDeathThreshold",
						ExtractAs = "TooltipDeathThreshold",
						Format = "Percent",
					},
				}
			}
		},
		PreEquipWeapons = { "DemeterChillKill" },
		PropertyChanges =
		{
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				AsInt = true,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			{
				WeaponName = "DemeterChillKill",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},
	-- Hermes
	HermesShoutDodge =
	{
		OnSuperWeapons = { "HermesWrathBuff" },
		RequiredSlottedTrait = "Shout",
		Icon = "Boon_Hermes_12",
		RequiredFalseTraits = { "HermesShoutDodge" },
		RarityLevels = {
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.1,
			},
			Epic =
			{
				Multiplier = 1.2,
			},
			Heroic =
			{
				Multiplier = 1.3,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "SpeedBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.3,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					Format = "Percent"
				}
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "DodgeBonus",
				EffectProperty = "DodgeChance",
				BaseValue = 0.3,
				ChangeType = "Add",
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "SpeedBonus",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true
				}
			},
			{
				WeaponName = "HermesWrathBuff",
				EffectName = "DodgeBonus",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWrathStocks",
				Format = "ExistingWrathStocks",
				SkipAutoExtract = true
			}
		}
	},

	MagnetismTrait =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "MagnetismTrait",
		RequiredMetaUpgradeSelected = "AmmoMetaUpgrade",
		Icon = "Boon_Hermes_11",
		PropertyChanges =
		{
			{
				UnitProperty = "Magnetism",
				BaseValue = 100.0,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipMagnetism",
					Format = "PercentDelta"
				}
			},
			{
				UnitProperty = "MagnetismFx",
				ChangeValue = "HermesWings_Ammo",
			}
		},
	},

	BonusDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "BonusDashTrait",
		Icon = "Boon_Hermes_01",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2.00,
			},
			Epic =
			{
				Multiplier = 3.00,
			},
			Heroic =
			{
				Multiplier = 4.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipSize",
				BaseValue = 1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
		},
	},

	RapidRushTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "RapidRushTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2.00,
			},
			Epic =
			{
				Multiplier = 3.00,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDuration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenInterval",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			]]

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkMaxRange",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableMoveRapid",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

		},
	},

	DeathDefianceFreezeTimeTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "DeathDefianceFreezeTimeTrait",
		LastStandTimeScale = 0.1,
		LastStandTimeScaleDuration =
		{
			BaseValue = 5,
		},

		ExtractValues =
		{
			{
				Key = "LastStandTimeScaleDuration",
				ExtractAs = "TooltipDuration",
				DecimalPlaces = 2,
			},
		}
	},

	FreezeTimeDashTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "FreezeTimeDashTrait",
		WeaponDataOverride =
		{
			RushWeapon =
			{
				FireRadialBlur =
				{
					Strength = 0.3,
					Distance = 1.6,
					FXInTime = 0.06,
					FXHoldTime = 0.4,
					FXOutTime = 0.4,
				},
			},
		},
		DashProperties =
		{
			Duration =
			{
				BaseValue = 0.3,

			},
			ElapsedTimeMultiplier = 0.1,
			ExtractValues =
			{
				{
					Key = "Duration",
					DecimalPlaces = 2,
					ExtractAs = "TooltipTimeFreeze",
				},
			}
		},
	},

	CollisionTouchTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "CollisionTouchTrait",
		PreEquipWeapons = { "CollisionTouchWeapon" },
		Icon = "Boon_Hermes_03",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.5,
			},
			Heroic =
			{
				Multiplier = 1.75,
			}
		},
		PropertyChanges =
		{
			{
				UnitProperty = "ContinuousWeapon",
				ChangeValue = "CollisionTouchWeapon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "CollisionTouchWeapon",
				EffectName = "HermesSlow",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
				ChangeType = "Absolute"
			},
			{
				WeaponName = "CollisionTouchWeapon",
				EffectName = "HermesSlow",
				EffectProperty = "ElapsedTimeMultiplier",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
				ChangeType = "Absolute",
			},
			{
				UnitProperty = "CollideWithUnits",
				ChangeValue = false,
				ChangeType = "Absolute",
			}
		}
	},

	DodgeChanceTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "DodgeChanceTrait",
		Icon = "Boon_Hermes_04",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			},
			Heroic =
			{
				Multiplier = 2.5,
			}
		},
		PropertyChanges =
		{
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.10,
				ChangeType = "Add",
				DataValue = false,
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent"
				},
			},
		}
	},

	RapidCastTrait =
	{
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 0.75,
				MaxMultiplier = 0.75,
			},
			Epic =
			{
				MinMultiplier = 0.50,
				MaxMultiplier = 0.50,
			},
			Heroic =
			{
				MinMultiplier = 0.25,
				MaxMultiplier = 0.25,
			},
		},
		RequiredFalseTraits = { "RapidCastTrait", "BowLoadAmmoTrait", "ShieldLoadAmmoTrait" },
		RequiredMetaUpgradeSelected = "AmmoMetaUpgrade",
		Icon = "Boon_Hermes_02",
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 0.8,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedIncrease",
					Format = "NegativePercentDelta",
				},
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "SpeedMultiplier",
				BaseValue = 0.8,
				SourceIsNegativeMultiplier = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusRangedWeapon_FireRepeat",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "RangedDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Hermes",
				ChangeType = "Absolute",
			},
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				NotReadyAmmoPackText = "",
			},
		},
	},

	RushSpeedBoostTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_08",
		RequiredFalseTrait = "RushSpeedBoostTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.20,
			},
			Epic =
			{
				Multiplier = 1.40,
			},
			Heroic =
			{
				Multiplier = 1.80,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDodgeBoost",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushHyperArmor",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDodgeBoost",
				EffectProperty = "Duration",
				BaseValue = 0.6,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDodgeBoost",
				EffectProperty = "Modifier",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDodge",
					Format = "PercentDelta",
				},
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushHyperArmor",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "RushHyperArmor",
				EffectProperty = "Duration",
				BaseValue = 0.5,
				ChangeType = "Absolute",
			},
						{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Duration",
				BaseValue = 0.5,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				},
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSpeedBoost",
				EffectProperty = "Modifier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedBoost",
					Format = "PercentDelta",
				},
			},
		},
	},

	MoveSpeedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_05",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.08,
				MaxMultiplier = 1.08,
			},
			Epic =
			{
				MinMultiplier = 1.17,
				MaxMultiplier = 1.17,
			},
			Heroic =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
		},
		RequiredFalseTrait = "MoveSpeedTrait",
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseValue = 1.2,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	RushRallyTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_07",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.30,
				MaxMultiplier = 0.30,
			},
			Rare =
			{
				MinMultiplier = 0.40,
				MaxMultiplier = 0.40,
			},
			Epic =
			{
				MinMultiplier = 0.50,
				MaxMultiplier = 0.50,
			},
			Heroic =
			{
				MinMultiplier = 0.60,
				MaxMultiplier = 0.60,
			},
		},
		RequiredFalseTrait = "RushRallyTrait",
		PropertyChanges =
		{
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyActive",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyHealOnDash",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "HitsDrainRallyHealthMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "ConversionPercent",
				BaseValue = 1.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipHeal",
					Format = "Percent",
				}
			},
			{
				LuaTable = "RallyHealth",
				LuaProperty = "RallyDecayRateSeconds",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
			},
		}
	},

	HermesBonusProjectilesTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				TraitName = "HermesRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				}
			},
		}
	},

	HermesRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "HermesProjectile",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMin",
				ChangeValue = -0.087,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "ProjectileAngleOffsetMax",
				ChangeValue = 0.087,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 20,
				BaseMax = 40,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
	},

	HermesRushAreaSlow =
	{
		InheritFrom = { "ShopTier3Trait" },
		RequiredFalseTrait = "HermesRushAreaSlow",
		PreEquipWeapons = { "AreaSlowWeapon" },
		Icon = "Boon_Hermes_10",
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			--AudioFilter = "Pause",
			--ColorGrade = "TimeStop",
			--ColorGradeStartDuration = 0.1,
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx2",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushAreaSlowWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushAreaSlowWeapon",
				EffectProperty = "Duration",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExtractAs =
				{
					Key = "TooltipDuration",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushAreaSlowWeapon",
				EffectProperty = "ElapsedTimeMultiplier",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExtractAs =
				{
					Key = "TooltipDuration",
				}
			},
		},
	},

	HermesPlannedRushTrait =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "HermesPlannedRushTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.7,
				MaxMultiplier = 0.7,
			},
			Rare =
			{
				MinMultiplier = 0.6,
				MaxMultiplier = 0.6,
			},
			Epic =
			{
				MinMultiplier = 0.5,
				MaxMultiplier = 0.5,
			},
		},
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			AudioFilter = "Pause",
			ColorGrade = "TimeStop",
			ColorGradeStartDuration = 0.1,
			--[[
			ElapsedTimeMultiplier =
			{
				BaseValue = 0.25,
			},
			ExtractValues =
			{
				{
					Key = "ElapsedTimeMultiplier",
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
			}
			]]
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				BaseValue = 0.05,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				BaseValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkMaxRange",
				BaseValue = 1.5,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceMaxChargeRelease",
				BaseValue = true,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusDashFrame",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine_HermesPlannedRushTrait",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "AreaSlowWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			--[[
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "AreaSlowWeapon",
				ChangeType = "Absolute",
			},
			]]
		},
	},

	HermesPlannedRushTrait2 =
	{
		Icon = "Boon_Athena_03",
		InheritFrom = { "ShopTier1Trait" },
		RequiredFalseTrait = "HermesPlannedRushTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 0.7,
				MaxMultiplier = 0.7,
			},
			Rare =
			{
				MinMultiplier = 0.6,
				MaxMultiplier = 0.6,
			},
			Epic =
			{
				MinMultiplier = 0.5,
				MaxMultiplier = 0.5,
			},
		},
		DashChargeProperties =
		{
			StartCue = "/SFX/Player Sounds/HermesWhooshDash",
			EndCue = "/SFX/Player Sounds/HermesWhooshDashReverse",
			AudioFilter = "Pause",
			ColorGrade = "TimeStop",
			ColorGradeStartDuration = 0.1,
			ElapsedTimeMultiplier =
			{
				BaseValue = 0.25,
			},
			ExtractValues =
			{
				{
					Key = "ElapsedTimeMultiplier",
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeTime",
				BaseValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "HermesRushSpeedLight",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusStop",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine_HermesPlannedRushTrait",
				ChangeType = "Absolute",
			},
		},
	},


	HermesWeaponTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_06",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.280,
				MaxMultiplier = 1.280,
			},
			Rare =
			{
				MinMultiplier = 1.140,
				MaxMultiplier = 1.140,
			},
			Epic =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Heroic =
			{
				MinMultiplier = 0.860,
				MaxMultiplier = 0.860,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineA",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponNames = { "SwordWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Sword3_Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthurCancellable2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},




			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				EffectName = "SpearDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				EffectName = "SpearDisableCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineC_Spear",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				EffectName = "ShieldDisableAttack",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesSwipeLineB_Shield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_ShieldRush",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesBowTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon" },
				ProjectileProperty = "Fuse",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesGunTrail",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistDisableAndLockTrigger3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistChargeDisableAndLockTrigger3",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistDisableAndLockTrigger4",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				EffectName = "FistDisableAndLockTrigger5",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
		ExtractEntry =
		{
			BaseValue = 0.70,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		}
	},
	
	HermesSecondaryTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.280,
				MaxMultiplier = 1.280,
			},
			Rare =
			{
				MinMultiplier = 1.140,
				MaxMultiplier = 1.140,
			},
			Epic =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Heroic =
			{
				MinMultiplier = 0.860,
				MaxMultiplier = 0.860,
			},
		},
		RequiredFalseTraits = { "SwordSecondaryBlinkTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DislodgeAmmoTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02ParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordCriticalParryTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01ParryChargeFast",
				ChangeType = "Absolute",
			},
			{
				TraitName = "SwordConsecrationTrait",
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt03ParryCharge", -- this is different from the others on purpose
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryDisableFastCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "CooldownWeaponSlotThree",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_SwordParry",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn" },
				ProjectileProperty = "Speed",
				BaseValue = 1.3,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponName = "SpearWeaponThrow",
				EffectName = "SpearThrowDisableCancelable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				EffectName = "SpearThrowReturnDisable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SpearWeaponThrowReturn",
				ProjectileProperty = "StartFx2",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},


			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "DisableOwnerForDuration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Speed",
				BaseValue = 1.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Acceleration",
				BaseValue = 2.1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "HermesShieldTrail",
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileProperty = "StartFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "CooldownWeaponSlotThree",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_Bow",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ReloadTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			-- this is for GunGrenadeFastTrait
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipRegenInterval",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "StartFx2",
				ChangeValue = "HermesWings_GunGrenade",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "FistWeaponSpecial",
				EffectName = "FistSpecialDisableCancelable",
				EffectProperty = "Duration",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},

			--[[
			{
				WeaponName = "FistWeaponSpecialDash",
				WeaponProperty = "ChargeTime",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "FistWeaponSpecialDash",
				WeaponProperty = "Cooldown",
				BaseValue = 0.7,
				ChangeType = "Multiply",
			},
			]]

		},
		ExtractEntry =
		{
			BaseValue = 0.7,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeedIncrease",
			},
		},
	},

	RegeneratingSuperTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_13",
		RequiredFalseTraits = { "RegeneratingSuperTrait", "HadesShoutTrait" },
		RequiredSlottedTrait = "Shout",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Rare =
			{
				MinMultiplier = 3/4,
				MaxMultiplier = 3/4,
			},
			Epic =
			{
				MinMultiplier = 2/4,
				MaxMultiplier = 2/4,
			},
			Heroic =
			{
				MinMultiplier = 1/4,
				MaxMultiplier = 1/4,
			},
		},
		RequiredFalseTraits = { "RegeneratingSuperTrait" },
		SetupFunction =
		{
			Name = "SetUpSuperRegeneration",
			Args =
			{
				Amount = 1,
				Interval = { BaseValue = 2 },
				ExtractValues =
				{
					{
						Key = "Amount",
						ExtractAs = "TooltipSuperAmount"
					},
					{
						Key = "Interval",
						ExtractAs = "TooltipInterval",
						DecimalPlaces = 2,
					},
				}
			},
		},
	},

	ChamberGoldTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_14",
		RequiredFalseTraits = { "ChamberGoldTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.3,
				MaxMultiplier = 1.3,
			},
			Epic =
			{
				MinMultiplier = 1.6,
				MaxMultiplier = 1.6,
			},
			Heroic =
			{
				MinMultiplier = 1.9,
				MaxMultiplier = 1.9,
			},
		},
		MoneyPerRoom = { BaseValue = 10 }
	},

	SpeedDamageTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		Icon = "Boon_Hermes_15",
		RequiredFalseTraits = { "SpeedDamageTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
		},
		AddOutgoingDamageModifiers =
		{
			SpeedDamageMultiplier =
			{
				BaseValue = 0.5,
			},
			ExtractValues =
			{
				{
					Key = "SpeedDamageMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "Percent",
				},
			}
		}
	},

	MoneyMultiplierTrait =
	{
		MoneyMultiplier = 2.0,
		RemainingUses = 3,
		UsesAsEncounters = true,
	},

	-- Shop Traits --

	ImprovedWeaponTrait =
	{
		Cost = 100,
		CostIncreasePerStack = 500,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				ChangeValue="1.2",
				ChangeType="MultiplyBase",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				ChangeValue="1.2",
				ChangeType="MultiplyBase",
			}
		}
	},

	ReducedCooldownTrait =
	{
		Cost = 100,
		CostIncreasePerStack = 500,
		MaxAmount = 1,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				WeaponProperty = "CooldownWeaponSlotThree",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipCooldownReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
			},
		}
	},

	-- Gift Traits
	LifeOnUrnTrait=
	{
		Icon = "Keepsake_Duster",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "LifeOnUrnTrait_Rack",
		DropOnKill = {
			Chance = { BaseValue = 0.03} ,
			DropCap = 1,
			Name = "HealDropMinor",
			ValidEnemies = { "Breakable" },
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "DusaSignoff",
		  },
		  {
			RequiredTextLines = { "BecameCloseWithDusa01" },
			Text = "DusaSignoff_Max"
		  }
		},
	},

	ShopDurationTrait =
	{
		Icon = "Keepsake_Hourglass",
		EquipSound = "/SFX/Menu Sounds/KeepsakeCharonBoneHourglass",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ShopDurationTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 2.00,
			}
		},
		TraitDurationIncrease =
		{
			ValidTraits = {
			"TemporaryImprovedWeaponTrait",
			"TemporaryImprovedRangedTrait",
			"TemporaryWeaponLifeOnKillTrait",
			"TemporaryMoreAmmoTrait",
			"TemporaryBonusDamageTrait",
			"TemporaryMoveSpeedTrait",
			"TemporaryDoorHealTrait",
			"TemporaryLastStandHealTrait",
			"TemporaryImprovedSecondaryTrait",
			"TemporaryImprovedTrapDamageTrait",
			"TemporaryBackstabTrait",
			"TemporaryAlphaStrikeTrait",
			"TemporaryArmorDamageTrait",
			"TemporaryPreloadSuperGenerationTrait",
			"TemporaryBlockCrusherEnemiesTrait",
			"TemporaryBlockExplodingChariotsTrait",
			"RandomKeepsake",
			},
			Amount = { BaseValue = 4 },
			ExtractValues =
			{
				{
					Key = "Amount",
					ExtractAs = "TooltipDurationBonus",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "CharonSignoff",
		  },
		  {
			RequiredTextLines = { "CharonGift07" },
			Text = "CharonSignoff_Max"
		  }
		},
	},


	ReincarnationTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ReincarnationTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		Icon = "Keepsake_Skelly_Tooth",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyTooth",
		KeepsakeLastStandHealAmount = { BaseValue = 50 },
		ExtractValues =
		{
			{
				Key = "KeepsakeLastStandHealAmount",
				ExtractAs = "TooltipLastStandHealth",
			},
		},
		SignOffData =
		{
		  {
			Text = "SkellySignoff",
		  },
		  {
			RequiredTextLines = { "SkellyGift09" },
			Text = "SkellySignoff_Max"
		  }
		},
	},

	FuryAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "FuryAssistTrait_Rack",
		InRackIcon = "Keepsake_Meg_Plush_Menu",
		Icon = "Keepsake_Meg_Plush",

		EquipSound = "/SFX/Menu Sounds/KeepsakeMegLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "FuryAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			WeaponName = "NPC_FurySister_01_Assist",
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				RequiredFalseRooms = { "A_Boss01", "A_Boss02", "A_Boss03" },
				},
			AssistPresentationPortrait = "Portrait_FurySister01_Default_01",
			AssistPresentationPortraitOffsetY = 55,
			AssistPresentationColor = { 200, 0, 255, 255 },
			AssistPostWeaponSlowDuration = 0.1,
		},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_FurySister_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 2500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NPC_FurySister_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadBinks =
		{
			"Enemy_MegaeraMultiFurySkyDive_Bink",
		},
		SignOffData =
		{
		  {
			Text = "MegaeraSignoff",
		  },
		  {
			RequiredAnyTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
			RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_BackOff", "BecameCloseWithMegaera01_BMeg_BackOff" },
			Text = "MegaeraSignoff_AssistMax_A"
		  },
		  {
		  	RequiredTextLines = { "MegaeraGift10" },
			RequiredFalseTextLines = { "BecameCloseWithMegaera01Meg_GoToHer", "BecameCloseWithMegaera01_BMeg_GoToHer" },
			Text = "MegaeraSignoff_AssistMax_B"
		  }
		},
	},

	AchillesPatroclusAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "AchillesPatroclusAssistTrait_Rack",
		InRackIcon = "Keepsake_Achilles_Plush_Menu",
		Icon = "Keepsake_Achilles_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAchillesLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "AchillesPatroclusAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "AchillesPatroclusAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "AchillesPatroclusAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "AchillesPatroclusAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "AchillesPatroclusAssistTrait",
					Level = 4,
				}
			},
		},
		LoadPackages = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist"},
		PreEquipWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
		AddAssist =
		{
			FunctionName = "AchillesPatroclusAssist",
			AssistWeapons = { "NPC_Achilles_01_Assist", "NPC_Patroclus_01_Assist" },
			Range = 1500,
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				 },
			AssistPresentationPortrait = "Portrait_MaleGhost_Default_01",
			AssistPresentationPortraitOffsetX = 3,
			AssistPresentationPortraitOffsetY = 145,
			AssistPresentationPortrait2 = "Portrait_Patroclus_Neutral_01",
			AssistPresentationColor = { 140, 255, 200, 255 },
			AssistPostWeaponSlowDuration = 0.05,
		},
		PropertyChanges =
		{
			{
				WeaponName = "NPC_Achilles_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 1500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NPC_Achilles_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},

			{
				WeaponName = "NPC_Patroclus_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 1500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NPC_Patroclus_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData =
		{
		  {
			Text = "AchillesPatroclusSignoff",
		  },
		  {
			RequiredTextLines = { "AchillesGift09_A", "PatroclusGift08_A" },
			Text = "AchillesPatroclusSignoff_AssistMax"
		  }
		},
	},

	ThanatosAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "ThanatosAssistTrait_Rack",
		InRackIcon = "Keepsake_Thanatos_Plush_Menu",
		Icon = "Keepsake_Thanatos_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "ThanatosAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			WeaponName = "NPC_Thanatos_01_Assist",
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				RequiredFalseEncounters = { "ThanatosTartarus", "ThanatosAsphodel", "ThanatosElysium", "ThanatosElysiumIntro" }
				 },
			AssistPresentationPortrait = "Portrait_Thanatos_Default_01",
			AssistPresentationColor = { 200, 0, 255, 255 },
		},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_Thanatos_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 3500,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NPC_Thanatos_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadBinks =
		{
			"ThanatosAttackHold_Bink",
		},
		SignOffData =
		{
		  {
			Text = "ThanatosSignoff",
		  },
		  {
			RequiredAnyTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
			RequiredFalseTextLines = { "BecameCloseWithThanatos01Than_BackOff", "BecameCloseWithThanatos01_BThan_BackOff" },
			Text = "ThanatosSignoff_AssistMax_A"
		  },
		  {
		  	RequiredTextLines = { "ThanatosGift10" },
			RequiredFalseTextLines = { "BecameCloseWithThanatos01Than_GoToHim", "BecameCloseWithThanatos01_BThan_GoToHim" },
			Text = "ThanatosSignoff_AssistMax_B"
		  }
		},
	},

	SisyphusAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SisyphusAssistTrait_Rack",
		InRackIcon = "Keepsake_Sisiyphus_Plush_Menu",
		Icon = "Keepsake_Sisiyphus_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "SisyphusAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "SisyphusLootSprinkle",
			SisyphusWeapon = "NPC_Sisyphus_01_Assist",
			LootOptions =
			{
				{
					Name = "MinorMoneyDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
				{
					Name = "HealDropMinor",
					MinAmount = 4,
					MaxAmount = 4,
				},
				{
					Name = "RoomRewardMetaPointDrop",
					MinAmount = 1,
					MaxAmount = 1,
				},
			},
			Range = 80,
			MinForce = 200,
			MaxForce = 350,
			GameStateRequirements = {},
			AssistPresentationPortrait = "Portrait_Sisyphus_Default_01",
			AssistPresentationColor = { 110, 255, 0, 255 },
		},
		PreEquipWeapons = {"NPC_Sisyphus_01_Assist"},
		PropertyChanges =
		{

			{
				WeaponName = "NPC_Sisyphus_01_Assist",
				ProjectileProperty = "DamageLow",
				ChangeValue = 1000,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "NPC_Sisyphus_01_Assist",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		},
		RemainingUses = { BaseValue = 1 },
		LoadPackages = "NPC_Sisyphus_01_Assist",
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		SignOffData =
		{
		  {
			Text = "SisyphusBouldySignoff",
		  },
		  {
			RequiredTextLines = { "SisyphusGift09_A" },
			Text = "SisyphusBouldySignoff_AssistMax"
		  }
		},
	},

	SkellyAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "SkellyAssistTrait_Rack",
		InRackIcon = "Keepsake_Skelly_Plush_Menu",
		Icon = "Keepsake_Skelly_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "SkellyAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "SkellyAssist",
			GameStateRequirements = {
				RequiredFalseRooms = { "CharonFight01" }
				 },
			AssistPresentationPortrait = "Portrait_Skelly_Default_01",
			AssistPresentationColor = { 96, 64, 255, 255 },
		},
		RemainingUses = { BaseValue = 1 },
		ExtractHealth = 250,
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
			{
				Key = "ExtractHealth",
				ExtractAs = "TooltipHealth",
			},
		},
		LoadBinks =
		{
			"SkellyAssistTrait_Bink",
			"Enemy_Skeleton_OnHit_Bink",
			"Enemy_Skeleton_Dead_Bink",
			"Enemy_Skeleton_Idle_Bink",
		},
		SignOffData =
		{
		  {
			Text = "SkellySignoff",
		  },
		  {
			RequiredTextLines = { "SkellyGift09" },
			Text = "SkellySignoff_AssistMax"
		  }
		},

	},

	DusaAssistTrait =
	{
		InheritFrom = { "AssistTrait" },
		InRackTitle = "DusaAssistTrait_Rack",
		InRackIcon = "Keepsake_Dusa_Plush_Menu",
		Icon = "Keepsake_Dusa_Plush",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDusaLegendary",
		KeepsakeRarityGameStateRequirements =
		{
			[1] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 0,
				}
			},
			[2] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 1,
				}
			},
			[3] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 2,
				}
			},
			[4] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 3,
				}
			},
			[5] = {
				AssistUpgradeLevel =
				{
					Name = "DusaAssistTrait",
					Level = 4,
				}
			},
		},
		AddAssist =
		{
			FunctionName = "DusaAssist",
			Duration = 30,
			ExtractValues =
			{
				{
					Key = "Duration",
					ExtractAs = "TooltipDuration",
				},
			},
			GameStateRequirements = {
				CurrentRoomValueFalse = "BlockHadesAssistTraits",
				RequiredFalseFlags = { "DusaFiredFromJob", "DusaNotYetReHired" },
				 },
			AssistPresentationPortrait = "Portrait_Dusa_Confident_01",
			AssistPresentationColor = { 255, 50, 240, 255 },
		},
		RemainingUses = { BaseValue = 1 },
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipKeepsakeUses",
			},
		},
		LoadPackages = "DusaSummon",
		Binks =
		{
			"NPC_DusaIdle_Bink",
			"NPC_DusaIdleWorking_Bink",
		},
		SignOffData =
		{
		  {
			Text = "DusaSignoff",
		  },
		  {
			RequiredTextLines = { "BecameCloseWithDusa01" },
			Text = "DusaSignoff_AssistMax"
		  }
		},
	},


	HeroicStandTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "HeroicStandTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		Icon = "Keepsake_Skelly_Tooth",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSkellyTooth",
		LastStandWeapon = "LastStandReincarnateShield",
		CurrentCooldown = 1,
		RoomCooldown = 1,
		LastStandTimer =
		{
			BaseValue = 5
		},
		PropertyChanges =
		{
			{
				LuaProperty = "LastStandHealth",
				BaseValue = 1,
				ChangeType = "Absolute",
			},
		},
		ExtractValues =
		{
			{
				Key = "LastStandTimer",
				ExtractAs = "TooltipLastStandTimer",
			},
		}
	},

	ShieldAfterHitTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ShieldAfterHitTrait_Rack",
		Icon = "Keepsake_Spear",
		EquipSound = "/Leftovers/Menu Sounds/TalismanMetalClankDown",
		AddOnHitWeapons = { "ShieldBarrier" },
		OnHitWeaponProperties = { IgnoreAutomatic = true },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldBarrier",
				EffectName = "MagicShieldWeaponInvincible",
				EffectProperty = "Duration",
				BaseValue = 1.0,
				ChangeType = "Absolute",
				DeriveSource = "DurationSource",
				ExtractValue =
				{
					ExtractAs = "ShieldDuration",
					DecimalPlaces = 2,
				}
			},

		},
		SignOffData =
		{
		  {
			Text = "PatroclusSignoff",
		  },
		  {
			RequiredTextLines = { "PatroclusGift08_A" },
			Text = "PatroclusSignoff_Max"
		  }
		},
	},
	
	HadesShoutKeepsake = 
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "HadesShoutKeepsake_Rack",
		Icon = "Keepsake_Badge",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHadesSigil",
		
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 2,
			},
			Epic =
			{
				Multiplier = 3,
			}
		},
		SetupFunction =
		{
			Name = "SetupHadesShout",
			Args =  { TraitName = "HadesShoutTrait", KeepsakeTraitName = "HadesShoutKeepsake" },
			RunOnce = true
		},		
		
		SignOffData =
		{
		  {
			Text = "HadesSignoff",
		  },
		  {
			RequiredTextLines = { "HadesGift05" },
			Text = "Hades_SignoffMax"
		  }
		},
		BaseDuration = 2,
		DamageBonus = { BaseValue = 1.5, SourceIsMultiplier = true},
		StartingSuperAmount = {BaseValue = 10 },
		ExtractValues = 
		{
			{
				Key = "DamageBonus",
				ExtractAs = "TooltipBonus",
				Format = "PercentDelta"
			},
			{
				Key = "BaseDuration",
				ExtractAs = "TooltipDuration",
			},
			{
				Key = "StartingSuperAmount",
				ExtractAs = "TooltipSuperGain",
			}
		}
	},

	HadesShoutTrait = 
	{	
		Icon = "Boon_Hades_01",
		InheritFrom = { "ShopTier1Trait" },
		CustomTrayText = "HadesShoutTrait_Tray",
		Slot = "Shout",
		God = "Hades",
		ProcEmote = "/VO/ZagreusEmotes/EmoteDarkness",
		RequiredFalseTrait = "HadesShoutTrait",
		LoadPackages = "HadesUpgrade",
		PreEquipWeapons = { "HadesShoutWeapon", "HadesBreakStealthBuff" },
		SuperActivatedVoiceLines = HeroVoiceLines.SuperActivatedVoiceLines,
		FullSuperActivatedVoiceLines = HeroVoiceLines.FullSuperActivatedVoiceLines,		
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			RequiredEffects = { "HadesShieldShoutInvincible" },
			RequiredSelfEffectsMultiplier =
			{
				BaseValue = 1.5,
				SourceIsMultiplier = true,
			},
		},
		AddShout =
		{
			FunctionName = "HadesShout",
			MaxFunctionName = "HadesShoutMax",
			Cost = 25,
			SuperDuration = 2,
			MaxDurationMultiplier = 2.5,
			
			ExtractValues =
			{
				{
					Key = "SuperDuration",
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				},
				{
					Key = "Cost",
					ExtractAs = "TooltipWrathStocks",
					Format = "WrathStocks",
					SkipAutoExtract = true
				},
				{
					Key = "MaxDurationMultiplier",
					ExtractAs = "TooltipDuration",
					Format = "EXWrathDuration",
					DecimalPlaces = 2,
					SkipAutoExtract = true
				}
			}
		},
		EndShout = "EndHadesShout",
		BreakStealthDamage = { BaseValue = 0.5 },
		PropertyChanges =
		{
			{
				WeaponName = "HadesShoutWeapon",
				EffectName = "HadesShieldShoutSpeed",
				EffectProperty = "Modifier",
				ChangeValue = 0.5,
				ChangeType = "Add",
			},
			{
				WeaponName = "HadesBreakStealthBuff",
				EffectName = "HadesBreakStealthBuff",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true,
				},
			},
			{
				WeaponName = "HadesBreakStealthBuff",
				EffectName = "HadesBreakStealthBuff",
				EffectProperty = "Modifier",
				BaseValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBonus",
					SkipAutoExtract = true,
					Format = "Percent",
				},
			},
		},
	},


	ChamberStackTrait =
	{
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ChamberStackTrait_Rack",
		Icon = "Keepsake_Bloom",
		EquipSound = "/SFX/Menu Sounds/KeepsakePersephonePomBlossom",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 3/6,
			},
			Epic =
			{
				Multiplier = 1/6,
			}
		},
		RoomsPerUpgrade = 
		{ 
			BaseValue = 6, 
			AsInt = true,
		},
		ExtractValues = 
		{
			{
				Key = "RoomsPerUpgrade",
				ExtractAs = "TooltipRoomInterval"
			}
		},
		SignOffData =
		{
		  {
			Text = "PersephoneSignoff",
		  },
		  {
			RequiredTextLines = { "PersephoneGift09" },
			Text = "Persephone_SignoffMax"
		  }
		},
	},

	DarknessRoomTrait =
	{
		InheritFrom = { "GiftTrait" },
		DarknessPerRoom = {
			Base = 1,
			DepthMult = 0,
		}
	},

	DiscountTrait =
	{
		Icon = "Membership_Card",
		StoreCostMultiplier = 0.8,
		ExtractValues =
		{
			{
				Key = "StoreCostMultiplier",
				ExtractAs = "TooltipDiscount",
				Format = "NegativePercentDelta",
			}
		}
	},

	AlphaStrikeTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "TargetHighHealthDamageOutputMultiplier",
				ChangeValue = 1.5,
				ChangeType = "Add",
			},
			{
				LuaProperty = "TargetHighHealthThreshold",
				ChangeValue = 0.8,
				ChangeType = "Absolute",
			},
		},
	},

	DirectionalArmorTrait =
	{
		Icon = "Keepsake_Bracer",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAchillesBracer",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "DirectionalArmorTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 2.0,
			},
			Rare =
			{
				Multiplier = 2.5,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		AddIncomingDamageModifiers =
		{
			HitVulnerabilityMultiplier = 1.1,
			HitArmorMultiplier =
			{
				BaseValue = 0.9,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "HitArmorMultiplier",
					ExtractAs = "TooltipDefense",
					Format = "NegativePercentDelta",
				},
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipVulnerability",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				LifeProperty = "ArmorCoverage",
				ChangeValue = math.rad(200) ,
				ChangeType = "Absolute",
				DataValue = false,
			},
		},
		SignOffData =
		{
		  {
			Text = "AchillesSignoff",
		  },
		  {
			RequiredTextLines = { "AchillesGift09_A" },
			Text = "AchillesSignoff_Max"
		  }
		},
	},

	LowHealthDamageTrait =
	{
		Icon = "Keepsake_Earring",
		EquipSound = "/SFX/Menu Sounds/KeepsakeMegSkullEarring",
		ProcSound = "/Leftovers/SFX/PositiveTalismanProc_2",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "LowHealthDamageTrait_Rack",
		LowHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "LowHealthThreshold"
			Threshold = 0.3,
			Text = "Hint_LowHealthDamageTrait",
		},
		AddOutgoingDamageModifiers =
		{
			LowHealthThreshold = 0.3,
			LowHealthDamageOutputMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "LowHealthDamageOutputMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
				{
					Key = "LowHealthThreshold",
					ExtractAs = "TooltipThreshold",
					Format = "Percent",
				},
			}
		},
		SignOffData =
		{
		  {
			Text = "MegaeraSignoff",
		  },
		  {
			RequiredTextLines = { "MegaeraGift10" },
			Text = "MegaeraSignoff_Max"
		  }
		},
	},
	FastClearDodgeBonusTrait =
	{
		Icon = "Keepsake_Feather",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHermesFastClear",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "FastClearDodgeBonusTrait_Rack",
		UnequippedKeepsakeTitle = "FastClearDodgeBonusTrait_Dead",
		CustomTrayNameWhileDead = "FastClearDodgeBonusTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.1,

			},
			Epic =
			{
				Multiplier = 1.2,
			}
		},
		FastClearThreshold = 30,
		FastClearDodgeBonus =
		{
			BaseValue = 0.01,
			DecimalPlaces = 4,
		},
		FastClearSpeedBonus =
		{
			BaseValue = 0.01,
			DecimalPlaces = 4,
		},
		AccumulatedDodgeBonus = 0,
		ExtractValues =
		{
			{
				Key = "FastClearDodgeBonus",
				ExtractAs = "TooltipFastClearDodgeBonus",
				Format = "Percent",
				DecimalPlaces = 2,
			},
			{
				Key = "AccumulatedDodgeBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "Percent",
				DecimalPlaces = 2,
			},
		},
		SignOffData =
		{
		  {
			Text = "HermesSignoff",
		  },
		  {
			RequiredTextLines = { "HermesGift08" },
			Text = "HermesSignoff_Max"
		  }
		},

	},
	PerfectClearDamageBonusTrait =
	{
		Icon = "Keepsake_Butterfly",
		EquipSound = "/SFX/Menu Sounds/KeepsakeThanatosButterflyBell",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "PerfectClearDamageBonusTrait_Rack",
		UnequippedKeepsakeTitle = "PerfectClearDamageBonusTrait_Dead",
		CustomTrayNameWhileDead = "PerfectClearDamageBonusTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,

			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		PerfectClearDamageBonus =
		{
			BaseValue = 1.01,
			SourceIsMultiplier = true,
			DecimalPlaces = 3,
		},
		AddOutgoingDamageModifiers =
		{
			UseTraitValue = "AccumulatedDamageBonus",
		},
		AccumulatedDamageBonus = 1,
		ExtractValues =
		{
			{
				Key = "PerfectClearDamageBonus",
				ExtractAs = "TooltipPerfectClearBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
			{
				Key = "AccumulatedDamageBonus",
				ExtractAs = "TooltipAccumulatedBonus",
				Format = "PercentDelta",
				DecimalPlaces = 1,
			},
		},
		SignOffData =
		{
		  {
			Text = "ThanatosSignoff",
		  },
		  {
			RequiredTextLines = { "ThanatosGift10" },
			Text = "ThanatosSignoff_Max"
		  }
		},
	},

	PerfectClearHealthBonusTrait =
	{
		Icon = "Keepsake_Shackle",
		InheritFrom = { "GiftTrait" },
		HealthBonus = { BaseValue = 1 },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,

			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		ExtractValues =
		{
			{
				Key = "HealthBonus",
				ExtractAs = "TooltipHealthBonus",
			}
		}
	},

	LowHealthDefenseTrait =
	{
		Icon = "Boon_Dionysus_12",
		InheritFrom = { "ShopTier1Trait" },
		God = "Dionysus",
		PriorityDisplay = true,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,

			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
		},
		LowHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "LowHealthThreshold"
			Threshold = 0.4,
			Text = "Hint_LowHealthDefenseTrait",
		},
		AddIncomingDamageModifiers =
		{
			LowHealthThreshold = 0.4,
			LowHealthDamageTakenMultiplier =
			{
				BaseValue = 0.9,
				MinMultiplier = 0.2,
				IdenticalMultiplier =
				{
					Value = -0.5,
				},
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "LowHealthDamageTakenMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "NegativePercentDelta",
				},
				{
					Key = "LowHealthThreshold",
					ExtractAs = "TooltipThreshold",
					Format = "Percent",
					SkipAutoExtract = true
				},
			}
		}
	},
	NoCollisionTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				UnitProperty = "CollideWithUnits",
				ChangeValue = false,
				ChangeType = "Absolute",
			}
		},
		PermanentNoUnitCollision = true,
	},

	MetaPointHealTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MetaPointHealTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		MetaPointHealMultiplier = { BaseValue = 0.5 },
		ExtractValues =
		{
			{
				Key = "MetaPointHealMultiplier",
				ExtractAs = "TooltipHealConversion",
				Format = "Percent",
			}
		}
	},

	BackstabAlphaStrikeTrait =
	{
		Icon = "Keepsake_Shawl",
		EquipSound = "/SFX/Menu Sounds/KeepsakeNyxShawl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "BackstabAlphaStrikeTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			HitMaxHealthMultiplier = {
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			HitVulnerabilityMultiplier = {
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "HitMaxHealthMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		},
		SignOffData =
		{
		  {
			Text = "NyxSignoff",
		  },
		  {
			RequiredTextLines = { "NyxGift09" },
			Text = "NyxSignoff_Max"
		  }
		},
	},

	ShieldBossTrait =
	{
		Icon = "Keepsake_Acorn",
		EquipSound = "/SFX/Menu Sounds/KeepsakeEurydiceAcorn",
		InRackTitle = "ShieldBossTrait_Rack",
		InheritFrom = { "GiftTrait" },
		PreEquipWeapons = { "EurydiceDefenseApplicator" },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 3,
			},
			Rare =
			{
				Multiplier = 4,
			},
			Epic =
			{
				Multiplier = 5,
			}
		},
		BossEncounterShieldHits = { BaseValue = 1 },

		ExtractValues =
		{
			{
				Key = "BossEncounterShieldHits",
				ExtractAs = "TooltipHits",
			},
		},
		SignOffData =
		{
		  {
			Text = "EurydiceSignoff",
		  },
		  {
			RequiredTextLines = { "EurydiceGift08" },
			Text = "EurydiceSignoff_Max"
		  }
		},
	},

	VanillaTrait =
	{

		Icon = "Keepsake_Shackle",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusShackle",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "VanillaTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			EmptySlotMultiplier = {
				BaseValue = 1.4,
				SourceIsMultiplier = true,
			},
			EmptySlotValidData =
			{
				Ranged = WeaponSets.HeroNonPhysicalWeapons,
				Melee = WeaponSets.HeroPhysicalWeapons,
				Secondary = WeaponSets.HeroSecondaryWeapons,
			},
			ExtractValues =
			{
				{
					Key = "EmptySlotMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
			}
		},
		SignOffData =
		{
		  {
			Text = "SisyphusSignoff",
		  },
		  {
			RequiredTextLines = { "SisyphusGift09_A" },
			Text = "SisyphusSignoff_Max"
		  }
		},
	},

	MegaRubbleTrait =
	{
		Icon = "Keepsake_Shackle",
		EquipSound = "/SFX/Menu Sounds/KeepsakeSisyphusShackle",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MegaRubbleTrait_Rack",
		PreEquipWeapons = WeaponSets.RubbleWeapons,
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageLow",
				BaseValue = 3,
				ChangeType="MultiplyBase",
			},
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			}
		},
		EnemyIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseValue = 3.0,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	DistanceDamageTrait =
	{
		Icon = "Keepsake_Memory",
		EquipSound = "/SFX/Menu Sounds/KeepsakeOrpheysDistantMemoryJar",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "DistanceDamageTrait_Rack",

		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 2.0,
			},
			Epic =
			{
				Multiplier = 3.0,
			}
		},
		AddOutgoingDamageModifiers =
		{
			DistanceThreshold = 500,
			DistanceMultiplier =
			{
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		SignOffData =
		{
		  {
			Text = "OrpheusSignoff",
		  },
		  {
			RequiredTextLines = { "OrpheusGift08" },
			Text = "OrpheusSignoff_Max"
		  }
		},
	},

	BloodAmmoTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "UseHealthForAmmo",
				ChangeValue = 5,
				ChangeType = "Add",
			},
		},
	},

	MaxHealthKeepsakeTrait =
	{
		Icon = "Keepsake_Collar",
		EquipSound = "/SFX/Menu Sounds/KeepsakeCerberusCollar",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "MaxHealthKeepsakeTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.5,
			},
			Epic =
			{
				Multiplier = 2.0,
			}
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseValue = 25,
				AsInt = true,
				ChangeType = "Add",
				MaintainDelta = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
		SignOffData =
		{
		  {
			Text = "CerberusSignoff",
		  },
		  {
			RequiredTextLines = { "CerberusGift09" },
			Text = "CerberusSignoff_Max"
		  }
		},
	},

	LifeOnKillTrait =
	{
		InheritFrom = { "GiftTrait" },
		DropOnKill = {
			Chance = 0.01,
			DropCap = 1,
			Name = "HealDropMinor",
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
	},

	IncreasedWrathStockTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "SuperCost",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
		},
	},

	RetainMoneyOnDeathTrait =
	{
		Icon = "Keepsake_Purse",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHypnosCoinPurse",
		InheritFrom = { "GiftTrait" },
		UnequippedKeepsakeTitle = "RetainMoneyOnDeathTrait_Rack",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.25,
			},
			Rare =
			{
				Multiplier = 1.50,
			},
			Epic =
			{
				Multiplier = 1.75,
			}
		},
		RetainedMoneyOnDeath = { BaseValue = 100 },
		ExtractValues =
		{
			{
				Key = "RetainedMoneyOnDeath",
				ExtractAs = "TooltipRetainedMoney",
				Format = "RetainedMoney",
			}
		}
	},


	BonusMoneyTrait =
	{
		Icon = "Keepsake_Purse",
		EquipSound = "/SFX/Menu Sounds/KeepsakeHypnosCoinPurse",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "BonusMoneyTrait_Rack",
		CustomTrayText = "BonusMoneyTrait_Tray",
		UnequippedKeepsakeTitle = "BonusMoneyTrait_Dead",
		CustomTrayNameWhileDead = "BonusMoneyTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.00,
			},
			Rare =
			{
				Multiplier = 1.25,
			},
			Epic =
			{
				Multiplier = 1.50,
			}
		},
		BonusMoney = { BaseValue = 100 },
		ExtractValues =
		{
			{
				Key = "BonusMoney",
				ExtractAs = "TooltipMoney",
			}
		},
		SignOffData =
		{
		  {
			Text = "HypnosSignoff",
		  },
		  {
			RequiredTextLines = { "HypnosGift08" },
			Text = "HypnosSignoff_Max"
		  }
		},
	},
	FreeHealthGateTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},

		},
		FreeHealthGates = true,
	},

	HealthAsAmmoTrait =
	{
		HealthCostPerAmmo = 10,
	},

	DefensiveRushTrait =
	{
		InheritFrom = { "GiftTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Modifier",
				ChangeValue = 0.75,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "DashDamageShield",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
			},
		},
	},

	ForceZeusBoonTrait =
	{
		Icon = "Keepsake_Signet",
		EquipSound = "/SFX/Menu Sounds/KeepsakeZeusRing",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceZeusBoonTrait_Rack",
		ForceBoonName = "ZeusUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "ZeusUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "ZeusSignoff",
		  },
		  {
			RequiredTextLines = { "ZeusGift07" },
			Text = "ZeusSignoff_Max"
		  }
		},
	},

	ForceDemeterBoonTrait =
	{
		Icon = "Keepsake_Cornucopia",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDemeterHorn",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceDemeterBoonTrait_Rack",
		ForceBoonName = "DemeterUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "DemeterUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "DemeterSignoff",
		  },
		  {
			RequiredTextLines = { "DemeterGift07" },
			Text = "DemeterSignoff_Max"
		  }
		},
	},

	ForceArtemisBoonTrait =
	{
		Icon = "Keepsake_Arrowhead",
		EquipSound = "/SFX/Menu Sounds/KeepsakeArtemisArrow",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceArtemisBoonTrait_Rack",
		ForceBoonName = "ArtemisUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "ArtemisUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "ArtemisSignoff",
		  },
		  {
			RequiredTextLines = { "ArtemisGift07" },
			Text = "ArtemisSignoff_Max"
		  }
		},
	},

	ForceAphroditeBoonTrait =
	{
		Icon = "Keepsake_Rose",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAphroditeRose",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAphroditeBoonTrait_Rack",
		ForceBoonName = "AphroditeUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AphroditeUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "AphroditeSignoff",
		  },
		  {
			RequiredTextLines = { "AphroditeGift06", "AphroditeGift07" },
			Text = "AphroditeSignoff_Max"
		  }
		},
	},

	ForceAresBoonTrait =
	{
		Icon = "Keepsake_Vial",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAresBloodVial",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAresBoonTrait_Rack",
		ForceBoonName = "AresUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AresUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "AresSignoff",
		  },
		  {
			RequiredTextLines = { "AresGift07" },
			Text = "AresSignoff_Max"
		  }
		},
	},

	ForceAthenaBoonTrait =
	{
		Icon = "Keepsake_Pendant",
		EquipSound = "/SFX/Menu Sounds/KeepsakeAthenaOwl",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceAthenaBoonTrait_Rack",
		ForceBoonName = "AthenaUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "AthenaUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "AthenaSignoff",
		  },
		  {
			RequiredTextLines = { "AthenaGift07" },
			Text = "AthenaSignoff_Max"
		  }
		},
	},

	ForceDionysusBoonTrait =
	{
		Icon = "Keepsake_Goblet",
		EquipSound = "/SFX/Menu Sounds/KeepsakeDionysusCup",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForceDionysusBoonTrait_Rack",
		ForceBoonName = "DionysusUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "DionysusUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "DionysusSignoff",
		  },
		  {
			RequiredTextLines = { "DionysusGift07" },
			Text = "DionysusSignoff_Max"
		  }
		},
	},

	ForcePoseidonBoonTrait =
	{
		Icon = "Keepsake_Conch",
		EquipSound = "/SFX/Menu Sounds/KeepsakePoseidonShell",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ForcePoseidonBoonTrait_Rack",
		ForceBoonName = "PoseidonUpgrade",
		Uses = 1,
		RarityBonus =
		{
			RequiredGod = "PoseidonUpgrade",
			RareBonus = { BaseValue = 0.1 },
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "PoseidonSignoff",
		  },
		  {
			RequiredTextLines = { "PoseidonGift07" },
			Text = "PoseidonSignoff_Max"
		  }
		},
	},

	ChaosBoonTrait =
	{
		Icon = "Keepsake_Egg",
		EquipSound = "/SFX/Menu Sounds/KeepsakeChaosEgg",
		InheritFrom = { "GiftTrait" },
		InRackTitle = "ChaosBoonTrait_Rack",
		SecretDoorCostMultiplier =
		{
			BaseMin = 0,
			BaseMax = 0,
		},
		RarityBonus =
		{
			RequiredGod = "TrialUpgrade",
			RareBonus = { BaseValue = 0.2 },
			EpicBonus = 0.15,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
		SignOffData =
		{
		  {
			Text = "ChaosSignoff",
		  },
		  {
			RequiredTextLines = { "ChaosGift08" },
			Text = "ChaosSignoff_Max"
		  }
		},
	},

	InfiniteAmmoTrait =
	{
		InfiniteAmmo = true,
	},

	TemporaryImprovedWeaponTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Jerky",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		Cost = 40,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.3,
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},
	TemporaryImprovedSecondaryTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Sweet_Jerky",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		Cost = 35,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.4,
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	TemporaryImprovedTrapDamageTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Chrysalis",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 35,
		RemainingUses = 6,
		UsesAsEncounters = true,
		PreEquipWeapons = WeaponSets.RubbleWeapons,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageLow",
				BaseValue = 6,
				ChangeType="MultiplyBase",
			},
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			}
		},
		EnemyIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseValue = 6.0,
				SourceIsMultiplier = true,
			},
			Multiplicative = true,
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	TemporaryBackstabTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Brooch",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Ting",
		Cost = 60,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			HitVulnerabilityMultiplier = 1.5,
			ExtractValues =
			{
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},
	TemporaryAlphaStrikeTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Bangle",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Ting",
		Cost = 30,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			HitMaxHealthMultiplier = 1.5,
			ExtractValues =
			{
				{
					Key = "HitMaxHealthMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},
	TemporaryArmorDamageTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Nail",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Ting",
		Cost = 65,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			HealthBufferDamageMultiplier = 1.5,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},
	TemporaryPreloadSuperGenerationTrait = {
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Net",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		Cost = 15,
		RemainingUses = 6,
		UsesAsEncounters = true,
		RequiredSlottedTrait = "Shout",
		StartingSuperAmount =
		{
			BaseValue = 15,
			IdenticalMultiplier =
			{
				Value = -0.5,
			},
		},
		ExtractValues =
		{
			{
				Key = "StartingSuperAmount",
				ExtractAs = "TooltipSuperGain",
			}
		}
	},
	TemporaryImprovedWeaponTrait_Patroclus =
	{
		InheritFrom = { "TemporaryImprovedWeaponTrait" },
		RemainingUses = 10,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.6,
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	TemporaryWeaponLifeOnKillTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamia",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 25,
		RemainingUses = 3,
		UsesAsEncounters = true,
		DropOnKill = {
			Chance = 0.15,
			DropCap = 2,
			Name = "HealDropMinor",
			ExtractValues =
			{
				{
					Key = "Chance",
					ExtractAs = "TooltipDropChance",
					Format = "Percent",
				}
			}
		},
		ExtractValues =
		{
			{
				Key = "RemainingUses",
				ExtractAs = "TooltipChambers",
			}
		}
	},

	TemporaryImprovedRangedTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Braid",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		Cost = 20,
		RemainingUses = 6,
		UsesAsEncounters = true,
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	TemporaryLastStandHealTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Jug",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Jar",
		RequiredMetaUpgradeSelected = "ExtraChanceReplenishMetaUpgrade",
		Cost = 55,
		RemainingUses = 15,
		UsesAsEncounters = true,
		LastStandHealFraction = 0.10,
		RequiredMinMaximumLastStands = 1,
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},
	UpgradedTemporaryLastStandHealTrait =
	{
		InheritFrom = { "TemporaryLastStandHealTrait" },
		LastStandHealFraction = 0.5,
		RemainingUses = 15,
		RequiredMinMaximumLastStands = 1,
		ExtractValues =
		{
			{
				Key = "LastStandHealFraction",
				ExtractAs = "TooltipHeal",
				Format = "Percent",
			}
		}
	},
	TemporaryBonusDamageTrait =
	{
		InheritFrom = { "ShopTrait" },
		Cost = 40,
		RemainingUses = 3,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				UnitProperty = "DamageOutputMultiplier",
				ChangeValue = 0.50,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
		},
	},

	TemporaryDoorHealTrait =
	{
		CustomNameWithMetaUpgrade =
		{
			MetaUpgradeName = "HealingReductionShrineUpgrade",
			Name = "TemporaryDoorHealTrait_Reduced",
		},
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Stein",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Jar",
		RemainingUses = 3,
		UsesAsRooms = true,
		DoorHeal = 0.10,
		Cost = 45,
		ExtractValues =
		{
			{
				Key = "DoorHeal",
				ExtractAs = "TooltipHeal",
				Format = "PercentHeal",
			},
			{
				ExtractAs = "HealingReduction",
				Format = "TotalMetaUpgradeChangeValue",
				MetaUpgradeName = "HealingReductionShrineUpgrade"
			}
		},
	},
	TemporaryDoorHealTrait_Patroclus =
	{
		InheritFrom = { "TemporaryDoorHealTrait" },
		RemainingUses = 5,
		DoorHeal = 0.3,
	},

	TemporaryMoreAmmoTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Stone",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 50,
		RemainingUses = 6,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				ChangeValue = 1,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				}
			},
		},
	},

	TemporaryTempHealthTrait =
	{
		InheritFrom = { "ShopTrait" },
		Cost = 50,
		RemainingUses = 3,
		UsesAsEncounters = true,
	},

	TemporaryForcedChallengeSwitchTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Emblem",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		Cost = 50,
		RemainingUses = 1,
		ForceChallengeSwitch = true,
		RequiredCosmetics = { "ChallengeSwitches1" },
		RequiredMaxDepth = 32,
	},

	TemporaryForcedSecretDoorTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lamp",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Crystal",
		Cost = 55,
		RemainingUses = 1,
		ForceSecretDoor = true,
		RequiredTextLines = { "ChaosFirstPickUp", },
		RequiredMaxDepth = 32,
	},

	TemporaryForcedFishingPointTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Lure",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		RequiredTextLines = { "PoseidonFishQuest01" },
		Cost = 60,
		RemainingUses = 1,
		ForceFishingPoint = true,
		RequiredMaxDepth = 32,
	},

	TemporaryThanatosSummonerTrait =
	{
		InheritFrom = { "ShopTrait" },
		RequiredFalseTrait = "TemporaryThanatosSummonerTrait",
		RequiredTextLines = { "ThanatosFirstAppearance", },
		MaxThanatosSpawnsThisRun = 1,
		Icon = "Shop_Chrysalis",
		Cost = 55,
		RemainingUses = 1,
		ForceThanatosEncounter = true,
		RequiredMaxDepth = 32,
	},

	TemporaryBlockCrusherEnemiesTrait =
	{
		InheritFrom = { "ShopTrait" },
		RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },
		RequiredNoChallengeSwitchInRoom = true,
		Icon = "Shop_Release_Parchment",
		Cost = 35,
		RequiredBiome = "Asphodel",
		RequiredMaxBiomeDepth = 5,
		BlockedEnemyTypes =
		{
			"CrusherUnit",
			"CrusherUnitElite",
		},
		RemainingUses = 4,
		UsesAsEncounters = true,
	},

	TemporaryBlockExplodingChariotsTrait =
	{
		InheritFrom = { "ShopTrait" },
		RequiredFalseRooms = { "A_PostBoss01", "B_PostBoss01", "C_PostBoss01" },
		RequiredNoChallengeSwitchInRoom = true,
		Icon = "Shop_Release_Parchment",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Paper",
		Cost = 75,
		RequiredBiome = "Elysium",
		RequiredMaxBiomeDepth = 7,
		BlockedEnemyTypes =
		{
			"ChariotSuicide",
			"ChariotSuicideElite",
		},
		RemainingUses = 10,
		UsesAsEncounters = true,
	},

	TemporaryBossDamageTrait =
	{
		InheritFrom = { "ShopTrait" },
		RequiredFalseTrait = "TemporaryBossDamageTrait",
		Icon = "Shop_Parchment",
		Cost = 140,
		EncounterPreDamage =
		{
			PreDamage = 0.1,
			EnemyType = "Boss",
			ExtractValues =
			{
				{
					Key = "PreDamage",
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
			}
		},
		RemainingUses = 1,
	},

	TemporaryMoveSpeedTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Vial",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Jar",
		Cost = 10,
		RemainingUses = 8,
		UsesAsEncounters = true,
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	TemporaryBoonRarityTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Yarn",
		OnPurchaseSound = "/Leftovers/Menu Sounds/WellPurchase_Fabric",
		Cost = 70,
		RarityBonus =
		{
			RareBonus = 1,
			EpicBonus = 0.25,
			LegendaryBonus = 0.1,
		},
		RemainingUses = 1,
	},

	SuperTemporaryBoonRarityTrait =
	{
		InheritFrom = { "ShopTrait" },
		Icon = "Shop_Nectar",
		Cost = 70,
		RarityBonus =
		{
			RareBonus = 1,
			EpicBonus = 0.25,
			LegendaryBonus = 0.1,
		},
		RemainingUses = 3,
	},
	-- Weapon Traits --
	TempSwordUpgrade =
	{
		Icon = "Weapon_Sword_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	TempSwordUpgrade2 =
	{
		Icon = "Weapon_Sword_09",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.10,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	-- Sword

	SwordCriticalTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_09",
		RequiredFalseTraits = { "SwordTwoComboTrait", "SwordHeavySecondStrikeTrait", "SwordConsecrationTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 3.0,
			ValidWeapons = { "SwordWeapon3" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon3",
				ProjectileProperty = "CriticalHitChance",
				BaseValue = 0.40,
				ExtractValue =
				{
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			},
		},
	},

	SwordHealthBufferDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_06",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			HealthBufferDamageMultiplier = 4,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
	},

	SwordCriticalParryTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "SwordCriticalParryTrait_Tray",
		Icon = "WeaponEnchantment_Sword03",
		RequiredWeapon = "SwordWeapon",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt01Attack2_ReturnToIdle_Loop",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
			Epic =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Heroic =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Legendary =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
		},
		SwordPostParryCriticalAmount =
		{
			BaseValue = 0.15,
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordPostParryCritical",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordPostParryCritical",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 1,
				}
			},
			-- animation changes
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt01ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt01DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		WeaponBinks =
		{
			"ZagreusSword01_Bink",
			"ZagreusSword01ReturnToIdle_Bink",
			"ZagreusSword01DashAttack_Bink",
			"ZagreusSword01Run_Bink",
			"ZagreusSword01RunStop_Bink",
			"ZagreusSword01Parry_Bink"
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSword01_Bink",
					"ZagreusSword01ReturnToIdle_Bink",
					"ZagreusSword01DashAttack_Bink",
					"ZagreusSword01Run_Bink",
					"ZagreusSword01RunStop_Bink",
					"ZagreusSword01Parry_Bink"
				},
			}
		},
		ExtractValues =
		{
			{
				Key = "SwordPostParryCriticalAmount",
				ExtractAs = "TooltipPercentChance",
				Format = "Percent",
			},
		}
	},

	SwordConsecrationTrait =
	{
		Icon = "WeaponEnchantment_Sword04",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "ConsecrationField" },
		LegalOnFireWeapons = { "SwordParry" },
		CustomTrayText = "SwordConsecrationTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt03ParryReturnToIdle",
		PostWeaponUpgradeScreenAngle = 300,
		OnProjectileDeathFunction =
		{
			Name = "ConsecrationFieldDeath",
		},
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
			Epic =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Heroic =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Legendary =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
		},
		WeaponBinks =
		{
			"ZagreusSwordArthurIdle_Bink",
			"ZagreusSwordArthurRun_Bink",
			"ZagreusSwordArthurRunStop_Bink",
			"ZagreusSwordArthurAttack1_Bink",
			"ZagreusSwordArthurAttack2_Bink",
			"ZagreusSwordArthurAttack3_Bink",
			"ZagreusSwordArthurAttackParry_Bink",
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSwordArthurIdle_Bink",
					"ZagreusSwordArthurRun_Bink",
					"ZagreusSwordArthurRunStop_Bink",
					"ZagreusSwordArthurAttack1_Bink",
					"ZagreusSwordArthurAttack2_Bink",
					"ZagreusSwordArthurAttack3_Bink",
					"ZagreusSwordArthurAttackParry_Bink",
				},

				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
			},

			SwordWeapon2 =
			{
				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.05, LerpTime = 0.0 },
					{ ScreenPreWait = 0.03, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			SwordWeapon3 =
			{
				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.15, LerpTime = 0.06 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.07 },

					--{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
					--{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
				},
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
						{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" }
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyCharging" },
						{
							Name = "/Leftovers/SFX/AuraCharge" ,
							StoppedBy = { "TriggerRelease" }
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			SwordWeaponDash =
			{
				HitSimSlowCooldown = 0.2,
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteSpearThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			SwordParry =
			{
				HitSimSlowCooldown = 0.2,
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{

			-- Main Attack Changes / Excalibur
			{
				WeaponNames = { "SwordWeaponDash", "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- SwordWeaponDash
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "CancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack1_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordArthurAttack1_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- SwordWeapon
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack1_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordArthurAttack1_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeC-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				WeaponProperty = "Projectile",
				ChangeValue = "SwordWeaponArthur1",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableArthur",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableArthurCancellable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			-- SwordWeapon2
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack2_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordArthurAttack2_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeA-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "Projectile",
				ChangeValue = "SwordWeaponArthur2",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				WeaponProperty = "BarrelLength",
				ChangeValue = "0",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthur2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableArthurCancellable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisable2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			-- SwordWeapon3
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordArthurAttack3_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeFx",
				ChangeValue = "ChargeAttack-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordArthurAttack3_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireFx",
				ChangeValue = "SwordSwipeAFlipped-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "CancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "SwordDisableCancelable3",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "ArthurSwordDisable3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon3",
				EffectName = "ArthurSwordDisableCancelable3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "Projectile",
				ChangeValue = "SwordWeaponArthur3",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "BarrelLength",
				ChangeValue = 0,
				ExcludeLinked = true,
			},


			-- Sword Parry

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt03ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt03ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNovaSwordParry-Arthur",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Consecration Field
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationSlow",
				EffectProperty = "Modifier",
				ChangeValue = 0.50,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationDamageReduction",
				EffectProperty = "Modifier",
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			--[[
			{
				WeaponName = "ConsecrationField",
				EffectName = "DodgeBonus",
				EffectProperty = "DodgeChance",
				BaseValue = 0.10,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDodge",
					Format = "Percent",
				}
			},
			]]
			--[[
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationDamage",
				EffectProperty = "Modifier",
				BaseValue = 1.07,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				}
			},
			]]

			{
				LuaProperty = "MaxHealth",
				ChangeValue = 50,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	SwordDoubleDashAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_07",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.2,
			ValidWeapons = { "SwordWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponName = "SwordWeaponDash",
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.15,
				BaseMax = 0.15,
			},
			]]
			{
				WeaponName = "SwordWeaponDash",
				EffectName = "SwordDisableDoubleDashAttack",
				EffectProperty = "Active",
				ChangeValue = true,
		},
			{
				WeaponName = "SwordWeaponDash",
				EffectName = "SwordDisableDoubleDashAttackCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
	},
		},
	},

	SwordThrustWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "SwordThrustWave" },
		LegalOnFireWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordThrustWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordThrustWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordSecondaryWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		AddOnFireWeapons = { "SwordNovaWave" },
		LegalOnFireWeapons = { "SwordParry" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordNovaWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordNovaWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordRandomExplosionTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Sword_02",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				EffectName = "SwordWeaponSpinExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	SwordThirdStrikeChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Boon_Zeus_05",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "SwordTwoComboTrait" },
		WeaponDataOverride =
		{
			SwordWeapon3 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "SwordThirdStrikeChargeTrait",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.485,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordCharge3Hold",
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponName = "SwordDisable2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},


			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTriggerChargeAttack",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},


			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	SwordConsecutiveFirstStrikeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_01",
		RequiredFalseTraits = { "SwordHeavySecondStrikeTrait" },
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				ProjectileName = "SwordWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 10,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "SwordWeapon",
				ProjectileName = "SwordWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 2.5,
				ChangeType = "Absolute",
			},
		},
	},

	SwordTwoComboTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_01",
		RequiredFalseTraits = { "SwordHeavySecondStrikeTrait", "SwordCriticalTrait", "SwordThirdStrikeChargeTrait", "SwordConsecrationTrait" },
		RequiredWeapon = "SwordWeapon",
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.2, LerpTime = 0 },
					{ ScreenPreWait = 0.01, Fraction = 1.0, LerpTime = 0.03 },
				},

				HitRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.12 },
				},
			},
			SwordWeapon2 =
			{
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.2, LerpTime = 0 },
					{ ScreenPreWait = 0.01, Fraction = 1.0, LerpTime = 0.03 },
				},

				HitRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.12 },
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "AddOnFire",
				ChangeValue = "SwordWeapon",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2" },
				WeaponProperty = "ForceReleaseOnSwap",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", },
				ProjectileProperty = "DamageLow",
				ChangeValue = 25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = {"SwordWeapon", "SwordWeapon2", },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Cancelable",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Cancelable",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	SwordSecondaryAreaDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_08",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.2,
			ValidWeapons = { "SwordParry" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
			},
		},
	},

	SwordSecondaryDoubleAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{

			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			--[[
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.85,
				ChangeType = "MultiplyBase",
			},
			
			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectileWaves",
				ChangeValue = 2,
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
					SkipAutoExtract = true,
				},
				IdenticalMultiplier =
				{
					Value = -1,
					MinMultiplier = 0,
				},
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileWaveInterval",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "AdditionalWaveDamageMultiplier",
				BaseValue = 0.5,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format ="Percent"
				}
			},
			]]

			{
				WeaponName = "SwordParry",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
		},
	},


	SwordHeavySecondStrikeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_03",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "SwordTwoComboTrait", "SwordCriticalTrait", "SwordConsecrationTrait" },
		SetupFunction =
		{
			Name = "PermanentSwitchWeapon",
			Args = "SwordWeapon2",
			RunOnce = true
		},
		ReplaceMeleeWeapon = "SwordWeapon2",
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "DamageLow",
				ChangeValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ControlWindow",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "AddControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "LockTrigger",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "CancelChargeOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.56,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.32,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordSelfSlow",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SwordWeapon2",
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 1300,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
		},

		WeaponDataOverride =
		{
			SwordWeapon2 =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/SFX/Player Sounds/WeaponSwing" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
	},

	SwordSecondaryNovaWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Range",
				ChangeValue = 500,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Speed",
				ChangeValue = 1000,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SwordParry",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
		},
	},


	SwordSecondaryBlinkTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_04",
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "HermesSecondaryTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParryBlink",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},

		WeaponDataOverride =
		{
			SwordParry =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavySpecialAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordParry" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
					},
				},
			},
		},
	},

	SwordCursedLifeStealTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_12",
		RequiredWeapon = "SwordWeapon",
		MaxHealthMultiplier = 0.4,
		AddOutgoingLifestealModifiers =
		{
			ValidWeapons = {"SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
			ValidMultiplier = 0.05,
			MaxLifesteal = 2,
			MinLifesteal = 2,
			ExtractValues =
			{
				{
					Key = "MinLifesteal",
					ExtractAs = "TooltipLifesteal",
				},
			}
		},
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.4,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
					Format = "PercentDelta",
				}
			},
		},
		RequiredMinMaxHealthAmount = 10,
		ExtractValues =
		{
			{
				Key = "MaxHealthMultiplier",
				ExtractAs = "TooltipHealthPenalty",
				Format = "NegativePercentDelta",
			},
		}
	},

	SpearSpinTravelDurationTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_14",
		RequiredWeapon = "SpearWeapon",
		RequiredTrait = "SpearSpinTravel",

		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.8,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					Format = "PercentDelta",
				},
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Range",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
			},
		}
	},

	SpearSpinTravelRadiusDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "WeaponEnchantment_Spear04",
		RequiredWeapon = "SpearWeapon",
		RequiredTrait = "SpearSpinTravel",

		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
				ExtractValue =
				{
					ExtractAs = "TooltipRadius",
					Format = "PercentDelta",
				},
				ExcludeLinked = true
			},
		}
	},
	SwordConsecrationBoostTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_15",
		RequiredWeapon = "SwordWeapon",
		RequiredTrait = "SwordConsecrationTrait",
		PreEquipWeapons = { "ConsecrationField" },
		WeaponDataOverride =
		{
			ConsecrationField =
			{
				OnFiredFunctionArgs = { Range = 750, Duration = 8 },
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ConsecrationField",
				EffectName = "ConsecrationSlow",
				EffectProperty = "Modifier",
				ChangeValue = 0.90,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSlowIncrease",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponName = "ConsecrationField",
				ProjectileProperty = "DamageRadius",
				BaseValue = 178,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "ConsecrationField",
					BaseProperty = "DamageRadius",
				}
			},
		},
	},
	SwordSecondaryReflectionTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_08",
		RequiredWeapon = "SwordWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SwordParry",
				EffectName = "SwordParrySelfReflection",
				EffectProperty = "Duration",
				BaseValue = 3,
				ChangeType = "Multiply",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		},
	},

	SwordBackstabTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_10",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
			ExcludeLinked = true,
			HitVulnerabilityMultiplier = 3,
			ExtractValues =
			{
				{
					Key = "HitVulnerabilityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	-- Bow
	BowLongRangeDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_02",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowDoubleShotTrait", "BowCloseAttackTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			ExcludeLinked = true,
			DistanceThreshold = 675,
			DistanceMultiplier =
			{
				BaseValue = 3.0,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "AimLineRangeThreshold",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "TargetReticleOffset",
				ChangeValue = 675,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "RotateTargetReticle",
				ChangeValue = true,
				ExcludeLinked = true,
			},
		},
	},

	BowSlowChargeDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_03",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTapFireTrait", "BowChainShotTrait", "BowBeamTrait", "BowDashFanTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 4,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
                ProjectileProperty = "DamageRadius",
                ChangeValue = 350,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/PlayerHammerExplosions",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	BowTapFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_15",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowPowerShotTrait", "BowSlowChargeDamageTrait", "BowBeamTrait", "BowTransitionTapFireTrait", "BowBondTrait" },
		WeaponDataOverride =
		{
			BowWeapon =
			{
				ChargeCameraMotion = { ZoomType = "None" },
				FireCameraMotion = { ZoomType = "None" },
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseWeaponOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.333333,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 1/3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Cancelable",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	BowPenetrationTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowBondTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowSplitShot" },
			HealthBufferDamageMultiplier = 5.0,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


		},
	},

	BowPowerShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_06",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTapFireTrait", "BowBeamTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			PerfectChargeMultiplier = 2.5,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 1.6,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
	},

	BowSecondaryBarrageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_07",
		RequiredWeapon = "BowSplitShot",
		RequiredFalseTraits = { "BowSecondaryFocusedFireTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 4,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				},
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},

			{
				TraitName = "BowBondTrait",
				WeaponName = "BowSplitShot",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.34,
				ChangeType = "Multiply",
			},
		},
	},

	BowDoubleShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_08",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowTripleShotTrait", "BowLongRangeDamageTrait", "BowDashFanTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "CENTER",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 0.55,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisablePerfectCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelablePerfectCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowDoubleShotDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				EffectName = "BowDoubleShotDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	BowTripleShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_09",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits =  { "BowDoubleShotTrait", "BowDashFanTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.03,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 1.68,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
	},

	BowProjectileReturnTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedObstaclePenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowRandomExplosionTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "BowWeaponExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "BowWeaponExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	BowSecondaryChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Range",
				ChangeValue = 0.1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowSecondaryFocusedFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_11",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowBondTrait", "BowSecondaryBarrageTrait", "BowBeamTrait", "BowMarkHomingTrait" },
		WeaponDataOverride =
		{
			BowSplitShot =
			{
				Sounds =
				{

					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "SecondaryBowChargeup",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRanged", },
						{ Name = "/Leftovers/SFX/AuraOn"},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta"
				},
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Range",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowStartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowMarkHomingTrait",
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01StartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowLoadAmmoTrait",
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02StartCancelMove",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisableLong",
				EffectProperty = "Enabled",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	BowHomingShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 0.66,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowChainShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_10",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowDashFanTrait", "BowSlowChargeDamageTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "NumJumps",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipNumBounces",
				},
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ExpireIfFirstCollisionIsBounce",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ExpireWhenOutOfJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "JumpRange",
				ChangeValue = 525,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "JumpDamageMultiplier",
				ChangeValue = 1.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta"
				},
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	BowDashFanTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_05",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowSlowChargeDamageTrait", "BowDoubleShotTrait", "BowTripleShotTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				},
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 450,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(12),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.03,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "BowWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},



	-- Shield

	ShieldDamageReductionTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_01",
		RequiredWeapon = "ShieldWeapon",
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier =
			{
				BaseValue = 0.8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "GlobalMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},

	ShieldDamageBarrierTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOnHitWeapons = { "ShieldBarrier" },
	},

	ShieldRevengeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOnHitWeapons = { "ShieldRevengeEmpower" },
		OnHitWeaponProperties = { IgnoreAutomatic = true },
	},

	ShieldRushBonusProjectileTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "ShieldRushBonusProjectileTrait_Tray",
		Icon = "WeaponEnchantment_Shield03",
		RequiredWeapon = "ShieldWeapon",
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldAlt01Idle",
		PostWeaponUpgradeScreenAngle = 180,
		PreEquipWeapons = { "ShieldThrowProjectileBonusApplicator", "ChaosShieldThrow" },
		WeaponBinks =
		{
		  "ZagreusShield01QuickAttack_Bink",
		  "ZagreusShield01DashAttack_Bink",
		  "ZagreusShield01Attack_Bink",
		  "ZagreusShield01ThrowReceive_Bink",
		  "ZagreusShield01Idle_Bink",
		  "ZagreusShield01Run_Bink",
		  "ZagreusShield01RunStop_Bink",
		  "ZagreusShield01HeavyThrow_Bink",
		  "ZagreusShieldHeavyThrowNoCatch_Bink",
		},
		WeaponDataOverride =
		{
			ShieldWeapon =
			{
				WeaponBinks =
				{
				  "ZagreusShield01QuickAttack_Bink",
				  "ZagreusShield01DashAttack_Bink",
				  "ZagreusShield01Attack_Bink",
				  "ZagreusShield01ThrowReceive_Bink",
				  "ZagreusShield01Idle_Bink",
				  "ZagreusShield01Run_Bink",
				  "ZagreusShield01RunStop_Bink",
				  "ZagreusShield01HeavyThrow_Bink",
				  "ZagreusShieldHeavyThrowNoCatch_Bink",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ChaosShieldThrow",
				WeaponProperty = "NumProjectiles",
				BaseValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
						ExtractAs = "TooltipProjectiles",
				},
			},
			{
				WeaponNames = { "ShieldThrow" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01Punch",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01PunchFast",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01AttackCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusShieldAlt01AttackChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01AttackFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01Throw",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "OnDeathFiredByAnimation",
				ChangeValue = "ZagreusShieldAlt01Catch",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrowDash",
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "OnDeathFiredByAnimation",
				ChangeValue = "ZagreusShieldAlt01Catch",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	ShieldLoadAmmoTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		AmmoDropData =
		{
			AmmoDropForceMin = 160,
			AmmoDropForceMax = 190,
			AmmoDropUpwardForceMin = 1000,
			AmmoDropUpwardForceMax = 1030,
		},
		CustomTrayText = "ShieldLoadAmmoTrait_Tray",
		Icon = "WeaponEnchantment_Shield04",
		RequiredWeapons = { "ShieldWeapon", "RangedWeapon" },
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldBeowulfIdle",
		PostWeaponUpgradeScreenAngle = 180,
		PreEquipWeapons = { "SelfLoadAmmoApplicator" },
		AnimDefinitions =
		{
			Default =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf",
					DissipateGraphic = "ShieldRush3DBeowulf-Out",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf",
					DissipateGraphic = "ShieldRush3DBeowulf-Out",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax",
				},
			},

			ArtemisWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Artemis",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Artemis",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Artemis",
				},
			},

			AphroditeWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Aphrodite",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Aphrodite",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Aphrodite",
				},
			},

			AresWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Ares",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Ares",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Ares",
				},
			},

			AthenaWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Athena",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Athena",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Athena",
				},
			},


			DemeterWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Demeter",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Demeter",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Demeter",
				},
			},

			DionysusWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Dionysus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Dionysus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Dionysus",
				},
			},

			PoseidonWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Poseidon",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Poseidon",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Poseidon",
				},
			},

			ZeusWeaponTrait =
			{
				Unloaded =
				{
					Graphic = "ShieldRush3DBeowulf-Zeus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "null",
				},
				Loaded =
				{
					Graphic = "ShieldRush3DBeowulf-Zeus",
					DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
					StartFx = "null",
					StartFx2 = "null",
					AttachedAnim = "ShieldRush3DBeowulfMax-Zeus",
				},
			},


		},
		OverrideWeaponFireNames =
		{
			RangedWeapon = "nil",
			SelfLoadAmmoApplicator = "RangedWeapon",
		},
		OnProjectileDeathFunction =
		{
			Name = "ShieldFireClear",
			Args = {
				Interval = 0.17,
			},
		},
		SetupFunction =
		{
			Name = "SetupSelfAmmoLoad",
			Args = { Duration = 3 },
			RunOnce = true,
		},
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier = 1.10,
			ExtractValues =
			{
				{
					Key = "GlobalMultiplier",
					ExtractAs = "TooltipDamageTaken",
					Format = "PercentDelta",
					SkipAutoExtract = true
				},
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			LoadedAmmoMultiplier = { BaseValue = 1.20, SourceIsMultiplier = true },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "LoadedAmmoMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		WeaponBinks =
		{
			"ZagreusShieldBeowulfQuickAttack_Bink",
			"ZagreusShieldBeowulfDashAttack_Bink",
			"ZagreusShieldBeowulfAttack_Bink",
			"ZagreusShieldBeowulfHeavyBullRush_Bink",
			"ZagreusShieldBeowulfHeavyThrow_Bink",
			"ZagreusShieldBeowulfThrowReceive_Bink",
			"ZagreusShieldBeowulfIdle_Bink",
			"ZagreusShieldBeowulfRun_Bink",
			"ZagreusShieldBeowulfRunStop_Bink",
			"ZagreusShieldHeavyPound_Bink",
			"ZagreusShieldHeavyThrowNoCatch_Bink",
		},
		WeaponDataOverride =
		{
			ShieldWeapon =
			{
				WeaponBinks =
				{
					"ZagreusShieldBeowulfQuickAttack_Bink",
					"ZagreusShieldBeowulfDashAttack_Bink",
					"ZagreusShieldBeowulfAttack_Bink",
					"ZagreusShieldBeowulfHeavyBullRush_Bink",
					"ZagreusShieldBeowulfHeavyThrow_Bink",
					"ZagreusShieldBeowulfThrowReceive_Bink",
					"ZagreusShieldBeowulfIdle_Bink",
					"ZagreusShieldBeowulfRun_Bink",
					"ZagreusShieldBeowulfRunStop_Bink",
					"ZagreusShieldHeavyPound_Bink",
					"ZagreusShieldHeavyThrowNoCatch_Bink",
				},

				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.03, Fraction = 0.02, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
					{ ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0 },
				},

				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/VO/ZagreusEmotes/EmoteCharging_Bow",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
						{ Name = "" },

					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmashSHIELD",
						Brick = "/SFX/MetalStoneClangSHIELD",
						Stone = "/SFX/MetalStoneClangSHIELD",
						Organic = "/SFX/MetalOrganicHitSHIELD",
						StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			ShieldThrow =
			{
				--[[
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },
				},
				]]

				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/Leftovers/SFX/AuraCharge",
							Key = "ShieldThrowElectiveCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteHeavyShieldCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
						StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
					},
				},
			},
			ShieldWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmashSHIELD",
						Brick = "/SFX/MetalStoneClangSHIELD",
						Stone = "/SFX/MetalStoneClangSHIELD",
						Organic = "/SFX/MetalOrganicHitSHIELD",
						StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			ShieldWeaponRush =
			{
				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldRush" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldBlock" },
						{ Name = "/SFX/Player Sounds/ZagreusHeavyShieldStomp" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "ShieldWeaponRush",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmashSHIELD",
						Brick = "/SFX/MetalStoneClangSHIELD",
						Stone = "/SFX/MetalStoneClangSHIELD",
						Organic = "/SFX/MetalOrganicHitSHIELD",
						StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			}
		},
		BaseLoadedRushScale = 1.20,
		LoadedRushRarityMultiplier = 1,
		PropertyChanges =
		{
			-- Slow heavy shield Rush

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "ShieldRushDamage",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "ShieldRushDamage"
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 4.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 600,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldWeaponHalt",
				EffectProperty = "Duration",
				ChangeValue = 0.18,
				ChangeType = "Absolute",
			},
			]]

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyBullRush_Charge",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusShieldBeowulfAttackChargeCancel",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfHeavyBullRush_Fire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfInvulnerableRush",
				EffectProperty = "AngleCoverage",
				ChangeValue = math.rad(225),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfReflectRush",
				EffectProperty = "AngleCoverage",
				ChangeValue = math.rad(225),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfInvulnerableRush",
				EffectProperty = "AngleCoverageOffset",
				ChangeValue = -math.rad(45),
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldSelfReflectRush",
				EffectProperty = "AngleCoverageOffset",
				ChangeValue = -math.rad(45),
				ChangeType = "Absolute",
			},

			-- Main attack

			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.16,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				EffectName = "ShieldDisableAttack",
				EffectProperty = "DisableMove",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponName = "ShieldWeapon",
				EffectName = "ShieldSelfSlowFire",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				EffectName = "ShieldDisableAttack",
				EffectProperty = "Duration",
				ChangeValue = 1.45,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ControlWindow",
				ChangeValue = 1.45,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldHeavyPound_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldHeavyPound_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "BeowulfShieldSlam",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 220,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.11,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			-- Dash attack

			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldWeaponDash",
				EffectName = "ShieldSelfSlowFireBeowulf",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			 {
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfPunchFast_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
		 	 },

			 {
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfPunchFast",
				ChangeType = "Absolute",
				ExcludeLinked = true,
		 	 },

			-- One target slower shield Throw

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 900,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 900,
				ChangeType = "Add",
			},
			--[[
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "NumJumps",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty= "ChargeTime",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty= "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty= "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty= "StartDelay",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Duration",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "ShieldChargeThrowTrait",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Charge",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Fire",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "OnDeathFiredByAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_ReturnToIdle",
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				EffectName = "ShieldThrowDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 2900,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 2500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "ShieldThrowDamage",
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "ShieldThrowDamage"
			},
			-- Changes to make ranged weapon instant fire
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreOwnerAttackDisabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ClearFireRequestOnChargeCancel",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "AllowMultiFireRequest",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SetCompleteAngleOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreForceCooldown",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 300
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "RangedWeapon",
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry"
            },

            -- Animations
            --[[
           {
			WeaponName = "ShieldWeapon",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldBeowulfPunch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  ]]

		  {
			WeaponName = "ShieldThrow",
			ProjectileName = "ShieldThrow",
			ProjectileProperty = "OnDeathFiredByAnimation",
			ChangeValue = "ZagreusShieldBeowulfCatch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },

			{
				WeaponNames = { "ShieldThrow" },
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrowDash" },
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		  {
			WeaponName = "ShieldThrowDash",
			ProjectileName = "ShieldThrowDash",
			ProjectileProperty = "OnDeathFiredByAnimation",
			ChangeValue = "ZagreusShieldBeowulfCatch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },

			-- vfx

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Graphic",
				ChangeValue = "ShieldRush3DBeowulf",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "ShieldRush3DBeowulf-Out",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		}
	},

	ShieldLoadAmmo_AthenaRangedTrait =
	{
        InheritFrom = { "ShopTier1Trait" },
        CustomTrayText = "ShieldLoadAmmo_AthenaRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		Icon = "Boon_Athena_02",
		God = "Athena",
		Slot = "Ranged",
        RarityLevels =
        {
            Common =
            {
                Multiplier = 1.000,
            },
            Rare =
            {
                Multiplier = 1.125,
            },
            Epic =
            {
                Multiplier = 1.250,
            },
            Heroic =
            {
                Multiplier = 1.375,
            }
        },
        PropertyChanges =
        {
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "Projectile",
                ChangeValue = "AthenaDeflectingBeowulfProjectile",
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireFx",
                ChangeValue = "ProjectileFireRing-Athena",
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageLow",
                BaseMin = 80,
                BaseMax = 80,
                DepthMult = DepthDamageMultiplier,
                IdenticalMultiplier =
                {
                    Value = DuplicateStrongMultiplier,
                },
                ExtractValue =
                {
                    ExtractAs = "TooltipDamage",
                }
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageHigh",
                DeriveValueFrom = "DamageLow"
            },
        },
        ExtractValues =
        {
            {
                ExtractAs = "BaseRangedDamage",
                External = true,
                BaseType = "Projectile",
                BaseName = "RangedWeapon",
                BaseProperty = "DamageLow",
            }
        }
	},

	ShieldLoadAmmo_ArtemisRangedTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		God = "Artemis",
		Slot = "Ranged",
		Icon = "Boon_Artemis_02",
		CustomTrayText = "ShieldLoadAmmo_ArtemisRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.145,
			},
			Epic =
			{
				Multiplier = 1.290,
			},
			Heroic =
			{
				Multiplier = 1.435,
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "ArtemisProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Artemis",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 55,
				BaseMax = 55,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "CriticalHitChance",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
					SkipAutoExtract = true
				}
			},
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 330
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "IgnoreCoverageAngles",
                ChangeValue = false
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Artemis"
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	ShieldLoadAmmo_DemeterRangedTrait =
	{
		Icon = "Boon_Demeter_02",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "ShieldLoadAmmo_DemeterRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.000,
			},
			Rare =
			{
				Multiplier = 1.140,
			},
			Epic =
			{
				Multiplier = 1.285,
			},
			Heroic =
			{
				Multiplier = 1.430,
			}
		},
		WeaponDataOverride =
		{
			RangedWeapon =
			{
				CauseImpactReaction = false,
				ImpactReactionHitsOverride = 0,
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/Leftovers/SFX/AuraCharge",
							StoppedBy = { "ChargeCancel", "Fired" }
						}
					},
					FireSounds =
					{
						{
							-- StoppedBy = { "SpeechFromCue" }
						},
					},

					ImpactSounds =
					{

					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterProjectile",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-Demeter",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				BaseMin = 70,
				BaseMax = 70,
				MinMultiplier = 0.1,
				IdenticalMultiplier =
				{
					Value = -0.8,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "Type",
                ChangeValue = "INSTANT",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadius",
                ChangeValue = 500
            },
             {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadiusScaleX",
                ChangeValue = 1.175,
            },
             {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DamageRadiusScaleY",
               	ChangeValue = 0.56,
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "MultiDetonate",
                ChangeValue = false
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "RadialNovaSwordParry-Demeter"
            },
			{
				WeaponName = "RangedWeapon",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	ShieldLoadAmmo_ZeusRangedTrait =
	{
		Icon = "Boon_Zeus_05",
		InheritFrom = { "ShopTier1Trait" },
		God = "Zeus",
		Slot = "Ranged",
		CustomTrayText = "ShieldLoadAmmo_ZeusRangedTrait_Tray",
        RequiredTrait = "ShieldLoadAmmoTrait",
		PreEquipWeapons = { "ZeusShieldLoadAmmoStrike", },
		RarityLevels =
		{
			Common =
			{
				Multiplier = 1.0,
			},
			Rare =
			{
				Multiplier = 1.2,
			},
			Epic =
			{
				Multiplier = 1.4,
			},
			Heroic =
			{
				Multiplier = 1.6,
			}
		},
		PropertyChanges =
		{
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageLow",
				ChangeValue = 0
			},
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageHigh",
				ChangeValue = 0
			},
			{
				WeaponName = "ZeusShieldLoadAmmoStrike",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				IdenticalMultiplier =
				{
					Value = DuplicateStrongMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ExtractSource = "ExtractSource",
			},
			{
				WeaponName = "ZeusShieldLoadAmmoStrike",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "ExtractSource"
			},
			{
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                WeaponProperty = "FireOnRelease",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                ProjectileProperty = "DetonateGraphic",
                ChangeValue = "Blank"
            },
            {
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --ProjectileName = "ZeusProjectile",
                EffectName = "OnHitStun",
                EffectProperty = "Active",
                ChangeValue = false,
                ChangeType = "Absolute",
            },
		},
		ExtractValues =
		{
			{
				ExtractAs = "BaseRangedDamage",
				External = true,
				BaseType = "Projectile",
				BaseName = "RangedWeapon",
				BaseProperty = "DamageLow",
			}
		}
	},

	ShieldLoadAmmoBoostTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_15",
		RequiredWeapon = "ShieldWeapon",
		RequiredTrait = "ShieldLoadAmmoTrait",
		PropertyChanges =
		{
			{
				WeaponNames = { "SelfLoadAmmoApplicator" },
				EffectName = "AspectHyperArmor",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SelfLoadAmmoApplicator" },
				EffectName= "AspectHyperArmor",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				}
			},
			{
				WeaponNames = { "SelfLoadAmmoApplicator" },
				EffectName= "AspectHyperArmor",
				EffectProperty = "Duration",
				BaseMin = 3.0,
				BaseMax = 3.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},

		},
	},


	ShieldThrowEmpowerTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_13",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldThrowEmpowerApplicator" },
		OnProjectileDeathFunction =
		{
			Name = "ShieldBounceEmpower",
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.8,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		},
		NumEmpoweredHits = 2,
		ExtractValues =
		{
			{
				Key = "NumEmpoweredHits",
				ExtractAs = "TooltipNumHits",
			}
		}
	},

	ShieldBounceEmpowerTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		Icon = "WeaponEnchantment_Shield03",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldThrowEmpowerApplicator" },
		OnProjectileDeathFunction =
		{
			Name = "ShieldBounceEmpower",
			Args = {}
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "ShieldThrowEmpowerApplicator",
				EffectName = "ShieldThrowDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		}
	},

	ShieldThrowCatchExplode =
	{
		InheritFrom = { "WeaponTrait" },

		Icon = "Weapon_Shield_07",
		RequiredWeapon = "ShieldWeapon",
		PreEquipWeapons = { "ShieldCatchBlast" },
		PropertyChanges =
		{
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "SpawnCount",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileName = "ShieldCatchBlast",
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileName = "ShieldCatchBlast",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},
	ShieldRushProjectileTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_09",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldRushPunchTrait" },
		WeaponDataOverride =
		{
			ShieldWeaponRush =
			{
				FireScreenshake = { Distance = 0, Speed = 0, FalloffSpeed = 1200, Duration = 0.2 },
				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/VO/ZagreusEmotes/EmoteAttacking_BowPowerShot" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmoteParrying" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldRush" },
						{ Name = "/Leftovers/SFX/AuraThrowSmall" },
					},
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "ShieldRushProjectileTrait",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmashSHIELD",
						Brick = "/SFX/MetalStoneClangSHIELD",
						Stone = "/SFX/MetalStoneClangSHIELD",
						Organic = "/SFX/MetalOrganicHitSHIELD",
						StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 5,
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Speed",
				ChangeValue = 6000,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "Range",
				ChangeValue = 175,
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "NumPenetrations",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireSelfInvulnerable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttack",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ObstacleCollisionCheck",
				ChangeValue = "PolygonContainsPoint",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 120,
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ProjectileDefenseAngle",
				ChangeValue = math.rad(100),
				ExcludeLinked = true,
			}
		}

	},
	ShieldThrowGrindTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldThrowFastTrait" },
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				RecallOnFailToFire = "ShieldThrow",
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageLow",
				BaseValue = 0.2,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
				DeriveSource = "DeriveSource",
			},
			{
				WeaponName = "ShieldThrowDash",
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DamageLow",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrowDash",
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageLow",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveAllControlSwaps",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 120,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "DisableOwnerForDuration",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Acceleration",
				ChangeValue = -1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 1600,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 200,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},


	ShieldThrowMultiHitTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldThrowFastTrait", "ShieldTwoShieldTrait" },
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 999,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 900,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "TotalFuse",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 300,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldThrowFastTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredFalseTraits = { "ShieldTwoShieldTrait", "ShieldThrowGrindTrait", "ShieldThrowSingleTargetTrait" },
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 4.0,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipBounces",
				},
			},
			{
				WeaponName = "ShieldThrowDash",
				ProjectileName = "ShieldThrowDash",
				ProjectileProperty = "NumJumps",
				ChangeValue = 4.0,
				ChangeType = "Add",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "JumpSpeedMultiplier",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.45,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 3500,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	ShieldThrowRushTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_16",
		RequiredWeapon = "ShieldWeapon",

		RequiredFalseTraits = { "ShieldThrowElectiveCharge", "ShieldTwoShieldTrait", },

		WeaponDataOverride =
		{
			ShieldThrow =
			{
				DashWeapon = "ShieldThrowDash",
			}
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldThrowDash" },
			ValidWeaponMultiplier = 3,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
	},

	ShieldThrowSingleTargetTrait =
	{
		InheritFrom = { "WeaponTrait", "LimitedTimeTrait" },
		Icon = "Weapon_Shield_07",
		RequiredFalseTraits = { "ShieldThrowFastTrait", "ShieldTwoShieldTrait", "ShieldThrowElectiveCharge" },
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteEvading" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
						StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
					},
				}
			}
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 1,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 0.4,
				ChangeType = "Multiply"
			},
			]]
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 1.5,
				ChangeType = "MultiplyBase"
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "ShieldThrow",
				EffectName = "ShieldThrowDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute"
			},

			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 200,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "GuanYuFirecrackers_ExplosiveChargeWeapon",
				ChangeType = "Absolute",
			},
		},
	},

	ShieldThrowJumpDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_09",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "JumpDamageMultiplierAddition",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageIncrease",
					Format = "Percent",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "MaxJumpDamageMultiplier",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldTwoShieldTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "ShieldTwoShieldTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusShieldAlt02Idle",
		PostWeaponUpgradeScreenAngle = 180,
		RequiredWeapon = "ShieldWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Epic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Heroic =
			{
				MinMultiplier = 3.25,
				MaxMultiplier = 3.25,
			},
			Legendary =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
		},
		Icon = "WeaponEnchantment_Shield02",
		RequiredWeapon = "ShieldWeapon",
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				RecallOnFailToFire = "ShieldThrow",
				NotReadySound = "/SFX/Player Sounds/ZagreusShieldReturn",

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRanged" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ElectricZapSmall",
						Brick = "/SFX/Player Sounds/ElectricZapSmall",
						Stone = "/SFX/Player Sounds/ElectricZapSmall",
						Organic = "/SFX/Player Sounds/ElectricZapSmall",
						StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
						BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
					},
				},
			},
			ShieldWeapon =
			{
				WeaponBinks =
				{
					"ZagreusShield02QuickAttack_Bink",
					"ZagreusShield02DashAttack_Bink",
					"ZagreusShield02Attack_Bink",
					"ZagreusShield02ThrowReceive_Bink",
					"ZagreusShield02Idle_Bink",
					"ZagreusShield02Run_Bink",
					"ZagreusShield02RunStop_Bink",
					"ZagreusShield02HeavyThrow_Bink",
					"ZagreusShieldHeavyThrowNoCatch_Bink",
				},
			},
		},
		WeaponBinks =
		{
			"ZagreusShield02QuickAttack_Bink",
			"ZagreusShield02DashAttack_Bink",
			"ZagreusShield02Attack_Bink",
			"ZagreusShield02ThrowReceive_Bink",
			"ZagreusShield02Idle_Bink",
			"ZagreusShield02Run_Bink",
			"ZagreusShield02RunStop_Bink",
			"ZagreusShield02HeavyThrow_Bink",
			"ZagreusShieldHeavyThrowNoCatch_Bink",
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Graphic",
				ChangeValue = "ProjectileShieldMirage",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageLow",
				BaseValue = 0.5,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "MultiplyByBase",
					BaseType = "Projectile",
					BaseName = "ShieldThrow",
					BaseProperty = "DamageLow",
				},
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ClearWeaponBonusesOnHit",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveAllControlSwaps",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				WeaponProperty = "DisableOwnerForDuration",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "FinalJumpToOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "SelfImpactVelocityMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Speed",
				ChangeValue = 325,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Acceleration",
				ChangeValue = -75,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "ReturnToOwnerSpeed",
				ChangeValue = 550,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "PenetrateJumpTargets",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ShieldThrowTrailMirage",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 320,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				ProjectileProperty = "AddControlOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileName = "ShieldThrow",
				EffectName = "OnHitStun",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			-- Visual changes
			{
			WeaponName = "ShieldWeapon",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02Punch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponDash",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02PunchFast",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "ChargeStartAnimation",
			ChangeValue = "ZagreusShieldAlt02AttackCharge",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "ChargeCancelGraphic",
			ChangeValue = "ZagreusShieldAlt02AttackChargeCancel",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldWeaponRush",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02AttackFire",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldThrow",
			WeaponProperty = "FireGraphic",
			ChangeValue = "ZagreusShieldAlt02Throw",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		  {
			WeaponName = "ShieldThrow",
			ProjectileName = "ShieldThrow",
			ProjectileProperty = "OnDeathFiredByAnimation",
			ChangeValue = "ZagreusShieldAlt02Catch",
			ChangeType = "Absolute",
			ExcludeLinked = true,
		  },
		},
	},

	ShieldThrowExplode =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_04",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 350,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecal",
				ChangeType = "Absolute",
			},
		},
	},

	ShieldDashAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_05",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldRushPunchTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponDash",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 3000,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponDash",
				EffectName = "ShieldDashAttackHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldPerfectRushTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_08",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldRushPunchTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			PerfectChargeMultiplier = 6.0,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "PerfectChargeVelocityMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
		},
	},

	ShieldChargeSpeedTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_05",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			--[[
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
			},
			]]
		},
	},

	ShieldBashReflectTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_07",
		RequiredWeapon = "ShieldWeapon",
	},

	ShieldBashDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_06",
		RequiredWeapon = "ShieldWeapon",
		--[[
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "ShieldWeapon", "ShieldWeaponDash" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			},
		},
		]]
		PropertyChanges =
		{

			{
				WeaponNames = { "ShieldWeapon" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 0,
				ChangeType = "MultiplyBase",
				ExcludeLinked = true,
			},

				{
				WeaponNames = {  "ShieldWeapon" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeapon" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldDashAOETrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_01",
		RequiredWeapon = "ShieldWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "ShieldWeaponDash" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.723599, -- 30 degrees in radians
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "ShieldWeaponDash" },
				EffectName = "ShieldDashReflect",
				EffectProperty = "AngleCoverage",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldSlowChargeDamage =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_08",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldRushPunchTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DamageLow",
				ChangeValue = 15,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "ShieldWeaponRush",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ShieldChargeHealthBufferTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_02",
		RequiredWeapon = "ShieldWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "ShieldWeaponRush" },
			HealthBufferDamageMultiplier = 5,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ShieldAttackChargeTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeHealthBufferTrait", "ShieldChargeSpeedTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldWeapon", },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt02Idle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldWeapon" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "ShieldChargeAttackTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldThrowElectiveCharge =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_12",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldThrowSingleTargetTrait", "ShieldRushBonusProjectileTrait", "ShieldTwoShieldTrait", "ShieldThrowRushTrait" },
		WeaponDataOverride =
		{
			ShieldThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "ShieldThrowElectiveCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRanged" },
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
						StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
						BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "StartDelay",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta"
				},
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldHeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldHeavyThrow_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldRushBonusProjectileTrait",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt01HeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldRushBonusProjectileTrait",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt01HeavyThrow_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmoTrait",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldBeowulfHeavyThrow_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusShieldAlt02HeavyThrow_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldThrow" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusShieldAlt02HeavyThrow_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldTwoShieldTrait",
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				ProjectileProperty = "StartDelay",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "ShieldThrow", "ShieldThrowDash" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "ShieldChargeThrowTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	ShieldRushPunchTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_10",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldChargeSpeedTrait", "ShieldPerfectRushTrait", "ShieldSlowChargeDamage", "ShieldRushProjectileTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireRequestTriggerLock",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttack",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMove",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableAttackPunch",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				EffectName = "ShieldFireDisableMovePunch",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeapon",
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 950,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 950,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 1600,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "ShieldWeaponRush" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	ShieldDoubleRushTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Shield_10",
		RequiredWeapon = "ShieldWeapon",
		RequiredFalseTraits = { "ShieldRushProjectileTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "ShieldWeaponRush",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
		},
	},

	-- Spear

	SpearMultiAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AddOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = {  "SpearWeapon3", },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {  "SpearWeapon3" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	SpearAutoAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearSpinDamageRadius", "SpearSpinChargeLevelTime", "SpearSpinTravel", "SpearWeaveTrait", "SpearSpinChargeAreaDamageTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisable",
				EffectProperty = "Duration",
				ChangeValue = 0.34,
				ChangeType = "Multiply",
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				ChangeValue = 0.34,
				ChangeType = "Multiply",
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockRotation",
				EffectProperty = "Duration",
				ChangeValue = 0.34,
				ChangeType = "Multiply",
			},

			--[[
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockTriggerFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				EffectName = "SpearDisableCancelableAndLockRotationFast",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			]]

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.42,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AddOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "Enabled",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearReachAttack =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_03",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponDash" },
			ExcludeLinked = true,
			DistanceThreshold = 475,
			DistanceMultiplier =
			{
				BaseValue = 1.4,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "Range",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
		},
	},

	SpearThrowFarRangeDamage =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_02",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeaponThrow" },
			ExcludeLinked = true,
			DistanceThreshold = 525,
			DistanceMultiplier =
			{
				BaseValue = 2.5,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "DistanceMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		}
	},

	SpearThrowExplode =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_09",
		RequiredFalseTraits = { "SpearThrowCritical", "SpearThrowBounce", "SpearTeleportTrait", "SpearSpinTravel", },
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 450,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "UseRadialImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageBonusToImpactedUnit",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
                WeaponName = "SpearWeaponThrow",
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/PlayerHammerExplosions",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	SpearThrowBounce =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_04",
		RequiredFalseTraits = { "SpearThrowExplode", "SpearSpinTravel", "SpearTeleportTrait" },
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "NumJumps",
				ChangeValue = 7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipBounces",
				},
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpDamageMultiplier",
				ChangeValue = 1.3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "MaxJumpDamageMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpRange",
				ChangeValue = 750,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "NoJumpTargetRandomSpread",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "JumpRequiresLos",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "PenetrateFinalJumpUnitRangeModifier",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ExpireWhenOutOfObstacleJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearThrowPenetrate =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_05",
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearRushWeapon" },
			HealthBufferDamageMultiplier = 5,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
	},

	SpearThrowCritical =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_06",
		RequiredFalseTraits = { "SpearThrowExplode", "SpearSpinTravel" },
		RequiredWeapon = "SpearWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.5,
			ValidWeapons = { "SpearWeaponThrow", "SpearWeaponThrowReturn", "SpearRushWeapon", "SpearSpinTravel" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrowReturn", "SpearRushWeapon" },
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.5,
				BaseMax = 0.5,
				ChangeType = "Add",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipCriticalChance",
					Format = "Percent",
				}
			},
		},
	},

	SpearSpinDamageRadius =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTrait = "SpearAutoAttack",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 2.25,
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.30,
				ChangeType = "Multiply",
			},
		},
	},

	SpearSpinChargeLevelTime =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_08",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTrait = "SpearAutoAttack",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearSpinDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		},
	},

	SpearSpinTravel =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 0.65/0.7,
				MaxMultiplier = 0.65/0.7,
			},
			Epic =
			{
				MinMultiplier = 0.60/0.7,
				MaxMultiplier = 0.60/0.7,
			},
			Heroic =
			{
				MinMultiplier = 0.55/0.7,
				MaxMultiplier = 0.55/0.7,
			},
			Legendary =
			{
				MinMultiplier = 0.50/0.7,
				MaxMultiplier = 0.50/0.7,
			},
		},
		Icon = "WeaponEnchantment_Spear04",
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt03ThrowFireReturn",
		RequiredWeapons = {"SpearWeapon", "SpearWeaponThrow",},
		RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinAura" },
		CustomTrayText = "SpearSpinTravel_Tray",
		WeaponBinks =
		{
			"ZagreusSpear03Run_Bink",
			"ZagreusSpear03RunStop_Bink",
			"ZagreusSpear03Spin_Bink",
			"ZagreusSpear03DashAttack_Bink",
			"ZagreusSpear03Throw_Bink",

			"ZagreusSpearLunarThrust1_Bink",
			"ZagreusSpearLunarThrust2_Bink",
			"ZagreusSpearLunarThrust3_Bink",

			"ZagreusSpearLunarThrustIdle_Bink",
			"ZagreusSpear03ReturnToIdle_Bink",
			"ZagreusSpear03ThrowReceive_Bink",
		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear03Run_Bink",
					"ZagreusSpear03RunStop_Bink",
					"ZagreusSpear03Spin_Bink",
					"ZagreusSpear03DashAttack_Bink",
					"ZagreusSpear03Throw_Bink",

					"ZagreusSpearLunarThrust1_Bink",
					"ZagreusSpearLunarThrust2_Bink",
					"ZagreusSpearLunarThrust3_Bink",

					"ZagreusSpearLunarThrustIdle_Bink",
					"ZagreusSpear03ReturnToIdle_Bink",
					"ZagreusSpear03ThrowReceive_Bink",
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			SpearWeapon2 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			SpearWeapon3 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			SpearWeaponSpin =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							Key = "SpearWeaponSpinTravel",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
				},

			},

			SpearWeaponSpin2 =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "SpearWeaponSpin2Travel",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						},
					},
				},
			},

			SpearWeaponSpin3 =
			{
				HitSimSlowParameters = { },

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
						{ Name = "/Leftovers/SFX/AuraThrow" }
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							Key = "SpearWeaponSpin3Travel",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
				},
			},

			SpearWeaponThrow =
			{

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteMartialSpearThrow",
							Cooldown = 0.5
						},
					},
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
						{
							Name = "/Leftovers/SFX/AuraCharge" ,
							StoppedBy = { "TriggerRelease" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

		},
		MaxHealthMultiplier =
		{
			BaseValue = 0.3,
			SourceIsMultiplier = true,
		},
		AddOutgoingLifestealModifiers =
		{
			MaxLifesteal = 1,
			MinLifesteal = 1,
			ValidWeapons = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
			ValidMultiplier = 0.05
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Speed",
				ChangeValue = 400,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.25,
				ChangeType = "Add",
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.25,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.00,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.75,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultipleObstacleCollisions",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "NumBounces",
				ChangeValue = 99999,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.50,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 0.50,
				ChangeType = "Multiply",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuSpin",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon3" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuThrust",
				ExcludeLinked = true,
			},

			{
				WeaponNames = {"SpearWeapon2" },
				ProjectileProperty = "AttachedAnim",
				ChangeType = "Absolute",
				ChangeValue = "GuanYuThrust_Flip",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
				{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Lunar Throw
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.8,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			  {
				WeaponName = "SpearWeaponThrowInvisibleReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  ]]

			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 1.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.67,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnType",
				ChangeValue = "PROJECTILE",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnCount",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.08,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.5,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "UseVulnerability",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow", "SpearWeaponThrowReturn" },
				ProjectileProperty = "Speed",
				ChangeValue = 2500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "GuanYuFirecrackers",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt03",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  ]]


			  -- GY Attack
			{
				LuaProperty = "MaxHealth",
				BaseValue = 0.3, -- Make sure to change MaxHealthMultiplier in this trait above if this is altered
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				MaintainDelta = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
					Format = "PercentDelta",
				}
			},

			--- Graphical changes

			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03ThrowFireReturn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt03ThrowFireReturnToIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt03SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt03SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt03SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust1_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust1_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust2_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust2_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.33,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				EffectName = "SpearLunarAerialSlow2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarThrust3_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarThrust3_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.52,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				EffectName = "SpearLunarAerialSlow3",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SpearWeapon2" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearLunarDashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearLunarDashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

		},
		RequiredMinMaxHealthAmount = 10,
	},

	SpearSpinAura =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack", "SpearSpinChargeLevelTime", "SpearSpinTravel" },
		WeaponDataOverride =
		{
			SpearWeaponSpin =
			{
				HitSimSlowParameters = { },
			},

			SpearWeaponSpin2 =
			{
				HitSimSlowParameters = { },
			},

			SpearWeaponSpin3 =
			{
				HitSimSlowParameters = { },
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "BarrelLength",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "SpearSwipe360Continuous"
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 1.2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},
		},
	},

	SpearSpinChargeAreaDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_11",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack" },
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearWeaponSpinExplosiveChargeWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeaponSpinExplosiveChargeWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "SpearWeaponSpinDefenseWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName= "SpearWeaponSpinDefenseWeapon",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "FireFx",
				ChangeValue = "HyperArmorFist",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	SpearSpinDoubleStrike =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_07",
		RequiredWeapon = "SpearWeapon",
		RequiredFalseTraits = { "SpearAutoAttack" },
		WeaponDataOverride =
		{
			SpearWeaponSpin =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},

			SpearWeaponSpin2 =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},

			SpearWeaponSpin3 =
			{
				{ ScreenPreWait = 0.06, Fraction = 0.01, LerpTime = 0 },
				{ ScreenPreWait = 0.01, Fraction = 0.30, LerpTime = 0.1 },
				{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				BaseValue = 60,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				BaseValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire2",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire3",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "RemoveControlOnFire4",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.8,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearWeaveTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "SpearTeleportTrait",
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				LuaProperty = "MaxHealth",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
				}
			},
		},
		RequiredMinMaxHealthAmount = 10,
	},

	SpearDashMultiStrike =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_10",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipHits",
				},
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SpearWeaponDash" },
				EffectName = "SpearDashDisableLong",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "WeaponRange",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipPenalty",
					Format = "NegativePercentDelta",
				},
			},
		},
	},

	SpearThrowElectiveCharge =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_02",
		RequiredWeapon = "SpearWeaponThrow",
		RequiredFalseTraits = { "SpearThrowExplode", "SpearTeleportTrait" },
		WeaponDataOverride =
		{
			SpearWeaponThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "SpearThrowElectiveCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteSpearThrow",
							Cooldown = 0.5
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.24,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow", },
				WeaponProperty = "RemoveControlOnCharge",
				ChangeValue = "SpearWeaponSpin",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 880,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 3.34,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta"
				},
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "Range",
				ChangeValue = 0.31,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "SpearChargeThrowTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			]]
		},
	},

	SpearAttackPhalanxTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_13",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 135,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 165,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon2" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 195,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon3" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0.40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "CENTER",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SpearAttackEscalate =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_01",
		RequiredWeapon = "SpearWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "DamagePerConsecutiveProjectileHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 5.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	-- Gun

	GunMinigunTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_01",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunInfiniteAmmoTrait", "GunShotgunTrait", "GunSniperTrait", "GunLoadedGrenadeTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = 6,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				},
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.6,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 28,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 28,
				ChangeType = "Absolute",
			},
		},
	},
	GunSlowGrenade =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_15",
		RequiredWeapon = "GunWeapon",
		ExcludeLinked = true,
		AddOnFireWeapons = { "GunSlowWeapon", "GunVulnerabilityWeapon" },
		LegalOnFireWeapons = { "GunGrenadeToss" },
		AddOnFireWeaponArgs = { UseTargetLocation = true },
		PropertyChanges =
		{
			{
				WeaponNames = { "GunSlowWeapon" },
				EffectName = "ImpactSlow",
				EffectProperty = "Modifier",
				ChangeValue = 0.7,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSlow",
					Format = "NegativePercentDelta",
				},

			},

			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "STRAIGHT",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "DetonateLineOfSightFromOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunExplodingSecondaryTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 800,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				TraitName = "GunGrenadeDropTrait",
				WeaponName = "GunSlowWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},


			{
		        WeaponNames = { "GunVulnerabilityWeapon" },
		        EffectName = "ImpactVulnerability",
		        EffectProperty = "Modifier",
		        ChangeValue = 0.30,
		        ChangeType = "Add",
		        ExtractValue =
		        {
		          ExtractAs = "TooltipDamageTaken",
		          Format = "Percent",
		        },
	      	},
		      {
		        TraitName = "GunExplodingSecondaryTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "Type",
		        ChangeValue = "STRAIGHT",
		      },
		      {
		        TraitName = "GunExplodingSecondaryTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "Speed",
		        ChangeValue = 2200,
		        ChangeType = "Absolute",
		      },
		      {
		        TraitName = "GunExplodingSecondaryTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "DetonateLineOfSightFromOwner",
		        ChangeValue = true,
		        ChangeType = "Absolute",
		      },
		      {
		        TraitName = "GunExplodingSecondaryTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "CheckObstacleImpact",
		        ChangeValue = true,
		        ChangeType = "Absolute",
		      },
		      {
		        TraitName = "GunExplodingSecondaryTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "Range",
		        ChangeValue = 800,
		        ChangeType = "Absolute",
		      },
		      {
		        TraitName = "GunGrenadeDropTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "UseStartLocation",
		        ChangeValue = true,
		        ChangeType = "Absolute",
		      },
		      {
		        TraitName = "GunGrenadeDropTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "UseStartLocation",
		        ChangeValue = true,
		        ChangeType = "Absolute",
		      },
				{
					TraitName = "GunLoadedGrenadeTrait",
					WeaponName = "GunVulnerabilityWeapon",
					ProjectileProperty = "DamageRadius",
					ChangeValue = 0.5,
					ChangeType = "Multiply",
				},
		      {
		        TraitName = "GunGrenadeDropTrait",
		        WeaponName = "GunVulnerabilityWeapon",
		        ProjectileProperty = "DamageRadius",
		        ChangeValue = 1.5,
		        ChangeType = "Multiply",
		      },
		},
	},

	GunShotgunTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_02",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunSniperTrait", "GunInfiniteAmmoTrait", "GunMinigunTrait", "GunConsecutiveFireTrait", "GunChainShotTrait", "GunLoadedGrenadeTrait", "GunHomingBulletTrait" },
		PropertyChanges =
		{

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -6,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				},
			},
			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "Cooldown",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "GunDisableCancellable",
				EffectProperty = "Duration",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "GunWeaponDash" },
				WeaponProperty = "CanCancelDisables",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeaponDash" },
				WeaponProperty = "CanCancelOwnDisables",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeaponDash" },
				WeaponProperty = "TriggerTapIgnoresCooldown",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon","GunWeaponDash" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "GunShotgunBlastRandomFlip-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImpactFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ExpandBlastDuringDetonation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "BlastSpeed",
				ChangeValue = 3400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 3400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 170,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.06,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "RequireHitCenter",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 320,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 310,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},
		},

		WeaponDataOverride =
		{
			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			GunWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			SniperGunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},
		},
	},

	GunSniperTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_03",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunInfiniteAmmoTrait", "GunMinigunTrait" },
		WeaponDataOverride =
		{
			GunWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			},

			GunWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
						{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
						{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/GunBulletOrganicImpact",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
					},
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -11,
				ChangeType = "Add",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunIdleLoop",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 7.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLine",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			--[[
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			]]

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	GunDashAmmoTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_04",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunManualReloadTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
		},
	},

	GunExplodingSecondaryTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_08",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeDropTrait", "GunLoadedGrenadeTrait" },
		WeaponDataOverride =
		{
			GunGrenadeToss =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/SFX/Player Sounds/ZagreusGunGrenadeReloading" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteRangedNew" },
						{ Name = "/SFX/Player Sounds/ZagreusGunGrenadeLaunchFire" },
						{ Name = "/SFX/HeatCollectionPickup" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},

		PropertyChanges =
		{
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Type",
				ChangeValue = "STRAIGHT",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeRocket",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "ObstacleCollisionCheck",
				ChangeValue = "PolygonContainsPoint",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "OffsetZ",
				ChangeValue = 60,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "null",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Speed",
				ChangeValue = 800,
				ChangeType = "Add"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 360,
				ChangeType = "Absolute"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageLow",
				ChangeValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1020,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunFire",
			},
			{
				TraitName = "GunGrenadeSelfEmpowerTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
			},
			{
				TraitName = "GunManualReloadTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunFire",
			},
			{
				TraitName = "GunGrenadeSelfEmpowerTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
			},
			{
				TraitName = "GunManualReloadTrait",
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "GunGrenadeFireFx-Rocket",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Interactions with GunGrenadeClusterTrait
			{
				TraitName = "GunGrenadeClusterTrait",
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeClusterTrait",
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(15),
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunGrenadeClusterTrait",
				WeaponNames = { "GunGrenadeToss" },
				ExcludeProjectileName = "GunGrenadeSelfDamage",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeRocket",
			},
			-- Interactions with athena flourish

			{
				TraitName = "AthenaSecondaryTrait",
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 75,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "UseDetonationForProjectileDefense",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
		}
	},

	GunHeavyBulletTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_04",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunArmorPenerationTrait", "GunLoadedGrenadeTrait", "GunChainShotTrait" },
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			]]
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				EffectName = "OnHitSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 275,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
			},
			{
                WeaponNames = { "GunWeapon", "GunWeaponDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/PlayerHammerExplosionsTight",
                ChangeType = "Absolute",
            },
		},
	},

	GunHomingBulletTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_10",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunLoadedGrenadeTrait", "GunArmorPenerationTrait", "GunChainShotTrait", "GunShotgunTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
			ValidWeaponMultiplier = 1.1,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "AdjustRateAcceleration",
				ChangeValue = 25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Speed",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Acceleration",
				ChangeValue = 0.30,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1.15,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipRange",
					Format = "PercentDelta",
				},
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.15,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.85,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "AthenaWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "AresWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "ArtemisWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "AphroditeWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "DemeterWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "DionysusWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "PoseidonWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "ZeusWeaponTrait",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunWeaponProjectile_Homing-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


		},
	},

	GunInfiniteAmmoTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_09",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunSniperTrait", "GunMinigunTrait", "GunConsecutiveFireTrait", "GunLoadedGrenadeTrait", "GunFinalBulletTrait" },
		WeaponDataOverride =
		{
			GunWeapon =
			{
				LowAmmoSoundThreshold = -1,
			},
			GunWeaponDash =
			{
				LowAmmoSoundThreshold = -1,
			},
		},
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "TriggerTapIgnoresCooldown",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunBaseUpgradeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -1,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.035,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Spread",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunWeaponDash",
				WeaponProperty = "CanCancelDisables",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

		},
	},

	GunArmorPenerationTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_12",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunHeavyBulletTrait", "GunHomingBulletTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
			HealthBufferDamageMultiplier = 1.5,

			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash", "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},

	},

	GunGrenadeClusterTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_05",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeFastTrait", "GunGrenadeDropTrait", "GunLoadedGrenadeTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipProjectiles",
				},
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileSpacing",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 350,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageLow",
				ChangeValue = 0.7,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamagePenalty",
					Format = "NegativePercentDelta",
				},
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Graphic",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "UnpauseAnimation",
				ChangeValue = "GunGrenade",
				ExcludeLinked = true,
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "UnpauseAnimation",
				ChangeValue = "GunGrenadeLuciferOrb",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeClusterDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				TraitName = "DemeterSecondaryTrait",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "ZagGrenadeExplosionDemeterClusterBomb",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			}
		},
	},

	GunGrenadeProjectileSpeedTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_05",
		RequiredWeapon = "GunWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Speed",
				ChangeValue = 1700,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Gravity",
				ChangeValue = 5000,
				ChangeType = "Absolute",
			},
		},
	},

	GunGrenadeSelfEmpowerTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "GunGrenadeSelfEmpowerTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusGunAlt02ReloadEnd",
		PostWeaponUpgradeScreenAngle = 210,
		RequiredWeapon = "GunWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		Icon = "WeaponEnchantment_Gun02",
		RequiredWeapon = "GunWeapon",
		WeaponBinks =
		{
			"ZagreusGun02_Bink",
			"ZagreusGun02Run_Bink",
			"ZagreusGun02GrenadeToss_Bink",
			"ZagreusGun02Stop_Bink",
			"ZagreusGun02FireEmpty_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",
				WeaponBinks =
				{
					"ZagreusGun02_Bink",
					"ZagreusGun02Run_Bink",
					"ZagreusGun02GrenadeToss_Bink",
					"ZagreusGun02Stop_Bink",
					"ZagreusGun02FireEmpty_Bink",
				},
			},
			GunWeaponDash =
			{
				IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "ZagreusOnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "GrenadeSelfDamageOutput",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "GunGrenadeToss", "GunBombWeapon" },
				EffectName = "GrenadeSelfDamageOutput",
				EffectProperty = "Modifier",
				BaseValue = 0.15,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				}
			},
			--[[
			{
				WeaponNames = { "GunWeapon", },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "GunWeapon",  },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon",  },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt02FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "GunWeaponDash",  },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "GunWeaponDash", },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt02FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt02GrenadeTossCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt02GrenadeTossFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	GunGrenadeDropTrait  =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_06",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeFastTrait", "GunGrenadeClusterTrait", "GunExplodingSecondaryTrait", "GunLoadedGrenadeTrait" },
		PropertyChanges =
		{
			--[[
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ManualAiming",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Gravity",
				ChangeValue = 1050,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.45,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileName = "GunGrenadeToss",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageLow",
				ChangeValue = 4.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "ReticleGraphic",
				ChangeValue = "GunGrenadeWarningDecalFlash",
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunBombWeapon",
				ProjectileProperty = "DamageLow",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunBombWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunBombWeapon",
				ProjectileName = "GunBombWeapon",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
				ChangeType = "Absolute",
			},


			--[[
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DetonateGraphic2",
				ChangeValue = "GunGrenadeTossFirecrackerSpawner",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]


			--[[
			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Speed",
				ChangeValue = 300,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "Range",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "LaunchAngle",
				ChangeValue = 30,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "GunGrenadeToss",
				ProjectileProperty = "SelfDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			]]
		},
	},

	GunGrenadeFastTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_07",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunGrenadeClusterTrait", "GunGrenadeDropTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.06,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "TriggerTapIgnoresCooldown",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipSize",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipClip",
				},
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 1.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelableFast",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunGrenadeToss",
				EffectName = "GrenadeDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ExcludeLinked = true,
			},
		},
	},

	GunConsecutiveFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunInfiniteAmmoTrait" },
		PropertyChanges =
		{
			{
				WeaponName = "GunWeapon",
				ProjectileName = "GunWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				DeriveSource = "DamageSource",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},

			{
				WeaponName = "GunWeapon",
				ProjectileName = "GunWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.48,
				ChangeType = "Absolute",
			},

		},
	},

	-- Fist Weapon

	FistHeavyAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_13",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistAttackFinisherTrait", "FistDetonateTrait" },
		--[[
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 4.0,
			ValidWeapons = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		]]
		PropertyChanges =
		{

			--[[
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			]]
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.05,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.05,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "FistWeapon",
				EffectName = "FistChargeDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "FistWeapon",
				EffectName = "FistChargeDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponName = "FistWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistDashHayMaker_Fire",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistGrab_Start",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistGrab_Fire",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeapon2",
				EffectName = "FistChargeDisable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon2",
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon3",
				EffectName = "FistChargeDisable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "FistWeapon3",
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeapon3",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "FistWeapon3",
				WeaponProperty = "CooldownWeaponSlotThree",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
			},


		},

		WeaponDataOverride =
		{
			FistWeapon3 =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
						{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			}
		},

	},

	FistAttackDefenseTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_14",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				EffectName = "FistHeavyAttackTraitDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				EffectName= "FistHeavyAttackTraitDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx2",
				ChangeValue = "HyperArmorFist",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	FistReachAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_07",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistDetonateTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.10,
			ValidWeapons = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			}, 			{
 				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
 				ProjectileName = "FistWeapon",
				ProjectileProperty = "RequireHitCenter",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 650,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 650,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 4000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "Acceleration",
				ChangeValue = -24000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxBase_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAphrodite_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAres_Reach",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxAthena_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxArtemis_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDemeter_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxDionysus_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxPoseidon_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusWeaponTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFxZeus_Reach",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	FistChargeAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_02",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistAttackFinisherTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeapon" },
			PerfectChargeMultiplier = 1.5,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "FistWeaponCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
					},
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
						},
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			FistWeapon2 =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
							Key = "FistWeapon2Charge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
						{ Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusFistRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "CancelChargeOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeAttackTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeAttackTrait2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "BelowMinChargeCooldown",
				ChangeValue = 0.02,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 300,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "FistWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisable2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistChargeDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisable2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistChargeDisableAndLockTrigger2",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusHeavyPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			--[[
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistFlurryPunch_Complete",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSlowCharge",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = false,
				Type = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurryDisableAndLockTrigger",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistFlurrySelfSlowCharge",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	FistDashAttackHealthBufferTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_01",
		RequiredWeapon = "FistWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeaponDash", "FistWeaponDash" },
			HealthBufferDamageMultiplier = 10,
			ExtractValues =
			{
				{
					Key = "HealthBufferDamageMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponDash", "FistWeaponDash" },
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	-- Experimental Stuff
	FistKillTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_06",
		RequiredWeapon = "FistWeapon",
		OnEnemyDeathWeapon =
		{
			Weapon = "FistKillBuff",
			RequiredKillWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash", "FistSpecialVacuum", "FistWeaponLandAreaAttack" },
		},
		FistKillHeal = 0.02,
			ExtractValues =
			{
				{
					Key = "FistKillHeal",
					ExtractAs = "TooltipHeal",
					Format = "Percent",
				},
			}
	},

	FistConsecutiveAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_09",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.18,
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5", },
				ProjectileName = "FistWeaponClawL",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeapon2", "FistWeapon4", },
				ProjectileName = "FistWeaponClawR",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5", "FistWeaponDash" },
				ProjectileName = "FistWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ExtractSource = "ExtractSource",
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5", },
				ProjectileName = "FistWeaponClawL",
				ProjectileProperty = "DamagePerConsecutiveHit",
				DeriveValueFrom = "ExtractSource",
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeapon2", "FistWeapon4", },
				ProjectileName = "FistWeaponClawR",
				ProjectileProperty = "DamagePerConsecutiveHit",
				DeriveValueFrom = "ExtractSource",
			},
		},
	},

	FistAttackFinisherTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_08",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistChargeAttackTrait", "FistHeavyAttackTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 1.6,
			ValidWeapons = { "FistWeaponDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "FistWeaponDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "CooldownWeaponSlotThree",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistDetonateTrait",
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,

			}
		},
	},

	FistDoubleDashSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_03",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistSpecialFireballTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = 2.0,
			ValidWeapons = { "FistWeaponSpecialDash" },
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 450,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadiusScaleX",
				ChangeValue = 0.9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "MineExplosionFadeDecalGunTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
                WeaponNames = { "FistWeaponSpecialDash" },
                ProjectileProperty = "DetonateSound",
                ChangeValue = "/SFX/PlayerHammerExplosions",
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
		},
	},

	FistDoubleSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.42,
				ChangeType = "Absolute",
			},
		},
	},

	FistChargeSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_11",
		RequiredFalseTraits = { "FistTeleportSpecialTrait", "FistVacuumTrait", "FistSpecialFireballTrait" },
		RequiredWeapon = "FistWeapon",
		WeaponDataOverride =
		{
			FistWeaponSpecial =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "FistChargeSpecialTrait",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteCharging_Bow",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_FistKick" },
						{ Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/FistImpactSmall",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistFlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeUppercutTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeVelocityMultiplier",
				ChangeValue = 3.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 400,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "FistChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "BlastDuration",
				ChangeValue = 0.22,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialInvulnerable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	FistSpecialFireballTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_10",
		RequiredFalseTraits = { "FistDetonateTrait", "FistTeleportSpecialTrait", "FistChargeSpecialTrait", "FistVacuumTrait", "FistDoubleDashSpecialTrait", "FistSpecialLandTrait" },
		RequiredWeapon = "FistWeapon",
		WeaponDataOverride =
		{
			FistWeaponSpecial =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
						{ ScreenPreWait = 0.02, Fraction = 0.2, LerpTime = 0 },
						{ ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.0 },
				},
				Sounds =
				{
					ChargeSounds =
					{
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
							Key = "FistSpecialFireballTrait",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
						{
							Name = "/VO/ZagreusEmotes/EmoteHeavyCharging",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
						}
					},

					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/Leftovers/SFX/AuraPerfectThrow" },
						},
						{ Name = "/Leftovers/SFX/AuraThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
						{
							Name = "/VO/ZagreusEmotes/EmoteAttacking_FistKick",
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/SwordWallHitClankSmall",
						BrickObstacle = "/SFX/SwordWallHitClankSmall",
						MetalObstacle = "/SFX/SwordWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "FistWeaponSpecial" },
			PerfectChargeMultiplier = 1.5,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "PerfectChargeMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				}
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "EnemyConeAttackLoopEnd",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DetonateSound",
				ChangeValue = "/SFX/Enemy Sounds/EnemyProjectileDetonateExplode",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Fuse",
				ChangeValue = 8,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Speed",
				ChangeValue = 600,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Range",
				ChangeValue = 1200,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Acceleration",
				ChangeValue = 2450,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "ObstacleCollisionCheck",
				ChangeValue = "PolygonContainsPoint",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "UnitCollisionCheck",
				ChangeValue = "Polygon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
            {
				WeaponNames = { "FistWeaponSpecial" },
                ProjectileProperty = "Scale",
                ChangeValue = 0.35,
                ChangeType = "Multiply",
                ExcludeLinked = true,
            },
            {
				WeaponNames = { "FistWeaponSpecial" },
                ProjectileProperty = "RelativeExtentScale",
                ChangeValue = 0.35,
                ChangeType = "Absolute",
                ExcludeLinked = true,
            },
            {
				WeaponNames = { "FistWeaponSpecial" },
                ProjectileProperty = "OriginX",
                ChangeValue = 50,
                ChangeType = "Add",
                ExcludeLinked = true,
            },
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 180,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "RequireHitCenter",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Add_Top",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "UseRadialImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "NumPenetrations",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "ProjectileDefenseAngle",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "ImpactLineOfSightFromOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "BarrelLength",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1110,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 120,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistGrab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistGrab_FireFast",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "FistChargeSpecialTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = -1,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.15,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "PerfectChargeSpeedMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "SelfVelocityCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "Range",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "AimLineAnimation",
				ChangeValue = "AuraAimLineShield",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "FistChargeFocusedFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireHalt",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialFireMoveCancel",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				EffectName = "FistSpecialInvulnerable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "Graphic",
				ChangeValue = "FistFireballFx-Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "FistWeaponSpecial",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "FistWeaponSpecial",
				ProjectileProperty = "AttachedPowershotAnimation",
				ChangeValue = "BowWeaponPowerShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},


	FistSpecialLandTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_12",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistWeaveTrait", "FistSpecialFireballTrait" },
		PreEquipWeapons = { "FistWeaponLandAreaAttack" },
		AddOnFireWeapons = { "FistWeaponLandAreaAttack" },
		LegalOnFireWeapons = { "FistWeaponSpecial" },
		ExcludeLinked = true,
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DamageLow",
				BaseValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Aphrodite",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Artemis",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Ares",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Athena",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Dionysus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Poseidon",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponNames = { "FistWeaponLandAreaAttack" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "FistSpecialLandFx_Zeus",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	FistSpecialWaveTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "FistWeapon",
		PreEquipWeapons = { "FistNovaWave" },
		AddOnFireWeapons = { "FistNovaWave" },
		LegalOnFireWeapons = { "FistWeaponSpecial" },
		PropertyChanges =
		{
			{
				WeaponNames = { "FistNovaWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 80,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistNovaWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},


	FistTeleportSpecialTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_05",
		PreEquipWeapons = {"FistSpecialMiniDash"},
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistVacuumTrait", "FistChargeSpecialTrait", "FistSpecialFireballTrait" },
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckTeleportToNearbyEnemy",
			FunctionArgs =
			{
				Range = 600,
				AutoLockArc = 40,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistFlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistFlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.26,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 600,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLockUseMouseOver",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "FistFxUppercutDirectional_FlashKick",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	FistVacuumTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		Icon = "WeaponEnchantment_Fist03",
		PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt02Grab_ReturnToIdle",
		PostWeaponUpgradeScreenAngle = 208,
		PreEquipWeapons = { "FistSpecialVacuum" },
		CustomTrayText = "FistVacuumTrait_Tray",
		RequiredWeapon = "FistWeapon",
		RequiredFalseTraits = { "FistVacuumTrait", "FistTeleportSpecialTrait" },
		RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		WeaponBinks =
		{
			"ZagreusFistAlt02Idle_Bink",
			"ZagreusFistAlt02Run_Bink",
			"ZagreusFistAlt02RunStop_Bink",
			"ZagreusFistAlt02FlurryPunch_Bink",
			"ZagreusFistAlt02FlashKick_Bink",
			"ZagreusFistAlt02Grab_Bink",
			"ZagreusFistAlt02AerialUpperCut_Bink",
			"ZagreusFistAlt02DashUpperCut_Bink",
			"ZagreusFistAlt02DashHayMaker_Bink",
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				WeaponBinks =
				{
					"ZagreusFistAlt02Idle_Bink",
					"ZagreusFistAlt02Run_Bink",
					"ZagreusFistAlt02RunStop_Bink",
					"ZagreusFistAlt02FlurryPunch_Bink",
					"ZagreusFistAlt02FlashKick_Bink",
					"ZagreusFistAlt02Grab_Bink",
					"ZagreusFistAlt02AerialUpperCut_Bink",
					"ZagreusFistAlt02DashUpperCut_Bink",
					"ZagreusFistAlt02DashHayMaker_Bink",
				}
			},
		},
		AddRush =
		{
			FunctionName = "FistVacuumRush",
			FunctionArgs =
			{
				Duration = 0.2,
			},
			RunOnce = true,
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckVacuumNearbyEnemy",
			FunctionArgs =
			{
				Range = 800,				-- Vacuum distance
				DistanceBuffer = 130,		-- Space to leave between player and enemy
				RushDistanceBuffer = 300,
				AutoLockArc = 60,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistSpecialVacuum" },
				EffectName = "MarkTargetFist",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistSpecialVacuum" },
				EffectName = "MarkTargetFist",
				EffectProperty = "Modifier",
				BaseValue = 0.10,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "FistSpecialVacuum" },
				EffectName = "MarkTargetFist",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					SkipAutoExtract = true,
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "FistSpecialVacuum" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ExtractValue =
				{
					ExtractAs = "TooltipPullDamage",
					SkipAutoExtract = true,
				},
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistSpecialVacuum" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.24,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 220,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Charge5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlurryPunch_Fire5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02AerialUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02FlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02FlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02Grab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02Grab_Fire",
				ChangeType = "Absolute",
			},
		},
	},

	FistThrowSpecial =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		PreEquipWeapons = {"FistSpecialMiniDash"},
		RequiredWeapon = "FistWeapon",
		OnWeaponFiredFunctions =
		{
			ValidWeapons = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
			FunctionName = "CheckGrappleToNearbyEnemy",
			FunctionArgs =
			{
				ThrowArc = 120,
				Range = 250,					-- Finds a unit within this range to throw
				ThrowRange = 950,				-- Seeks a unit within this range to throw to
				OverThrowDistance = 500,		-- Additional impulse so the unit slams into the target unit
				MinForce = 2000,					-- Minimum force to apply
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 2200,
				ChangeType = "Absolute",
			},
		},

	},

	SwordGoldDamageTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_13",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			GoldMultiplier = 0.05,
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "GoldMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
			}
		},
	},

	SpearThrowObjectAOETrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Spear_12",
		RequiredFalseTraits = { "SpearSpinTravel" },
		 PreEquipWeapons = { "SpearThrowImmolation" },
		RequiredWeapon = "SpearWeapon",
		SetupFunction =
		{
			Name = "SetUpSpearImmolation",
			Args = {
				Interval = 0.8,
				ExtractValues =
				{
					{
						Key = "Interval",
						DecimalPlaces = 1,
						ExtractAs = "TooltipInterval"
					}
				}
			},
			RunOnce = true,
		},
		PropertyChanges = {
			{
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
				ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry",
				ExcludeLinked = true,
			},
			{
				TraitName = "AphroditeSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Aphrodite",
				ExcludeLinked = true,
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Ares",
				ExcludeLinked = true,
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Athena",
				ExcludeLinked = true,
			},
			{
				TraitName = "ArtemisSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Artemis",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Dionysus",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Demeter",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Poseidon",
				ExcludeLinked = true,
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponNames = { "SpearThrowImmolation" },
				ProjectileProperty = "DetonateGraphic",
				ChangeType = "Absolute",
				ChangeValue = "RadialNovaSwordParry-Zeus",
				ExcludeLinked = true,
			},
		}
	},

	GunEmptyClipBlastTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_11",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "EmptyClipBlast" },
		FireWeaponOnZeroGunAmmo = "EmptyClipBlast",
		PropertyChanges = {
			{
				WeaponNames = { "EmptyClipBlast" },
				ProjectileProperty = "DamageLow",
				BaseValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
				ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "EmptyClipBlast" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
		}

	},

	GunFinalBulletTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_17",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunLoadedGrenadeTrait", "GunInfiniteAmmoTrait" },
		AddOutgoingDamageModifiers =
		{
			FinalShotMultiplier =
			{
				BaseValue = 8,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "FinalShotMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "FinalShotGraphic",
				ChangeValue = "GunWeaponProjectile_FinalBullet",
				ChangeType = "Absolute",
			},
		}
	},

	BowCloseAttackTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_16",
		RequiredWeapon = "BowWeapon",
		RequiredFalseTraits = { "BowLongRangeDamageTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "BowWeapon", "BowWeaponDash" },
			ExcludeLinked = true,
			ProximityThreshold = 330,
			ProximityMultiplier =
			{
				BaseValue = 2.5,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "ProximityMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "AimLineRangeThresholdInward",
				ExcludeLinked = true,
			},
			{
				TraitName = "BowBondTrait",
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "TargetReticleAnimation",
				ChangeValue = "AimLineRangeThresholdInwardWide",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "TargetReticleOffset",
				ChangeValue = 330,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "RotateTargetReticle",
				ChangeValue = true,
				ExcludeLinked = true,
			},
		},
	},

  BowConsecutiveBarrageTrait =
  {
    InheritFrom = { "WeaponTrait" },
    Icon = "Weapon_Bow_13",
    RequiredWeapon = "BowWeapon",
    RequiredFalseTraits = { "BowBondTrait" },
	PropertyChanges =
	{

		{
			WeaponName = "BowSplitShot",
			ProjectileName = "BowSplitShot",
			ProjectileProperty = "DamagePerConsecutiveHit",
			ChangeValue = 3,
			ChangeType = "Absolute",
			DeriveSource = "DamageSource",
			ExtractValue =
			{
				ExtractAs = "TooltipDamage",
			},
		},

		{
			WeaponName = "BowSplitShot",
			ProjectileName = "BowSplitShot",
			ProjectileProperty = "ConsecutiveHitWindow",
			ChangeValue = 0.5,
			ChangeType = "Absolute",
		},
	}
  },

	GunChainShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_14",
		RequiredWeapon = "GunWeapon",
		RequiredFalseTraits = { "GunShotgunTrait", "GunLoadedGrenadeTrait", "GunHomingBulletTrait", "GunHeavyBulletTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipNumBounces",
				},
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "ExpireWhenOutOfJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "JumpRange",
				ChangeValue = 525,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "NoJumpTargetRandomSpread",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
		},
	},

	BowWideShotTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_17",
		RequiredWeapon = "BowWeapon",
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "Scale",
				ChangeValue = 3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipWidth",
					Format = "PercentDelta"
				}
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "ExtentScale",
				ChangeValue = 2,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	SwordBlinkTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Sword_14",
		PreEquipWeapons = {"SwordParryRecall", "SwordSpecialMiniDash"},
		RequiredWeapon = "SwordWeapon",
		RequiredFalseTraits = { "SwordConsecrationTrait" },
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "SwordParry" },
			FunctionName = "CheckRecallTeleportToNearbyEnemy",
			FunctionArgs =
			{
				RecallTime = 0.95, -- The effect duration below should always match this value
				Range = 0,
				NoTargetRange = 400,
				AutoLockArc = 40,
				AnimationData =
				{
					Default = { Animation = "SwordTeleportReturnPoint", DissipateFx = "SwordTeleportReturnPointDissipate" },
					SwordCriticalParryTrait = { Animation = "SwordTeleportReturnPoint_B", DissipateFx = "SwordTeleportReturnPointDissipate_B" },
					DislodgeAmmoTrait  = { Animation = "SwordTeleportReturnPoint_C", DissipateFx = "SwordTeleportReturnPointDissipate_C" },
					SwordConsecrationTrait  = {Animation =  "SwordTeleportReturnPoint_D", DissipateFx = "SwordTeleportReturnPointDissipate_D" },
				},
				ExtractValues =
				{
					{
						Key = "RecallTime",
						ExtractAs = "TooltipRecall",
					}
				}
			},
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordParry" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			]]

			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "RemoveControlOnCharge",
				ChangeValue = "SwordWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "RemoveControlOnCharge2",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "RemoveControlOnCharge3",
				ChangeValue = "SwordWeapon3",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "RemoveControlOnCharge4",
				ChangeValue = "RangedWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "RemoveControlOnCharge5",
				ChangeValue = "SwordWeaponDash",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "AddControlOnFire2",
				ChangeValue = "RangedWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "AddControlOnChargeCancel",
				ChangeValue = "SwordWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				TraitName = "SwordHeavySecondStrikeTrait",
				WeaponNames = { "SwordParry" },
				WeaponProperty = "AddControlOnChargeCancel",
				ChangeValue = "SwordWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "AddControlOnChargeCancel2",
				ChangeValue = "RangedWeapon",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "AcceptTriggerLockRequests",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "ClearFireRequestOnSwap",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "LockTriggerTransferFromOnSwap",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "SwordParry" },
				WeaponProperty = "IgnoreTriggerLockDuringCooldown",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},

			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordBlinkTraitDefense",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "SwordParry" },
				EffectName= "SwordBlinkTraitDefense",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = { "SwordParry" },
				EffectName = "SwordBlinkTraitDefense",
				EffectProperty = "Duration",
				ChangeValue = 0.8,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
					DecimalPlaces = 2,
				}
			},
		}
	},

	BowTransitionTapFireTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_05",
		RequiredWeapon = "BowWeapon",
		PreEquipWeapons = { "BowWeapon2" },
		RequiredFalseTraits = { "BowTapFireTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon2" },
				WeaponProperty = "ClipSize",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipAmount"
				}
			},
			{
				WeaponName = "BowWeapon2",
				ProjectileName = "BowWeapon2",
				ProjectileProperty = "DamageLow",
				BaseMin = 50,
				BaseMax = 50,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "BowWeapon2",
				ProjectileName = "BowWeapon2",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "SwapOnFire",
				ChangeValue = "BowWeapon2",
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ClearFireRequestOnSwap",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "LockTriggerTransferFromOnSwap",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceMaxChargeRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true
			},
		},
	},
	-- Combo Traits
	AutoRetaliateTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "AutoRetaliateTrait",
		Icon = "Zeus_Ares_01",
		SetupFunction =
		{
			Name = "AutoRetaliateSetup",
			Args =
			{
				Range = 300,
				IntervalData = { Min = 3.0, Max = 3.0 },
			},
			RunOnce = true
		},
	},

	AresHomingTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTraits = { "AresHomingTrait", "StationaryRiftTrait", "ShieldLoadAmmoTrait" },
		Icon = "Artemis_Ares_01",
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxAdjustRate",
				BaseValue = 15,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipSeekPower",
					Format = "SeekDuration",
					BaseName = "AresProjectile",
					DecimalPlaces = 1,
				}
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxAdjustRate",
				BaseValue = 15,
				ChangeType = "Add",
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Speed",
				BaseValue = 15,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "Speed",
				BaseValue = 15,
				ChangeType = "Add",
			},
		}
	},

	CurseSickTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Ares_Aphrodite_01",
		RequiredFalseTrait = "CurseSickTrait",
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue = "ReduceDamageOutput",
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue  = "ReduceDamageOutput",
            },
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue  = "ReduceDamageOutput",
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAlt",
				ChangeValue  = "ReduceDamageOutput",
			},
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				ChangeValue = 0.5,
				DeriveSource = "DeriveSource",
				ExtractValue =
				{
					ExtractAs = "TooltipMultiplier",
					Format = "Percent",
				}
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				DeriveValueFrom = "DeriveSource",
            },
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "RefreshOnExpireWithEffectAltMultiplier",
				ChangeValue  = "ReduceDamageOutput",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	ReboundingAthenaCastTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Athena_Zeus_01",
		RequiredFalseTrait = "ReboundingAthenaCastTrait",
		PropertyChanges =
		{
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "AllowRepeatedJumpHit",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MultipleUnitCollisions",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ExcludeLastHitThing",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "NumJumps",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipBounces",
				}
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ExpireWhenOutOfJumps",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "JumpRange",
				ChangeValue = 450,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "MaxSpeed",
				ChangeValue = 800,
				ChangeType = "Absolute",
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
		}
	},

	SlowProjectileTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "SlowProjectileTrait",
		Icon = "Dionysus_Athena_01",

		EnemyPropertyChanges =
		{
			{
				UnitProperty = "ProjectileSpeedMultiplier",
				BaseMin = 0.6,
				BaseMax = 0.6,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "ProjectileSpeedDecrease",
					Format = "NegativePercentDelta",
				}
			},
		}
	},

	TriggerCurseTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "TriggerCurseTrait",
		Icon = "Athena_Ares_01",
		AddOutgoingDamageModifiers =
		{
			TriggerEffectAddition = { BaseValue = 40 },
			TriggerEffectName = "DelayedDamage",
			ExtractValues =
			{
				{
					Key = "TriggerEffectAddition",
					ExtractAs = "TooltipDamageBonus",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "ShieldLoadAmmo_AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRetaliateTrait",
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "TriggerEffect",
				ChangeValue = "DelayedDamage",
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "ShieldLoadAmmo_AthenaRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRetaliateTrait",
				WeaponName = "MagicShieldRetaliate",
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				TraitName = "AthenaRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "ConsumeTriggerEffect",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
		},
	},

	ImprovedPomTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Aphrodite_Poseidon_01",
		RequiredFalseTrait = "ImprovedPomTrait",
		PomLevelBonus = 1
	},

	RaritySuperBoost =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Poseidon_01",
		RequiredFalseTrait = "RaritySuperBoost",
		ReplaceUpgradedRarityTable =
		{
			Common = "Epic",
			Rare = "Epic",
			Epic = "Heroic",
		},
		RarityBonus =
		{
			RareBonus = 0,
			EpicBonus = 1,
			LegendaryBonus = 0,
		},
	},

	LightningCloudTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "LightningCloudTrait",
		PreEquipWeapons = { "ZeusDionysusCloudStrike" },
		Icon = "Zeus_Dionysus_01",
		AmmoDeathWeapon =
		{
			ValidProjectileName = "DionysusLobProjectile",
			WeaponName = "ZeusDionysusCloudStrike",
			Interval = 0.85,
			Duration = 5,
			Range = 400,
		},
		PropertyChanges =
		{
			{
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageLow",
				BaseMin = 60,
				BaseMax = 60,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "ZeusDionysusCloudStrike",
				ProjectileName = "ZeusDionysusCloudStrike",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},

	CriticalBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Artemis_Zeus_01",
		RequiredFalseTrait = "CriticalBoltTrait",
		AddOnDamageWeapons = { "LightningStrikeCrit" },
		OnDamageWeaponProperties = { FireFromVictimLocation = true, CritOnly = true },
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageLow",
				BaseValue = 20,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeCrit",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	ImpactBoltTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "ImpactBoltTrait",
		Icon = "Poseidon_Zeus_01",
		OnImpactWeapons =
		{
			FireFromVictimLocation = true,
			RequireImpactMin = 1000,
			Weapon = "LightningStrikeImpact"
		},
		PropertyChanges =
		{
			{
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageLow",
				BaseValue = 40,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				}
			},
			{
				WeaponName = "LightningStrikeImpact",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			},
		}
	},

	ZeusReflectSparkTrait =
	{
		InheritFrom = { "SynergyTrait" },
		OnProjectileReflectWeapons = { "ZeusReflectChainLightning" },
		PropertyChanges =
		{
			{
				WeaponName = "ZeusReflectChainLightning",
				ProjectileProperty = "DamageLow",
				BaseMin = 35,
				BaseMax = 35,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				ChangeType = "Add",
			},
			{
				WeaponName = "ZeusReflectChainLightning",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	ArtemisReflectBuffTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "ArtemisReflectBuffTrait",
		Icon = "Artemis_Athena_01",
		OnProjectileReflectWeapons = { "ArtemisReflectBuff" },
		PropertyChanges =
		{
			{
				WeaponName = "ArtemisReflectBuff",
				EffectName = "ReflectCritChance",
				EffectProperty = "Duration",
				BaseValue = 2.0,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
			{
				WeaponName = "ArtemisReflectBuff",
				EffectName = "ReflectCritChance",
				EffectProperty = "CritAddition",
				BaseValue = 0.20,
				ExtractValue =
				{
					ExtractAs = "TooltipCriticalChance",
					Format = "Percent",
				}
			},
		}
	},

	PoseidonAphroditeTouchTrait =
	{
		InheritFrom = { "SynergyTrait" },
		PreEquipWeapons = { "PoseidonAphroditeTouchWeapon" },
		PropertyChanges =
		{
			{
				UnitProperty = "ContinuousWeapon",
				ChangeValue = "PoseidonAphroditeTouchWeapon",
				ChangeType = "Absolute"
			},
			{
				WeaponName = "PoseidonAphroditeTouchWeapon",
				ProjectileName = "PoseidonAphroditeTouchWeapon",
				ProjectileProperty = "DamageLow",
				BaseValue = 10,
				DepthMult = DepthDamageMultiplier,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "PoseidonAphroditeTouchWeapon",
				ProjectileName = "PoseidonAphroditeTouchWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	DionysusAphroditeStackIncreaseTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "DionysusAphroditeStackIncreaseTrait",
		Icon = "Dionysus_Aphrodite_01",
		PropertyChanges =
		{
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusRushTrait",
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				BaseValue = 3,
				ChangeType = "Add",
				AsInt = true,
				MinMultiplier = 0.335,
				ExtractValue =
				{
					ExtractAs = "TooltipStackBoost",
				},
				DeriveSource = "DeriveSource",
			},
			{
				TraitName = "DionysusWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "DionysusSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "DionysusShoutTrait",
				WeaponName = "DionysusShoutWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
			{
				TraitName = "AmmoFieldTrait",
				WeaponName = "DionysusAmmoWeapon",
				EffectName= "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
		},
		EnemyPropertyChanges =
		{
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "BoostMaxStacksByName",
				ChangeValue = "ReduceDamageOutput",
				ChangeType = "Absolute",
			},
			{
				TraitName = "DionysusSpreadTrait",
				WeaponName = "DionysusPlagueWeapon",
				EffectName = "DamageOverTime",
				EffectProperty = "BoostMaxStacks",
				DeriveValueFrom = "DeriveSource",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	HomingLaserTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTraits = { "SelfLaserTrait", "HomingLaserTrait", "MultiLaserTrait" },
		Icon = "Demeter_Artemis_01",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.1,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "DemeterRangedTrait",
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = true
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = math.rad(60)
			}
		},
	},

	PoseidonAresProjectileTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Poseidon_Ares_01",
		LinkedBaseWeapon = "RangedWeapon",
		RequiredFalseTraits = { "PoseidonAresProjectileTrait", "BlizzardOrbTrait", "ArtemisBonusProjectileTrait", "BowLoadAmmoTrait" },
		PropertyChanges =
		{

			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusCurseOfDrowningCast_Fire"	,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusCurseOfDrowningCast_Charge",
				ExcludeLinked = true,
			},
				--[[
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.02,
				ChangeType = "Absolute",
			},
						{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			]]
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusRangedWeapon_Fire",
				ChangeType = "Absolute",
			},
			
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},

			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			--]]
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "SetCompleteAngleOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "FollowOwner",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "CheckUnitImpact",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxDetonations",
				ChangeValue = 3,
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipExplosionCount",
				}
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.8,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 4.5,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.1,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "UseRadialImpact",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "ImpactVelocity",
				ChangeValue = 900,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "ImpactVelocityCap",
				ChangeValue = 900,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "PoseidonAresProjectile",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "CheckObstacleImpact",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "PoseidonProjectileImpact-AresDuo",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "FireFx",
				ChangeValue = "ProjectileFireRing-AresDuo",
				ChangeType = "Absolute",
			},
		},

	},
	DionysusNullifyProjectileTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Athena_01",
		RequiredFalseTrait = "DionysusNullifyProjectileTrait",
		PropertyChanges =
		{

			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = -80,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},

				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "DionysusField",
					BaseProperty = "DamageRadius",
				}
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "UseDetonationForProjectileDefense",
				ChangeValue = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DeflectProjectiles",
				ChangeValue = false,
			},
			{
				TraitName = "DionysusRangedTrait",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusField",
				ProjectileProperty = "Graphic",
				ChangeValue = "DionysusCloudB-Nullify",
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},
	TemporaryPoisonImmunityTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Athena_01",
		--RequiredFalseTrait = "PoisonImmunityTrait",
		SetupFunction =
		{
			Name = "AddEffectImmunities",
			Args =
			{
				EffectNames =
				{
					"StyxPoison",
				},
			},
			RunOnce = true,
		},
		ProcSound = "/Leftovers/SFX/PositiveTalismanProc_2",
		LowHealthThresholdText =
		{
			-- Display variable only, to change the data value change the value below under "LowHealthThreshold"
			Threshold = 0.3,
			Text = "Hint_PoisonImmunityTrait",
		},
		AddOutgoingDamageModifiers =
		{
			LowHealthThreshold = 0.3,
			LowHealthDamageOutputMultiplier =
			{
				BaseValue = 1.2,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "LowHealthDamageOutputMultiplier",
					ExtractAs = "TooltipBonus",
					Format = "PercentDelta",
				},
				{
					Key = "LowHealthThreshold",
					ExtractAs = "TooltipThreshold",
					Format = "Percent",
				},
			}
		},
		PropertyChanges =
		{


		},
	},

	StatusImmunityTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Poseidon_Athena_01",
		RequiredFalseTrait = "StatusImmunityTrait",
		AddIncomingDamageModifiers =
		{
			BossDamageMultiplier = 0.90,
			ExtractValues =
			{
				{
					Key = "BossDamageMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		},
		SetupFunction =
		{
			Name = "AddEffectImmunities",
			Args =
			{
				EffectNames =
				{
					--"StyxPoison",
					"ZagreusOnHitStun",
					"GraspingHands",
					"FreezeStun",
					"ZagreusDemeterSpeedPenalty",
					"ZagreusAphroditeStun",
				}
			},
			RunOnce = true,
		},
		PropertyChanges =
		{
			{
				UnitProperty = "ImmuneToStun",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				ThingProperty = "ImmuneToForce",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				LuaProperty = "DamagedAnimation",
				ChangeValue = nil,
				ChangeType = "Absolute",
			},
		},
	},

	PoisonTickRateTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Ares_01",
		RequiredFalseTrait = "PoisonTickRateTrait",

		PropertyChanges =
		{
		  {
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			ChangeValue = 0.35,
			ChangeType = "Absolute",
			DeriveSource = "DeriveSource",
			ExtractValue =
			{
				ExtractAs = "TooltipTickRate",
				DecimalPlaces = 2,
			}
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		EnemyPropertyChanges =
		{
		  {
			TraitName = "DionysusSpreadTrait",
			WeaponName = "DionysusPlagueWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "Cooldown",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipBaseTickRate",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Cooldown",
				DecimalPlaces = 1,
			}
		}
	},

	MultiLaserTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Aphrodite_Demeter_01",
		RequiredFalseTraits = { "MultiLaserTrait", "HomingLaserTrait" },
		PropertyChanges =
		{
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ExtractValue =
				{
					ExtractAs = "TooltipLasers",
				}
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(120)
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "AutoLock",
				ChangeValue = false
			}
		},
	},

	SelfLaserTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Aphrodite_Demeter_01",
		RequiredFalseTraits = { "SelfLaserTrait", "HomingLaserTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeapons = { "RangedTrait" },
			PlayerMultiplier = 0,

			ValidWeaponMultiplier =
			{
				BaseValue = 1.3,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "DemeterRangedTrait",
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			},
		},
		OnWeaponChargeFunctions =
		{
			ValidWeapons = { "RangedWeapon" },
			FunctionName = "LockRangedToPlayer",
			FunctionArgs = {},
		},
		PropertyChanges =
		{
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = math.rad(3600)
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "AffectsSelf",
				ChangeValue = true,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "IgnoreDodge",
				ChangeValue = true,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "ArcSize",
				ChangeValue = 90,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "DemeterRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "TotalFuse",
				BaseValue = 4,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
		},
	},

	StationaryRiftTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Ares_Demeter_01",
		RequiredFalseTraits = { "StationaryRiftTrait", "AresHomingTrait" },
		PropertyChanges =
		{
			{
				TraitName = "AresRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0.55,
				ChangeType = "Multiply",
			},
			{
				TraitName = "AresRangedTrait",
				WeaponName = "RangedWeapon",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponName = "RangedWeapon",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "AresRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "AresBladeSpinIn-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "AresBladeSpinIn-Demeter",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "ShieldLoadAmmo_AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "AresProjectile",
				ProjectileProperty = "DamageRadius",
				BaseValue = -23,
				ChangeType = "Add",
			},
			{
				TraitName = "AresRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileProperty = "DamageRadius",
				BaseValue = -23,
				ChangeType = "Add",
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentOfBase",
					BaseType = "Projectile",
					BaseName = "AresProjectile",
					BaseProperty = "DamageRadius",
				}
			},
			--[[
			{
				TraitName = "AresRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "BarrelLength",
				ChangeValue = 270,
			},
			{
				TraitName = "AresRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
			},
			]]
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
		}
	},

	NoLastStandRegenerationTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "NoLastStandRegenerationTrait",
		Icon = "Demeter_Athena_01",
		RequiredMinMaximumLastStands = 1,
		SetupFunction =
		{
			Name = "SetUpNoLastStandRegeneration",
			Args =
			{
				Amount = 1,
				Interval = 0.8,
				ExtractValues =
				{
					{
						Key = "Amount",
						ExtractAs = "TooltipHealAmount"
					},
					{
						Key = "Interval",
						ExtractAs = "TooltipInterval",
						DecimalPlaces = 1,
					},
				}
			},
			RunOnce = true
		},
	},

	PoisonCritVulnerabilityTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Dionysus_Artemis_01",
		RequiredFalseTrait = "PoisonCritVulnerabilityTrait",

		PropertyChanges =
		{
		  {
			TraitName = "DionysusRushTrait",
			WeaponNames = WeaponSets.HeroRushWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			ChangeValue = 0.015,
			ChangeType = "Absolute",
			DeriveSource = "DeriveSource",
			ExtractValue =
			{
				ExtractAs = "TooltipCritBonus",
				Format = "Percent",
				DecimalPlaces = 1,
			}
		  },
		  {
			TraitName = "DionysusWeaponTrait",
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusSecondaryTrait",
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			EffectName= "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "DionysusShoutTrait",
			WeaponName = "DionysusShoutWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			DeriveValueFrom = "DeriveSource",
		  },
		  {
			TraitName = "AmmoFieldTrait",
			WeaponName = "DionysusAmmoWeapon",
			EffectName= "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		EnemyPropertyChanges =
		{
		  {
			TraitName = "DionysusSpreadTrait",
			WeaponName = "DionysusPlagueWeapon",
			EffectName = "DamageOverTime",
			EffectProperty = "CritVulnerabilityAddition",
			DeriveValueFrom = "DeriveSource",
		  },
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipPoisonDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipPoisonStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DamageOverTime",
				BaseProperty = "MaxStacks",
			},
		}
	},

	RegeneratingCappedSuperTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTraits = { "RegeneratingCappedSuperTrait", "HadesShoutTrait" },
		RequiredSlottedTrait = "Shout",
		Icon = "Zeus_Aphrodite_01",
		SuperMeterCap = 25,
		SetupFunction =
		{
			Name = "SetUpSuperRegeneration",
			Args =
			{
				Amount = 1,
				Interval = 0.20,
				CapAnimation = "WrathBarRegenCap",
				ExtractValues =
				{
					{
						Key = "Amount",
						ExtractAs = "TooltipSuperAmount"
					},
					{
						Key = "Interval",
						ExtractAs = "TooltipInterval",
						DecimalPlaces = 1,
					},
				}
			},
		},
		ExtractValues =
		{
			{
				Key = "SuperMeterCap",
				ExtractAs = "TooltipCap"
			}
		}
	},

	IceStrikeArrayTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Demeter_Dionysus_01",
		RequiredFalseTraits = { "IceStrikeArrayTrait", "BlizzardOrbTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.3,
				SourceIsMultiplier = true,
			},
			RequiredTrait = "DionysusRangedTrait",
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		PropertyChanges =
		{
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "INSTANT",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.3,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "ManualAimingRequireValidLocation",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 100,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				WeaponProperty = "AutoLock",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				ProjectileName = "DionysusField",
				EffectName = "DemeterSlow",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ProjectileName = "DionysusField",
				ChangeValue = "DemeterIceStrikeIndicator",
				ExcludeLinked = true,
			},
			{
				TraitName = "DionysusRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Graphic",
				ProjectileName = "DionysusLobProjectile",
				ChangeValue = "DemeterPoseidonIceSpark",
				ExcludeLinked = true,
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipChillDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipChillPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "ElapsedTimeMultiplier",
				Format = "NegativePercentDelta"
			},
			{
				ExtractAs = "TooltipChillStacks",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "DemeterSlow",
				BaseProperty = "MaxStacks",
			},
			{
				ExtractAs = "TooltipCloudDuration",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "TotalFuse",
			},
			{
				ExtractAs = "TooltipCloudInterval",
				External = true,
				BaseType = "ProjectileBase",
				BaseName = "DionysusField",
				BaseProperty = "Fuse",
				DecimalPlaces = 2,
			}
		}
	},

	BlizzardOrbTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Poseidon_Demeter_01",
		RequiredFalseTraits = { "BlizzardOrbTrait", "PoseidonAresProjectileTrait", "IceStrikeArrayTrait", "ShieldLoadAmmoTrait" },
		PropertyChanges =
		{
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnType",
				ChangeValue = "PROJECTILE",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "IceSpark",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "SpawnCount",
				ChangeValue = 2,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.5,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "MaxAdjustRate",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "DamageRadius",
				ChangeValue = 100,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "UnlimitedUnitPenetration",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "IgnoreCoverageAngles",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				TraitName = "PoseidonRangedTrait",
				WeaponName = "RangedWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "RangedWeapon",
				ProjectileName = "IceSpark",
				ProjectileProperty = "DamageLow",
				BaseValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "RangedWeapon",
				ProjectileName = "IceSpark",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	JoltDurationTrait =
	{
		InheritFrom = { "SynergyTrait" },
		Icon = "Demeter_Zeus_01",
		RequiredFalseTrait = "JoltDurationTrait",

		PropertyChanges =
		{
			{
				TraitName = "ZeusWeaponTrait",
				WeaponName = "ChainLightning",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
			},
			{
				TraitName = "ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "ShieldLoadAmmo_ZeusRangedTrait",
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "ZeusSecondaryTrait",
				WeaponName = "LightningStrikeSecondary",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "ZeusRushTrait",
				WeaponName = "LightningDash",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "ZeusShoutTrait",
				WeaponName = "LightningStrikeX",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "CriticalBoltTrait",
				WeaponName = "LightningStrikeCrit",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "ImpactBoltTrait",
				WeaponName = "LightningStrikeImpact",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "RetaliateWeaponTrait",
				WeaponName = "LightningStrikeRetaliate",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "AmmoBoltTrait",
				WeaponName = "ZeusAmmoWeapon",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
			{
				TraitName = "LightningCloudTrait",
				WeaponName = "ZeusDionysusCloudStrike",
				EffectName = "ZeusAttackPenalty",
				EffectProperty = "Duration",
				DeriveValueFrom = "ZeusWeaponTrait"
			},
		},
	},

	HeartsickCritDamageTrait =
	{
		InheritFrom = { "SynergyTrait" },
		RequiredFalseTrait = "HeartsickCritDamageTrait",
		Icon = "Artemis_Aphrodite_01",
		AddOnEffectWeapons =
		{
			EffectName = "ReduceDamageOutput",
			Weapon = "HeartsickCritWeapon",
		},
		PropertyChanges =
		{
			{
				WeaponName = "HeartsickCritWeapon",
				EffectName = "HeartSickCritVulnerability",
				EffectProperty = "CritMultiplierVulnerabilityAddition",
				BaseValue = 1.5,
				ExtractValue =
				{
					ExtractAs = "TooltipVulnerability",
					Format = "PercentDelta",
				}
			},
		},
		ExtractValues =
		{
			{
				ExtractAs = "TooltipWeakDuration",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Duration",
			},
			{
				ExtractAs = "TooltipWeakPower",
				SkipAutoExtract = true,
				External = true,
				BaseType = "Effect",
				WeaponName = "SwordWeapon",
				BaseName = "ReduceDamageOutput",
				BaseProperty = "Modifier",
				Format = "NegativePercentDelta"
			}
		}
	},

	ChainCurseTrait =
	{
		InheritFrom = { "ShopTier1Trait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				BaseValue = 1,
				ChangeType = "Add",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipJumps",
				},
				DeriveSource = "JumpSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				DeriveValueFrom = "JumpSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				DeriveValueFrom = "JumpSource"
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "NumJumps",
				DeriveValueFrom = "JumpSource"
            },
			{
				TraitName = "AresRetaliateTrait",
				WeaponName = "AresRetaliate",
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				ChangeValue = 400,
				BaseMax = 400,
				AsInt = true,
				DeriveSource = "RangeSource",
			},
			{
				TraitName = "AresWeaponTrait",
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				DeriveValueFrom = "RangeSource"
			},
			{
				TraitName = "AresSecondaryTrait",
				WeaponNames = WeaponSets.HeroSecondaryWeapons,
				EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				DeriveValueFrom = "RangeSource"
			},
            {
                TraitName = "ShieldLoadAmmo_AresRangedTrait",
                WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                EffectName = "DelayedDamage",
				EffectProperty = "JumpRange",
				DeriveValueFrom = "RangeSource"
            },
		},
	},

	-- Weapon Enchantments
	FistBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Fist01",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "FistBaseUpgradeTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.000,
				MaxMultiplier = 1.000,
			},
			Rare =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{	
			--[[
			{
				WeaponNames = { "FistWeapon", "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.95,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
			},
			]]
			{
				LifeProperty = "DodgeChance",
				BaseValue = 0.05,
				ChangeType = "Add",
				DataValue = false,
				ExtractValue =
				{
					ExtractAs = "TooltipChance",
					Format = "Percent"
				},
			},
		}
	},

	FistWeaveTrait =
	{
		Icon = "WeaponEnchantment_Fist02",
		CustomTrayText = "FistWeaveTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt01FlashKick_ReturnToIdle",
		PostWeaponUpgradeScreenAngle = 208,
		RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
		RequiredFalseTrait = "FistWeaveTrait",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		BonusSpecialHits = {
			BaseValue = 1,
		},
		ExtractValues =
		{
			{
                Key = "BonusSpecialHits",
                ExtractAs = "TooltipHits",
            },
		},
		WeaponBinks =
		{
			"ZagreusFistAlt01Idle_Bink",
			"ZagreusFistAlt01Run_Bink",
			"ZagreusFistAlt01RunStop_Bink",
			"ZagreusFistAlt01FlurryPunch_Bink",
			"ZagreusFistAlt01FlashKick_Bink",
			"ZagreusFistAlt01Grab_Bink",
			"ZagreusFistAlt01AerialUpperCut_Bink",
			"ZagreusFistAlt01DashUpperCut_Bink",
			"ZagreusFistAlt01DashHayMaker_Bink",
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				WeaponBinks =
				{
					"ZagreusFistAlt01Idle_Bink",
					"ZagreusFistAlt01Run_Bink",
					"ZagreusFistAlt01RunStop_Bink",
					"ZagreusFistAlt01FlurryPunch_Bink",
					"ZagreusFistAlt01FlashKick_Bink",
					"ZagreusFistAlt01Grab_Bink",
					"ZagreusFistAlt01AerialUpperCut_Bink",
					"ZagreusFistAlt01DashUpperCut_Bink",
					"ZagreusFistAlt01DashHayMaker_Bink",
				}
			},

			FistWeaponSpecial =
			{
				HitSimSlowCooldown = 0.02,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
					--{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
				},

			},

			FistWeaponSpecialDash =
			{
				HitSimSlowCooldown = 0.02,
				HitSimSlowParameters =
				{

					{ ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
					--{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire4",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Charge5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlurryPunch_Fire5",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01DashHayMaker_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01DashHayMaker_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01AerialUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01AerialUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01DashUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01DashUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01FlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01FlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01Grab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01DashHayMaker_Fire",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt01Grab_Start",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt01Grab_Fire",
				ChangeType = "Absolute",
			},
		},
	},

	FistDetonateTrait = 
	{
		Icon = "WeaponEnchantment_Fist04",
		CustomTrayText = "FistDetonateTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Epic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Heroic =
			{
				MinMultiplier = 3.25,
				MaxMultiplier = 3.25,
			},
			Legendary =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
		},
		PostWeaponUpgradeScreenAnimation = "ZagreusFistAlt03FlashKick_ReturnToIdle",
		PostWeaponUpgradeScreenAngle = 208,
		RequiredWeapons = { "FistWeapon", "FistWeaponSpecial" },
		RequiredFalseTrait = "FistWeaveTrait",
		PreEquipWeapons = {"RushRuptureWeapon", "FistDetonationWeapon", "MarkRuptureApplicator"},
		WeaponBinks =
		{
			"ZagreusFistAlt03Idle_Bink",
			"ZagreusFistAlt03ClawL_Bink",
			"ZagreusFistAlt03ClawR_Bink",
			"ZagreusFistAlt03AerialUpperCut_Bink",
			"ZagreusFistAlt03DashAttack_Bink",
			"ZagreusFistAlt03Dash_Bink",
			"ZagreusFistAlt03Run_Bink",
			"ZagreusFistAlt03RunStop_Bink",
			"ZagreusFistAlt03FlashKick_Bink",
			"ZagreusFistAlt03Grab_Bink",
			"ZagreusFistAlt03DashUpperCut_Bink",
			"ZagreusFistAlt03DashUpperClaw_Bink",
		},
		WeaponDataOverride =
		{
			FistWeapon =
			{
				WeaponBinks =
				{
					"ZagreusFistAlt03Idle_Bink",
					"ZagreusFistAlt03ClawL_Bink",
					"ZagreusFistAlt03ClawR_Bink",
					"ZagreusFistAlt03AerialUpperCut_Bink",
					"ZagreusFistAlt03DashAttack_Bink",
					"ZagreusFistAlt03Dash_Bink",
					"ZagreusFistAlt03Run_Bink",
					"ZagreusFistAlt03RunStop_Bink",
					"ZagreusFistAlt03FlashKick_Bink",
					"ZagreusFistAlt03Grab_Bink",
					"ZagreusFistAlt03DashUpperCut_Bink",
					"ZagreusFistAlt03DashUpperClaw_Bink",
				},

				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			FistWeapon2 =
			{	
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
				},
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			FistWeapon3 =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.70, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			FistWeapon4 =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
						{ Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},

			FistWeapon5 =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					{ ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
						{ Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},

				},

			},

			FistWeaponSpecial =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistSpecial" },
						{ Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
					},
					ImpactSounds =
					{
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactBig",
						Brick = "/SFX/FistImpactBig",
						Stone = "/SFX/FistImpactBig",
						Organic = "/SFX/FistImpactBig",
						StoneObstacle = "/SFX/FistImpactSmall",
						BrickObstacle = "/SFX/FistImpactSmall",
						MetalObstacle = "/SFX/FistImpactSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			FistWeaponDash =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			FistWeaponSpecialDash =
			{
				HitSimSlowCooldown = 0.2,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.02, LerpTime = 0.0 },
					{ ScreenPreWait = 0.06, Fraction = 0.10, LerpTime = 0.03 },
					{ ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.1 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashUpper" },
						{ Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
						{ Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/MetalBoneSmash",
						Brick = "/SFX/MetalStoneClang",
						Stone = "/SFX/MetalStoneClang",
						Organic = "/SFX/StabSplatterSmall",
						StoneObstacle = "/SFX/SwordWallHitClank",
						BrickObstacle = "/SFX/SwordWallHitClank",
						MetalObstacle = "/SFX/SwordWallHitClank",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},

			RushWeapon =
			{
				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist1" },
						{ Name = "/SFX/Enemy Sounds/Exalted/ExaltedDash" },
					},
				},
			},

		},
		OnEnemyDamagedFunction = 
		{
			Name = "CheckFistDetonation",
		},
        AddOutgoingDamageModifiers =
        {
			-- Somewhat hacky but ensures detonateion isn't boosted by own status effect @alice
            ValidWeaponMultiplier = 0.75,
			Additive = true,
            ValidEffects = { "FistDetonationDamage" },
        },
		PropertyChanges =
		{
			-- FistDetonationWeapon
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "FistDetonationDamage",
				EffectProperty = "Amount",
				BaseValue = 100,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "MarkRuptureTarget",
				EffectProperty = "Modifier",
				ChangeValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageBonus",
					Format = "Percent",
				},
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "DetonationDamageTaken",
				EffectProperty = "Modifier",
				ChangeValue = 0.25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageTaken",
					Format = "Percent",			
				},
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "MarkRuptureTarget",
				EffectProperty = "Duration",
				ChangeValue = 4,
				ChangeType = "Absolute",
				ExtractDuration = "ExtractDuration",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				},
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "DetonationSlow",
				EffectProperty = "Duration",
				DeriveValueFrom = "ExtractDuration"
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "FistDetonationDamage",
				EffectProperty = "Duration",
				DeriveValueFrom = "ExtractDuration"
			},
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "DetonationDamageTaken",
				EffectProperty = "Duration",
				DeriveValueFrom = "ExtractDuration"
			},
			-- Dash Weapon Changes
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "WeaponRange",
				ChangeValue = 0.75,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipSize",
				ChangeValue = 2,
				ChangeType = "Add",
				ExcludeLinked = true,
				{
					ExtractAs = "TooltipBonusDashes",
				}
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "ClipRegenInterval",
				ChangeValue = 1.2,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "BlinkDuration",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "IgnoreTriggerLockDuringCooldown",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				WeaponProperty = "Cooldown",
				ChangeValue = 0.17,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponInvulnerable",
				EffectProperty = "Duration",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponImmuneToForce",
				EffectProperty = "Duration",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableMove",
				EffectProperty = "Duration",
				ChangeValue = 0.8,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSelfGrip",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponSelfSlow",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				EffectName = "RushWeaponDisableRotation",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageLow",
				ChangeValue = 0,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroRushWeapons,
				ProjectileProperty = "DamageHigh",
				ChangeValue = 0,
				ChangeType = "Add",
				ExcludeLinked = true,
			},

			-- Gilgamesh Dash
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03DashNoCollide",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "RushWeapon" },
				WeaponProperty = "UnblockedBlinkFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Gilgamesh Attack
			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				WeaponProperty = "Projectile",
				ChangeValue = "FistWeaponClawL",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				WeaponProperty = "Projectile",
				ChangeValue = "FistWeaponClawR",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03ClawL_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03ClawL_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03ClawR_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03ClawR_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "ControlWindow",
				ChangeValue = 0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.21,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon2", },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.14,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon3", },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.14,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon4" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon5" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.12,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisable",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistDisableAndLockTrigger",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisable2",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistDisableAndLockTrigger2",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistDisable3",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistDisableAndLockTrigger3",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistDisable4",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistDisableAndLockTrigger4",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon5" },
				EffectName = "FistDisable5",
				EffectProperty = "Duration",
				ChangeValue = 3.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeapon5" },
				EffectName = "FistDetonateMoveDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSelfSlowFire",
				EffectProperty = "Modifier",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSlowCharge",
				EffectProperty = "Modifier",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSlowCharge",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon" },
				EffectName = "FistSelfSelfSlowFire",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistSwordSelfSlowFire2",
				EffectProperty = "Modifier",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistSelfSlowCharge2",
				EffectProperty = "Modifier",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistSelfSlowCharge2",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2" },
				EffectName = "FistSwordSelfSlowFire2",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistSwordSelfSlowFire3",
				EffectProperty = "Modifier",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistSelfSlowCharge3",
				EffectProperty = "Modifier",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistSelfSlowCharge3",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon3" },
				EffectName = "FistSwordSelfSlowFire3",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistSwordSelfSlowFire4",
				EffectProperty = "Modifier",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistSelfSlowCharge4",
				EffectProperty = "Modifier",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistSelfSlowCharge4",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon4" },
				EffectName = "FistSwordSelfSlowFire4",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = true,
				ChangeType = "Aboslute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = true,
				ChangeType = "Aboslute",
				ExcludeLinked = true,
			},
			]]


			{
				WeaponNames = { "FistWeapon", "FistWeapon3", "FistWeapon5" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipe",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeapon2", "FistWeapon4" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeFlipped",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Gilgamesh Dash Attack
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "Projectile",
				ChangeValue = "FistWeaponClawDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03DashAttack_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				EffectName = "FistDashDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				EffectName = "FistDashDisable3",
				EffectProperty = "Duration",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				EffectName = "FistDashDisable",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				EffectName = "FistDashDisable3",
				EffectProperty = "RequestTriggerLock",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponDashClaw" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "FistWeaponClawDash" },
				ProjectileProperty = "StartFx",
				ChangeValue = "ClawSwipeFlippedDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},			

			-- Gilgamesh Special

			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03AerialUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03AerialUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercut",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 1.23,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 1.68,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecial" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 1.68,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			]]

			-- Gilgamesh Dash Special

			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.17,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03DashUpperCut_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03DashUpperCut_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecialDash" },
				EffectName = "FistSpecialDashDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				EffectName = "FistSpecialDashDisable2",
				EffectProperty = "Duration",
				ChangeValue = 1.4,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				EffectName = "FistSpecialDashDisable3",
				EffectProperty = "Duration",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt03FlashKick_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistTeleportSpecialTrait",
				WeaponNames = { "FistWeaponSpecial", "FistWeaponSpecialDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03FlashKick_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				TraitName = "FistSpecialFireballTrait",
				WeaponNames = { "FistWeaponSpecial" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt03Grab_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "FistWeaponSpecialDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "ClawSwipeUppercutSpecial",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "FistWeaponSpecialDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			]]

			--[[
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02DashHayMaker_Fire",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusFistAlt02Grab_Start",
				ChangeType = "Absolute",
			},
			{
				TraitName = "FistHeavyAttackTrait",
				WeaponName = "FistWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusFistAlt02Grab_Fire",
				ChangeType = "Absolute",
			},
			]]

		}
	},


	FistDetonateBoostTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Fist_17",
		RequiredWeapon = "FistWeapon",
		RequiredTrait = "FistDetonateTrait",
        AddOutgoingDamageModifiers =
        {
			-- Somewhat hacky but ensures detonateion isn't boosted by own status effect @alice
            ValidWeaponMultiplier = 0.75,
			Additive = true,
            ValidEffects = { "FistDetonationDamage" },
        },
		PropertyChanges =
		{
			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "DetonationSlow",
				EffectProperty = "Modifier",
				ChangeValue = -0.3,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipSlowBonus",
					Format = "Percent",
					AbsoluteValue = true				
				},
			},

			{
				WeaponName = "FistDetonationWeapon",
				EffectName = "DetonationDamageTaken",
				EffectProperty = "Modifier",
				ChangeValue = 0.25,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",			
				},
			},
		},
		-- Dummy values for extraction
		ExtractDamageBonus = 0.5,
		ExtractDamageTaken = 0.25,
		ExtractDuration = 4,
		ExtractValues = 
		{
			{
				Key = "ExtractDamageBonus",
				ExtractAs = "TooltipDamageBonus",
				Format = "Percent"
			},
			{
				Key = "ExtractDamageTaken",
				ExtractAs = "TooltipDamageTaken",
				Format = "Percent"
			},
			{
				Key = "ExtractDuration",
				ExtractAs = "TooltipDuration",
			}
		}
	},


	SwordBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Sword01",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "SwordBaseUpgradeTrait_Tray",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3" },
				WeaponProperty = "ChargeTime",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableHeavy",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "SwordWeapon" },
				EffectName = "SwordDisableCancelableAndLockTrigger",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon2" },
				EffectName = "SwordDisableCancelableAndLockTrigger2",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisable3",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SwordWeapon3" },
				EffectName = "SwordDisableAttackCancelable3",
				EffectProperty = "Duration",
				BaseValue = 0.97,
				SourceIsMultiplier = true,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				UnitProperty = "Speed",
				BaseValue = 1.03,
				ChangeType = "Multiply",
				SourceIsMultiplier = true,
			},
		},
		ExtractEntry =
		{
			BaseValue = 0.97,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "ExtractEntry",
				DecimalPlaces = 2,
				Format = "NegativePercentDelta",
				ExtractAs = "TooltipSpeed",
			},
		}
	},
	BowBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Bow01",
		CustomTrayText = "BowBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},

		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "CriticalHitChance",
				BaseMin = 0.02,
				BaseMax = 0.02,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCritChance",
					Format = "Percent",
				}
			},


		},
	},
	SpearBaseUpgradeTrait =
      {
            Icon = "WeaponEnchantment_Spear01",
            CustomTrayText = "SpearBaseUpgradeTrait_Tray",
            InheritFrom = { "WeaponEnchantmentTrait" },
            RarityLevels =
            {
                  Common =
                  {
                        MinMultiplier = 1.00,
                        MaxMultiplier = 1.00,
                  },
                  Rare =
                  {
                        MinMultiplier = 1.375,
                        MaxMultiplier = 1.375,
                  },
                  Epic =
                  {
                        MinMultiplier = 1.75,
                        MaxMultiplier = 1.75,
                  },
                  Heroic =
                  {
                        MinMultiplier = 2.125,
                        MaxMultiplier = 2.125,
                  },
                  Legendary =
                  {
                        MinMultiplier = 2.5,
                        MaxMultiplier = 2.5,
                  },
            },
            AddOutgoingDamageModifiers =
            {
                  ValidWeaponMultiplier =
                  {
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                  },
                  ValidWeapons = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                  ExtractValues =
                  {
                        {
                              Key = "ValidWeaponMultiplier",
                              ExtractAs = "TooltipDamage",
                              Format = "PercentDelta",
                        },
                  }
            },
            PropertyChanges =
            {
                  {
                        WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                        ProjectileProperty = "Range",
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                        ChangeType = "MultiplyBase",
                        ExcludeLinked = true,
                  },
                  {
                        WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                        ProjectileProperty = "Speed",
                        BaseValue = 1.1,
                        SourceIsMultiplier = true,
                        ChangeType = "MultiplyBase",
                        ExcludeLinked = true,
                  },
                  {
                        WeaponNames = { "SpearWeaponThrowReturn", "SpearWeaponThrow" },
                        WeaponProperty = "ChargeTime",
                        BaseValue = 0.9,
                        SourceIsMultiplier = true,
                        ChangeType = "Multiply",
                        ExcludeLinked = true,
                  },
            },
      },
	ShieldBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Shield01",
		CustomTrayText = "ShieldBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Epic =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
			Heroic =
			{
				MinMultiplier = 4.0,
				MaxMultiplier = 4.0,
			},
			Legendary =
			{
				MinMultiplier = 5.0,
				MaxMultiplier = 5.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageLow",
				BaseValue = 3,
				ChangeType = "Add",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "ShieldWeapon", "ShieldWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
		--[[
		AddIncomingDamageModifiers =
		{
			GlobalMultiplier =
			{
				BaseValue = 0.95,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "GlobalMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
		]]
	},
	GunBaseUpgradeTrait =
	{
		Icon = "WeaponEnchantment_Gun01",
		CustomTrayText = "GunBaseUpgradeTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon" },
				WeaponProperty = "MaxAmmo",
				BaseValue = 4,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
					--Format = "PercentDelta",
				}
			},
		},
	},

	DislodgeAmmoTrait =
	{
		Icon = "WeaponEnchantment_Sword02",
		CustomTrayText = "DislodgeAmmoTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSwordAlt02Attack2_ReturnToIdle_Loop",
		RequiredWeapon = "SwordWeapon",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseValue = 1.20,
				SourceIsMultiplier = true,
			},
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
		DislodgeAmmoProperties =
		{
			ValidWeapons = { "SwordParry" },
			ForceMin = 300,
			ForceMax = 420
		},
		DroppedAmmoForceMultiplier = 5,
		WeaponBinks =
		{
			"ZagreusSword02_Bink",
			"ZagreusSword02ReturnToIdle_Bink",
			"ZagreusSword02DashAttack_Bink",
			"ZagreusSword02Run_Bink",
			"ZagreusSword02RunStop_Bink",
			"ZagreusSword02Parry_Bink"
		},
		WeaponDataOverride =
		{
			SwordWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSword02_Bink",
					"ZagreusSword02ReturnToIdle_Bink",
					"ZagreusSword02DashAttack_Bink",
					"ZagreusSword02Run_Bink",
					"ZagreusSword02RunStop_Bink",
					"ZagreusSword02Parry_Bink"
				},
			},
			RangedWeapon =
			{
				NotReadyAmmoInEnemyText = "RetrieveAmmoOrDislodgeFromEnemy",
			}
		},
		PropertyChanges =
		{
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02ParryFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordParry",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSwordAlt02ParryCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SwordWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSwordAlt02DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	SwordAmmoWaveTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.2,
				MaxMultiplier = 1.2,
			},
			Epic =
			{
				MinMultiplier = 1.4,
				MaxMultiplier = 1.4,
			},
			Heroic =
			{
				MinMultiplier = 1.6,
				MaxMultiplier = 1.6,
			},
			Legendary =
			{
				MinMultiplier = 1.8,
				MaxMultiplier = 1.8,
			},
		},
		Icon = "Weapon_Sword_03",
		PreEquipWeapons = { "AmmoWaveEffectApplicator" },
		StoredAmmoWaveWeapon =
		{
			Name = "SwordWeaponWave",
			ValidWeaponNames = { "SwordWeapon", "SwordWeapon2", "SwordWeapon3", "SwordWeaponDash" },
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SwordWeaponWave" },
				ProjectileProperty = "DamageLow",
				BaseValue = 30,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SwordWeaponWave" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		},
	},

	GunManualReloadTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "GunManualReloadTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusGunAlt01ReloadEnd",
		RequiredWeapon = "GunWeapon",
		PostWeaponUpgradeScreenAngle = 210,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.5,
				MaxMultiplier = 1.5,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Legendary =
			{
				MinMultiplier = 3.0,
				MaxMultiplier = 3.0,
			},
		},
		Icon = "WeaponEnchantment_Gun03",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "ManualReloadEffectApplicator", "SniperGunWeapon", "SniperGunWeaponDash" },

		WeaponBinks =
		{
			"ZagreusGun01_Bink",
			"ZagreusGun01Run_Bink",
			"ZagreusGun01GrenadeToss_Bink",
			"ZagreusGun01Stop_Bink",
			"ZagreusGun01FireEmpty_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				IdleReloadAnimation = "ZagreusGunAlt01ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt01RunReload",
				WeaponBinks =
				{
					"ZagreusGun01_Bink",
					"ZagreusGun01Run_Bink",
					"ZagreusGun01GrenadeToss_Bink",
					"ZagreusGun01Stop_Bink",
					"ZagreusGun01FireEmpty_Bink",
				}
			},
			GunWeaponDash =
			{
				IdleReloadAnimation = "ZagreusGunAlt01ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt01RunReload",
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			{
				WeaponNames = { "SniperGunWeapon", "SniperGunWeaponDash" },
				WeaponProperty = "Enabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},

			--[[
			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeapon", "SniperGunWeapon" },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt01FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			--[[
			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "PreFireAnimation",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunWeaponDash", "SniperGunWeaponDash" },
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunAlt01FireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},


			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunAlt01GrenadeTossCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunAlt01GrenadeTossFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	GunLoadedGrenadeTrait =
	{
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "GunLoadedGrenadeTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusGunLuciferReload_End",
		PostWeaponUpgradeScreenAngle = 210,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
			Epic =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Heroic =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Legendary =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
		},
		Icon = "WeaponEnchantment_Gun04",
		RequiredWeapon = "GunWeapon",
		PreEquipWeapons = { "GunBombWeapon", "GunBombImmolation" },
		--InfiniteAmmo = true,
		WeaponBinks =
		{
			"ZagreusGunLucifer_Bink",
			"ZagreusGunLuciferIdle_Bink",
			"ZagreusGunLuciferRun_Bink",
			"ZagreusGunLuciferStop_Bink",
			"ZagreusGunLuciferFireEmpty_Bink",
			"ZagreusGunLuciferGrenadeToss_Bink",
		},
		WeaponDataOverride =
		{
			GunWeapon =
			{
				CancelUnitHitFlash = true,
				RapidDamageType = true,
				CancelUnitShake = true,
				CancelArmorUnitShake = true,
				CancelArmorSpark = true,
				DashWeapon = nil,
				IdleReloadAnimation = "ZagreusGunLuciferReload_Start",
				MovingReloadAnimation = "ZagreusGunLuciferRunReload",
				WeaponBinks =
				{
					"ZagreusGunLucifer_Bink",
					"ZagreusGunLuciferIdle_Bink",
					"ZagreusGunLuciferRun_Bink",
					"ZagreusGunLuciferStop_Bink",
					"ZagreusGunLuciferFireEmpty_Bink",
					"ZagreusGunLuciferGrenadeToss_Bink",
				},

				Sounds =
				{
					FireSounds =
					{
					--	{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunFire" },
					--	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
					},
					LowAmmoFireSounds =
					{
					--	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
					--	{ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/BurnDamage",
						Armored = "/SFX/BurnDamage",
						Bone = "/SFX/BurnDamage",
						Brick = "/SFX/BurnDamage",
						Stone = "/SFX/BurnDamage",
						Organic = "/SFX/BurnDamage",
						StoneObstacle = "/SFX/BurnDamage",
						BrickObstacle = "/SFX/BurnDamage",
						MetalObstacle = "/SFX/BurnDamage",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
			GunGrenadeToss =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunCharge" },
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunLob" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			}
		},
		PropertyChanges =
		{
		-- move and fire properties
		--[[
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisable",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellable",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunSelfSpeed",
				EffectProperty = "DisableMove",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunSelfHalt",
				EffectProperty = "HaltOnEnd",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			-- laser properties
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ClearWeaponBonusesOnHit",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ProjectileDefenseRadius",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ArcSize",
				ChangeValue = 100,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "RefreshProjectileOnFire",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "RushWeapon",
				EffectName = "RushWeaponInvulnerable",
				EffectProperty = "ClearOnAttack",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "SkipFireCancelIfFiring",
				ChangeValue = "true",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AutoAdjustForTarget",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachToOwner",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Speed",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "Scatter",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ScatterCap",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ImmunityDuration",
				ChangeValue = 0.05,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DrawAsBeam",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "BarrelLength",
				ChangeValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunLucifer_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunLucifer_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireEndGraphic",
				ChangeValue = "ZagreusGunLucifer_ReturnToIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FailedToFireCooldownAnimation",
				ChangeValue = "ZagreusGunLuciferFireEmpty",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "OnlyChargeOnce",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "FireFx",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamageLow",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamageHigh",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.6,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 0.75,
				--ChangeValue = 0.45,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipAmmo",
				},
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Range",
				ChangeValue = 0.975,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "AutoLockRange",
				ChangeValue = 0.975,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableLucifer",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				EffectName = "GunDisableCancellableLucifer",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[]]
			{
				WeaponName = "RushWeapon",
				EffectName = "RushWeaponInvulnerable",
				EffectProperty = "ClearOnAttack",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- rapid fire trait stabilizers
			
			{
				WeaponName = "ArtemisLegendary",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "LightningStrikeImpact",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChainLightning",
				WeaponProperty = "Cooldown",
				ChangeValue = 0.25,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- bomb properties
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageLow",
				BaseValue = 50,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
				DeriveBombSource = "DeriveBombSource",
			},
			{
				WeaponNames = { "GunBombWeapon" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveBombSource",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipImmolationDamage",
				},
				DeriveImmolationSource = "DeriveImmolationSource"
			},
			{
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveImmolationSource",
				ExcludeLinked = true,
			},
			-- change arc to drop a bomb instead of explode
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnCap",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "FizzleOldSpawnsOnDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageLow",
				BaseValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				DeriveSource = "DeriveSource"
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageRadius",
				BaseValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DeriveSource",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "HideDetonateGraphic",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "DetonateSound",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnsInheritGroups",
				ChangeValue = false,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SkipSpawnsIfBlocked",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnGroup",
				ChangeValue = "Standing",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnType",
				ChangeValue = "UNIT",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SkipSpawnsIfBlocked",
				ChangeValue = "false",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "SpawnOnDetonate",
				ChangeValue = "GunBombUnit",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusGunLuciferGrenadeTossCharge",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "GunGrenadeToss" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusGunLuciferGrenadeTossFire",
				ExcludeLinked = true,
			},

			-- laser vfx

			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "GunLaser",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "BeamStartAnimSkipsImpact",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "GunLaserOriginFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "TipFx",
				ChangeValue = "GunLaserTipFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "GunCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "GunWeapon",
				ProjectileProperty = "DissipateGraphic",
				ChangeValue = "GunLaserEnd",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- bomb vfx

			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "Graphic",
				ChangeValue = "GunGrenadeLuciferOrb",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "GunGrenadeToss" },
				ProjectileProperty = "GroupName",
				ChangeValue = "FX_Standing_Add",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
	},

	GunLoadedGrenadeBoostTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_Lucifer_01",
		RequiredWeapon = "GunWeapon",
		RequiredTrait = "GunLoadedGrenadeTrait",
		PropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.50,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipAoE",
					Format = "PercentDelta",
				},
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 2.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent",
				},
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunBombImmolation" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
		},
	},

	GunLoadedGrenadeLaserTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_Lucifer_04",
		RequiredWeapon = "GunWeapon",
		RequiredTrait = "GunLoadedGrenadeTrait",
		RequiredFalseTraits = { "GunLoadedGrenadeInfiniteAmmoTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "GunLoadedGrenadeTrait",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 0.75,
				ChangeType = "Add",
				ExcludeLinked = true,
				DeriveSource = "DamageSource",
			},
		},
		DamageIncrease = 0.75/0.75,
		ExtractValues =
		{
			{
				Key = "DamageIncrease",
				ExtractAs = "TooltipDamageIncrease",
				Format = "Percent"
			}
		}
	},

	GunLoadedGrenadeSpeedTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_Lucifer_05",
		RequiredWeapon = "GunWeapon",
		RequiredTrait = "GunLoadedGrenadeTrait",
		--RequiredFalseTraits = { "GunLoadedGrenadeInfiniteAmmoTrait" },
		PropertyChanges =
		{
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "GunLoadedGrenadeTrait",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.50,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipSpeedIncrease",
					Format = "NegativePercentDelta",
				},
			},
			--[[
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "GunLoadedGrenadeTrait",
				ProjectileProperty = "Fuse",
				ChangeValue = 0.80,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "GunWeapon", "GunWeaponDash" },
				TraitName = "GunLoadedGrenadeTrait",
				ProjectileProperty = "Range",
				ChangeValue = 1.15,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipRange",
					Format = "PercentDelta",
				},
			},
		},
	},

	GunLoadedGrenadeWideTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_Lucifer_02",
		RequiredWeapon = "GunWeapon",
		RequiredTrait = "GunLoadedGrenadeTrait",
		PropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash"},
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipBeams",
				},
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponNames = { "GunWeapon", "GunWeaponDash"},
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(35),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
	},

	GunLoadedGrenadeInfiniteAmmoTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Gun_Lucifer_03",
		RequiredWeapon = "GunWeapon",
		RequiredTrait = "GunLoadedGrenadeTrait",
		RequiredFalseTraits = { "GunLoadedGrenadeLaserTrait" },
		WeaponDataOverride =
		{
			GunWeapon =
			{
				LowAmmoSoundThreshold = -1,
			},
			GunWeaponDash =
			{
				LowAmmoSoundThreshold = -1,
			},
		},
		PropertyChanges =
		{
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				WeaponProperty = "MaxAmmo",
				ChangeValue = -1,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				TraitName = "GunLoadedGrenadeTrait",
				WeaponName = "GunWeapon",
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
		},
	},

	BowMarkHomingTrait =
	{
		Icon = "WeaponEnchantment_Bow02",
		InheritFrom = { "WeaponEnchantmentTrait" },
		CustomTrayText = "BowMarkHomingTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusBowAlt01DashFireEndLoop",
		PostWeaponUpgradeScreenAngle = 205,
		RequiredWeapon = "BowWeapon",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 4/5,
				MaxMultiplier = 4/5,
			},
			Epic =
			{
				MinMultiplier = 3/5,
				MaxMultiplier = 3/5,
			},
			Heroic =
			{
				MinMultiplier = 2/5,
				MaxMultiplier = 2/5,
			},
			Legendary =
			{
				MinMultiplier = 1/5,
				MaxMultiplier = 1/5,
			},
		},
		WeaponBinks =
		{
			"ZagreusBow01Dash_Bink",
			"ZagreusBow01_Bink",
			"ZagreusBow01Run_Bink",
			"ZagreusBow01RunStop_Bink",
			"ZagreusBow01RapidFire_Bink"
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				WeaponBinks =
				{
					"ZagreusBow01Dash_Bink",
					"ZagreusBow01_Bink",
					"ZagreusBow01Run_Bink",
					"ZagreusBow01RunStop_Bink",
					"ZagreusBow01RapidFire_Bink"
				}
			},
			BowSplitShot =
			{
				Sounds =
				{
					FireSounds =
					{
						-- these are on the animation
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "MarkTarget",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "NumProjectiles",
				BaseValue = -5,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01DashStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01DashFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowAlt01StartCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt01RapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt01RapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "BowWeaponArrowShadow-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrowSplitShot-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "BowWeaponArrowShadow-Alt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

		},
		ExtractProjectiles = 
		{ 
			CustomRarityMultiplier =
			{
				Common =
				{
					MinMultiplier = 1.00,
					MaxMultiplier = 1.00,
				},
				Rare =
				{
					MinMultiplier = 1.25,
					MaxMultiplier = 1.25,
				},
				Epic =
				{
					MinMultiplier = 1.5,
					MaxMultiplier = 1.5,
				},
				Heroic =
				{
					MinMultiplier = 1.75,
					MaxMultiplier = 1.75,
				},
				Legendary =
				{
					MinMultiplier = 2,
					MaxMultiplier = 2,
				},
			},
			BaseValue = 4 
		},
		ExtractValues =
		{
			{
				Key = "ExtractProjectiles",
				ExtractAs = "TooltipProjectiles",
			},
			{
				ExtractAs = "BaseProjectiles",
				External = true,
				BaseType = "Weapon",
				BaseName = "BowSplitShot",
				BaseProperty = "NumProjectiles",
			}
		}
	},

	BowLoadAmmoTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		CustomTrayText = "BowLoadAmmoTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PreEquipWeapons = { "LoadAmmoApplicator" },
		RequiredWeapons = { "RangedWeapon", "BowWeapon" },
		PostWeaponUpgradeScreenAnimation = "ZagreusBowAlt02DashFireEndLoop",
		PostWeaponUpgradeScreenAngle = 205,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.66,
				MaxMultiplier = 1.66,
			},
			Epic =
			{
				MinMultiplier = 2.33,
				MaxMultiplier = 2.33,
			},
			Heroic =
			{
				MinMultiplier = 2.66,
				MaxMultiplier = 2.66,
			},
			Legendary =
			{
				MinMultiplier = 3.66,
				MaxMultiplier = 3.66,
			},
		},
		WeaponBinks =
		{
			"ZagreusBow02Dash_Bink",
			"ZagreusBow02_Bink",
			"ZagreusBow02Run_Bink",
			"ZagreusBow02RunStop_Bink",
			"ZagreusBow02RapidFire_Bink"
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				WeaponBinks =
				{
					"ZagreusBow02Dash_Bink",
					"ZagreusBow02_Bink",
					"ZagreusBow02Run_Bink",
					"ZagreusBow02RunStop_Bink",
					"ZagreusBow02RapidFire_Bink"
				}
			},
		},
		SetupFunction =
		{
			Name = "SetupAmmoLoad",
			Args =
			{
				MaxCount = 99,
				ExtractValues =
				{
					{
						Key = "MaxCount",
						ExtractAs = "TooltipCount",
					},
				}
			},
			RunOnce = true,
		},

		AmmoReclaimTimeDivisor =
		{
			BaseValue = 1.6,
			SourceIsMultiplier = true,
		},
		OverrideWeaponFireNames =
		{
			RangedWeapon = "nil",
			LoadAmmoApplicator = "RangedWeapon",
		},
		ExtractValues =
		{
			{
				Key = "AmmoReclaimTimeDivisor",
				ExtractAs = "TooltipAmmo",
				Format = "AmmoDelayDivisor",
				DecimalPlaces = 2.0,
			},
			{
				ExtractAs = "TooltipTotalAmmoDelay",
				Format = "ExistingAmmoDropDelay",
				SkipAutoExtract = true,
				DecimalPlaces = 2.0,
			}
		},

		PropertyChanges =
		{
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreOwnerAttackDisabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "Cooldown",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SelfVelocity",
				ChangeValue = 0,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "AllowMultiFireRequest",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "null",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "SetCompleteAngleOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "RangedWeapon",
				WeaponProperty = "IgnoreForceCooldown",
				ChangeValue = true,
				ChangeType = "Absolute"
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "RangedWeapon",
				EffectName = "RangedDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02DashStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02DashFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowAlt02StartCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowAlt02RapidFire_Start",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowAlt02RapidFire_Fire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrow-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "BowWeaponArrowShadow-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "Graphic",
				ChangeValue = "BowWeaponArrowSplitShot-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowSplitShot",
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "BowWeaponArrowShadow-Alt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},

	BowStoredChargeTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapons = { "BowWeapon" },
		RequiredFalseTrait = "BowStoredChargeTrait",
		LoadPackages = "AresUpgrade",
		PropertyChanges =
		{
			{
				WeaponName = "MaxChargeBowWeapon",
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "MaxChargeBowWeapon",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChargeBowWeapon1",
				ProjectileProperty = "DamageLow",
				ChangeValue = 20,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "ChargeBowWeapon1",
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon" },
				WeaponProperty = "ProjectileWaveInterval",
				ChangeValue = 0,
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
				{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = 360,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "SKY",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 230,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(20),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStartDistance",
				ChangeValue = 180,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "AscentEndZ",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleResetCount",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNova",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue =  0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		}
	},


	BowBondTrait =
	{
		Icon = "WeaponEnchantment_Bow04",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapons = { "BowWeapon" },
		CustomTrayText = "BowBondTrait_Tray",
		PostWeaponUpgradeScreenAnimation = "ZagreusBowRamaHeavyShotFireEnd",
		PostWeaponUpgradeScreenAngle = 205,
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.25,
				MaxMultiplier = 1.25,
			},
			Epic =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Heroic =
			{
				MinMultiplier = 1.75,
				MaxMultiplier = 1.75,
			},
			Legendary =
			{
				MinMultiplier = 2.00,
				MaxMultiplier = 2.00,
			},
		},

		WeaponBinks =
		{
			"ZagreusBowRama_Bink",
			"ZagreusBowRamaRun_Bink",
			"ZagreusBowRamaRunStop_Bink",
			"ZagreusBowRamaRapidFire_Bink",
			"ZagreusBowRamaRapidLoop_Bink",
			"ZagreusBowRamaHeavyShot_Bink",
			"ZagreusBowRamaDashShot_Bink",
		},
		WeaponDataOverride =
		{
			BowWeapon =
			{
				FireScreenshake = { Distance = 3, Speed = 400, FalloffSpeed = 1200, Duration = 0.25 },

				WeaponBinks =
				{
					"ZagreusBowRamaDash_Bink",
					"ZagreusBowRama_Bink",
					"ZagreusBowRamaRun_Bink",
					"ZagreusBowRamaRunStop_Bink",
					"ZagreusBowRamaRapidFire_Bink",
					"ZagreusBowRamaRapidLoop_Bink",
					"ZagreusBowRamaHeavyShot_Bink",
					"ZagreusBowRamaDashShot_Bink",
				},

				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
				},

				Sounds =
				{
					FireSounds =
					{
						PerfectChargeSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
							{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowPowerAttack" },
							{ Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
						},
						ImperfectChargeSounds =
						{
							{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowAttack"},
							{ Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
						},
						LoadedSounds =
						{
							{ Name = "/SFX/Player Sounds/ZagreusBloodshotFire" },
						},
						{ Name = "/Leftovers/SFX/AuraOn"},
					},
					ChargeSounds =
					{
						{
							Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
							StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},

			},
			BowWeaponDash =
			{
				FireScreenshake = { Distance = 3, Speed = 300, FalloffSpeed = 1200, Duration = 0.15 },

				HitSimSlowCooldown = 0.3,
				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.03, LerpTime = 0.0 },
					{ ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
					{ ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
				},
			},
			BowSplitShot =
			{
				FireRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.225, Duration = 0.16 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowFlurry", },
						{ Name = "/SFX/Player Sounds/ZagreusSplitShotRamaSitar"},
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/ArrowMetalBoneSmash",
						Brick = "/SFX/ArrowMetalStoneClang",
						Stone = "/SFX/ArrowMetalStoneClang",
						Organic = "/SFX/ArrowImpactSplatter",
						StoneObstacle = "/SFX/ArrowWallHitClankSmall",
						BrickObstacle = "/SFX/ArrowWallHitClankSmall",
						MetalObstacle = "/SFX/ArrowWallHitClankSmall",
						BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
					},
				},
			},
		},

		BondDamageShareData =
		{
			Multiplier = {	BaseValue = 0.3 },
			WeaponNames = { "BowWeapon", "BowWeaponDash"} ,
			AlliedDamageMultiplier = 0.1,
			ExtractValues =
			{
				{
					Key = "Multiplier",
					ExtractAs = "TooltipDamageTransfer",
					Format = "Percent",
				},
			}
		},

		PropertyChanges =
		{
			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "MarkBondTarget",
				EffectProperty = "Active",
				ChangeValue = true,
			},
			-- main shot modifications
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "Scale",
				ChangeValue = 3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipWidth",
					Format = "PercentDelta",
					SkipAutoExtract = true,
				}
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash"},
				ProjectileProperty = "ExtentScale",
				ChangeValue = 2,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 2.1,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.13,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeDamageMultiplier",
				ChangeValue = 1.25,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 1.15,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "MinChargeStartFx",
				ChangeValue = "BowChargeRama",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "BowChargeRamaDash",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisable",
				EffectProperty = "Duration",
				ChangeValue = 1.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponName = "BowWeapon",
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Duration",
				ChangeValue = 2.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachedAnim",
				ChangeValue = "RamaWideShot",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			-- split shot modifications
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				SplitShoutDamageSource = "SplitShotDamageSource",
				ExtractValue =
				{
					ExtractAs = "SpecialDamage",
					SkipAutoExtract = true,
				},
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "SplitShotDamageSource",
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffsetMin",
				ChangeValue = -1 * math.rad(4),
				--ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffsetMax",
				ChangeValue = math.rad(4),
				--ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "NoJumpTargetRandomSpread",
				ChangeValue = 90,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 3,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 1.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AutoLock",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AutoLockRange",
				ChangeValue = 1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AutoLockArcDistance",
				ChangeValue = math.rad(90),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisable",
				EffectProperty = "Duration",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFast",
				EffectProperty = "Duration",
				ChangeValue = 0.65,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "SplitShotDisableFastCancelable",
				EffectProperty = "Duration",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.18,
				ChangeType = "Absolute",
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "NumJumps",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "BonusJumps",
					SkipAutoExtract = true,
				}
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "BounceWhenOutOfJumpTargets",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "JumpRange",
				ChangeValue = 500,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.75,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRamaRapidLoop_Start",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowSplitShot",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRamaRapidLoop_Fire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowSplitShot",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			-- tap fire properties
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ForceReleaseWeaponOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ClipSize",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRamaHeavyShotStart",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRamaHeavyShotFire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeapon",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowRamaHeavyShotStartCancel",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRamaDashShot_Start",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRamaDashShot_Fire",
				ChangeType = "Absolute",
			},
			{
				WeaponName = "BowWeaponDash",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusBowRamaDashShot_Cancel",
				ChangeType = "Absolute",
			},
		},
    ExtractValues =
    {
      {
        ExtractAs = "TooltipBondDuration",
        SkipAutoExtract = true,
        External = true,
        BaseType = "Effect",
        WeaponName = "SwordWeapon",
        BaseName = "MarkBondTarget",
        BaseProperty = "Duration",
      },
    }
	},

	BowBondBoostTrait =
	{
		InheritFrom = { "WeaponTrait" },
		Icon = "Weapon_Bow_14",
		RequiredWeapon = "BowWeapon",
		RequiredTrait = "BowBondTrait",
		RequiredFalseTrait = { "BowBondBoostTrait" },
		PreEquipWeapons = { "BowAreaRepulse" },
		LegalOnFireWeapons = { "BowWeapon", "BowWeaponDash" },
		AddOnFireWeapons = { "BowAreaRepulse" },
		PropertyChanges =
		{
			{
				WeaponNames = { "BowAreaRepulse" },
				ProjectileProperty = "DamageLow",
				BaseValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "BowAreaRepulse" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "SpearWeaponSpinDefenseWeapon",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName= "SpearWeaponSpinDefenseWeapon",
				EffectProperty = "Modifier",
				BaseMin = 0.7,
				BaseMax = 0.7,
				SourceIsMultiplier = true,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDamageReduction",
					Format = "PercentDelta",
				}
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireFx",
				ChangeValue = "HyperArmorFist",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
		},
	},

	BowBeamTrait =
	{
		Icon = "WeaponEnchantment_Bow03",
		InheritFrom = { "WeaponEnchantmentTrait" },
		RequiredWeapons = { "BowWeapon" },
		RequiredFalseTrait = "BowBeamTrait",
		--LoadPackages = "AresUpgrade",
		RequiredFalseTraits = { "BowTapFireTrait", "BowSlowChargeDamageTrait", "BowPowerShotTrait", "BowSecondaryFocusedFireTrait", "BowBondTrait" },
		PropertyChanges =
		{

			--[[
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]

			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "Projectile",
				ChangeValue = "DemeterProjectile",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			--[[
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Type",
				ChangeValue = "BEAM",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "MultiDetonate",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DrawAsBeam",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "GroupName",
				ChangeValue = "Standing",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "TipFx",
				ChangeValue = "DemeterLaserTipFlare",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Graphic",
				ChangeValue = "DemeterLaser",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Fuse",
				ChangeValue = 0.2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "TotalFuse",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "Range",
				ChangeValue = 1000,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "AttachToOwner",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.5,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 1.0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ChargeDamageMultiplier",
				ChangeValue = 0,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "OnlyChargeOnce",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseOnFire",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ForceReleaseWeaponOnFire",
				ChangeValue = "null",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ShowFreeAimLine",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 0.7,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ClipSize",
				ChangeValue = 5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FullClipRegen",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "ClipRegenOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "Cooldown",
				ChangeValue = 0.10,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "PerfectChargeWindowDuration",
				ChangeValue = 0.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowBeamFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowWeaponDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				EffectName = "BowBeamDisable",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileName = "BowWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamageHigh",
				ChangeValue = 1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "ConsecutiveHitWindow",
				ChangeValue = 0.35,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowWeapon", "BowWeaponDash" },
				ProjectileProperty = "DamagePerConsecutiveHit",
				ChangeValue = 0.4,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "Type",
				ChangeValue = "SKY",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "UseStartLocation",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "AscentEndZ",
				ChangeValue = 1800,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ReloadTime",
				ChangeValue = 1.0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 9,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.1,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "SkipAscent",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusBowRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusBowRun",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ChargeCancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "RootOwnerWhileFiring",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "BlockMoveInput",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "CancelMovement",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DetonateGraphic",
				ChangeValue = "RadialNova",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageRadiusScaleY",
				ChangeValue =  0.5,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				EffectName = "SplitShotDisableCancelable",
				EffectProperty = "Active",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			--[[
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleOffset",
				ChangeValue = math.rad(20),
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "Spread",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStartDistance",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffset",
				ChangeValue = 250,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileOffsetStart",
				ChangeValue = "LEFT",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "BowSplitShot" },
				WeaponProperty = "ProjectileAngleResetCount",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileName = "BowWeapon",
				EffectName = "OnHitStun",
				EffectProperty = "Active",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileName = "Spread",
				ChangeValue = 0,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageLow",
				ChangeValue = 70,
				ChangeType = "Absolute",
				ExcludeLinked = true,
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
				},
			},
			{
				WeaponNames = { "BowSplitShot" },
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow",
			},
		}
	},

	ShieldBlockEmpowerTrait =
	{
		Icon = "Weapon_Shield_14",
		InheritFrom = { "WeaponTrait" },
		PreEquipWeapons = { "BlockEmpowerApplicator"},
		OnBlockDamageFunctionName = "AddBlockEmpower",
		RequiredWeapon = "ShieldWeapon",
		PropertyChanges =
		{
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockDamageBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.2,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				}
			},
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockMoveSpeed",
				EffectProperty = "Modifier",
				BaseValue = 0.2,
				ChangeType = "Add",
			},
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockDamageBonus",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
				ExtractValue =
				{
					ExtractAs = "TooltipDuration",
				}
			},
			{
				WeaponName = "BlockEmpowerApplicator",
				EffectName = "BlockMoveSpeed",
				EffectProperty = "Duration",
				ChangeValue = 10,
				ChangeType = "Absolute",
			},
		}
	},

	SpearWeaveTrait =
	{
		Icon = "WeaponEnchantment_Spear03",
		CustomTrayText = "SpearWeaveTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt02ThrowFireReturn",
		PostWeaponUpgradeScreenFunctionName = "RemoveSpearWeave",
		PostWeaponUpgradeScreenAngle = 230,
		RequiredWeapons = { "SpearWeapon", "SpearWeaponThrow" },
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
			Rare =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Epic =
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Heroic =
			{
				MinMultiplier = 4,
				MaxMultiplier = 4,
			},
			Legendary =
			{
				MinMultiplier = 5,
				MaxMultiplier = 5,
			},
		},
		WeaponBinks =
		{
			"ZagreusSpear02Run_Bink",
			"ZagreusSpear02RunStop_Bink",
			"ZagreusSpear02_Bink",
			"ZagreusSpear02ReturnToIdle_Bink",
			"ZagreusSpear02Spin_Bink",
			"ZagreusSpear02DashAttack_Bink",
			"ZagreusSpear02Throw_Bink",
			"ZagreusSpear02ThrowReceive_Bink"
		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear02Run_Bink",
					"ZagreusSpear02RunStop_Bink",
					"ZagreusSpear02_Bink",
					"ZagreusSpear02ReturnToIdle_Bink",
					"ZagreusSpear02Spin_Bink",
					"ZagreusSpear02DashAttack_Bink",
					"ZagreusSpear02Throw_Bink",
					"ZagreusSpear02ThrowReceive_Bink"
				}
			},
		},
		PropertyChanges =
		{
			--[[
			{
				WeaponNames = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", "SpearWeaponThrow", "SpearWeaponDash", "SpearWeaponThrowReturn" },
				EffectName = "ClearMarkTargetSpin",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			]]
			--[[
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "NumProjectiles",
				ChangeValue = 2,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				WeaponProperty = "ProjectileInterval",
				ChangeValue = 0.08,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			]]
			{
				WeaponNames = { "SpearWeaponSpin" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.475,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin2" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.375,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin3" },
				ProjectileProperty = "DamageRadius",
				ChangeValue = 1.275,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin", "SpearWeaponSpin2", "SpearWeaponSpin3" },
				EffectName = "MarkTargetSpin",
				EffectProperty = "Active",
				ChangeValue = true,
				ExcludeLinked = true,
			},
			{
				WeaponNames = WeaponSets.HeroPhysicalWeapons,
				EffectName = "MarkTargetSpin",
				EffectProperty = "Modifier",
				BaseValue = 0.30,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02ThrowFireReturn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt02ThrowFireReturnToIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnType",
				ChangeValue = "OBSTACLE",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrowInvisibleReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt02",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },

			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt02SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt02SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt02SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
		},
		ExtractValues =
		{
		  {
			ExtractAs = "TooltipWeaveDuration",
			SkipAutoExtract = true,
			External = true,
			BaseType = "Effect",
			WeaponName = "SwordWeapon",
			BaseName = "MarkTargetSpin",
			BaseProperty = "Duration",
		  },
		}
	},

	SpearTeleportTrait =
	{
		Icon = "WeaponEnchantment_Spear02",
		CustomTrayText = "SpearTeleportTrait_Tray",
		InheritFrom = { "WeaponEnchantmentTrait" },
		PostWeaponUpgradeScreenAnimation = "ZagreusSpearAlt01AttackReturnToIdle",
		PostWeaponUpgradeScreenFunctionName = "RemoveSpearTeleport",
		PostWeaponUpgradeScreenAngle = 230,
		RequiredWeapon = "SpearWeaponThrow",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.50,
				MaxMultiplier = 1.50,
			},
			Epic =
			{
				MinMultiplier = 2.0,
				MaxMultiplier = 2.0,
			},
			Heroic =
			{
				MinMultiplier = 2.5,
				MaxMultiplier = 2.5,
			},
			Legendary =
			{
				MinMultiplier = 3.00,
				MaxMultiplier = 3.00,
			},
		},
		PreEquipWeapons = { "SpearRushWeapon", "SpearWeaponThrowInvisibleReturn", },
		WeaponBinks =
		{
			"ZagreusSpear01Run_Bink",
			"ZagreusSpear01RunStop_Bink",
			"ZagreusSpear01_Bink",
			"ZagreusSpear01ReturnToIdle_Bink",
			"ZagreusSpear01Spin_Bink",
			"ZagreusSpear01DashAttack_Bink",
			"ZagreusSpear01Throw_Bink",
			"ZagreusSpear01ThrowReceive_Bink"

		},
		WeaponDataOverride =
		{
			SpearWeapon =
			{
				WeaponBinks =
				{
					"ZagreusSpear01Run_Bink",
					"ZagreusSpear01RunStop_Bink",
					"ZagreusSpear01_Bink",
					"ZagreusSpear01ReturnToIdle_Bink",
					"ZagreusSpear01Spin_Bink",
					"ZagreusSpear01DashAttack_Bink",
					"ZagreusSpear01Throw_Bink",
					"ZagreusSpear01ThrowReceive_Bink"
				}
			},
			SpearWeaponThrow =
			{
				Sounds =
				{
					ChargeSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
							StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
						},
						{
							Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
							StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
							SetPitchToPropertyValue = "ChargeTime",
						},
					},
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
						{ Name = "/SFX/Player Sounds/ZagreusDash" },
						{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
					},
				},
			},
			SpearRushWeapon =
			{
				FireRumbleParameters =
				{
					{ ScreenPreWait = 0.1, LeftFraction = 0.17, Duration = 0.17 },
				},

				HitSimSlowParameters =
				{
					{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
					{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },

					--{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
					--{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
					--{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },
				},

				HitRumbleParameters =
				{
					{ ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
				},

				Sounds =
				{
					FireSounds =
					{
						{ Name = "/VO/ZagreusEmotes/EmoteAttacking_DashUppercut" },
						{ Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
						{ Name = "/Leftovers/World Sounds/QuickSnap" },
					},
					ImpactSounds =
					{
						Invulnerable = "/SFX/SwordWallHitClank",
						Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
						Bone = "/SFX/FistImpactSmall",
						Brick = "/SFX/FistImpactSmall",
						Stone = "/SFX/FistImpactSmall",
						Organic = "/SFX/FistImpactSmall",
					},
				},
			},

		},
		PropertyChanges =
		{	
			-- Spear Throw Charge
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FireOnRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "FullyAutomatic",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrowReturn" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "LockTriggerForCharge",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeTime",
				ChangeValue = 0.08,
				ChangeType = "Add",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "MinChargeToFire",
				ChangeValue = 0.04,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeRangeMultiplier",
				ChangeValue = 3.34,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				ProjectileProperty = "Range",
				ChangeValue = 0.3,
				ChangeType = "Multiply",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceRelease",
				ChangeValue = false,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "AllowExternalForceReleaseIfAnyCharged",
				ChangeValue = true,
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			{
				WeaponNames = { "SpearWeaponThrow" },
				WeaponProperty = "ChargeStartFx",
				ChangeValue = "SpearChargeThrowTrait",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},

			-- Achilles Aspect Changes
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "SwapOnFire",
				ChangeValue = "SpearRushWeapon",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "AddControlOnFire",
				ChangeValue = "SpearWeaponThrowReturn",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "Control",
				ChangeValue = "Attack2",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "AlternateControl",
				ChangeValue = "null",
				ExcludeLinked = true,
			},
			{
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ExcludeLinked = true,
			},
			  {
				WeaponName = "SpearWeaponThrowInvisibleReturn",
				WeaponProperty = "FireFromObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateAtOrigin",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "Enabled",
				ChangeValue = true,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateAtEndpoint",
				ChangeValue = false,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				WeaponProperty = "BlinkDetonateOnInterval",
				ChangeValue = 130,
				ChangeType = "Absolute",
			},
			{
				WeaponName = "SpearRushWeapon" ,
				EffectName = "SpearRushBonus",
				EffectProperty = "Modifier",
				BaseValue = 0.5,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipDamage",
					Format = "Percent"
				},
				DeriveSource = "DeriveSource"
			},
			  {
				WeaponName = "SpearWeaponThrowReturn",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01ThrowFireReturn",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01ThrowCharge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			{
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt01ThrowFireReturnToIdle",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			},
			  {
				WeaponName = "SpearWeaponThrow",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01ThrowFire",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01DashAttack_Charge",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponDash",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01DashAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnType",
				ChangeValue = "OBSTACLE",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeaponThrow",
				ProjectileProperty = "SpawnOnDeath",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearRushWeapon",
				WeaponProperty = "FireToObstacle",
				ChangeValue = "SpearReturnPointAlt01",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack1",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon2",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon2",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack2",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon3",
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01Charge3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponName = "SpearWeapon3",
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01Attack3",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeStartAnimation",
				ChangeValue = "ZagreusSpearAlt01SpinStart",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "ChargeCancelGraphic",
				ChangeValue = "ZagreusSpearAlt01SpinStartChargeCancel",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			  {
				WeaponNames = { "SpearWeaponSpin","SpearWeaponSpin2","SpearWeaponSpin3" },
				WeaponProperty = "FireGraphic",
				ChangeValue = "ZagreusSpearAlt01SpinAttack",
				ChangeType = "Absolute",
				ExcludeLinked = true,
			  },
			}
	},
	-- Chaos Curses
	ChaosCurseDeathWeaponTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_01",
		AddEnemyOnDeathWeapons =
		{
			{
				Weapon = "EnemyDeathWeapon"
			}
		},
	},

	ChaosCurseNoMoneyTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_06",
		BlockMoney = true,
	},

	ChaosCurseAmmoUseDelayTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_04",
		RequiredMetaUpgradeSelected = "AmmoMetaUpgrade",
		AmmoDropUseDelay =
		{
			BaseMin = 10,
			BaseMax = 15,
			ToNearest = 0.25,
		},
	},

	ChaosCurseHiddenRoomReward =
	{
		InheritFrom = { "ChaosCurseTrait" },
		Icon = "Boon_Chaos_Curse_05",
		HiddenRoomReward = true,
		UsesAsRooms = true,
		RemainingUses =
		{
			BaseMin = 4,
			BaseMax = 5,
			AsInt = true,
		}
	},

	ChaosCurseDamageTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_07",
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 1.2,
				BaseMax = 1.5,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageCurse",
					Format = "PercentDelta",
				},
			}
		}
	},

	ChaosCurseTrapDamageTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_03",
		AddIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseMin = 3.0,
				BaseMax = 5.0,
			SourceIsMultiplier = true,
		},
		UsesRequireSpawnMultiplier = true,
		ExtractValues =
		{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageIncrease",
					Format = "PercentDelta",
				},
			}
		}
	},

	ChaosCurseHealthTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_02",
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseMin = -49,
				BaseMax = -25,
				MaintainDelta = true,
				ChangeType = "Add",
				AsInt = true,
				ExtractValue =
				{
					ExtractAs = "TooltipHealthCurse",
				}
			},
		},
		RequiredMinMaxHealthAmount = 50,
	},
	ChaosCurseDashRangeTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_11",
		PropertyChanges =
		{
            {
                WeaponNames = { "RushWeapon" },
                WeaponProperty = "WeaponRange",
                BaseMin = 0.5,
                BaseMax = 0.8,
                ChangeType = "Multiply",
                ExtractValue =
                {
                    ExtractAs = "TooltipPenalty",
                    Format = "NegativePercentDelta",
                },
            },
		},
	},

	ChaosCurseMoveSpeedTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_09",
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseMin = 0.40,
				BaseMax = 0.60,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},

	ChaosCurseSpawnTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_08",
		SpawnMultiplier =
		{
			BaseMin = 1.3,
			BaseMax = 1.8,
			SourceIsMultiplier = true,
		},
		UsesRequireSpawnMultiplier = true,
		ExtractValues =
		{
			{
				Key = "SpawnMultiplier",
				ExtractAs = "TooltipSpawnMultiplier",
				Format = "PercentDelta",
			},
		}
	},

	ChaosCursePrimaryAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_10",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroPhysicalWeapons,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	ChaosCurseSecondaryAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_13",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroSecondaryWeapons,
			ExcludeLinked = true,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	ChaosCurseCastAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_12",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
			Damage =
			{
				BaseMin = 3,
				BaseMax = 5,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},
	ChaosCurseDashAttackTrait =
	{
		InheritFrom = { "ChaosCurseTrait", "ChaosCurseRemainingEncounters" },
		Icon = "Boon_Chaos_Curse_11",
		DamageOnFireWeapons =
		{
			WeaponNames = WeaponSets.HeroRushWeapons,
			Damage =
			{
				BaseMin = 2,
				BaseMax = 3,
				AsInt = true,
			},
			ExtractValues =
			{
				{
					Key = "Damage",
					ExtractAs = "TooltipDamage",
				},
			}
		},
	},

	-- Chaos Blessings
	ChaosBlessingMeleeTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_01",
		CustomName = "ChaosBlessingMeleeTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ChaosBlessingRangedTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_02",
		CustomName = "ChaosBlessingRangedTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.4, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},
	ChaosBlessingAlphaStrikeTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_14",
		CustomName = "ChaosBlessingAlphaStrikeTrait_Complete",
		RequiredMetaUpgradeSelected = "FirstStrikeMetaUpgrade",
		AddOutgoingDamageModifiers =
		{
            HitMaxHealthMultiplier = { BaseMin = 1.3, BaseMax = 1.5, SourceIsMultiplier = true },
            ExtractValues =
            {
                {
                    Key = "HitMaxHealthMultiplier",
                    ExtractAs = "TooltipDamageBonus",
                    Format = "PercentDelta",
                },
            }
		},
	},
	ChaosBlessingBackstabTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_15",
		CustomName = "ChaosBlessingBackstabTrait_Complete",
		RequiredMetaUpgradeSelected = "BackstabMetaUpgrade",
		AddOutgoingDamageModifiers =
		{
            HitVulnerabilityMultiplier = { BaseMin = 1.6, BaseMax = 1.8, SourceIsMultiplier = true },
            ExtractValues =
            {
                {
                    Key = "HitVulnerabilityMultiplier",
                    ExtractAs = "TooltipDamageBonus",
                    Format = "PercentDelta",
                },
            }
		},
	},


	ChaosBlessingAmmoTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_03",
		CustomName = "ChaosBlessingAmmoTrait_Complete",
		RarityLevels =
		{
			Common =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Rare =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
			Epic =
			{
				MinMultiplier = 1.0,
				MaxMultiplier = 1.0,
			},
		},
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
				WeaponProperty = "MaxAmmo",
				BaseMin = 1,
				BaseMax = 1,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipCapacity",
				}
			},
		},
	},

	ChaosBlessingMaxHealthTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_04",
		CustomName = "ChaosBlessingMaxHealthTrait_Complete",
		PropertyChanges =
		{
			{
				LuaProperty = "MaxHealth",
				BaseMin = 30,
				BaseMax = 40,
				AsInt = true,
				ChangeType = "Add",
				ExtractValue =
				{
					ExtractAs = "TooltipHealth",
				}
			},
		},
	},

	ChaosBlessingBoonRarityTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_10",
		CustomName = "ChaosBlessingBoonRarityTrait_Complete",
		RarityBonus =
		{
			RareBonus =
			{
				BaseMin = 0.11,
				BaseMax = 0.20,
			},
			EpicBonus = 0.1,
			LegendaryBonus = 0.1,
			ExtractValues =
			{
				{
					Key = "RareBonus",
					ExtractAs = "TooltipBonusChance",
					Format = "Percent",
				}
			}
		},
	},

	ChaosBlessingTroveTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_09",
		CustomName = "ChaosBlessingTroveTrait_Complete",
		ChallengeRewardIncrease =
			{
				BaseMin = 1.5,
				BaseMax = 3.0,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "ChallengeRewardIncrease",
				ExtractAs = "TooltipTroveRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},

	ChaosBlessingMoneyTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_05",
		CustomName = "ChaosBlessingMoneyTrait_Complete",
		MoneyMultiplier =
		{
			BaseMin = 1.3,
			BaseMax = 1.5,
			ToNearest = 0.05,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},
	ChaosBlessingGemTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_17",
		CustomName = "ChaosBlessingGemTrait_Complete",
		GemMultiplier =
			{
				BaseMin = 1.50,
				BaseMax = 1.75,
				ToNearest = 0.05,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "GemMultiplier",
				ExtractAs = "TooltipGemRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},

	ChaosBlessingMetapointTrait = {
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_06",
		CustomName = "ChaosBlessingMetapointTrait_Complete",
		MetaPointMultiplier =
			{
				BaseMin = 1.50,
				BaseMax = 1.80,
				SourceIsMultiplier = true,
			},
		ExtractValues =
		{
			{
				Key = "MetaPointMultiplier",
				ExtractAs = "TooltipMetaPointRewardIncrease",
				Format = "PercentDelta",
			},
		},
		GemMultiplier = { ReplaceWithKeyValue = "MetaPointMultiplier"},
	},

	ChaosBlessingTrapDamageTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_16",
		CustomName = "ChaosBlessingTrapDamageTrait_Complete",
		PreEquipWeapons = WeaponSets.RubbleWeapons,
		PropertyChanges =
		{
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageLow",
				BaseValue = 4,
				ChangeType="MultiplyBase",
			},
			{
				WeaponNames = WeaponSets.RubbleWeapons,
				ProjectileProperty = "DamageHigh",
				DeriveValueFrom = "DamageLow"
			}
		},
		EnemyIncomingDamageModifiers =
		{
			TrapDamageTakenMultiplier =
			{
				BaseValue = 4.0,
				SourceIsMultiplier = true,
			},
			ExtractValues =
			{
				{
					Key = "TrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},
	-- unused
	ChaosBlessingSecretTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_11",
		SecretDoorCostMultiplier =
			{
				BaseMin = 0.1,
				BaseMax = 0.3,
			},
		ExtractValues =
		{
			{
				Key = "SecretDoorCostMultiplier",
				ExtractAs = "TooltipCostChange",
				Format = "NegativePercentDelta",
			},
		}
	},

	ChaosBlessingHealTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_07",
		DummyTrait = true,
		HealOnAcquire =
		{
			BaseMin = 30,
			BaseMax = 60,
			AsInt = true,
		},
		ExtractValues =
		{
			{
				Key = "HealOnAcquire",
				ExtractAs = "TooltipHeal",
			},
		}
	},

	ChaosBlessingExtraChanceTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		RequiredOneOfTraits =  { "ChaosBlessingMeleeTrait", "ChaosBlessingRangedTrait", "ChaosBlessingAmmoTrait", "ChaosBlessingMaxHealthTrait", "ChaosBlessingBoonRarityTrait", "ChaosBlessingMoneyTrait", "ChaosBlessingMetapointTrait", "ChaosBlessingSecondaryTrait", "ChaosBlessingDashAttackTrait","ChaosBlessingBackstabTrait", "ChaosBlessingAlphaStrikeTrait" },
		ChanceToPlay = 0.20,
		RarityLevels =
		{
			Legendary =
			{
				MinMultiplier = 1,
				MaxMultiplier = 1,
			},
		},
		Icon = "Boon_Chaos_Blessing_08",
		CustomName = "ChaosBlessingExtraChanceTrait_Complete",
		DummyTrait = true,
		AddLastStand =
		{
			Icon = "ExtraLifeChaos",
			WeaponName = "LastStandMetaUpgradeShield",
			HealFraction = 0.5,
			IncreaseMax = true,
		}
	},

	ChaosBlessingSecondaryTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_12",
		CustomName = "ChaosBlessingSecondaryTrait_Complete",
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.3, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	ChaosBlessingDashAttackTrait =
	{
		InheritFrom = { "ChaosBlessingTrait" },
		Icon = "Boon_Chaos_Blessing_13",
		CustomName = "ChaosBlessingDashAttackTrait_Complete",
		RequiredFalseTraits = { "GunLoadedGrenadeTrait" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier = { BaseMin = 1.4, BaseMax = 1.6, SourceIsMultiplier = true },
			ValidWeapons = WeaponSets.HeroDashWeapons,
			ExcludeLinked = true,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamageBonus",
					Format = "PercentDelta",
				},
			}
		},
	},

	-- Bouldy Blessings
	BouldyBlessing =
	{
		Icon = "Boon_Bouldy"
	},

	BouldyBlessing_Armor =
	{
		InheritFrom = { "BouldyBlessing" },
		AddIncomingDamageModifiers =
		{
			NonTrapDamageTakenMultiplier =
			{
				BaseMin = 0.95,
				BaseMax = 0.99,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ExtractValues =
			{
				{
					Key = "NonTrapDamageTakenMultiplier",
					ExtractAs = "TooltipDamageReduction",
					Format = "NegativePercentDelta",
				},
			}
		}
	},
	BouldyBlessing_Attack =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Special =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.05,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroSecondaryWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Ranged =
	{
		InheritFrom = { "BouldyBlessing" },
		AddOutgoingDamageModifiers =
		{
			ValidWeaponMultiplier =
			{
				BaseMin = 1.01,
				BaseMax = 1.10,
				SourceIsMultiplier = true,
				IdenticalMultiplier =
				{
					Value = DuplicateMultiplier,
				},
			},
			ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
			ExtractValues =
			{
				{
					Key = "ValidWeaponMultiplier",
					ExtractAs = "TooltipDamage",
					Format = "PercentDelta",
				},
			}
		},
	},
	BouldyBlessing_Speed =
	{
		InheritFrom = { "BouldyBlessing" },
		PropertyChanges =
		{
			{
				UnitProperty = "Speed",
				BaseMin = 1.01,
				BaseMax = 1.1,
				ChangeType = "Multiply",
				ExtractValue =
				{
					ExtractAs = "TooltipSpeed",
					Format = "PercentDelta",
				}
			},
		}
	},
	BouldyBlessing_Money =
	{
		InheritFrom = { "BouldyBlessing" },
		MoneyMultiplier =
		{
			BaseMin = 1.01,
			BaseMax = 1.10,
			ToNearest = 0.01,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "MoneyMultiplier",
				ExtractAs = "TooltipMoneyRewardIncrease",
				Format = "PercentDelta",
			},
		}
	},
	BouldyBlessing_None =
	{
		InheritFrom = { "BouldyBlessing" },
	},
}