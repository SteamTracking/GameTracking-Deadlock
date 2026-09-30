// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_TestHero_WallClingVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChannelParticle;
	// MPropertyStartGroup = "Movement"
	float32 m_flWallClingBackupDistance; // = 10
	float32 m_flWallClingWallOffsetDistance; // = 50
	float32 m_flWallClingTraceDistance; // = 300
	float32 m_flWallClingTraceRadius; // = 40
	float32 m_flWallClingSearchRadius; // = 10
	bool m_bWallClingDebug; // = true
	float32 m_flAcceleration; // = 40
	float32 m_flWallClingStickyForce; // = 40
};
