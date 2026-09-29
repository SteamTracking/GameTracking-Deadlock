// MGetKV3ClassDefaults = {
//	"m_sExternalGraphName": "",
//	"m_eBodySectionMutex": "eLowerBody",
//	"m_flags": "",
//	"m_flMinimalPathLengthForMovingExit": 100.000000,
//	"m_flSnapDestinationToPathGoalThreshold": 0.000000,
//	"m_ePreferredMovementGait": "eInvalid",
//	"m_ePreferredStance": "STANCE_CURRENT",
//	"m_flPreferredMovementGaitDistance": 100.000000,
//	"m_approachConditionsFromIdle":
//	{
//		"m_flFacingAlignmentDegrees": 0.000000,
//		"m_flMaxPathEntryAngle": 40.000000
//	},
//	"m_approachConditionsFromMovement":
//	{
//		"m_flFacingAlignmentDegrees": 0.000000,
//		"m_flMaxPathEntryAngle": 40.000000
//	}
//}
class CNavLinkMovementVariantDefinition
{
	// MPropertyDescription = "External nav link animgraph to connect to the NPC when using the navlink"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCNmGraphDefinition > > m_sExternalGraphName;
	// MPropertyDescription = "What part of the body is does this navlink directly control?"
	BodySectionMutex_t m_eBodySectionMutex;
	CBitVecEnum< NavLinkMovementFlags_t > m_flags;
	// MPropertyDescription = "How much normal ( e.g. ground ) path we have to have after the navlink to trigger exit to movement."
	float32 m_flMinimalPathLengthForMovingExit;
	// MPropertyDescription = "If the navlink destination and the path goal are less than this distance from each other snap the navlink destination to the goal"
	float32 m_flSnapDestinationToPathGoalThreshold;
	SharedMovementGait_t m_ePreferredMovementGait;
	StanceType_t m_ePreferredStance;
	float32 m_flPreferredMovementGaitDistance;
	CNavLinkApproachConditions m_approachConditionsFromIdle;
	CNavLinkApproachConditions m_approachConditionsFromMovement;
};
