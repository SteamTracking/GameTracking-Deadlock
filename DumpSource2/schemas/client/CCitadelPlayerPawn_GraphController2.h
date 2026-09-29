// MGetKV3ClassDefaults = Could not parse KV3 Defaults
// MHasKV3TransferPolymorphicClassname
class CCitadelPlayerPawn_GraphController2 : public CAnimGraphControllerBase
{
	CAnimGraph2ParamOptionalRef< float32 > m_flTimeScale;
	CAnimGraph2ParamOptionalRef< float32 > m_flForwardSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookHeading;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookPitch;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookHeadingSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flLookPitchSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flMoveSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flTurnSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flStrafeSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flVerticalSpeed;
	CAnimGraph2ParamOptionalRef< float32 > m_flRandomSeed;
	CAnimGraph2ParamOptionalRef< bool > m_bHasLookTarget;
	CAnimGraph2ParamOptionalRef< Vector > m_vLookTarget;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_HeroActionSource;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_HeroAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_HeroState;
	CAnimGraph2ParamOptionalRef< bool > m_InstantCast;
	CAnimGraph2ParamOptionalRef< bool > m_AltCast;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_BaseAction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_BaseState;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_FlinchType;
	CAnimGraph2ParamOptionalRef< float32 > m_CrouchFraction;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_MoveType;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_CornerLean;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_Environment;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_CameraMode;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_Emote;
	CAnimGraph2ParamOptionalRef< float32 > m_flDirectionCommitment;
	CAnimGraph2ParamOptionalRef< float32 > m_flFireRateScale;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_aim;
	CAnimGraph2ParamOptionalRef< float32 > m_flZipLineAttachBlend;
	CAnimGraph2ParamOptionalRef< float32 > m_flInputForward;
	CAnimGraph2ParamOptionalRef< float32 > m_flInputRight;
	CAnimGraph2ParamOptionalRef< float32 > m_flHeroFloat1;
	CAnimGraph2ParamOptionalRef< float32 > m_flHeroFloat2;
	CAnimGraph2ParamOptionalRef< float32 > m_flHeroFloat3;
	CAnimGraphTagOptionalRef m_tagEmote;
};
