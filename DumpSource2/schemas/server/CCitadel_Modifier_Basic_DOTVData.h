// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Basic_DOTVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strDamageParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strDamageSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flTickInterval; // = 0.5
	TakeDamageFlags_t m_damageFlags;
	DamageTypes_t m_damagetype; // = "DMG_DOT"
	bool m_bSnapshotDPS;
	CUtlString m_strDPSAbilityPropertyName;
};
