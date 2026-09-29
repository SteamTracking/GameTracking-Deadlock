class CCitadelAbilityComponent : public CEntityComponent
{
	CNetworkUtlVectorBase< CHandle< CCitadelBaseAbility > > m_vecAbilities;
	CNetworkUtlVectorBase< int32 > m_arPendingAsyncAbilityReservationSlots;
	CNetworkUtlVectorBase< int32 > m_arPendingAsyncAbilityReservationAbilityIDs;
	CHandle< CCitadelBaseAbility > m_hSelectedAbility;
	CHandle< CCitadelBaseAbility > m_hChannellingAbility;
	CHandle< CCitadelBaseAbility > m_hCastDelayingAbility;
	CHandle< CBaseEntity > m_hPreviouslySelectedAbility;
	bool m_bPreviousAbilityQueued;
	float32 m_flTimeScale;
	float32 m_flParticleTimeScale;
	bool m_bInInterruptState;
	AbilityResource_t m_ResourceStamina;
	AbilityResource_t m_ResourceAbility;
	CUtlVectorEmbeddedNetworkVar< ConsumedComponentState_t > m_vecConsumedComponents;
	bool m_bThinkableAbilitiesDirty;
	uint32 m_nExecuteAbilityMask;
	bool m_bSelectedEffectsStarted;
};
