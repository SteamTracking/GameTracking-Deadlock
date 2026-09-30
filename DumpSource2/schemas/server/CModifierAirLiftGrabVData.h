// MHasKV3TransferPolymorphicClassname
class CModifierAirLiftGrabVData : public CCitadel_Modifier_DragVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_GrabEffect;
	// MPropertyStartGroup = "Gameplay"
	float32 m_flAllyGrabCancelTime; // = 1
};
