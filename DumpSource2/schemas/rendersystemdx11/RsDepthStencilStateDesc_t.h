class RsDepthStencilStateDesc_t
{
	bitfield:1 m_bDepthTestEnable;
	bitfield:1 m_bDepthWriteEnable;
	bitfield:4 m_depthFunc;
	RsStencilStateDesc_t m_stencilState;
};
