// MHasKV3TransferPolymorphicClassname
class CPropParadeFloatVData : public CCitadel_BreakablePropVData
{
	// MPropertyStartGroup = "Parade Float Sounds"
	// MPropertyFriendlyName = "Bullet Hit Sound"
	// MPropertyDescription = "Played at the impact point when a player's bullet hits the float. Only the shooter hears it. The float takes no damage."
	CSoundEventName m_sBulletHitSound;
	// MPropertyStartGroup = "Shot Offset"
	// MPropertyFriendlyName = "Shot Offset Per Damage"
	// MPropertyDescription = "Units the float is pushed for every point of bullet damage a player's shot would have done, directly away from the shooter. Pushes from several shots add up, to at most Max Shot Offset. 0 turns the push off."
	float32 m_flShotOffsetPerDamage; // = 0.5
	// MPropertyFriendlyName = "Max Shot Offset"
	// MPropertyDescription = "Furthest, in units, shots can push the float from where it should be."
	float32 m_flMaxShotOffset; // = 40
	// MPropertyFriendlyName = "Max Shot Tilt"
	// MPropertyDescription = "Degrees the float leans away from the shooter when pushed the full Max Shot Offset. The lean follows the push, so it eases in and drifts back with it. Negative leans toward the shooter instead. 0 turns the lean off."
	float32 m_flMaxShotTilt; // = 5
	// MPropertyFriendlyName = "Shot Offset Ease In Time"
	// MPropertyDescription = "Seconds the float takes to ease out to its pushed position after being shot. It only starts drifting back once it gets there. Another shot in that time restarts it from wherever the float has got to. 0 jumps straight to the pushed position."
	float32 m_flShotOffsetEaseInTime; // = 0.15
	// MPropertyFriendlyName = "Shot Offset Half Life"
	// MPropertyDescription = "Once eased in, seconds for the push to shrink by half as the float drifts back to where it should be. 0 snaps it back on the next tick."
	float32 m_flShotOffsetHalfLife; // = 0.5
	// MPropertyStartGroup = "Movement"
	// MPropertyFriendlyName = "Spawn Angles"
	// MPropertyDescription = "World angles the float is set to when it spawns, replacing whatever it was placed or spawned with. These are its angles while travelling straight along +Y; following a zipline, its yaw turns away from them by however far the zipline turns away from +Y."
	QAngle m_angSpawnAngles;
	// MPropertyFriendlyName = "Turn Rate"
	// MPropertyDescription = "Degrees per second the float turns to face along the zipline as it bends. 0 snaps to the new direction."
	float32 m_flTurnRate; // = 30
	// MPropertyFriendlyName = "Move Speed"
	// MPropertyDescription = "Units per second the float drives forward along its facing. 0 holds it in place."
	float32 m_flMoveSpeed; // = 100
	// MPropertyFriendlyName = "Zipline Lane"
	// MPropertyDescription = "Lane number whose zipline the float's XY position follows, heading toward +Y. 4 is blue. Off the end of the zipline, or past the citadel_seasonal_thanksgiving_float_move_range convars, it teleports back to the start. 0, or a map with no zipline for the lane, drives it straight along +Y instead."
	int32 m_nZiplineLane; // = 4
	// MPropertyFriendlyName = "Height Above Zipline"
	// MPropertyDescription = "While following a zipline, how many units above it (negative for below) the float sits when it has a box. Raise Height is added on top of this. A float not following a zipline sits at the height it spawned at."
	float32 m_flHeightAboveZipline;
	// MPropertyFriendlyName = "Raise Height"
	// MPropertyDescription = "How far above its spawn height the float climbs while it has no box."
	float32 m_flRaiseHeight; // = 128
	// MPropertyFriendlyName = "Raise Speed"
	// MPropertyDescription = "Units per second the float climbs and settles between its spawn height and the raised height. 0 snaps."
	float32 m_flRaiseSpeed; // = 64
	// MPropertyFriendlyName = "Distance To End Rise"
	// MPropertyDescription = "Within this many units (along Y) of either end of the move range, the float lifts off toward Max Rise Height, so it floats up and away at the far end and comes down out of the sky at the start. Over the half of this nearest the end it also fades out, reaching invisible right at the end. 0 turns both off."
	float32 m_flDistanceToEndRise;
	// MPropertyFriendlyName = "Max Rise Height"
	// MPropertyDescription = "Extra height the float has right at either end of the move range. It eases to nothing over Distance To End Rise, and adds on top of the base height and Raise Height."
	// MPropertySuppressExpr = "m_flDistanceToEndRise <= 0"
	float32 m_flMaxRiseHeight;
	// MPropertyStartGroup = "Box"
	// MPropertyFriendlyName = "Box Fallback Z"
	// MPropertyDescription = "When the float model has no breakable_spawn_origin attachment, the box spawns this many units above the float's origin instead."
	float32 m_flBoxFallbackZ;
};
