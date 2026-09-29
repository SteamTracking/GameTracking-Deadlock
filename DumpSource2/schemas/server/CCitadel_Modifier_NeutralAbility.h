class CCitadel_Modifier_NeutralAbility : public CCitadelModifier
{
	ENeutralAbilityState m_eState;
	GameTime_t m_tExecuteTime;
	GameTime_t m_tStateChangeTime;
	GameTime_t m_tNextCastTime;
	CModifierHandleTyped< CCitadelModifier > m_pCastDelayAutoModifier;
	CModifierHandleTyped< CCitadelModifier > m_pChannelAutoModifier;
	AttachmentHandle_t m_hShootAttach;
};
