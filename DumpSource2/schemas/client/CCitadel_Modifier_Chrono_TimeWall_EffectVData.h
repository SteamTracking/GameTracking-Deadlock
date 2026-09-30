// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Chrono_TimeWall_EffectVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_DebuffModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strDamageSound;
};
