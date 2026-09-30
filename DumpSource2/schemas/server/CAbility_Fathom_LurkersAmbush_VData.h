// MHasKV3TransferPolymorphicClassname
class CAbility_Fathom_LurkersAmbush_VData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChargeUpParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadel_Modifier_LurkersAmbush_Invis > m_InvisModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RegenModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strSwapStarted;
};
