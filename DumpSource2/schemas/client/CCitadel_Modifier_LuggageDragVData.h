// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_LuggageDragVData : public CCitadel_Modifier_DragVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StompIgnoreLingerModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flStompIgnoreLingerDuration; // = 0.5
};
