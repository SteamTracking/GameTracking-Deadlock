// MGetKV3ClassDefaults = {
//	"m_bEnableVsnd": true,
//	"m_vsnd":
//	{
//		"m_namespace": "",
//		"m_bUseReference": true,
//		"m_sound": "",
//		"m_pSound": null
//	},
//	"m_bEnableEndcap": false,
//	"m_endcapVsnd":
//	{
//		"m_namespace": "",
//		"m_bUseReference": true,
//		"m_sound": "",
//		"m_pSound": null
//	},
//	"m_bEnableLoopcap": false,
//	"m_loopcapVsnd":
//	{
//		"m_namespace": "",
//		"m_bUseReference": true,
//		"m_sound": "",
//		"m_pSound": null
//	},
//	"m_volume": 1.000000,
//	"m_fadeOut": 0.000000,
//	"m_mode": "Trigger"
//}
class CVsndTriggerSlot
{
	// MPropertyGroupName = "Vsnd"
	// MPropertyFriendlyName = "Enable Vsnd"
	bool m_bEnableVsnd;
	// MPropertyGroupName = "Vsnd"
	// MPropertyFriendlyName = "Vsnd File"
	CSoundContainerReference m_vsnd;
	// MPropertyGroupName = "Endcap"
	// MPropertyFriendlyName = "Enable Endcap"
	bool m_bEnableEndcap;
	// MPropertyGroupName = "Endcap"
	// MPropertyFriendlyName = "Endcap Vsnd (Stop)"
	CSoundContainerReference m_endcapVsnd;
	// MPropertyGroupName = "Loopcap"
	// MPropertyFriendlyName = "Enable Loopcap"
	bool m_bEnableLoopcap;
	// MPropertyGroupName = "Loopcap"
	// MPropertyFriendlyName = "Loopcap Vsnd (Loop)"
	CSoundContainerReference m_loopcapVsnd;
	// MPropertyFriendlyName = "Volume"
	float32 m_volume;
	// MPropertyFriendlyName = "Fade Out (sec)"
	float32 m_fadeOut;
	// MPropertyFriendlyName = "Mode"
	EVsndTriggerMode m_mode;
};
