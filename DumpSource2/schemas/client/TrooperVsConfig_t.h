class TrooperVsConfig_t
{
	// MPropertyDescription = "DPS dealt to enemy at the start of the match. Leave the value as 0 to use Beam Weapon values."
	float32 m_flBaseDPS;
	// MPropertyDescription = "DPS dealt to enemy at "End DPS Time in Seconds". Moments in between start and end will be lerped DPS."
	float32 m_flEndDPS;
	// MPropertyDescription = "Time when DPS dealt to enemy reaches "End DPS". Leave the value as 0 to stay at "Start DPS" all match."
	float32 m_flEndDPSTimeInSeconds;
	// MPropertyDescription = "Limit engagement range of Trooper vs Enemy. Final result will be the minimum of "Max Range", "Sight Range NPCs" and "Weapon Infos : (primary or Boss Weapon Name) : Firing Behavior : Range". Leave at 0 to not apply."
	float32 m_flMaxRange;
	// MPropertyDescription = "Percent of damage resisted when attacked by Enemy."
	float32 m_flDamageResist;
};
