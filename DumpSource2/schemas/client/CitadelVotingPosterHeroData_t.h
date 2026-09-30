class CitadelVotingPosterHeroData_t
{
	HeroID_t m_HeroID;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCTextureBase > > m_strPosterImage;
	CResourceNameTyped< CWeakHandle< InfoForResourceTypeCTextureBase > > m_strPosterImageDamaged;
	CPanoramaImageName m_strPosterImageThumbnail;
	CSoundEventName m_strDamagedSound; // = "Cosmetics.HeroPoster.Destroy"
};
