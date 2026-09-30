// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Tier2WeakenedVData : public CCitadel_Modifier_StunnedVData
{
	float32 m_flTechDamagePctIncrease;
	CSoundEventName m_WeakenedSound;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WeakenedEffect;
	CUtlString m_sWeakenedEffectAttachment;
};
