// MGetKV3ClassDefaults = {
//	"_class": "CMaterialAttributeAnimTag",
//	"m_name": "Unnamed Tag",
//	"m_sComment": "",
//	"m_group": "",
//	"m_tagID":
//	{
//		"m_id": 0
//	},
//	"m_bIsReferenced": false,
//	"m_AttributeName": "",
//	"m_AttributeType": "MATERIAL_ATTRIBUTE_TAG_VALUE",
//	"m_flValue": 0.000000,
//	"m_Color":
//	[
//		255,
//		255,
//		255
//	]
//}
// MPropertyFriendlyName = "Material Attribute Tag"
// MHasKV3TransferPolymorphicClassname
class CMaterialAttributeAnimTag : public CAnimTagBase
{
	// MPropertyFriendlyName = "Attribute Name"
	CUtlString m_AttributeName;
	// MPropertyFriendlyName = "Attribute Type"
	// MPropertyAutoRebuildOnChange
	MatterialAttributeTagType_t m_AttributeType;
	// MPropertyFriendlyName = "Value"
	// MPropertyAttrStateCallback
	float32 m_flValue;
	// MPropertyFriendlyName = "Color"
	// MPropertyAttrStateCallback
	Color m_Color;
};
