// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MysticReverbExplosionVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageParticle;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
};
