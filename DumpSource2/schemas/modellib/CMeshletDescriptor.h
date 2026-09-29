// MGetKV3ClassDefaults = {
//	"m_PackedAABB":
//	{
//		"m_nMin": 0,
//		"m_nMax": 0
//	},
//	"m_CullingData":
//	{
//		"m_ConeAxis":
//		[
//			0,
//			0,
//			0
//		],
//		"m_ConeCutoff": 0
//	},
//	"m_nVertexOffset": 0,
//	"m_nTriangleOffset": 0,
//	"m_nVertexCount": 0,
//	"m_nTriangleCount": 0,
//	"m_nBoneIndex": 65534
//}
class CMeshletDescriptor
{
	PackedAABB_t m_PackedAABB;
	CDrawCullingData m_CullingData;
	uint32 m_nVertexOffset;
	uint32 m_nTriangleOffset;
	uint8 m_nVertexCount;
	uint8 m_nTriangleCount;
	uint16 m_nBoneIndex;
};
