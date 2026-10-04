//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Motion Blur";
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
	DynamicCombo( D_MOTION_BLUR_MODE, 0..5 );
	DynamicCombo( D_MOTION_BLUR_QUALITY, 0..1 );
	
	RWTexture2D<float4> gOutputTexture < Attribute("OutputTexture"); >;
	RWBuffer<float4> g_DispatchIndirectArgs < Attribute("DispatchIndirectArgs"); >;
	RWBuffer<float4> g_VelocityTileBuffer < Attribute("VelocityTileBuffer"); >;
	Texture2D g_tColor < Attribute("InputColor"); SrgbRead(false); >;
	Texture2D g_tDepth < Attribute("InputDepth"); SrgbRead(false); >;
	RWTexture2D<float4> g_tMaxVelocity < Attribute("MaxVelocity"); >;
	Texture2D g_tMotionVectors < Attribute("MotionVectors"); SrgbRead(false); >;
	RWTexture2D<float4> g_tTileMax < Attribute("TileMax"); >;
	RWTexture2D<float4> g_tTileMaxHorizontal < Attribute("TileMaxHorizontal"); >;
	RWTexture2D<float4> g_tTileMin < Attribute("TileMin"); >;
	RWTexture2D<float4> g_tTileMinHorizontal < Attribute("TileMinHorizontal"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer MotionBlur_t : register(b1, space0)
	{
	    uint2 MotionBlur_t_1_m0 : packoffset(c0.z);
	    float2 MotionBlur_t_1_m1 : packoffset(c1);
	    float MotionBlur_t_1_m2 : packoffset(c2);
	};
	
	Texture2D<float4> g_tMotionVectors : register(t32, space0);
	SamplerState AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint : register(s22, space0);
	RWTexture2D<float4> _3046 : register(u158, space0);
	RWTexture2D<float4> _3725 : register(u159, space0);
	
	static uint3 gl_WorkGroupID;
	static uint3 gl_LocalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_WorkGroupID : SV_GroupID;
	    uint3 gl_LocalInvocationID : SV_GroupThreadID;
	};
	
	groupshared uint _5551[8];
	groupshared uint _3039[8];
	
	void MainCs_inner()
	{
	    do
	    {
	        uint _10370 = gl_WorkGroupID.y * 8u;
	        uint2 _6303 = uint2(gl_WorkGroupID.x * 16u, _10370);
	        if (_10370 >= MotionBlur_t_1_m0.y)
	        {
	            break;
	        }
	        if (gl_LocalInvocationID.y == 0u)
	        {
	            _5551[gl_LocalInvocationID.x] = 2147483648u;
	            _3039[gl_LocalInvocationID.x] = 3379831808u;
	        }
	        float2 _13136;
	        float2 _16305;
	        float _17114;
	        float _17133;
	        _13136 = 0.0f.xx;
	        _16305 = 0.0f.xx;
	        _17114 = 1000000.0f;
	        _17133 = 0.0f;
	        uint _4283;
	        float _11314;
	        float2 _15047;
	        float _19063;
	        float2 _22910;
	        uint _17017 = 0u;
	        for (;;)
	        {
	            if (!(_17017 < 2u))
	            {
	                break;
	            }
	            float2 _21629 = g_tMotionVectors.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint, clamp((float2((uint2(_17017 * 8u, 0u) + _6303.xy) + gl_LocalInvocationID.xy) + 0.5f.xx) * MotionBlur_t_1_m1, 0.0f.xx, 1.0f.xx) * MotionBlur_t_1_m2, 0.0f).zw;
	            float _12785 = dot(_21629, _21629);
	            bool _23268 = _12785 > _17133;
	            _11314 = _23268 ? _12785 : _17133;
	            bool2 _22947 = _23268.xx;
	            _22910 = float2(_22947.x ? _21629.x : _16305.x, _22947.y ? _21629.y : _16305.y);
	            bool _25246 = _12785 < _17114;
	            _19063 = _25246 ? _12785 : _17114;
	            bool2 _20270 = _25246.xx;
	            _15047 = float2(_20270.x ? _21629.x : _13136.x, _20270.y ? _21629.y : _13136.y);
	            _4283 = _17017 + 1u;
	            _13136 = _15047;
	            _16305 = _22910;
	            _17114 = _19063;
	            _17133 = _11314;
	            _17017 = _4283;
	            continue;
	        }
	        GroupMemoryBarrierWithGroupSync();
	        uint _20469 = asuint(_17133);
	        uint _8204 = _20469 ^ (uint(-int(_20469 >> uint(31))) | 2147483648u);
	        uint _12391;
	        InterlockedMax(_5551[gl_LocalInvocationID.y], _8204, _12391);
	        uint _22881 = asuint(_17114);
	        uint _11571 = _22881 ^ (uint(-int(_22881 >> uint(31))) | 2147483648u);
	        uint _19505;
	        InterlockedMin(_3039[gl_LocalInvocationID.y], _11571, _19505);
	        GroupMemoryBarrierWithGroupSync();
	        uint2 _3872 = uint2(gl_WorkGroupID.x, _10370) + uint2(0u, gl_LocalInvocationID.y);
	        if (_5551[gl_LocalInvocationID.y] == _8204)
	        {
	            _3046[_3872.xy] = float4(_16305, 0.0f, 0.0f);
	        }
	        if (_3039[gl_LocalInvocationID.y] == _11571)
	        {
	            _3725[_3872.xy] = float4(_13136, 0.0f, 0.0f);
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
