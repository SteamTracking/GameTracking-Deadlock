// MHasKV3TransferPolymorphicClassname
class CModifierNeutralAbilityVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	float32 m_flCastDelayTime;
	float32 m_flChannelTime;
	float32 m_flPostCastTime;
	float32 m_flCooldownTime;
	ECitadelDamageType m_eDamageType; // = "CITADEL_DAMAGETYPE_ABILITY"
	CCitadelWeaponInfo m_WeaponInfo;
	// MPropertyDescription = "Attachment to fire from. Empty uses "eye"."
	CUtlString m_strShootAttachment;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCastDelaySound;
	CSoundEventName m_strChannelSound;
	CSoundEventName m_strChannelLoopSound;
	CSoundEventName m_strCastSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_AutoCastDelayModifier;
	CEmbeddedSubclass< CCitadelModifier > m_AutoChannelModifier;
	// MPropertyDescription = "Seconds to keep the cast delay modifier alive past the end of the cast delay. 0 is default behavior."
	float32 m_flAutoCastDelayKillDelay;
	// MPropertyStartGroup = "Animation"
	ENeutralNPCAction m_eAG2PreCastAction; // = "EAbilityCharge"
	ENeutralNPCAction m_eAG2CastCompleteAction; // = "EAbilityCastComplete"
	ENeutralNPCAction m_eAG2ChannelAction; // = "EAbilityChannel"
};
