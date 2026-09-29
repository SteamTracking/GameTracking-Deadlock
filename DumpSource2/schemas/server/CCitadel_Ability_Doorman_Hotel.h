// MAbilityDynamicValuesSuppressCacheWhileActive
class CCitadel_Ability_Doorman_Hotel : public CCitadelBaseAbility
{
	CHandle< CBaseEntity > m_hHotelStart;
	CHandle< CBaseEntity > m_hStartRelay;
	bool m_bSpendCooldown;
	VectorWS m_vLookTarget;
};
