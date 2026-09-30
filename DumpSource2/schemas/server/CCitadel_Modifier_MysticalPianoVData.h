// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MysticalPianoVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StunModifier;
	CEmbeddedSubclass< CCitadelModifier > m_DazeModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HitParticle;
};
