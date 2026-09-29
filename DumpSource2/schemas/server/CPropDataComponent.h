// MGetKV3ClassDefaults = {
//	"_class": "CPropDataComponent",
//	"m_flDmgModBullet": 1.000000,
//	"m_flDmgModClub": 1.000000,
//	"m_flDmgModExplosive": 1.000000,
//	"m_flDmgModFire": 1.000000,
//	"m_iszPhysicsDamageTableName": "",
//	"m_iszBasePropData": "",
//	"m_nInteractions": 0,
//	"m_bSpawnMotionDisabled": false,
//	"m_nDisableTakePhysicsDamageSpawnFlag": 0,
//	"m_nMotionDisabledSpawnFlag": 0
//}
// MHasKV3TransferPolymorphicClassname
class CPropDataComponent : public CEntityComponent
{
	float32 m_flDmgModBullet;
	float32 m_flDmgModClub;
	float32 m_flDmgModExplosive;
	float32 m_flDmgModFire;
	CUtlSymbolLarge m_iszPhysicsDamageTableName;
	CUtlSymbolLarge m_iszBasePropData;
	int32 m_nInteractions;
	bool m_bSpawnMotionDisabled;
	int32 m_nDisableTakePhysicsDamageSpawnFlag;
	int32 m_nMotionDisabledSpawnFlag;
};
