// MGetKV3ClassDefaults = {
//	"_class": "CAnimGraphDoc_ClipData",
//	"m_tagSpans":
//	[
//	],
//	"m_clipName": ""
//}
// MPropertyFriendlyName = "Clip Data"
// MHasKV3TransferPolymorphicClassname
class CAnimGraphDoc_ClipData
{
	// MPropertySuppressField
	CUtlVector< CSmartPtr< CAnimGraphDoc_TagSpan > > m_tagSpans;
	// MPropertyFriendlyName = "Sequence"
	// MPropertyAttributeChoiceName = "Sequence"
	CUtlString m_clipName;
};
