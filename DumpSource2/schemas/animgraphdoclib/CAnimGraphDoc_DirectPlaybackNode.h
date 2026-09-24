// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_DirectPlaybackNode",
//	"m_sName": "Unnamed",
//	"m_vecPosition":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_nNodeID":
//	{
//		"m_id": 0
//	},
//	"m_bDebugThisNode": false,
//	"m_networkMode": "ServerAuthoritative",
//	"m_inputConnection":
//	{
//		"m_nodeID":
//		{
//			"m_id": 0
//		},
//		"m_outputID":
//		{
//			"m_id": 0
//		}
//	},
//	"m_bFinishEarly": false,
//	"m_bResetOnFinish": true
//}
// MPropertyFriendlyName = "Direct Playback"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_DirectPlaybackNode : public CAnimGraphDoc_Node
{
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
	// MPropertyFriendlyName = "Finish Early"
	bool m_bFinishEarly;
	// MPropertyFriendlyName = "Reset Child On Finish"
	bool m_bResetOnFinish;
};
