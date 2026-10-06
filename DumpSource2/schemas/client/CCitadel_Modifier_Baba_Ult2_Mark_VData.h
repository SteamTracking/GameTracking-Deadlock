// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Baba_Ult2_Mark_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LockingOnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LockingOnParticleCaster;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TickParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FinalTickParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strVictimLockonSound;
	CSoundEventName m_strVictimMaxLockonSound;
	// MPropertyDescription = "Warning sound to play before the final pigeon if victim has max lock-ons"
	CSoundEventName m_strFinalPigeonWarning;
	// MPropertyStartGroup = "Impact"
	// MPropertyDescription = "Seconds from a barrage hit's FX to its damage, hit sound and hex landing"
	float32 m_flImpactDelay;
	// MPropertyDescription = "Added for each barrage hit. The hit lands when it expires"
	CEmbeddedSubclass< CCitadelModifier > m_ImpactModifier;
};
