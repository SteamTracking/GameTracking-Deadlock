class ItemDraftBucketing_t
{
	CUtlString m_strBucketName;
	CUtlOrderedMap< CUtlString, float32 > m_mapBuckets;
	// MPropertyDescription = "Items of this tier without an explicit bucket go in "Good" if their best popular item pick percentage across game phases is at least this"
	float32 m_flGoodItemPickRateThreshold; // = 100
};
