// MHasKV3TransferPolymorphicClassname
class CAI_PathCost : public CNavPathCost
{
	CHandle< CAI_BaseNPC > m_hNpc;
	CNavRestrictionVolumeCached m_navRestrictionVolume;
	CNavAttribute m_DisallowedAttributes;
	uint32 m_nDisallowedAttributesDynamic;
	bool m_bNavLinksEnabled; // = true
	float32 m_flNavLinkPenalty;
	float32 m_flAvoidanceAreaCost; // = 250
	float32 m_flAvoidanceAreaDistScale; // = 10
	CUtlVectorFixed< INavPathCostAreaFilter*, 4 > m_vecFuncAreaFilter;
	CHandle< CBaseEntity > m_hIgnoreBlockingEntity;
};
