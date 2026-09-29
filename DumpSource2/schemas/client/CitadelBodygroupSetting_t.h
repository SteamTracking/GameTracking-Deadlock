// MGetKV3ClassDefaults = {
//	"m_sBodyGroupName": "",
//	"m_BodygroupChoice": "",
//	"m_nPriority": 0
//}
class CitadelBodygroupSetting_t
{
	// MPropertyAttributeEditor = "ModelDocPicker( MODELDOC_PICK_TYPE_BODY_GROUP )"
	// MPropertyProvidesEditContextString = "ToolEditContext_ID_BodyGroupName"
	CUtlStringToken m_sBodyGroupName;
	// MPropertyAttributeEditor = "ModelDocBodyGroupChoice()"
	// MPropertyDescription = "Use this choice for the specified bodygroup"
	CBodyGroupChoiceSymbolWithStorage m_BodygroupChoice;
	// MPropertyDescription = "When multiple body groups are being set via events, higher priority will be applied"
	int32 m_nPriority;
};
