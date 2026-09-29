// MGetKV3ClassDefaults = {
//	"m_nAnimationAlgorithm": "eInvalid",
//	"m_nNextExternalGraphHandle": 0,
//	"m_vecSecondarySkeletonSlotIDs":
//	[
//	],
//	"m_vecSecondarySkeletons":
//	[
//	],
//	"m_nSecondarySkeletonMasterCount": 0,
//	"m_flSoundSyncTime": 0.000000,
//	"m_nActiveIKChainMask": 0,
//	"m_hSequence": -1,
//	"m_flSeqStartTime": null,
//	"m_flSeqFixedCycle": 0.000000,
//	"m_nAnimLoopMode": "ANIM_LOOP_MODE_USE_SEQUENCE_SETTINGS",
//	"m_flPlaybackRate": 1.000000,
//	"m_nNotifyState": "eDoNotNotify",
//	"m_bNetworkedAnimationInputsChanged": false,
//	"m_bNetworkedSequenceChanged": false,
//	"m_bLastUpdateSkipped": false,
//	"m_bSequenceFinished": false,
//	"m_nPrevAnimUpdateTick": null,
//	"m_hGraphDefinitionAG2": "",
//	"m_nServerGraphInstanceIteration": 0,
//	"m_nServerSerializationContextIteration": 0,
//	"m_primaryGraphId": 0,
//	"m_vecExternalGraphIds":
//	[
//	],
//	"m_vecExternalClipIds":
//	[
//	],
//	"m_sAnimGraph2Identifier": "",
//	"m_pGraphInstanceAG2": null,
//	"m_vecExternalGraphs": null
//}
class CBaseAnimGraphController : public CSkeletonAnimationController
{
	AnimationAlgorithm_t m_nAnimationAlgorithm;
	ExternalAnimGraphHandle_t m_nNextExternalGraphHandle;
	CNetworkUtlVectorBase< CGlobalSymbol > m_vecSecondarySkeletonSlotIDs;
	CNetworkUtlVectorBase< CHandle< CBaseAnimGraph > > m_vecSecondarySkeletons;
	int32 m_nSecondarySkeletonMasterCount;
	float32 m_flSoundSyncTime;
	uint32 m_nActiveIKChainMask;
	HSequence m_hSequence;
	GameTime_t m_flSeqStartTime;
	float32 m_flSeqFixedCycle;
	AnimLoopMode_t m_nAnimLoopMode;
	CNetworkedQuantizedFloat m_flPlaybackRate;
	SequenceFinishNotifyState_t m_nNotifyState;
	bool m_bNetworkedAnimationInputsChanged;
	bool m_bNetworkedSequenceChanged;
	bool m_bLastUpdateSkipped;
	bool m_bSequenceFinished;
	GameTick_t m_nPrevAnimUpdateTick;
	CStrongHandle< InfoForResourceTypeCNmGraphDefinition > m_hGraphDefinitionAG2;
	// MNotSaved
	CUtlVectorEmbeddedNetworkVar< AnimGraph2SerializedPoseRecipeSlot_t > m_SerializePoseRecipeAG2Slots;
	// MNotSaved
	CNetworkUtlVectorBase< uint8 > m_SerializePoseRecipeAG2Dynamic;
	// MNotSaved
	uint32 m_nSerializePoseRecipeAG2ActiveSlot;
	// MNotSaved
	int32 m_nSerializePoseRecipeVersionAG2;
	int32 m_nServerGraphInstanceIteration;
	int32 m_nServerSerializationContextIteration;
	ResourceId_t m_primaryGraphId;
	CNetworkUtlVectorBase< ResourceId_t > m_vecExternalGraphIds;
	CNetworkUtlVectorBase< ResourceId_t > m_vecExternalClipIds;
	CGlobalSymbol m_sAnimGraph2Identifier;
	CAnimGraph2InstancePtr m_pGraphInstanceAG2;
	CExternalAnimGraphList m_vecExternalGraphs;
};
