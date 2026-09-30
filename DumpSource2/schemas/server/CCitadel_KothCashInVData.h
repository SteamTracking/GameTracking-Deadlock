// MHasKV3TransferPolymorphicClassname
class CCitadel_KothCashInVData : public CCitadel_MultiCapturePointVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ZoneParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EndParticleFriendly;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EndParticleEnemy;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_AuraModifier;
	CEmbeddedSubclass< CBaseModifier > m_ComebackAuraModifier;
	CEmbeddedSubclass< CBaseModifier > m_TrooperModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strKothCashedInSoundFriendly;
	CSoundEventName m_strKothCashedInSoundEnemy;
	CSoundEventName m_strKothContestedSound;
	CSoundEventName m_strKothBlockedSound;
	CSoundEventName m_strKothGiveUpSound;
	CSoundEventName m_strKothGiveUpWarnSound;
	CSoundEventName m_strKothCashinLoopSound;
	CSoundEventName m_strKothGivingUpWarningLoopSound;
	CSoundEventName m_strKothContestedLoopSound;
	CSoundEventName m_strKothCaptureStartAnnounce;
	// MPropertyStartGroup = "Ping"
	float32 m_flPingTargetRadius; // = 70
	float32 m_flPingTargetHeightOffset; // = 200
	// MPropertyStartGroup = "Gameplay"
	float32 m_flZoneHeightMeters; // = 25
	float32 m_flTotalTimeToCaptureFavored; // = 10
	float32 m_flTotalTimeToCaptureUnfavored; // = 15
	float32 m_flTimeToGiveUp; // = 120
	float32 m_flTimeToWarnAboutGivingUp; // = 110
	int32 m_nGiveUpOrbs; // = 20
	float32 m_flTroopersMin; // = 5
	float32 m_flTroopersMax; // = 14
	float32 m_flTroopersSpawnRate; // = 0.5
	float32 m_flDelayedDelete; // = 1
};
