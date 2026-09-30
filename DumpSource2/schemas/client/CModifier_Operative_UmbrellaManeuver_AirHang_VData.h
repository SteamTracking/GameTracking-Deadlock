// MHasKV3TransferPolymorphicClassname
class CModifier_Operative_UmbrellaManeuver_AirHang_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TracerParticle;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_ExplodeSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAirDrag; // = 1
	float32 m_flAirSpeed; // = 100
	float32 m_flFallSpeed; // = 30
};
