class CNavLinkConnectionSave
{
	// MNotSaved
	CHandle< CBaseEntity > m_hLinkEntity;
	uint32 m_nLinkArea;
	NavAreaSave_t m_otherArea; // = { "m_hDeformable": null, "m_nOtherAreaIdGlobalOrLocal": 4294967295 }
	Vector m_vPortalALocal;
	Vector m_vPortalBLocal;
	bool m_bIsEntry;
};
