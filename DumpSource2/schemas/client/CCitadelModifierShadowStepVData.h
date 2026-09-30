// MHasKV3TransferPolymorphicClassname
class CCitadelModifierShadowStepVData : public CCitadel_Modifier_InvisVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_ArmorDebuff;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_InvisChangedEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShadowRevealedEffect;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flMinInvisDuration; // = 2
};
