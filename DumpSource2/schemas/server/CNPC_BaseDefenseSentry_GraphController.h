// MHasKV3TransferPolymorphicClassname
class CNPC_BaseDefenseSentry_GraphController : public CNPC_SimpleAnimatingAI_GraphController
{
	CAnimGraphParamRef< float32 > m_flPanel1;
	CAnimGraphParamRef< bool > m_bUnpackInstant;
	CAnimGraphParamRef< float32 > m_flVelocity;
	CAnimGraphParamRef< bool > m_bAlert;
};
