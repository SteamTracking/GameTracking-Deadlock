// MGetKV3ClassDefaults = {
//	"m_panningControlInputName": "random_pan",
//	"m_volumeControlInputName": "random_volume",
//	"m_flMinVolume": -12.000000,
//	"m_flMaxVolume": 0.000000,
//	"m_strVectorStackParam": "ListenerForwardVector"
//}
// MPropertyFriendlyName = "Random Panner Control"
// MPropertyDescription = "Sets a control input every time it's instantiated"
class CRandomPannerControls
{
	// MPropertyFriendlyName = "Panning Control Input Name"
	CUtlString m_panningControlInputName;
	// MPropertyFriendlyName = "Volume Control Input Name"
	CUtlString m_volumeControlInputName;
	// MPropertyFriendlyName = "Minimum Random Volume DB"
	float32 m_flMinVolume;
	// MPropertyFriendlyName = "Maximum Random Volume DB"
	float32 m_flMaxVolume;
	// MPropertyFriendlyName = "Forward Vector Stack Parameter Name"
	CUtlString m_strVectorStackParam;
};
