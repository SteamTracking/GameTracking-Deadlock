// MGetKV3ClassDefaults = {
//	"_class": "PhysicsRagdollPose_t",
//	"m_RelativeTransforms":
//	[
//	],
//	"m_hOwner": null
//}
// MHasKV3TransferPolymorphicClassname
class PhysicsRagdollPose_t
{
	C_NetworkUtlVectorBase< CTransform > m_RelativeTransforms;
	CHandle< C_BaseEntity > m_hOwner;
	// MNotSaved
	bool m_bSetFromDebugHistory;
};
