// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_TestHero_SummonSoldierVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSoldierShootSound;
	// MPropertyStartGroup = "Gameplay"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	float32 m_flHorizontalOffset;
	float32 m_flForwardOffset;
	float32 m_flHorizontalStaggerPerSoldier; // = 40
	float32 m_flRandomPositionOffset; // = 30
	float32 m_flRandomMissTargetOffset; // = 30
};
