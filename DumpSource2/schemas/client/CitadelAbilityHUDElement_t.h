// MPropertyArrayElementNameKey = "m_strContext"
class CitadelAbilityHUDElement_t
{
	ECitadelAbilityHUDElementType_t m_eType; // = "CITADEL_ABILITY_HUD_ELEMENT_TYPE_GUN"
	CUtlString m_strContext;
	// MPropertyDescription = "Space separated set of classes to add to the panel (ex: "medium superCool noMiddle""
	CUtlString m_strAdditionalClasses;
	// MPropertyCustomFGDType = "panorama_layout"
	// MPropertySuppressExpr = "m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_PROGRESS"
	CUtlString m_Layout;
	// MPropertySuppressExpr = "m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_PROGRESS && m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_LOCK_ON"
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCPanoramaStyle > > m_Style;
	// MPropertySuppressExpr = "m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_PROGRESS"
	bool m_bReverseProgress;
	// MPropertySuppressExpr = "m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_PROGRESS"
	bool m_bShowStacksOnProgress;
	// MPropertyDescription = "Optional [start, end] degrees, clockwise from 12 o'clock, for each lock-on stack's ring segment"
	// MPropertySuppressExpr = "m_eType != CITADEL_ABILITY_HUD_ELEMENT_TYPE_LOCK_ON"
	CUtlVector< Vector2D > m_vecLockOnSegmentArcs;
};
