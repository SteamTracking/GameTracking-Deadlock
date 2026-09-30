// MHasKV3TransferPolymorphicClassname
class CAbilityLashDownStrikeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetPreviewParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompLineParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompLineObstructedParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StompImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargingParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_StompExplosionSound;
	CSoundEventName m_StompEnemyImpactSound;
	CSoundEventName m_strFallCollideImpactSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DownStrikeModifier;
	CEmbeddedSubclass< CBaseModifier > m_ImpactModifier;
	CEmbeddedSubclass< CBaseModifier > m_DragModifier;
	// MPropertyStartGroup = "+Down Strike Params"
	float32 m_flHeightUILingerTime; // = 1
	float32 m_flDamageFrustumHalfWidth; // = 50
	float32 m_flDamageFrustumAngle; // = 45
	float32 m_flDamageWaveSpeed; // = 1000
	float32 m_flDamageTraceProbeDamageRadius; // = 32
	float32 m_flDamageTraceProbeWorldRadius; // = 8
	float32 m_flDamageTraceProbeStepUpHeight; // = 32
	float32 m_flDamageTraceProbeStepDownHeight; // = 32
	float32 m_flDamageTraceProbeDropDownRate; // = 200
	float32 m_flInitialDamageRadiusInMeters; // = 2
	int32 m_nGroundCrackGap; // = 3
	float32 m_flGroupLengthTolerance; // = 100
	float32 m_flDamageEffectScaleMin; // = 100
	float32 m_flDamageEffectScaleMax; // = 400
	float32 m_flTrackAmount; // = 150
	float32 m_flCollideRadius; // = 80
	float32 m_flMaxTurnAmount; // = 90
};
