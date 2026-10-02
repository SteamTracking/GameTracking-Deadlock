// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_FlagAuraVData : public CCitadelModifierAuraVData
{
	// MPropertyStartGroup = "Rats"
	// MPropertyDescription = "Seconds between spews of rats from the planted banner."
	float32 m_flRatSpawnInterval; // = 0.5
	// MPropertyDescription = "Rats leaping out per spew."
	int32 m_nRatsPerSpawn; // = 1
	// MPropertyDescription = "The ring is split into this many wedges and each spew walks them in a shuffled order"
	int32 m_nRatYawSegments; // = 8
	// MPropertyDescription = "Launch speed of each rat as it leaps."
	float32 m_flRatLeapSpeed; // = 500
	// MPropertyDescription = "Launch pitch of each rat"
	float32 m_flRatLeapAngle; // = 40
	// MPropertyDescription = "Seconds a rat lives after leaping out. "
	float32 m_flRatLifetime; // = 3
	// MPropertyDescription = "How far the rats run as a fraction of the banner's Radius"
	float32 m_flRatTravelRadiusFraction; // = 2
	// MPropertyDescription = "Rats that attach to an enemy hit by one of these rats."
	int32 m_nBannerRatsAttached; // = 1
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EndcapParticle;
};
