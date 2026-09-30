// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CorpseExplosionThinkerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WarningParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTickRate; // = 0.5
};
