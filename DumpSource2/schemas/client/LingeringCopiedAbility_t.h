class LingeringCopiedAbility_t
{
	CHandle< C_CitadelBaseAbility > m_hAbility;
	CHandle< C_CitadelBaseAbility > m_hCompanionOf;
	int32 m_nBulletsStillLive;
	CUtlVector< CModifierHandleTyped< CCitadelModifier > > m_vecModifiers;
	CUtlVector< CHandle< C_BaseEntity > > m_vecSpawnedEntities;
	GameTime_t m_flLastTimeShouldKeepTrained;
};
