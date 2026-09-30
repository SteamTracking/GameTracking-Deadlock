class NPCAttachmentDesc_t
{
	CUtlString m_sAttachmentName;
	CUtlString m_sEntityName;
	Vector m_vOffset;
	QAngle m_aAngOffset;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_sModelName;
	CUtlVector< NPCAttachmentSpawnKV_t > m_vecSpawnKV;
};
