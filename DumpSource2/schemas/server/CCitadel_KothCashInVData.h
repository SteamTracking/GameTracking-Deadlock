// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_KothCashInVData",
//	"m_strPreEnableParticle": "",
//	"m_strOnBecomeEnableParticle": "",
//	"m_strEnabledParticle": "",
//	"m_strOnFullyCapturedParticle": "",
//	"m_bPingMinimapOnActive": true,
//	"m_EnabledLoopSounds":
//	{
//	},
//	"m_EnemyCapturingLoopSounds":
//	{
//	},
//	"m_FriendlyCapturingLoopSounds":
//	{
//	},
//	"m_EnemyAndFriendlyCapturingLoopSounds":
//	{
//	},
//	"m_strPreEnableStartSound": "",
//	"m_strEnableStartSound": "",
//	"m_strFullyCapturedSound": "",
//	"m_modifierCapturer":
//	{
//	},
//	"m_flDecaySpeed": 0.000000,
//	"m_flTotalTimeToCapture": 13.000000,
//	"m_bDestroyNearbyNeutrals": false,
//	"m_flHoldAtPercent": 99.000000,
//	"m_flStepOutGraceWindow": 0.500000,
//	"m_ZoneParticle": "",
//	"m_EndParticleFriendly": "",
//	"m_EndParticleEnemy": "",
//	"m_AuraModifier":
//	{
//	},
//	"m_ComebackAuraModifier":
//	{
//	},
//	"m_TrooperModifier":
//	{
//	},
//	"m_strKothCashedInSoundFriendly": "",
//	"m_strKothCashedInSoundEnemy": "",
//	"m_strKothContestedSound": "",
//	"m_strKothBlockedSound": "",
//	"m_strKothGiveUpSound": "",
//	"m_strKothGiveUpWarnSound": "",
//	"m_strKothCashinLoopSound": "",
//	"m_strKothGivingUpWarningLoopSound": "",
//	"m_strKothContestedLoopSound": "",
//	"m_strKothCaptureStartAnnounce": "",
//	"m_flZoneHeightMeters": 25.000000,
//	"m_flTotalTimeToCaptureFavored": 10.000000,
//	"m_flTotalTimeToCaptureUnfavored": 15.000000,
//	"m_flTimeToGiveUp": 120.000000,
//	"m_flTimeToWarnAboutGivingUp": 110.000000,
//	"m_nGiveUpOrbs": 20,
//	"m_flTroopersMin": 5.000000,
//	"m_flTroopersMax": 14.000000,
//	"m_flTroopersSpawnRate": 0.500000,
//	"m_flDelayedDelete": 1.000000
//}
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
	// MPropertyStartGroup = "Gameplay"
	float32 m_flZoneHeightMeters;
	float32 m_flTotalTimeToCaptureFavored;
	float32 m_flTotalTimeToCaptureUnfavored;
	float32 m_flTimeToGiveUp;
	float32 m_flTimeToWarnAboutGivingUp;
	int32 m_nGiveUpOrbs;
	float32 m_flTroopersMin;
	float32 m_flTroopersMax;
	float32 m_flTroopersSpawnRate;
	float32 m_flDelayedDelete;
};
