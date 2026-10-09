// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MoveChessPieceCooldownVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StatusEffectParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCooldownCompleteSound;
	CSoundEventName m_strCooldownCompleteQueenSound;
};
