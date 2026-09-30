// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_HookTargetVData : public CCitadel_Modifier_LinkVData
{
	// MPropertyStartGroup = "GamePlay"
	// MPropertyDescription = "How soon before the target arrives at Bebop to play the approaching whoosh sound"
	float32 m_flApproachingWhooshAnticipationTime; // = 0.6
	float32 m_flCloseEnoughDistance; // = 60
	float32 m_flTossUpSpeed;
	CPiecewiseCurve m_PullSpeedScaleCurve;
	float32 m_flReturnSpeed; // = 2200
	float32 m_flReturnPositionForwardOffset; // = 100
	float32 m_flReturnSpeedFail; // = 100
	float32 m_flReturnStuckTime; // = 0.5
	float32 m_flFailSafeMinTime; // = 1
	float32 m_flFailSafeDurationMult; // = 2
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_RestrictionModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HookRetrieveParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strApproachingWhooshSound;
};
