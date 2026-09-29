// MGetKV3ClassDefaults = {
//	"_class": "CTakeDamageInfo",
//	"m_vecDamageForce":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_vecDamagePosition": null,
//	"m_vecReportedPosition": null,
//	"m_vecDamageDirection":
//	[
//		0.000000,
//		0.000000,
//		0.000000
//	],
//	"m_hInflictor": null,
//	"m_hAttacker": null,
//	"m_hAbility": null,
//	"m_flDamage": 0.000000,
//	"m_flTotalledDamage": 0.000000,
//	"m_bitsDamageType": "",
//	"m_iDamageCustom": 0,
//	"m_iAmmoType": "",
//	"m_flOriginalDamage": 0.000000,
//	"m_bShouldBleed": false,
//	"m_bShouldSpark": false,
//	"m_flDamageAbsorbed": 0.000000,
//	"m_nDamageFlags": "",
//	"m_DestructibleHitGroupRequests":
//	[
//	]
//}
// MHasKV3TransferPolymorphicClassname
class CTakeDamageInfo
{
	Vector m_vecDamageForce;
	VectorWS m_vecDamagePosition;
	VectorWS m_vecReportedPosition;
	Vector m_vecDamageDirection;
	CHandle< C_BaseEntity > m_hInflictor;
	CHandle< C_BaseEntity > m_hAttacker;
	CHandle< C_BaseEntity > m_hAbility;
	float32 m_flDamage;
	float32 m_flTotalledDamage;
	DamageTypes_t m_bitsDamageType;
	int32 m_iDamageCustom;
	AmmoIndex_t m_iAmmoType;
	float32 m_flOriginalDamage;
	bool m_bShouldBleed;
	bool m_bShouldSpark;
	float32 m_flDamageAbsorbed;
	TakeDamageFlags_t m_nDamageFlags;
	// MNotSaved
	HitGroup_t m_iHitGroupId;
	// MNotSaved
	ECitadelDamageType m_eCitadelDamageType;
	// MNotSaved
	float32 m_flAfterBuffDamage;
	// MNotSaved
	float32 m_flPreResistDamage;
	// MNotSaved
	bool m_bEvaded;
	// MNotSaved
	Vector m_vecDamageNormal;
	// MNotSaved
	CHandle< C_BaseEntity > m_hOriginator;
	// MNotSaved
	int32 m_iBatchCount;
	// MNotSaved
	float32 m_flEffectiveness;
	// MNotSaved
	float32 m_timeDamage;
	// MNotSaved
	float32 m_flCritDamage;
	// MNotSaved
	bool m_bSpeakDamageEvent;
	CUtlLeanVector< DestructiblePartDamageRequest_t > m_DestructibleHitGroupRequests;
	// MNotSaved
	bool m_bInTakeDamageFlow;
};
