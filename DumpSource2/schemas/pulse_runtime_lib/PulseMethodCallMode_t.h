enum PulseMethodCallMode_t : uint32_t
{
	// MPropertyFriendlyName = "Wait For Completion"
	// MPropertyDescription = "Synchronous - Wait for this node to fully complete before proceeding."
	SYNC_WAIT_FOR_COMPLETION = 0,
	// MPropertyFriendlyName = "Proceed Immediately"
	// MPropertyDescription = "Asynchronous - This node executes independently using a new Cursor. Formerly 'Fire and Forget'. Equivalent to scheduling using an additional 'Fire Child Cursors' node."
	ASYNC_FIRE_AND_FORGET = 1,
};
