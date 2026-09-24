// MGetKV3ClassDefaults = {
//	"_class": "CSmartPropOperation_SaveScale",
//	"m_bEnabled": true,
//	"m_VariableName": ""
//}
// MPropertyFriendlyName = "Save Current Scale"
// MPropertyDescription = "Save the current scale factor to a specified variable."
// MVDataClassGroup = "State"
// MHasKV3TransferPolymorphicClassname
class CSmartPropOperation_SaveScale : public CSmartPropOperation
{
	// MPropertyAttributeEditor = "SmartPropItemNameEditor( Variable:Float )"
	CUtlString m_VariableName;
};
