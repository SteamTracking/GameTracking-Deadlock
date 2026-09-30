// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Mirage_SandPhantom_Passive_Victim_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RevealModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffStatusPlayerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffStatusVictimParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffStatusNPCParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StackDamageParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StackReadyParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StackAppliedParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ConsumeMaxStacksSound;
	CSoundEventName m_ConsumeMaxStacksHeroSound;
	CSoundEventName m_ApplyStackSound;
	CSoundEventName m_ApplyStackNPCSound;
	CSoundEventName m_StunSound;
};
