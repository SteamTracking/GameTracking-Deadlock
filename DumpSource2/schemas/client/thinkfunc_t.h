// MGetKV3ClassDefaults = {
//	"m_think": "",
//	"m_nContext": "",
//	"m_nNextThinkTick": null,
//	"m_nLastThinkTick": null
//}
class thinkfunc_t
{
	BASEPTR m_think;
	// MNotSaved
	HSCRIPT m_hFn;
	CUtlStringToken m_nContext;
	GameTick_t m_nNextThinkTick;
	GameTick_t m_nLastThinkTick;
};
