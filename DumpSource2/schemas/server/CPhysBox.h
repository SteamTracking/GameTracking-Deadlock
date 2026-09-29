class CPhysBox : public CBreakable
{
	int32 m_damageType;
	int32 m_damageToEnableMotion;
	float32 m_flForceToEnableMotion;
	Vector m_vHoverPosePosition;
	QAngle m_angHoverPoseAngles;
	bool m_bNotSolidToWorld;
	bool m_bEnableUseOutput;
	HoverPoseFlags_t m_nHoverPoseFlags;
	float32 m_flTouchOutputPerEntityDelay;
	CUtlSymbolLarge m_iszCollisionGroup;
	CUtlSymbolLarge m_iszInteractsAs;
	CUtlSymbolLarge m_iszInteractsWith;
	CUtlSymbolLarge m_iszInteractsExclude;
	CEntityIOOutput m_OnDamaged;
	CEntityIOOutput m_OnAwakened;
	CEntityIOOutput m_OnMotionEnabled;
	CEntityIOOutput m_OnPlayerUse;
	CEntityIOOutput m_OnStartTouch;
};
