// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Tengu_StoneFormVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StoneFormParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strImpactSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_DragModifier;
	// MPropertyDescription = "Model"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_strTrueFormModel;
	// MPropertyStartGroup = "+Stone Form Params"
	float32 m_flLandHoldTime; // = 0.4
	float32 m_flRisingTime; // = 0.5
	float32 m_flCollideRadius; // = 40
	float32 m_flGroundDetectionFailsafeDelay; // = 0.1
};
