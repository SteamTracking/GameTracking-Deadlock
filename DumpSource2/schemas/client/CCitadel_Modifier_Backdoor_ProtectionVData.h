// MHasKV3TransferPolymorphicClassname
class CCitadel_Modifier_Backdoor_ProtectionVData : public CCitadelModifierVData
{
	// MPropertyDescription = "How long this modifier must be alive before backdoor protection is activated"
	float32 m_flActivationTime; // = 14
	// MPropertyDescription = "How much should damage be reduced from players when backdoor protection is up? 0 is no reduction, 100 is complete reduction"
	// MPropertyAttributeRange = "0 100"
	float32 m_flBackdoorProtectionDamageMitigationFromPlayers; // = 65
	float32 m_flBackdoorProtectionDamageMitigationFromPlayers_Streetbrawl; // = 85
	// MPropertyDescription = "How health per second does backdoor protection regen?"
	float32 m_flHealthPerSecondRegen; // = 65
	// MPropertyDescription = "How health per second when out of combat?"
	float32 m_flOutOfCombatHealthRegen;
	// MPropertyDescription = "How longer after taking no damage will out out of combat regen kick in?"
	float32 m_flOutOfCombatRegenDelay;
	// MPropertyDescription = "How long the shield effect lingers after having taken damage"
	float32 m_flEffectsLingerTime; // = 2
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldImpactParticle; // = "particles/generic/backdoor_protection_impact.vpcf"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ShieldActiveParticle; // = "particles/generic/backdoor_protection_aura.vpcf"
	CUtlString m_strActiveEffectConfigName; // = "tier1"
	float32 flShieldImpactDirectionOffset; // = 10
};
