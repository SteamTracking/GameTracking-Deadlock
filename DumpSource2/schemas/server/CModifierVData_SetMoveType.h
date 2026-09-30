// MHasKV3TransferPolymorphicClassname
class CModifierVData_SetMoveType : public CCitadelModifierVData
{
	// MPropertyDescription = "The move type to switch to.  Some move types will have weird behaviors when swapped to, ie: MOVETYPE_SYNC"
	MoveType_t m_nMoveType; // = "MOVETYPE_NONE"
};
