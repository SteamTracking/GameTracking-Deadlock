// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_GoldenIdolVData : public CCitadel_Ability_BaseHeldItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnKnockedOffHolderParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnKnockedOffUrnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnOverheldDamageParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OnExpireParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strUrnMeleeDropSound;
	CSoundEventName m_strUrnOverheldDamageSound;
	CSoundEventName m_strUrnDroppedOffSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DropoffTimerModifier;
	CEmbeddedSubclass< CCitadelModifier > m_HoldingIdolModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flRevealTime; // = 30
	int32 m_iComebackBounty; // = 130
	float32 m_flDamageTickRate; // = 1
	float32 m_flMaxHealthDamage; // = 0.01
	float32 m_flTimeToDamage; // = 75
	float32 m_flTimeToRunBackInstantly; // = 40
	float32 m_flHeldTimeRadius; // = 1574.800049
	float32 m_flJuggleTimeAdd; // = 8
};
