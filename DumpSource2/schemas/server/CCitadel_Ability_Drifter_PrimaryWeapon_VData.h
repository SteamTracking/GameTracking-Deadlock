// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Drifter_PrimaryWeapon_VData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleRight;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strSwipeTracerParticleLeft;
	// MPropertyStartGroup = "Gun"
	CUtlVector< Vector2D > m_vecOriginOffsetsLeft;
	float32 m_flCenterBulletRadiusOverride; // = 6
};
