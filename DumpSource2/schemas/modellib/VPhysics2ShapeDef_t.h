// MGetKV3ClassDefaults = {
//	"m_spheres":
//	[
//	],
//	"m_capsules":
//	[
//	],
//	"m_hulls":
//	[
//	],
//	"m_meshes":
//	[
//	],
//	"m_compounds":
//	[
//	],
//	"m_CollisionAttributeIndices":
//	[
//	]
//}
class VPhysics2ShapeDef_t
{
	CUtlLeanVector< RnSphereDesc_t > m_spheres;
	CUtlLeanVector< RnCapsuleDesc_t > m_capsules;
	CUtlLeanVector< RnHullDesc_t > m_hulls;
	CUtlLeanVector< RnMeshDesc_t > m_meshes;
	CUtlLeanVector< RnCompoundDesc_t > m_compounds;
	CUtlVector< uint16 > m_CollisionAttributeIndices;
};
