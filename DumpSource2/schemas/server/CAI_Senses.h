class CAI_Senses : public CAI_Component
{
	NPCSensingCategoryMask_t m_nSensedCategories;
	AI_SensingFlags_t m_iSensingFlags;
	AI_VolumetricEventFlags_t m_nExclusionFlags;
	float32 m_flSensingSensitivity;
	CAI_VolumetricEvent* m_pCachedTaskEvent;
	AI_VolumetricEventTypeMask_t m_nSensingInterests;
	// MNotSaved
	CUtlVectorFixedGrowable< AI_VolumetricEventHandle_t, 16 > m_vecAudibleEvents;
};
