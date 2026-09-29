// MGetKV3ClassDefaults = {
//	"m_flFireTime": null,
//	"m_targetType": 0,
//	"m_pTarget": "",
//	"m_pTargetInput": "",
//	"m_hActivator": null,
//	"m_hCaller": null,
//	"m_hEntTarget": null,
//	"m_PulseArguments":
//	{
//	},
//	"m_paramMap":
//	{
//		"--forward-all-args--": false
//	}
//}
class EntityIOQueuePrioritizedEvent_t
{
	GameTime_t m_flFireTime;
	EntityIOTargetType_t m_targetType;
	CUtlSymbolLarge m_pTarget;
	CUtlSymbolLarge m_pTargetInput;
	CEntityHandle m_hActivator;
	CEntityHandle m_hCaller;
	CEntityHandle m_hEntTarget;
	// MKV3TransferSaveOpsForField = "GetVariantSaveDataOps"
	CVariantBase< CVariantDefaultAllocator > m_variantValue;
	CPulseArgumentPack m_PulseArguments;
	CPulseInputParamMap m_paramMap;
};
