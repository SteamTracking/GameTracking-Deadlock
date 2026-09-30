// MHasKV3TransferPolymorphicClassname
class CAI_CitadelNPC_GraphController : public CAI_BaseNPCGraphController
{
	CAnimGraph2ParamOptionalRef< float32 > m_flRandomSeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flTimeScale;
	CAnimGraph2ParamOptionalRef< float32 > m_flHealthPct;
	CAnimGraph2ParamOptionalRef< bool > m_bHasTarget;
	CAnimGraph2ParamOptionalRef< bool > m_bInAir;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eMovementBlockedID;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eHitReactID;
	CAnimGraph2ParamOptionalRef< float32 > m_flHitReactDuration;
	CAnimGraph2ParamOptionalRef< float32 > m_flMoveSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flForwardSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flStrafeSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flVerticalSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookPitch;
	CAnimGraph2ParamOptionalRef< Vector > m_vLookTarget;
	CAnimGraph2ParamOptionalRef< bool > m_bMeleeAttack;
	CAnimGraph2ParamOptionalRef< bool > m_bRangedAttack;
	CAnimGraph2ParamOptionalRef< bool > m_bKill;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eFlinch;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_eTurn;
};
