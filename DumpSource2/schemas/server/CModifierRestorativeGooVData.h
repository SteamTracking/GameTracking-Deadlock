// MHasKV3TransferPolymorphicClassname
class CModifierRestorativeGooVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RestorativeGooEndParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_ModelName;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SelfCubeModelName;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BreakoutProgressBarModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PostCubeBuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_NonTargetLoopingSound;
	CSoundEventName m_TargetLoopingSound;
	CSoundEventName m_LightMeleeImpact;
	CSoundEventName m_HeavyMeleeImpact;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flBreakoutProectionTime; // = 0.5
};
