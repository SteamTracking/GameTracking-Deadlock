class CCitadel_Modifier_Nurse_LeechTherapy_Target : public CCitadelModifier
{
	int32 m_nNumTicksRemaining;
	float32 m_flDamageDealt;
	float32 m_flStaminaDrained;
	CHandle< C_BaseEntity > m_hLeech;
};
