class CCitadel_Ability_CardToss : public CCitadelBaseAbility
{
	int32 m_nPreviousMaxCharges;
	CUtlVector< CCitadel_Ability_CardToss::Card_t > m_vecCards;
	CUtlVector< CCitadel_Ability_CardToss::Card_t > m_vecFlyingCards;
	CUtlVector< EWraithCardType > m_vCardList;
	bool m_bCardIsFlying;
};
