// MHasKV3TransferPolymorphicClassname
class CGameModifier_FireUserEntityIOVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Fire User Entity IO"
	// MPropertyDescription = "User Entity IO to fire when modifier added. 0 = don't fire."
	FireUserEntityIO_t m_FireOnAdded;
	// MPropertyDescription = "User Entity IO to fire when modifier removed. 0 = don't fire."
	FireUserEntityIO_t m_FireOnRemoved;
};
