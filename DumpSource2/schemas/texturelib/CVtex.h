// MGetKV3ClassDefaults = {
//	"m_inputTextureArray":
//	[
//	],
//	"m_outputTypeString": "",
//	"m_outputFormat": "",
//	"m_outputClearColor":
//	[
//		0.000000,
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_nOutputMinDimension": 0,
//	"m_nOutputMaxDimension": 0,
//	"m_nOutputDimensionReduce": 0,
//	"m_textureOutputChannelArray":
//	[
//	],
//	"m_vClamp":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_bNoLod": false,
//	"m_bHiddenAssetFlag": false,
//	"m_bNormalizeRange": false,
//	"m_bVirtualTexture": false,
//	"m_nDisplayRectWidth": 0,
//	"m_nDisplayRectHeight": 0,
//	"m_nMotionVectorsMaxDistanceInPixels": 0
//}
class CVtex
{
	CUtlVector< CInputTexture > m_inputTextureArray;
	CUtlString m_outputTypeString;
	CUtlString m_outputFormat;
	Vector4D m_outputClearColor;
	int32 m_nOutputMinDimension;
	int32 m_nOutputMaxDimension;
	int32 m_nOutputDimensionReduce;
	CUtlVector< CTextureOutputChannel > m_textureOutputChannelArray;
	Vector m_vClamp;
	bool m_bNoLod;
	bool m_bHiddenAssetFlag;
	bool m_bNormalizeRange;
	bool m_bVirtualTexture;
	int32 m_nDisplayRectWidth;
	int32 m_nDisplayRectHeight;
	int32 m_nMotionVectorsMaxDistanceInPixels;
};
