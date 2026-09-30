// MHasKV3TransferPolymorphicClassname
class CNPC_TrooperNeutralNodeMoverVData : public CNPC_TrooperNeutralVData
{
	// MPropertyStartGroup = "Node Movement"
	bool m_bEnableMovementToNodes;
	CRangeFloat m_flExposedDuration; // = 2
	CRangeFloat m_flHideDuration; // = 0.5
	CEmbeddedSubclass< CCitadelModifier > m_HidingModifier;
};
