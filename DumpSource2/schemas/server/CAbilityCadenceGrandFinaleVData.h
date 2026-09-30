// MHasKV3TransferPolymorphicClassname
class CAbilityCadenceGrandFinaleVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_StageModel;
	float32 m_flStageModelHeight;
	float32 m_flStageModelWidth;
	float32 m_flStageModelLength;
	float32 m_flStageModelScale;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GrandFinaleAOEModifier;
};
