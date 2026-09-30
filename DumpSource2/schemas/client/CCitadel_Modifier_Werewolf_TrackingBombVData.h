// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Werewolf_TrackingBombVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DebuffParticle;
	// MPropertyGroupName = "Gameplay"
	bool m_bAllowAlliesToAlsoTrack;
	float32 m_flLabelOffset; // = 40
};
