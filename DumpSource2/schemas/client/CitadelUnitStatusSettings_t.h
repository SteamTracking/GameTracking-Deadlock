// MModelGameData
// MPropertyFriendlyName = "Citadel Unit Status Settings"
class CitadelUnitStatusSettings_t
{
	// MPropertyStartGroup = "Unit Status Overlay"
	// MPropertyFriendlyName = "Unit Status Attachment Name"
	CUtlStringTokenWithStorage m_strUnitStatusAttachmentName;
	// MPropertyFriendlyName = "Unit Status Offset (from attachment)"
	Vector m_vUnitStatusOffset;
	// MPropertyStartGroup = "Healthbar"
	// MPropertyFriendlyName = "Health Bar Offset (from abs origin)"
	Vector m_vHealthbarOffset;
	// MPropertyStartGroup = "Damage Numbers"
	// MPropertyFriendlyName = "Damage Numbers Offset (from abs origin)"
	Vector m_vDamageNumbersOffset;
	// MPropertyStartGroup = "Status Effects"
	// MPropertyFriendlyName = "Status Effects Offset (from abs origin)"
	Vector m_vStatusEffectsOffset;
};
