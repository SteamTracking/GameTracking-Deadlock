// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Spinning_BladeVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatchIndicator;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatchParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strThrowSound;
	CSoundEventName m_strReturnSound;
	CSoundEventName m_strCatchSound;
	CSoundEventName m_strFailSound;
	CSoundEventName m_strHitSound;
};
