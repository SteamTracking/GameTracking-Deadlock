// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_NodeManager",
//	"m_nodes":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_NodeManager
{
	// MPropertySuppressField
	CUtlHashtable< AnimNodeID, CSmartPtr< CAnimGraphDoc_Node > > m_nodes;
};
