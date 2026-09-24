// MGetKV3ClassDefaults = {
//	"m_name": "",
//	"m_outputID":
//	{
//		"m_id": 0
//	},
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
//	}
//}
// MPropertyFriendlyName = "Input Item"
// MPropertyElementNameFn
class CConnectionProxyItem
{
	// MPropertyFriendlyName = "Name"
	CUtlString m_name;
	// MPropertySuppressField
	AnimNodeOutputID m_outputID;
	// MPropertySuppressField
	CAnimGraphDoc_NodeConnection m_inputConnection;
};
