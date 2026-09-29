class CNmFootIKTask : public CNmPoseTask
{
	int32 m_nLeftEffectorBoneIdx;
	int32 m_nRightEffectorBoneIdx;
	CTransform m_leftTargetTransform;
	CTransform m_rightTargetTransform;
	int32 m_nLeftTargetBoneIdx;
	int32 m_nRightTargetBoneIdx;
	CNmTarget m_leftTarget;
	CNmTarget m_rightTarget;
	NmIKBlendMode_t m_blendMode;
	float32 m_flBlendWeight;
	bool m_bIsTargetInWorldSpace;
	bool m_bIsRunningFromDeserializedData;
};
