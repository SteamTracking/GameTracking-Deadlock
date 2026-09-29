enum PulseCursorWakePriority_t : uint32_t
{
	// MPropertyFriendlyName = "Proceed Elegantly."
	// MPropertyDescription = "Request elegant wind-down of any associated work (e.g. vcd interrupt), then proceed afterwards."
	WakeElegantly = 0,
	// MPropertyFriendlyName = "Proceed Immediately."
	// MPropertyDescription = "Stop the node action without any wind-down, then proceed afterwards."
	WakeImmediate = 1,
};
