class IKTargetSettings_t
{
	// MPropertyFriendlyName = "Target Source"
	// MPropertyAutoRebuildOnChange
	IKTargetSource m_TargetSource;
	// MPropertyFriendlyName = "Bone"
	// MPropertyAttrStateCallback
	IKBoneNameAndIndex_t m_Bone;
	// MPropertyFriendlyName = "Animgraph Position Parameter"
	// MPropertyAttributeChoiceName = "VectorParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_AnimgraphParameterNamePosition;
	// MPropertyFriendlyName = "Animgraph Orientation Parameter"
	// MPropertyAttributeChoiceName = "QuaternionParameter"
	// MPropertyAttrStateCallback
	AnimParamID m_AnimgraphParameterNameOrientation;
	// MPropertyFriendlyName = "Target Coords"
	// MPropertyAttrStateCallback
	IKTargetCoordinateSystem m_TargetCoordSystem;
};
