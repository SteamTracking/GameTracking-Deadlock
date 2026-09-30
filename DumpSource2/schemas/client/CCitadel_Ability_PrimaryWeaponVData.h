// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_PrimaryWeaponVData : public CitadelAbilityVData
{
	// MPropertyDescription = "The DOF settings to apply while zoomed in."
	DOFDesc_t m_DOFWhileZoomed;
	// MPropertyDescription = "When true, the 'Far Crisp' and 'Far Blurry' are added on top of the gun's range.  When false, use the values directly."
	bool m_bDOFFarSettingsAreOffsetByGunRange; // = true
	// MPropertyStartGroup = "Sounds"
	// MPropertyFriendlyName = "Fire while disarmed sound"
	CSoundEventName m_sDisarmedSound;
	float32 m_flMinDisarmedSoundInterval; // = 0.1
	CSoundEventName m_sObstructedShotSound;
	CUtlOrderedMap< ENextAttackDelayReason_t, CUtlOrderedMap< ECitadelAudioLoopSounds, CSoundEventName > > m_mapDelayLoopsSounds;
	// MPropertyStartGroup = "Action Reload"
	// MPropertyAttributeRange = "0 1"
	// MPropertyDescription = "If we have action reloads, at what fraction of our reload progress does the timing window start.  The window is centered on this time."
	float32 m_flActionReloadTimingStart; // = 0.5
	// MPropertyDescription = "If we have action reloads, how long is the window"
	float32 m_flActionReloadTimingDuration; // = 0.3
	// MPropertyStartGroup = "UI"
	CUtlString m_strCrosshairCSSClass;
	bool m_bUseCustomCrosshairSettings;
	// MPropertySuppressExpr = "m_bUseCustomCrosshairSettings == false"
	CustomCrosshairSettings_t m_CustomCrosshairSettings; // = { "m_DotColor": [ 255, 255, 255 ], "m_DotOutlineColor": [ 0, 0, 0 ], "m_PipColor": [ 255, 255, 255 ], "m_PipOutlineColor": [ 0, 0, 0 ], "m_SpreadIndicatingElement": "LINE_GAP", "m_flBaseSpread": 0, "m_flDotOpacity": 0, "m_flDotOutlineOpacity": 0, "m_flPipOpacity": 0, "m_flPipOutlineOpacity": 0, "m_nDotOutlineGap": 0, "m_nDotOutlineWidth": 0, "m_nDotRadius": 0, "m_nPipHeight": 0, "m_nPipOutlineGap": 0, "m_nPipOutlineWidth": 0, "m_nPipWidth": 0 }
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Effect to parent to the gun.CP.0 = muzzle attachment source below, CP.1 = muzzle_fx. CP2.X = ammo frac, CP2.Y = is reloading (1/0), CP2.Z = shot recently (1/0)."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PassiveWeaponParticle;
	CUtlString m_strPassiveWeaponAttachmentSource; // = "muzzle_fx"
	// MPropertyStartGroup = "Camera"
	CitadelCameraOperationsSequence_t m_cameraSequenceZoom; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
	CitadelCameraOperationsSequence_t m_cameraSequenceUnZoom; // = { "m_bIsEmpty": false, "m_nPriority": 1, "m_strToken": "", "m_vecDistanceOperations": [  ], "m_vecFOVOperations": [  ], "m_vecHorizOffsetOperations": [  ], "m_vecTargetPosOperations": [  ], "m_vecVertOffsetOperations": [  ] }
};
