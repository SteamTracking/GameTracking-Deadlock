// MHasKV3TransferPolymorphicClassname
class CCitadel_Neutral_Attack_SludgeVData : public CCitadel_Neutral_Attack_BulletToPointModifierVData
{
	float32 m_flDamage; // = 20
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifierAura > m_OnHitModifier;
};
