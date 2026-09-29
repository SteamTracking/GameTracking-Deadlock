enum FuncRotatorRotationSummaryFlags_t : uint32_t
{
	// MEnumeratorIsNotAFlag
	eNone = 0,
	eRotateBegin = 1,
	eEventsDispatched = 2,
	eRotateCompleted = 4,
	eOscillateStart = 8,
	eOscillateEnd = 16,
	eOscillateArrived = 32,
	eOscillateDepart = 64,
};
