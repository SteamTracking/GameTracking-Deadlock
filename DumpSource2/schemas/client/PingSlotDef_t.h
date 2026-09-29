// MGetKV3ClassDefaults = {
//	"m_vecOverrides":
//	[
//	],
//	"m_Option":
//	{
//		"m_ePingConcept": "CITADEL_PING_CONCEPT_NONE",
//		"m_eMinimapPingAnim": "k_eMinimapPingAnim_Default",
//		"m_eAbilityPingSlot": "ESlot_Invalid"
//	},
//	"m_bDisabled": false,
//	"m_strSlotIcon": ""
//}
class PingSlotDef_t
{
	// MPropertyDescription = "Situational rules, first match wins. Checked before the slot's own concept."
	CUtlVector< PingSlotOverride_t > m_vecOverrides;
	// MPropertyDescription = "What this slot says when no override fires. Leave unset to inherit the generic row's."
	PingSlotOption_t m_Option;
	// MPropertyDescription = "This slot has nothing to say about this subject. Draws its arc, says nothing, places a plain marker."
	bool m_bDisabled;
	// MPropertyDescription = "Optional. Pins the icon on the radials whose layout is fixed - the minimap compass and the hud chrome wheels - so the art stays put when an override fires underneath. Overrides cannot reach it. Leave unset to inherit the generic row's. Author at final colour: a pinned icon draws unwashed. Only ever read for the row's own wheel, since the minimap borrows the generic row's four whatever it is pointing at."
	CUtlString m_strSlotIcon;
};
