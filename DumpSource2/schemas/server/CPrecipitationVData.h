// MGetKV3ClassDefaults = {
//	"_class": "CPrecipitationVData",
//	"m_szParticlePrecipitationEffect": "",
//	"m_szParticlePrecipitationPuddleEffect": "",
//	"m_szParticlePrecipitationPostEffect": "",
//	"m_flInnerDistance": 32.000000,
//	"m_nAttachType": "PATTACH_ABSORIGIN_FOLLOW",
//	"m_bBatchSameVolumeType": true,
//	"m_nRTEnvCP": -1,
//	"m_nRTEnvCPComponent": 0,
//	"m_szModifier": "",
//	"m_nUseSnapshotFromSurfaceGraph": -1,
//	"m_snapshotFilter":
//	{
//		"m_flMaxRadius": 200.000000
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CPrecipitationVData : public CEntitySubclassVDataBase
{
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_szParticlePrecipitationEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_szParticlePrecipitationPuddleEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_szParticlePrecipitationPostEffect;
	float32 m_flInnerDistance;
	ParticleAttachment_t m_nAttachType;
	bool m_bBatchSameVolumeType;
	int32 m_nRTEnvCP;
	int32 m_nRTEnvCPComponent;
	CUtlString m_szModifier;
	// MPropertyDescription = "If set, we will populate a snapshot from the surface graph"
	int32 m_nUseSnapshotFromSurfaceGraph;
	PrecipitationFilter_t m_snapshotFilter;
};
