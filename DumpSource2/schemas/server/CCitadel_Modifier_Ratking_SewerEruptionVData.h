// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Ratking_SewerEruptionVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EnemyAuraModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_AnticipationSound;
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "Half height of the cylinder the eruption checks for victims, in meters."
	float32 m_flExplosionHalfHeightMeters; // = 10
	// MPropertyDescription = "Upward launch speed of anyone caught in the eruption."
	float32 m_flTossSpeed; // = 500
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AnticipationParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_SewerModel;
};
