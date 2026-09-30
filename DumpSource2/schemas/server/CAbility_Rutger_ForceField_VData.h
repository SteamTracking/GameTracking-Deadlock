// MHasKV3TransferPolymorphicClassname
class CAbility_Rutger_ForceField_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AuraModifier;
	CEmbeddedSubclass< CCitadelModifier > m_VictimPushModifier;
	CEmbeddedSubclass< CBaseModifier > m_SlowModifier;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strDomeCreated;
	CSoundEventName m_strChargeUpSound;
	CSoundEventName m_strPushAndDamage;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ChronoSphereChargeParticle;
};
