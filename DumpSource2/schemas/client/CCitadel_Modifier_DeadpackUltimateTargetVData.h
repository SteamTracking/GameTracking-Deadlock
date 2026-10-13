// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_DeadpackUltimateTargetVData : public CCitadel_Modifier_DragVData
{
	// MPropertyDescription = "Opacity of the grabbed player's model as seen by themselves, so it's easier to see Deadpack"
	float32 m_flSelfViewOpacity; // = 0.8
	// MPropertyDescription = "Attachment on Deadpack to draw the grabbed player at."
	CUtlString m_strHoldAttachment;
};
