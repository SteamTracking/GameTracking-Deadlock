enum EDragPullModel : uint8_t
{
	// MPropertyDescription = "Inherit the source's velocity and add a chase term proportional to how far behind we are, clamped so it can't overshoot the hold point."
	EDragPull_SourceVelocityPlusDistance = 0,
	// MPropertyDescription = "Head straight at the hold point at the source's speed plus a distance term.  Unlike the above the victim doesn't inherit the source's direction, so it cuts corners rather than trailing."
	EDragPull_CombinedSpeedTowardsHold = 1,
	// MPropertyDescription = "Spring: velocity is the gap to the hold point times the damping factor, never slower than the source itself."
	EDragPull_SpringDamped = 2,
};
