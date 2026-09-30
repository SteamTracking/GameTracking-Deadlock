// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_NeutralSelfAoEVData : public CModifierNeutralAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRadius; // = 400
	float32 m_flHeight; // = 80
	float32 m_flDPS; // = 50
	float32 m_flTickRate; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RadiusParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAttackHitSound;
};
