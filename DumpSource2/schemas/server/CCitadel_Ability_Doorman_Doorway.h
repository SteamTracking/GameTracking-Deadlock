class CCitadel_Ability_Doorman_Doorway : public CCitadelBaseAbility
{
	CHandle< CCitadel_DoorwayPortal > m_hDoor1;
	float64 m_flLastRangeFailCast;
	float32 m_flDoorBreakableRadius;
};
