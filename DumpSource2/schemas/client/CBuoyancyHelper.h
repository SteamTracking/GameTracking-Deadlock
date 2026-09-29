// MGetKV3ClassDefaults = {
//	"_class": "CBuoyancyHelper",
//	"m_nFluidType": "",
//	"m_flFluidDensity": 1.000000,
//	"m_flNeutrallyBuoyantGravity": 0.000000,
//	"m_flNeutrallyBuoyantLinearDamping": 0.000000,
//	"m_flNeutrallyBuoyantAngularDamping": 0.000000,
//	"m_bNeutrallyBuoyant": false,
//	"m_vecFractionOfWheelSubmergedForWheelFriction":
//	[
//	],
//	"m_vecWheelFrictionScales":
//	[
//	],
//	"m_vecFractionOfWheelSubmergedForWheelDrag":
//	[
//	],
//	"m_vecWheelDrag":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CBuoyancyHelper
{
	// MPhysPtr
	IPhysicsMotionController* m_pController;
	CUtlStringToken m_nFluidType;
	float32 m_flFluidDensity;
	float32 m_flNeutrallyBuoyantGravity;
	float32 m_flNeutrallyBuoyantLinearDamping;
	float32 m_flNeutrallyBuoyantAngularDamping;
	bool m_bNeutrallyBuoyant;
	CUtlVector< float32 > m_vecFractionOfWheelSubmergedForWheelFriction;
	CUtlVector< float32 > m_vecWheelFrictionScales;
	CUtlVector< float32 > m_vecFractionOfWheelSubmergedForWheelDrag;
	CUtlVector< float32 > m_vecWheelDrag;
};
