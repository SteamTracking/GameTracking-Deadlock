class CRelativeLocation
{
	RelativeLocationType_t m_Type; // = "WORLD_SPACE_POSITION"
	Vector m_vRelativeOffset; // = [ 340282346638528859811704183484516925440, 340282346638528859811704183484516925440, 340282346638528859811704183484516925440 ]
	VectorWS m_vWorldSpacePos;
	CHandle< CBaseEntity > m_hEntity;
	uint32 m_nLastKnownNavAreaVersion;
	uint32 m_nNavAreaID; // = 4294967295
	uint32 m_nNavBlockID; // = 4294967295
};
