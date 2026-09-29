// MGetKV3ClassDefaults = {
//	"m_name": "",
//	"m_fileName": "",
//	"m_colorSpace": "",
//	"m_fileExt": "",
//	"m_nMinBitsPerChannel": -1,
//	"m_typeString": "",
//	"m_bPassThroughToCompiledVtex": false,
//	"m_n3DSliceCount": -1,
//	"m_n3DSliceWidth": -1,
//	"m_n3DSliceHeight": -1,
//	"m_imageProcessorArray":
//	[
//	]
//}
class CInputTexture
{
	CUtlString m_name;
	CUtlString m_fileName;
	CUtlString m_colorSpace;
	CUtlString m_fileExt;
	int32 m_nMinBitsPerChannel;
	CUtlString m_typeString;
	bool m_bPassThroughToCompiledVtex;
	int32 m_n3DSliceCount;
	int32 m_n3DSliceWidth;
	int32 m_n3DSliceHeight;
	CUtlVector< CImageProcessor > m_imageProcessorArray;
};
