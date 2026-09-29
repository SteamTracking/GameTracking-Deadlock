// MGetKV3ClassDefaults = {
//	"_class": "CGameChoreoServices",
//	"m_hOwner": null,
//	"m_hScriptedSequence": null,
//	"m_scriptState": "SCRIPT_PLAYING",
//	"m_choreoState": "STATE_PRE_SCRIPT",
//	"m_flTimeStartedState": null
//}
// MHasKV3TransferPolymorphicClassname
class CGameChoreoServices : public IChoreoServices
{
	CHandle< CBaseModelEntity > m_hOwner;
	CHandle< CScriptedSequence > m_hScriptedSequence;
	IChoreoServices::ScriptState_t m_scriptState;
	IChoreoServices::ChoreoState_t m_choreoState;
	GameTime_t m_flTimeStartedState;
};
