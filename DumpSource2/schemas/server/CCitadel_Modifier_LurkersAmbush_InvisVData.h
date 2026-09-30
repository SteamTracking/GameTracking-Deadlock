// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_LurkersAmbush_InvisVData : public CCitadel_Modifier_InvisVData
{
	// MPropertyStartGroup = "+Properties"
	float32 m_flMaxCameraAngleForSeeing; // = 15
	// MPropertyDescription = "Max distance a player can look at Fathom to reveal him"
	float32 m_flMaxDistanceForSeeing; // = 2000
	// MPropertyDescription = "Visual bias on how the invis is applied"
	float32 m_flInvisBias; // = 0.7
	// MPropertyDescription = "How long a player needs to look at Fathom before the invis even starts to reveal"
	float32 m_flSpottedMinTimeToStart; // = 0.5
};
