// MHasKV3TransferPolymorphicClassname
class CBaseTriggerAbilityVData : public CitadelAbilityVData
{
	// MPropertyDescription = "Which ability to fire a MODIFIER_EVENT_ABILITY_TRIGGER_ACTIVATED event to when this ability is triggered"
	CSubclassName< 4 > m_AbilityToTrigger;
	// MPropertyDescription = "The mimumum amount of time after this ability has become active before the trigger can activate"
	float32 m_flMinCancelTime;
	// MPropertyDescription = "Which lesson to associate with activating this ability"
	ECitadelHintFeature m_eHintFeatureToMarkUsedOnTrigger; // = "CITADEL_HINT_FEATURE_INVALID"
	// MPropertyDescription = "Trigger on deselect?"
	bool bTriggerOnDeselect; // = true
};
