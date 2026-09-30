// MHasKV3TransferPolymorphicClassname
class CAbilityMeleeVData : public CitadelAbilityVData
{
	// MPropertyDescription = "How long we'll buffer input to trigger another melee if we're already performing a melee"
	float32 m_flMeleeInputBufferTime; // = 0.25
	// MPropertyDescription = "If we detect an enemy within this distance, forward attack movement will be suppressed so we don't move through them"
	float32 m_flCollisionDistance; // = 50
	// MPropertyDescription = "A heavy attack will trigger after being charged up for this long"
	float32 m_flHeavyAttackRequiredHoldTime; // = 0.55
	// MPropertyDescription = "A light attack will trigger if the melee button is pressed and released within this time.  After this time, a heavy melee will charge up"
	float32 m_flLightAttackMaxHoldTime; // = 0.2
	// MPropertyDescription = "How far to the side a target must dash during the melee attack delay window  in order to dodge a pending hit"
	float32 m_flSideDashDodgeDist; // = 75
	// MPropertyDescription = "How far back a target must dash during the melee attack delay window  in order to dodge a pending hit"
	float32 m_flBackDashDodgeDist; // = 50
	TakeDamageFlags_t m_MeleeDamageFlags;
	CUtlString m_strEffectsAttachName; // = "palm_l"
	// MPropertyStartGroup = "AnimGraph2"
	float32 m_flChargeAnimDelayTime; // = 0.1
};
