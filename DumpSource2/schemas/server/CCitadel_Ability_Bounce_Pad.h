// MNetworkVarNames = "QAngle m_angFacing"
// MClassHasEntityLimitedDataDesc
class CCitadel_Ability_Bounce_Pad : public CCitadelBaseAbility
{
	Vector m_vForward;
	bool m_bShouldDeploy;
	bool m_bAnglesSet;
	bool m_bCanCancel;
	// MNetworkEnable
	QAngle m_angFacing;
};
