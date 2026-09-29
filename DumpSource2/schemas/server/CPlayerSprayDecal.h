class CPlayerSprayDecal : public CBaseModelEntity
{
	int32 m_nUniqueID;
	uint32 m_unAccountID;
	uint32 m_unTraceID;
	VectorWS m_vecEndPos;
	VectorWS m_vecStart;
	Vector m_vecLeft;
	Vector m_vecNormal;
	CPlayerSlot m_nPlayerSlot;
	int32 m_nEntity;
	int32 m_nHitbox;
	float32 m_flCreationTime;
	int32 m_nTintID;
	uint8 m_nVersion;
	CUtlString m_sTextureName;
	CUtlString m_sTextureNameDamaged;
	CUtlString m_sSoundNameDamaged;
	bool m_bDamaged;
};
