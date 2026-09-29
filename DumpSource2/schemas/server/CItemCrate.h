class CItemCrate : public CPhysicsProp
{
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CHandle< CBaseEntity > m_hSpawner;
	EObjectivePositions_t m_eObjectivePosition;
	int32 m_eLootType;
};
