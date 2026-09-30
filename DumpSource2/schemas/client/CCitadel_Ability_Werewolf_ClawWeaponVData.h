// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Werewolf_ClawWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeHitParticle;
	// MPropertyStartGroup = "Gun"
	CUtlVector< ClawSwipeInfo_t > m_vecClawSwipeInfos;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSwipeHitSound;
};
