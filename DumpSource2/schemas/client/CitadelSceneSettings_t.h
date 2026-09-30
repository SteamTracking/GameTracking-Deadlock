class CitadelSceneSettings_t
{
	// MPropertyFriendlyName = "Don't Pre-Settle Cloth"
	bool m_bDontPreSettleCloth;
	// MPropertyFriendlyName = "Disable cloth freeze"
	bool m_bDisableFreezeCloth;
	// MPropertyFriendlyName = "Cloth Effect"
	CUtlStringTokenWithStorage m_strClothEffect; // = "portrait"
	// MPropertyStartGroup = "Camera Settings"
	// MPropertyFriendlyName = "Camera Attachment"
	// MPropertyCustomFGDType = "model_attachment"
	CUtlString m_strAttachmentName;
	// MPropertyFriendlyName = "FOV"
	float32 m_flFOV; // = 25
	// MPropertyFriendlyName = "Z-Near"
	float32 m_flZNear; // = 5
	// MPropertyFriendlyName = "Z-Far"
	float32 m_flZFar; // = 200
};
