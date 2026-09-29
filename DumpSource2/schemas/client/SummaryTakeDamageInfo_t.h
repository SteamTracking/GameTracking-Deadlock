// MGetKV3ClassDefaults = {
//	"nSummarisedCount": 0,
//	"info":
//	{
//		"_class": "CTakeDamageInfo",
//		"m_vecDamageForce":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_vecDamagePosition": null,
//		"m_vecReportedPosition": null,
//		"m_vecDamageDirection":
//		[
//			0.000000,
//			0.000000,
//			0.000000
//		],
//		"m_hInflictor": null,
//		"m_hAttacker": null,
//		"m_hAbility": null,
//		"m_flDamage": 0.000000,
//		"m_flTotalledDamage": 0.000000,
//		"m_bitsDamageType": "",
//		"m_iDamageCustom": 0,
//		"m_iAmmoType": "",
//		"m_flOriginalDamage": 0.000000,
//		"m_bShouldBleed": false,
//		"m_bShouldSpark": false,
//		"m_flDamageAbsorbed": 0.000000,
//		"m_nDamageFlags": "",
//		"m_DestructibleHitGroupRequests":
//		[
//		]
//	},
//	"result":
//	{
//		"m_pOriginatingInfo":
//		{
//			"_class": "CTakeDamageInfo",
//			"m_vecDamageForce":
//			[
//				0.000000,
//				0.000000,
//				0.000000
//			],
//			"m_vecDamagePosition": null,
//			"m_vecReportedPosition": null,
//			"m_vecDamageDirection":
//			[
//				0.000000,
//				0.000000,
//				0.000000
//			],
//			"m_hInflictor": null,
//			"m_hAttacker": null,
//			"m_hAbility": null,
//			"m_flDamage": 0.000000,
//			"m_flTotalledDamage": 0.000000,
//			"m_bitsDamageType": "",
//			"m_iDamageCustom": 0,
//			"m_iAmmoType": "",
//			"m_flOriginalDamage": 0.000000,
//			"m_bShouldBleed": false,
//			"m_bShouldSpark": false,
//			"m_flDamageAbsorbed": 0.000000,
//			"m_nDamageFlags": "",
//			"m_DestructibleHitGroupRequests":
//			[
//			]
//		},
//		"m_DestructibleHitGroupRequests":
//		[
//		],
//		"m_nHealthLost": 0,
//		"m_nHealthBefore": 0,
//		"m_flDamageDealt": 0.000000,
//		"m_flPreModifiedDamage": 0.000000,
//		"m_vDamagePosition": null,
//		"m_nTotalledHealthLost": 0,
//		"m_flTotalledDamageDealt": 0.000000,
//		"m_flTotalledPreModifiedDamage": 0.000000,
//		"m_flNewDamageAccumulatorValue": 0.000000,
//		"m_nDamageFlags": "",
//		"m_bWasDamageSuppressed": false,
//		"m_bSuppressFlinch": false,
//		"m_nOverrideFlinchHitGroup": "HITGROUP_INVALID"
//	},
//	"hTarget": null
//}
class SummaryTakeDamageInfo_t
{
	int32 nSummarisedCount;
	CTakeDamageInfo info;
	CTakeDamageResult result;
	CHandle< C_BaseEntity > hTarget;
};
