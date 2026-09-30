// MHasKV3TransferPolymorphicClassname
class CNPC_BaseDefenseSentryVData : public CNPC_SimpleAnimatingAIVData
{
	CSubclassName< 4 > m_AbilityWeapon;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SentryExplosionParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTimeToStartScale; // = 15
	float32 m_flTimeToEndScale; // = 50
	float32 m_flMaxScale; // = 2
};
