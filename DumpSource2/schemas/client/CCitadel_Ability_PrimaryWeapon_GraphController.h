// MGetKV3ClassDefaults = {
//	"_class": "CCitadel_Ability_PrimaryWeapon_GraphController",
//	"m_hExternalGraph": 4294967295,
//	"m_Shoot": null,
//	"m_Muzzle": null,
//	"m_ReloadState": null,
//	"m_ReloadFraction": null,
//	"m_ReloadSpeed": null,
//	"m_AmmoFraction": null,
//	"m_Ammo": null,
//	"m_AmmoMax": null,
//	"m_nShootPriority": -1,
//	"m_nReloadPriority": -1,
//	"m_flLatchedReloadSpeed": 1.000000,
//	"m_symLastMuzzle": ""
//}
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
	int32 m_nShootPriority;
	int32 m_nReloadPriority;
	float32 m_flLatchedReloadSpeed;
	CGlobalSymbol m_symLastMuzzle;
};
