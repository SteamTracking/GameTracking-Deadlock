// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_CheatDeathVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamagePulseParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageTargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sHealPulseSound;
	CSoundEventName m_sHealAndDamagePulseSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DeathImmuneModifier;
};
