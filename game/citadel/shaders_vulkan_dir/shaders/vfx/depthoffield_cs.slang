//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Depth of field";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_60
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
	DynamicCombo( D_DEPTH_OF_FIELD_MODE, 0..6 );
	DynamicCombo( D_DEPTH_OF_FIELD_TYPE, 0..1 );
	DynamicCombo( D_DEPTH_OF_FIELD_DEBUG, 0..1 );
	DynamicCombo( D_DEPTH_OF_FIELD_BLUR_MODE, 0..2 );
	
	RWBuffer<float4> g_DispatchIndirectArgs < Attribute("DOFDispatchIndirectArgs"); >;
	RWBuffer<float4> g_TileBuffer < Attribute("DOFTileBuffer"); >;
	Texture2D g_tColor < Attribute("InputColor"); SrgbRead(false); >;
	Texture2D g_tDepth < Attribute("InputDepth"); SrgbRead(false); >;
	Texture2D g_tMainAlphaSample < Attribute("MainAlphaSample"); SrgbRead(false); >;
	Texture2D g_tMainOutputSample < Attribute("MainOutputSample"); SrgbRead(false); >;
	Texture2D g_tPostFilterAlphaSample < Attribute("PostFilterAlphaSample"); SrgbRead(false); >;
	Texture2D g_tPostFilterOutputSample < Attribute("PostFilterOutputSample"); SrgbRead(false); >;
	Texture2D g_tPrefilterSample < Attribute("PrefilterSample"); SrgbRead(false); >;
	Texture2D g_tPresortSample < Attribute("PresortSample"); SrgbRead(false); >;
	RWTexture2D<float4> g_uMainAlpha < Attribute("MainAlpha"); >;
	RWTexture2D<float4> g_uMainOutput < Attribute("MainOutput"); >;
	RWTexture2D<float4> g_uMinDepthMaxCoC < Attribute("MinDepthMaxCoC"); >;
	RWTexture2D<float4> g_uOutputTexture < Attribute("OutputTexture"); >;
	RWTexture2D<float4> g_uPostFilterAlpha < Attribute("PostFilterAlpha"); >;
	RWTexture2D<float4> g_uPostFilterOutput < Attribute("PostFilterOutput"); >;
	RWTexture2D<float4> g_uPrefilter < Attribute("Prefilter"); >;
	RWTexture2D<float4> g_uPresort < Attribute("Presort"); >;
	RWTexture2D<float4> g_uTileHorizontalMinCoC < Attribute("TileHorizontalMinCoC"); >;
	RWTexture2D<float4> g_uTileHorizontalMinDepthMaxCoC < Attribute("TileHorizontalMinDepthMaxCoC"); >;
	RWTexture2D<float4> g_uTileMinCoC < Attribute("TileMinCoC"); >;
	RWTexture2D<float4> g_uTileMinDepthMaxCoC < Attribute("TileMinDepthMaxCoC"); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer DepthOfField_t : register(b1, space0)
	{
	    uint2 DepthOfField_t_1_m0 : packoffset(c0.z);
	    float2 DepthOfField_t_1_m1 : packoffset(c1);
	    float DepthOfField_t_1_m2 : packoffset(c2.z);
	    float DepthOfField_t_1_m3 : packoffset(c2.w);
	    float DepthOfField_t_1_m4 : packoffset(c3);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b0, space0)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c23);
	    float PerViewConstantBuffer_t_1_m1 : packoffset(c23.y);
	    float3 PerViewConstantBuffer_t_1_m2 : packoffset(c29);
	};
	
	Texture2D<float4> g_tDepth : register(t31, space0);
	SamplerState AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint : register(s22, space0);
	RWTexture2D<float4> _4798 : register(u158, space0);
	RWTexture2D<float4> _5182 : register(u159, space0);
	
	static uint3 gl_WorkGroupID;
	static uint3 gl_LocalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_WorkGroupID : SV_GroupID;
	    uint3 gl_LocalInvocationID : SV_GroupThreadID;
	};
	
	groupshared uint _3077[8];
	groupshared uint _5784[8];
	groupshared uint _3635[8];
	
	void MainCs_inner()
	{
	    do
	    {
	        uint _10370 = gl_WorkGroupID.y * 8u;
	        uint2 _6303 = uint2(gl_WorkGroupID.x * 32u, _10370);
	        if (_10370 >= DepthOfField_t_1_m0.y)
	        {
	            break;
	        }
	        if (gl_LocalInvocationID.y == 0u)
	        {
	            _3077[gl_LocalInvocationID.x] = 3212836864u;
	            _5784[gl_LocalInvocationID.x] = 3379831808u;
	            _3635[gl_LocalInvocationID.x] = 2147483648u;
	        }
	        float _13136;
	        float _16305;
	        float _17133;
	        _13136 = 0.0f;
	        _16305 = 1000000.0f;
	        _17133 = 1.0f;
	        uint _4283;
	        float _8005;
	        float _8358;
	        float _15255;
	        uint _17017 = 0u;
	        for (;;)
	        {
	            if (!(_17017 < 4u))
	            {
	                break;
	            }
	            float4 _21919 = g_tDepth.GatherRed(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint, clamp((float2((uint2(_17017 * 8u, 0u) + _6303.xy) + gl_LocalInvocationID.xy) + 0.5f.xx) * DepthOfField_t_1_m1, 0.0f.xx, 1.0f.xx) * DepthOfField_t_1_m4, int2(0, 0));
	            float _23092 = abs(PerViewConstantBuffer_t_1_m2.x / ((PerViewConstantBuffer_t_1_m2.y * saturate((max(max(_21919.x, max(_21919.y, _21919.z)), _21919.w) - PerViewConstantBuffer_t_1_m0) / (PerViewConstantBuffer_t_1_m1 - PerViewConstantBuffer_t_1_m0))) + PerViewConstantBuffer_t_1_m2.z));
	            float _9720 = abs((1.0f - (DepthOfField_t_1_m2 / _23092)) * DepthOfField_t_1_m3);
	            _15255 = min(clamp(_23092, 0.0f, 10000.0f) * 9.9999997473787516355514526367188e-05f, _17133);
	            _8358 = min(_9720, _16305);
	            _8005 = max(_9720, _13136);
	            _4283 = _17017 + 1u;
	            _13136 = _8005;
	            _16305 = _8358;
	            _17133 = _15255;
	            _17017 = _4283;
	            continue;
	        }
	        GroupMemoryBarrierWithGroupSync();
	        uint _20469 = asuint(_17133);
	        uint _9706;
	        InterlockedMin(_3077[gl_LocalInvocationID.y], _20469 ^ (uint(-int(_20469 >> uint(31))) | 2147483648u), _9706);
	        uint _8654 = asuint(_16305);
	        uint _9707;
	        InterlockedMin(_5784[gl_LocalInvocationID.y], _8654 ^ (uint(-int(_8654 >> uint(31))) | 2147483648u), _9707);
	        uint _8655 = asuint(_13136);
	        uint _22209;
	        InterlockedMax(_3635[gl_LocalInvocationID.y], _8655 ^ (uint(-int(_8655 >> uint(31))) | 2147483648u), _22209);
	        GroupMemoryBarrierWithGroupSync();
	        if (gl_LocalInvocationID.x == 0u)
	        {
	            uint2 _23555 = (uint2(gl_WorkGroupID.x, _10370) + gl_LocalInvocationID.xy).xy;
	            _4798[_23555] = float4(asfloat(_3077[gl_LocalInvocationID.y] ^ (((_3077[gl_LocalInvocationID.y] >> uint(31)) - 1u) | 2147483648u)), asfloat(_3635[gl_LocalInvocationID.y] ^ (((_3635[gl_LocalInvocationID.y] >> uint(31)) - 1u) | 2147483648u)), 0.0f, 0.0f);
	            _5182[_23555] = asfloat(_5784[gl_LocalInvocationID.y] ^ (((_5784[gl_LocalInvocationID.y] >> uint(31)) - 1u) | 2147483648u)).xxxx;
	        }
	        break;
	    } while(false);
	}
	
	[numthreads(8, 8, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_WorkGroupID = stage_input.gl_WorkGroupID;
	    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
