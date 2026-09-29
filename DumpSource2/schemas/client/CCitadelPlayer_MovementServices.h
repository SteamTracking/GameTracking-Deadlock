class CCitadelPlayer_MovementServices : public CPlayer_MovementServices_Humanoid
{
	CNetworkVelocityVector m_vPositionDeltaVelocity;
	bool m_bToggleDuckActive;
	bool m_bDucked;
	bool m_bInPortalEnvironment;
	Vector m_vecPogoVelocity;
	float32 m_flSkyclipVelocityZ;
	VectorWS m_vecSupport;
	bool m_bColliding;
	bool m_bLandedOnGround;
	bool m_bHasFreeCursor;
	float32 m_flPawnTurnSpringSpeed;
	float32 m_flAG2TurnSpeed;
	float32 m_flAG2TurnSpeedSpringSpeed;
	float32 m_flInputDirectionCommitment;
	int8 m_nSuccessiveDirChanges;
	GameTime_t m_flLastDirChange;
	Vector2D m_vLastWishDir;
};
