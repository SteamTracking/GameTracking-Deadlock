// MHasKV3TransferPolymorphicClassname
class CModifierAirLiftGrabVData : public CCitadel_Modifier_DragVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GrabEffect;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBombLaunchSound;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAllyGrabCancelTime; // = 1
};
