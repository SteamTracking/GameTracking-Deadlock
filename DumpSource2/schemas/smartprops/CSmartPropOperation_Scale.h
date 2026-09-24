// MGetKV3ClassDefaults = {
//	"_class": "CSmartPropOperation_Scale",
//	"m_bEnabled": true,
//	"m_flScale": 1.000000
//}
// MPropertyFriendlyName = "Transform: Scale"
// MPropertyDescription = "Apply a scale to the current transform."
// MVDataClassGroup = "Transform"
// MHasKV3TransferPolymorphicClassname
class CSmartPropOperation_Scale : public CSmartPropTransformOperation
{
	// MPropertyDescription = "Scale to apply to the current transform"
	CSmartPropAttributeFloat m_flScale;
};
