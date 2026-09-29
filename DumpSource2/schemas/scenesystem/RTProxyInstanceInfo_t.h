// MGetKV3ClassDefaults = {
//	"m_nFlags": "",
//	"m_albedoFormat": "VERTEX_ALBEDO_NONE",
//	"m_emissiveFormat": "VERTEX_ALBEDO_NONE",
//	"m_nBLASCount": 0,
//	"m_nBLASIndex": 0,
//	"m_nVertexAlbedoByteOffset": 0,
//	"m_nVertexEmissiveByteOffset": 0,
//	"m_fEmissiveFactor": 0.000000,
//	"m_mWorldFromLocal":
//	[
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vTintColorSRGB":
//	[
//		255,
//		255,
//		255
//	]
//}
class RTProxyInstanceInfo_t
{
	RTProxyInstanceFlags_t m_nFlags;
	VertexAlbedoFormat_t m_albedoFormat;
	VertexAlbedoFormat_t m_emissiveFormat;
	uint16 m_nBLASCount;
	uint32 m_nBLASIndex;
	uint32 m_nVertexAlbedoByteOffset;
	uint32 m_nVertexEmissiveByteOffset;
	float32 m_fEmissiveFactor;
	matrix3x4_t m_mWorldFromLocal;
	Color m_vTintColorSRGB;
};
