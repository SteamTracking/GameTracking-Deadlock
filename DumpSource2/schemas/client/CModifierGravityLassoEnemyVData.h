// MHasKV3TransferPolymorphicClassname
class CModifierGravityLassoEnemyVData : public CCitadel_Modifier_DragVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_LassoEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StunModifier;
};
