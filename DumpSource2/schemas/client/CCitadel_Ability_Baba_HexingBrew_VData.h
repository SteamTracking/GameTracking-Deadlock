// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Baba_HexingBrew_VData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Effect Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_NoneModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FireModifier;
	CEmbeddedSubclass< CCitadelModifier > m_BarrierModifier;
	CEmbeddedSubclass< CCitadelModifier > m_SilenceModifier;
	CEmbeddedSubclass< CCitadelModifier > m_FailModifier;
	// MPropertyStartGroup = "Holding Modifier"
	// MPropertyDescription = "On her while she carries the flask. Its HUD bar shows the brewing timeline"
	CEmbeddedSubclass< CCitadelModifier > m_HoldingModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DetonateFireParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DetonateBarrierParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DetonateSilenceParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_FuseParticle;
	Color m_FuseNoColor;
	Color m_FuseFireColor; // = [ 220, 50, 50 ]
	Color m_FuseBarrierColor; // = [ 70, 100, 150 ]
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strBrewLockSound;
	CSoundEventName m_strBrewUnlockSound;
	CSoundEventName m_DetonateSound;
	CSoundEventName m_strBrewChangeDefaultSound;
	CSoundEventName m_strBrewChangeBarrierSound;
	CSoundEventName m_strBrewChangeFireSound;
	CSoundEventName m_strBrewChangeSilenceSound;
	CSoundEventName m_strBarrierAppliedSound;
	CSoundEventName m_strBurnAppliedSound;
	CSoundEventName m_strSilenceAppliedSound;
};
