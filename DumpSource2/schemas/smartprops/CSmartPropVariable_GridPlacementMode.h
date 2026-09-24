// MGetKV3ClassDefaults = {
//	"_class": "CSmartPropVariable_GridPlacementMode",
//	"m_nElementID": -1,
//	"m_VariableName": "",
//	"m_bExposeAsParameter": false,
//	"m_DisplayName": "",
//	"m_HideExpression": "",
//	"m_ReadOnlyExpression": "",
//	"m_DefaultValue": "SEGMENT"
//}
// MPropertyFriendlyName = "Grid Placement"
// MPropertyDescription = "Specifies how to place elements within a grid."
// MVDataClassGroup = "Enumerator Types"
// MHasKV3TransferPolymorphicClassname
class CSmartPropVariable_GridPlacementMode : public CSmartPropVariable
{
	SmartPropGridPlacementMode_t m_DefaultValue;
};
