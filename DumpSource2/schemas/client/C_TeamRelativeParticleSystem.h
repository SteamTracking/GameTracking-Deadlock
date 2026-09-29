class C_TeamRelativeParticleSystem : public C_ParticleSystem
{
	CUtlSymbolLarge m_iszFriendlyEffectName;
	CUtlSymbolLarge m_iszEnemyEffectName;
	// MNotSaved
	CStrongHandle< InfoForResourceTypeIParticleSystemDefinition > m_iFriendlyEffectIndex;
	// MNotSaved
	CStrongHandle< InfoForResourceTypeIParticleSystemDefinition > m_iEnemyEffectIndex;
};
