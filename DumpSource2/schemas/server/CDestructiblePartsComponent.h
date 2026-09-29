// MGetKV3ClassDefaults = {
//	"m_vecDamageTakenByHitGroup":
//	[
//	],
//	"m_hOwner": null,
//	"m_pAnimGraphDestructibleGraphController": null
//}
class CDestructiblePartsComponent
{
	// MNotSaved
	CNetworkVarChainer __m_pChainEntity;
	CUtlVector< uint16 > m_vecDamageTakenByHitGroup;
	CHandle< CBaseModelEntity > m_hOwner;
	CAnimGraphControllerPtr m_pAnimGraphDestructibleGraphController;
};
