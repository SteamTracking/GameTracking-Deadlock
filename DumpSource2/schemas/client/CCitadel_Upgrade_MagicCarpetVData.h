// MHasKV3TransferPolymorphicClassname
class CCitadel_Upgrade_MagicCarpetVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_FlyingCarpetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SummonFlyingCarpetModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SummonFlyingCarpetVisualModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FlyingCarpetVisualModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flSummonVisualDuration; // = 2
	float32 m_flBurstSpeedBonus; // = 200
	float32 m_flBurstSpeedMin; // = 600
	float32 m_flBurstSpeedDuration; // = 0.5
	float32 m_flMinDistanceAboveGround; // = 30
};
