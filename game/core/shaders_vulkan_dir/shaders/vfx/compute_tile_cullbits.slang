//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Computes culling bits for screen space tiles";
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
	DynamicCombo( D_SUBGROUP_SIZE_32, 0..1 );
	
	StructuredBuffer g_CullItems < Attribute("CullItems"); >;
	StructuredBuffer g_CullPlanes < Attribute("CullPlanes"); >;
	RWStructuredBuffer g_OutputCullBits < Attribute("OutputCullBits"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1002
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	};
	
	struct _2631
	{
	    _1002 _m0[3];
	};
	
	struct _1935
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    float2 _m4;
	    float2 _m5;
	    float _m6;
	    float _m7;
	    float2 _m8;
	    float _m9;
	    float _m10;
	    float _m11;
	    float _m12;
	    float _m13;
	    float _m14;
	    float _m15;
	    float _m16;
	};
	
	struct _1032
	{
	    float2 _m0;
	    float _m1;
	    float _m2;
	};
	
	static bool _5;
	
	cbuffer CullParams_t : register(b1, space0)
	{
	    uint CullParams_t_1_m0 : packoffset(c0.y);
	    uint CullParams_t_1_m1 : packoffset(c0.z);
	    float2 CullParams_t_1_m2 : packoffset(c1);
	    float2 CullParams_t_1_m3 : packoffset(c1.z);
	    uint4 CullParams_t_1_m4 : packoffset(c3);
	    _2631 CullParams_t_1_m5 : packoffset(c4);
	};
	
	ByteAddressBuffer g_CullItems : register(t31, space0);
	ByteAddressBuffer g_CullPlanes : register(t30, space0);
	RWByteAddressBuffer undetermined : register(u158, space0);
	
	static uint3 gl_WorkGroupID;
	static uint3 gl_LocalInvocationID;
	static uint3 gl_GlobalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_WorkGroupID : SV_GroupID;
	    uint3 gl_LocalInvocationID : SV_GroupThreadID;
	    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
	};
	
	groupshared uint _5602;
	
	void MainCs_inner()
	{
	    uint _22151 = (gl_WorkGroupID.z >= CullParams_t_1_m4.z) ? 2u : uint(gl_WorkGroupID.z >= CullParams_t_1_m4.y);
	    uint _3251 = gl_WorkGroupID.z - CullParams_t_1_m4[_22151];
	    float2 _3700 = abs(CullParams_t_1_m2) * 0.5f;
	    float2 _23453 = (float2(gl_GlobalInvocationID.xy) * CullParams_t_1_m2) + CullParams_t_1_m3;
	    uint2 _7433 = gl_WorkGroupID.xy * uint2(8u, 4u);
	    float2 _16631 = (float2(_7433) * CullParams_t_1_m2) + CullParams_t_1_m3;
	    float2 _17028 = (float2(_7433 + uint2(7u, 3u)) * CullParams_t_1_m2) + CullParams_t_1_m3;
	    float2 _4823 = (_17028 + _16631) * 0.5f;
	    float2 _3512 = abs(_17028 - _16631) * 0.5f;
	    uint _3716 = (gl_LocalInvocationID.y * 8u) + gl_LocalInvocationID.x;
	    if (all(bool3(gl_LocalInvocationID.x == uint3(0u, 0u, 0u).x, gl_LocalInvocationID.y == uint3(0u, 0u, 0u).y, gl_LocalInvocationID.z == uint3(0u, 0u, 0u).z)))
	    {
	        _5602 = 0u;
	    }
	    uint _24395 = CullParams_t_1_m5._m0[_22151]._m2 + (_3251 * 32u);
	    uint _7606 = _24395 + _3716;
	    float2 _4241 = asfloat(g_CullItems.Load2(_7606 * 80 + 16)) - _3512;
	    float2 _5212 = asfloat(g_CullItems.Load2(_7606 * 80 + 24)) + _3512;
	    bool2 _9657 = bool2(_4823.x >= _4241.x, _4823.y >= _4241.y);
	    bool2 _8020 = bool2(_5212.x >= _4823.x, _5212.y >= _4823.y);
	    uint _15363;
	    if (all(bool2(_9657.x && _8020.x, _9657.y && _8020.y)))
	    {
	        bool _12885;
	        do
	        {
	            if (asfloat(g_CullItems.Load(_7606 * 80 + 72)) == 0.0f)
	            {
	                _12885 = true;
	                break;
	            }
	            float _15662 = abs(asfloat(g_CullItems.Load(_7606 * 80 + 56)));
	            float _18864 = _3512.x;
	            float _6460 = _3512.y;
	            float2 _17067 = _3512 + _3700;
	            float _18950 = _4823.x;
	            float _20654 = _4823.y;
	            float _7753 = asfloat(g_CullItems.Load(_7606 * 80 + 48)) * _18950;
	            float _19133 = asfloat(g_CullItems.Load(_7606 * 80 + 52)) * _20654;
	            float _22329 = asfloat(g_CullItems.Load(_7606 * 80 + 56)) * _18950;
	            _12885 = (((((((((_7753 * _18950) + (_19133 * _20654)) + (_22329 * _20654)) + (asfloat(g_CullItems.Load(_7606 * 80 + 60)) * _18950)) + (asfloat(g_CullItems.Load(_7606 * 80 + 64)) * _20654)) + asfloat(g_CullItems.Load(_7606 * 80 + 68))) + (abs(((2.0f * _7753) + (asfloat(g_CullItems.Load(_7606 * 80 + 56)) * _20654)) + asfloat(g_CullItems.Load(_7606 * 80 + 60))) * _17067.x)) + (abs(((2.0f * _19133) + _22329) + asfloat(g_CullItems.Load(_7606 * 80 + 64))) * _17067.y)) + dot(float2(((2.0f * abs(asfloat(g_CullItems.Load(_7606 * 80 + 48)))) * _18864) + (_15662 * _6460), ((2.0f * abs(asfloat(g_CullItems.Load(_7606 * 80 + 52)))) * _6460) + (_15662 * _18864)), _3700)) >= 0.0f;
	            break;
	        } while(false);
	        uint _12502;
	        if (_12885)
	        {
	            bool _12886;
	            do
	            {
	                uint _23989;
	                bool _13174;
	                bool _16054;
	                uint _13039 = 0u;
	                for (;;)
	                {
	                    if (!(_13039 < g_CullItems.Load(_7606 * 80 + 8)))
	                    {
	                        _13174 = _5;
	                        _16054 = false;
	                        break;
	                    }
	                    uint _14202 = g_CullItems.Load(_7606 * 80 + 0) + _13039;
	                    if (((dot(asfloat(g_CullPlanes.Load2(_14202 * 16 + 0)), _4823) + asfloat(g_CullPlanes.Load(_14202 * 16 + 8))) + dot(abs(asfloat(g_CullPlanes.Load2(_14202 * 16 + 0))), _3512)) < 0.0f)
	                    {
	                        _13174 = false;
	                        _16054 = true;
	                        break;
	                    }
	                    _23989 = _13039 + 1u;
	                    _13039 = _23989;
	                    continue;
	                }
	                if (_16054)
	                {
	                    _12886 = _13174;
	                    break;
	                }
	                _12886 = true;
	                break;
	            } while(false);
	            uint _12501;
	            if (_12886)
	            {
	                _12501 = 1u << _3716;
	            }
	            else
	            {
	                _12501 = 0u;
	            }
	            _12502 = _12501;
	        }
	        else
	        {
	            _12502 = 0u;
	        }
	        _15363 = _12502;
	    }
	    else
	    {
	        _15363 = 0u;
	    }
	    GroupMemoryBarrierWithGroupSync();
	    if (_15363 != 0u)
	    {
	        uint _23780;
	        InterlockedOr(_5602, _15363, _23780);
	    }
	    GroupMemoryBarrierWithGroupSync();
	    uint _17133;
	    _17133 = 0u;
	    uint _3461;
	    uint _12505;
	    bool _13176;
	    bool _13178;
	    bool _13136;
	    bool _16305;
	    uint _17017 = _5602;
	    for (;;)
	    {
	        if (!(_17017 != 0u))
	        {
	            break;
	        }
	        uint _17426 = firstbitlow(_17017);
	        _3461 = _17017 & (_17017 - 1u);
	        uint _24956 = _24395 + _17426;
	        bool _12887;
	        do
	        {
	            if (asfloat(g_CullItems.Load(_24956 * 80 + 72)) == 0.0f)
	            {
	                _12887 = true;
	                break;
	            }
	            float _16377 = _23453.x;
	            float _23301 = _23453.y;
	            float _7754 = asfloat(g_CullItems.Load(_24956 * 80 + 48)) * _16377;
	            float _19134 = asfloat(g_CullItems.Load(_24956 * 80 + 52)) * _23301;
	            float _22331 = asfloat(g_CullItems.Load(_24956 * 80 + 56)) * _16377;
	            _12887 = ((((((((_7754 * _16377) + (_19134 * _23301)) + (_22331 * _23301)) + (asfloat(g_CullItems.Load(_24956 * 80 + 60)) * _16377)) + (asfloat(g_CullItems.Load(_24956 * 80 + 64)) * _23301)) + asfloat(g_CullItems.Load(_24956 * 80 + 68))) + (abs(((2.0f * _7754) + (asfloat(g_CullItems.Load(_24956 * 80 + 56)) * _23301)) + asfloat(g_CullItems.Load(_24956 * 80 + 60))) * _3700.x)) + (abs(((2.0f * _19134) + _22331) + asfloat(g_CullItems.Load(_24956 * 80 + 64))) * _3700.y)) >= 0.0f;
	            break;
	        } while(false);
	        bool _16056;
	        if (_12887)
	        {
	            bool _12503;
	            do
	            {
	                uint _23990;
	                bool _13175;
	                bool _16055;
	                uint _13040 = 0u;
	                for (;;)
	                {
	                    if (!(_13040 < g_CullItems.Load(_24956 * 80 + 8)))
	                    {
	                        _13175 = _16305;
	                        _16055 = false;
	                        break;
	                    }
	                    uint _14203 = g_CullItems.Load(_24956 * 80 + 0) + _13040;
	                    if ((dot(asfloat(g_CullPlanes.Load2(_14203 * 16 + 0)), _23453) + asfloat(g_CullPlanes.Load(_14203 * 16 + 8))) < 0.0f)
	                    {
	                        _13175 = false;
	                        _16055 = true;
	                        break;
	                    }
	                    _23990 = _13040 + 1u;
	                    _13040 = _23990;
	                    continue;
	                }
	                if (_16055)
	                {
	                    _12503 = _13175;
	                    break;
	                }
	                _12503 = true;
	                break;
	            } while(false);
	            _13176 = _12503;
	            _16056 = _12503;
	        }
	        else
	        {
	            _13176 = _16305;
	            _16056 = false;
	        }
	        bool _16058;
	        if (_16056)
	        {
	            uint _24392 = g_CullItems.Load(_24956 * 80 + 0) + g_CullItems.Load(_24956 * 80 + 8);
	            bool _12504;
	            do
	            {
	                uint _23991;
	                bool _13177;
	                bool _16057;
	                uint _13041 = 0u;
	                for (;;)
	                {
	                    if (!(_13041 < g_CullItems.Load(_24956 * 80 + 12)))
	                    {
	                        _13177 = _13136;
	                        _16057 = false;
	                        break;
	                    }
	                    uint _14204 = _24392 + _13041;
	                    if ((dot(asfloat(g_CullPlanes.Load2(_14204 * 16 + 0)), _23453) + asfloat(g_CullPlanes.Load(_14204 * 16 + 8))) < 0.0f)
	                    {
	                        _13177 = false;
	                        _16057 = true;
	                        break;
	                    }
	                    _23991 = _13041 + 1u;
	                    _13041 = _23991;
	                    continue;
	                }
	                if (_16057)
	                {
	                    _12504 = _13177;
	                    break;
	                }
	                _12504 = true;
	                break;
	            } while(false);
	            _13178 = _12504;
	            _16058 = _12504;
	        }
	        else
	        {
	            _13178 = _13136;
	            _16058 = false;
	        }
	        if (_16058)
	        {
	            _12505 = _17133 | (1u << _17426);
	        }
	        else
	        {
	            _12505 = _17133;
	        }
	        _13136 = _13178;
	        _16305 = _13176;
	        _17133 = _12505;
	        _17017 = _3461;
	        continue;
	    }
	    bool _12888;
	    if (gl_GlobalInvocationID.x < CullParams_t_1_m0)
	    {
	        _12888 = gl_GlobalInvocationID.y < CullParams_t_1_m1;
	    }
	    else
	    {
	        _12888 = false;
	    }
	    if (_12888)
	    {
	        undetermined.Store(((CullParams_t_1_m5._m0[_22151]._m0 + (((gl_GlobalInvocationID.y * CullParams_t_1_m0) + gl_GlobalInvocationID.x) * CullParams_t_1_m5._m0[_22151]._m1)) + _3251) * 4 + 0, _17133);
	    }
	}
	
	[numthreads(8, 4, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_WorkGroupID = stage_input.gl_WorkGroupID;
	    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
	    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
