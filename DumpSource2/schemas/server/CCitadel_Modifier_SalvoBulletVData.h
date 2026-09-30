// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SalvoBulletVData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionVictimParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SalvoWeaponParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ShotVictimSound;
	CSoundEventName m_ShotConfirmationSound;
};
