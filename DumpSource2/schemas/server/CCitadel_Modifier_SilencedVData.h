// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_SilencedVData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EmpParticle; // = "particles/modifiers/silenced_debuff.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EmpPlayerParticle; // = "particles/modifiers/silenced_player_debuff.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_EmpStatusParticle; // = "particles/status_fx/status_fx_silenced.vpcf"
};
