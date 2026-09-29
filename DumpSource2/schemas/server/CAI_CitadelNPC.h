class CAI_CitadelNPC : public CAI_BaseNPC
{
	CCitadelAbilityComponent m_CCitadelAbilityComponent;
	CCitadelRegenComponent m_CCitadelRegenComponent;
	CCitadelMinimapComponent m_CCitadelMinimapComponent;
	CHandle< CCitadelBaseAbility > m_hAbilityOwner;
	// MNotSaved
	CUtlVectorEmbeddedNetworkVar< WeakPoint_t > m_vecWeakPoints;
	// MNotSaved
	bool m_bMinion;
	// MNotSaved
	CHandle< CBaseEntity > m_hLookTarget;
	bool m_bBeamActive;
	VectorWS m_vEyeBeamTarget;
};
