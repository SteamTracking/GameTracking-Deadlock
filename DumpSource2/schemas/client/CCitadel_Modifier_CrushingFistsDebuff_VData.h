// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_CrushingFistsDebuff_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcNotificationModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ProcNotificationEffect;
};
