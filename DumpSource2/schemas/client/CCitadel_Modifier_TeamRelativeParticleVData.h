// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_TeamRelativeParticleVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ParentViewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_OtherPlayerViewParticle;
};
