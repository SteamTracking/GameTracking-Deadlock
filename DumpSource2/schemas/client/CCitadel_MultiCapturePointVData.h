// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_MultiCapturePointVData",
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
//	"m_flStepOutGraceWindow": 0.500000
//}
// MHasKV3TransferPolymorphicClassname
class CCitadel_MultiCapturePointVData : public CEntitySubclassVDataBase
{
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Particle that's active in the pre-enabled window."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strPreEnableParticle;
	// MPropertyDescription = "Particle that's fired when the point becomes active."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strOnBecomeEnableParticle;
	// MPropertyDescription = "Particle that's active while the capture point is enabled."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strEnabledParticle;
	// MPropertyDescription = "Particle that's fired when the point is fully captured by a team."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strOnFullyCapturedParticle;
	// MPropertyDescription = "Ping Mini Map on Active"
	bool m_bPingMinimapOnActive;
	// MPropertyStartGroup = "Sounds"
	// MPropertyDescription = "Loop that plays while the capture point is active."
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_EnabledLoopSounds;
	// MPropertyDescription = "Loop that plays when the enemy team is actively capturing."
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_EnemyCapturingLoopSounds;
	// MPropertyDescription = "Loop that plays when the friendly team is actively capturing."
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_FriendlyCapturingLoopSounds;
	// MPropertyDescription = "Loop that plays when both teams are actively capturing."
	CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > m_EnemyAndFriendlyCapturingLoopSounds;
	// MPropertyDescription = "Plays when the pre-enable period starts."
	CSoundEventName m_strPreEnableStartSound;
	// MPropertyDescription = "Plays when the enable period starts."
	CSoundEventName m_strEnableStartSound;
	// MPropertyDescription = "Plays when the point is fully captured."
	CSoundEventName m_strFullyCapturedSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_modifierCapturer;
	// MPropertyStartGroup = "Capture Settings"
	// MPropertyDescription = "When no playars are in the capture area, what fraction of progress is lost per second."
	float32 m_flDecaySpeed;
	// MPropertyDescription = "Time it takes to fully capture"
	float32 m_flTotalTimeToCapture;
	// MPropertyDescription = "Kill nearby neutrals."
	bool m_bDestroyNearbyNeutrals;
	// MPropertyDescription = "Capture progress will hold at this percent when contested by multiple teams"
	float32 m_flHoldAtPercent;
	// MPropertyDescription = "How long someone can be outside the circle before they are considered absent"
	float32 m_flStepOutGraceWindow;
};
