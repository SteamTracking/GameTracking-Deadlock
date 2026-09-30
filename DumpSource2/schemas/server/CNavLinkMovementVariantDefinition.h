class CNavLinkMovementVariantDefinition
{
	// MPropertyDescription = "External nav link animgraph to connect to the NPC when using the navlink"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCNmGraphDefinition > > m_sExternalGraphName;
	// MPropertyDescription = "What part of the body is does this navlink directly control?"
	BodySectionMutex_t m_eBodySectionMutex; // = "eLowerBody"
	CBitVecEnum< NavLinkMovementFlags_t > m_flags;
	// MPropertyDescription = "How much normal ( e.g. ground ) path we have to have after the navlink to trigger exit to movement."
	float32 m_flMinimalPathLengthForMovingExit; // = 100
	// MPropertyDescription = "If the navlink destination and the path goal are less than this distance from each other snap the navlink destination to the goal"
	float32 m_flSnapDestinationToPathGoalThreshold;
	SharedMovementGait_t m_ePreferredMovementGait; // = "eInvalid"
	StanceType_t m_ePreferredStance; // = "STANCE_CURRENT"
	float32 m_flPreferredMovementGaitDistance; // = 100
	CNavLinkApproachConditions m_approachConditionsFromIdle; // = { "m_flFacingAlignmentDegrees": 0, "m_flMaxPathEntryAngle": 40 }
	CNavLinkApproachConditions m_approachConditionsFromMovement; // = { "m_flFacingAlignmentDegrees": 0, "m_flMaxPathEntryAngle": 40 }
};
