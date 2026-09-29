// MGetKV3ClassDefaults = {
//	"_class": "CMixTrack",
//	"m_name": "",
//	"m_Comment": "",
//	"m_bActive": true,
//	"m_bSolo": false,
//	"m_bEditProperties": false,
//	"m_nGenerationId": 0,
//	"m_nChannels": -1,
//	"m_nMixDown": "SUM",
//	"m_nSendOperator": "NAMED_SEND",
//	"m_SendNames":
//	[
//		"",
//		"",
//		"",
//		""
//	]
//}
// MPropertyFriendlyName = "VMix Track Node"
// MPropertyDescription = "This node creates a track.Voices can be played on a track.  This is the source of audio for your graph."
// MHasKV3TransferPolymorphicClassname
class CMixTrack : public CMixPropertyBase
{
	// MPropertyDescription = "Leave this as "Automatic" unless you are forcing mono/stereo for some reason.  That way each graph will get configured to match the incoming vsnd (for a voice graph) or the audio device (main mix graph)"
	// MPropertyAttributeChoiceName = "channel_count"
	int32 m_nChannels;
	// MPropertyDescription = "This determines what happens when your incoming audio doesn't match the channel count for the track.  e.g. for a mono track, this is the rule for what happens to stereo audio"
	// MPropertyFriendlyName = "Mix Down Rule"
	VMixMixDownRule_t m_nMixDown;
	// MPropertyFriendlyName = "Send Child Voices"
	// MPropertyDescription = "This refers to a piece of code in the sound engine that will select specific child voices to be mixed into this track and at what mix level each voice will be mixed.<br>If you want to drive that with data, choose "By Named Send" and author a list of send names for this track.  Then any sound event can send to one of those names and the audio will be mixed here."
	// MPropertyGroupName = "Child Voices"
	VMixSendOperator_t m_nSendOperator;
	// MPropertyGroupName = "Child Voices"
	// MPropertyFriendlyName = "Send Names"
	CUtlString[4] m_SendNames;
};
