// MHasKV3TransferPolymorphicClassname
class CCitadel_Ability_Artist_PullBrushVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Gameplay"
	EAbilitySlots_t m_eLeaderAbilitySlot; // = "ESlot_Signature_First"
	bool m_bLockInitialCastPosition;
	float32 m_flSpacingBetweenBlockers; // = 20
	float32 m_flAdditionalTraceDistance; // = 100
	float32 m_flTraceSurfaceOffset; // = 20
	float32 m_flDragSpringStrength; // = 100
	float32 m_flDragDamp; // = 2
	float32 m_flDrawingLingerTime; // = 0.1
	bool m_bShowDesatVolume;
	float32 m_flBlockerExtent; // = 30
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CCitadelModifier > m_CollisionModifier;
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DragParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_StrokeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_BlockerModel;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strStrokeSound;
	CSoundEventName m_strPaintingLoopSound;
};
