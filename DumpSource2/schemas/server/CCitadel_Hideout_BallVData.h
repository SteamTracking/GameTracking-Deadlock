// MHasKV3TransferPolymorphicClassname
class CCitadel_Hideout_BallVData : public CEntitySubclassVDataBase
{
	float32 m_flModelScale; // = 3
	// MPropertyDescription = "A bit of grace distance ontop of the player's capsule vs the ball radius, to make contact a little easier"
	float32 m_flBallTouchRadius; // = 7
	float32 m_flForceMult; // = 10
	float32 m_flForceMultBullet; // = 50
	float32 m_flMaxDistanceAway; // = 3000
	float32 m_flDamagePositionOffset; // = 32
	CSoundEventName m_strKickSoundName;
	CSoundEventName m_strGoalSoundName;
	// MPropertyStartGroup = "Ball Touch Force"
	// MPropertyDescription = "Always kick at least this much in the direction the player is facing."
	float32 m_flMinPlayerBallTouchForce; // = 10
	// MPropertyStartGroup = "Ball Light Melee Forces"
	// MPropertyDescription = "Same as above but when meleeing"
	float32 m_flMinPlayerLightMeleeForce; // = 20
	// MPropertyDescription = "Degrees pitch to launch the ball up"
	float32 m_flPlayerLightMeleeChipAngle; // = 75
	// MPropertyDescription = "Same as above but when heavy meleeing. Note you're at zero speed when delivering melee so this must be higher than you'd think"
	float32 m_flMinPlayerHeavyMeleeForce; // = 100
	// MPropertyDescription = "The player's speed in the direciton they are headed is multiplied by this."
	float32 m_flForceMultPlayer; // = 2
	// MPropertyDescription = "Proportion of player's speed inherited directly from the player."
	float32 m_flInheritPlayerSpeedMultiplier; // = 0.125
	// MPropertyDescription = "When > 0, then damage applies more physics impulses based on positions."
	float32 m_flVPhysicsForceMul;
	// MPropertyDescription = "Looking at your feet vs looking at the horizon creates a multiplier to the kick - aim up to lob/shoot, aim down to dribble."
	CPiecewiseCurve m_ForceVSCameraPitch;
	// MPropertyStartGroup = "Misc Juggle Minigame"
	// MPropertyDescription = "Keep the player on their feet by adding more of a degree of randomness the more the juggle count goes up."
	CPiecewiseCurve m_ConsecutiveJugglesVsRandomness;
	// MPropertyDescription = "The more difficult we get, the higher the gravity. So if this is 0.25, gravity multiplier will be  1 + 1.5"
	float32 fl_MaxExtraGravityScale; // = 0.5
	// MPropertyDescription = "Don't show any effects at the apex of a juggled ball if it's less juggles than this"
	int32 m_nMinJugglesBeforeDisplay; // = 3
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_BallApexParticle;
	// MPropertyDescription = "Play a sound each time we reach an apex above the Min Juggles Befor eDisplay value"
	CSoundEventName m_strBallApexSound;
	// MPropertyDescription = "Plays when the juggle run ends (the ball touches a ground surface). This is not the same as contact sounds. It's a gameplay event"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_JuggleRunEnded;
	CSoundEventName m_strJuggleRunEnded;
	// MPropertyStartGroup = "Visuals"
	// MPropertyDescription = "Model"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCModel > > m_hModel;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_AmbientParticle;
};
