class CBaseButton : public CBaseToggle
{
	QAngle m_angMoveEntitySpace;
	bool m_fStayPushed;
	bool m_fRotating;
	// MNotSaved
	locksound_t m_ls;
	CGameSoundEventName m_sUseSound;
	CGameSoundEventName m_sLockedSound;
	CGameSoundEventName m_sUnlockedSound;
	CUtlSymbolLarge m_sOverrideAnticipationName;
	bool m_bLocked;
	bool m_bDisabled;
	float32 m_flSpeed;
	GameTime_t m_flUseLockedTime;
	bool m_bSolidBsp;
	CEntityIOOutput m_OnDamaged;
	CEntityIOOutput m_OnPressed;
	CEntityIOOutput m_OnUseLocked;
	CEntityIOOutput m_OnIn;
	CEntityIOOutput m_OnOut;
	// MNotSaved
	int32 m_nState;
	CEntityHandle m_hConstraint;
	CEntityHandle m_hConstraintParent;
	// MNotSaved
	bool m_bForceNpcExclude;
	CUtlSymbolLarge m_sGlowEntity;
	// MNotSaved
	CHandle< CBaseModelEntity > m_glowEntity;
	bool m_usable;
	// MNotSaved
	CUtlSymbolLarge m_szDisplayText;
};
