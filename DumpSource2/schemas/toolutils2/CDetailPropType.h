// MGetKV3ClassDefaults = {
//	"m_flDensity": 1.000000,
//	"m_Models":
//	[
//	]
//}
// MVDataRoot
// MPropertyFriendlyName = "Detail Prop Type"
// MVDataAssociatedFile = "scripts/detail_prop_types.vdata"
// MVDataOutlinerDefaultExpanded = false
class CDetailPropType
{
	// MPropertyDescription = "Specifies the number of props placed per square foot."
	float32 m_flDensity;
	// MVDataPromoteField = 1
	CUtlVector< CDetailPropModel > m_Models;
};
