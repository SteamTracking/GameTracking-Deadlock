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
	CNetworkUtlVectorBase< CTransform > m_RelativeTransforms;
	CHandle< CBaseEntity > m_hOwner;
	// MNotSaved
	bool m_bSetFromDebugHistory;
};
