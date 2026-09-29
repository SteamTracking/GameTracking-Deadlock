enum PulseCursorCancelPriority_t : uint32_t
{
	// MPropertyFriendlyName = "Keep running normally."
	None = 0,
	// MPropertyFriendlyName = "Kill After."
	// MPropertyDescription = "Do not stop the current yielding node, but do not continue to the next node afterwards."
	CancelOnSucceeded = 1,
	// MPropertyFriendlyName = "Kill Elegantly."
	// MPropertyDescription = "Request elegant wind-down of any associated work (e.g. vcd interrupt)."
	SoftCancel = 2,
	// MPropertyFriendlyName = "Kill Immediately."
	// MPropertyDescription = "Stop without any wind-down."
	HardCancel = 3,
};
