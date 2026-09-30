// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_PrimaryWeapon_BebopVData : public CCitadel_Ability_PrimaryWeaponVData
{
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strWindupSound;
	CSoundEventName m_strBeamStartSound;
	CSoundEventName m_strBeamLoopSound1;
	CSoundEventName m_strBeamLoopSound2;
	CSoundEventName m_strBeamStopSound;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_szWeaponBeamParticle;
	// MPropertyStartGroup = "Misc"
	float32 m_flWindupRepeatCycle; // = 10000
};
