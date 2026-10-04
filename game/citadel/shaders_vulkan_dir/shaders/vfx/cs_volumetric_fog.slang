//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Updates volumetric fog lookup textures";
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
	DynamicCombo( D_PASS, 0..1 );
	DynamicCombo( D_ENABLE_INDIRECT, 0..1 );
	DynamicCombo( D_LPV_INDIRECT, 0..1 );
	DynamicCombo( D_FLOAT_INTERMEDIATE_TEXTURES, 0..1 );
	DynamicCombo( D_TEMPORAL_INTEGRATE, 0..1 );
	DynamicComboRule( Requires( D_LPV_INDIRECT, D_ENABLE_INDIRECT ) );
	
	Texture3D InLightingTexture < Attribute("InLightingTexture"); SrgbRead(false); >;
	RWTexture3D<float4> OutLightingFroxelTexture < Attribute("OutLightingFroxelTexture"); >;
	RWTexture3D<float4> OutScatteringTexture < Attribute("OutScatteringTexture"); >;
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	StructuredBuffer g_FogVolumes < Attribute("VolumetricFogVolumes"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tBlueNoise < Attribute("BlueNoise"); SrgbRead(false); >;
	Texture3D g_tFogIndirectVolume < Attribute("g_tFogIndirect"); SrgbRead(false); >;
	Texture3D g_tLastFrameFogVolume < Attribute("g_tLastFrameFogVolume"); SrgbRead(false); >;
	Texture3D g_tLightCookieTexture < Attribute("LightCookieTexture"); SrgbRead(true); >;
	Texture2D g_tShadowDepthBufferDepthNoCmp < Attribute("ShadowDepthBufferNoCmp"); SrgbRead(false); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3534 (name: PerViewConstantBufferCitadel_t), member index 1 (name: _m1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_scalar_block_layout : require
	#extension GL_EXT_samplerless_texture_functions : require
	#if defined(GL_EXT_control_flow_attributes)
	#extension GL_EXT_control_flow_attributes : require
	#define SPIRV_CROSS_FLATTEN [[flatten]]
	#define SPIRV_CROSS_BRANCH [[dont_flatten]]
	#define SPIRV_CROSS_UNROLL [[unroll]]
	#define SPIRV_CROSS_LOOP [[dont_unroll]]
	#else
	#define SPIRV_CROSS_FLATTEN
	#define SPIRV_CROSS_BRANCH
	#define SPIRV_CROSS_UNROLL
	#define SPIRV_CROSS_LOOP
	#endif
	#extension GL_KHR_shader_subgroup_arithmetic : require
	layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;
	
	struct _1045
	{
	    float _m0;
	    float _m1;
	    float _m2;
	    float _m3;
	};
	
	struct _1952
	{
	    mat4 _m0;
	    uint _m1;
	    float _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	    float _m6;
	    float _m7;
	    float _m8;
	    float _m9;
	    vec3 _m10;
	    float _m11;
	    float _m12;
	    float _m13;
	    float _m14;
	};
	
	struct _2297
	{
	    vec4 _m0[4];
	};
	
	struct _2964
	{
	    mat4 _m0[4];
	};
	
	struct _1719
	{
	    vec4 _m0[16];
	};
	
	const vec2 _630[32] = vec2[](vec2(0.64073598384857177734375, -0.355204999446868896484375), vec2(-0.725410997867584228515625, -0.68831598758697509765625), vec2(-0.18509499728679656982421875, 0.72264802455902099609375), vec2(0.770596027374267578125, 0.63732397556304931640625), vec2(-0.92144501209259033203125, 0.19699700176715850830078125), vec2(0.07657100260257720947265625, -0.9882199764251708984375), vec2(-0.13480000197887420654296875, -0.0908536016941070556640625), vec2(0.32010900974273681640625, 0.2572410106658935546875), vec2(0.994020998477935791015625, 0.1091929972171783447265625), vec2(0.3049339950084686279296875, 0.952373981475830078125), vec2(-0.698576986789703369140625, 0.715534985065460205078125), vec2(0.548700988292694091796875, -0.836018979549407958984375), vec2(-0.4431590139865875244140625, 0.29612100124359130859375), vec2(0.15067000687122344970703125, -0.489731013774871826171875), vec2(-0.62382900714874267578125, -0.20816700160503387451171875), vec2(-0.29477798938751220703125, -0.5965449810028076171875), vec2(0.334086000919342041015625, -0.12820799648761749267578125), vec2(-0.061983101069927215576171875, 0.311747014522552490234375), vec2(0.166112005710601806640625, 0.616259992122650146484375), vec2(-0.28912699222564697265625, -0.95729100704193115234375), vec2(-0.987479984760284423828125, -0.15774500370025634765625), vec2(0.6375010013580322265625, 0.06515710055828094482421875), vec2(0.971376001834869384765625, -0.23754499852657318115234375), vec2(-0.017059899866580963134765625, 0.98058998584747314453125), vec2(-0.4425640106201171875, 0.89673697948455810546875), vec2(0.4861899912357330322265625, 0.518723011016845703125), vec2(-0.725271999835968017578125, 0.4199649989604949951171875), vec2(0.78141701221466064453125, -0.62400901317596435546875), vec2(-0.89922702312469482421875, -0.43748199939727783203125), vec2(0.769218981266021728515625, 0.3337199985980987548828125), vec2(-0.414411008358001708984375, 0.0037537799216806888580322265625), vec2(0.262856006622314453125, -0.75951397418975830078125));
	
	struct _200
	{
	    mat4 _m0;
	    mat4 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    vec4 _m4;
	    vec4 _m5;
	    vec3 _m6;
	    uint _m7;
	    vec4 _m8;
	    vec4 _m9;
	    vec4 _m10;
	    float _m11;
	    float _m12;
	    uint _m13;
	    int _m14;
	    mat4x3 _m15;
	    vec4 _m16;
	    vec4 _m17;
	    vec4 _m18;
	    vec4 _m19;
	    vec4 _m20;
	    vec3 _m21;
	    float _m22;
	    mat4 _m23;
	};
	
	vec4 _3;
	
	struct _2830
	{
	    vec4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    uint _m4;
	    vec3 _m5;
	    float _m6;
	    vec3 _m7;
	    vec3 _m8;
	    float _m9;
	    float _m10;
	    float _m11;
	    float _m12;
	    vec3 _m13;
	    uvec4 _m14;
	    vec4 _m15;
	};
	
	layout(set = 0) uniform _2830 VolumetricFogConstantBuffer_t;
	
	struct _1095
	{
	    ivec2 _m0;
	    _1045 _m1;
	};
	
	layout(set = 0) uniform _1095 PerViewConstantBufferCitadel_t;
	
	layout(set = 0, binding = 34, scalar) readonly buffer g_FogVolumes
	{
	    layout(row_major) _1952 _m0[];
	} g_FogVolumes_1;
	
	struct _1046
	{
	    vec2 _m0;
	    vec3 _m1;
	};
	
	layout(set = 0) uniform _1046 PerViewConstantBuffer_t;
	
	struct _1593
	{
	    uvec4 _m0;
	    uvec4 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    int _m4;
	    vec4 _m5;
	    float _m6;
	    float _m7;
	    float _m8;
	    float _m9;
	    _2964 _m10;
	    _2297 _m11;
	    _2297 _m12;
	    uint _m13;
	    uint _m14;
	    _1719 _m15;
	};
	
	layout(set = 3) uniform _1593 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 3, binding = 30, std430) readonly buffer g_CullBits
	{
	    uint _m0[];
	} g_CullBits_1;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_BarnLights
	{
	    layout(row_major) _200 _m0[];
	} g_BarnLights_1;
	
	layout(set = 0, binding = 30) uniform texture2D g_tBlueNoise;
	layout(set = 0, binding = 17) uniform sampler AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint;
	layout(set = 0, binding = 53) uniform texture2D g_tShadowDepthBufferDepthNoCmp;
	layout(set = 0, binding = 19) uniform sampler AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_Filter_MinMagMipLinear;
	layout(set = 0, binding = 40) uniform texture3D g_tLightCookieTexture;
	layout(set = 0, binding = 25) uniform sampler g_sCookieSampler;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 0, binding = 159) uniform writeonly image3D _3982;
	
	void main()
	{
	    vec3 _3585 = (VolumetricFogConstantBuffer_t._m2.xyz + (VolumetricFogConstantBuffer_t._m0.xyz * (float(gl_GlobalInvocationID.x) + 0.5))) + (VolumetricFogConstantBuffer_t._m1.xyz * (float(gl_GlobalInvocationID.y) + 0.5));
	    vec3 _5628 = fract(texelFetch(g_tBlueNoise, ivec3(ivec2(gl_GlobalInvocationID.xy & uvec2(PerViewConstantBufferCitadel_t._m0)), 0).xy, 0).xyz + VolumetricFogConstantBuffer_t._m7) - vec3(0.5);
	    float _24714 = float(gl_GlobalInvocationID.z);
	    float _3102 = (_24714 + 0.5) * VolumetricFogConstantBuffer_t._m15.z;
	    float _12217 = (PerViewConstantBufferCitadel_t._m1._m1 * ((exp2(PerViewConstantBufferCitadel_t._m1._m2 * _3102) * PerViewConstantBufferCitadel_t._m1._m3) - PerViewConstantBufferCitadel_t._m1._m3)) + PerViewConstantBufferCitadel_t._m1._m0;
	    vec3 _5223 = VolumetricFogConstantBuffer_t._m3.xyz + (_3585 * _12217);
	    vec3 _3718 = (_5223.xyz + (((VolumetricFogConstantBuffer_t._m0.xyz * _5628.x) + (VolumetricFogConstantBuffer_t._m1.xyz * _5628.y)).xyz * _12217)) + ((_3585 * _5628.z).xyz * (_12217 - ((PerViewConstantBufferCitadel_t._m1._m1 * ((exp2(PerViewConstantBufferCitadel_t._m1._m2 * max(0.0, _3102 - VolumetricFogConstantBuffer_t._m15.z)) * PerViewConstantBufferCitadel_t._m1._m3) - PerViewConstantBufferCitadel_t._m1._m3)) + PerViewConstantBufferCitadel_t._m1._m0)));
	    float _13136;
	    float _16305;
	    float _17114;
	    vec3 _17133;
	    _13136 = 0.0;
	    _16305 = VolumetricFogConstantBuffer_t._m10;
	    _17114 = 0.0;
	    _17133 = VolumetricFogConstantBuffer_t._m13;
	    uint _8896;
	    float _13138;
	    float _14891;
	    float _16307;
	    vec3 _18360;
	    uint _17017 = 0u;
	    for (;;)
	    {
	        if (!(_17017 < VolumetricFogConstantBuffer_t._m4))
	        {
	            break;
	        }
	        vec4 _8911 = g_FogVolumes_1._m0[_17017]._m0 * vec4(_3718, 1.0);
	        vec3 _22412 = _8911.xyz;
	        SPIRV_CROSS_BRANCH
	        if (all(equal(_22412, saturate(_22412))))
	        {
	            vec3 _16962 = abs((_22412 * 2.0) - vec3(1.0));
	            float _8503;
	            if (g_FogVolumes_1._m0[_17017]._m1 == 0u)
	            {
	                _8503 = saturate(1.0 - max(_16962.x, max(_16962.y, _16962.z)));
	            }
	            else
	            {
	                float _12502;
	                if (g_FogVolumes_1._m0[_17017]._m1 == 1u)
	                {
	                    _12502 = saturate(1.0 - length(_16962));
	                }
	                else
	                {
	                    float _12501;
	                    if (g_FogVolumes_1._m0[_17017]._m1 == 2u)
	                    {
	                        _12501 = min(saturate((1.0 - _8911.z) * g_FogVolumes_1._m0[_17017]._m6), saturate((1.0 - max(_16962.x, _16962.y)) * g_FogVolumes_1._m0[_17017]._m7));
	                    }
	                    else
	                    {
	                        _12501 = 1.0;
	                    }
	                    _12502 = _12501;
	                }
	                _8503 = _12502;
	            }
	            float _12861 = pow(saturate(_8503), g_FogVolumes_1._m0[_17017]._m5);
	            float _13137;
	            float _16306;
	            vec3 _16479;
	            float _17190;
	            if (_12861 > 0.0)
	            {
	                float _22689;
	                if (g_FogVolumes_1._m0[_17017]._m4 >= 0.0)
	                {
	                    _22689 = mix(_16305, g_FogVolumes_1._m0[_17017]._m4, _12861);
	                }
	                else
	                {
	                    _22689 = _16305;
	                }
	                float _24801;
	                if (g_FogVolumes_1._m0[_17017]._m8 >= 0.0)
	                {
	                    _24801 = g_FogVolumes_1._m0[_17017]._m8;
	                }
	                else
	                {
	                    _24801 = VolumetricFogConstantBuffer_t._m6;
	                }
	                _13137 = max(_13136, saturate(_12861 * g_FogVolumes_1._m0[_17017]._m2));
	                _16306 = _22689;
	                _17190 = mix(_17114, _24801, _12861);
	                _16479 = mix(_17133, g_FogVolumes_1._m0[_17017]._m10, vec3(_12861 * g_FogVolumes_1._m0[_17017]._m9));
	            }
	            else
	            {
	                _13137 = _13136;
	                _16306 = _16305;
	                _17190 = _17114;
	                _16479 = _17133;
	            }
	            _13138 = _13137;
	            _16307 = _16306;
	            _14891 = _17190;
	            _18360 = _16479;
	        }
	        else
	        {
	            _13138 = _13136;
	            _16307 = _16305;
	            _14891 = _17114;
	            _18360 = _17133;
	        }
	        _8896 = _17017 + 1u;
	        _13136 = _13138;
	        _16305 = _16307;
	        _17114 = _14891;
	        _17133 = _18360;
	        _17017 = _8896;
	        continue;
	    }
	    bool _12885;
	    if (_13136 > 0.0)
	    {
	        _12885 = _17114 > 0.0;
	    }
	    else
	    {
	        _12885 = false;
	    }
	    float _23381;
	    SPIRV_CROSS_BRANCH
	    if (_12885)
	    {
	        vec3 _24526 = (_5223 * VolumetricFogConstantBuffer_t._m5) + VolumetricFogConstantBuffer_t._m8;
	        vec3 _17206 = _24526 * mat3(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 0.0));
	        vec3 _17698 = floor(_17206);
	        vec3 _17217 = fract(_17206);
	        vec3 _23646 = step(_17217.xyx, _17217.yzz);
	        vec3 _24150 = vec3(1.0) - _23646;
	        vec3 _18658 = vec3(_24150.z, _23646.xy);
	        vec3 _15489 = vec3(_24150.xy, _23646.z);
	        vec3 _15873 = _17698 + min(_18658, _15489);
	        vec3 _10785 = _17698 + max(_18658, _15489);
	        vec3 _19492 = _17698 + vec3(1.0);
	        vec3 _11023 = _17698 * mat3(vec3(-0.5, 0.5, 0.5), vec3(0.5, -0.5, 0.5), vec3(0.5, 0.5, -0.5));
	        vec3 _6988 = _15873 * mat3(vec3(-0.5, 0.5, 0.5), vec3(0.5, -0.5, 0.5), vec3(0.5, 0.5, -0.5));
	        vec3 _9153 = _10785 * mat3(vec3(-0.5, 0.5, 0.5), vec3(0.5, -0.5, 0.5), vec3(0.5, 0.5, -0.5));
	        vec3 _11402 = _19492 * mat3(vec3(-0.5, 0.5, 0.5), vec3(0.5, -0.5, 0.5), vec3(0.5, 0.5, -0.5));
	        vec3 _22556 = _24526 - _11023;
	        vec3 _7022 = _24526 - _6988;
	        vec3 _6660 = _24526 - _9153;
	        vec3 _23519 = _24526 - _11402;
	        vec3 _13139;
	        vec3 _13998;
	        vec3 _16308;
	        vec3 _23299;
	        if (any(bvec3(true)))
	        {
	            vec4 _11357 = vec4(_11023.x, _6988.x, _9153.x, _11402.x);
	            vec4 _11358 = vec4(_11023.y, _6988.y, _9153.y, _11402.y);
	            vec4 _21342 = vec4(_11023.z, _6988.z, _9153.z, _11402.z);
	            vec4 _6786 = _11357 - vec4(127.0) * trunc(_11357 / vec4(127.0));
	            vec4 _23632 = _11358 - vec4(241.0) * trunc(_11358 / vec4(241.0));
	            vec4 _17959 = _21342 - vec4(96.0) * trunc(_21342 / vec4(96.0));
	            _13139 = floor((vec3(_6786.w, _23632.w, _17959.w) * mat3(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 0.0))) + vec3(0.5));
	            _16308 = floor((vec3(_6786.z, _23632.z, _17959.z) * mat3(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 0.0))) + vec3(0.5));
	            _13998 = floor((vec3(_6786.y, _23632.y, _17959.y) * mat3(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 0.0))) + vec3(0.5));
	            _23299 = floor((vec3(_6786.x, _23632.x, _17959.x) * mat3(vec3(0.0, 1.0, 1.0), vec3(1.0, 0.0, 1.0), vec3(1.0, 1.0, 0.0))) + vec3(0.5));
	        }
	        else
	        {
	            _13139 = _19492;
	            _16308 = _10785;
	            _13998 = _15873;
	            _23299 = _17698;
	        }
	        vec4 _21380 = vec4(_23299.z, _13998.z, _16308.z, _13139.z);
	        vec4 _6231 = _21380 - vec4(289.0) * trunc(_21380 / vec4(289.0));
	        vec4 _12542 = ((_6231 * 34.0) + vec4(10.0)) * _6231;
	        vec4 _20663 = (_12542 - vec4(289.0) * trunc(_12542 / vec4(289.0))) + vec4(_23299.y, _13998.y, _16308.y, _13139.y);
	        vec4 _20780 = _20663 - vec4(289.0) * trunc(_20663 / vec4(289.0));
	        vec4 _12543 = ((_20780 * 34.0) + vec4(10.0)) * _20780;
	        vec4 _20664 = (_12543 - vec4(289.0) * trunc(_12543 / vec4(289.0))) + vec4(_23299.x, _13998.x, _16308.x, _13139.x);
	        vec4 _20781 = _20664 - vec4(289.0) * trunc(_20664 / vec4(289.0));
	        vec4 _13701 = ((_20781 * 34.0) + vec4(10.0)) * _20781;
	        vec4 _24036 = _13701 - vec4(289.0) * trunc(_13701 / vec4(289.0));
	        vec4 _15043 = _24036 * 3.883222103118896484375;
	        vec4 _13001 = _24036 * (-0.006920414976775646209716796875);
	        vec4 _21063 = _13001 + vec4(0.996539771556854248046875);
	        vec4 _13552 = sin(_15043);
	        vec4 _24568 = -cos(_15043);
	        vec4 _21781 = (_24036 * 0.10870562493801116943359375) + vec4(VolumetricFogConstantBuffer_t._m9);
	        vec4 _10050 = sin(_21781);
	        vec4 _17360 = cos(_21781);
	        vec4 _16959 = (_17360 * (_21063 * _24568)) + (_10050 * _13552);
	        vec4 _15971 = (_17360 * ((vec4(-0.996539771556854248046875) - _13001) * _13552)) + (_10050 * _24568);
	        vec4 _18719 = _17360 * sqrt(vec4(1.0) - (_21063 * _21063));
	        vec4 _12203 = max(vec4(0.5) - vec4(dot(_22556, _22556), dot(_7022, _7022), dot(_6660, _6660), dot(_23519, _23519)), vec4(0.0));
	        _23381 = saturate(_13136 + ((39.5 * dot((_12203 * _12203) * _12203, vec4(dot(vec3(_16959.x, _15971.x, _18719.x), _22556), dot(vec3(_16959.y, _15971.y, _18719.y), _7022), dot(vec3(_16959.z, _15971.z, _18719.z), _6660), dot(vec3(_16959.w, _15971.w, _18719.w), _23519)))) * _17114));
	    }
	    else
	    {
	        _23381 = _13136;
	    }
	    vec3 _19456;
	    SPIRV_CROSS_BRANCH
	    if (_23381 > 0.0)
	    {
	        vec2 _11489 = vec2(gl_GlobalInvocationID.xy) + vec2(0.5);
	        float _24226 = _11489.x;
	        vec4 _20165;
	        _20165.x = _24226;
	        _20165.y = float(VolumetricFogConstantBuffer_t._m14.y - 1u) - _11489.y;
	        float _24528 = _24714 + VolumetricFogConstantBuffer_t._m11;
	        vec3 _12746 = _3718 - PerViewConstantBuffer_t._m1.xyz;
	        vec3 _8730;
	        SPIRV_CROSS_BRANCH
	        if (PerViewLightingConstantBufferGpu_t._m3.w != 0.0)
	        {
	            float _10287;
	            SPIRV_CROSS_BRANCH
	            if (PerViewLightingConstantBufferGpu_t._m4 != 0)
	            {
	                int _23989;
	                int _9382;
	                vec3 _11806;
	                int _13039 = 0;
	                for (;;)
	                {
	                    if (!(_13039 < PerViewLightingConstantBufferGpu_t._m4))
	                    {
	                        _11806 = vec3(0.0);
	                        _9382 = -1;
	                        break;
	                    }
	                    vec4 _16719 = vec4(_12746, 1.0) * PerViewLightingConstantBufferGpu_t._m10._m0[_13039];
	                    float _12779 = _16719.x;
	                    if (max(abs(_12779), abs(_16719.y)) < PerViewLightingConstantBufferGpu_t._m5[_13039])
	                    {
	                        _11806 = vec3(_12779, _16719.yz);
	                        _9382 = _13039;
	                        break;
	                    }
	                    _23989 = _13039 + 1;
	                    _13039 = _23989;
	                    continue;
	                }
	                float _15297;
	                if (_9382 >= 0)
	                {
	                    vec2 _23490 = _20165.xy;
	                    _23490.x = _24226 + _24528;
	                    int _20353 = int(fract(52.98291778564453125 * fract(dot(_23490, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                    vec2 _22193 = vec2(1.0) - saturate((abs(_11806.xy) * vec2(PerViewLightingConstantBufferGpu_t._m7)) + vec2(PerViewLightingConstantBufferGpu_t._m6));
	                    float _20532 = saturate(_22193.x * _22193.y);
	                    mat2 _14940 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m15._m0[_20353].xy), vec2(-PerViewLightingConstantBufferGpu_t._m15._m0[_20353].y, PerViewLightingConstantBufferGpu_t._m15._m0[_20353].x));
	                    float _12244 = saturate(_11806.z + PerViewLightingConstantBufferGpu_t._m12._m0[_9382].y);
	                    float _13140;
	                    float _16324;
	                    _13140 = 0.0;
	                    _16324 = 0.0;
	                    uint _21567;
	                    float _13141;
	                    float _16325;
	                    uint _17018 = 0u;
	                    for (;;)
	                    {
	                        if (!(_17018 < 16u))
	                        {
	                            break;
	                        }
	                        vec4 _15408 = textureGather(sampler2D(g_tShadowDepthBufferDepthNoCmp, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_11806.xy + (_14940 * (_630[_17018].xy * PerViewLightingConstantBufferGpu_t._m12._m0[_9382].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m11._m0[_9382].zw, PerViewLightingConstantBufferGpu_t._m11._m0[_9382].xy));
	                        _13141 = _13140;
	                        _16325 = _16324;
	                        uint _14722;
	                        float _16615;
	                        float _23259;
	                        uint _17019 = 0u;
	                        for (;;)
	                        {
	                            if (!(_17019 < 4u))
	                            {
	                                break;
	                            }
	                            float _14149 = _15408[_17019] - _12244;
	                            float _9229 = step(0.0, _14149);
	                            _16615 = _16325 + _9229;
	                            _23259 = _13141 + (_9229 * _14149);
	                            _14722 = _17019 + 1u;
	                            _13141 = _23259;
	                            _16325 = _16615;
	                            _17019 = _14722;
	                            continue;
	                        }
	                        _21567 = _17018 + 1u;
	                        _13140 = _13141;
	                        _16324 = _16325;
	                        _17018 = _21567;
	                        continue;
	                    }
	                    float _19848 = (2.0 * saturate(_16324 * 0.015625)) - 1.0;
	                    float _22550 = float(int(sign(_19848)));
	                    float _14815 = 1.0 - (_22550 * _19848);
	                    float _12987 = 0.5 - (0.5 * ((1.0 - mix((_14815 * _14815) * _14815, _14815, saturate((_13140 / _16324) / _12244))) * _22550));
	                    float _12503;
	                    SPIRV_CROSS_BRANCH
	                    if (_20532 < 1.0)
	                    {
	                        int _15335 = _9382 + 1;
	                        vec4 _23643 = vec4(_12746, 1.0) * PerViewLightingConstantBufferGpu_t._m10._m0[_15335];
	                        float _7934;
	                        if (_15335 < PerViewLightingConstantBufferGpu_t._m4)
	                        {
	                            float _12245 = saturate(_23643.z + PerViewLightingConstantBufferGpu_t._m12._m0[_15335].y);
	                            float _13142;
	                            float _16326;
	                            _13142 = 0.0;
	                            _16326 = 0.0;
	                            uint _21568;
	                            float _13143;
	                            float _16327;
	                            uint _17020 = 0u;
	                            for (;;)
	                            {
	                                if (!(_17020 < 16u))
	                                {
	                                    break;
	                                }
	                                vec4 _16409 = textureGather(sampler2D(g_tShadowDepthBufferDepthNoCmp, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_23643.xy + (_14940 * (_630[_17020].xy * PerViewLightingConstantBufferGpu_t._m12._m0[_15335].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m11._m0[_15335].zw, PerViewLightingConstantBufferGpu_t._m11._m0[_15335].xy));
	                                _13143 = _13142;
	                                _16327 = _16326;
	                                uint _14723;
	                                float _16616;
	                                float _23260;
	                                uint _17021 = 0u;
	                                for (;;)
	                                {
	                                    if (!(_17021 < 4u))
	                                    {
	                                        break;
	                                    }
	                                    float _14150 = _16409[_17021] - _12245;
	                                    float _9230 = step(0.0, _14150);
	                                    _16616 = _16327 + _9230;
	                                    _23260 = _13143 + (_9230 * _14150);
	                                    _14723 = _17021 + 1u;
	                                    _13143 = _23260;
	                                    _16327 = _16616;
	                                    _17021 = _14723;
	                                    continue;
	                                }
	                                _21568 = _17020 + 1u;
	                                _13142 = _13143;
	                                _16326 = _16327;
	                                _17020 = _21568;
	                                continue;
	                            }
	                            float _19849 = (2.0 * saturate(_16326 * 0.015625)) - 1.0;
	                            float _22551 = float(int(sign(_19849)));
	                            float _14816 = 1.0 - (_22551 * _19849);
	                            _7934 = 0.5 - (0.5 * ((1.0 - mix((_14816 * _14816) * _14816, _14816, saturate((_13142 / _16326) / _12245))) * _22551));
	                        }
	                        else
	                        {
	                            _7934 = 1.0;
	                        }
	                        _12503 = mix(_7934, _12987, _20532);
	                    }
	                    else
	                    {
	                        _12503 = _12987;
	                    }
	                    _15297 = _12503;
	                }
	                else
	                {
	                    _15297 = 1.0;
	                }
	                _10287 = mix(_15297, 1.0, saturate((length(_12746) * PerViewLightingConstantBufferGpu_t._m9) + PerViewLightingConstantBufferGpu_t._m8));
	            }
	            else
	            {
	                _10287 = 1.0;
	            }
	            _8730 = PerViewLightingConstantBufferGpu_t._m3.xyz * (_10287 * PerViewLightingConstantBufferGpu_t._m3.w);
	        }
	        else
	        {
	            _8730 = vec3(0.0);
	        }
	        vec2 _21589 = _20165.xy;
	        uvec2 _12083 = uvec2(_21589 - PerViewConstantBuffer_t._m0.xy) >> uvec2(PerViewLightingConstantBufferGpu_t._m1.x);
	        uint _13530 = PerViewLightingConstantBufferGpu_t._m0.y + (((_12083.y * PerViewLightingConstantBufferGpu_t._m1.y) + _12083.x) * PerViewLightingConstantBufferGpu_t._m0.z);
	        uint _23393 = PerViewLightingConstantBufferGpu_t._m0.x + (uint(clamp(_12217 * PerViewLightingConstantBufferGpu_t._m2.x, 0.0, PerViewLightingConstantBufferGpu_t._m2.y)) * PerViewLightingConstantBufferGpu_t._m0.z);
	        vec3 _13155;
	        _13155 = vec3(0.0);
	        uint _21569;
	        vec3 _13156;
	        uint _16208 = 0u;
	        for (;;)
	        {
	            if (!(_16208 < PerViewLightingConstantBufferGpu_t._m0.z))
	            {
	                break;
	            }
	            uint _14475 = subgroupOr(g_CullBits_1._m0[_13530 + _16208] & g_CullBits_1._m0[_23393 + _16208]);
	            _13156 = _13155;
	            uint _20344;
	            vec3 _12505;
	            uint _16209 = _14475;
	            for (;;)
	            {
	                if (!(_16209 != 0u))
	                {
	                    break;
	                }
	                int _12608 = int(uint(findLSB(_16209)) + (_16208 * 32u));
	                _20344 = _16209 & (_16209 - 1u);
	                do
	                {
	                    vec3 _14186 = _12746.xyz;
	                    vec4 _24893 = g_BarnLights_1._m0[_12608]._m0 * vec4(_14186, 1.0);
	                    vec3 _10521 = _24893.xyz / vec3(_24893.w);
	                    vec4 _22905;
	                    _22905.x = _10521.x;
	                    _22905.y = _10521.y;
	                    float _21775 = _10521.z;
	                    vec4 _20418 = _22905;
	                    _20418.z = _21775;
	                    bool _7424;
	                    if (all(greaterThan(_20418.xyz, vec3(-1.0, -1.0, 0.0))))
	                    {
	                        _7424 = all(lessThan(_20418.xyz, vec3(1.0)));
	                    }
	                    else
	                    {
	                        _7424 = false;
	                    }
	                    bool _12886;
	                    if (!_7424)
	                    {
	                        _12886 = true;
	                    }
	                    else
	                    {
	                        _12886 = !all(lessThanEqual(abs((g_BarnLights_1._m0[_12608]._m15 * vec4(_12746, 1.0)).xyz), vec3(1.0)));
	                    }
	                    if (_12886)
	                    {
	                        _12505 = _13156;
	                        break;
	                    }
	                    float _23571 = 2.0 * g_BarnLights_1._m0[_12608]._m5.y;
	                    float _18492 = (2.0 * g_BarnLights_1._m0[_12608]._m5.z) * g_BarnLights_1._m0[_12608]._m5.z;
	                    float _14805 = 2.0 * g_BarnLights_1._m0[_12608]._m5.x;
	                    float _9058 = _14805 * g_BarnLights_1._m0[_12608]._m5.y;
	                    float _17330 = 2.0 * g_BarnLights_1._m0[_12608]._m5.w;
	                    float _19825 = _17330 * g_BarnLights_1._m0[_12608]._m5.z;
	                    vec3 _16268 = vec3(_9058 - _19825, (1.0 - (_14805 * g_BarnLights_1._m0[_12608]._m5.x)) - _18492, (_23571 * g_BarnLights_1._m0[_12608]._m5.z) + (_17330 * g_BarnLights_1._m0[_12608]._m5.x)) * g_BarnLights_1._m0[_12608]._m6.z;
	                    float _21316;
	                    if (g_BarnLights_1._m0[_12608]._m3.z > 0.0)
	                    {
	                        _21316 = smoothstep(0.0, 1.0, _21775 * g_BarnLights_1._m0[_12608]._m3.z);
	                    }
	                    else
	                    {
	                        _21316 = 1.0;
	                    }
	                    float _19667;
	                    if (g_BarnLights_1._m0[_12608]._m3.w > 0.0)
	                    {
	                        _19667 = _21316 * smoothstep(0.0, 1.0, (1.0 - _21775) * g_BarnLights_1._m0[_12608]._m3.w);
	                    }
	                    else
	                    {
	                        _19667 = _21316;
	                    }
	                    vec3 _11179;
	                    float _13818;
	                    if (g_BarnLights_1._m0[_12608]._m2.w != 0.0)
	                    {
	                        vec3 _10017 = g_BarnLights_1._m0[_12608]._m2.xyz - _14186;
	                        float _18345 = dot(_10017, _10017);
	                        float _17647 = sqrt(_18345);
	                        vec3 _20958 = _10017 - _16268;
	                        vec3 _10210;
	                        do
	                        {
	                            vec3 _20229 = (_10017 + _16268) - _20958;
	                            float _25105 = dot(-_20958, _20229);
	                            if (_25105 <= 0.0)
	                            {
	                                _10210 = _20958;
	                                break;
	                            }
	                            else
	                            {
	                                _10210 = _20958 + (_20229 * min(1.0, _25105 / dot(_20229, _20229)));
	                                break;
	                            }
	                            break; // unreachable workaround
	                        } while(false);
	                        _11179 = _10017 / vec3(_17647);
	                        _13818 = ((_19667 * (g_BarnLights_1._m0[_12608]._m2.w / max(_18345, g_BarnLights_1._m0[_12608]._m2.w))) * smoothstep(0.0, 1.0, g_BarnLights_1._m0[_12608]._m3.x + (g_BarnLights_1._m0[_12608]._m3.y * _17647))) * saturate(g_BarnLights_1._m0[_12608]._m6.x + (g_BarnLights_1._m0[_12608]._m6.y * dot(vec3((1.0 - (_23571 * g_BarnLights_1._m0[_12608]._m5.y)) - _18492, _9058 + _19825, (_14805 * g_BarnLights_1._m0[_12608]._m5.z) - (_17330 * g_BarnLights_1._m0[_12608]._m5.y)), normalize(_10210))));
	                    }
	                    else
	                    {
	                        _11179 = g_BarnLights_1._m0[_12608]._m2.xyz;
	                        _13818 = _19667;
	                    }
	                    vec3 _20538 = ((g_BarnLights_1._m0[_12608]._m4.xyz * 1.0) * 1.0).xyz * _13818;
	                    vec3 _21548;
	                    SPIRV_CROSS_BRANCH
	                    if (g_BarnLights_1._m0[_12608]._m4.w == 0.0)
	                    {
	                        float _10342;
	                        do
	                        {
	                            vec2 _22154 = abs(_20418.xy);
	                            if (g_BarnLights_1._m0[_12608]._m9.z == 0.0)
	                            {
	                                _10342 = smoothstep(1.0, g_BarnLights_1._m0[_12608]._m9.x, _22154.x) * smoothstep(1.0, g_BarnLights_1._m0[_12608]._m9.y, _22154.y);
	                                break;
	                            }
	                            else
	                            {
	                                float _11473 = _22154.x;
	                                float _15266 = 2.0 / g_BarnLights_1._m0[_12608]._m9.z;
	                                float _15017 = _22154.y;
	                                float _23041 = (-0.5) * g_BarnLights_1._m0[_12608]._m9.z;
	                                float _11981 = (g_BarnLights_1._m0[_12608]._m9.x * g_BarnLights_1._m0[_12608]._m9.y) * pow(max(pow(g_BarnLights_1._m0[_12608]._m9.y * _11473, _15266) + pow(g_BarnLights_1._m0[_12608]._m9.x * _15017, _15266), 1.1754943508222875079687365372222e-38), _23041);
	                                float _16524 = pow(max(pow(_11473, _15266) + pow(_15017, _15266), 1.1754943508222875079687365372222e-38), _23041);
	                                if (_11981 < _16524)
	                                {
	                                    _10342 = smoothstep(_16524, _11981, 1.0);
	                                    break;
	                                }
	                                else
	                                {
	                                    _10342 = float(_16524 > 1.0);
	                                    break;
	                                }
	                                break; // unreachable workaround
	                            }
	                            break; // unreachable workaround
	                        } while(false);
	                        _21548 = _20538.xyz * _10342;
	                    }
	                    else
	                    {
	                        vec3 _12504;
	                        if (g_BarnLights_1._m0[_12608]._m4.w < 0.0)
	                        {
	                            vec4 _17795 = vec4(-g_BarnLights_1._m0[_12608]._m5.xyz, g_BarnLights_1._m0[_12608]._m5.w);
	                            vec4 _19008 = _17795.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                            vec3 _24989 = _19008.xyz;
	                            vec3 _23629 = vec4((-_11179).xyz, 0.0).xyz;
	                            float _15156 = -dot(_23629, _24989);
	                            vec3 _20479 = vec4((_23629 * _19008.w) + cross(_23629, _24989), _15156).xyz;
	                            vec3 _23592 = _17795.xyz;
	                            vec3 _12170 = ((_20479 * g_BarnLights_1._m0[_12608]._m5.w) + (_23592 * _15156)) + cross(_23592, _20479);
	                            vec3 _14081 = vec3(vec2(atan(_12170.y, -_12170.x) * 0.15915493667125701904296875, acos(_12170.z) * 0.3183098733425140380859375), -g_BarnLights_1._m0[_12608]._m4.w);
	                            vec2 _20562 = (_14081.xy * g_BarnLights_1._m0[_12608]._m9.zw) + g_BarnLights_1._m0[_12608]._m9.xy;
	                            vec3 _20489 = _14081;
	                            _20489.x = _20562.x;
	                            _20489.y = _20562.y;
	                            _12504 = _20538.xyz * textureLod(sampler3D(g_tLightCookieTexture, AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_Filter_MinMagMipLinear), _20489.xyz, 0.0).xyz;
	                        }
	                        else
	                        {
	                            vec3 _13791 = vec3(fma(_20418.xy, vec2(0.5, -0.5), vec2(0.5)), g_BarnLights_1._m0[_12608]._m4.w);
	                            vec2 _20561 = (_13791.xy * g_BarnLights_1._m0[_12608]._m9.zw) + g_BarnLights_1._m0[_12608]._m9.xy;
	                            vec3 _20488 = _13791;
	                            _20488.x = _20561.x;
	                            _20488.y = _20561.y;
	                            _12504 = _20538.xyz * textureLod(sampler3D(g_tLightCookieTexture, g_sCookieSampler), _20488.xyz, 0.0).xyz;
	                        }
	                        _21548 = _12504;
	                    }
	                    if (all(equal(_21548.xyz, vec3(0.0))))
	                    {
	                        _12505 = _13156;
	                        break;
	                    }
	                    bool _10513 = g_BarnLights_1._m0[_12608]._m8.z > 0.0;
	                    float _12887;
	                    if (_10513)
	                    {
	                        _12887 = g_BarnLights_1._m0[_12608]._m12;
	                    }
	                    else
	                    {
	                        _12887 = 0.0;
	                    }
	                    vec3 _19629;
	                    if (_10513)
	                    {
	                        vec3 _11396 = vec3(_22905.xy, 1.0 - _21775);
	                        vec3 _21709;
	                        if ((g_BarnLights_1._m0[_12608]._m13 & 4u) != 0u)
	                        {
	                            vec2 _6281 = _11396.yx * vec2(1.0, -1.0);
	                            vec3 _23714 = _11396;
	                            _23714.x = _6281.x;
	                            _23714.y = _6281.y;
	                            _21709 = _23714;
	                        }
	                        else
	                        {
	                            _21709 = _11396;
	                        }
	                        _21589.x = _24226 + (_24528 + float(_12608));
	                        int _21681 = int(fract(52.98291778564453125 * fract(dot(_21589, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                        uint _10021;
	                        if ((g_BarnLights_1._m0[_12608]._m13 & 2u) != 0u)
	                        {
	                            _10021 = PerViewLightingConstantBufferGpu_t._m14;
	                        }
	                        else
	                        {
	                            _10021 = PerViewLightingConstantBufferGpu_t._m13;
	                        }
	                        float _14548 = g_BarnLights_1._m0[_12608]._m22 * VolumetricFogConstantBuffer_t._m12;
	                        mat2 _14942 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m15._m0[_21681].xy), vec2(-PerViewLightingConstantBufferGpu_t._m15._m0[_21681].y, PerViewLightingConstantBufferGpu_t._m15._m0[_21681].x));
	                        float _12246 = saturate(_21709.z + 9.9999999747524270787835121154785e-07);
	                        float _13157;
	                        _13157 = 0.0;
	                        uint _21570;
	                        float _13158;
	                        uint _16210 = 0u;
	                        for (;;)
	                        {
	                            if (!(_16210 < 1u))
	                            {
	                                break;
	                            }
	                            vec4 _23854 = textureGather(sampler2D(g_bindless_Texture2D[_10021], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_21709.xy + (_14942 * (_630[_16210].xy * _14548)), vec2(-1.0), vec2(1.0)).xy, g_BarnLights_1._m0[_12608]._m8.zw, g_BarnLights_1._m0[_12608]._m8.xy));
	                            _13158 = _13157;
	                            uint _9583;
	                            float _19760;
	                            uint _16211 = 0u;
	                            for (;;)
	                            {
	                                if (!(_16211 < 4u))
	                                {
	                                    break;
	                                }
	                                _19760 = _13158 + step(0.0, _23854[_16211] - _12246);
	                                _9583 = _16211 + 1u;
	                                _13158 = _19760;
	                                _16211 = _9583;
	                                continue;
	                            }
	                            _21570 = _16210 + 1u;
	                            _13157 = _13158;
	                            _16210 = _21570;
	                            continue;
	                        }
	                        vec3 _24492 = _21548.xyz * mix(1.0, 1.0 - (_13157 * 0.25), _12887);
	                        if (all(equal(_24492.xyz, vec3(0.0))))
	                        {
	                            _12505 = _13156;
	                            break;
	                        }
	                        _19629 = _24492;
	                    }
	                    else
	                    {
	                        _19629 = _21548 * mix(1.0, 1.0, _12887);
	                    }
	                    _12505 = _13156.xyz + (_19629.xyz * 1.0);
	                    break;
	                } while(false);
	                _13156 = _12505;
	                _16209 = _20344;
	                continue;
	            }
	            _21569 = _16208 + 1u;
	            _13155 = _13156;
	            _16208 = _21569;
	            continue;
	        }
	        _19456 = ((_8730 * _16305) + _13155) * _17133;
	    }
	    else
	    {
	        _19456 = vec3(0.0);
	    }
	    imageStore(_3982, ivec3(uvec3(gl_GlobalInvocationID.xy, gl_GlobalInvocationID.z)), vec4(sqrt(_19456.xyz * vec3(0.5)), _23381));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
