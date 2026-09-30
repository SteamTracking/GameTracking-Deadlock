// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RadiantFlareBonusDamageVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strOnBulletHitDamageSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DamageFX;
};
