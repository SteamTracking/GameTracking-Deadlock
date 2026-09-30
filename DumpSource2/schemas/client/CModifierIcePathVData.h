// MHasKV3TransferPolymorphicClassname
class CModifierIcePathVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_FrontModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BodyModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GroundParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FloatingParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IcePathBuffParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ExplodeModifier;
	CEmbeddedSubclass< CCitadelModifierAura > m_FriendlyAuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BonusSpiritLingerModifier;
};
