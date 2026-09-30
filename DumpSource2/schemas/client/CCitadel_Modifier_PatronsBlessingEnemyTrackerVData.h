// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_PatronsBlessingEnemyTrackerVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ProcNotificationModifier;
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HealParticle;
	// MPropertyGroupName = "Sounds"
	CSoundEventName m_strHealSound;
};
