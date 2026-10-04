//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Sort something on the GPU.";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: cs
}

MODES
{
	Default();
}

FEATURES
{
}

COMMON
{
	#include "system.fxc"
}

CS
{
	DynamicCombo( D_PASS, 0..4 );
	DynamicCombo( D_16_BIT_KEYS, 0..1 );
	DynamicCombo( D_SORT_PAIRS, 0..1 );
	DynamicComboRule( Requires( D_16_BIT_KEYS, D_PASS==1 ) );
	DynamicComboRule( Requires( D_SORT_PAIRS, D_PASS==3 ) );
	
	RWStructuredBuffer b_alt < Attribute("AltSortBuffer"); >;
	RWStructuredBuffer b_altPayload < Attribute("AltPayloadBuffer"); >;
	RWStructuredBuffer b_globalHist < Attribute("GlobalHistBuffer"); >;
	RWStructuredBuffer b_index < Attribute("PassIndexBuffer"); >;
	RWStructuredBuffer b_passHist < Attribute("PassHistBuffer"); >;
	RWStructuredBuffer b_sort < Attribute("SortBuffer"); >;
	RWStructuredBuffer b_sortPayload < Attribute("PayloadBuffer"); >;
	StructuredBuffer g_constantBuffer < Attribute("DispatchArgBuffer"); >;
	RWStructuredBuffer g_dispatchBuffer < Attribute("DispatchArgBuffer"); >;
	int g_nFixedKeyCount < Attribute("FixedKeyCount"); UiType(Slider); >;
	int g_nKeyCountBufferOffset < Attribute("NumKeysIndex"); UiType(Slider); >;
	int g_nPartitionSize < Attribute("PartitionSize"); UiType(Slider); >;
	int g_nRadixPasses < Attribute("RadixPasses"); UiType(Slider); >;
	RWStructuredBuffer g_numKeysBuffer < Attribute("NumKeysBuffer"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct OneSweepSortConstants_t_natural_logical
	{
	    uint e_numKeys;
	    uint e_threadBlocks;
	};
	
	struct OneSweepSortConstants_t_natural
	{
	    uint e_numKeys;
	    uint e_threadBlocks;
	};
	
	struct _Array_natural_OneSweepSortConstants_t4
	{
	    OneSweepSortConstants_t_natural data[4];
	};
	
	struct DispatchIndirectArgs_t_natural
	{
	    uint nThreadGroupCountX;
	    uint nThreadGroupCountY;
	    uint nThreadGroupCountZ;
	};
	
	struct _Array_natural_DispatchIndirectArgs_t4
	{
	    DispatchIndirectArgs_t_natural data[4];
	};
	
	struct DispatchAndConstantBuffer_t_natural
	{
	    _Array_natural_OneSweepSortConstants_t4 consts;
	    _Array_natural_DispatchIndirectArgs_t4 dispatchArg;
	};
	
	ByteAddressBuffer g_constantBuffer : register(t30, space0);
	globallycoherent RWByteAddressBuffer undetermined : register(u163, space0);
	RWByteAddressBuffer undetermined_1 : register(u162, space0);
	globallycoherent RWByteAddressBuffer undetermined_2 : register(u164, space0);
	cbuffer OneSweepSortPushConstants_t_natural
	{
	    uint g_consts_e_constIdx : packoffset(c0);
	    uint g_consts_e_radixShift : packoffset(c0.y);
	};
	
	
	static uint3 gl_GlobalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
	};
	
	uint GetThreadBlocks()
	{
	    OneSweepSortConstants_t_natural _214;
	    _214.e_numKeys = g_constantBuffer.Load(g_consts_e_constIdx * 8 + 0);
	    _214.e_threadBlocks = g_constantBuffer.Load(g_consts_e_constIdx * 8 + 4);
	    OneSweepSortConstants_t_natural_logical _215;
	    _215.e_numKeys = _214.e_numKeys;
	    _215.e_threadBlocks = _214.e_threadBlocks;
	    OneSweepSortConstants_t_natural_logical _111 = _215;
	    return _111.e_threadBlocks;
	}
	
	void MainCs_inner()
	{
	    uint3 _dbgvar_id = gl_GlobalInvocationID;
	    uint _dbgvar_increment = 65536u;
	    uint _222 = (GetThreadBlocks() * 256u) * 4u;
	    uint _dbgvar_clearEnd = _222;
	    uint _dbgvar_i = gl_GlobalInvocationID.x;
	    uint i = gl_GlobalInvocationID.x;
	    for (;;)
	    {
	        bool _52_ladder_break = false;
	        do
	        {
	            if (!(i < _222))
	            {
	                _52_ladder_break = true;
	                break;
	            }
	            undetermined.Store(i * 4 + 0, 0u);
	            break;
	        } while(false);
	        if (_52_ladder_break)
	        {
	            break;
	        }
	        uint i_1 = i + 65536u;
	        _dbgvar_i = i_1;
	        i = i_1;
	        continue;
	    }
	    if (gl_GlobalInvocationID.x < 1024u)
	    {
	        undetermined_1.Store(gl_GlobalInvocationID.x * 4 + 0, 0u);
	    }
	    if (gl_GlobalInvocationID.x < 4u)
	    {
	        undetermined_2.Store(gl_GlobalInvocationID.x * 4 + 0, 0u);
	    }
	}
	
	[numthreads(256, 1, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
