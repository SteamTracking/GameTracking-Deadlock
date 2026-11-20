// MHasKV3TransferPolymorphicClassname
class CAbility_Mirage_Tornado_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TornadoCastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_WhirlwindEvasionModifier;
	CEmbeddedSubclass< CCitadelModifier > m_TornadoAura;
	CEmbeddedSubclass< CCitadelModifier > m_AdditionalTornadoMover;
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceTravelingInTornado;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_PurgeSound;
};
