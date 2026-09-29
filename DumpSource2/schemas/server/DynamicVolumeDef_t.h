// MGetKV3ClassDefaults = {
//	"m_source": null,
//	"m_target": null,
//	"m_nHullIdx": -1,
//	"m_vSourceAnchorPos": null,
//	"m_vTargetAnchorPos": null,
//	"m_nAreaSrc": 4294967295,
//	"m_nAreaDst": 4294967295,
//	"m_bAttached": false
//}
class DynamicVolumeDef_t
{
	CHandle< CBaseEntity > m_source;
	CHandle< CBaseEntity > m_target;
	int32 m_nHullIdx;
	VectorWS m_vSourceAnchorPos;
	VectorWS m_vTargetAnchorPos;
	uint32 m_nAreaSrc;
	uint32 m_nAreaDst;
	bool m_bAttached;
};
