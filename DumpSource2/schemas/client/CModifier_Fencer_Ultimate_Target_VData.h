// MHasKV3TransferPolymorphicClassname
class CModifier_Fencer_Ultimate_Target_VData : public CCitadelModifierVData
{
	float32 m_flDamageTimeOffset; // = 0.5
	float32 m_flEndTimeScaleForFlinch; // = 0.8
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DashImpactEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDashHitEnemy;
	CSoundEventName m_strTimerSound;
	CSoundEventName m_sSlashSound;
};
