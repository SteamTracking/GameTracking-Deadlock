// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_BreakableMeleeShieldVData : public CCitadelModifierVData
{
	float32 m_flStunDuration; // = 4
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strShieldBreakEffect;
	CSoundEventName m_ShieldBreakSound;
};
