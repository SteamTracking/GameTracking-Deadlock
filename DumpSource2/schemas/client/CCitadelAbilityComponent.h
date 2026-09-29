class CCitadelAbilityComponent : public CEntityComponent
{
	C_NetworkUtlVectorBase< CHandle< C_CitadelBaseAbility > > m_vecAbilities;
	C_NetworkUtlVectorBase< int32 > m_arPendingAsyncAbilityReservationSlots;
	C_NetworkUtlVectorBase< int32 > m_arPendingAsyncAbilityReservationAbilityIDs;
	CHandle< C_CitadelBaseAbility > m_hSelectedAbility;
	CHandle< C_CitadelBaseAbility > m_hChannellingAbility;
	CHandle< C_CitadelBaseAbility > m_hCastDelayingAbility;
	CHandle< C_BaseEntity > m_hPreviouslySelectedAbility;
	bool m_bPreviousAbilityQueued;
	float32 m_flTimeScale;
	float32 m_flParticleTimeScale;
	bool m_bInInterruptState;
	AbilityResource_t m_ResourceStamina;
	AbilityResource_t m_ResourceAbility;
	C_UtlVectorEmbeddedNetworkVar< ConsumedComponentState_t > m_vecConsumedComponents;
	bool m_bThinkableAbilitiesDirty;
	uint32 m_nExecuteAbilityMask;
	bool m_bSelectedEffectsStarted;
};
