// MGetKV3ClassDefaults = {
//	"m_Map":
//	[
//	],
//	"m_flFreeKnowledgeDuration": 1.750000,
//	"m_flEnemyDiscardDuration": 60.000000,
//	"m_flLastAggroDecayTime": 0.000000,
//	"m_nSerial": 0,
//	"m_hCurrentEnemy": null,
//	"m_hFreeHuntTarget": null
//}
class CAI_Enemies
{
	CUtlOrderedMap< CHandle< CBaseEntity >, AI_EnemyInfo_t* > m_Map;
	float32 m_flFreeKnowledgeDuration;
	float32 m_flEnemyDiscardDuration;
	float32 m_flLastAggroDecayTime;
	int32 m_nSerial;
	CHandle< CBaseEntity > m_hCurrentEnemy;
	CHandle< CBaseEntity > m_hFreeHuntTarget;
};
