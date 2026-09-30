// MHasKV3TransferPolymorphicClassname
class CAI_BaseNPCVData : public CEntitySubclassVDataBase
{
	// MPropertyGroupName = "Visuals"
	// MPropertyProvidesEditContextString = "ToolEditContext_ID_VMDL"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelName;
	// MPropertyGroupName = "Sounds"
	CFootstepTableHandle m_hFootstepSounds;
	// MPropertyFriendlyName = "Nav Link Movements"
	// MPropertyDescription = "List of the kind of nav links movement this unit is capable of."
	// MPropertyCustomFGDType = "vdata_choice:scripts/navlinks.vdata"
	CUtlVector< CGlobalSymbol > m_vecNavLinkMovementNames;
	float32 m_flAimConeAngle; // = 6
	int32 m_nMaxHealth; // = 100
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_vecIntrinsicModifiers;
	CUtlVector< CSubclassName< 2 > > m_vecIntrinsicModifiersByName;
	// MPropertyFriendlyName = "Status Effects"
	// MPropertyDescription = "List of the status effects this NPC cares about"
	NPCStatusEffectMap_t m_statusEffectMap;
	CUtlVector< NPCAttachmentDesc_t > m_vecAttachments;
	// MPropertyStartGroup = "Damage"
	bool m_bTakesDamage; // = true
	// MPropertyDescription = "Damaged Effect"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strDamagedEffect;
	// MPropertyDescription = "Amount of health to grant to a ragdoll before the ragdoll is destroyed."
	int32 m_nRagdollHealth;
	// MPropertyDescription = "Scale on the energy used to look up into the damage tables for physics impacts (including vehicle impacts)."
	float32 m_flImpactEnergyScale; // = 1
	// MPropertyStartGroup = "Navigation"
	bool m_bAllowNonZUpMovement;
	// MPropertyDescription = "If true, this NPC will use a dynamic collision hull that allows it to be pushed by heavy things and affected by constraints."
	bool m_bUseDynamicCollisionHull;
	// MPropertyDescription = "If true, this NPC will use the capsule collision.  Capsule collision will also be used if m_bAllowNonZUpMovement is set."
	bool m_bRequestCapsuleCollision;
	// MPropertyDescription = "Override the radius of the capsule. Requires m_bAllowNonZUpMovement or m_bRequestCapsuleCollision to be set. 0 to use collision prop OBB"
	float32 m_flCapsuleRadiusOverride;
	// MPropertyDescription = "Override the height of the capsule. Requires m_bAllowNonZUpMovement or m_bRequestCapsuleCollision to be set. 0 to use collision prop height."
	float32 m_flCapsuleHeightOverride;
	// MPropertyStartGroup = "Animation"
	// MPropertyFriendlyName = "Enabled Shared Actions"
	// MPropertyDescription = "List of the shared BaseNPC actions this NPC supports"
	// MPropertyAttributeEditor = "AnimGraphParamEnumValue()"
	// MPropertyEditContextOverrideValue = "ToolEditContext_ID_AnimGraphEnumName"
	CUtlVector< CGlobalSymbol > m_vecActionDesiredShared;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Player Killed NPC Sound"
	CSoundEventName m_sPlayerKilledNpcSound;
	// MPropertyStartGroup = "Movement"
	// MPropertyFriendlyName = "Default Movement Settings"
	// MPropertyAttributeEditor = "VDataChoice( scripts/basenpc_movementsettings.vdata )"
	CUtlString m_sDefaultMovementSettings;
	// MPropertyFriendlyName = "Mapped Movement Settings"
	CUtlVector< AI_MappedMovementSettingsItem_t > m_mappedMovementSettings;
	// MPropertyDescription = "If true, this NPC will use code driven animgraph movement actions such as starts and stops"
	bool m_bEnableCodeDrivenAnimgraphMovement;
	// MPropertyDescription = "If true, the NPC will request strafing if it is supported by the animgraph. Can still be overriden by schedules."
	bool m_bEnableAnimgraphTagDrivenStrafing; // = true
	float32 m_flMassOverride; // = -1
};
