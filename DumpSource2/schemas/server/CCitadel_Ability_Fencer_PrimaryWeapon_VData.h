// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Fencer_PrimaryWeapon_VData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleRight;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleRightMove;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleLeft;
	float32 m_flMoveSlashThreshold; // = 20
	// MPropertyStartGroup = "Gun"
	CUtlVector< SlashInfo_t > m_vecSlashInfos;
};
