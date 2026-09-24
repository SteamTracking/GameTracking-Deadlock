// MGetKV3ClassDefaults = {
//	"_class": "CNmClipDocEvent_Particle",
//	"m_flStartTime": 0.000000,
//	"m_flDuration": 0.000000,
//	"m_relevance": "ClientAndServer",
//	"m_type": "Create",
//	"m_particleSystem": "",
//	"m_bDetachFromOwner": false,
//	"m_bStopImmediately": false,
//	"m_bPlayEndCap": false,
//	"m_attachmentPoint0": "",
//	"m_attachmentType0": "PATTACH_INVALID",
//	"m_attachmentPoint1": "",
//	"m_attachmentType1": "PATTACH_INVALID",
//	"m_config": "",
//	"m_effectForConfig": "",
//	"m_tags": ""
//}
// MHasKV3TransferPolymorphicClassname
class CNmClipDocEvent_Particle : public CNmClipDocEvent
{
	CNmEventRelevance_t m_relevance;
	CNmParticleEvent::Type_t m_type;
	// MPropertyStartGroup = "+Particle"
	// MPropertyAttributeEditor = "AssetBrowse( vpcf, *requiredoubleclick )"
	CUtlString m_particleSystem;
	bool m_bDetachFromOwner;
	bool m_bStopImmediately;
	bool m_bPlayEndCap;
	// MPropertyStartGroup = "+Attachment"
	// MPropertyAttrStateCallback
	CUtlString m_attachmentPoint0;
	// MPropertyAttrStateCallback
	ParticleAttachment_t m_attachmentType0;
	// MPropertyAttrStateCallback
	CUtlString m_attachmentPoint1;
	// MPropertyAttrStateCallback
	ParticleAttachment_t m_attachmentType1;
	// MPropertyStartGroup = "+Config"
	// MPropertyAttrStateCallback
	CUtlString m_config;
	// MPropertyAttrStateCallback
	CUtlString m_effectForConfig;
	// MPropertyStartGroup = "+Metadata"
	CUtlString m_tags;
};
