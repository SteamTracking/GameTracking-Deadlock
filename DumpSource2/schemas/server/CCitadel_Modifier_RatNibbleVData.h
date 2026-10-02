// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RatNibbleVData : public CCitadelModifierVData
{
	CEmbeddedSubclass< CCitadelModifier > m_LingerModifier;
	// MPropertyDescription = "Shows the target's combined bullet armor reduction from every nibble debuff and linger as one overhead icon"
	CEmbeddedSubclass< CCitadelModifier > m_ArmorTotalModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_DpsSound;
	CSoundEventName m_strDashOffSound;
	CSoundEventName m_strRatReleaseSound;
	CSoundEventName m_strExpireOffPlayerSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flArmorReductionRatioNonHero; // = 0.5
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatScreenParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatCountParticle;
};
