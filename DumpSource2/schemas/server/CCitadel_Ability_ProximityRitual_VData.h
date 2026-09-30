// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ProximityRitual_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_PredatoryStatueModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatReappearParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatDisappearParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatEyesParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatSummonParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CatRecallParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RecallLineParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strRecallSound;
	CSoundEventName m_strKilledSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_PredatoryStatueModifier;
	CEmbeddedSubclass< CCitadelModifier > m_RecentDamageModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHeavyMeleeDmg; // = 75
	float32 m_flLightMeleeDmg; // = 50
	float32 m_flAbilityDamageScale; // = 0.2
	float32 m_flNPCDamageScale; // = 0.5
	float32 m_flCastDelayMin; // = 0.2
	float32 m_flCastDelayMax; // = 2
	float32 m_flCastDelayMaxDist; // = 20
	float32 m_flPostCastCooldown; // = 2
};
