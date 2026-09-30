// MHasKV3TransferPolymorphicClassname
class CAbility_Werewolf_FrenzyVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TargetModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TargetDamageParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strHitConfirmSound;
	CSoundEventName m_strPointBlankSweetenerSound;
};
