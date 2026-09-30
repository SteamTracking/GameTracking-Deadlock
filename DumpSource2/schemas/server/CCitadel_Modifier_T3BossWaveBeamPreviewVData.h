// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_T3BossWaveBeamPreviewVData : public CCitadelModifierVData
{
	// MPropertyGroupName = "Visuals"
	CUtlString m_strBeamStartAttachmentPoint_L;
	CUtlString m_strBeamStartAttachmentPoint_R;
	float32 m_flShrineChargeOffset; // = 200
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmberBeamPreviewEffect;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SapphBeamPreviewEffect;
};
