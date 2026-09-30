// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_PowerSurgeVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_WeaponFxParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWeaponShootSound;
	CSoundEventName m_strBulletWhizSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
};
