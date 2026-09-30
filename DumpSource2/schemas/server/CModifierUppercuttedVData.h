// MHasKV3TransferPolymorphicClassname
class CModifierUppercuttedVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StunParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strStunSound;
	CSoundEventName m_strExplodeHitSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_NoExplodeModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ExplodeDebuffModifier;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flEnemyNoAirDashDuration; // = 2.5
};
