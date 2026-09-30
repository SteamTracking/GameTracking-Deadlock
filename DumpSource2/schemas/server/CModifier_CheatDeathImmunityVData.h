// MHasKV3TransferPolymorphicClassname
class CModifier_CheatDeathImmunityVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BuffPlayerParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIMaterial2 > > m_StatusEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strTimerSound;
};
