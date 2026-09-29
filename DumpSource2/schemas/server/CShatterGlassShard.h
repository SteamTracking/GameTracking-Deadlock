// MGetKV3ClassDefaults = {
//	"_class": "CShatterGlassShard",
//	"m_hShardHandle": 0,
//	"m_hPhysicsEntity": null,
//	"m_hParentPanel": null,
//	"m_hParentShard": 0,
//	"m_ShatterStressType": "SHATTERGLASS_BLUNT",
//	"m_vecStressVelocity":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_nOnFrameEdge": "ONFRAME_UNKNOWN",
//	"m_nSubShardGeneration": 0,
//	"m_vecPanelSpaceStressPositionA":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_vecPanelSpaceStressPositionB":
//	[
//		0.000000,
//		0.000000
//	],
//	"m_bStressPositionAIsValid": false,
//	"m_bStressPositionBIsValid": false,
//	"m_bFlaggedForRemoval": false,
//	"m_flPhysicsEntitySpawnedAtTime": null,
//	"m_hEntityHittingMe": null,
//	"m_vecNeighbors":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CShatterGlassShard
{
	uint32 m_hShardHandle;
	// MNotSaved
	CUtlVector< Vector2D > m_vecPanelVertices;
	// MNotSaved
	Vector2D m_vLocalPanelSpaceOrigin;
	// MNotSaved
	CStrongHandle< InfoForResourceTypeCModel > m_hModel;
	CHandle< CShatterGlassShardPhysics > m_hPhysicsEntity;
	CHandle< CFuncShatterglass > m_hParentPanel;
	uint32 m_hParentShard;
	ShatterGlassStressType m_ShatterStressType;
	Vector m_vecStressVelocity;
	// MNotSaved
	bool m_bCreatedModel;
	// MNotSaved
	float32 m_flLongestEdge;
	// MNotSaved
	float32 m_flShortestEdge;
	// MNotSaved
	float32 m_flLongestAcross;
	// MNotSaved
	float32 m_flShortestAcross;
	// MNotSaved
	float32 m_flSumOfAllEdges;
	// MNotSaved
	float32 m_flArea;
	OnFrame m_nOnFrameEdge;
	int32 m_nSubShardGeneration;
	// MNotSaved
	Vector2D m_vecAverageVertPosition;
	// MNotSaved
	bool m_bAverageVertPositionIsValid;
	Vector2D m_vecPanelSpaceStressPositionA;
	Vector2D m_vecPanelSpaceStressPositionB;
	bool m_bStressPositionAIsValid;
	bool m_bStressPositionBIsValid;
	bool m_bFlaggedForRemoval;
	GameTime_t m_flPhysicsEntitySpawnedAtTime;
	CHandle< CBaseEntity > m_hEntityHittingMe;
	CUtlVector< uint32 > m_vecNeighbors;
};
