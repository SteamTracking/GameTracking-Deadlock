// MHasKV3TransferPolymorphicClassname
class CCitadel_BreakableProp_PunchableTrollVData : public CCitadel_BreakablePropVData
{
	// MPropertyStartGroup = "Troll"
	CEmbeddedSubclass< CCitadelModifier > m_NearTrollAuraModifier;
	CUtlVector< CEmbeddedSubclass< CCitadelModifier > > m_BuffModifiers;
	// MPropertyDescription = "Chance a heavy melee feeds the troll a candy and gets nothing back"
	float32 m_flStealCandyChance; // = 0.25
	CSoundEventName m_sPickupSound;
	CSoundEventName m_sBridgeBuffPickupSound;
	CSoundEventName m_sStunSound;
	CSoundEventName m_sStealSound;
};
