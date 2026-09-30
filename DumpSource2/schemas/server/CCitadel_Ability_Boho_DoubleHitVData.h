// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Boho_DoubleHitVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastLifeLeechParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSlashSound;
	CSoundEventName m_strHitConfirmSound;
};
