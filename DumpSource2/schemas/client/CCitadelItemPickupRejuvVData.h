// MHasKV3TransferPolymorphicClassname
class CCitadelItemPickupRejuvVData : public CCitadelItemPickupVData
{
	CSubclassName< 4 > m_AbilityProjectile;
	float32 m_flMaxDistForHeal; // = 1400
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RebirthModifier;
	CEmbeddedSubclass< CCitadelModifier > m_PunchPickupModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_IsFrozenParticle;
};
