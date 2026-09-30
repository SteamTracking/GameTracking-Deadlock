// MModelGameData
// MFgdHelper = "game_data_list{ key = 'CitadelTeamRelativeParticleSettings_t' }"
// MPropertyFriendlyName = "Citadel Team Relative Particle Settings"
class CitadelTeamRelativeParticleSettings_t
{
	CStrongHandle< InfoForResourceTypeIParticleSystemDefinition > m_strFriendlyParticle;
	CStrongHandle< InfoForResourceTypeIParticleSystemDefinition > m_strEnemyParticle;
	bool m_bUseConfig; // = true
	// MPropertySuppressExpr = "!m_bUseConfig"
	CUtlString m_strConfigName; // = "preview"
	// MPropertySuppressExpr = "m_bUseConfig"
	ParticleAttachment_t m_AttachmentType; // = "PATTACH_INVALID"
	// MPropertySuppressExpr = "m_bUseConfig || ( m_AttachmentType != PATTACH_POINT && m_AttachmentType != PATTACH_POINT_FOLLOW )"
	// MPropertyCustomFGDType = "model_attachment"
	CUtlString m_strAttachmentName;
};
