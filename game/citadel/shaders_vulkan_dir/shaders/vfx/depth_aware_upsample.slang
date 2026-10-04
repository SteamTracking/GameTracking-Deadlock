//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Depth aware upsample";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
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

struct VS_INPUT
{
	float3 vPositionSs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float3 vPositionSs;
	
	struct VS_INPUT
	{
	    float3 vPositionSs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _22489 = float4(vPositionSs, 1.0f);
	    _22489.y = -vPositionSs.y;
	    gl_Position = _22489;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionSs = stage_input.vPositionSs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	DynamicCombo( D_USE_INPUT1, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tCoarseDepth < Attribute("CoarseDepth"); SrgbRead(false); >;
	Texture2D g_tCoarseInput0 < Attribute("CoarseInput0"); SrgbRead(false); >;
	Texture2D g_tCoarseInput1 < Attribute("CoarseInput1"); SrgbRead(false); >;
	Texture2D g_tFineDepth < Attribute("FineDepth"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static const float _462[4] = { 0.0f, 0.0f, 0.0f, 0.0f };
	static const int2 _2168[4] = { int2(0, 0), int2(1, 0), int2(0, 1), int2(1, 1) };
	static const float _2150[4] = { 0.5625f, 0.1875f, 0.1875f, 0.0625f };
	static const float _1041[4] = { 0.1875f, 0.5625f, 0.0625f, 0.1875f };
	static const float _2943[4] = { 0.1875f, 0.0625f, 0.5625f, 0.1875f };
	static const float _1834[4] = { 0.0625f, 0.1875f, 0.1875f, 0.5625f };
	static const float _2351[4][4] = { { 0.5625f, 0.1875f, 0.1875f, 0.0625f }, { 0.1875f, 0.5625f, 0.0625f, 0.1875f }, { 0.1875f, 0.0625f, 0.5625f, 0.1875f }, { 0.0625f, 0.1875f, 0.1875f, 0.5625f } };
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c23.z);
	};
	
	Texture2D<float4> g_tFineDepth : register(t59, space1);
	Texture2D<float4> g_tCoarseDepth : register(t58, space1);
	Texture2D<float4> g_tCoarseInput0 : register(t56, space1);
	
	static float4 gl_FragCoord;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    do
	    {
	        uint2 _6486 = uint2(gl_FragCoord.xy);
	        uint3 _4919 = uint3(_6486, 0u);
	        uint2 _11552 = _4919.xy / uint2(2u, 2u);
	        uint _24899 = ((_6486.y % 2u) * 2u) + (_6486.x % 2u);
	        int3 _17299 = int3(_4919.xyz);
	        float _7124 = PerViewConstantBuffer_t_1_m0 / max(1.0000000116860974230803549289703e-07f, g_tFineDepth.Load(int3(_17299.xy, _17299.z)).x);
	        float _5724[4] = _462;
	        float _13155;
	        _13155 = 0.0f;
	        int _4284;
	        float _5958;
	        int _16208 = 0;
	        for (;;)
	        {
	            if (!(_16208 < 4))
	            {
	                break;
	            }
	            int3 _16480 = int3(uint3(_11552.xy + uint2(_2168[_16208]), 0u).xyz);
	            float _19980[4] = _2351[_24899];
	            float _9700 = _19980[_16208] * (1.0f / (9.9999997473787516355514526367188e-05f + (abs(_7124 - (PerViewConstantBuffer_t_1_m0 / max(1.0000000116860974230803549289703e-07f, g_tCoarseDepth.Load(int3(_16480.xy, _16480.z)).x))) * 0.00999999977648258209228515625f)));
	            _5724[_16208] = _9700;
	            _5958 = _13155 + _9700;
	            _4284 = _16208 + 1;
	            _13155 = _5958;
	            _16208 = _4284;
	            continue;
	        }
	        if (_13155 == 0.0f)
	        {
	            output_0 = 1.0f.xxxx;
	            break;
	        }
	        float4 _13156;
	        _13156 = 0.0f.xxxx;
	        int _4293;
	        float4 _19135;
	        int _16209 = 0;
	        for (;;)
	        {
	            if (!(_16209 < 4))
	            {
	                break;
	            }
	            int3 _18902 = int3(uint3(_11552.xy + uint2(_2168[_16209]), 0u).xyz);
	            _19135 = _13156.xyzw + (g_tCoarseInput0.Load(int3(_18902.xy, _18902.z)).xyzw * _5724[_16209]);
	            _4293 = _16209 + 1;
	            _13156 = _19135;
	            _16209 = _4293;
	            continue;
	        }
	        output_0 = _13156.xyzw / _13155.xxxx;
	        break;
	    } while(false);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
