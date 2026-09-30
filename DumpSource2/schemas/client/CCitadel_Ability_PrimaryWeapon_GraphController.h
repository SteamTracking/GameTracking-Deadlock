// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_PrimaryWeapon_GraphController : public CCitadelBaseAbilityGraphController
{
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_Shoot;
	CAnimGraph2ParamOptionalRef< CGlobalSymbol > m_Muzzle;
	CAnimGraphParamRef< CGlobalSymbol > m_ReloadState;
	CAnimGraphParamRef< float32 > m_ReloadFraction;
	CAnimGraphParamRef< float32 > m_ReloadSpeed;
	CAnimGraphParamRef< float32 > m_AmmoFraction;
	CAnimGraphParamRef< float32 > m_Ammo;
	CAnimGraphParamRef< float32 > m_AmmoMax;
	int32 m_nShootPriority; // = -1
	int32 m_nReloadPriority; // = -1
	float32 m_flLatchedReloadSpeed; // = 1
	CGlobalSymbol m_symLastMuzzle;
};
