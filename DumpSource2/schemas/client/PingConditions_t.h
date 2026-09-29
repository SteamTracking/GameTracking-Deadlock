// MGetKV3ClassDefaults = {
//	"m_vecEntityClasses":
//	[
//	],
//	"m_eAllegiance": "k_ePingTargetAllegiance_Any",
//	"m_eSourceContext": "k_ePingSourceContext_Any",
//	"m_eUltimateReady": "k_ePingTristate_Any",
//	"m_eUltimateTrained": "k_ePingTristate_Any",
//	"m_eSubjectAlive": "k_ePingTristate_Any",
//	"m_eSubjectVisible": "k_ePingTristate_Any"
//}
class PingConditions_t
{
	// MPropertyDescription = "Optional. Only fires for these entity classes. Useful on a shared row that covers a family."
	CUtlVector< Class_T > m_vecEntityClasses;
	// MPropertyDescription = "Optional. Friendly/enemy/neutral relative to the pinging player."
	EPingTargetAllegiance_t m_eAllegiance;
	// MPropertyDescription = "Optional. Whether the player pointed at a place (world, minimap) or at a portrait (scoreboard, hud icons)."
	EPingSubjectSourceContext_t m_eSourceContext;
	// MPropertyDescription = "Optional. Hero subjects only. Whether their ultimate is off cooldown."
	EPingTristate_t m_eUltimateReady;
	// MPropertyDescription = "Optional. Hero subjects only. Whether they have levelled their ultimate at all."
	EPingTristate_t m_eUltimateTrained;
	// MPropertyDescription = "Optional. Whether the subject is alive."
	EPingTristate_t m_eSubjectAlive;
	// MPropertyDescription = "Optional. Whether we can actually see the subject, as opposed to remembering it through fog of war."
	EPingTristate_t m_eSubjectVisible;
};
