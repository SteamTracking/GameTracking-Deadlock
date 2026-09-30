// MHasKV3TransferPolymorphicClassname
class CCitadel_Werewolf_UnloadGunVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ShootingModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strShootSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GunReloadParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MuzzleFlashParticle;
	// MPropertyStartGroup = "Gameplay"
	bool m_bGrantAmmoOnCast;
};
