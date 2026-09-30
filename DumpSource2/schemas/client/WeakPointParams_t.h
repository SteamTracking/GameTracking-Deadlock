class WeakPointParams_t
{
	CUtlString m_strName;
	HitGroup_t m_nHitGroup; // = "HITGROUP_GENERIC"
	int32 m_nHealth;
	int32 m_nMaxHealth;
	int32 m_nOnBreakBonusDamage;
	EWeakPointBreakBehavior m_eBreakBehavior; // = "EBreakOnceBecomeInvuln"
	CGlobalSymbol m_strOnBreakAnimGraphParam;
};
