// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_RatKing_RatArmorVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strKnockoffArmorSound;
	CSoundEventName m_strBlockedDamageSound;
	CSoundEventName m_strAttackerHitSound;
	CSoundEventName m_strHitProcSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AttackerHitFx;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ImpactParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_KnockoffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RatShieldStartParticle;
	CUtlVector< RatArmorPiece_t > m_vecArmorPieces;
};
