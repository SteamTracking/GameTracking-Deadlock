// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_PrimaryWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleRight;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleRightMove;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleLeft;
	float32 m_flMoveSlashThreshold; // = 20
	// MPropertyStartGroup = "Gun"
	CUtlVector< ArtistWeaponBulletInfo_t > m_vecArtistWeaponBulletInfo;
	CUtlVector< ArtistWeaponBulletInfo_t > m_vecArtistEmpoweredWeaponBulletInfo;
	int32 m_iBaseBulletCount; // = 3
	int32 m_iEmpoweredBulletCount; // = 6
};
