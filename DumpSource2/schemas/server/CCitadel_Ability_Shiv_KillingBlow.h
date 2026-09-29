// MModifierDynamicValuesSuppressCache
class CCitadel_Ability_Shiv_KillingBlow : public CCitadelBaseShivAbility
{
	CUtlVector< CHandle< CBaseEntity > > m_vHitEnts;
	bool m_bDamagedAnyHero;
	bool m_bActive;
	bool m_bStartedOnGround;
	bool m_bIsBonusCast;
	VectorWS m_vStartPosition;
	QAngle m_qCurrentAngles;
	CCitadelAutoScaledTime m_flDepartureTime;
	CCitadelAutoScaledTime m_flArrivalTime;
	VectorWS m_vLastKnownSafePos;
	bool m_bMadeSlashParticle;
	ParticleIndex_t m_ChannelParticle;
	GameTime_t m_flRecastWindowEnd;
	CModifierHandleTyped< CCitadelModifier > m_BuffModifier;
	CModifierHandleTyped< CCitadelModifier > m_RecastWindowModifierHandle;
	CModifierHandleTyped< CCitadelModifier > m_RageDrainSuppressedHandle;
};
