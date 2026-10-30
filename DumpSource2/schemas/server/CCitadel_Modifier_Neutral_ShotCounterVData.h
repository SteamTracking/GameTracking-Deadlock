// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Neutral_ShotCounterVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Follows core. CP1.x counts shots fired"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CoreParticle;
	// MPropertyDescription = "How many books the bandolier starts with. Drives CP2.y, the ring's emitter count."
	int32 m_nStartingBookCount; // = 7
};
