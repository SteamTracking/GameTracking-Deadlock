// MHasKV3TransferPolymorphicClassname
class CModifierTier3BossLaserBeamDebuffVData : public CCitadelModifierVData
{
	float32 m_flTickRate; // = 0.5
	float32 m_flNPCDPS; // = 80
	float32 m_flPlayerDPS; // = 440
	float32 m_flMaxHealthDPS; // = 3
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberStatusEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphStatusEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphEffect;
};
