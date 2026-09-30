// MHasKV3TransferPolymorphicClassname
class CNavGoalConstraints
{
	MovementId_t m_nMovementId;
	GoalCategory_t m_nCategory;
	NavGoalType_t m_nNavGoalType;
	CRelativeLocation m_vThreatLocation;
	float32 m_flThreatDistMin;
	float32 m_flThreatDistMax;
	CRelativeLocation m_vNearLocation;
	float32 m_flNearDistMin;
	float32 m_flNearDistMax;
	CUtlVector< TgPlane_t > m_vecConstrainingPlanes;
	CUtlVector< TgSphere_t > m_vecConstrainingSpheres;
	CUtlVector< TgMarkup_t > m_vecConstrainingMarkups;
	bool m_bHasOptionalSpheres;
	bool m_bHasOptionalPlanes;
	bool m_bHasOptionalMarkups;
	PathMotorSettings_t m_pathMotorSettings;
	CAI_PathCost* m_pPathCostOverride;
	float32 m_flMaxPathLength;
};
