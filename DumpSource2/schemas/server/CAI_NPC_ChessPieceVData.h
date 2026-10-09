// MHasKV3TransferPolymorphicClassname
class CAI_NPC_ChessPieceVData : public CAI_CitadelNPCVData
{
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_ExpireModifier;
	// MPropertyStartGroup = "Outline"
	bool m_bShouldUseCooldownOutline;
	Color m_cCooldownOutlineColor;
	float32 m_flCooldownOutlineWidth;
	// MPropertyStartGroup = "Gameplay"
	bool m_bShouldMove;
	bool m_bShouldKnockawayOnMelee;
	float32 m_flMeleeDuration; // = 1
	float32 m_flMeleeFireDelay; // = 0.1
	float32 m_flHopSpeed; // = 50
	float32 m_flMeleeKnockupStrength; // = 50
	float32 m_flMeleeKnockbackStrength; // = 50
};
