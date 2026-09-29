// MGetKV3ClassDefaults = {
//	"_class": "EventGrantDefinition_Action_t",
//	"m_eEvent": "EVENT_ID_NONE",
//	"m_unGrantCount": 1,
//	"m_bShouldSkipAudit": false
//}
// MHasKV3TransferPolymorphicClassname
class EventGrantDefinition_Action_t : public EventGrantDefinition_t
{
	EEvent m_eEvent;
	uint32 m_unGrantCount;
	bool m_bShouldSkipAudit;
};
