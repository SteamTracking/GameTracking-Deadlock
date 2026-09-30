// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_FamiliarAltWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PendingBulletParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strAddPendingBulletSound;
	CSoundEventName m_strFirePendingBulletSound;
};
