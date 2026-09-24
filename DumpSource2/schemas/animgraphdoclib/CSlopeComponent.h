// MGetKV3ClassDefaults = {
//	"_class": "CSlopeComponent",
//	"m_group": "",
//	"m_id":
//	{
//		"m_id": 0
//	},
//	"m_bStartEnabled": true,
//	"m_nPriority": 100,
//	"m_networkMode": "ServerAuthoritative",
//	"m_flTraceDistance": 36.000000,
//	"m_slopeAngleID":
//	{
//		"m_id": 0
//	},
//	"m_slopeHeadingID":
//	{
//		"m_id": 0
//	},
//	"m_slopeAngleSideID":
//	{
//		"m_id": 0
//	},
//	"m_slopeAngleFrontID":
//	{
//		"m_id": 0
//	},
//	"m_slopeNormalID":
//	{
//		"m_id": 0
//	},
//	"m_slopeNormal_WorldSpaceID":
//	{
//		"m_id": 0
//	}
//}
// MHasKV3TransferPolymorphicClassname
class CSlopeComponent : public CAnimGraphDoc_Component
{
	// MPropertyFriendlyName = "Trace Distance"
	float32 m_flTraceDistance;
	// MPropertySuppressField
	AnimParamID m_slopeAngleID;
	// MPropertySuppressField
	AnimParamID m_slopeHeadingID;
	// MPropertySuppressField
	AnimParamID m_slopeAngleSideID;
	// MPropertySuppressField
	AnimParamID m_slopeAngleFrontID;
	// MPropertySuppressField
	AnimParamID m_slopeNormalID;
	// MPropertySuppressField
	AnimParamID m_slopeNormal_WorldSpaceID;
};
