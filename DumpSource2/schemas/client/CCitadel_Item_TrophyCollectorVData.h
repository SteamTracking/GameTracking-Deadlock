// MHasKV3TransferPolymorphicClassname
class CCitadel_Item_TrophyCollectorVData : public CitadelItemVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EarnedParticle;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_TrophyStacksModifier;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strEarnedSound;
};
