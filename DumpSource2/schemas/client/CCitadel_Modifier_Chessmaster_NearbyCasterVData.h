// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Chessmaster_NearbyCasterVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraParticleFriendly;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AuraParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TetherParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BuffModifier;
};
