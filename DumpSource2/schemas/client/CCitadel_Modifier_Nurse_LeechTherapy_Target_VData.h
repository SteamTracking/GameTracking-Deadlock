// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Nurse_LeechTherapy_Target_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PurgeCastParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_EatingBuffsModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strLeechRemoveSound;
	CSoundEventName m_PurgeSound;
};
