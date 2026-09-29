// MGetKV3ClassDefaults = {
//	"_class": "CAI_MotorGroundAnimGraph_AG1_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_vMovementCustomTargetPosition": null,
//	"m_vMovementMantleTargetPosition": null,
//	"m_vMovementStartFacePosition": null,
//	"m_vMovementStopFacePosition": null,
//	"m_vMovementHopFacePosition": null,
//	"m_vMovementIdleTurnFacePosition": null,
//	"m_vMovementPlantedTurnFacePosition": null,
//	"m_vMovementDirection": null,
//	"m_flMovementIdleTurnAngle": null,
//	"m_flMovementStopDesiredHeading": null,
//	"m_flMovementDesiredHeading": null,
//	"m_flMovementDesiredHeadingDelta": null,
//	"m_flMovementHeading": null,
//	"m_flGaitSlowSpeedScale": null,
//	"m_flGaitMediumSpeedScale": null,
//	"m_flGaitFastSpeedScale": null,
//	"m_flGaitVeryFastSpeedScale": null,
//	"m_bMovementCodeDriven": null,
//	"m_bMovementShouldMove": null,
//	"m_sMovementHeading": null,
//	"m_sMovementDesiredHeading": null,
//	"m_sMovementStateMachineActive": "",
//	"m_sMovementStopsEnabled": "",
//	"m_sMovementInstantStopsEnabled": "",
//	"m_sMovementStartsEnabled": "",
//	"m_sMovementIdleTurnsEnabled": "",
//	"m_sMovementHopsEnabled": "",
//	"m_sMovementPlantedTurnsEnabled": "",
//	"m_sMovementStrafeSupported": "",
//	"m_sMovementTransitionBlockAll": "",
//	"m_sMovementTransitionBlockIdle": "",
//	"m_sMovementTransitionBlockLoop": "",
//	"m_sMovementTransitionBlockIdleTurn": "",
//	"m_sMovementTransitionBlockStart": "",
//	"m_sMovementTransitionBlockStop": "",
//	"m_sMovementTransitionBlockHop": "",
//	"m_sMovementTransitionBlockPlantedTurn": "",
//	"m_sMovementRightFootDown": "",
//	"m_sMovementLeftFootDown": "",
//	"m_sMovementStumbleEnabled": "",
//	"m_sMovementBashEnabled": ""
//}
// MHasKV3TransferPolymorphicClassname
class CAI_MotorGroundAnimGraph_AG1_GraphController : public CAnimGraphControllerBase
{
	CAnimGraphParamRef< Vector > m_vMovementCustomTargetPosition;
	CAnimGraphParamRef< Vector > m_vMovementMantleTargetPosition;
	CAnimGraphParamRef< Vector > m_vMovementStartFacePosition;
	CAnimGraphParamRef< Vector > m_vMovementStopFacePosition;
	CAnimGraphParamRef< Vector > m_vMovementHopFacePosition;
	CAnimGraphParamRef< Vector > m_vMovementIdleTurnFacePosition;
	CAnimGraphParamRef< Vector > m_vMovementPlantedTurnFacePosition;
	CAnimGraphParamRef< Vector > m_vMovementDirection;
	CAnimGraphParamRef< float32 > m_flMovementIdleTurnAngle;
	CAnimGraphParamRef< float32 > m_flMovementStopDesiredHeading;
	CAnimGraphParamRef< float32 > m_flMovementDesiredHeading;
	CAnimGraphParamRef< float32 > m_flMovementDesiredHeadingDelta;
	CAnimGraphParamRef< float32 > m_flMovementHeading;
	CAnimGraphParamRef< float32 > m_flGaitSlowSpeedScale;
	CAnimGraphParamRef< float32 > m_flGaitMediumSpeedScale;
	CAnimGraphParamRef< float32 > m_flGaitFastSpeedScale;
	CAnimGraphParamRef< float32 > m_flGaitVeryFastSpeedScale;
	CAnimGraphParamRef< bool > m_bMovementCodeDriven;
	CAnimGraphParamRef< bool > m_bMovementShouldMove;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementHeading;
	CAnimGraphParamRef< CGlobalSymbol > m_sMovementDesiredHeading;
	CAnimGraphTagOptionalRef m_sMovementStateMachineActive;
	CAnimGraphTagOptionalRef m_sMovementStopsEnabled;
	CAnimGraphTagOptionalRef m_sMovementInstantStopsEnabled;
	CAnimGraphTagOptionalRef m_sMovementStartsEnabled;
	CAnimGraphTagOptionalRef m_sMovementIdleTurnsEnabled;
	CAnimGraphTagOptionalRef m_sMovementHopsEnabled;
	CAnimGraphTagOptionalRef m_sMovementPlantedTurnsEnabled;
	CAnimGraphTagOptionalRef m_sMovementStrafeSupported;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockAll;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockIdle;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockLoop;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockIdleTurn;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockStart;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockStop;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockHop;
	CAnimGraphTagOptionalRef m_sMovementTransitionBlockPlantedTurn;
	CAnimGraphTagOptionalRef m_sMovementRightFootDown;
	CAnimGraphTagOptionalRef m_sMovementLeftFootDown;
	CAnimGraphTagOptionalRef m_sMovementStumbleEnabled;
	CAnimGraphTagOptionalRef m_sMovementBashEnabled;
};
