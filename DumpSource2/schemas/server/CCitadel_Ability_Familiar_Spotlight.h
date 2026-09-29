class CCitadel_Ability_Familiar_Spotlight : public CCitadelBaseAbility
{
	CHandle< CPointModifierThinker > m_hAuraThinker;
	ParticleIndex_t m_nEyeGlowFX;
	VectorWS m_vLastValidAuraPosition;
	CHandle< CBaseEntity > m_hWasAttachedTo;
	VectorWS m_vAuraPosition;
};
