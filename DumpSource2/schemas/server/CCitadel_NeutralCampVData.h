// MHasKV3TransferPolymorphicClassname
class CCitadel_NeutralCampVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Gameplay"
	int32 m_iInitialSpawnDelayInSeconds; // = 120
	int32 m_iSpawnIntervalInSeconds; // = 120
	int32 m_iSpawnIntervalChange;
	int32 m_iSpawnIntervalMin; // = 300
	float32 m_flNeutralMovementRadius; // = 1000
	ENeutralNPCType m_eNeutralType; // = "NEUTRAL_NPC_NORMAL"
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_sIdleAmbient;
	CSoundEventName m_sAlertAmbient;
};
