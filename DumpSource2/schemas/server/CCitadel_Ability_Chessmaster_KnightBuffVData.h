// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Chessmaster_KnightBuffVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifierAura > m_AuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_MoveBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SlowModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strExplosionSound;
};
