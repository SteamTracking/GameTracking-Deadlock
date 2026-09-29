// MGetKV3ClassDefaults = {
//	"_class": "EventActionDefinition_t",
//	"unMinActionID": 0,
//	"unMaxActionID": 0,
//	"unMaxGrantsIfOwned": 1,
//	"unMaxGrantsIfUnowned": 0,
//	"unAvailableAtEventLevel": 0,
//	"unAvailableAtEventLevelRepeatInterval": 0,
//	"unPointCost": 0,
//	"unPremiumPointCost": 0,
//	"unImportant": 0,
//	"strFriendsLeaderboard": "",
//	"m_vecAnyOfRequiredItemDefs":
//	[
//	],
//	"vecScoreRewards":
//	[
//	],
//	"vecPrerequisiteActions":
//	[
//	],
//	"bClaimableIfPrerequisitesSatisfied": false,
//	"bClaimableUpToEventLevel": false,
//	"bAlwaysClaimable": false,
//	"bNeverClaimable": false,
//	"bClaimableWithoutGrant": false,
//	"bIsRemovable": false,
//	"bClaimableOnExpiredEvents": false
//}
// MHasKV3TransferPolymorphicClassname
class EventActionDefinition_t
{
	uint32 unMinActionID;
	uint32 unMaxActionID;
	uint32 unMaxGrantsIfOwned;
	uint32 unMaxGrantsIfUnowned;
	uint32 unAvailableAtEventLevel;
	uint32 unAvailableAtEventLevelRepeatInterval;
	uint32 unPointCost;
	uint32 unPremiumPointCost;
	uint32 unImportant;
	CUtlString strFriendsLeaderboard;
	CUtlVector< item_definition_index_t > m_vecAnyOfRequiredItemDefs;
	CUtlVector< EventActionScoreDefinition_t > vecScoreRewards;
	CUtlVector< EventActionPrerequisite_t > vecPrerequisiteActions;
	bitfield:1 bClaimableIfPrerequisitesSatisfied;
	bitfield:1 bClaimableUpToEventLevel;
	bitfield:1 bAlwaysClaimable;
	bitfield:1 bNeverClaimable;
	bitfield:1 bClaimableWithoutGrant;
	bitfield:1 bIsRemovable;
	bitfield:1 bClaimableOnExpiredEvents;
};
