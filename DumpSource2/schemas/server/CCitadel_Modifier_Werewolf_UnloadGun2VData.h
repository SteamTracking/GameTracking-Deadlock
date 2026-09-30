// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Werewolf_UnloadGun2VData : public CCitadel_Modifier_BaseBulletPreRollProcVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStackProcSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strStackProcEffect;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_StackingModifier;
};
