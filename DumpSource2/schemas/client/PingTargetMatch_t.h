class PingTargetMatch_t
{
	// MPropertyDescription = "Entity classes this row describes. Listing several lets one row cover a family, i.e. all the boss tiers."
	CUtlVector< Class_T > m_vecEntityClasses;
	// MPropertyDescription = "Optional. Narrow to the pinging player's own hero, or to anyone but them. Scored above allegiance, so a self row wins over the friendly row that also matches."
	EPingSubjectSelf_t m_eSubjectIsSelf; // = "k_ePingSubjectSelf_Any"
	// MPropertyDescription = "Optional. Narrow to these entity classnames, for classes that split by classname. Leave empty for any."
	CUtlVector< CUtlString > m_vecEntityClassnames;
	// MPropertyDescription = "Optional. Narrow to friendly/enemy/neutral relative to the pinging player."
	EPingTargetAllegiance_t m_eAllegiance; // = "k_ePingTargetAllegiance_Any"
	// MPropertyDescription = "Optional. Narrow to a subject carrying the urn, or not. Scored above classname, so a carrier row wins over the plain hero row. Unknown through fog of war."
	EPingTristate_t m_eSubjectHoldingUrn; // = "k_ePingTristate_Any"
};
