// MVDataRoot
class PingWheelMessage_t
{
	// MPropertySuppressField
	CUtlVector< PingWheelOptionID_t > m_vecSubnavMessageIDs;
	// MPropertyDescription = "unique integer ID of this ping wheel message"
	// MVDataUniqueMonotonicInt = "_editor/next_ping_wheel_id"
	// MPropertyAttributeEditor = "locked_int()"
	// MPropertySuppressField
	PingWheelOptionID_t m_unPingWheelOptionID;
	// MPropertyDescription = "Concept for your ping message. These are populated in citadel_ping_wheel_data.h"
	CitadelPingWheelConcept_t m_ePingConcept; // = "CITADEL_PING_CONCEPT_NONE"
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "How do you want the ping to behave?"
	ChatMsgPingMarkerInfo m_ePingMarkerInfo; // = "k_EPingMarkerInfo_HideMarkerAndSound"
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "Which recipients do you want this ping message sent to?"
	ECitadelPingMessageRecipients_t m_eRecipientsType; // = "k_ECitadelRecipients_GlobalFriendlyTeam"
	// MPropertySuppressExpr = "m_ePingConcept != CITADEL_PING_HEADING_TO_LANE && m_ePingConcept != CITADEL_PING_PUSH_LANE && m_ePingConcept != CITADEL_PING_DEFEND_LANE && m_ePingConcept != CITADEL_PING_PUSH_GUARDIAN && m_ePingConcept != CITADEL_PING_DEFEND_GUARDIAN && m_ePingConcept != CITADEL_PING_GUARDIAN_NEEDS_HELP && m_ePingConcept != CITADEL_PING_PUSH_WALKER && m_ePingConcept != CITADEL_PING_DEFEND_WALKER && m_ePingConcept != CITADEL_PING_PUSH_BASE_GUARDIAN && m_ePingConcept != CITADEL_PING_DEFEND_BASE_GUARDIAN"
	// MPropertyDescription = "Lane Color for certain pings that require a line color."
	CMsgLaneColor m_eLaneColor; // = "k_ELaneColor_Invalid"
	// MPropertyDescription = "This is the shortform label on the comms wheel."
	CUtlString m_strCommsWheelLabelToken;
	// MPropertyDescription = "This is the Loc String that shows in the chat area when you use this Ping Option."
	CUtlString m_strMessageToken;
	// MPropertyDescription = "This points to the label in the dropdown menus. If it is not defined, the dropdown label uses m_strMessageToken. Needed because some m_strMessageToken have dialog variables that aren't defined until they're used."
	CUtlString m_strDropDownLabelToken;
	// MPropertyDescription = "Optional. Used instead of the message token when the ping's subject is the pinging player, so a self-ping can read "My Ultimate is ready" rather than naming the speaker in the third person."
	CUtlString m_strSelfMessageToken;
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "Sound that Plays when you use this Ping Option"
	CUtlString m_strSound;
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "Icon that displays on the Ping Wheel. Leave empty to use the generic ping icon"
	CUtlString m_strIcon;
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "What type of sound should this Ping Option play when used?"
	ECitadelPingWheelSound_t m_ePingWheelSoundType; // = "CITADEL_PING_WHEEL_SOUND_NONE"
	// MPropertyDescription = "Is this a subnav of another message? i.e. Heading to Yellow is a subnav of Heading to Lane..."
	bool m_bIsSubnavMessage;
	// MPropertyDescription = "The Default value 30 is usually good but if the text on the Ping Wheel isn't centered vertically, you should adjust this value."
	float32 m_flPhraseTopMarginOffset; // = 30
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true || m_eSliceType == CITADEL_PING_WHEEL_ONE_SLICE || m_eSliceType == CITADEL_PING_WHEEL_TWO_SLICE"
	// MPropertyCustomFGDType = "vdata_choice:scripts/ping_wheel_messages.vdata"
	// MPropertyDescription = "Is this a parent message that has subnav messages? i.e. Heading to Lane has subnav messages Heading to Yellow, Heading to Blue, etc."
	CUtlVector< CUtlString > m_vecSubnavMessageNames;
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "Do the subnavs name a row of places, left to right? Lane sets do. The radial then reverses them on the bottom half of the wheel, so they still read left to right on screen. East and west keep the clockwise order, since neither is more left than the other."
	bool m_bSubnavsReadLeftToRight;
	// MPropertySuppressExpr = "m_bIsSubnavMessage == true"
	// MPropertyDescription = "Is this message a response to other concepts? i.e. Yes, No, and On My Way are all responses to other messages. This message will appear in the Contextual Ping Wheel Slot if one of these concepts is used by another player."
	CUtlVector< CitadelPingWheelConcept_t > m_vecRespondsToConcepts;
	// MPropertyDescription = "Can players put this message in a comms wheel slot?"
	bool m_bCommsWheelBindable;
	// MPropertyDescription = "Can players bind this message to a quick ping key?"
	bool m_bKeybindable;
	// MPropertyDescription = "Chat text messages that trigger the concept associated with this message"
	CUtlVector< CUtlString > m_vecChatTextTriggers;
};
