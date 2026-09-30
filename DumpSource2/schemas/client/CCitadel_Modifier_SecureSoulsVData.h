// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SecureSoulsVData : public CCitadelModifierVData
{
	float32 m_flTickRate; // = 1
	float32 m_flMinConversionDuration; // = 3
	float32 m_flMaxConversionDuration; // = 6
	float32 m_flSoulsForMinConversionDuration; // = 400
	float32 m_flSoulsForMaxConversionDuration; // = 2000
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strGoldTickSound;
	CSoundEventName m_strGoldFinishSound;
};
