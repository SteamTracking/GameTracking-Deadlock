// MGetKV3ClassDefaults = {
//	"_class": "CAI_PathCost",
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
//	"m_flTransitionPenalty": 200.000000,
//	"m_hNpc": null,
//	"m_navRestrictionVolume":
//	{
//		"m_hMarkupVolume": null
//	},
//	"m_DisallowedAttributes":
//	[
//	],
//	"m_nDisallowedAttributesDynamic": 0,
//	"m_bNavLinksEnabled": true,
//	"m_flNavLinkPenalty": 0.000000,
//	"m_flAvoidanceAreaCost": 250.000000,
//	"m_flAvoidanceAreaDistScale": 10.000000,
//	"m_vecFuncAreaFilter":
//	[
//	],
//	"m_hIgnoreBlockingEntity": null
//}
// MHasKV3TransferPolymorphicClassname
class CAI_PathCost : public CNavPathCost
{
	CHandle< CAI_BaseNPC > m_hNpc;
	CNavRestrictionVolumeCached m_navRestrictionVolume;
	CNavAttribute m_DisallowedAttributes;
	uint32 m_nDisallowedAttributesDynamic;
	bool m_bNavLinksEnabled;
	float32 m_flNavLinkPenalty;
	float32 m_flAvoidanceAreaCost;
	float32 m_flAvoidanceAreaDistScale;
	CUtlVectorFixed< INavPathCostAreaFilter*, 4 > m_vecFuncAreaFilter;
	CHandle< CBaseEntity > m_hIgnoreBlockingEntity;
};
