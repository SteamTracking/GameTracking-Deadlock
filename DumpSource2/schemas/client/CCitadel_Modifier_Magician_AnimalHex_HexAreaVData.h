// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Magician_AnimalHex_HexAreaVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_HexModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AreaWarningEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strArmingSound;
	CSoundEventName m_strArmedSound;
	CSoundEventName m_strLoopingSound;
	CSoundEventName m_strHitSound;
};
