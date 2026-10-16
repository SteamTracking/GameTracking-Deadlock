// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_ProjectileWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitSound;
	// MPropertyStartGroup = "Gameplay"
	CUtlVector< float32 > m_vecRolls;
	float32 m_flProjectileDrag; // = 8
	float32 m_flProjectileVelocityLossOnHit; // = 10
};
