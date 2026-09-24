// MGetKV3ClassDefaults = {
//	"_class": "CSmartPropOperation_SetVariable",
//	"m_bEnabled": true,
//	"m_VariableValue":
//	{
//		"m_TargetName": "",
//		"m_DataType": "INVALID",
//		"m_Value": null
//	}
//}
// MPropertyFriendlyName = "Set Variable"
// MPropertyDescription = "Set the value of a variable."
// MVDataClassGroup = "State"
// MVDataOutlinerNameExpr = "m_VariableValue.m_TargetName"
// MHasKV3TransferPolymorphicClassname
class CSmartPropOperation_SetVariable : public CSmartPropOperation
{
	CSmartPropAttributeVariableValue m_VariableValue;
};
