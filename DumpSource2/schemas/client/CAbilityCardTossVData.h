// MHasKV3TransferPolymorphicClassname
class CAbilityCardTossVData : public CitadelAbilityVData
{
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ExplodeParticle;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SummonedCard;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_ClubCardTrail;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_DiamondCardTrail;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_HeartCardTrail;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpadeCardTrail;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JokerCardTrail;
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCardSummonSound;
	CSoundEventName m_strCardCastSound;
	// MPropertyStartGroup = "Modifiers"
	CEmbeddedSubclass< CBaseModifier > m_ClubModifier;
	CEmbeddedSubclass< CBaseModifier > m_DiamondModifier;
	// MPropertyStartGroup = "+Card Toss Properties"
	float32 m_flSummonedCardStartSideOffset;
	float32 m_flSummonedCardSideOffsetStep; // = 20
	float32 m_flSummonedCardForwardOffset; // = 20
	float32 m_flSummonedCardVerticalOffset; // = 50
	// MPropertyStartGroup = "Gameplay"
	float32 m_flSpadeWeight; // = 2
	float32 m_flClubWeight; // = 2
	float32 m_flHeartWeight; // = 2
	float32 m_flDiamondWeight; // = 2
	float32 m_flJokerWeight; // = 1
	float32 m_flImprovedJokerWeight; // = 2
	Vector m_vDefaultCardColor; // = [ 0.6, 0.5, 1 ]
	Vector m_vNextCardColor; // = [ 1, 0.9, 1 ]
	// MPropertyStartGroup = "AnimGraph2"
	CGlobalSymbol m_strNewCardActionName;
};
