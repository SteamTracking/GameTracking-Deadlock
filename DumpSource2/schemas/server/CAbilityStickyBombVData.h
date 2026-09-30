// MHasKV3TransferPolymorphicClassname
class CAbilityStickyBombVData : public CitadelAbilityVData
{
	// MPropertyGroupName = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_BombAttachedModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SelfBuffModifier;
	CEmbeddedSubclass< CCitadelModifier > m_KillCheckModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CastBombParticle;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flPostRangeGravityScale; // = 1.6
	float32 m_flAllyCollideRadius; // = 5
	float32 m_flBombDragStartRange; // = 40
	float32 m_flBombDragStartValue; // = 0.9
	float32 m_flBombDragEndValue; // = 0.4
	float32 m_flAllyTargetRangeMult; // = 2
	float32 m_flHookTargetOnlyWindow; // = 0.25
};
