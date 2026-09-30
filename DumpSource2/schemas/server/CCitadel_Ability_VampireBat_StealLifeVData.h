// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_VampireBat_StealLifeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastLifeLeechParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageTargetParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSlashSound;
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strKillConfirmSound;
	CSoundEventName m_strFloatStartSound;
	CSoundEventName m_strFloatLoopSound;
	CSoundEventName m_strFloatEndSound;
	// MPropertyStartGroup = "Gameplay"
	bool m_bAllowFloating; // = true
};
