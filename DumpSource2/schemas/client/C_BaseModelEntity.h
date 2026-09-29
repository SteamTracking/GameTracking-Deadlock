class C_BaseModelEntity : public C_BaseEntity
{
	// MNotSaved
	CRenderComponent* m_CRenderComponent;
	CHitboxComponent m_CHitboxComponent;
	CChoreoComponent* m_pChoreoComponent;
	HitGroup_t m_nDestructiblePartInitialStateDestructed0;
	HitGroup_t m_nDestructiblePartInitialStateDestructed1;
	HitGroup_t m_nDestructiblePartInitialStateDestructed2;
	HitGroup_t m_nDestructiblePartInitialStateDestructed3;
	HitGroup_t m_nDestructiblePartInitialStateDestructed4;
	int32 m_nDestructiblePartInitialStateDestructed0_PartIndex;
	int32 m_nDestructiblePartInitialStateDestructed1_PartIndex;
	int32 m_nDestructiblePartInitialStateDestructed2_PartIndex;
	int32 m_nDestructiblePartInitialStateDestructed3_PartIndex;
	int32 m_nDestructiblePartInitialStateDestructed4_PartIndex;
	bool m_bDestructiblePartInitialStateDestructed0_GenerateBreakpieces;
	bool m_bDestructiblePartInitialStateDestructed1_GenerateBreakpieces;
	bool m_bDestructiblePartInitialStateDestructed2_GenerateBreakpieces;
	bool m_bDestructiblePartInitialStateDestructed3_GenerateBreakpieces;
	bool m_bDestructiblePartInitialStateDestructed4_GenerateBreakpieces;
	CDestructiblePartsComponent* m_pDestructiblePartsSystemComponent;
	// MNotSaved
	bool m_bInitModelEffects;
	// MNotSaved
	bool m_bDoingModelEffects;
	// MNotSaved
	int32 m_iOldHealth;
	RenderMode_t m_nRenderMode;
	RenderFx_t m_nRenderFX;
	CUtlString m_szAddModifier;
	bool m_bAllowFadeInView;
	bool m_bHasCollision;
	VectorWS m_vSupport;
	Color m_clrRender;
	C_UtlVectorEmbeddedNetworkVar< EntityRenderAttribute_t > m_vecRenderAttributes;
	bool m_bRenderToCubemaps;
	bool m_bExpandRenderBoundsToIncludeCloth;
	bool m_bNoInterpolate;
	CCollisionProperty m_Collision;
	CGlowProperty m_Glow;
	float32 m_flGlowBackfaceMult;
	float32 m_fadeMinDist;
	float32 m_fadeMaxDist;
	float32 m_flFadeScale;
	float32 m_flShadowStrength;
	uint8 m_nObjectCulling;
	DecalRtEncoding_t m_nRequiredDecalRtEncoding;
	uint32 m_bodyGroupTotalRequestCount;
	CUtlVectorFixedGrowable< C_BaseModelEntity::BodyGroupRequest_t, 8 > m_bodyGroupRequests;
	CUtlOrderedMap< CGlobalSymbol, int32 > m_bodyGroupChoices;
	CNetworkViewOffsetVector m_vecViewOffset;
	// MNotSaved
	CClientAlphaProperty* m_pClientAlphaProperty;
	// MNotSaved
	Color m_ClientOverrideTint;
	// MNotSaved
	bool m_bUseClientOverrideTint;
	// MKV3TransferSaveOpsForField = "GetHitgroupDisableListSaveRestoreOps"
	uint32[1] m_bvDisabledHitGroups;
};
