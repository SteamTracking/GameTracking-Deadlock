// MGetKV3ClassDefaults = {
//	"_class": "SndBeatEventKeyedMidiNotes_t",
//	"m_flKey": 0.000000,
//	"m_nStatus": 9,
//	"m_nNote": 60,
//	"m_nVelocity": 127
//}
// MHasKV3TransferPolymorphicClassname
class SndBeatEventKeyedMidiNotes_t : public SndBeatEventKeys_t
{
	// MPropertyFriendlyName = "Status"
	uint8 m_nStatus;
	// MPropertyFriendlyName = "Note"
	uint8 m_nNote;
	// MPropertyFriendlyName = "Velocity"
	uint8 m_nVelocity;
};
