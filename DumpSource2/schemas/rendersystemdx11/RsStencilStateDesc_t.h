class RsStencilStateDesc_t
{
	bitfield:4 m_frontStencilFunc;
	bitfield:4 m_backStencilFunc;
	bitfield:1 m_bStencilEnable;
	bitfield:3 m_frontStencilFailOp;
	bitfield:3 m_frontStencilDepthFailOp;
	bitfield:3 m_frontStencilPassOp;
	bitfield:3 m_backStencilFailOp;
	bitfield:3 m_backStencilDepthFailOp;
	bitfield:3 m_backStencilPassOp;
	uint8 m_nStencilReadMask;
	uint8 m_nStencilWriteMask;
};
