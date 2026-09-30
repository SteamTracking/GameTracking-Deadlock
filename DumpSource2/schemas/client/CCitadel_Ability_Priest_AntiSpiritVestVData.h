// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Priest_AntiSpiritVestVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ShieldBreakModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strProcSound;
};
