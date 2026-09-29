// MGetKV3ClassDefaults = {
//	"_class": "CCollisionProperty",
//	"m_collisionAttribute":
//	{
//		"m_nInteractsAs": 131072,
//		"m_nInteractsWith": 0,
//		"m_nInteractsExclude": 0,
//		"m_nEntityId": 0,
//		"m_nOwnerId": 4294967295,
//		"m_nHierarchyId": 0,
//		"m_nDetailLayerMask": 0,
//		"m_nDetailLayerMaskType": 0,
//		"m_nTargetDetailLayer": 0,
//		"m_nCollisionGroup": 4,
//		"m_nCollisionFunctionMask": 7
//	},
//	"m_vecMins":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vecMaxs":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_usSolidFlags": 0,
//	"m_nSolidType": "SOLID_NONE",
//	"m_triggerBloat": 0,
//	"m_nSurroundType": "USE_OBB_COLLISION_BOUNDS",
//	"m_CollisionGroup": 4,
//	"m_nEnablePhysics": 1,
//	"m_flBoundingRadius": 0.000000,
//	"m_vecSpecifiedSurroundingMins":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vecSpecifiedSurroundingMaxs":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vecSurroundingMaxs":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vecSurroundingMins":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vCapsuleCenter1":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vCapsuleCenter2":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flCapsuleRadius": 0.000000
//}
// MHasKV3TransferPolymorphicClassname
class CCollisionProperty
{
	VPhysicsCollisionAttribute_t m_collisionAttribute;
	// MSaveBehavior = 1
	Vector m_vecMins;
	// MSaveBehavior = 1
	Vector m_vecMaxs;
	uint8 m_usSolidFlags;
	SolidType_t m_nSolidType;
	uint8 m_triggerBloat;
	SurroundingBoundsType_t m_nSurroundType;
	uint8 m_CollisionGroup;
	uint8 m_nEnablePhysics;
	float32 m_flBoundingRadius;
	Vector m_vecSpecifiedSurroundingMins;
	Vector m_vecSpecifiedSurroundingMaxs;
	Vector m_vecSurroundingMaxs;
	Vector m_vecSurroundingMins;
	Vector m_vCapsuleCenter1;
	Vector m_vCapsuleCenter2;
	float32 m_flCapsuleRadius;
};
