// MHasKV3TransferPolymorphicClassname
class CModifierNeutralSporeAuraVData : public CCitadelModifierAuraVData
{
	float32 m_flExplodeDamage; // = 50
	float32 m_flArmTime; // = 1
	float32 m_flDetonateTime; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	CSoundEventName m_ArmSound;
	CSoundEventName m_DetonateActivatedSound;
};
