// MGetKV3ClassDefaults = {
//	"_class": "CNavPathCost",
//	"m_navHull":
//	{
//		"m_nHullIdx": 0
//	},
//	"m_bAllowBlockingViaFloorAreaCost": false,
//	"m_bAllowLadders": true,
//	"m_flMaxDropDown": -1.000000,
//	"m_flMaxClimbUp": -1.000000,
//	"m_flDropDownPenaltyCostBase": 1000.000000,
//	"m_flDropDownPenaltyCostScalar": 4.000000,
//	"m_flClimbUpPenaltyCostBase": 0.000000,
//	"m_flClimbUpPenaltyCostScalar": 0.000000,
//	"m_flStepHeight": 18.000000,
//	"m_bCanFly": false,
//	"m_bCanSwim": false,
//	"m_flWaterToGroundMaxHeight": 100.000000,
//	"m_flGroundToWaterMaxHeight": 100.000000,
//	"m_flGroundToWaterTransitionDistance": -1.000000,
//	"m_flWaterToGroundTransitionDistance": -1.000000,
//	"m_flFlyingTransitionTolerance": 140.000000,
//	"m_bOptimizeFlySpacePathfinds": true,
//	"m_bStringPullFlySpacePathfinds": false,
//	"m_bSupportsTransitions": false,
//	"m_flTransitionPenalty": 200.000000
//}
// MHasKV3TransferPolymorphicClassname
class CNavPathCost : public INavPathCost
{
	bool m_bAllowBlockingViaFloorAreaCost;
	bool m_bAllowLadders;
	float32 m_flMaxDropDown;
	float32 m_flMaxClimbUp;
	float32 m_flDropDownPenaltyCostBase;
	float32 m_flDropDownPenaltyCostScalar;
	float32 m_flClimbUpPenaltyCostBase;
	float32 m_flClimbUpPenaltyCostScalar;
	float32 m_flStepHeight;
	bool m_bCanFly;
	bool m_bCanSwim;
	float32 m_flWaterToGroundMaxHeight;
	float32 m_flGroundToWaterMaxHeight;
	float32 m_flGroundToWaterTransitionDistance;
	float32 m_flWaterToGroundTransitionDistance;
	float32 m_flFlyingTransitionTolerance;
	bool m_bOptimizeFlySpacePathfinds;
	bool m_bStringPullFlySpacePathfinds;
	bool m_bSupportsTransitions;
	float32 m_flTransitionPenalty;
};
