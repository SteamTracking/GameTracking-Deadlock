// MHasKV3TransferPolymorphicClassname
class CCitadel_BreakablePropVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Behavior"
	// MPropertyDescription = "Should this breakable break if a player rolls or dodges into it?"
	// MPropertyFriendlyName = "Break On Dodge?"
	bool m_bBreakOnDodgeTouch;
	// MPropertyDescription = "If checked, this breakble will stay after destroyed, rather than stop rendering. (useful for animating breakables that might want to stay in a final pose."
	// MPropertyFriendlyName = "Render while dead?"
	bool m_bRenderAfterDeath;
	// MPropertyDescription = "If checked, this breakble will stay solid after death. (useful for animating breakables that might want to stay in a final pose."
	// MPropertyFriendlyName = "Solid while dead?"
	bool m_bSolidAfterDeath;
	// MPropertyDescription = "If checked, this breakable will immediately die upon prop break."
	// MPropertyFriendlyName = "Die on Break?"
	bool m_bDieOnBreak; // = true
	CUtlString m_strDeathSequenceName;
	// MPropertyDescription = "Optional one-off animation played when this takes damage without breaking. Ignored if the model has no sequence with this name, so it is safe to set on a shared base."
	// MPropertyFriendlyName = "Hit Sequence"
	CUtlString m_strHitSequenceName;
	float32 m_flLootDelay;
	// MPropertyDescription = "If checked, this breakble will take damage from Bullets."
	// MPropertyFriendlyName = "Damaged by Bullets?"
	bool m_bDamagedByBullets;
	// MPropertyDescription = "If checked, this breakble will take damage from Melee."
	// MPropertyFriendlyName = "Damaged by Melee?"
	bool m_bDamagedByMelee;
	// MPropertySuppressExpr = "m_bDamagedByMelee == false"
	bool m_bHeavyMeleeOnly;
	// MPropertyDescription = "If checked, this breakble will take damage from Abilities."
	// MPropertyFriendlyName = "Damaged by Abilities?"
	bool m_bDamagedByAbilities;
	// MPropertyDescription = "If checked, this breakble will take damage from Abilities."
	// MPropertyFriendlyName = "Damaged by Slide?"
	bool m_bDamagedBySlide;
	// MPropertyDescription = "If checked, only player pawns can damage this. Use for props that exist purely to be interacted with, so NPCs and world damage can never consume them."
	// MPropertyFriendlyName = "Damaged by Players Only?"
	bool m_bDamagedByPlayersOnly;
	// MPropertyDescription = "Health. Used by bullet and ability damage. Melee uses Melee Hits To Break instead, when that is set."
	int32 m_iHealth;
	// MPropertyDescription = "If > 0, melee ignores health and damage entirely and this breaks after this many melee hits, so melee damage scaling can never change how many hits it takes. Only deliberate melee attacks count, never dashes or slides."
	// MPropertyFriendlyName = "Melee Hits To Break"
	// MPropertySuppressExpr = "m_bDamagedByMelee == false"
	int32 m_nMeleeHitsToBreak;
	// MPropertyDescription = "How many hits a heavy melee counts as. 2 means one heavy opens a two-hit prop."
	// MPropertyFriendlyName = "Heavy Melee Hit Count"
	// MPropertySuppressExpr = "m_nMeleeHitsToBreak <= 0"
	int32 m_nHeavyMeleeHitCount; // = 2
	// MPropertyDescription = "If checked, a single melee swing can only hit one of these. When several are in the swing, only the nearest is hit, so they cannot be cleaved together."
	// MPropertyFriendlyName = "No Melee Cleave"
	// MPropertySuppressExpr = "m_bDamagedByMelee == false"
	bool m_bNoMeleeCleave;
	// MPropertyDescription = "Can be mantled?"
	bool m_bIsMantleable;
	bool m_bRequireFullCostToBreak; // = true
	// MPropertyDescription = "Glow when within this range"
	float32 m_flOutlineRadius;
	// MPropertyDescription = "Also require being visible on the minimap"
	// MPropertySuppressExpr = "m_flOutlineRadius <= 0"
	bool m_bRequireVisibleOnMinimapForOutline;
	// MPropertyDescription = "What color to glow"
	// MPropertySuppressExpr = "m_flOutlineRadius <= 0"
	Color m_colorOutline;
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Model"
	// MPropertyProvidesEditContextString = "ToolEditContext_ID_VMDL"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	float32 m_flModelScale; // = 1
	// MPropertyFriendlyName = "Material Group"
	CModelMaterialGroupName m_sMaterialGroupName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ambientParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_breakParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_breakRollFailParticle;
	// MPropertyStartGroup = "Audio"
	// MPropertyDescription = "3D Sound of the prop breaking"
	CSoundEventName m_sBreakSound;
	CSoundEventName m_sSpawnSound;
	CSoundEventName m_sBreakRollFailSound;
	// MPropertyDescription = "3D Sound of the prop taking damage"
	CSoundEventName m_sMeleeDamageSound;
	CSoundEventName m_sOtherDamageSound;
	// MPropertyDescription = "3D Sound of a hit this prop refuses to take damage from. Deliberately melee-only, bullets fire too fast to give each rejected shot a sound"
	CSoundEventName m_sMeleeRejectSound;
	CSoundEventName m_OtherRejectSound;
	// MPropertyDescription = "3D ambient sound that plays while the prop is alive"
	CSoundEventName m_sAmbientSound;
	// MPropertyStartGroup = "Respawn Behavior"
	float32 m_flInitialSpawnTime; // = 180
	// MPropertyDescription = "In test maps, use this as our initial spawn time"
	float32 m_flInitialSpawnTimeTest; // = 1
	// MPropertyDescription = "Respawn time"
	float32 m_flRespawnTime; // = 180
	// MPropertyDescription = "In test maps, use this as our respawn time"
	float32 m_flRespawnTimeTest; // = 10
	// MPropertyStartGroup = "UI"
	// MPropertyDescription = "CSS class to apply to this breakable's minimap icon while alive"
	CUtlString m_strMinimapCSSClassAlive;
	// MPropertyDescription = "CSS class to apply to this breakable's minimap icon while dead"
	CUtlString m_strMinimapCSSClassDead;
	// MPropertyDescription = "If > 0, this breakable will not appear on the minimap until a player gets this close"
	float32 m_flMinDistanceToRevealOnMinimap;
	// MPropertyStartGroup = "In-World Panel Settings"
	// MPropertyCustomFGDType = "panorama_layout"
	CUtlString m_strLayoutFile;
	// MPropertySuppressExpr = "m_strLayoutFile == """
	float32 m_flPanelHeightOffset;
	// MPropertySuppressExpr = "m_strLayoutFile == """
	float32 m_flPanelDrawDistance;
	// MPropertyDescription = "CSS class to apply to in-world panel"
	// MPropertySuppressExpr = "m_strLayoutFile == """
	CUtlString m_strInWorldCSSClasses;
	// MPropertySuppressExpr = "m_strLayoutFile == """
	float32 m_flPanelWidth; // = 1500
	// MPropertySuppressExpr = "m_strLayoutFile == """
	float32 m_flPanelHeight; // = 1500
	// MPropertyStartGroup = "Powerup Settings"
	// MPropertyDescription = "Chance for this to drop a primary reward, 0 - 100%, this rolls first"
	float32 m_flPowerupDropChance;
	// MPropertyDescription = "Category for the random roller"
	ECitadelRandomRollTypes m_eRollType; // = "ECitadelRandomRoll_BreakableGoldPickup"
	// MPropertyDescription = "What this prop can drop."
	// MPropertyFriendlyName = "Rewards"
	// MPropertySuppressExpr = "m_eRollType == ECitadelRandomRoll_BreakablePowerupPickup"
	CUtlOrderedMap< CSubclassName< 0 >, float32 > m_mapPickupChances;
};
