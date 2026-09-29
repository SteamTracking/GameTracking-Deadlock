// MGetKV3ClassDefaults = {
//	"_class": "EventGrantDefinition_Points_t",
//	"m_unPoints": 0,
//	"m_unPremiumPoints": 0,
//	"m_unAuditAction": 0,
//	"m_unAuditData": 0,
//	"m_eEventID": "EVENT_ID_NONE",
//	"m_bRequireEventOwnership": true,
//	"m_bRewardSeasonalPoints": false
//}
// MHasKV3TransferPolymorphicClassname
class EventGrantDefinition_Points_t : public EventGrantDefinition_t
{
	uint32 m_unPoints;
	uint32 m_unPremiumPoints;
	uint32 m_unAuditAction;
	uint64 m_unAuditData;
	EEvent m_eEventID;
	bool m_bRequireEventOwnership;
	bool m_bRewardSeasonalPoints;
};
