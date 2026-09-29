// MGetKV3ClassDefaults = {
//	"m_Tree":
//	{
//		"m_Nodes":
//		[
//		],
//		"m_nStartIterationIndex": 0
//	},
//	"m_nHullBaseIndex": 0,
//	"m_nMeshBaseIndex": 0,
//	"m_nShapeCount": 0,
//	"m_Meshes":
//	[
//	],
//	"m_Hulls":
//	[
//	],
//	"m_Capsules":
//	[
//	],
//	"m_Spheres":
//	[
//	],
//	"m_CompoundMaterialIndices":
//	[
//	],
//	"m_Bounds":
//	{
//		"m_vMinBounds":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_vMaxBounds":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		]
//	},
//	"m_vOrthographicAreas":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_flSurfaceArea": 0.000000,
//	"m_flVolume": 0.000000
//}
class RnCompound_t
{
	RnCompoundTree_t m_Tree;
	int32 m_nHullBaseIndex;
	int32 m_nMeshBaseIndex;
	int32 m_nShapeCount;
	CUtlLeanVectorFixedGrowable< RnMesh_t, 1 > m_Meshes;
	CUtlLeanVector< RnHull_t > m_Hulls;
	CUtlLeanVector< RnCapsule_t > m_Capsules;
	CUtlLeanVector< RnSphere_t > m_Spheres;
	CUtlLeanVector< uint8 > m_CompoundMaterialIndices;
	AABB_t m_Bounds;
	Vector m_vOrthographicAreas;
	float32 m_flSurfaceArea;
	float32 m_flVolume;
};
