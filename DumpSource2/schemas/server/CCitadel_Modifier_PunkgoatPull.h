class CCitadel_Modifier_PunkgoatPull : public CCitadelModifier
{
	float32 m_flDamageToDealAtEnd;
	float32 m_flDamageLeftToDealOverPull;
	float32 m_flDamageOverPullAccumulator;
	VectorWS m_vPullToLocation;
	bool m_bAllowTrackTarget;
	float32 m_flCurrentVerticalSpeed;
};
