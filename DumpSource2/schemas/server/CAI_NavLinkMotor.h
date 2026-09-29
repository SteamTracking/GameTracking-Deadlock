class CAI_NavLinkMotor : public IAI_Motor
{
	CUtlVector< std::unique_ptr< INavLinkSubMotor > > m_vecSubMotors;
	int32 m_nActiveSubMotorIndex;
	int32 m_nObstacleSubMotorCount;
	INavLinkSubMotor::StartType_t m_eStartType;
	INavLinkSubMotor::ExitType_t m_eExitType;
	bool m_bStopped;
};
