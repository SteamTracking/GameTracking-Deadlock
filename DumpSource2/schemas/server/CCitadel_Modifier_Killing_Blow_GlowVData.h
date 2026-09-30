// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Killing_Blow_GlowVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShivOnlyDeathStatus;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShivOnlyDeathTrail;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShivOnlyExecuteHeart;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strShivOnlyActivateSound;
};
