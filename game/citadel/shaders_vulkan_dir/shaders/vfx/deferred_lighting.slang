//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Deferred lighting";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: cs
}

MODES
{
	Deferred();
	ToolsVis(S_MODE_TOOLS_VIS);
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
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	DynamicCombo( D_AREA_LIGHTS, 0..1 );
	DynamicCombo( D_SHADOW_QUALITY, 0..2 );
	DynamicCombo( D_AMBIENT_OCCLUSION, 0..1 );
	DynamicCombo( D_DISTANCE_FIELD_OCCLUSION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_DECAL_SHADOWS_ENABLED, 0..1 );
	DynamicCombo( D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS, 0..1 );
	DynamicComboRule( Requires( D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS, D_DECAL_SHADOWS_ENABLED ) );
	
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	float g_fToolsVisMaxLightingComplexity < Default(8); Attribute("g_fToolsVisMaxLightingComplexity"); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	Texture2DArray g_tBRDFLookup < Attribute("BRDFLookup"); SrgbRead(false); >;
	Texture2D g_tDecalShadows < Attribute("g_tDecalShadows"); SrgbRead(false); >;
	Texture2DArray g_tDistanceFieldAmbientOcclusion < Attribute("DistanceFieldAmbientOcclusion"); SrgbRead(false); >;
	Texture2D g_tGBufferDepth < Attribute("SceneDepth"); SrgbRead(false); >;
	Texture2D g_tGBufferTarget0 < Attribute("GBufferTarget0"); SrgbRead(false); >;
	Texture2D g_tGBufferTarget1 < Attribute("GBufferTarget1"); SrgbRead(true); >;
	Texture2D g_tGBufferTarget2 < Attribute("GBufferTarget2"); SrgbRead(false); >;
	Texture2D g_tGBufferTarget3 < Attribute("GBufferTarget3"); SrgbRead(false); >;
	Texture2D g_tGpuPreviewLightingBakedShadow < Attribute("GpuPreviewLightingBakedShadow"); SrgbRead(false); >;
	Texture2D g_tGpuPreviewLightingIndirectDiffuse < Attribute("GpuPreviewLightingIndirectDiffuse"); SrgbRead(false); >;
	RWTexture2D<float4> g_tIntermediateRT < Attribute("GBufferLight"); >;
	Texture3D g_tLightCookieTexture < Attribute("LightCookieTexture"); SrgbRead(true); >;
	Texture2DArray g_tLightmapDebugChart < Attribute("debug_chart_color"); SrgbRead(false); >;
	Texture2DArray g_tLightmapIrradiance_SH2_B < Attribute("directional_irradiance_sh2_b"); SrgbRead(false); >;
	Texture2DArray g_tLightmapIrradiance_SH2_DC < Attribute("directional_irradiance_sh2_dc"); SrgbRead(false); >;
	Texture2DArray g_tLightmapIrradiance_SH2_G < Attribute("directional_irradiance_sh2_g"); SrgbRead(false); >;
	Texture2DArray g_tLightmapIrradiance_SH2_R < Attribute("directional_irradiance_sh2_r"); SrgbRead(false); >;
	Texture2DArray g_tLightmapShadows < Attribute("direct_light_shadows"); SrgbRead(false); >;
	Texture2D g_tSSAO < Attribute("SSAO"); SrgbRead(false); >;
	Texture2D g_tShadowDepthBufferDepthNoCmp < Attribute("ShadowDepthBufferNoCmp"); SrgbRead(false); >;
	float4 g_vDropShadowParams < Attribute("g_vDropShadowParams"); UiType(VectorText); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3705 (name: PerViewLightProbeVolumeConstantBuffer_t), member index 0 (name: _m0) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	#extension GL_KHR_shader_subgroup_arithmetic : require
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
	layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;
	
	struct _2523
	{
	    vec4 _m0[3];
	};
	
	struct _1315
	{
	    vec4 _m0[4];
	};
	
	struct _2036
	{
	    mat4x3 _m0;
	    vec3 _m1;
	    uint _m2;
	    vec3 _m3;
	    uint _m4;
	    vec4 _m5;
	    vec3 _m6;
	    uint _m7;
	    vec3 _m8;
	    uint _m9;
	    vec4 _m10;
	};
	
	struct _1434
	{
	    _2036 _m0[128];
	};
	
	struct _1196
	{
	    mat4 _m0[4];
	};
	
	struct _2617
	{
	    vec4 _m0[16];
	};
	
	struct _1664
	{
	    mat4x3 _m0;
	    vec3 _m1;
	    vec3 _m2;
	    uint _m3;
	    vec4 _m4;
	    vec3 _m5;
	    uint _m6;
	    vec3 _m7;
	};
	
	struct _2436
	{
	    _1664 _m0[400];
	};
	
	const vec2 _1207[32] = vec2[](vec2(0.64073598384857177734375, -0.355204999446868896484375), vec2(-0.725410997867584228515625, -0.68831598758697509765625), vec2(-0.18509499728679656982421875, 0.72264802455902099609375), vec2(0.770596027374267578125, 0.63732397556304931640625), vec2(-0.92144501209259033203125, 0.19699700176715850830078125), vec2(0.07657100260257720947265625, -0.9882199764251708984375), vec2(-0.13480000197887420654296875, -0.0908536016941070556640625), vec2(0.32010900974273681640625, 0.2572410106658935546875), vec2(0.994020998477935791015625, 0.1091929972171783447265625), vec2(0.3049339950084686279296875, 0.952373981475830078125), vec2(-0.698576986789703369140625, 0.715534985065460205078125), vec2(0.548700988292694091796875, -0.836018979549407958984375), vec2(-0.4431590139865875244140625, 0.29612100124359130859375), vec2(0.15067000687122344970703125, -0.489731013774871826171875), vec2(-0.62382900714874267578125, -0.20816700160503387451171875), vec2(-0.29477798938751220703125, -0.5965449810028076171875), vec2(0.334086000919342041015625, -0.12820799648761749267578125), vec2(-0.061983101069927215576171875, 0.311747014522552490234375), vec2(0.166112005710601806640625, 0.616259992122650146484375), vec2(-0.28912699222564697265625, -0.95729100704193115234375), vec2(-0.987479984760284423828125, -0.15774500370025634765625), vec2(0.6375010013580322265625, 0.06515710055828094482421875), vec2(0.971376001834869384765625, -0.23754499852657318115234375), vec2(-0.017059899866580963134765625, 0.98058998584747314453125), vec2(-0.4425640106201171875, 0.89673697948455810546875), vec2(0.4861899912357330322265625, 0.518723011016845703125), vec2(-0.725271999835968017578125, 0.4199649989604949951171875), vec2(0.78141701221466064453125, -0.62400901317596435546875), vec2(-0.89922702312469482421875, -0.43748199939727783203125), vec2(0.769218981266021728515625, 0.3337199985980987548828125), vec2(-0.414411008358001708984375, 0.0037537799216806888580322265625), vec2(0.262856006622314453125, -0.75951397418975830078125));
	
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
	
	struct _1226
	{
	    vec2 _m0;
	    vec2 _m1;
	    float _m2;
	    vec3 _m3;
	    vec3 _m4;
	};
	
	layout(set = 0) uniform _1226 PerViewConstantBuffer_t;
	
	struct _1296
	{
	    vec4 g_vPixelToProj;
	    mat4 g_mHighPrecisionWorldFromProj;
	};
	
	layout(set = 0) uniform _1296 _Globals_;
	
	struct _1044
	{
	    uint _m0;
	    vec4 _m1;
	};
	
	layout(set = 0) uniform _1044 PerViewConstantBufferCitadel_t;
	
	struct _1655
	{
	    vec4 _m0;
	    _2523 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    uvec4 _m4;
	    uvec4 _m5;
	    uvec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    _1434 _m9;
	    vec4 _m10;
	    vec4 _m11;
	    vec4 _m12;
	    int _m13;
	    int _m14;
	    vec4 _m15;
	    float _m16;
	    float _m17;
	    float _m18;
	    float _m19;
	    _1196 _m20;
	    _1315 _m21;
	    _1315 _m22;
	    uint _m23;
	    _2617 _m24;
	};
	
	layout(set = 3) uniform _1655 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 3, binding = 30, std430) readonly buffer g_CullBits
	{
	    uint _m0[];
	} g_CullBits_1;
	
	struct _2820
	{
	    _2436 _m0;
	};
	
	layout(set = 0) uniform _2820 PerViewLightProbeVolumeConstantBuffer_t;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_BarnLights
	{
	    layout(row_major) _200 _m0[];
	} g_BarnLights_1;
	
	layout(set = 0, binding = 59) uniform texture2D g_tGBufferDepth;
	layout(set = 0, binding = 55) uniform texture2D g_tGBufferTarget0;
	layout(set = 0, binding = 56) uniform texture2D g_tGBufferTarget1;
	layout(set = 0, binding = 57) uniform texture2D g_tGBufferTarget2;
	layout(set = 0, binding = 58) uniform texture2D g_tGBufferTarget3;
	layout(set = 4, binding = 46) uniform textureCubeArray g_bindless_TextureCubeArray[65536];
	layout(set = 0, binding = 20) uniform sampler AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_AllowGlobalMipBiasOverride_0_Filter_MinMagMipLinear;
	layout(set = 4, binding = 46) uniform texture3D g_bindless_Texture3D_float4[65536];
	layout(set = 0, binding = 17) uniform sampler AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint;
	layout(set = 0, binding = 34) uniform texture2DArray g_tBRDFLookup;
	layout(set = 0, binding = 46) uniform texture2D g_tShadowDepthBufferDepthNoCmp;
	layout(set = 0, binding = 19) uniform sampler AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_Filter_MinMagMipLinear;
	layout(set = 0, binding = 33) uniform texture3D g_tLightCookieTexture;
	layout(set = 0, binding = 24) uniform sampler g_sCookieSampler;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 0, binding = 158) uniform writeonly image2D _4309;
	
	void main()
	{
	    do
	    {
	        if (any(greaterThan(gl_GlobalInvocationID.xy, uvec2(PerViewConstantBuffer_t._m1.xy))))
	        {
	            break;
	        }
	        ivec2 _5509 = ivec2(gl_GlobalInvocationID.xy) + ivec2(PerViewConstantBuffer_t._m0.xy);
	        ivec2 _7871 = _5509.xy;
	        ivec2 _9298 = ivec3(_7871, 0).xy;
	        vec4 _21502 = texelFetch(g_tGBufferDepth, _9298, 0);
	        float _18947 = _21502.x;
	        if (_18947 <= 1.0000000116860974230803549289703e-07)
	        {
	            break;
	        }
	        vec4 _8354 = texelFetch(g_tGBufferTarget0, _9298, 0);
	        vec4 _23185 = texelFetch(g_tGBufferTarget1, _9298, 0);
	        vec4 _23186 = texelFetch(g_tGBufferTarget2, _9298, 0);
	        vec4 _3300 = texelFetch(g_tGBufferTarget3, _9298, 0);
	        vec4 _14015 = vec4((vec2(_5509) * _Globals_.g_vPixelToProj.xy) + _Globals_.g_vPixelToProj.zw, 1.0, 1.0) * _Globals_.g_mHighPrecisionWorldFromProj;
	        vec3 _10521 = _14015.xyz / vec3(_14015.w);
	        vec4 _22905;
	        _22905.x = _10521.x;
	        _22905.y = _10521.y;
	        _22905.z = _10521.z;
	        float _10356 = float(PerViewConstantBufferCitadel_t._m0);
	        vec3 _6598 = normalize((_8354.xyz * 2.0) - vec3(1.0));
	        float _25060 = _23185.x;
	        vec3 _12345 = vec3(_25060, _23185.yz);
	        uint _14359 = uint(_23185.w * 255.0);
	        bool _11391 = (_14359 & 8u) != 0u;
	        float _20556 = max(_23186.x, 0.0500000007450580596923828125);
	        vec2 _21808 = vec2(_20556);
	        float _8108 = _23186.w;
	        vec3 _21709;
	        if ((_14359 & 2u) != 0u)
	        {
	            _21709 = vec3(0.0);
	        }
	        else
	        {
	            vec3 _12501;
	            if (_11391 ? true : ((_14359 & 16u) != 0u))
	            {
	                uint _24470 = (uint(_3300.x * 65535.0) << uint(16)) | uint(_3300.y * 65535.0);
	                _12501 = ldexp(vec3(uvec3(_24470, _24470 >> uint(9), _24470 >> uint(18)) & uvec3(511u)), ivec3(int(_24470 >> uint(27)) - 24));
	            }
	            else
	            {
	                _12501 = vec3(0.0);
	            }
	            _21709 = _12501;
	        }
	        vec3 _10967 = (_22905.xyz / vec3(dot(PerViewConstantBuffer_t._m4, _22905.xyz))).xyz * (PerViewConstantBuffer_t._m2 / _18947);
	        vec3 _12252 = _10967 + PerViewConstantBuffer_t._m3.xyz;
	        if (_8354.w != 0.0)
	        {
	            break;
	        }
	        vec2 _24028 = vec2(_7871) + vec2(0.5);
	        float _7577 = _24028.x;
	        vec4 _20488;
	        _20488.x = _7577;
	        _20488.y = _24028.y;
	        vec3 _8834 = normalize(_12252.xyz - PerViewConstantBuffer_t._m3.xyz);
	        vec3 _13353 = -_8834;
	        vec3 _24254 = _13353.xyz;
	        vec3 _18460 = _6598.xyz;
	        float _19276 = saturate(dot(_24254, _18460));
	        vec3 _8639 = mix(vec3(0.039999999105930328369140625), _12345.xyz, vec3(_8108)) * saturate(max(_25060, max(_23185.y, _23185.z)) * 25.0);
	        float _20373 = _20556 * _20556;
	        vec3 _11657 = vec3(1.0) + (_8639 * (((2.0 * _20373) * _20373) * _19276));
	        vec3 _17270 = mix(vec3(0.0), _21709, bvec3(_11391));
	        bool _21397 = !_11391;
	        float _13866 = PerViewLightingConstantBufferGpu_t._m8.y * sqrt(_20556);
	        vec3 _13379 = _12252.xyz;
	        float _9445 = saturate(1.0 - _20373);
	        vec3 _25271 = normalize(mix(_6598, reflect(_8834.xyz, _6598.xyz).xyz, vec3(_9445 * (sqrt(_9445) + _20373))));
	        vec2 _12512 = _20488.xy;
	        uvec2 _12083 = uvec2(_12512 - PerViewConstantBuffer_t._m0.xy) >> uvec2(PerViewLightingConstantBufferGpu_t._m6.x);
	        uint _7519 = (_12083.y * PerViewLightingConstantBufferGpu_t._m6.y) + _12083.x;
	        uint _13530 = PerViewLightingConstantBufferGpu_t._m5.y + (_7519 * PerViewLightingConstantBufferGpu_t._m5.z);
	        uint _6271 = uint(clamp(dot(PerViewConstantBuffer_t._m4.xyz, _10967) * PerViewLightingConstantBufferGpu_t._m7.x, 0.0, PerViewLightingConstantBufferGpu_t._m7.y));
	        uint _23393 = PerViewLightingConstantBufferGpu_t._m5.x + (_6271 * PerViewLightingConstantBufferGpu_t._m5.z);
	        vec4 _13136;
	        vec4 _16305;
	        vec3 _17114;
	        float _17115;
	        vec3 _17116;
	        float _17117;
	        _13136 = vec4(0.0);
	        _16305 = vec4(0.0);
	        _17114 = vec3(0.0);
	        _17115 = 0.0;
	        _17116 = vec3(0.0);
	        _17117 = 0.0;
	        uint _21567;
	        vec4 _13137;
	        bool _15708;
	        vec3 _16306;
	        vec3 _17118;
	        float _17119;
	        vec4 _17120;
	        float _17121;
	        uint _9999 = 0u;
	        bool _15803 = true;
	        bool _16661;
	        for (;;)
	        {
	            _16661 = _9999 < PerViewLightingConstantBufferGpu_t._m5.z;
	            if (!(_16661 ? _15803 : false))
	            {
	                break;
	            }
	            uint _14475 = subgroupOr(g_CullBits_1._m0[_13530 + _9999] & g_CullBits_1._m0[_23393 + _9999]);
	            _13137 = _13136;
	            _16306 = _17114;
	            _17118 = _17116;
	            _17119 = _17115;
	            _17120 = _16305;
	            _17121 = _17117;
	            _15708 = _15803;
	            uint _10154;
	            vec4 _13141;
	            vec3 _16307;
	            bool _16480;
	            vec3 _17122;
	            float _17123;
	            vec4 _17124;
	            float _17190;
	            uint _10864 = _14475;
	            bool _19484;
	            for (;;)
	            {
	                _19484 = _10864 != 0u;
	                if (!(_19484 ? _15708 : false))
	                {
	                    break;
	                }
	                uint _18153 = uint(findLSB(_10864));
	                int _12608 = int(_18153 + (_9999 * 32u));
	                _10154 = _10864 & (_10864 - 1u);
	                vec3 _13138;
	                vec3 _14177;
	                float _15291;
	                SPIRV_CROSS_BRANCH
	                if ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m7 & 1u) != 0u)
	                {
	                    vec3 _8141 = _12252 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m6;
	                    float _8220 = 1.0 - saturate((length(_8141) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.x) + PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.y);
	                    if (_8220 == 0.0)
	                    {
	                        _13141 = _13137;
	                        _16307 = _16306;
	                        _17122 = _17118;
	                        _17123 = _17119;
	                        _17124 = _17120;
	                        _17190 = _17121;
	                        _16480 = _15708;
	                        _13137 = _13141;
	                        _16306 = _16307;
	                        _17118 = _17122;
	                        _17119 = _17123;
	                        _17120 = _17124;
	                        _17121 = _17190;
	                        _15708 = _16480;
	                        _10864 = _10154;
	                        continue;
	                    }
	                    float _8914 = dot(_8141, _25271);
	                    float _11028 = (_8914 * _8914) - (dot(_8141, _8141) - (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.z * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.z));
	                    vec3 _12502;
	                    if (_11028 > 0.0)
	                    {
	                        _12502 = normalize(_8141 + (_25271 * (sqrt(_11028) - _8914)));
	                    }
	                    else
	                    {
	                        _12502 = _25271;
	                    }
	                    _13138 = _12502;
	                    _14177 = _25271;
	                    _15291 = _8220;
	                }
	                else
	                {
	                    vec3 _24589 = PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_13379, 1.0);
	                    vec3 _7743 = _24589.xyz;
	                    vec3 _8793 = saturate((_7743 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m1) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                    vec3 _19651 = saturate((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m3 - _7743) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                    float _17265 = min(min(_8793.x, min(_8793.y, _8793.z)), min(_19651.x, min(_19651.y, _19651.z)));
	                    if (_17265 == 0.0)
	                    {
	                        _13141 = _13137;
	                        _16307 = _16306;
	                        _17122 = _17118;
	                        _17123 = _17119;
	                        _17124 = _17120;
	                        _17190 = _17121;
	                        _16480 = _15708;
	                        _13137 = _13141;
	                        _16306 = _16307;
	                        _17118 = _17122;
	                        _17119 = _17123;
	                        _17120 = _17124;
	                        _17121 = _17190;
	                        _15708 = _16480;
	                        _10864 = _10154;
	                        continue;
	                    }
	                    vec3 _15974 = PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_25271, 0.0);
	                    vec3 _16204 = _24589.xyz;
	                    vec3 _7648 = _15974.xyz;
	                    vec3 _11253 = max(((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m3.xyz - _16204) / _7648).xyz, ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m1.xyz - _16204) / _7648).xyz);
	                    _13138 = normalize(_16204 + (_7648 * abs(min(_11253.x, min(_11253.y, _11253.z)))));
	                    _14177 = _15974.xyz;
	                    _15291 = _17265;
	                }
	                float _19046 = (_15291 * _15291) * (((-2.0) * _15291) + 3.0);
	                float _16355 = _19046 * (1.0 - _17121);
	                float _6671 = _17121 + _16355;
	                float _8288;
	                vec4 _13140;
	                vec3 _15184;
	                if (_21397)
	                {
	                    vec4 _13139;
	                    vec3 _16381;
	                    float _16479;
	                    if (int(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9) >= 0)
	                    {
	                        float _21648 = _19046 * (1.0 - _17119);
	                        vec3 _24893 = PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m0 * vec4(_13379, 1.0);
	                        vec3 _6343 = _24893.xyz;
	                        vec3 _6393 = _6343;
	                        _6393.z = _24893.z * 0.16666667163372039794921875;
	                        vec3 _19423 = clamp(_6393.xyz, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m1, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m2);
	                        _19423.z = _19423.z * 6.0;
	                        vec3 _23126 = (_19423.xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7;
	                        _23126.z = _23126.z * 0.16666667163372039794921875;
	                        vec3 _15791 = mix(vec3(0.0, 0.16666667163372039794921875, 0.3333333432674407958984375), vec3(0.5, 0.666666686534881591796875, 0.833333313465118408203125), step(_18460, vec3(0.0)).xyz);
	                        vec3 _18910 = _18460 * _18460;
	                        _13139 = _13137 + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m6], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), ((saturate(_6343).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7).xyz, 0.0).xyzw * _21648);
	                        _16381 = _16306 + (((((textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), _23126.xyz + vec3(0.0, 0.0, _15791.x), 0.0).xyz * _18910.x) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), _23126.xyz + vec3(0.0, 0.0, _15791.y), 0.0).xyz * _18910.y)) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), _23126.xyz + vec3(0.0, 0.0, _15791.z), 0.0).xyz * _18910.z)).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m4.xyz) * _21648);
	                        _16479 = _17119 + _21648;
	                    }
	                    else
	                    {
	                        _13139 = _13137;
	                        _16381 = _16306;
	                        _16479 = _17119;
	                    }
	                    _13140 = _13139;
	                    _15184 = _16381;
	                    _8288 = _16479;
	                }
	                else
	                {
	                    _13140 = _13137;
	                    _15184 = _16306;
	                    _8288 = _17119;
	                }
	                bool _7462;
	                if (_6671 > 0.9900000095367431640625)
	                {
	                    bool _12503;
	                    if (_11391)
	                    {
	                        _12503 = true;
	                    }
	                    else
	                    {
	                        _12503 = _8288 > 0.9900000095367431640625;
	                    }
	                    _7462 = _12503;
	                }
	                else
	                {
	                    _7462 = false;
	                }
	                _13141 = _13140;
	                _16307 = _15184;
	                _17122 = _17118 + ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m8 * _16355) * textureLod(samplerCubeArray(g_bindless_TextureCubeArray[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m4], AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_AllowGlobalMipBiasOverride_0_Filter_MinMagMipLinear), vec4(mix(_13138, _14177.xyz, vec3(_20556)).xyz, float(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m2)), _13866).xyz);
	                _17123 = _8288;
	                _17124 = _17120 + (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m10 * _16355);
	                _17190 = _6671;
	                _16480 = !_7462;
	                _13137 = _13141;
	                _16306 = _16307;
	                _17118 = _17122;
	                _17119 = _17123;
	                _17120 = _17124;
	                _17121 = _17190;
	                _15708 = _16480;
	                _10864 = _10154;
	                continue;
	            }
	            _21567 = _9999 + 1u;
	            _13136 = _13137;
	            _16305 = _17120;
	            _17114 = _16306;
	            _17115 = _17119;
	            _17116 = _17118;
	            _17117 = _17121;
	            _15803 = _15708;
	            _9999 = _21567;
	            continue;
	        }
	        float _6272 = 1.0 - _17117;
	        vec4 _23875 = vec4(_25271.xyz, 1.0);
	        vec4 _19344 = vec4(_18460, 1.0);
	        vec3 _21166;
	        if (_21397)
	        {
	            _21166 = _17270.xyz + (_17114 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m1._m0[0].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m1._m0[1].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m1._m0[2].xyzw, _19344)) * (1.0 - _17115)));
	        }
	        else
	        {
	            _21166 = _17270;
	        }
	        vec4 _19694 = mix(vec4(0.0), _13136, bvec4(_21397));
	        vec4 _11487 = textureLod(sampler2DArray(g_tBRDFLookup, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), vec3((vec2(_20556, sqrt(1.0 - _19276)) * 0.984375) + vec2(0.0078125), 1.0).xyz, 0.0);
	        vec3 _8738 = mix(_11487.xxx, _11487.yyy, _8639);
	        float _12640 = 1.0 - _11487.y;
	        vec3 _16870 = vec3(1.0) - _8639;
	        vec3 _15517 = _8639 + (_16870 * vec3(0.0476190485060214996337890625));
	        vec3 _23170 = ((_8738 * _15517) / (vec3(1.0) - (_15517 * _12640))) * _12640;
	        float _13142 = 1.0 - dot(_19694, PerViewLightingConstantBufferGpu_t._m12);
	        float _11857 = (dot(_6598, PerViewLightingConstantBufferGpu_t._m10.xyz) > 0.0) ? _13142 : 0.0;
	        bool _12885;
	        if (PerViewLightingConstantBufferGpu_t._m13 != 0)
	        {
	            _12885 = _11857 > 0.0;
	        }
	        else
	        {
	            _12885 = false;
	        }
	        float _21710;
	        SPIRV_CROSS_BRANCH
	        if (_12885)
	        {
	            int _23989;
	            int _9382;
	            vec3 _11806;
	            int _13039 = 0;
	            for (;;)
	            {
	                if (!(_13039 < PerViewLightingConstantBufferGpu_t._m13))
	                {
	                    _11806 = vec3(0.0);
	                    _9382 = -1;
	                    break;
	                }
	                vec4 _16719 = vec4(_10967, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_13039];
	                float _12779 = _16719.x;
	                if (max(abs(_12779), abs(_16719.y)) < PerViewLightingConstantBufferGpu_t._m15[_13039])
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
	                vec2 _22600 = _12512;
	                _22600.x = _7577 + _10356;
	                int _20353 = int(fract(52.98291778564453125 * fract(dot(_22600, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                vec2 _22193 = vec2(1.0) - saturate((abs(_11806.xy) * vec2(PerViewLightingConstantBufferGpu_t._m17)) + vec2(PerViewLightingConstantBufferGpu_t._m16));
	                float _20532 = saturate(_22193.x * _22193.y);
	                mat2 _14940 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m24._m0[_20353].xy), vec2(-PerViewLightingConstantBufferGpu_t._m24._m0[_20353].y, PerViewLightingConstantBufferGpu_t._m24._m0[_20353].x));
	                float _12244 = saturate(_11806.z + PerViewLightingConstantBufferGpu_t._m22._m0[_9382].y);
	                float _13144;
	                float _16324;
	                _13144 = 0.0;
	                _16324 = 0.0;
	                uint _21568;
	                float _13145;
	                float _16325;
	                uint _17017 = 0u;
	                for (;;)
	                {
	                    if (!(_17017 < 8u))
	                    {
	                        break;
	                    }
	                    vec4 _6603 = textureGather(sampler2D(g_tShadowDepthBufferDepthNoCmp, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_11806.xy + (_14940 * (_1207[_17017].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_9382].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].xy));
	                    _13145 = _13144;
	                    _16325 = _16324;
	                    uint _14722;
	                    float _16615;
	                    float _23259;
	                    uint _17018 = 0u;
	                    for (;;)
	                    {
	                        if (!(_17018 < 4u))
	                        {
	                            break;
	                        }
	                        float _14149 = _6603[_17018] - _12244;
	                        float _9229 = step(0.0, _14149);
	                        _16615 = _16325 + _9229;
	                        _23259 = _13145 + (_9229 * _14149);
	                        _14722 = _17018 + 1u;
	                        _13145 = _23259;
	                        _16325 = _16615;
	                        _17018 = _14722;
	                        continue;
	                    }
	                    _21568 = _17017 + 1u;
	                    _13144 = _13145;
	                    _16324 = _16325;
	                    _17017 = _21568;
	                    continue;
	                }
	                float _19848 = (2.0 * saturate(_16324 * 0.03125)) - 1.0;
	                float _22550 = float(int(sign(_19848)));
	                float _14815 = 1.0 - (_22550 * _19848);
	                float _10969 = 0.5 - (0.5 * ((1.0 - mix((_14815 * _14815) * _14815, _14815, saturate((_13144 / _16324) / _12244))) * _22550));
	                float _23727;
	                if (_9382 > PerViewLightingConstantBufferGpu_t._m14)
	                {
	                    _23727 = _13142 * _10969;
	                }
	                else
	                {
	                    _23727 = _10969;
	                }
	                float _12504;
	                SPIRV_CROSS_BRANCH
	                if (_20532 < 1.0)
	                {
	                    int _15335 = _9382 + 1;
	                    vec4 _23643 = vec4(_10967, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_15335];
	                    float _6559;
	                    if (_15335 < PerViewLightingConstantBufferGpu_t._m13)
	                    {
	                        float _12245 = saturate(_23643.z + PerViewLightingConstantBufferGpu_t._m22._m0[_15335].y);
	                        float _13146;
	                        float _16326;
	                        _13146 = 0.0;
	                        _16326 = 0.0;
	                        uint _21569;
	                        float _13147;
	                        float _16327;
	                        uint _17019 = 0u;
	                        for (;;)
	                        {
	                            if (!(_17019 < 8u))
	                            {
	                                break;
	                            }
	                            vec4 _16409 = textureGather(sampler2D(g_tShadowDepthBufferDepthNoCmp, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_23643.xy + (_14940 * (_1207[_17019].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_15335].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].xy));
	                            _13147 = _13146;
	                            _16327 = _16326;
	                            uint _14723;
	                            float _16616;
	                            float _23260;
	                            uint _17020 = 0u;
	                            for (;;)
	                            {
	                                if (!(_17020 < 4u))
	                                {
	                                    break;
	                                }
	                                float _14150 = _16409[_17020] - _12245;
	                                float _9230 = step(0.0, _14150);
	                                _16616 = _16327 + _9230;
	                                _23260 = _13147 + (_9230 * _14150);
	                                _14723 = _17020 + 1u;
	                                _13147 = _23260;
	                                _16327 = _16616;
	                                _17020 = _14723;
	                                continue;
	                            }
	                            _21569 = _17019 + 1u;
	                            _13146 = _13147;
	                            _16326 = _16327;
	                            _17019 = _21569;
	                            continue;
	                        }
	                        float _19849 = (2.0 * saturate(_16326 * 0.03125)) - 1.0;
	                        float _22551 = float(int(sign(_19849)));
	                        float _14816 = 1.0 - (_22551 * _19849);
	                        _6559 = 0.5 - (0.5 * ((1.0 - mix((_14816 * _14816) * _14816, _14816, saturate((_13146 / _16326) / _12245))) * _22551));
	                    }
	                    else
	                    {
	                        _6559 = 1.0;
	                    }
	                    float _7934;
	                    if (_15335 > PerViewLightingConstantBufferGpu_t._m14)
	                    {
	                        _7934 = _13142 * _6559;
	                    }
	                    else
	                    {
	                        _7934 = _6559;
	                    }
	                    _12504 = mix(_7934, _23727, _20532);
	                }
	                else
	                {
	                    _12504 = _23727;
	                }
	                _15297 = _12504;
	            }
	            else
	            {
	                _15297 = _13142;
	            }
	            _21710 = mix(_15297, _13142, saturate((length(_10967) * PerViewLightingConstantBufferGpu_t._m19) + PerViewLightingConstantBufferGpu_t._m18));
	        }
	        else
	        {
	            _21710 = _11857;
	        }
	        vec3 _13064 = (PerViewConstantBufferCitadel_t._m1.xyz * PerViewLightingConstantBufferGpu_t._m11.xyz) * _21710;
	        bool _12886;
	        if (_21710 > 0.0)
	        {
	            _12886 = dot(PerViewLightingConstantBufferGpu_t._m10.xyz, _18460) > 0.0;
	        }
	        else
	        {
	            _12886 = false;
	        }
	        vec3 _9716;
	        vec3 _24878;
	        SPIRV_CROSS_BRANCH
	        if (_12886)
	        {
	            float _15489 = saturate(dot(_18460, PerViewLightingConstantBufferGpu_t._m10.xyz));
	            vec3 _7450 = normalize(PerViewLightingConstantBufferGpu_t._m10.xyz + _24254);
	            vec2 _17367 = max(_21808, vec2(0.0));
	            float _24205 = _17367.x;
	            float _21243 = dot(_7450, _6598);
	            float _6782 = saturate(dot(_6598, _13353));
	            float _22508 = _24205 * _24205;
	            float _12091 = _22508 * _22508;
	            float _13087 = (((_21243 * _12091) - _21243) * _21243) + 1.0;
	            float _16907 = 1.0 - _22508;
	            _9716 = PerViewLightingConstantBufferGpu_t._m3.xyz + (_13064 * _15489);
	            _24878 = ((((_8639 + (_16870 * pow(max(0.0, 1.0 - saturate(dot(PerViewLightingConstantBufferGpu_t._m10.xyz, _7450))), 5.0))) * (((_12091 / max(9.9999999392252902907785028219223e-09, _13087 * _13087)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_15489 * ((_6782 * _16907) + _22508)) + (_6782 * ((_15489 * _16907) + _22508))))) * _15489)) * _11657).xyz * 1.0) * _13064;
	        }
	        else
	        {
	            _9716 = PerViewLightingConstantBufferGpu_t._m3.xyz;
	            _24878 = vec3(0.0);
	        }
	        uint _12111 = PerViewLightingConstantBufferGpu_t._m4.y + (_7519 * PerViewLightingConstantBufferGpu_t._m4.z);
	        uint _23394 = PerViewLightingConstantBufferGpu_t._m4.x + (_6271 * PerViewLightingConstantBufferGpu_t._m4.z);
	        vec3 _13148;
	        vec3 _16328;
	        _13148 = _9716;
	        _16328 = _24878;
	        uint _21570;
	        vec3 _13149;
	        vec3 _16329;
	        uint _17021 = 0u;
	        for (;;)
	        {
	            if (!(_17021 < PerViewLightingConstantBufferGpu_t._m4.z))
	            {
	                break;
	            }
	            uint _14476 = subgroupOr(g_CullBits_1._m0[_12111 + _17021] & g_CullBits_1._m0[_23394 + _17021]);
	            _13149 = _16328;
	            _16329 = _13148;
	            uint _20344;
	            vec3 _13212;
	            vec3 _15670;
	            uint _17022 = _14476;
	            for (;;)
	            {
	                if (!(_17022 != 0u))
	                {
	                    break;
	                }
	                int _12609 = int(uint(findLSB(_17022)) + (_17021 * 32u));
	                _20344 = _17022 & (_17022 - 1u);
	                do
	                {
	                    vec3 _10086 = -normalize(_10967);
	                    float _15846 = 1.0 - dot(_19694, g_BarnLights_1._m0[_12609]._m10);
	                    if (_15846 == 0.0)
	                    {
	                        _13212 = _13149;
	                        _15670 = _16329;
	                        break;
	                    }
	                    vec3 _12573 = _10967.xyz;
	                    vec4 _24895 = g_BarnLights_1._m0[_12609]._m0 * vec4(_12573, 1.0);
	                    vec3 _10522 = _24895.xyz / vec3(_24895.w);
	                    vec4 _22906;
	                    _22906.x = _10522.x;
	                    _22906.y = _10522.y;
	                    float _21777 = _10522.z;
	                    vec4 _20418 = _22906;
	                    _20418.z = _21777;
	                    bool _7424;
	                    if (all(greaterThan(_20418.xyz, vec3(-1.0, -1.0, 0.0))))
	                    {
	                        _7424 = all(lessThan(_20418.xyz, vec3(1.0)));
	                    }
	                    else
	                    {
	                        _7424 = false;
	                    }
	                    bool _12887;
	                    if (!_7424)
	                    {
	                        _12887 = true;
	                    }
	                    else
	                    {
	                        _12887 = !all(lessThanEqual(abs((g_BarnLights_1._m0[_12609]._m15 * vec4(_10967, 1.0)).xyz), vec3(1.0)));
	                    }
	                    if (_12887)
	                    {
	                        _13212 = _13149;
	                        _15670 = _16329;
	                        break;
	                    }
	                    if (((dot(g_BarnLights_1._m0[_12609]._m16.xyz, _6598) - dot(_10967, _6598)) + (2.0 * g_BarnLights_1._m0[_12609]._m16.w)) < 0.0)
	                    {
	                        _13212 = _13149;
	                        _15670 = _16329;
	                        break;
	                    }
	                    float _23571 = 2.0 * g_BarnLights_1._m0[_12609]._m5.y;
	                    float _18492 = (2.0 * g_BarnLights_1._m0[_12609]._m5.z) * g_BarnLights_1._m0[_12609]._m5.z;
	                    float _14805 = 2.0 * g_BarnLights_1._m0[_12609]._m5.x;
	                    float _9058 = _14805 * g_BarnLights_1._m0[_12609]._m5.y;
	                    float _17330 = 2.0 * g_BarnLights_1._m0[_12609]._m5.w;
	                    float _19825 = _17330 * g_BarnLights_1._m0[_12609]._m5.z;
	                    vec3 _16268 = vec3(_9058 - _19825, (1.0 - (_14805 * g_BarnLights_1._m0[_12609]._m5.x)) - _18492, (_23571 * g_BarnLights_1._m0[_12609]._m5.z) + (_17330 * g_BarnLights_1._m0[_12609]._m5.x)) * g_BarnLights_1._m0[_12609]._m6.z;
	                    float _21316;
	                    if (g_BarnLights_1._m0[_12609]._m3.z > 0.0)
	                    {
	                        _21316 = smoothstep(0.0, 1.0, _21777 * g_BarnLights_1._m0[_12609]._m3.z);
	                    }
	                    else
	                    {
	                        _21316 = 1.0;
	                    }
	                    float _19667;
	                    if (g_BarnLights_1._m0[_12609]._m3.w > 0.0)
	                    {
	                        _19667 = _21316 * smoothstep(0.0, 1.0, (1.0 - _21777) * g_BarnLights_1._m0[_12609]._m3.w);
	                    }
	                    else
	                    {
	                        _19667 = _21316;
	                    }
	                    vec3 _11179;
	                    float _13818;
	                    if (g_BarnLights_1._m0[_12609]._m2.w != 0.0)
	                    {
	                        vec3 _10017 = g_BarnLights_1._m0[_12609]._m2.xyz - _12573;
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
	                        _13818 = ((_19667 * (g_BarnLights_1._m0[_12609]._m2.w / max(_18345, g_BarnLights_1._m0[_12609]._m2.w))) * smoothstep(0.0, 1.0, g_BarnLights_1._m0[_12609]._m3.x + (g_BarnLights_1._m0[_12609]._m3.y * _17647))) * saturate(g_BarnLights_1._m0[_12609]._m6.x + (g_BarnLights_1._m0[_12609]._m6.y * dot(vec3((1.0 - (_23571 * g_BarnLights_1._m0[_12609]._m5.y)) - _18492, _9058 + _19825, (_14805 * g_BarnLights_1._m0[_12609]._m5.z) - (_17330 * g_BarnLights_1._m0[_12609]._m5.y)), normalize(_10210))));
	                    }
	                    else
	                    {
	                        _11179 = g_BarnLights_1._m0[_12609]._m2.xyz;
	                        _13818 = _19667;
	                    }
	                    vec3 _20538 = ((g_BarnLights_1._m0[_12609]._m4.xyz * _15846) * _15846).xyz * _13818;
	                    vec3 _21548;
	                    SPIRV_CROSS_BRANCH
	                    if (g_BarnLights_1._m0[_12609]._m4.w == 0.0)
	                    {
	                        float _10342;
	                        do
	                        {
	                            vec2 _22154 = abs(_20418.xy);
	                            if (g_BarnLights_1._m0[_12609]._m9.z == 0.0)
	                            {
	                                _10342 = smoothstep(1.0, g_BarnLights_1._m0[_12609]._m9.x, _22154.x) * smoothstep(1.0, g_BarnLights_1._m0[_12609]._m9.y, _22154.y);
	                                break;
	                            }
	                            else
	                            {
	                                float _11473 = _22154.x;
	                                float _15266 = 2.0 / g_BarnLights_1._m0[_12609]._m9.z;
	                                float _15017 = _22154.y;
	                                float _23041 = (-0.5) * g_BarnLights_1._m0[_12609]._m9.z;
	                                float _11981 = (g_BarnLights_1._m0[_12609]._m9.x * g_BarnLights_1._m0[_12609]._m9.y) * pow(max(pow(g_BarnLights_1._m0[_12609]._m9.y * _11473, _15266) + pow(g_BarnLights_1._m0[_12609]._m9.x * _15017, _15266), 1.1754943508222875079687365372222e-38), _23041);
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
	                        vec3 _12505;
	                        if (g_BarnLights_1._m0[_12609]._m4.w < 0.0)
	                        {
	                            vec4 _17795 = vec4(-g_BarnLights_1._m0[_12609]._m5.xyz, g_BarnLights_1._m0[_12609]._m5.w);
	                            vec4 _19008 = _17795.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                            vec3 _24989 = _19008.xyz;
	                            vec3 _23629 = vec4((-_11179).xyz, 0.0).xyz;
	                            float _15156 = -dot(_23629, _24989);
	                            vec3 _20479 = vec4((_23629 * _19008.w) + cross(_23629, _24989), _15156).xyz;
	                            vec3 _23593 = _17795.xyz;
	                            vec3 _12170 = ((_20479 * g_BarnLights_1._m0[_12609]._m5.w) + (_23593 * _15156)) + cross(_23593, _20479);
	                            vec3 _14081 = vec3(vec2(atan(_12170.y, -_12170.x) * 0.15915493667125701904296875, acos(_12170.z) * 0.3183098733425140380859375), -g_BarnLights_1._m0[_12609]._m4.w);
	                            vec2 _20562 = (_14081.xy * g_BarnLights_1._m0[_12609]._m9.zw) + g_BarnLights_1._m0[_12609]._m9.xy;
	                            vec3 _20490 = _14081;
	                            _20490.x = _20562.x;
	                            _20490.y = _20562.y;
	                            _12505 = _20538.xyz * textureLod(sampler3D(g_tLightCookieTexture, AddressU_Wrap_AddressV_Wrap_AddressW_Wrap_Filter_MinMagMipLinear), _20490.xyz, 0.0).xyz;
	                        }
	                        else
	                        {
	                            vec3 _13791 = vec3(fma(_20418.xy, vec2(0.5, -0.5), vec2(0.5)), g_BarnLights_1._m0[_12609]._m4.w);
	                            vec2 _20561 = (_13791.xy * g_BarnLights_1._m0[_12609]._m9.zw) + g_BarnLights_1._m0[_12609]._m9.xy;
	                            vec3 _20489 = _13791;
	                            _20489.x = _20561.x;
	                            _20489.y = _20561.y;
	                            _12505 = _20538.xyz * textureLod(sampler3D(g_tLightCookieTexture, g_sCookieSampler), _20489.xyz, 0.0).xyz;
	                        }
	                        _21548 = _12505;
	                    }
	                    if (all(equal(_21548.xyz, vec3(0.0))))
	                    {
	                        _13212 = _13149;
	                        _15670 = _16329;
	                        break;
	                    }
	                    bool _10513 = g_BarnLights_1._m0[_12609]._m8.z > 0.0;
	                    float _12888;
	                    if (_10513)
	                    {
	                        _12888 = g_BarnLights_1._m0[_12609]._m12;
	                    }
	                    else
	                    {
	                        _12888 = 0.0;
	                    }
	                    vec3 _19629;
	                    if (_10513)
	                    {
	                        vec3 _11396 = vec3(_22906.xy, 1.0 - _21777);
	                        vec3 _21711;
	                        if ((g_BarnLights_1._m0[_12609]._m13 & 4u) != 0u)
	                        {
	                            vec2 _6281 = _11396.yx * vec2(1.0, -1.0);
	                            vec3 _23714 = _11396;
	                            _23714.x = _6281.x;
	                            _23714.y = _6281.y;
	                            _21711 = _23714;
	                        }
	                        else
	                        {
	                            _21711 = _11396;
	                        }
	                        vec2 _7339 = _12512;
	                        _7339.x = _7577 + (_10356 + float(_12609));
	                        int _23702 = int(fract(52.98291778564453125 * fract(dot(_7339, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                        mat2 _14941 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m24._m0[_23702].xy), vec2(-PerViewLightingConstantBufferGpu_t._m24._m0[_23702].y, PerViewLightingConstantBufferGpu_t._m24._m0[_23702].x));
	                        float _12246 = saturate(_21711.z + 9.9999999747524270787835121154785e-07);
	                        float _13155;
	                        _13155 = 0.0;
	                        uint _21571;
	                        float _13156;
	                        uint _16208 = 0u;
	                        for (;;)
	                        {
	                            if (!(_16208 < 1u))
	                            {
	                                break;
	                            }
	                            vec4 _23854 = textureGather(sampler2D(g_bindless_Texture2D[PerViewLightingConstantBufferGpu_t._m23], AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), fma(clamp(_21711.xy + (_14941 * (_1207[_16208].xy * g_BarnLights_1._m0[_12609]._m22)), vec2(-1.0), vec2(1.0)).xy, g_BarnLights_1._m0[_12609]._m8.zw, g_BarnLights_1._m0[_12609]._m8.xy));
	                            _13156 = _13155;
	                            uint _9583;
	                            float _19760;
	                            uint _16209 = 0u;
	                            for (;;)
	                            {
	                                if (!(_16209 < 4u))
	                                {
	                                    break;
	                                }
	                                _19760 = _13156 + step(0.0, _23854[_16209] - _12246);
	                                _9583 = _16209 + 1u;
	                                _13156 = _19760;
	                                _16209 = _9583;
	                                continue;
	                            }
	                            _21571 = _16208 + 1u;
	                            _13155 = _13156;
	                            _16208 = _21571;
	                            continue;
	                        }
	                        vec3 _24492 = _21548.xyz * mix(1.0, 1.0 - (_13155 * 0.25), _12888);
	                        if (all(equal(_24492.xyz, vec3(0.0))))
	                        {
	                            _13212 = _13149;
	                            _15670 = _16329;
	                            break;
	                        }
	                        _19629 = _24492;
	                    }
	                    else
	                    {
	                        _19629 = _21548 * mix(1.0, 1.0, _12888);
	                    }
	                    float _7221 = saturate(dot(_18460, _11179.xyz));
	                    vec3 _16230 = normalize(_11179.xyz + _10086.xyz);
	                    vec2 _16715 = max(_21808, vec2(g_BarnLights_1._m0[_12609]._m11));
	                    float _23802 = _16715.x;
	                    float _21244 = dot(_16230, _6598);
	                    float _6783 = saturate(dot(_6598, _10086.xyz));
	                    float _22509 = _23802 * _23802;
	                    float _12092 = _22509 * _22509;
	                    float _13088 = (((_21244 * _12092) - _21244) * _21244) + 1.0;
	                    float _16908 = 1.0 - _22509;
	                    _13212 = _13149.xyz + (((((_8639 + (_16870 * pow(max(0.0, 1.0 - saturate(dot(_11179.xyz, _16230))), 5.0))) * (((_12092 / max(9.9999999392252902907785028219223e-09, _13088 * _13088)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_7221 * ((_6783 * _16908) + _22509)) + (_6783 * ((_7221 * _16908) + _22509))))) * _7221)) * _11657).xyz * 1.0) * _19629);
	                    _15670 = _16329.xyz + (_19629 * _7221);
	                    break;
	                } while(false);
	                _13149 = _13212;
	                _16329 = _15670;
	                _17022 = _20344;
	                continue;
	            }
	            _21570 = _17021 + 1u;
	            _13148 = _16329;
	            _16328 = _13149;
	            _17021 = _21570;
	            continue;
	        }
	        vec3 _14163 = (((((_13148 + ((_21166 * (vec3(1.0) - (_8738 + _23170))).xyz * (((((_12345 * 2.040400028228759765625) - vec3(0.3323999941349029541015625)) * 1.0) - (((_12345 * 4.79510021209716796875) - vec3(0.6417000293731689453125)) * 1.0)) + (((_12345 * 2.755199909210205078125) + vec3(0.69029998779296875)) * 1.0)).xyz)) * ((_12345 * (1.0 - _8108)) * 1.0)) + (_12345 * (_23186.z * 10.0))) + _16328) + ((((_8738 * ((_17116 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m1._m0[0].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m1._m0[1].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m1._m0[2].xyzw, _23875)) * _6272)) * min(dot(_21166.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) / dot(_19344, (_16305 + (PerViewLightingConstantBufferGpu_t._m2 * _6272)).xyzw), max((_20556 * PerViewLightingConstantBufferGpu_t._m0.x) + PerViewLightingConstantBufferGpu_t._m0.y, 1.0)))) * 1.0) + ((_23170 * _21166) * 1.0)).xyz * saturate(pow(saturate(dot(_6598, _13353)) + 1.0, _20373)))).xyz;
	        imageStore(_4309, ivec2(uvec2(_5509)), vec4(_14163, 1.0));
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
