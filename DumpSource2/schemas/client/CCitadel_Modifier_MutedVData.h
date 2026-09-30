// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_MutedVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MutedParticle; // = "particles/modifiers/muted_debuff.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MutedPlayerParticle; // = "particles/modifiers/muted_player_debuff.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_MutedStatusParticle; // = "particles/status_fx/status_fx_silenced.vpcf"
};
