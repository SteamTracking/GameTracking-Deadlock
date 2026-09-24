// MGetKV3ClassDefaults = {
//	"_class": "CSmartPropVariable_SurfaceProperty",
//	"m_nElementID": -1,
//	"m_VariableName": "",
//	"m_bExposeAsParameter": false,
//	"m_DisplayName": "",
//	"m_HideExpression": "",
//	"m_ReadOnlyExpression": "",
//	"m_DefaultValue": ""
//}
// MPropertyFriendlyName = "Surface Property"
// MPropertyDescription = "Surface Property Variable"
// MHasKV3TransferPolymorphicClassname
class CSmartPropVariable_SurfaceProperty : public CSmartPropVariable
{
	// MPropertyFriendlyName = "Default Surface Property"
	// MPropertyCustomFGDType = "surface_properties"
	CUtlString m_DefaultValue;
};
