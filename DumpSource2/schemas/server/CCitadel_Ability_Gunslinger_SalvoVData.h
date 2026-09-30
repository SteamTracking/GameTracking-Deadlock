// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Gunslinger_SalvoVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BulletWarningParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcWatcherModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VictimWarningModifier;
};
