// MHasKV3TransferPolymorphicClassname
class CCitadel_BreakableProp_ParadeFloatBoxVData : public CCitadel_BreakablePropVData
{
	// MPropertyStartGroup = "Dropped Item"
	// MPropertyFriendlyName = "Dropped Item Min Speed"
	// MPropertyDescription = "Min horizontal speed, in units per second, a dropped item is tossed off the box with."
	float32 m_flDroppedItemMinSpeed; // = 10
	// MPropertyFriendlyName = "Dropped Item Max Speed"
	// MPropertyDescription = "Max horizontal speed, in units per second, a dropped item is tossed off the box with."
	float32 m_flDroppedItemMaxSpeed; // = 200
	// MPropertyFriendlyName = "Dropped Item Min Up Speed"
	// MPropertyDescription = "Min upward speed, in units per second, a dropped item is tossed off the box with."
	float32 m_flDroppedItemMinUpSpeed; // = 100
	// MPropertyFriendlyName = "Dropped Item Max Up Speed"
	// MPropertyDescription = "Max upward speed, in units per second, a dropped item is tossed off the box with. Anything below the min is treated as the min."
	float32 m_flDroppedItemMaxUpSpeed; // = 100
	// MPropertyStartGroup = "Sway"
	// MPropertyFriendlyName = "Sway Angle"
	// MPropertyDescription = "Most the box tips, in degrees, as it sways under its float. Pitch and roll each swing this far. 0 turns the sway off."
	float32 m_flSwayAngle; // = 4
	// MPropertyFriendlyName = "Sway Period"
	// MPropertyDescription = "Roughly how many seconds one swing back and forth takes. Each box varies this a little and starts at a random point in its swing, so no two sway together."
	// MPropertySuppressExpr = "m_flSwayAngle <= 0"
	float32 m_flSwayPeriod; // = 4
	// MPropertyStartGroup = "Ropes"
	// MPropertyFriendlyName = "Rope Particle"
	// MPropertyDescription = "Cable drawn from each of the float's rope attachments (rope0, rope1, rope2) down to the box. Control points 0 and 1 are the two ends, control point 2's x is the cable radius. Empty for no ropes."
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeIParticleSystemDefinition > > m_RopeParticle;
	// MPropertyFriendlyName = "Rope Radius"
	// MPropertyDescription = "Radius of each cable, passed to the rope particle as control point 2's x."
	float32 m_flRopeRadius; // = 10
	// MPropertyStartGroup = "Extra Drops"
	// MPropertyFriendlyName = "Drop 2 Chance"
	// MPropertyDescription = "Chance, 0 - 100%, that a broken box drops 2 items instead of 1. Rolled together with Drop 3 Chance as one roll; whatever is left of 100 is the chance of the usual single item. What each extra item is comes from the Extra Drop chances below, not from Rewards."
	float32 m_flDropTwoChance; // = 30
	// MPropertyFriendlyName = "Drop 3 Chance"
	// MPropertyDescription = "Chance, 0 - 100%, that a broken box drops 3 items instead of 1."
	float32 m_flDropThreeChance; // = 15
	// MPropertyFriendlyName = "Extra Drop Turkey Chance"
	// MPropertyDescription = "Chance, 0 - 100%, that an extra item is a turkey. Rolled together with Extra Drop Powerup Chance as one roll per extra item; whatever is left of 100 is the chance of a small gold pickup."
	float32 m_flExtraDropTurkeyChance; // = 20
	// MPropertyFriendlyName = "Extra Drop Powerup Chance"
	// MPropertyDescription = "Chance, 0 - 100%, that an extra item is a powerup, picked by the powerup spawner the way powerup breakables pick theirs. If it has none to give, the item is a small gold pickup instead."
	float32 m_flExtraDropPowerupChance; // = 20
};
