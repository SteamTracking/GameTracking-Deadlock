// MHasKV3TransferPolymorphicClassname
class CModifier_Baba_ThreadPull_VData : public CCitadelModifierVData
{
	// MPropertyStartGroup = "Gameplay"
	// MPropertyDescription = "Fraction of the pull distance covered (y) over normalized pull time (x)"
	CPiecewiseCurve m_PullProgressCurve;
	// MPropertyDescription = "Start the curve when movement control becomes ready (after the prediction latency window) and extend the duration by that window, so the full displacement is always applied over the authored duration"
	bool m_bCompensatePredictionDelay;
	// MPropertyDescription = "Fraction of the target's horizontal velocity from when the pull landed that is handed back to them when the pull ends"
	float32 m_flExitVelocityScale;
};
