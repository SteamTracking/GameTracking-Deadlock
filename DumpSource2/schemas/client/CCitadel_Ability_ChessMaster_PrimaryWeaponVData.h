// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_ChessMaster_PrimaryWeaponVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_strBishopTracer;
	float32 m_flMoveSlashThreshold; // = 20
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBishopCommandSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flHorizontalOffsetPerShot; // = 5
	// MPropertyStartGroup = "AnimGraph2"
	float32 m_flReshuffleHoldTime; // = 0.05
	CGlobalSymbol m_strAG2HeroActionGainedBullets; // = "reshuffle"
};
