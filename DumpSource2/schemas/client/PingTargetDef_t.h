// MVDataRoot
class PingTargetDef_t
{
	// MPropertyDescription = "What entity does this row describe?"
	PingTargetMatch_t m_match;
	// MPropertyDescription = "Concept used when the radial is bypassed - a plain tap with no segment selected. Should never be None on a matched row."
	CitadelPingWheelConcept_t m_eDefaultConcept; // = "CITADEL_PING_CONCEPT_NONE"
	// MPropertyDescription = "Situational replacements for what a tap does, first match wins. What lets a scoreboard tap and a world tap say different things about the same hero. Leave empty and a tap keeps placing a plain marker."
	CUtlVector< PingDefaultOverride_t > m_vecDefaultOverrides;
	// MPropertyDescription = "North. Let's attack here."
	PingSlotDef_t m_SlotNorth;
	// MPropertyDescription = "East. Warning here."
	PingSlotDef_t m_SlotEast;
	// MPropertyDescription = "South. Let's defend here."
	PingSlotDef_t m_SlotSouth;
	// MPropertyDescription = "West. I'm going here."
	PingSlotDef_t m_SlotWest;
	// MPropertyDescription = "Name shown at the centre of the radial. Leave empty to fall back on the entity's own name."
	CUtlString m_strSubjectNameToken;
	// MPropertyDescription = "Icon shown at the centre of the radial. Leave empty to fall back on the HUD's icon for the entity."
	CUtlString m_strSubjectIcon;
};
