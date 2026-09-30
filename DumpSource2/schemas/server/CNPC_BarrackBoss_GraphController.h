// MHasKV3TransferPolymorphicClassname
class CNPC_BarrackBoss_GraphController : public CAI_CitadelNPC_GraphController
{
	CAnimGraph2ParamOptionalRef< bool > b_dying;
	CAnimGraph2ParamOptionalRef< bool > b_dead;
	CAnimGraph2ParamOptionalRef< bool > b_shield_active;
};
