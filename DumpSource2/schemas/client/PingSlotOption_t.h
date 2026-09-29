// MGetKV3ClassDefaults = {
//	"m_ePingConcept": "CITADEL_PING_CONCEPT_NONE",
//	"m_eMinimapPingAnim": "k_eMinimapPingAnim_Default",
//	"m_eAbilityPingSlot": "ESlot_Invalid"
//}
class PingSlotOption_t
{
	// MPropertyDescription = "The concept this slot sends. Resolved against ping_wheel_messages.vdata at display time, together with the pinged thing's lane, so a lane concept picks up its per-lane message variant automatically."
	CitadelPingWheelConcept_t m_ePingConcept;
	// MPropertyDescription = "Optional. Determines which ping snippet (and todo: PFX ) the comms entry will use."
	EMinimapPingAnim_t m_eMinimapPingAnim;
	// MPropertyDescription = "Optional. Selecting the slot pings the subject's ability in this slot instead of sending m_ePingConcept, which is what reports its real name and cooldown. The concept still letters and illustrates the segment, and is still what a fallback sends."
	EAbilitySlots_t m_eAbilityPingSlot;
};
