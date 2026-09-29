// MGetKV3ClassDefaults = {
//	"_class": "CModifierProperty",
//	"m_hOwner": null,
//	"m_bAllowModifiersOnDeadEntities": false,
//	"m_nDisabledGroups": 0,
//	"m_bvEnabledStateMask":
//	[
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0
//	],
//	"m_bvDisabledStateMask":
//	[
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0
//	],
//	"m_bvEnabledPredictedStateMask":
//	[
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0,
//		0
//	],
//	"m_bParentWantsModifierStateChangeCallback": false
//}
// MHasKV3TransferPolymorphicClassname
class CModifierProperty
{
	// MNotSaved
	CNetworkVarChainer __m_pChainEntity;
	CHandle< CBaseEntity > m_hOwner;
	// MKV3TransferSaveOpsForField = "ModifierSaveRestoreOps"
	CUtlVector< CBaseModifier* > m_vecModifiers;
	// MNotSaved
	bool m_bPredictedOwner;
	bool m_bAllowModifiersOnDeadEntities;
	// MNotSaved
	int8 m_iLockRefCount;
	// MNotSaved
	ModifierPropRuntimeHandle_t m_hHandle;
	// MNotSaved
	uint32 m_nBroadcastEventListenerMask;
	// MNotSaved
	ParticleIndex_t m_nCachedHighestParticleIndex;
	// MKV3TransferSaveOpsForField = "GetModifierOwnerEventsSaveRestoreOps"
	CUtlVector< OwnerModifierEventListener_t >* m_pNotifyOwnerEvents;
	uint32 m_nDisabledGroups;
	uint32[11] m_bvEnabledStateMask;
	uint32[11] m_bvDisabledStateMask;
	uint32[11] m_bvEnabledPredictedStateMask;
	bool m_bParentWantsModifierStateChangeCallback;
};
