// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_EmpowerBulletVData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplosionVictimParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EmpowerWeaponParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ShotVictimSound;
	CSoundEventName m_ShotConfirmationSound;
};
