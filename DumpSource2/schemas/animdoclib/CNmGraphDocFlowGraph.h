// MGetKV3ClassDefaults = {
//	"_class": "CNmGraphDocFlowGraph",
//	"m_ID": "",
//	"m_nodes":
//	[
//	],
//	"m_graphType": "Invalid",
//	"m_viewOffset":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_flViewZoom": 1.000000,
//	"m_connections":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CNmGraphDocFlowGraph : public CNmGraphDocGraph
{
	CUtlVector< CNmGraphDocFlowGraph::Connection_t > m_connections;
};
