// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Necro_GraveStoneVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastWarningParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSummonGravestoneSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_GraveStoneModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ZombieSummonModifier;
	// MPropertyStartGroup = "Gameplay"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	float32 m_flStoneSubmergeMinDepth; // = 10
	float32 m_flStoneSubmergeMaxDepth; // = 10
	float32 m_flStonePitchMinOffset;
	float32 m_flStonePitchMaxOffset;
	float32 m_flStoneRollMinOffset;
	float32 m_flStoneRollMaxOffset;
	float32 m_flStoneYawMinOffset;
	float32 m_flStoneYawMaxOffset;
	float32 m_flDropDownRate;
	float32 m_flClimbHeight;
	float32 m_flDistanceAboveGround;
	float32 m_flNavMeshSearchRadius; // = 10
	bool m_bAllowStackingDamageFromGun; // = true
};
