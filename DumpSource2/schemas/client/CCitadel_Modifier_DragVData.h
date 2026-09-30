// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_DragVData : public CCitadel_Modifier_LinkVData
{
	// MPropertyStartGroup = "Drag - Hold Position"
	EDragOffsetBasis m_eOffsetBasis; // = "EDragOffset_SourceFacing"
	float32 m_flDragDistance; // = 40
	float32 m_flForwardOffset;
	float32 m_flVerticalOffset;
	float32 m_flHorizontalOffset;
	// MPropertyStartGroup = "Drag - Pull"
	EDragPullModel m_ePullModel; // = "EDragPull_SourceVelocityPlusDistance"
	float32 m_flForceDistScale; // = 5
	float32 m_flDampingFactor; // = 10
	// MPropertyDescription = "If the victim ends up further than this from the hold point it's probably wedged on something, so pull it towards the source's elevation instead.  Zero disables."
	float32 m_flStuckDistance;
	// MPropertyDescription = "Never chase slower than the source itself.  Off means a spring drag can be outrun, which is what you want when the drag is only meant to trail loosely."
	bool m_bChaseAtLeastSourceSpeed; // = true
	// MPropertyStartGroup = "Drag - Behavior"
	// MPropertyDescription = "If true, remove ourselves when the parent gets stunned"
	bool m_bBreakOnParentStunned; // = true
	// MPropertyDescription = "Only drag the victim downwards, and end the drag once it lands."
	bool m_bZDownOnly;
	// MPropertyDescription = "Only take the victim off the ground when the pull is upwards, so a level or downward drag still walks along the floor."
	bool m_bLeaveGroundOnlyWhenPullingUp;
	// MPropertyDescription = "Apply the standard drag debuff set (immobilize, silence, disarm) when the victim is an enemy."
	bool m_bApplyDragStateFlagsToEnemies; // = true
	// MPropertyDescription = "Kill the victim's velocity when the drag ends.  Turn off if the drag wants to hand off momentum itself - Astro's lasso and Tengu's airlift keep the horizontal component."
	bool m_bZeroVelocityOnEnd; // = true
};
