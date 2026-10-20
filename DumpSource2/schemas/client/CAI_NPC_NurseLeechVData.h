// MHasKV3TransferPolymorphicClassname
class CAI_NPC_NurseLeechVData : public CAI_CitadelNPCVData
{
	// MPropertyStartGroup = "Leech"
	// MPropertyDescription = "Upward speed the leech is thrown with when it lets go of its victim"
	CRangeFloat m_flDropUpSpeed; // = [ 30, 110 ]
	// MPropertyDescription = "Horizontal speed the leech is thrown with when it lets go of its victim"
	CRangeFloat m_flDropOutSpeed; // = [ 20, 60 ]
	// MPropertyDescription = "Vertical speed the leech is thrown with when it pops out of the Leech Therapy jar"
	CRangeFloat m_flJarLaunchUpSpeed; // = [ 150, 250 ]
	// MPropertyDescription = "How close the leech has to get to Nurse before she absorbs it"
	float32 m_flCollectRadius; // = 150
	// MPropertyDescription = "Nurse has to come within this range for a grounded leech to start crawling toward her; it settles again once she is past 1.5x this"
	float32 m_flCrawlRadius; // = 750
	// MPropertyDescription = "Time for one crawl cycle, looped while crawling. 0 = constant LeechMoveSpeed"
	float32 m_flCrawlCycleDuration;
	// MPropertyDescription = "Speed over one looping crawl cycle. X = cycle progress [0,1], Y = fraction of LeechMoveSpeed"
	CPiecewiseCurve m_CrawlCycleCurve;
	float32 m_flModelScaleAttachedStart; // = 0.5
	float32 m_flModelScaleAttachedEnd; // = 6.4
	// MPropertyDescription = "Model scale for leeches fresh out of the jar, waiting on the ground for an enemy"
	float32 m_flModelScaleHunting; // = 1.5
	// MPropertyDescription = "Render tint for leeches fresh out of the jar, to read as less saturated than fed ones"
	Color m_HuntingRenderColor; // = [ 116, 127, 140 ]
	float32 m_flMinScaleDuration;
	float32 m_flMaxScaleDuration; // = 7
	// MPropertyStartGroup = "Visuals"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_CollectParticle;
	// MPropertyDescription = "Rides the leech from the moment it spawns until it is removed"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_SpawnParticle;
	// MPropertyDescription = "Replaces the spawn particle once the leech lets go of its victim and is waiting to be picked up"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_PickupIndicatorParticle;
	// MPropertyDescription = "Slime trail everyone sees while the leech is on the ground, hunting or crawling back to Nurse"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_TrailParticle;
	// MPropertyDescription = "Trail radius for leeches crawling back to Nurse, sent to the trail particle as CP3.x"
	float32 m_flTrailRadius; // = 10
	// MPropertyDescription = "Trail radius for hunting leeches out of the jar, sent to the trail particle as CP3.x"
	float32 m_flTrailRadiusHunting; // = 6
	// MPropertyFriendlyName = "VMDL Attachment to Vacuum to"
	CUtlString m_sVacuumAttachmentTarget; // = "ability_apply"
	// MPropertyStartGroup = "Sounds"
	CSoundEventName m_strCollectSound;
	CSoundEventName m_strVacuumStartSound;
	CSoundEventName m_strMovementStartSound;
	CSoundEventName m_strMovementLoopSound;
};
