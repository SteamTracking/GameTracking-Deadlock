class CCitadel_Modifier_LashGrappleEnemy_Debuff : public CCitadel_Modifier_Stunned
{
	Vector m_vCrashDir;
	VectorWS m_vLiftTarget;
	GameTime_t m_flStartTime;
	bool m_bCrashingDown;
};
