//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Shader used by the particle system";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	ToolsVis();
	FrontDepth(S_MODE_FRONT_DEPTH);
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_DRAW_AS_TRAIL, 0..1, "" );
	Feature( F_NORMAL_MAP, 0..1, "" );
	Feature( F_MOTION_VECTORS, 0..1, "" );
	Feature( F_TEXTURE_LAYERS, 0..4 (0="None", 1="TextureLayer1", 2="TextureLayer2", 3="TextureLayer3", 4="TextureLayer4"), "" );
	Feature( F_SPHERICAL_HARMONIC_LIGHTING, 0..1, "" );
	Feature( F_REVERSE_DEPTH, 0..1, "" );
	Feature( F_DISABLE_DEPTHTEST, 0..1, "" );
	Feature( F_MOD2X, 0..1, "" );
	Feature( F_LIGHTEN_MODE, 0..1, "" );
	Feature( F_REFRACT, 0..1, "" );
	Feature( F_HSV_SHIFT, 0..1, "" );
	FeatureRule( Allow1( F_NORMAL_MAP, F_SPHERICAL_HARMONIC_LIGHTING, F_DRAW_AS_TRAIL ), "Cannot use normal maps or spherical harmonic lighting with trails" );
	FeatureRule( Allow1( F_NORMAL_MAP, F_SPHERICAL_HARMONIC_LIGHTING, F_REFRACT ), "Normal map, spherical harmonic ligthing, and refract are not compatible" );
	FeatureRule( Requires( F_SPHERICAL_HARMONIC_LIGHTING, F_TEXTURE_LAYERS==0 ), "Maximum cbuffer allowances for spherical harmonic lighting + 1 motion" );
}

COMMON
{
	#include "system.fxc"
}

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_DRAW_AS_TRAIL, F_DRAW_AS_TRAIL );
	StaticCombo( S_NORMAL_MAP, F_NORMAL_MAP );
	StaticCombo( S_MOTION_VECTORS, F_MOTION_VECTORS );
	StaticCombo( S_SPHERICAL_HARMONIC_LIGHTING, F_SPHERICAL_HARMONIC_LIGHTING );
	StaticCombo( S_REFRACT, F_REFRACT );
	StaticCombo( S_TEXTURE_LAYERS, F_TEXTURE_LAYERS );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_NORMAL_MAP ) );
	StaticComboRule( Allow1( S_SPHERICAL_HARMONIC_LIGHTING, S_DRAW_AS_TRAIL ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_SPHERICAL_HARMONIC_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_REFRACT ) );
	StaticComboRule( Allow1( S_NORMAL_MAP, S_SPHERICAL_HARMONIC_LIGHTING, S_DRAW_AS_TRAIL ) );
	StaticComboRule( Allow1( S_NORMAL_MAP, S_SPHERICAL_HARMONIC_LIGHTING, S_REFRACT ) );
	StaticComboRule( Requires( S_SPHERICAL_HARMONIC_LIGHTING, S_TEXTURE_LAYERS==0 ) );
	DynamicCombo( D_SUPPORT_FRAME_CROP, 0..1 );
	DynamicCombo( D_MBOIT_PASS, 0..2 );
	DynamicCombo( D_PANORAMA_PARTICLE, 0..1 );
	DynamicComboRule( Allow1( S_NORMAL_MAP, D_SUPPORT_FRAME_CROP ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_SPHERICAL_HARMONIC_LIGHTING==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_NORMAL_MAP==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_MODE_TOOLS_WIREFRAME==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_MODE_FRONT_DEPTH==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, D_MBOIT_PASS==0 ) );
	
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3534 (name: PerViewConstantBufferCitadel_t), member index 18 (name: _m18) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
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
	
	out float gl_ClipDistance[1];
	
	struct _1625
	{
	    vec4 _m0[3];
	};
	
	struct _1854
	{
	    float _m0;
	    float _m1;
	    float _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	    mat4 _m6;
	};
	
	struct _1751
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
	
	struct _1352
	{
	    _2036 _m0[128];
	};
	
	struct _546
	{
	    mat4 _m0[4];
	};
	
	struct _1651
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
	
	struct _736
	{
	    _1664 _m0[400];
	};
	
	const vec2 _76[32] = vec2[](vec2(0.64073598384857177734375, -0.355204999446868896484375), vec2(-0.725410997867584228515625, -0.68831598758697509765625), vec2(-0.18509499728679656982421875, 0.72264802455902099609375), vec2(0.770596027374267578125, 0.63732397556304931640625), vec2(-0.92144501209259033203125, 0.19699700176715850830078125), vec2(0.07657100260257720947265625, -0.9882199764251708984375), vec2(-0.13480000197887420654296875, -0.0908536016941070556640625), vec2(0.32010900974273681640625, 0.2572410106658935546875), vec2(0.994020998477935791015625, 0.1091929972171783447265625), vec2(0.3049339950084686279296875, 0.952373981475830078125), vec2(-0.698576986789703369140625, 0.715534985065460205078125), vec2(0.548700988292694091796875, -0.836018979549407958984375), vec2(-0.4431590139865875244140625, 0.29612100124359130859375), vec2(0.15067000687122344970703125, -0.489731013774871826171875), vec2(-0.62382900714874267578125, -0.20816700160503387451171875), vec2(-0.29477798938751220703125, -0.5965449810028076171875), vec2(0.334086000919342041015625, -0.12820799648761749267578125), vec2(-0.061983101069927215576171875, 0.311747014522552490234375), vec2(0.166112005710601806640625, 0.616259992122650146484375), vec2(-0.28912699222564697265625, -0.95729100704193115234375), vec2(-0.987479984760284423828125, -0.15774500370025634765625), vec2(0.6375010013580322265625, 0.06515710055828094482421875), vec2(0.971376001834869384765625, -0.23754499852657318115234375), vec2(-0.017059899866580963134765625, 0.98058998584747314453125), vec2(-0.4425640106201171875, 0.89673697948455810546875), vec2(0.4861899912357330322265625, 0.518723011016845703125), vec2(-0.725271999835968017578125, 0.4199649989604949951171875), vec2(0.78141701221466064453125, -0.62400901317596435546875), vec2(-0.89922702312469482421875, -0.43748199939727783203125), vec2(0.769218981266021728515625, 0.3337199985980987548828125), vec2(-0.414411008358001708984375, 0.0037537799216806888580322265625), vec2(0.262856006622314453125, -0.75951397418975830078125));
	
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
	
	float _4;
	vec3 _5;
	vec4 _6;
	float _7;
	
	struct _2437
	{
	    mat4 _m0;
	    mat4 _m1;
	    vec4 _m2;
	    vec2 _m3;
	    vec2 _m4;
	    float _m5;
	    float _m6;
	    vec4 _m7;
	    vec3 _m8;
	    vec3 _m9;
	    vec3 _m10;
	};
	
	layout(set = 0) uniform _2437 PerViewConstantBuffer_t;
	
	struct _1882
	{
	    vec4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    vec4 _m4;
	    vec4 _m5;
	    vec2 _m6;
	    vec2 _m7;
	    uvec3 _m8;
	    uint _m9;
	};
	
	layout(set = 0) uniform _1882 SpritecardVertexControls_t;
	
	struct _1209
	{
	    vec4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    uvec2 _m3;
	};
	
	layout(set = 0) uniform _1209 SpriteCardPixelControls_t;
	
	struct _1080
	{
	    uint g_sBilinearClamp;
	    uint g_sTrilinearWrap;
	    uint g_sTrilinearWrap_NoGlobalMipBias;
	    uint g_sPointWrap;
	    uint g_sParticlePoint;
	    uint g_sCookieSampler;
	    uint g_sFogVolume;
	};
	
	layout(set = 0) uniform _1080 _Globals_;
	
	struct _2973
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    uint _m5;
	    uint _m6;
	    uint _m7;
	    uint _m8;
	    vec4 _m9;
	    vec4 _m10;
	    vec4 _m11;
	    vec4 _m12;
	    vec4 _m13;
	    vec4 _m14;
	    mat4 _m15;
	    vec4 _m16;
	    vec4 _m17;
	    _1854 _m18;
	};
	
	layout(set = 0) uniform _2973 PerViewConstantBufferCitadel_t;
	
	struct _2278
	{
	    vec4 _m0;
	    vec4 _m1;
	    _1625 _m2;
	    vec4 _m3;
	    vec4 _m4;
	    uvec4 _m5;
	    uvec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    _1352 _m9;
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
	    _546 _m20;
	    _1751 _m21;
	    _1751 _m22;
	    uint _m23;
	    uint _m24;
	    uint _m25;
	    _1651 _m26;
	};
	
	layout(set = 3) uniform _2278 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 3, binding = 30, std430) readonly buffer g_CullBits
	{
	    uint _m0[];
	} g_CullBits_1;
	
	struct _2431
	{
	    _736 _m0;
	};
	
	layout(set = 0) uniform _2431 PerViewLightProbeVolumeConstantBuffer_t;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_BarnLights
	{
	    layout(row_major) _200 _m0[];
	} g_BarnLights_1;
	
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube_float4[65536];
	layout(set = 4, binding = 46) uniform texture3D g_bindless_Texture3D_float4[65536];
	layout(set = 4, binding = 46) uniform textureCubeArray g_bindless_TextureCubeArray[65536];
	layout(set = 4, binding = 46) uniform texture2DArray g_bindless_Texture2DArray_float4[65536];
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_1[65536];
	
	layout(location = 0) in vec2 input_TEXCOORD0;
	layout(location = 1) in vec4 input_TEXCOORD1;
	layout(location = 2) in vec4 input_TEXCOORD2;
	layout(location = 3) in vec4 input_COLOR0;
	layout(location = 4) in vec3 input_POSITION0;
	layout(location = 5) in vec4 input_TEXCOORD3;
	layout(location = 6) in vec3 input_TEXCOORD4;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec3 output_3;
	layout(location = 4) flat out vec4 output_4;
	layout(location = 5) out vec4 output_5;
	layout(location = 6) out vec4 output_6;
	
	void main()
	{
	    float _22759 = (input_TEXCOORD0.x * 0.5) + 0.5;
	    float _21640 = (input_TEXCOORD0.y * (-0.5)) + 0.5;
	    vec4 _23160 = vec4(_22759, _21640, _22759, _21640);
	    vec4 _9982;
	    vec4 _23824;
	    if ((SpritecardVertexControls_t._m9 & 32768u) == 0u)
	    {
	        vec2 _11358 = vec2(SpritecardVertexControls_t._m5.xy);
	        vec2 _13746 = vec2(SpritecardVertexControls_t._m5.zw);
	        int _14314 = int(SpritecardVertexControls_t._m4.x);
	        float _15589 = float(((_14314 & 31) >> 4) & 1);
	        int _9473 = int(SpritecardVertexControls_t._m8.x);
	        uint _11758 = uint(_9473 & 15);
	        uint _12835 = uint(_14314 & 15);
	        uint _14730 = uint(int(SpritecardVertexControls_t._m4.y) & 15);
	        int _10222 = _9473 & 65535;
	        int _20705 = int(SpritecardVertexControls_t._m4.z);
	        uint _23506 = uint((_20705 >> 12) & 15);
	        uint _14704 = uint((int(SpriteCardPixelControls_t._m3.y) >> 16) & 15);
	        vec4 _15093;
	        do
	        {
	            if (_14704 == 2u)
	            {
	                float _20483;
	                do
	                {
	                    float _13197;
	                    bool _16075;
	                    switch (_11758)
	                    {
	                        case 1u:
	                        {
	                            _13197 = input_TEXCOORD1.z + 1.0;
	                            _16075 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13197 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16075 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13197 = input_TEXCOORD1.y;
	                            _16075 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13197 = input_TEXCOORD1.w;
	                            _16075 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13197 = input_COLOR0.w;
	                            _16075 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13197 = input_TEXCOORD3.w;
	                            _16075 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13197 = input_TEXCOORD3.x;
	                            _16075 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13197 = input_TEXCOORD3.y;
	                            _16075 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13197 = input_TEXCOORD3.z;
	                            _16075 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13197 = fract(input_TEXCOORD1.x * 5657.4111328125);
	                            _16075 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13197 = (fract(input_TEXCOORD1.x * 5657.4111328125) - 0.5) * 2.0;
	                            _16075 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13197 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 5657.4111328125)) + 1.0;
	                            _16075 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12478 = (fract(input_TEXCOORD1.x * 5657.4111328125) - 0.5) * 2.0;
	                            _13197 = (_12478 * input_TEXCOORD1.z) + float(int(sign(_12478)));
	                            _16075 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13197 = _4;
	                            _16075 = false;
	                            break;
	                        }
	                    }
	                    if (_16075)
	                    {
	                        _20483 = _13197;
	                        break;
	                    }
	                    _20483 = 1.0;
	                    break;
	                } while(false);
	                vec2 _11182 = vec2(1.0) / (_13746.xy * vec2(_20483));
	                float _12909;
	                do
	                {
	                    float _13198;
	                    bool _16076;
	                    switch (_12835)
	                    {
	                        case 1u:
	                        {
	                            _13198 = input_TEXCOORD1.z + 1.0;
	                            _16076 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13198 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16076 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13198 = input_TEXCOORD1.y;
	                            _16076 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13198 = input_TEXCOORD1.w;
	                            _16076 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13198 = input_COLOR0.w;
	                            _16076 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13198 = input_TEXCOORD3.w;
	                            _16076 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13198 = input_TEXCOORD3.x;
	                            _16076 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13198 = input_TEXCOORD3.y;
	                            _16076 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13198 = input_TEXCOORD3.z;
	                            _16076 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13198 = fract(input_TEXCOORD1.x * 1231.67041015625);
	                            _16076 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13198 = (fract(input_TEXCOORD1.x * 1231.67041015625) - 0.5) * 2.0;
	                            _16076 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13198 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1231.67041015625)) + 1.0;
	                            _16076 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12479 = (fract(input_TEXCOORD1.x * 1231.67041015625) - 0.5) * 2.0;
	                            _13198 = (_12479 * input_TEXCOORD1.z) + float(int(sign(_12479)));
	                            _16076 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13198 = _4;
	                            _16076 = false;
	                            break;
	                        }
	                    }
	                    if (_16076)
	                    {
	                        _12909 = _13198;
	                        break;
	                    }
	                    _12909 = 1.0;
	                    break;
	                } while(false);
	                float _19457;
	                do
	                {
	                    float _13199;
	                    bool _16077;
	                    switch (_14730)
	                    {
	                        case 1u:
	                        {
	                            _13199 = input_TEXCOORD1.z + 1.0;
	                            _16077 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13199 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16077 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13199 = input_TEXCOORD1.y;
	                            _16077 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13199 = input_TEXCOORD1.w;
	                            _16077 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13199 = input_COLOR0.w;
	                            _16077 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13199 = input_TEXCOORD3.w;
	                            _16077 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13199 = input_TEXCOORD3.x;
	                            _16077 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13199 = input_TEXCOORD3.y;
	                            _16077 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13199 = input_TEXCOORD3.z;
	                            _16077 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13199 = fract(input_TEXCOORD1.x * 1542.87060546875);
	                            _16077 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13199 = (fract(input_TEXCOORD1.x * 1542.87060546875) - 0.5) * 2.0;
	                            _16077 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13199 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1542.87060546875)) + 1.0;
	                            _16077 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12480 = (fract(input_TEXCOORD1.x * 1542.87060546875) - 0.5) * 2.0;
	                            _13199 = (_12480 * input_TEXCOORD1.z) + float(int(sign(_12480)));
	                            _16077 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13199 = _4;
	                            _16077 = false;
	                            break;
	                        }
	                    }
	                    if (_16077)
	                    {
	                        _19457 = _13199;
	                        break;
	                    }
	                    _19457 = 1.0;
	                    break;
	                } while(false);
	                vec2 _8770 = (_11358.xy * vec2(_12909, _19457)) + mix(vec2(0.0), fract(vec2(input_TEXCOORD1.x * 1718.4361572265625, input_TEXCOORD1.x * 1271.89013671875)), vec2(_15589));
	                float _22687;
	                do
	                {
	                    float _13200;
	                    bool _16078;
	                    switch (_23506)
	                    {
	                        case 1u:
	                        {
	                            _13200 = input_TEXCOORD1.z + 1.0;
	                            _16078 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13200 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16078 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13200 = input_TEXCOORD1.y;
	                            _16078 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13200 = input_TEXCOORD1.w;
	                            _16078 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13200 = input_COLOR0.w;
	                            _16078 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13200 = input_TEXCOORD3.w;
	                            _16078 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13200 = input_TEXCOORD3.x;
	                            _16078 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13200 = input_TEXCOORD3.y;
	                            _16078 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13200 = input_TEXCOORD3.z;
	                            _16078 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13200 = fract(input_TEXCOORD1.x * 4574.43115234375);
	                            _16078 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13200 = (fract(input_TEXCOORD1.x * 4574.43115234375) - 0.5) * 2.0;
	                            _16078 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13200 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 4574.43115234375)) + 1.0;
	                            _16078 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12481 = (fract(input_TEXCOORD1.x * 4574.43115234375) - 0.5) * 2.0;
	                            _13200 = (_12481 * input_TEXCOORD1.z) + float(int(sign(_12481)));
	                            _16078 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13200 = _4;
	                            _16078 = false;
	                            break;
	                        }
	                    }
	                    if (_16078)
	                    {
	                        _22687 = _13200;
	                        break;
	                    }
	                    _22687 = 1.0;
	                    break;
	                } while(false);
	                _15093 = vec4(_8770.x, _8770.y * _11182.y, _11182.x, _22687);
	                break;
	            }
	            else
	            {
	                float _12961;
	                do
	                {
	                    float _13189;
	                    bool _16068;
	                    switch (_11758)
	                    {
	                        case 1u:
	                        {
	                            _13189 = input_TEXCOORD1.z + 1.0;
	                            _16068 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13189 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16068 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13189 = input_TEXCOORD1.y;
	                            _16068 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13189 = input_TEXCOORD1.w;
	                            _16068 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13189 = input_COLOR0.w;
	                            _16068 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13189 = input_TEXCOORD3.w;
	                            _16068 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13189 = input_TEXCOORD3.x;
	                            _16068 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13189 = input_TEXCOORD3.y;
	                            _16068 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13189 = input_TEXCOORD3.z;
	                            _16068 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13189 = fract(input_TEXCOORD1.x * 5657.4111328125);
	                            _16068 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13189 = (fract(input_TEXCOORD1.x * 5657.4111328125) - 0.5) * 2.0;
	                            _16068 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13189 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 5657.4111328125)) + 1.0;
	                            _16068 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12471 = (fract(input_TEXCOORD1.x * 5657.4111328125) - 0.5) * 2.0;
	                            _13189 = (_12471 * input_TEXCOORD1.z) + float(int(sign(_12471)));
	                            _16068 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13189 = _4;
	                            _16068 = false;
	                            break;
	                        }
	                    }
	                    if (_16068)
	                    {
	                        _12961 = _13189;
	                        break;
	                    }
	                    _12961 = 1.0;
	                    break;
	                } while(false);
	                float _12907;
	                do
	                {
	                    float _13190;
	                    bool _16069;
	                    switch (_12835)
	                    {
	                        case 1u:
	                        {
	                            _13190 = input_TEXCOORD1.z + 1.0;
	                            _16069 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13190 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16069 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13190 = input_TEXCOORD1.y;
	                            _16069 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13190 = input_TEXCOORD1.w;
	                            _16069 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13190 = input_COLOR0.w;
	                            _16069 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13190 = input_TEXCOORD3.w;
	                            _16069 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13190 = input_TEXCOORD3.x;
	                            _16069 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13190 = input_TEXCOORD3.y;
	                            _16069 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13190 = input_TEXCOORD3.z;
	                            _16069 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13190 = fract(input_TEXCOORD1.x * 1231.67041015625);
	                            _16069 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13190 = (fract(input_TEXCOORD1.x * 1231.67041015625) - 0.5) * 2.0;
	                            _16069 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13190 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1231.67041015625)) + 1.0;
	                            _16069 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12472 = (fract(input_TEXCOORD1.x * 1231.67041015625) - 0.5) * 2.0;
	                            _13190 = (_12472 * input_TEXCOORD1.z) + float(int(sign(_12472)));
	                            _16069 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13190 = _4;
	                            _16069 = false;
	                            break;
	                        }
	                    }
	                    if (_16069)
	                    {
	                        _12907 = _13190;
	                        break;
	                    }
	                    _12907 = 1.0;
	                    break;
	                } while(false);
	                float _22649;
	                do
	                {
	                    float _13191;
	                    bool _16070;
	                    switch (_14730)
	                    {
	                        case 1u:
	                        {
	                            _13191 = input_TEXCOORD1.z + 1.0;
	                            _16070 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13191 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16070 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13191 = input_TEXCOORD1.y;
	                            _16070 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13191 = input_TEXCOORD1.w;
	                            _16070 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13191 = input_COLOR0.w;
	                            _16070 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13191 = input_TEXCOORD3.w;
	                            _16070 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13191 = input_TEXCOORD3.x;
	                            _16070 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13191 = input_TEXCOORD3.y;
	                            _16070 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13191 = input_TEXCOORD3.z;
	                            _16070 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13191 = fract(input_TEXCOORD1.x * 1542.87060546875);
	                            _16070 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13191 = (fract(input_TEXCOORD1.x * 1542.87060546875) - 0.5) * 2.0;
	                            _16070 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13191 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1542.87060546875)) + 1.0;
	                            _16070 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12473 = (fract(input_TEXCOORD1.x * 1542.87060546875) - 0.5) * 2.0;
	                            _13191 = (_12473 * input_TEXCOORD1.z) + float(int(sign(_12473)));
	                            _16070 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13191 = _4;
	                            _16070 = false;
	                            break;
	                        }
	                    }
	                    if (_16070)
	                    {
	                        _22649 = _13191;
	                        break;
	                    }
	                    _22649 = 1.0;
	                    break;
	                } while(false);
	                float _20618;
	                do
	                {
	                    float _13192;
	                    bool _16071;
	                    switch (uint((_10222 >> 4) & 15))
	                    {
	                        case 1u:
	                        {
	                            _13192 = input_TEXCOORD1.z + 1.0;
	                            _16071 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13192 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16071 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13192 = input_TEXCOORD1.y;
	                            _16071 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13192 = input_TEXCOORD1.w;
	                            _16071 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13192 = input_COLOR0.w;
	                            _16071 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13192 = input_TEXCOORD3.w;
	                            _16071 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13192 = input_TEXCOORD3.x;
	                            _16071 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13192 = input_TEXCOORD3.y;
	                            _16071 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13192 = input_TEXCOORD3.z;
	                            _16071 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13192 = fract(input_TEXCOORD1.x * 2969.86181640625);
	                            _16071 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13192 = (fract(input_TEXCOORD1.x * 2969.86181640625) - 0.5) * 2.0;
	                            _16071 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13192 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 2969.86181640625)) + 1.0;
	                            _16071 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12474 = (fract(input_TEXCOORD1.x * 2969.86181640625) - 0.5) * 2.0;
	                            _13192 = (_12474 * input_TEXCOORD1.z) + float(int(sign(_12474)));
	                            _16071 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13192 = _4;
	                            _16071 = false;
	                            break;
	                        }
	                    }
	                    if (_16071)
	                    {
	                        _20618 = _13192;
	                        break;
	                    }
	                    _20618 = 1.0;
	                    break;
	                } while(false);
	                vec2 _13165 = _23160.xy - vec2(0.5);
	                float _19475 = SpritecardVertexControls_t._m4.w * _20618;
	                float _9169 = cos(_19475);
	                float _25014 = sin(_19475);
	                float _11443 = _13165.x;
	                float _7575 = _13165.y;
	                vec4 _8993;
	                _8993.x = (_11443 * _9169) + (_7575 * (-_25014));
	                _8993.y = (_11443 * _25014) + (_7575 * _9169);
	                float _21262;
	                do
	                {
	                    float _13194;
	                    bool _16072;
	                    switch (uint((_10222 >> 8) & 15))
	                    {
	                        case 1u:
	                        {
	                            _13194 = input_TEXCOORD1.z + 1.0;
	                            _16072 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13194 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16072 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13194 = input_TEXCOORD1.y;
	                            _16072 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13194 = input_TEXCOORD1.w;
	                            _16072 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13194 = input_COLOR0.w;
	                            _16072 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13194 = input_TEXCOORD3.w;
	                            _16072 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13194 = input_TEXCOORD3.x;
	                            _16072 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13194 = input_TEXCOORD3.y;
	                            _16072 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13194 = input_TEXCOORD3.z;
	                            _16072 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13194 = fract(input_TEXCOORD1.x * 1944.34521484375);
	                            _16072 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13194 = (fract(input_TEXCOORD1.x * 1944.34521484375) - 0.5) * 2.0;
	                            _16072 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13194 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1944.34521484375)) + 1.0;
	                            _16072 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12475 = (fract(input_TEXCOORD1.x * 1944.34521484375) - 0.5) * 2.0;
	                            _13194 = (_12475 * input_TEXCOORD1.z) + float(int(sign(_12475)));
	                            _16072 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13194 = _4;
	                            _16072 = false;
	                            break;
	                        }
	                    }
	                    if (_16072)
	                    {
	                        _21262 = _13194;
	                        break;
	                    }
	                    _21262 = 1.0;
	                    break;
	                } while(false);
	                vec4 _20274 = vec4((((_8993.xy / _13746.xy) * (1.0 / _12961)) + fract((_11358.xy * vec2(_12907, _22649)) + vec2(0.5))) + mix(vec2(0.0), fract(vec2(input_TEXCOORD1.x * 1718.4361572265625, input_TEXCOORD1.x * 1271.89013671875)), vec2(_15589)), _21262, 1.0);
	                vec4 _12908;
	                if (_14704 >= 3u)
	                {
	                    float _22341;
	                    do
	                    {
	                        float _13195;
	                        bool _16073;
	                        switch (uint((_10222 >> 12) & 15))
	                        {
	                            case 1u:
	                            {
	                                _13195 = input_TEXCOORD1.z + 1.0;
	                                _16073 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13195 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16073 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13195 = input_TEXCOORD1.y;
	                                _16073 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13195 = input_TEXCOORD1.w;
	                                _16073 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13195 = input_COLOR0.w;
	                                _16073 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13195 = input_TEXCOORD3.w;
	                                _16073 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13195 = input_TEXCOORD3.x;
	                                _16073 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13195 = input_TEXCOORD3.y;
	                                _16073 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13195 = input_TEXCOORD3.z;
	                                _16073 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13195 = fract(input_TEXCOORD1.x * 2704.225341796875);
	                                _16073 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13195 = (fract(input_TEXCOORD1.x * 2704.225341796875) - 0.5) * 2.0;
	                                _16073 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13195 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 2704.225341796875)) + 1.0;
	                                _16073 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12476 = (fract(input_TEXCOORD1.x * 2704.225341796875) - 0.5) * 2.0;
	                                _13195 = (_12476 * input_TEXCOORD1.z) + float(int(sign(_12476)));
	                                _16073 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13195 = _4;
	                                _16073 = false;
	                                break;
	                            }
	                        }
	                        if (_16073)
	                        {
	                            _22341 = _13195;
	                            break;
	                        }
	                        _22341 = 1.0;
	                        break;
	                    } while(false);
	                    vec4 _10003 = _20274;
	                    _10003.w = _22341;
	                    _12908 = _10003;
	                }
	                else
	                {
	                    _12908 = _20274;
	                }
	                float _20311;
	                do
	                {
	                    float _13196;
	                    bool _16074;
	                    switch (_23506)
	                    {
	                        case 1u:
	                        {
	                            _13196 = input_TEXCOORD1.z + 1.0;
	                            _16074 = true;
	                            break;
	                        }
	                        case 2u:
	                        {
	                            _13196 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                            _16074 = true;
	                            break;
	                        }
	                        case 3u:
	                        {
	                            _13196 = input_TEXCOORD1.y;
	                            _16074 = true;
	                            break;
	                        }
	                        case 4u:
	                        {
	                            _13196 = input_TEXCOORD1.w;
	                            _16074 = true;
	                            break;
	                        }
	                        case 5u:
	                        {
	                            _13196 = input_COLOR0.w;
	                            _16074 = true;
	                            break;
	                        }
	                        case 6u:
	                        {
	                            _13196 = input_TEXCOORD3.w;
	                            _16074 = true;
	                            break;
	                        }
	                        case 7u:
	                        {
	                            _13196 = input_TEXCOORD3.x;
	                            _16074 = true;
	                            break;
	                        }
	                        case 8u:
	                        {
	                            _13196 = input_TEXCOORD3.y;
	                            _16074 = true;
	                            break;
	                        }
	                        case 9u:
	                        {
	                            _13196 = input_TEXCOORD3.z;
	                            _16074 = true;
	                            break;
	                        }
	                        case 10u:
	                        {
	                            _13196 = fract(input_TEXCOORD1.x * 4574.43115234375);
	                            _16074 = true;
	                            break;
	                        }
	                        case 11u:
	                        {
	                            _13196 = (fract(input_TEXCOORD1.x * 4574.43115234375) - 0.5) * 2.0;
	                            _16074 = true;
	                            break;
	                        }
	                        case 12u:
	                        {
	                            _13196 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 4574.43115234375)) + 1.0;
	                            _16074 = true;
	                            break;
	                        }
	                        case 13u:
	                        {
	                            float _12477 = (fract(input_TEXCOORD1.x * 4574.43115234375) - 0.5) * 2.0;
	                            _13196 = (_12477 * input_TEXCOORD1.z) + float(int(sign(_12477)));
	                            _16074 = true;
	                            break;
	                        }
	                        default:
	                        {
	                            _13196 = _4;
	                            _16074 = false;
	                            break;
	                        }
	                    }
	                    if (_16074)
	                    {
	                        _20311 = _13196;
	                        break;
	                    }
	                    _20311 = 1.0;
	                    break;
	                } while(false);
	                vec4 _18603 = _12908;
	                _18603.w = _12908.w * _20311;
	                _15093 = _18603;
	                break;
	            }
	            break; // unreachable workaround
	        } while(false);
	        vec4 _12502;
	        if (clamp(SpritecardVertexControls_t._m9 & 262144u, 0u, 1u) == 1u)
	        {
	            float _12838;
	            do
	            {
	                float _13201;
	                bool _16079;
	                switch (uint(_20705 & 15))
	                {
	                    case 1u:
	                    {
	                        _13201 = input_TEXCOORD1.z + 1.0;
	                        _16079 = true;
	                        break;
	                    }
	                    case 2u:
	                    {
	                        _13201 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                        _16079 = true;
	                        break;
	                    }
	                    case 3u:
	                    {
	                        _13201 = input_TEXCOORD1.y;
	                        _16079 = true;
	                        break;
	                    }
	                    case 4u:
	                    {
	                        _13201 = input_TEXCOORD1.w;
	                        _16079 = true;
	                        break;
	                    }
	                    case 5u:
	                    {
	                        _13201 = input_COLOR0.w;
	                        _16079 = true;
	                        break;
	                    }
	                    case 6u:
	                    {
	                        _13201 = input_TEXCOORD3.w;
	                        _16079 = true;
	                        break;
	                    }
	                    case 7u:
	                    {
	                        _13201 = input_TEXCOORD3.x;
	                        _16079 = true;
	                        break;
	                    }
	                    case 8u:
	                    {
	                        _13201 = input_TEXCOORD3.y;
	                        _16079 = true;
	                        break;
	                    }
	                    case 9u:
	                    {
	                        _13201 = input_TEXCOORD3.z;
	                        _16079 = true;
	                        break;
	                    }
	                    case 10u:
	                    {
	                        _13201 = fract(input_TEXCOORD1.x * 238.839996337890625);
	                        _16079 = true;
	                        break;
	                    }
	                    case 11u:
	                    {
	                        _13201 = (fract(input_TEXCOORD1.x * 238.839996337890625) - 0.5) * 2.0;
	                        _16079 = true;
	                        break;
	                    }
	                    case 12u:
	                    {
	                        _13201 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 238.839996337890625)) + 1.0;
	                        _16079 = true;
	                        break;
	                    }
	                    case 13u:
	                    {
	                        float _12482 = (fract(input_TEXCOORD1.x * 238.839996337890625) - 0.5) * 2.0;
	                        _13201 = (_12482 * input_TEXCOORD1.z) + float(int(sign(_12482)));
	                        _16079 = true;
	                        break;
	                    }
	                    default:
	                    {
	                        _13201 = _4;
	                        _16079 = false;
	                        break;
	                    }
	                }
	                if (_16079)
	                {
	                    _12838 = _13201;
	                    break;
	                }
	                _12838 = 1.0;
	                break;
	            } while(false);
	            float _19168;
	            do
	            {
	                float _13202;
	                bool _16080;
	                switch (uint((_20705 >> 4) & 15))
	                {
	                    case 1u:
	                    {
	                        _13202 = input_TEXCOORD1.z + 1.0;
	                        _16080 = true;
	                        break;
	                    }
	                    case 2u:
	                    {
	                        _13202 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                        _16080 = true;
	                        break;
	                    }
	                    case 3u:
	                    {
	                        _13202 = input_TEXCOORD1.y;
	                        _16080 = true;
	                        break;
	                    }
	                    case 4u:
	                    {
	                        _13202 = input_TEXCOORD1.w;
	                        _16080 = true;
	                        break;
	                    }
	                    case 5u:
	                    {
	                        _13202 = input_COLOR0.w;
	                        _16080 = true;
	                        break;
	                    }
	                    case 6u:
	                    {
	                        _13202 = input_TEXCOORD3.w;
	                        _16080 = true;
	                        break;
	                    }
	                    case 7u:
	                    {
	                        _13202 = input_TEXCOORD3.x;
	                        _16080 = true;
	                        break;
	                    }
	                    case 8u:
	                    {
	                        _13202 = input_TEXCOORD3.y;
	                        _16080 = true;
	                        break;
	                    }
	                    case 9u:
	                    {
	                        _13202 = input_TEXCOORD3.z;
	                        _16080 = true;
	                        break;
	                    }
	                    case 10u:
	                    {
	                        _13202 = fract(input_TEXCOORD1.x * 84.74559783935546875);
	                        _16080 = true;
	                        break;
	                    }
	                    case 11u:
	                    {
	                        _13202 = (fract(input_TEXCOORD1.x * 84.74559783935546875) - 0.5) * 2.0;
	                        _16080 = true;
	                        break;
	                    }
	                    case 12u:
	                    {
	                        _13202 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 84.74559783935546875)) + 1.0;
	                        _16080 = true;
	                        break;
	                    }
	                    case 13u:
	                    {
	                        float _12483 = (fract(input_TEXCOORD1.x * 84.74559783935546875) - 0.5) * 2.0;
	                        _13202 = (_12483 * input_TEXCOORD1.z) + float(int(sign(_12483)));
	                        _16080 = true;
	                        break;
	                    }
	                    default:
	                    {
	                        _13202 = _4;
	                        _16080 = false;
	                        break;
	                    }
	                }
	                if (_16080)
	                {
	                    _19168 = _13202;
	                    break;
	                }
	                _19168 = 1.0;
	                break;
	            } while(false);
	            vec4 _19842 = vec4(-1.0, -1.0, 1.0, 0.0);
	            _19842.z = 1.0 - _12838;
	            _19842.w = _19168;
	            _12502 = _19842;
	        }
	        else
	        {
	            _12502 = vec4(-1.0, -1.0, 1.0, 0.0);
	        }
	        _9982 = _15093;
	        _23824 = _12502;
	    }
	    else
	    {
	        vec4 _12262;
	        vec4 _19880;
	        if (SpritecardVertexControls_t._m7.y > 0.0)
	        {
	            float _21709;
	            do
	            {
	                float _13185;
	                bool _16065;
	                switch (uint(((int(SpritecardVertexControls_t._m8.x) & 65535) >> 4) & 15))
	                {
	                    case 1u:
	                    {
	                        _13185 = input_TEXCOORD1.z + 1.0;
	                        _16065 = true;
	                        break;
	                    }
	                    case 2u:
	                    {
	                        _13185 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                        _16065 = true;
	                        break;
	                    }
	                    case 3u:
	                    {
	                        _13185 = input_TEXCOORD1.y;
	                        _16065 = true;
	                        break;
	                    }
	                    case 4u:
	                    {
	                        _13185 = input_TEXCOORD1.w;
	                        _16065 = true;
	                        break;
	                    }
	                    case 5u:
	                    {
	                        _13185 = input_COLOR0.w;
	                        _16065 = true;
	                        break;
	                    }
	                    case 6u:
	                    {
	                        _13185 = input_TEXCOORD3.w;
	                        _16065 = true;
	                        break;
	                    }
	                    case 7u:
	                    {
	                        _13185 = input_TEXCOORD3.x;
	                        _16065 = true;
	                        break;
	                    }
	                    case 8u:
	                    {
	                        _13185 = input_TEXCOORD3.y;
	                        _16065 = true;
	                        break;
	                    }
	                    case 9u:
	                    {
	                        _13185 = input_TEXCOORD3.z;
	                        _16065 = true;
	                        break;
	                    }
	                    case 10u:
	                    {
	                        _13185 = fract(input_TEXCOORD1.x * 1.34700000286102294921875);
	                        _16065 = true;
	                        break;
	                    }
	                    case 11u:
	                    {
	                        _13185 = (fract(input_TEXCOORD1.x * 1.34700000286102294921875) - 0.5) * 2.0;
	                        _16065 = true;
	                        break;
	                    }
	                    case 12u:
	                    {
	                        _13185 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 1.34700000286102294921875)) + 1.0;
	                        _16065 = true;
	                        break;
	                    }
	                    case 13u:
	                    {
	                        float _12468 = (fract(input_TEXCOORD1.x * 1.34700000286102294921875) - 0.5) * 2.0;
	                        _13185 = (_12468 * input_TEXCOORD1.z) + float(int(sign(_12468)));
	                        _16065 = true;
	                        break;
	                    }
	                    default:
	                    {
	                        _13185 = _4;
	                        _16065 = false;
	                        break;
	                    }
	                }
	                if (_16065)
	                {
	                    _21709 = _13185;
	                    break;
	                }
	                _21709 = 1.0;
	                break;
	            } while(false);
	            float _16161 = _21709 * SpritecardVertexControls_t._m4.w;
	            float _7037 = 1.0 / SpritecardVertexControls_t._m6.x;
	            float _24760 = SpritecardVertexControls_t._m7.x + ((3.0 * (((input_TEXCOORD2.x - SpritecardVertexControls_t._m7.y) >= 0.0) ? 0.0 : input_TEXCOORD2.x)) * SpritecardVertexControls_t._m6.y);
	            vec4 _23814 = textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m7], g_bindless_Sampler[_Globals_.g_sParticlePoint]), vec2(0.0, _24760), 0.0);
	            float _11313;
	            if ((SpritecardVertexControls_t._m9 & 4096u) != 0u)
	            {
	                _11313 = 0.0002441443502902984619140625 / _23814.y;
	            }
	            else
	            {
	                _11313 = 1.0;
	            }
	            float _17794 = (((_11313 * SpritecardVertexControls_t._m6.x) * 0.5) * (input_TEXCOORD1.z * mix(_16161, 1.0, float(_16161 == 0.0)))) * SpritecardVertexControls_t._m1.w;
	            float _17072 = 2.0 * floor(_17794);
	            float _10306;
	            if (_23814.z > 0.0)
	            {
	                _10306 = min(SpritecardVertexControls_t._m6.x - 2.0, _17072);
	            }
	            else
	            {
	                _10306 = _17072 - SpritecardVertexControls_t._m6.x * trunc(_17072 / SpritecardVertexControls_t._m6.x);
	            }
	            float _12352 = _10306 * _7037;
	            vec4 _16817 = textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m7], g_bindless_Sampler[_Globals_.g_sParticlePoint]), vec2(_12352, _24760), 0.0);
	            float _11756 = mix(_16817.x, _16817.w, fract(_17794));
	            float _6576 = _24760 + SpritecardVertexControls_t._m6.y;
	            vec4 _8733 = textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m7], g_bindless_Sampler[_Globals_.g_sParticlePoint]), vec2(_12352, _6576), 0.0);
	            vec4 _8494 = textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m7], g_bindless_Sampler[_Globals_.g_sParticlePoint]), vec2(_12352, _24760 + (2.0 * SpritecardVertexControls_t._m6.y)), 0.0);
	            vec4 _17125 = textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m7], g_bindless_Sampler[_Globals_.g_sParticlePoint]), vec2(_12352 + _7037, _6576), 0.0);
	            vec2 _20234 = _17125.xy;
	            vec2 _6786 = _8733.xy;
	            vec2 _7648 = (_17125.zw - _20234).xy;
	            vec2 _20524 = ((_8733.zw - _6786) / _7648).xy;
	            vec2 _22862 = _6786 - (_20234 * _20524);
	            float _24522 = _22862.x;
	            vec4 _22101;
	            _22101.x = _24522;
	            _22101.y = _22862.y;
	            vec4 _11665 = vec4(_24522, _22862.y, _22101.xy + _20524);
	            vec2 _14865 = _8494.xy;
	            vec2 _23732 = ((_8494.zw - _14865) / _7648).xy;
	            vec2 _22863 = _14865 - (_20234 * _23732);
	            float _24523 = _22863.x;
	            vec4 _22102;
	            _22102.x = _24523;
	            _22102.y = _22863.y;
	            vec4 _19645 = vec4(_24523, _22863.y, _22102.xy + _23732);
	            float _14426 = _11756 * 0.5;
	            float _8035 = _14426 + 0.5;
	            vec4 _15186 = mix(_23160, ((_23160 - vec4(0.5)) * saturate(1.0 / SpritecardVertexControls_t._m3.y)) + vec4(0.5), vec4(_8035, _8035, _14426, _14426));
	            vec4 _20271 = vec4((_15186.x / SpritecardVertexControls_t._m5.z) + SpritecardVertexControls_t._m5.x, (_15186.y / SpritecardVertexControls_t._m5.w) + SpritecardVertexControls_t._m5.y, (_15186.z / SpritecardVertexControls_t._m5.z) + SpritecardVertexControls_t._m5.x, (_15186.w / SpritecardVertexControls_t._m5.w) + SpritecardVertexControls_t._m5.y);
	            vec2 _13920 = _11665.xy;
	            vec2 _19858 = _19645.xy;
	            vec4 _23767 = vec4(-1.0, -1.0, 1.0, 0.0);
	            _23767.x = _11756;
	            _23767.y = 0.0;
	            _12262 = vec4(_13920 + (_20271.xy * (_11665.zw - _13920)), _19858 + (_20271.zw * (_19645.zw - _19858)));
	            _19880 = _23767;
	        }
	        else
	        {
	            vec2 _11357 = vec2(SpritecardVertexControls_t._m5.xy);
	            vec2 _13745 = vec2(SpritecardVertexControls_t._m5.zw);
	            int _14313 = int(SpritecardVertexControls_t._m4.x);
	            float _15588 = float(((_14313 & 31) >> 4) & 1);
	            int _9472 = int(SpritecardVertexControls_t._m8.x);
	            uint _11757 = uint(_9472 & 15);
	            uint _12834 = uint(_14313 & 15);
	            uint _14729 = uint(int(SpritecardVertexControls_t._m4.y) & 15);
	            int _10221 = _9472 & 65535;
	            uint _23505 = uint((int(SpritecardVertexControls_t._m4.z) >> 12) & 15);
	            uint _14700 = uint((int(SpriteCardPixelControls_t._m3.y) >> 16) & 15);
	            vec4 _10883;
	            do
	            {
	                if (_14700 == 2u)
	                {
	                    float _20482;
	                    do
	                    {
	                        float _13181;
	                        bool _16061;
	                        switch (_11757)
	                        {
	                            case 1u:
	                            {
	                                _13181 = input_TEXCOORD1.z + 1.0;
	                                _16061 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13181 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16061 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13181 = input_TEXCOORD1.y;
	                                _16061 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13181 = input_TEXCOORD1.w;
	                                _16061 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13181 = input_COLOR0.w;
	                                _16061 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13181 = input_TEXCOORD3.w;
	                                _16061 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13181 = input_TEXCOORD3.x;
	                                _16061 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13181 = input_TEXCOORD3.y;
	                                _16061 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13181 = input_TEXCOORD3.z;
	                                _16061 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13181 = fract(input_TEXCOORD1.x * 33.658000946044921875);
	                                _16061 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13181 = (fract(input_TEXCOORD1.x * 33.658000946044921875) - 0.5) * 2.0;
	                                _16061 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13181 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 33.658000946044921875)) + 1.0;
	                                _16061 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12464 = (fract(input_TEXCOORD1.x * 33.658000946044921875) - 0.5) * 2.0;
	                                _13181 = (_12464 * input_TEXCOORD1.z) + float(int(sign(_12464)));
	                                _16061 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13181 = _4;
	                                _16061 = false;
	                                break;
	                            }
	                        }
	                        if (_16061)
	                        {
	                            _20482 = _13181;
	                            break;
	                        }
	                        _20482 = 1.0;
	                        break;
	                    } while(false);
	                    vec2 _11181 = vec2(1.0) / (_13745.xy * vec2(_20482));
	                    float _12906;
	                    do
	                    {
	                        float _13182;
	                        bool _16062;
	                        switch (_12834)
	                        {
	                            case 1u:
	                            {
	                                _13182 = input_TEXCOORD1.z + 1.0;
	                                _16062 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13182 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16062 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13182 = input_TEXCOORD1.y;
	                                _16062 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13182 = input_TEXCOORD1.w;
	                                _16062 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13182 = input_COLOR0.w;
	                                _16062 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13182 = input_TEXCOORD3.w;
	                                _16062 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13182 = input_TEXCOORD3.x;
	                                _16062 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13182 = input_TEXCOORD3.y;
	                                _16062 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13182 = input_TEXCOORD3.z;
	                                _16062 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13182 = fract(input_TEXCOORD1.x * 7.327655792236328125);
	                                _16062 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13182 = (fract(input_TEXCOORD1.x * 7.327655792236328125) - 0.5) * 2.0;
	                                _16062 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13182 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 7.327655792236328125)) + 1.0;
	                                _16062 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12465 = (fract(input_TEXCOORD1.x * 7.327655792236328125) - 0.5) * 2.0;
	                                _13182 = (_12465 * input_TEXCOORD1.z) + float(int(sign(_12465)));
	                                _16062 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13182 = _4;
	                                _16062 = false;
	                                break;
	                            }
	                        }
	                        if (_16062)
	                        {
	                            _12906 = _13182;
	                            break;
	                        }
	                        _12906 = 1.0;
	                        break;
	                    } while(false);
	                    float _19456;
	                    do
	                    {
	                        float _13183;
	                        bool _16063;
	                        switch (_14729)
	                        {
	                            case 1u:
	                            {
	                                _13183 = input_TEXCOORD1.z + 1.0;
	                                _16063 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13183 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16063 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13183 = input_TEXCOORD1.y;
	                                _16063 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13183 = input_TEXCOORD1.w;
	                                _16063 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13183 = input_COLOR0.w;
	                                _16063 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13183 = input_TEXCOORD3.w;
	                                _16063 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13183 = input_TEXCOORD3.x;
	                                _16063 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13183 = input_TEXCOORD3.y;
	                                _16063 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13183 = input_TEXCOORD3.z;
	                                _16063 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13183 = fract(input_TEXCOORD1.x * 9.17909908294677734375);
	                                _16063 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13183 = (fract(input_TEXCOORD1.x * 9.17909908294677734375) - 0.5) * 2.0;
	                                _16063 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13183 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 9.17909908294677734375)) + 1.0;
	                                _16063 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12466 = (fract(input_TEXCOORD1.x * 9.17909908294677734375) - 0.5) * 2.0;
	                                _13183 = (_12466 * input_TEXCOORD1.z) + float(int(sign(_12466)));
	                                _16063 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13183 = _4;
	                                _16063 = false;
	                                break;
	                            }
	                        }
	                        if (_16063)
	                        {
	                            _19456 = _13183;
	                            break;
	                        }
	                        _19456 = 1.0;
	                        break;
	                    } while(false);
	                    vec2 _8731 = (_11357.xy * vec2(_12906, _19456)) + mix(vec2(0.0), fract(vec2(input_TEXCOORD1.x * 10.22360324859619140625, input_TEXCOORD1.x * 7.56693744659423828125)), vec2(_15588));
	                    float _22686;
	                    do
	                    {
	                        float _13184;
	                        bool _16064;
	                        switch (_23505)
	                        {
	                            case 1u:
	                            {
	                                _13184 = input_TEXCOORD1.z + 1.0;
	                                _16064 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13184 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16064 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13184 = input_TEXCOORD1.y;
	                                _16064 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13184 = input_TEXCOORD1.w;
	                                _16064 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13184 = input_COLOR0.w;
	                                _16064 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13184 = input_TEXCOORD3.w;
	                                _16064 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13184 = input_TEXCOORD3.x;
	                                _16064 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13184 = input_TEXCOORD3.y;
	                                _16064 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13184 = input_TEXCOORD3.z;
	                                _16064 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13184 = fract(input_TEXCOORD1.x * 27.2149562835693359375);
	                                _16064 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13184 = (fract(input_TEXCOORD1.x * 27.2149562835693359375) - 0.5) * 2.0;
	                                _16064 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13184 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 27.2149562835693359375)) + 1.0;
	                                _16064 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12467 = (fract(input_TEXCOORD1.x * 27.2149562835693359375) - 0.5) * 2.0;
	                                _13184 = (_12467 * input_TEXCOORD1.z) + float(int(sign(_12467)));
	                                _16064 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13184 = _4;
	                                _16064 = false;
	                                break;
	                            }
	                        }
	                        if (_16064)
	                        {
	                            _22686 = _13184;
	                            break;
	                        }
	                        _22686 = 1.0;
	                        break;
	                    } while(false);
	                    _10883 = vec4(_8731.x, _8731.y * _11181.y, _11181.x, _22686);
	                    break;
	                }
	                else
	                {
	                    float _12960;
	                    do
	                    {
	                        float _13174;
	                        bool _16054;
	                        switch (_11757)
	                        {
	                            case 1u:
	                            {
	                                _13174 = input_TEXCOORD1.z + 1.0;
	                                _16054 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13174 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16054 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13174 = input_TEXCOORD1.y;
	                                _16054 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13174 = input_TEXCOORD1.w;
	                                _16054 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13174 = input_COLOR0.w;
	                                _16054 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13174 = input_TEXCOORD3.w;
	                                _16054 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13174 = input_TEXCOORD3.x;
	                                _16054 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13174 = input_TEXCOORD3.y;
	                                _16054 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13174 = input_TEXCOORD3.z;
	                                _16054 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13174 = fract(input_TEXCOORD1.x * 33.658000946044921875);
	                                _16054 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13174 = (fract(input_TEXCOORD1.x * 33.658000946044921875) - 0.5) * 2.0;
	                                _16054 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13174 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 33.658000946044921875)) + 1.0;
	                                _16054 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12457 = (fract(input_TEXCOORD1.x * 33.658000946044921875) - 0.5) * 2.0;
	                                _13174 = (_12457 * input_TEXCOORD1.z) + float(int(sign(_12457)));
	                                _16054 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13174 = _4;
	                                _16054 = false;
	                                break;
	                            }
	                        }
	                        if (_16054)
	                        {
	                            _12960 = _13174;
	                            break;
	                        }
	                        _12960 = 1.0;
	                        break;
	                    } while(false);
	                    float _12904;
	                    do
	                    {
	                        float _13175;
	                        bool _16055;
	                        switch (_12834)
	                        {
	                            case 1u:
	                            {
	                                _13175 = input_TEXCOORD1.z + 1.0;
	                                _16055 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13175 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16055 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13175 = input_TEXCOORD1.y;
	                                _16055 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13175 = input_TEXCOORD1.w;
	                                _16055 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13175 = input_COLOR0.w;
	                                _16055 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13175 = input_TEXCOORD3.w;
	                                _16055 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13175 = input_TEXCOORD3.x;
	                                _16055 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13175 = input_TEXCOORD3.y;
	                                _16055 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13175 = input_TEXCOORD3.z;
	                                _16055 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13175 = fract(input_TEXCOORD1.x * 7.327655792236328125);
	                                _16055 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13175 = (fract(input_TEXCOORD1.x * 7.327655792236328125) - 0.5) * 2.0;
	                                _16055 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13175 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 7.327655792236328125)) + 1.0;
	                                _16055 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12458 = (fract(input_TEXCOORD1.x * 7.327655792236328125) - 0.5) * 2.0;
	                                _13175 = (_12458 * input_TEXCOORD1.z) + float(int(sign(_12458)));
	                                _16055 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13175 = _4;
	                                _16055 = false;
	                                break;
	                            }
	                        }
	                        if (_16055)
	                        {
	                            _12904 = _13175;
	                            break;
	                        }
	                        _12904 = 1.0;
	                        break;
	                    } while(false);
	                    float _22648;
	                    do
	                    {
	                        float _13176;
	                        bool _16056;
	                        switch (_14729)
	                        {
	                            case 1u:
	                            {
	                                _13176 = input_TEXCOORD1.z + 1.0;
	                                _16056 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13176 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16056 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13176 = input_TEXCOORD1.y;
	                                _16056 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13176 = input_TEXCOORD1.w;
	                                _16056 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13176 = input_COLOR0.w;
	                                _16056 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13176 = input_TEXCOORD3.w;
	                                _16056 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13176 = input_TEXCOORD3.x;
	                                _16056 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13176 = input_TEXCOORD3.y;
	                                _16056 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13176 = input_TEXCOORD3.z;
	                                _16056 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13176 = fract(input_TEXCOORD1.x * 9.17909908294677734375);
	                                _16056 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13176 = (fract(input_TEXCOORD1.x * 9.17909908294677734375) - 0.5) * 2.0;
	                                _16056 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13176 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 9.17909908294677734375)) + 1.0;
	                                _16056 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12459 = (fract(input_TEXCOORD1.x * 9.17909908294677734375) - 0.5) * 2.0;
	                                _13176 = (_12459 * input_TEXCOORD1.z) + float(int(sign(_12459)));
	                                _16056 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13176 = _4;
	                                _16056 = false;
	                                break;
	                            }
	                        }
	                        if (_16056)
	                        {
	                            _22648 = _13176;
	                            break;
	                        }
	                        _22648 = 1.0;
	                        break;
	                    } while(false);
	                    float _20617;
	                    do
	                    {
	                        float _13177;
	                        bool _16057;
	                        switch (uint((_10221 >> 4) & 15))
	                        {
	                            case 1u:
	                            {
	                                _13177 = input_TEXCOORD1.z + 1.0;
	                                _16057 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13177 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16057 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13177 = input_TEXCOORD1.y;
	                                _16057 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13177 = input_TEXCOORD1.w;
	                                _16057 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13177 = input_COLOR0.w;
	                                _16057 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13177 = input_TEXCOORD3.w;
	                                _16057 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13177 = input_TEXCOORD3.x;
	                                _16057 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13177 = input_TEXCOORD3.y;
	                                _16057 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13177 = input_TEXCOORD3.z;
	                                _16057 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13177 = fract(input_TEXCOORD1.x * 17.6687908172607421875);
	                                _16057 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13177 = (fract(input_TEXCOORD1.x * 17.6687908172607421875) - 0.5) * 2.0;
	                                _16057 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13177 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 17.6687908172607421875)) + 1.0;
	                                _16057 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12460 = (fract(input_TEXCOORD1.x * 17.6687908172607421875) - 0.5) * 2.0;
	                                _13177 = (_12460 * input_TEXCOORD1.z) + float(int(sign(_12460)));
	                                _16057 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13177 = _4;
	                                _16057 = false;
	                                break;
	                            }
	                        }
	                        if (_16057)
	                        {
	                            _20617 = _13177;
	                            break;
	                        }
	                        _20617 = 1.0;
	                        break;
	                    } while(false);
	                    vec2 _13164 = _23160.xy - vec2(0.5);
	                    float _19474 = SpritecardVertexControls_t._m4.w * _20617;
	                    float _9168 = cos(_19474);
	                    float _25013 = sin(_19474);
	                    float _11442 = _13164.x;
	                    float _7574 = _13164.y;
	                    vec4 _8992;
	                    _8992.x = (_11442 * _9168) + (_7574 * (-_25013));
	                    _8992.y = (_11442 * _25013) + (_7574 * _9168);
	                    float _21261;
	                    do
	                    {
	                        float _13178;
	                        bool _16058;
	                        switch (uint((_10221 >> 8) & 15))
	                        {
	                            case 1u:
	                            {
	                                _13178 = input_TEXCOORD1.z + 1.0;
	                                _16058 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13178 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16058 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13178 = input_TEXCOORD1.y;
	                                _16058 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13178 = input_TEXCOORD1.w;
	                                _16058 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13178 = input_COLOR0.w;
	                                _16058 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13178 = input_TEXCOORD3.w;
	                                _16058 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13178 = input_TEXCOORD3.x;
	                                _16058 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13178 = input_TEXCOORD3.y;
	                                _16058 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13178 = input_TEXCOORD3.z;
	                                _16058 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13178 = fract(input_TEXCOORD1.x * 11.56761837005615234375);
	                                _16058 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13178 = (fract(input_TEXCOORD1.x * 11.56761837005615234375) - 0.5) * 2.0;
	                                _16058 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13178 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 11.56761837005615234375)) + 1.0;
	                                _16058 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12461 = (fract(input_TEXCOORD1.x * 11.56761837005615234375) - 0.5) * 2.0;
	                                _13178 = (_12461 * input_TEXCOORD1.z) + float(int(sign(_12461)));
	                                _16058 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13178 = _4;
	                                _16058 = false;
	                                break;
	                            }
	                        }
	                        if (_16058)
	                        {
	                            _21261 = _13178;
	                            break;
	                        }
	                        _21261 = 1.0;
	                        break;
	                    } while(false);
	                    vec4 _20273 = vec4((((_8992.xy / _13745.xy) * (1.0 / _12960)) + fract((_11357.xy * vec2(_12904, _22648)) + vec2(0.5))) + mix(vec2(0.0), fract(vec2(input_TEXCOORD1.x * 10.22360324859619140625, input_TEXCOORD1.x * 7.56693744659423828125)), vec2(_15588)), _21261, 1.0);
	                    vec4 _12905;
	                    if (_14700 >= 3u)
	                    {
	                        float _22340;
	                        do
	                        {
	                            float _13179;
	                            bool _16059;
	                            switch (uint((_10221 >> 12) & 15))
	                            {
	                                case 1u:
	                                {
	                                    _13179 = input_TEXCOORD1.z + 1.0;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 2u:
	                                {
	                                    _13179 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 3u:
	                                {
	                                    _13179 = input_TEXCOORD1.y;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 4u:
	                                {
	                                    _13179 = input_TEXCOORD1.w;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 5u:
	                                {
	                                    _13179 = input_COLOR0.w;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 6u:
	                                {
	                                    _13179 = input_TEXCOORD3.w;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 7u:
	                                {
	                                    _13179 = input_TEXCOORD3.x;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 8u:
	                                {
	                                    _13179 = input_TEXCOORD3.y;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 9u:
	                                {
	                                    _13179 = input_TEXCOORD3.z;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 10u:
	                                {
	                                    _13179 = fract(input_TEXCOORD1.x * 16.0884227752685546875);
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 11u:
	                                {
	                                    _13179 = (fract(input_TEXCOORD1.x * 16.0884227752685546875) - 0.5) * 2.0;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 12u:
	                                {
	                                    _13179 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 16.0884227752685546875)) + 1.0;
	                                    _16059 = true;
	                                    break;
	                                }
	                                case 13u:
	                                {
	                                    float _12462 = (fract(input_TEXCOORD1.x * 16.0884227752685546875) - 0.5) * 2.0;
	                                    _13179 = (_12462 * input_TEXCOORD1.z) + float(int(sign(_12462)));
	                                    _16059 = true;
	                                    break;
	                                }
	                                default:
	                                {
	                                    _13179 = _4;
	                                    _16059 = false;
	                                    break;
	                                }
	                            }
	                            if (_16059)
	                            {
	                                _22340 = _13179;
	                                break;
	                            }
	                            _22340 = 1.0;
	                            break;
	                        } while(false);
	                        vec4 _10002 = _20273;
	                        _10002.w = _22340;
	                        _12905 = _10002;
	                    }
	                    else
	                    {
	                        _12905 = _20273;
	                    }
	                    float _20309;
	                    do
	                    {
	                        float _13180;
	                        bool _16060;
	                        switch (_23505)
	                        {
	                            case 1u:
	                            {
	                                _13180 = input_TEXCOORD1.z + 1.0;
	                                _16060 = true;
	                                break;
	                            }
	                            case 2u:
	                            {
	                                _13180 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                                _16060 = true;
	                                break;
	                            }
	                            case 3u:
	                            {
	                                _13180 = input_TEXCOORD1.y;
	                                _16060 = true;
	                                break;
	                            }
	                            case 4u:
	                            {
	                                _13180 = input_TEXCOORD1.w;
	                                _16060 = true;
	                                break;
	                            }
	                            case 5u:
	                            {
	                                _13180 = input_COLOR0.w;
	                                _16060 = true;
	                                break;
	                            }
	                            case 6u:
	                            {
	                                _13180 = input_TEXCOORD3.w;
	                                _16060 = true;
	                                break;
	                            }
	                            case 7u:
	                            {
	                                _13180 = input_TEXCOORD3.x;
	                                _16060 = true;
	                                break;
	                            }
	                            case 8u:
	                            {
	                                _13180 = input_TEXCOORD3.y;
	                                _16060 = true;
	                                break;
	                            }
	                            case 9u:
	                            {
	                                _13180 = input_TEXCOORD3.z;
	                                _16060 = true;
	                                break;
	                            }
	                            case 10u:
	                            {
	                                _13180 = fract(input_TEXCOORD1.x * 27.2149562835693359375);
	                                _16060 = true;
	                                break;
	                            }
	                            case 11u:
	                            {
	                                _13180 = (fract(input_TEXCOORD1.x * 27.2149562835693359375) - 0.5) * 2.0;
	                                _16060 = true;
	                                break;
	                            }
	                            case 12u:
	                            {
	                                _13180 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 27.2149562835693359375)) + 1.0;
	                                _16060 = true;
	                                break;
	                            }
	                            case 13u:
	                            {
	                                float _12463 = (fract(input_TEXCOORD1.x * 27.2149562835693359375) - 0.5) * 2.0;
	                                _13180 = (_12463 * input_TEXCOORD1.z) + float(int(sign(_12463)));
	                                _16060 = true;
	                                break;
	                            }
	                            default:
	                            {
	                                _13180 = _4;
	                                _16060 = false;
	                                break;
	                            }
	                        }
	                        if (_16060)
	                        {
	                            _20309 = _13180;
	                            break;
	                        }
	                        _20309 = 1.0;
	                        break;
	                    } while(false);
	                    vec4 _18602 = _12905;
	                    _18602.w = _12905.w * _20309;
	                    _10883 = _18602;
	                    break;
	                }
	                break; // unreachable workaround
	            } while(false);
	            _12262 = _10883;
	            _19880 = vec4(-1.0, -1.0, 1.0, 0.0);
	        }
	        vec4 _12501;
	        if (clamp(SpritecardVertexControls_t._m9 & 262144u, 0u, 1u) == 1u)
	        {
	            int _9748 = int(SpritecardVertexControls_t._m4.z);
	            float _12837;
	            do
	            {
	                float _13187;
	                bool _16066;
	                switch (uint(_9748 & 15))
	                {
	                    case 1u:
	                    {
	                        _13187 = input_TEXCOORD1.z + 1.0;
	                        _16066 = true;
	                        break;
	                    }
	                    case 2u:
	                    {
	                        _13187 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                        _16066 = true;
	                        break;
	                    }
	                    case 3u:
	                    {
	                        _13187 = input_TEXCOORD1.y;
	                        _16066 = true;
	                        break;
	                    }
	                    case 4u:
	                    {
	                        _13187 = input_TEXCOORD1.w;
	                        _16066 = true;
	                        break;
	                    }
	                    case 5u:
	                    {
	                        _13187 = input_COLOR0.w;
	                        _16066 = true;
	                        break;
	                    }
	                    case 6u:
	                    {
	                        _13187 = input_TEXCOORD3.w;
	                        _16066 = true;
	                        break;
	                    }
	                    case 7u:
	                    {
	                        _13187 = input_TEXCOORD3.x;
	                        _16066 = true;
	                        break;
	                    }
	                    case 8u:
	                    {
	                        _13187 = input_TEXCOORD3.y;
	                        _16066 = true;
	                        break;
	                    }
	                    case 9u:
	                    {
	                        _13187 = input_TEXCOORD3.z;
	                        _16066 = true;
	                        break;
	                    }
	                    case 10u:
	                    {
	                        _13187 = fract(input_TEXCOORD1.x * 238.839996337890625);
	                        _16066 = true;
	                        break;
	                    }
	                    case 11u:
	                    {
	                        _13187 = (fract(input_TEXCOORD1.x * 238.839996337890625) - 0.5) * 2.0;
	                        _16066 = true;
	                        break;
	                    }
	                    case 12u:
	                    {
	                        _13187 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 238.839996337890625)) + 1.0;
	                        _16066 = true;
	                        break;
	                    }
	                    case 13u:
	                    {
	                        float _12469 = (fract(input_TEXCOORD1.x * 238.839996337890625) - 0.5) * 2.0;
	                        _13187 = (_12469 * input_TEXCOORD1.z) + float(int(sign(_12469)));
	                        _16066 = true;
	                        break;
	                    }
	                    default:
	                    {
	                        _13187 = _4;
	                        _16066 = false;
	                        break;
	                    }
	                }
	                if (_16066)
	                {
	                    _12837 = _13187;
	                    break;
	                }
	                _12837 = 1.0;
	                break;
	            } while(false);
	            float _19167;
	            do
	            {
	                float _13188;
	                bool _16067;
	                switch (uint((_9748 >> 4) & 15))
	                {
	                    case 1u:
	                    {
	                        _13188 = input_TEXCOORD1.z + 1.0;
	                        _16067 = true;
	                        break;
	                    }
	                    case 2u:
	                    {
	                        _13188 = (input_TEXCOORD1.z * SpritecardVertexControls_t._m1.w) + 1.0;
	                        _16067 = true;
	                        break;
	                    }
	                    case 3u:
	                    {
	                        _13188 = input_TEXCOORD1.y;
	                        _16067 = true;
	                        break;
	                    }
	                    case 4u:
	                    {
	                        _13188 = input_TEXCOORD1.w;
	                        _16067 = true;
	                        break;
	                    }
	                    case 5u:
	                    {
	                        _13188 = input_COLOR0.w;
	                        _16067 = true;
	                        break;
	                    }
	                    case 6u:
	                    {
	                        _13188 = input_TEXCOORD3.w;
	                        _16067 = true;
	                        break;
	                    }
	                    case 7u:
	                    {
	                        _13188 = input_TEXCOORD3.x;
	                        _16067 = true;
	                        break;
	                    }
	                    case 8u:
	                    {
	                        _13188 = input_TEXCOORD3.y;
	                        _16067 = true;
	                        break;
	                    }
	                    case 9u:
	                    {
	                        _13188 = input_TEXCOORD3.z;
	                        _16067 = true;
	                        break;
	                    }
	                    case 10u:
	                    {
	                        _13188 = fract(input_TEXCOORD1.x * 84.74559783935546875);
	                        _16067 = true;
	                        break;
	                    }
	                    case 11u:
	                    {
	                        _13188 = (fract(input_TEXCOORD1.x * 84.74559783935546875) - 0.5) * 2.0;
	                        _16067 = true;
	                        break;
	                    }
	                    case 12u:
	                    {
	                        _13188 = (input_TEXCOORD1.z * fract(input_TEXCOORD1.x * 84.74559783935546875)) + 1.0;
	                        _16067 = true;
	                        break;
	                    }
	                    case 13u:
	                    {
	                        float _12470 = (fract(input_TEXCOORD1.x * 84.74559783935546875) - 0.5) * 2.0;
	                        _13188 = (_12470 * input_TEXCOORD1.z) + float(int(sign(_12470)));
	                        _16067 = true;
	                        break;
	                    }
	                    default:
	                    {
	                        _13188 = _4;
	                        _16067 = false;
	                        break;
	                    }
	                }
	                if (_16067)
	                {
	                    _19167 = _13188;
	                    break;
	                }
	                _19167 = 1.0;
	                break;
	            } while(false);
	            vec4 _19841 = _19880;
	            _19841.z = 1.0 - _12837;
	            _19841.w = _19167;
	            _12501 = _19841;
	        }
	        else
	        {
	            vec4 _14250 = _19880;
	            _14250.z = 1.0;
	            _14250.w = 0.0;
	            _12501 = _14250;
	        }
	        _9982 = _12262;
	        _23824 = _12501;
	    }
	    vec3 _18058 = input_COLOR0.xyz * vec3(0.077399380505084991455078125);
	    vec3 _7676 = pow((input_COLOR0.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _21354;
	    if (input_COLOR0.x <= 0.040449999272823333740234375)
	    {
	        _21354 = _18058.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (input_COLOR0.y <= 0.040449999272823333740234375)
	    {
	        _21355 = _18058.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19494;
	    if (input_COLOR0.z <= 0.040449999272823333740234375)
	    {
	        _19494 = _18058.z;
	    }
	    else
	    {
	        _19494 = _7676.z;
	    }
	    vec4 _7845 = mix(input_COLOR0, vec4(vec3(_21354, _21355, _19494), input_COLOR0.w), vec4(float((int(SpritecardVertexControls_t._m4.z) >> 8) & 15)));
	    uint _22646 = min(4u, ((SpritecardVertexControls_t._m9 >> uint(1)) & 7u));
	    bool _21658 = _22646 == 3u;
	    bool _21166;
	    if (_21658)
	    {
	        _21166 = true;
	    }
	    else
	    {
	        _21166 = _22646 == 4u;
	    }
	    vec3 _22185 = mix(vec3(0.0, 0.0, 1.0), input_TEXCOORD4, bvec3(_21166));
	    int _17152 = int(_22646);
	    vec3 _13141;
	    vec4 _13204;
	    vec3 _24249;
	    do
	    {
	        if (_17152 == 5)
	        {
	            float _11440 = sin(input_TEXCOORD3.z);
	            float _20038 = cos(input_TEXCOORD3.z);
	            float _16880 = sin(input_TEXCOORD3.y);
	            float _13386 = cos(input_TEXCOORD3.y);
	            float _16881 = sin(input_TEXCOORD3.x);
	            float _13387 = cos(input_TEXCOORD3.x);
	            mat3 _8134 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, _13387, -_16881), vec3(0.0, _16881, _13387)) * (mat3(vec3(_20038, 0.0, _11440), vec3(0.0, 1.0, 0.0), vec3(-_11440, 0.0, _20038)) * mat3(vec3(_13386, -_16880, 0.0), vec3(_16880, _13386, 0.0), vec3(0.0, 0.0, 1.0)));
	            _13141 = _8134[1];
	            _13204 = _7845;
	            _24249 = vec3(input_TEXCOORD0.x + SpritecardVertexControls_t._m1.y, input_TEXCOORD0.y + SpritecardVertexControls_t._m1.z, 0.0) * _8134;
	            break;
	        }
	        vec3 _11892;
	        vec4 _13140;
	        vec3 _16747;
	        if (_17152 == 0)
	        {
	            _13140 = _7845;
	            _11892 = PerViewConstantBuffer_t._m9;
	            _16747 = cross(PerViewConstantBuffer_t._m10, PerViewConstantBuffer_t._m9);
	        }
	        else
	        {
	            vec4 _13139;
	            vec3 _16401;
	            vec3 _16482;
	            if (_17152 == 1)
	            {
	                _13139 = _7845;
	                _16401 = vec3(0.0, 0.0, 1.0);
	                _16482 = cross(vec3(0.0, 0.0, 1.0), PerViewConstantBuffer_t._m10);
	            }
	            else
	            {
	                vec4 _13138;
	                vec3 _16398;
	                vec3 _16481;
	                if (_17152 == 2)
	                {
	                    _13138 = _7845;
	                    _16398 = vec3(1.0, 0.0, 0.0);
	                    _16481 = vec3(0.0, -1.0, 0.0);
	                }
	                else
	                {
	                    vec4 _13137;
	                    vec3 _16397;
	                    vec3 _16480;
	                    if (_17152 == 3)
	                    {
	                        vec3 _6350 = normalize(cross(_22185, mix(vec3(0.0, 0.0, 1.0), vec3(1.0, 0.0, 0.0), bvec3(abs(_22185.z) > 0.89999997615814208984375))));
	                        vec4 _18605 = _7845;
	                        _18605.w = _7845.w * (1.0 - smoothstep(SpritecardVertexControls_t._m2.x, SpritecardVertexControls_t._m2.y, abs(dot(normalize(_22185), normalize(PerViewConstantBuffer_t._m8.xyz - input_POSITION0.xyz)))));
	                        _13137 = _18605;
	                        _16397 = _6350;
	                        _16480 = cross(_22185, _6350);
	                    }
	                    else
	                    {
	                        vec4 _13136;
	                        vec3 _16396;
	                        vec3 _16479;
	                        if (_17152 == 4)
	                        {
	                            vec3 _18756 = normalize(_22185);
	                            vec4 _18604 = _7845;
	                            _18604.w = _7845.w * (1.0 - smoothstep(SpritecardVertexControls_t._m2.x, SpritecardVertexControls_t._m2.y, abs(dot(_18756, normalize(PerViewConstantBuffer_t._m8.xyz - input_POSITION0.xyz)))));
	                            _13136 = _18604;
	                            _16396 = normalize(cross(_22185, PerViewConstantBuffer_t._m10));
	                            _16479 = _18756;
	                        }
	                        else
	                        {
	                            _13136 = _7845;
	                            _16396 = vec3(0.0, 1.0, 0.0);
	                            _16479 = vec3(1.0, 0.0, 0.0);
	                        }
	                        _13137 = _13136;
	                        _16397 = _16396;
	                        _16480 = _16479;
	                    }
	                    _13138 = _13137;
	                    _16398 = _16397;
	                    _16481 = _16480;
	                }
	                _13139 = _13138;
	                _16401 = _16398;
	                _16482 = _16481;
	            }
	            _13140 = _13139;
	            _11892 = _16401;
	            _16747 = _16482;
	        }
	        float _13567 = cos(input_TEXCOORD3.x);
	        float _8404 = sin(input_TEXCOORD3.x);
	        vec3 _18015 = (_11892 * _13567) - (_16747 * _8404);
	        float _19825 = sin(input_TEXCOORD3.y);
	        float _8898 = cos(input_TEXCOORD3.y);
	        float _9794 = _18015.x;
	        float _21144 = _9794 * _9794;
	        float _24619 = _18015.y;
	        float _7331 = _24619 * _24619;
	        float _6498 = _18015.z;
	        float _17752 = _6498 * _6498;
	        float _22876 = 1.0 - _8898;
	        float _10272 = (_9794 * _24619) * _22876;
	        float _21408 = _6498 * _19825;
	        float _6451 = (_6498 * _9794) * _22876;
	        float _22637 = _24619 * _19825;
	        float _6440 = (_24619 * _6498) * _22876;
	        float _22945 = _9794 * _19825;
	        mat3 _23397 = mat3(vec3(_21144 + ((1.0 - _21144) * _8898), _10272 - _21408, _6451 + _22637), vec3(_10272 + _21408, _7331 + ((1.0 - _7331) * _8898), _6440 - _22945), vec3(_6451 - _22637, _6440 + _22945, _17752 + ((1.0 - _17752) * _8898)));
	        _13141 = _22185 * _23397;
	        _13204 = _13140;
	        _24249 = ((((_16747 * _13567) + (_11892 * _8404)) * _23397) * (input_TEXCOORD0.x + SpritecardVertexControls_t._m1.y)) + (_18015 * (input_TEXCOORD0.y + SpritecardVertexControls_t._m1.z));
	        break;
	    } while(false);
	    float _20054 = length(PerViewConstantBuffer_t._m8.xyz - input_POSITION0.xyz);
	    float _10020;
	    vec4 _24447;
	    if (SpritecardVertexControls_t._m2.z > 0.0)
	    {
	        float _16605 = SpritecardVertexControls_t._m0.y * _20054;
	        vec4 _20313;
	        if (input_TEXCOORD3.w > _16605)
	        {
	            vec4 _12503;
	            if (input_TEXCOORD3.w > (SpritecardVertexControls_t._m0.z * _20054))
	            {
	                _12503 = vec4(0.0);
	            }
	            else
	            {
	                _12503 = _13204 * (1.0 - ((input_TEXCOORD3.w - _16605) / (_20054 * (SpritecardVertexControls_t._m0.z - SpritecardVertexControls_t._m0.y))));
	            }
	            _20313 = _12503;
	        }
	        else
	        {
	            _20313 = _13204;
	        }
	        _10020 = min(max(input_TEXCOORD3.w, SpritecardVertexControls_t._m0.x * _20054), SpritecardVertexControls_t._m0.w * _20054);
	        _24447 = _20313;
	    }
	    else
	    {
	        _10020 = input_TEXCOORD3.w;
	        _24447 = _13204;
	    }
	    vec3 _19802 = input_POSITION0.xyz + (_24249 * ((_24447.w < 0.0039215688593685626983642578125) ? 0.0 : _10020));
	    vec3 _7336 = _19802.xyz;
	    vec4 _8056 = vec4(_7336, 1.0);
	    vec4 _21447 = PerViewConstantBuffer_t._m7 * 1.0;
	    vec4 _18275 = (_8056 + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    float _14391 = _18275.w;
	    vec4 _8847 = (vec4((_19802 + (PerViewConstantBuffer_t._m10 * SpritecardVertexControls_t._m1.x)).xyz, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    vec4 _14278 = _18275;
	    _14278.z = max(_14391 * (_8847.z / _8847.w), min(0.001000000047497451305389404296875, _18275.z));
	    float _18407 = _19802.z;
	    vec3 _7141 = _7336 - PerViewConstantBuffer_t._m8.xyz;
	    vec3 _19671;
	    if (_21658)
	    {
	        _19671 = faceforward(_13141, _7141.xyz, _13141);
	    }
	    else
	    {
	        _19671 = normalize(-_7141.xyz);
	    }
	    vec3 _19953 = mix(_5, _19671, bvec3((SpritecardVertexControls_t._m9 & 2048u) == 0u));
	    vec3 _9877 = _14278.xyz / vec3(_14391);
	    _9877.y = _9877.y * (-1.0);
	    vec2 _6955 = saturate((_9877.xy * 0.5) + vec2(0.5)) * (PerViewConstantBuffer_t._m4.xy - vec2(0.5));
	    float _22280 = _6955.x;
	    float _17677 = -(_8056.xyzw * PerViewConstantBuffer_t._m1).z;
	    vec4 _21734 = vec4(_22280, _6955.y, _7, _17677);
	    vec3 _20528 = _7336 - PerViewConstantBuffer_t._m8.xyz;
	    float _9273 = abs(SpriteCardPixelControls_t._m1.w);
	    vec4 _9717;
	    float _24878;
	    if (PerViewConstantBufferCitadel_t._m1 != 0u)
	    {
	        vec2 _9342 = saturate(PerViewConstantBufferCitadel_t._m9.xy + (PerViewConstantBufferCitadel_t._m9.zw * vec2(length(_19802.xy - PerViewConstantBufferCitadel_t._m12.xy), _18407)));
	        float _12872 = (pow(_9342.x, PerViewConstantBufferCitadel_t._m10.x) * pow(_9342.y, PerViewConstantBufferCitadel_t._m10.y)) * PerViewConstantBufferCitadel_t._m11.w;
	        _9717 = vec4((vec4(PerViewConstantBufferCitadel_t._m11.xyz, _12872).xyz * _9273) * _12872, 1.0 - _12872);
	        _24878 = max(_12872, 0.0);
	    }
	    else
	    {
	        _9717 = vec4(0.0, 0.0, 0.0, 1.0);
	        _24878 = 0.0;
	    }
	    vec4 _9718;
	    float _24879;
	    if (PerViewConstantBufferCitadel_t._m2 != 0u)
	    {
	        vec3 _13000 = _20528.xyz;
	        float _6587 = max(pow(max(0.0, (length(_13000) * PerViewConstantBufferCitadel_t._m13.y) + PerViewConstantBufferCitadel_t._m13.x), PerViewConstantBufferCitadel_t._m13.w), pow(max(0.0, (_18407 * PerViewConstantBufferCitadel_t._m14.y) + PerViewConstantBufferCitadel_t._m14.x), PerViewConstantBufferCitadel_t._m14.z));
	        vec3 _13062 = textureLod(samplerCube(g_bindless_TextureCube_float4[PerViewConstantBufferCitadel_t._m6], g_bindless_Sampler[_Globals_.g_sTrilinearWrap_NoGlobalMipBias]), normalize((PerViewConstantBufferCitadel_t._m15 * vec4(_13000, 0.0)).xyz).xyz, PerViewConstantBufferCitadel_t._m14.w * saturate(1.0 - (_6587 * PerViewConstantBufferCitadel_t._m13.z))).xyz * PerViewConstantBufferCitadel_t._m16.xyz;
	        vec4 _23718;
	        _23718.x = _13062.x;
	        _23718.y = _13062.y;
	        _23718.z = _13062.z;
	        float _10273 = saturate(_6587);
	        _9718 = vec4(_9717.xyz + ((vec4(_23718.xyz, _10273).xyz * _9273) * _10273), _9717.w * (1.0 - _10273));
	        _24879 = max(_10273, _24878);
	    }
	    else
	    {
	        _9718 = _9717;
	        _24879 = _24878;
	    }
	    vec4 _9719;
	    float _24881;
	    if (PerViewConstantBufferCitadel_t._m0 != 0u)
	    {
	        vec4 _18372 = vec4(_7336 + fma(textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m3], g_bindless_Sampler[_Globals_.g_sPointWrap]), fma(_21734.xy, PerViewLightingConstantBufferGpu_t._m0.zz, PerViewLightingConstantBufferGpu_t._m0.xy).xy, 0.0).xyz, vec3(PerViewConstantBufferCitadel_t._m18._m0), vec3(PerViewConstantBufferCitadel_t._m18._m1)), 1.0) * PerViewConstantBufferCitadel_t._m18._m6;
	        float _20176 = _18372.w;
	        vec2 _10521 = _18372.xy / vec2(_20176);
	        vec4 _22905;
	        _22905.x = _10521.x;
	        _22905.y = _10521.y;
	        float _21043 = (_20176 * PerViewConstantBufferCitadel_t._m18._m3) + PerViewConstantBufferCitadel_t._m18._m2;
	        vec3 _17137 = vec3((_22905.xy * 0.5) + vec2(0.5), _21043);
	        _17137.z = log2((saturate(_21043) * PerViewConstantBufferCitadel_t._m18._m4) + 1.0) * PerViewConstantBufferCitadel_t._m18._m5;
	        vec4 _9908 = textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewConstantBufferCitadel_t._m5], g_bindless_Sampler[_Globals_.g_sFogVolume]), _17137, 0.0);
	        float _10352 = _9908.w;
	        _9719 = vec4(_9718.xyz + (_9908.xyz * saturate(SpriteCardPixelControls_t._m1.w)), _9718.w * _10352);
	        _24881 = max(_10352, _24879);
	    }
	    else
	    {
	        _9719 = _9718;
	        _24881 = _24879;
	    }
	    float _20826;
	    if (SpriteCardPixelControls_t._m2.z != 1.0)
	    {
	        _20826 = mix(SpriteCardPixelControls_t._m2.z, 1.0, pow(_24881, 8.0));
	    }
	    else
	    {
	        _20826 = 1.0;
	    }
	    vec3 _6897 = _19953.xyz;
	    float _11239 = float(PerViewConstantBufferCitadel_t._m8);
	    vec4 _22247;
	    if (SpriteCardPixelControls_t._m0.y != 0.0)
	    {
	        vec3 _13358 = -normalize(_19802.xyz - PerViewConstantBuffer_t._m8.xyz);
	        vec3 _24254 = _13358.xyz;
	        vec3 _18460 = _19953.xyz;
	        float _17197 = saturate(dot(_24254, _18460));
	        vec3 _12200 = vec3(1.0) + (vec3(0.039999999105930328369140625) * (2.0 * _17197));
	        vec3 _7530 = _19802.xyz;
	        vec3 _7105 = normalize(_6897);
	        vec2 _24081 = _21734.xy;
	        uvec2 _12083 = uvec2(_24081 - PerViewConstantBuffer_t._m3.xy) >> uvec2(PerViewLightingConstantBufferGpu_t._m6.x);
	        uint _13530 = PerViewLightingConstantBufferGpu_t._m5.y + (((_12083.y * PerViewLightingConstantBufferGpu_t._m6.y) + _12083.x) * PerViewLightingConstantBufferGpu_t._m5.z);
	        uint _23393 = PerViewLightingConstantBufferGpu_t._m5.x + (uint(clamp(_17677 * PerViewLightingConstantBufferGpu_t._m7.x, 0.0, PerViewLightingConstantBufferGpu_t._m7.y)) * PerViewLightingConstantBufferGpu_t._m5.z);
	        vec4 _13143;
	        vec4 _16305;
	        vec3 _17114;
	        float _17115;
	        vec3 _17116;
	        float _17117;
	        _13143 = vec4(0.0);
	        _16305 = vec4(0.0);
	        _17114 = vec3(0.0);
	        _17115 = 0.0;
	        _17116 = vec3(0.0);
	        _17117 = 0.0;
	        uint _21568;
	        vec4 _13145;
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
	            _13145 = _13143;
	            _16306 = _17114;
	            _17118 = _17116;
	            _17119 = _17115;
	            _17120 = _16305;
	            _17121 = _17117;
	            _15708 = _15803;
	            uint _10307;
	            vec4 _13147;
	            vec3 _16307;
	            bool _16483;
	            vec3 _17122;
	            float _17123;
	            vec4 _17124;
	            float _17190;
	            uint _10864 = _14475;
	            bool _19485;
	            for (;;)
	            {
	                _19485 = _10864 != 0u;
	                if (!(_19485 ? _15708 : false))
	                {
	                    break;
	                }
	                uint _18153 = uint(findLSB(_10864));
	                int _12608 = int(_18153 + (_9999 * 32u));
	                _10307 = _10864 & (_10864 - 1u);
	                vec3 _11008;
	                float _14482;
	                SPIRV_CROSS_BRANCH
	                if ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m7 & 1u) != 0u)
	                {
	                    float _8220 = 1.0 - saturate((length(_7336 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m6) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.x) + PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.y);
	                    if (_8220 == 0.0)
	                    {
	                        _13147 = _13145;
	                        _16307 = _16306;
	                        _17122 = _17118;
	                        _17123 = _17119;
	                        _17124 = _17120;
	                        _17190 = _17121;
	                        _16483 = _15708;
	                        _13145 = _13147;
	                        _16306 = _16307;
	                        _17118 = _17122;
	                        _17119 = _17123;
	                        _17120 = _17124;
	                        _17121 = _17190;
	                        _15708 = _16483;
	                        _10864 = _10307;
	                        continue;
	                    }
	                    _11008 = _7105;
	                    _14482 = _8220;
	                }
	                else
	                {
	                    vec3 _7743 = (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_7530, 1.0)).xyz;
	                    vec3 _8804 = saturate((_7743 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m1) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                    vec3 _19651 = saturate((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m3 - _7743) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                    float _17265 = min(min(_8804.x, min(_8804.y, _8804.z)), min(_19651.x, min(_19651.y, _19651.z)));
	                    if (_17265 == 0.0)
	                    {
	                        _13147 = _13145;
	                        _16307 = _16306;
	                        _17122 = _17118;
	                        _17123 = _17119;
	                        _17124 = _17120;
	                        _17190 = _17121;
	                        _16483 = _15708;
	                        _13145 = _13147;
	                        _16306 = _16307;
	                        _17118 = _17122;
	                        _17119 = _17123;
	                        _17120 = _17124;
	                        _17121 = _17190;
	                        _15708 = _16483;
	                        _10864 = _10307;
	                        continue;
	                    }
	                    _11008 = (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_7105, 0.0)).xyz;
	                    _14482 = _17265;
	                }
	                float _11058 = (_14482 * _14482) * (((-2.0) * _14482) + 3.0);
	                float _9613 = _11058 * (1.0 - _17121);
	                float _6671 = _17121 + _9613;
	                float _8288;
	                vec4 _13146;
	                vec3 _15184;
	                if (int(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9) >= 0)
	                {
	                    float _21648 = _11058 * (1.0 - _17119);
	                    vec3 _24895 = PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m0 * vec4(_7530, 1.0);
	                    vec3 _6343 = _24895.xyz;
	                    vec3 _6393 = _6343;
	                    _6393.z = _24895.z * 0.16666667163372039794921875;
	                    vec3 _19423 = clamp(_6393.xyz, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m1, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m2);
	                    _19423.z = _19423.z * 6.0;
	                    vec3 _23126 = (_19423.xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7;
	                    _23126.z = _23126.z * 0.16666667163372039794921875;
	                    vec3 _15791 = mix(vec3(0.0, 0.16666667163372039794921875, 0.3333333432674407958984375), vec3(0.5, 0.666666686534881591796875, 0.833333313465118408203125), step(_18460, vec3(0.0)).xyz);
	                    vec3 _18910 = _18460 * _18460;
	                    _13146 = _13145 + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m6], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), ((saturate(_6343).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7).xyz, 0.0).xyzw * _21648);
	                    _15184 = _16306 + (((((textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.x), 0.0).xyz * _18910.x) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.y), 0.0).xyz * _18910.y)) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.z), 0.0).xyz * _18910.z)).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m4.xyz) * _21648);
	                    _8288 = _17119 + _21648;
	                }
	                else
	                {
	                    _13146 = _13145;
	                    _15184 = _16306;
	                    _8288 = _17119;
	                }
	                bool _7464;
	                if (_6671 > 0.9900000095367431640625)
	                {
	                    _7464 = _8288 > 0.9900000095367431640625;
	                }
	                else
	                {
	                    _7464 = false;
	                }
	                _13147 = _13146;
	                _16307 = _15184;
	                _17122 = _17118 + ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m8 * _9613) * textureLod(samplerCubeArray(g_bindless_TextureCubeArray[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m4], g_bindless_Sampler[_Globals_.g_sTrilinearWrap_NoGlobalMipBias]), vec4(_11008.xyz, float(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m2)), PerViewLightingConstantBufferGpu_t._m8.y).xyz);
	                _17123 = _8288;
	                _17124 = _17120 + (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m10 * _9613);
	                _17190 = _6671;
	                _16483 = !_7464;
	                _13145 = _13147;
	                _16306 = _16307;
	                _17118 = _17122;
	                _17119 = _17123;
	                _17120 = _17124;
	                _17121 = _17190;
	                _15708 = _16483;
	                _10864 = _10307;
	                continue;
	            }
	            _21568 = _9999 + 1u;
	            _13143 = _13145;
	            _16305 = _17120;
	            _17114 = _16306;
	            _17115 = _17119;
	            _17116 = _17118;
	            _17117 = _17121;
	            _15803 = _15708;
	            _9999 = _21568;
	            continue;
	        }
	        float _6278 = 1.0 - _17117;
	        vec4 _23875 = vec4(_7105.xyz, 1.0);
	        vec4 _19344 = vec4(_18460, 1.0);
	        vec3 _24042 = _17114 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m2._m0[0].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m2._m0[1].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m2._m0[2].xyzw, _19344)) * (1.0 - _17115));
	        vec4 _11487 = textureLod(sampler2DArray(g_bindless_Texture2DArray_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), vec3((vec2(1.0, sqrt(1.0 - _17197)) * 0.984375) + vec2(0.0078125), 1.0).xyz, 0.0);
	        vec3 _8803 = mix(_11487.xxx, _11487.yyy, vec3(0.039999999105930328369140625));
	        float _12486 = 1.0 - _11487.y;
	        vec3 _23170 = ((_8803 * vec3(0.085714280605316162109375)) / (vec3(1.0) - (vec3(0.085714280605316162109375) * _12486))) * _12486;
	        float _13144 = 1.0 - dot(_13143, PerViewLightingConstantBufferGpu_t._m12);
	        float _11857 = (dot(_6897, PerViewLightingConstantBufferGpu_t._m10.xyz) > 0.0) ? _13144 : 0.0;
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
	            int _23991;
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
	                vec4 _16719 = vec4(_20528, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_13039];
	                float _12779 = _16719.x;
	                if (max(abs(_12779), abs(_16719.y)) < PerViewLightingConstantBufferGpu_t._m15[_13039])
	                {
	                    _11806 = vec3(_12779, _16719.yz);
	                    _9382 = _13039;
	                    break;
	                }
	                _23991 = _13039 + 1;
	                _13039 = _23991;
	                continue;
	            }
	            float _15297;
	            if (_9382 >= 0)
	            {
	                vec2 _22600 = _24081;
	                _22600.x = _22280 + _11239;
	                int _20353 = int(fract(52.98291778564453125 * fract(dot(_22600, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                vec2 _22193 = vec2(1.0) - saturate((abs(_11806.xy) * vec2(PerViewLightingConstantBufferGpu_t._m17)) + vec2(PerViewLightingConstantBufferGpu_t._m16));
	                float _20456 = saturate(_22193.x * _22193.y);
	                mat2 _14940 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m26._m0[_20353].xy), vec2(-PerViewLightingConstantBufferGpu_t._m26._m0[_20353].y, PerViewLightingConstantBufferGpu_t._m26._m0[_20353].x));
	                float _12244 = saturate(_11806.z + PerViewLightingConstantBufferGpu_t._m22._m0[_9382].y);
	                float _13148;
	                float _16324;
	                _13148 = 0.0;
	                _16324 = 0.0;
	                uint _21569;
	                float _13149;
	                float _16325;
	                uint _17017 = 0u;
	                for (;;)
	                {
	                    if (!(_17017 < 16u))
	                    {
	                        break;
	                    }
	                    vec4 _16100 = textureGather(sampler2D(g_bindless_Texture2D[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_11806.xy + (_14940 * (_76[_17017].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_9382].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].xy));
	                    _13149 = _13148;
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
	                        float _14149 = _16100[_17018] - _12244;
	                        float _9229 = step(0.0, _14149);
	                        _16615 = _16325 + _9229;
	                        _23259 = _13149 + (_9229 * _14149);
	                        _14722 = _17018 + 1u;
	                        _13149 = _23259;
	                        _16325 = _16615;
	                        _17018 = _14722;
	                        continue;
	                    }
	                    _21569 = _17017 + 1u;
	                    _13148 = _13149;
	                    _16324 = _16325;
	                    _17017 = _21569;
	                    continue;
	                }
	                float _19848 = (2.0 * saturate(_16324 * 0.015625)) - 1.0;
	                float _22550 = float(int(sign(_19848)));
	                float _14815 = 1.0 - (_22550 * _19848);
	                float _10969 = 0.5 - (0.5 * ((1.0 - mix((_14815 * _14815) * _14815, _14815, saturate((_13148 / _16324) / _12244))) * _22550));
	                float _23748;
	                if (_9382 > PerViewLightingConstantBufferGpu_t._m14)
	                {
	                    _23748 = _13144 * _10969;
	                }
	                else
	                {
	                    _23748 = _10969;
	                }
	                float _12504;
	                SPIRV_CROSS_BRANCH
	                if (_20456 < 1.0)
	                {
	                    int _15335 = _9382 + 1;
	                    vec4 _23643 = vec4(_20528, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_15335];
	                    float _6559;
	                    if (_15335 < PerViewLightingConstantBufferGpu_t._m13)
	                    {
	                        float _12245 = saturate(_23643.z + PerViewLightingConstantBufferGpu_t._m22._m0[_15335].y);
	                        float _13150;
	                        float _16326;
	                        _13150 = 0.0;
	                        _16326 = 0.0;
	                        uint _21570;
	                        float _13151;
	                        float _16328;
	                        uint _17019 = 0u;
	                        for (;;)
	                        {
	                            if (!(_17019 < 16u))
	                            {
	                                break;
	                            }
	                            vec4 _16409 = textureGather(sampler2D(g_bindless_Texture2D[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_23643.xy + (_14940 * (_76[_17019].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_15335].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].xy));
	                            _13151 = _13150;
	                            _16328 = _16326;
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
	                                _16616 = _16328 + _9230;
	                                _23260 = _13151 + (_9230 * _14150);
	                                _14723 = _17020 + 1u;
	                                _13151 = _23260;
	                                _16328 = _16616;
	                                _17020 = _14723;
	                                continue;
	                            }
	                            _21570 = _17019 + 1u;
	                            _13150 = _13151;
	                            _16326 = _16328;
	                            _17019 = _21570;
	                            continue;
	                        }
	                        float _19849 = (2.0 * saturate(_16326 * 0.015625)) - 1.0;
	                        float _22551 = float(int(sign(_19849)));
	                        float _14816 = 1.0 - (_22551 * _19849);
	                        _6559 = 0.5 - (0.5 * ((1.0 - mix((_14816 * _14816) * _14816, _14816, saturate((_13150 / _16326) / _12245))) * _22551));
	                    }
	                    else
	                    {
	                        _6559 = 1.0;
	                    }
	                    float _7934;
	                    if (_15335 > PerViewLightingConstantBufferGpu_t._m14)
	                    {
	                        _7934 = _13144 * _6559;
	                    }
	                    else
	                    {
	                        _7934 = _6559;
	                    }
	                    _12504 = mix(_7934, _23748, _20456);
	                }
	                else
	                {
	                    _12504 = _23748;
	                }
	                _15297 = _12504;
	            }
	            else
	            {
	                _15297 = _13144;
	            }
	            _21710 = mix(_15297, _13144, saturate((length(_20528) * PerViewLightingConstantBufferGpu_t._m19) + PerViewLightingConstantBufferGpu_t._m18));
	        }
	        else
	        {
	            _21710 = _11857;
	        }
	        vec3 _13064 = (PerViewConstantBufferCitadel_t._m17.xyz * PerViewLightingConstantBufferGpu_t._m11.xyz) * _21710;
	        bool _12886;
	        if (_21710 > 0.0)
	        {
	            _12886 = dot(PerViewLightingConstantBufferGpu_t._m10.xyz, _18460) > 0.0;
	        }
	        else
	        {
	            _12886 = false;
	        }
	        vec3 _13212;
	        vec3 _15670;
	        SPIRV_CROSS_BRANCH
	        if (_12886)
	        {
	            float _15489 = saturate(dot(_18460, PerViewLightingConstantBufferGpu_t._m10.xyz));
	            _13212 = PerViewLightingConstantBufferGpu_t._m4.xyz + (_13064 * _15489);
	            _15670 = ((((vec3(0.039999999105930328369140625) + (vec3(0.959999978542327880859375) * pow(max(0.0, 1.0 - saturate(dot(PerViewLightingConstantBufferGpu_t._m10.xyz, normalize(PerViewLightingConstantBufferGpu_t._m10.xyz + _24254)))), 5.0))) * ((0.5 / max(9.9999997473787516355514526367188e-06, _15489 + saturate(dot(_6897, _13358)))) * _15489)) * _12200).xyz * 1.0) * _13064;
	        }
	        else
	        {
	            _13212 = PerViewLightingConstantBufferGpu_t._m4.xyz;
	            _15670 = vec3(0.0);
	        }
	        vec3 _13153;
	        vec3 _16329;
	        _13153 = _13212;
	        _16329 = _15670;
	        uint _8897;
	        vec3 _10913;
	        vec3 _17551;
	        uint _17021 = 0u;
	        for (;;)
	        {
	            if (!(_17021 < PerViewLightingConstantBufferGpu_t._m25))
	            {
	                break;
	            }
	            int _19022 = int(_17021);
	            do
	            {
	                vec3 _10086 = -normalize(_20528);
	                float _15846 = 1.0 - dot(_13143, g_BarnLights_1._m0[_19022]._m10);
	                if (_15846 == 0.0)
	                {
	                    _10913 = _13153;
	                    _17551 = _16329;
	                    break;
	                }
	                vec3 _12573 = _20528.xyz;
	                vec4 _24896 = g_BarnLights_1._m0[_19022]._m0 * vec4(_12573, 1.0);
	                vec3 _10522 = _24896.xyz / vec3(_24896.w);
	                vec4 _22906;
	                _22906.x = _10522.x;
	                _22906.y = _10522.y;
	                float _21779 = _10522.z;
	                vec4 _20418 = _22906;
	                _20418.z = _21779;
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
	                    _12887 = !all(lessThanEqual(abs((g_BarnLights_1._m0[_19022]._m15 * vec4(_20528, 1.0)).xyz), vec3(1.0)));
	                }
	                if (_12887)
	                {
	                    _10913 = _13153;
	                    _17551 = _16329;
	                    break;
	                }
	                if (((dot(g_BarnLights_1._m0[_19022]._m16.xyz, _6897) - dot(_20528, _6897)) + (2.0 * g_BarnLights_1._m0[_19022]._m16.w)) < 0.0)
	                {
	                    _10913 = _13153;
	                    _17551 = _16329;
	                    break;
	                }
	                float _23571 = 2.0 * g_BarnLights_1._m0[_19022]._m5.y;
	                float _18492 = (2.0 * g_BarnLights_1._m0[_19022]._m5.z) * g_BarnLights_1._m0[_19022]._m5.z;
	                float _14805 = 2.0 * g_BarnLights_1._m0[_19022]._m5.x;
	                float _9058 = _14805 * g_BarnLights_1._m0[_19022]._m5.y;
	                float _17330 = 2.0 * g_BarnLights_1._m0[_19022]._m5.w;
	                float _19826 = _17330 * g_BarnLights_1._m0[_19022]._m5.z;
	                vec3 _16268 = vec3(_9058 - _19826, (1.0 - (_14805 * g_BarnLights_1._m0[_19022]._m5.x)) - _18492, (_23571 * g_BarnLights_1._m0[_19022]._m5.z) + (_17330 * g_BarnLights_1._m0[_19022]._m5.x)) * g_BarnLights_1._m0[_19022]._m6.z;
	                float _21316;
	                if (g_BarnLights_1._m0[_19022]._m3.z > 0.0)
	                {
	                    _21316 = smoothstep(0.0, 1.0, _21779 * g_BarnLights_1._m0[_19022]._m3.z);
	                }
	                else
	                {
	                    _21316 = 1.0;
	                }
	                float _19672;
	                if (g_BarnLights_1._m0[_19022]._m3.w > 0.0)
	                {
	                    _19672 = _21316 * smoothstep(0.0, 1.0, (1.0 - _21779) * g_BarnLights_1._m0[_19022]._m3.w);
	                }
	                else
	                {
	                    _19672 = _21316;
	                }
	                vec3 _11183;
	                float _13818;
	                if (g_BarnLights_1._m0[_19022]._m2.w != 0.0)
	                {
	                    vec3 _10017 = g_BarnLights_1._m0[_19022]._m2.xyz - _12573;
	                    float _18346 = dot(_10017, _10017);
	                    float _17647 = sqrt(_18346);
	                    vec3 _20958 = _10017 - _16268;
	                    vec3 _10312;
	                    do
	                    {
	                        vec3 _20229 = (_10017 + _16268) - _20958;
	                        float _25105 = dot(-_20958, _20229);
	                        if (_25105 <= 0.0)
	                        {
	                            _10312 = _20958;
	                            break;
	                        }
	                        else
	                        {
	                            _10312 = _20958 + (_20229 * min(1.0, _25105 / dot(_20229, _20229)));
	                            break;
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    _11183 = _10017 / vec3(_17647);
	                    _13818 = ((_19672 * (g_BarnLights_1._m0[_19022]._m2.w / max(_18346, g_BarnLights_1._m0[_19022]._m2.w))) * smoothstep(0.0, 1.0, g_BarnLights_1._m0[_19022]._m3.x + (g_BarnLights_1._m0[_19022]._m3.y * _17647))) * saturate(g_BarnLights_1._m0[_19022]._m6.x + (g_BarnLights_1._m0[_19022]._m6.y * dot(vec3((1.0 - (_23571 * g_BarnLights_1._m0[_19022]._m5.y)) - _18492, _9058 + _19826, (_14805 * g_BarnLights_1._m0[_19022]._m5.z) - (_17330 * g_BarnLights_1._m0[_19022]._m5.y)), normalize(_10312))));
	                }
	                else
	                {
	                    _11183 = g_BarnLights_1._m0[_19022]._m2.xyz;
	                    _13818 = _19672;
	                }
	                vec3 _20538 = ((g_BarnLights_1._m0[_19022]._m4.xyz * _15846) * _15846).xyz * _13818;
	                vec3 _21571;
	                SPIRV_CROSS_BRANCH
	                if (g_BarnLights_1._m0[_19022]._m4.w == 0.0)
	                {
	                    float _10351;
	                    do
	                    {
	                        vec2 _22154 = abs(_20418.xy);
	                        if (g_BarnLights_1._m0[_19022]._m9.z == 0.0)
	                        {
	                            _10351 = smoothstep(1.0, g_BarnLights_1._m0[_19022]._m9.x, _22154.x) * smoothstep(1.0, g_BarnLights_1._m0[_19022]._m9.y, _22154.y);
	                            break;
	                        }
	                        else
	                        {
	                            float _11473 = _22154.x;
	                            float _15266 = 2.0 / g_BarnLights_1._m0[_19022]._m9.z;
	                            float _15017 = _22154.y;
	                            float _23041 = (-0.5) * g_BarnLights_1._m0[_19022]._m9.z;
	                            float _11981 = (g_BarnLights_1._m0[_19022]._m9.x * g_BarnLights_1._m0[_19022]._m9.y) * pow(max(pow(g_BarnLights_1._m0[_19022]._m9.y * _11473, _15266) + pow(g_BarnLights_1._m0[_19022]._m9.x * _15017, _15266), 1.1754943508222875079687365372222e-38), _23041);
	                            float _16524 = pow(max(pow(_11473, _15266) + pow(_15017, _15266), 1.1754943508222875079687365372222e-38), _23041);
	                            if (_11981 < _16524)
	                            {
	                                _10351 = smoothstep(_16524, _11981, 1.0);
	                                break;
	                            }
	                            else
	                            {
	                                _10351 = float(_16524 > 1.0);
	                                break;
	                            }
	                            break; // unreachable workaround
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    _21571 = _20538.xyz * _10351;
	                }
	                else
	                {
	                    vec3 _12505;
	                    if (g_BarnLights_1._m0[_19022]._m4.w < 0.0)
	                    {
	                        vec4 _17805 = vec4(-g_BarnLights_1._m0[_19022]._m5.xyz, g_BarnLights_1._m0[_19022]._m5.w);
	                        vec4 _19008 = _17805.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                        vec3 _24989 = _19008.xyz;
	                        vec3 _23629 = vec4((-_11183).xyz, 0.0).xyz;
	                        float _15156 = -dot(_23629, _24989);
	                        vec3 _20479 = vec4((_23629 * _19008.w) + cross(_23629, _24989), _15156).xyz;
	                        vec3 _23593 = _17805.xyz;
	                        vec3 _12170 = ((_20479 * g_BarnLights_1._m0[_19022]._m5.w) + (_23593 * _15156)) + cross(_23593, _20479);
	                        vec3 _14081 = vec3(vec2(atan(_12170.y, -_12170.x) * 0.15915493667125701904296875, acos(_12170.z) * 0.3183098733425140380859375), -g_BarnLights_1._m0[_19022]._m4.w);
	                        vec2 _20562 = (_14081.xy * g_BarnLights_1._m0[_19022]._m9.zw) + g_BarnLights_1._m0[_19022]._m9.xy;
	                        vec3 _20489 = _14081;
	                        _20489.x = _20562.x;
	                        _20489.y = _20562.y;
	                        _12505 = _20538.xyz * textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightingConstantBufferGpu_t._m24], g_bindless_Sampler[_Globals_.g_sTrilinearWrap]), _20489.xyz, 0.0).xyz;
	                    }
	                    else
	                    {
	                        vec3 _13791 = vec3(fma(_20418.xy, vec2(0.5, -0.5), vec2(0.5)), g_BarnLights_1._m0[_19022]._m4.w);
	                        vec2 _20561 = (_13791.xy * g_BarnLights_1._m0[_19022]._m9.zw) + g_BarnLights_1._m0[_19022]._m9.xy;
	                        vec3 _20488 = _13791;
	                        _20488.x = _20561.x;
	                        _20488.y = _20561.y;
	                        _12505 = _20538.xyz * textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightingConstantBufferGpu_t._m24], g_bindless_Sampler[_Globals_.g_sCookieSampler]), _20488.xyz, 0.0).xyz;
	                    }
	                    _21571 = _12505;
	                }
	                if (all(equal(_21571.xyz, vec3(0.0))))
	                {
	                    _10913 = _13153;
	                    _17551 = _16329;
	                    break;
	                }
	                bool _10515 = g_BarnLights_1._m0[_19022]._m8.z > 0.0;
	                float _12888;
	                if (_10515)
	                {
	                    _12888 = g_BarnLights_1._m0[_19022]._m12;
	                }
	                else
	                {
	                    _12888 = 0.0;
	                }
	                vec3 _19629;
	                if (_10515)
	                {
	                    vec3 _11450 = vec3(_22906.xy, 1.0 - _21779);
	                    vec3 _21711;
	                    if ((g_BarnLights_1._m0[_19022]._m13 & 4u) != 0u)
	                    {
	                        vec2 _6281 = _11450.yx * vec2(1.0, -1.0);
	                        vec3 _23749 = _11450;
	                        _23749.x = _6281.x;
	                        _23749.y = _6281.y;
	                        _21711 = _23749;
	                    }
	                    else
	                    {
	                        _21711 = _11450;
	                    }
	                    vec2 _7339 = _24081;
	                    _7339.x = _22280 + (_11239 + float(_19022));
	                    int _23750 = int(fract(52.98291778564453125 * fract(dot(_7339, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                    mat2 _14942 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m26._m0[_23750].xy), vec2(-PerViewLightingConstantBufferGpu_t._m26._m0[_23750].y, PerViewLightingConstantBufferGpu_t._m26._m0[_23750].x));
	                    float _12246 = saturate(_21711.z + 9.9999999747524270787835121154785e-07);
	                    float _13155;
	                    _13155 = 0.0;
	                    uint _21572;
	                    float _13156;
	                    uint _16209 = 0u;
	                    for (;;)
	                    {
	                        if (!(_16209 < 1u))
	                        {
	                            break;
	                        }
	                        vec4 _23854 = textureGather(sampler2D(g_bindless_Texture2D_1[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_21711.xy + (_14942 * (_76[_16209].xy * g_BarnLights_1._m0[_19022]._m22)), vec2(-1.0), vec2(1.0)).xy, g_BarnLights_1._m0[_19022]._m8.zw, g_BarnLights_1._m0[_19022]._m8.xy));
	                        _13156 = _13155;
	                        uint _9583;
	                        float _19760;
	                        uint _16210 = 0u;
	                        for (;;)
	                        {
	                            if (!(_16210 < 4u))
	                            {
	                                break;
	                            }
	                            _19760 = _13156 + step(0.0, _23854[_16210] - _12246);
	                            _9583 = _16210 + 1u;
	                            _13156 = _19760;
	                            _16210 = _9583;
	                            continue;
	                        }
	                        _21572 = _16209 + 1u;
	                        _13155 = _13156;
	                        _16209 = _21572;
	                        continue;
	                    }
	                    vec3 _24492 = _21571.xyz * mix(1.0, 1.0 - (_13155 * 0.25), _12888);
	                    if (all(equal(_24492.xyz, vec3(0.0))))
	                    {
	                        _10913 = _13153;
	                        _17551 = _16329;
	                        break;
	                    }
	                    _19629 = _24492;
	                }
	                else
	                {
	                    _19629 = _21571 * mix(1.0, 1.0, _12888);
	                }
	                float _7221 = saturate(dot(_18460, _11183.xyz));
	                vec3 _16230 = normalize(_11183.xyz + _10086.xyz);
	                vec2 _16715 = max(vec2(1.0), vec2(g_BarnLights_1._m0[_19022]._m11));
	                float _23802 = _16715.x;
	                float _21243 = dot(_16230, _6897);
	                float _6782 = saturate(dot(_6897, _10086.xyz));
	                float _22508 = _23802 * _23802;
	                float _12091 = _22508 * _22508;
	                float _13087 = (((_21243 * _12091) - _21243) * _21243) + 1.0;
	                float _16907 = 1.0 - _22508;
	                _10913 = _13153.xyz + (_19629 * _7221);
	                _17551 = _16329.xyz + (((((vec3(0.039999999105930328369140625) + (vec3(0.959999978542327880859375) * pow(max(0.0, 1.0 - saturate(dot(_11183.xyz, _16230))), 5.0))) * (((_12091 / max(9.9999999392252902907785028219223e-09, _13087 * _13087)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_7221 * ((_6782 * _16907) + _22508)) + (_6782 * ((_7221 * _16907) + _22508))))) * _7221)) * _12200).xyz * 1.0) * _19629);
	                break;
	            } while(false);
	            _8897 = _17021 + 1u;
	            _13153 = _10913;
	            _16329 = _17551;
	            _17021 = _8897;
	            continue;
	        }
	        vec3 _18059 = (((_13153 + ((_24042 * (vec3(1.0) - (_8803 + _23170))).xyz * vec3(1.000099658966064453125))) + _16329) + ((((_8803 * ((_17116 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m2._m0[0].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m2._m0[1].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m2._m0[2].xyzw, _23875)) * _6278)) * min(dot(_24042.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) / dot(_19344, (_16305 + (PerViewLightingConstantBufferGpu_t._m3 * _6278)).xyzw), max(PerViewLightingConstantBufferGpu_t._m1.x + PerViewLightingConstantBufferGpu_t._m1.y, 1.0)))) * 1.0) + ((_23170 * _24042) * 1.0)).xyz * saturate(pow(saturate(dot(_6897, _13358)) + 1.0, 1.0)))) * 1.0;
	        vec4 _8809 = vec4(0.0, 0.0, 0.0, 1.0);
	        _8809.x = _18059.x;
	        _8809.y = _18059.y;
	        _8809.z = _18059.z;
	        _22247 = _8809;
	    }
	    else
	    {
	        _22247 = vec4(0.0, 0.0, 0.0, 1.0);
	    }
	    output_0 = _9982;
	    output_1 = _24447;
	    output_2 = _19802;
	    output_3 = _19953;
	    output_4 = _23824;
	    output_5 = _22247;
	    output_6 = vec4(_9719.xyz * _20826, mix(1.0, _9719.w, _20826));
	    _14278.y = -_18275.y;
	    gl_Position = _14278;
	    gl_ClipDistance[0] = dot(_8056, PerViewConstantBuffer_t._m2.xyzw);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_DRAW_AS_TRAIL, F_DRAW_AS_TRAIL );
	StaticCombo( S_NORMAL_MAP, F_NORMAL_MAP );
	StaticCombo( S_REFRACT, F_REFRACT );
	StaticCombo( S_MOTION_VECTORS, F_MOTION_VECTORS );
	StaticCombo( S_HSV_SHIFT, F_HSV_SHIFT );
	StaticCombo( S_SPHERICAL_HARMONIC_LIGHTING, F_SPHERICAL_HARMONIC_LIGHTING );
	StaticCombo( S_TEXTURE_LAYERS, F_TEXTURE_LAYERS );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_NORMAL_MAP ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_REFRACT ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_MOTION_VECTORS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_HSV_SHIFT ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_SPHERICAL_HARMONIC_LIGHTING ) );
	StaticComboRule( Allow1( S_NORMAL_MAP, S_SPHERICAL_HARMONIC_LIGHTING, S_DRAW_AS_TRAIL ) );
	StaticComboRule( Allow1( S_NORMAL_MAP, S_SPHERICAL_HARMONIC_LIGHTING, S_REFRACT ) );
	StaticComboRule( Requires( S_SPHERICAL_HARMONIC_LIGHTING, S_TEXTURE_LAYERS==0 ) );
	DynamicCombo( D_DISCARD_IN_FRONT_OF_REFRACTIVE, 0..1 );
	DynamicCombo( D_SATURATION_VOLUMES, 0..1 );
	DynamicCombo( D_DEPTH_FEATHERING, 0..1 );
	DynamicCombo( D_MBOIT_PASS, 0..2 );
	DynamicCombo( D_PANORAMA_PARTICLE, 0..1 );
	DynamicComboRule( Requires( D_DISCARD_IN_FRONT_OF_REFRACTIVE, S_REFRACT ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, S_REFRACT, D_SATURATION_VOLUMES ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_FRONT_DEPTH, D_DEPTH_FEATHERING ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_MBOIT_PASS ) );
	DynamicComboRule( Allow1( S_MODE_FRONT_DEPTH, D_MBOIT_PASS ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_SPHERICAL_HARMONIC_LIGHTING==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_NORMAL_MAP==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_MODE_TOOLS_WIREFRAME==0 ) );
	DynamicComboRule( Requires( D_PANORAMA_PARTICLE, S_MODE_FRONT_DEPTH==0 ) );
	DynamicComboRule( Allow1( D_PANORAMA_PARTICLE, D_MBOIT_PASS ) );
	DynamicComboRule( Allow1( D_PANORAMA_PARTICLE, D_SATURATION_VOLUMES ) );
	
	RenderState(BlendEnable, true);
	RenderState(BlendOp, F_LIGHTEN_MODE ? Max : Add);
	RenderState(DepthFunc, F_DISABLE_DEPTHTEST ? Always : F_REVERSE_DEPTH ? Less : GreaterEqual);
	RenderState(DepthWriteEnable, false);
	RenderState(DstBlend, F_LIGHTEN_MODE || (F_MOD2X ? 2 : 5));
	RenderState(DstBlendAlpha, One);
	RenderState(SrcBlend, F_MOD2X ? DestColor : One);
	RenderState(SrcBlendAlpha, F_MOD2X ? Zero : InvDestAlpha);
	RenderState(StencilFunc, NotEqual);
	RenderState(StencilRef, 1);
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	#if (S_MODE_TOOLS_WIREFRAME == 1)
	#endif
	#if (S_MODE_FRONT_DEPTH == 1)
	#endif
	#if (S_NORMAL_MAP == 1)
	#endif
	#if (S_REFRACT == 1)
	#endif
	#if (S_MOTION_VECTORS == 1)
	#endif
	#if (S_HSV_SHIFT == 1)
	#endif
	#if (S_SPHERICAL_HARMONIC_LIGHTING == 1)
	#endif
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// Only Logical addressing model can be used with HLSL.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#if defined(GL_AMD_gpu_shader_half_float)
	#extension GL_AMD_gpu_shader_half_float : require
	#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
	#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
	#else
	#error No extension available for FP16.
	#endif
	#extension GL_EXT_shader_16bit_storage : require
	#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
	#extension GL_EXT_buffer_reference2 : require
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
	
	const vec2 _1270[15] = vec2[](vec2(1.0, 0.0), vec2(0.0), vec2(0.0, 1.0), vec2(0.0), vec2(1.0, 0.0), vec2(1.0, 0.0), vec2(0.0), vec2(0.0, 1.0), vec2(0.0), vec2(1.0, 0.0), vec2(1.0, 0.0), vec2(1.0, 0.0), vec2(0.0), vec2(0.0), vec2(0.0));
	float _3;
	vec4 _4;
	
	struct _2244
	{
	    vec4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    vec4 _m4;
	    vec4 _m5;
	    vec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    uvec2 _m9;
	    uint _m10;
	};
	
	layout(set = 1) uniform _2244 SpriteCardPixelControls_t;
	
	struct _1002
	{
	    uint g_sPointClamp;
	    uint g_sParticleTrilinearWrap;
	    uint g_sParticleTrilinearClampUV;
	};
	
	layout(set = 1) uniform _1002 _Globals_;
	
	struct _1017
	{
	    vec4 _m0;
	};
	
	layout(set = 1) uniform _1017 PerViewConstantBuffer_t;
	
	struct _982
	{
	    uint _m0;
	};
	
	layout(set = 1) uniform _982 PerViewConstantBufferCitadel_t;
	
	layout(push_constant, std430) uniform _981_6012
	{
	    uint _m0;
	} _6012;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 0) in vec4 input_0;
	layout(location = 1) in vec4 input_1;
	layout(location = 4) flat in vec4 input_4;
	layout(location = 5) in vec4 input_5;
	layout(location = 6) in vec4 input_6;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	
	void main()
	{
	    bool _12575;
	    vec4 _5271 = vec4(1.0);
	    bool _21944 = (SpriteCardPixelControls_t._m10 & 1u) != 0u;
	    vec4 _16418 = input_0.xyzw;
	    _16418.x = input_0.x;
	    _16418.z = input_0.z;
	    int _9501 = int(SpriteCardPixelControls_t._m3.z);
	    vec4 _6691;
	    do
	    {
	        _12575 = float(_9501 & 1) == 1.0;
	        if (_12575)
	        {
	            _6691 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _16418.xy);
	            break;
	        }
	        _6691 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _16418.xy);
	        break;
	    } while(false);
	    vec4 _16417 = _6691;
	    if (_21944)
	    {
	        vec4 _12941 = _16417;
	        vec3 _13126 = _12941.xyz - vec3(0.005859375, 0.009765625, 0.005859375);
	        _16417.x = _13126.x;
	        _16417.y = _13126.y;
	        _16417.z = _13126.z;
	    }
	    vec4 _16419 = _16417;
	    bool _12885;
	    if ((SpriteCardPixelControls_t._m10 & 32768u) > 0u)
	    {
	        _12885 = input_4.x > (-1.0);
	    }
	    else
	    {
	        _12885 = false;
	    }
	    if (_12885)
	    {
	        vec4 _6692;
	        do
	        {
	            if (_12575)
	            {
	                _6692 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _16418.zw);
	                break;
	            }
	            _6692 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _16418.zw);
	            break;
	        } while(false);
	        vec4 _16416 = _6692;
	        if (_21944)
	        {
	            vec4 _12942 = _16416;
	            vec3 _13127 = _12942.xyz - vec3(0.005859375, 0.009765625, 0.005859375);
	            _16416.x = _13127.x;
	            _16416.y = _13127.y;
	            _16416.z = _13127.z;
	        }
	        int _21358;
	        do
	        {
	            if ((SpriteCardPixelControls_t._m10 & 1024u) != 0u)
	            {
	                _21358 = 1;
	                break;
	            }
	            else
	            {
	                _21358 = 0;
	                break;
	            }
	            break; // unreachable workaround
	        } while(false);
	        vec4 _7078;
	        if (_21358 == 1)
	        {
	            _7078 = mix(_16419, _16416, vec4(input_4.x));
	        }
	        else
	        {
	            _7078 = mix(vec4(0.0), _16419, bvec4(_21358 == 0));
	        }
	        vec4 _6729;
	        if (_21358 == 2)
	        {
	            float _10302 = (1.0 - input_4.x) * sqrt(max(0.001000000047497451305389404296875, dot(_16419.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))));
	            float _18360 = input_4.x * sqrt(max(0.001000000047497451305389404296875, dot(_16416.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))));
	            _6729 = ((_16419 * _10302) + (_16416 * _18360)) / vec4(_18360 + _10302);
	        }
	        else
	        {
	            _6729 = _7078;
	        }
	        _16419 = _6729;
	    }
	    int _15090 = int(SpriteCardPixelControls_t._m9.x);
	    uvec3 _14488 = uvec3(vec3(float(uint((int(SpriteCardPixelControls_t._m9.y) >> 16) & 15)), float(uint(_15090 & 15)), float(uint(((_15090 & 255) >> 4) & 15))));
	    uvec4 _20506;
	    _20506.x = _14488.x;
	    _20506.y = _14488.y;
	    _20506.z = _14488.z;
	    vec4 _6864;
	    do
	    {
	        vec4 _13174;
	        bool _16054;
	        SPIRV_CROSS_BRANCH
	        switch (_20506.x)
	        {
	            case 0u:
	            {
	                _13174 = _16419;
	                _16054 = true;
	                break;
	            }
	            case 1u:
	            {
	                vec4 _16415 = _16419;
	                float _21531 = fract(SpriteCardPixelControls_t._m7.z * _16418.z);
	                float _16439 = _21531 / (((-0.39999997615814208984375) * (1.0 - _21531)) + 1.0);
	                float _16066 = mix(4.0, 1.0, _16439);
	                float _14967 = mix(1.0, 0.0625, _16439);
	                vec2 _9434 = dFdx(_16418.xy);
	                vec2 _12566 = _9434 * _16066;
	                vec2 _9402 = dFdy(_16418.xy);
	                vec2 _15406 = _9402 * _16066;
	                vec4 _14917 = _16418 - vec4(0.5);
	                vec4 _17877 = (_14917 * _16066) + vec4(0.5);
	                vec2 _15903 = _9434 * _14967;
	                vec2 _11320 = _9402 * _14967;
	                vec4 _7426 = (_14917 * _14967) + vec4(0.5);
	                vec4 _12905;
	                do
	                {
	                    if (_12575)
	                    {
	                        _12905 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _17877.xy, _12566.xy, _15406.xy);
	                        break;
	                    }
	                    _12905 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _17877.xy, _12566.xy, _15406.xy);
	                    break;
	                } while(false);
	                vec4 _19630;
	                do
	                {
	                    if (_12575)
	                    {
	                        _19630 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _7426.xy, _15903.xy, _11320.xy);
	                        break;
	                    }
	                    _19630 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _7426.xy, _15903.xy, _11320.xy);
	                    break;
	                } while(false);
	                vec4 _13679 = mix(_19630.xyzw, _12905.xyzw, vec4(_16439 * _16439));
	                _16415.x = _13679.x;
	                _16415.y = _13679.y;
	                _16415.z = _13679.z;
	                _16415.w = _13679.w;
	                _16415.w = mix(_16419.w, _16415.w, float(_20506.y != 3u));
	                _13174 = _16415;
	                _16054 = true;
	                break;
	            }
	            case 3u:
	            {
	                vec2 _16414 = _16418.xy;
	                vec3 _23252 = _16419.xyz * 12.9200000762939453125;
	                vec3 _7487 = (pow(_16419.xyz, vec3(0.4166666567325592041015625)) * 1.05499994754791259765625) - vec3(0.054999999701976776123046875);
	                float _21357;
	                if (_16419.x <= 0.003130800090730190277099609375)
	                {
	                    _21357 = _23252.x;
	                }
	                else
	                {
	                    _21357 = _7487.x;
	                }
	                float _19458;
	                if (_16419.y <= 0.003130800090730190277099609375)
	                {
	                    _19458 = _23252.y;
	                }
	                else
	                {
	                    _19458 = _7487.y;
	                }
	                vec2 _10457 = _16418.xy - (((vec3(_21357, _19458, _3).xy - vec2(0.5)) * 2.0) * (((SpriteCardPixelControls_t._m7.w * _16418.w) * 0.125) * _16419.w));
	                _16414.x = _10457.x;
	                _16414.y = _10457.y;
	                vec4 _12502;
	                do
	                {
	                    if (_12575)
	                    {
	                        _12502 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _16414.xy);
	                        break;
	                    }
	                    _12502 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _16414.xy);
	                    break;
	                } while(false);
	                _13174 = _12502;
	                _16054 = true;
	                break;
	            }
	            case 4u:
	            {
	                vec4 _16413 = _16419;
	                float _21530 = fract(SpriteCardPixelControls_t._m7.z * _16418.z);
	                float _16438 = _21530 / (((-0.39999997615814208984375) * (1.0 - _21530)) + 1.0);
	                float _16065 = mix(4.0, 1.0, _16438);
	                float _14966 = mix(1.0, 0.0625, _16438);
	                vec2 _9433 = dFdx(_16418.xy);
	                vec2 _12565 = _9433 * _16065;
	                vec2 _9401 = dFdy(_16418.xy);
	                vec2 _15405 = _9401 * _16065;
	                vec4 _14916 = _16418 - vec4(0.5);
	                vec4 _17876 = (_14916 * _16065) + vec4(0.5);
	                vec2 _15902 = _9433 * _14966;
	                vec2 _11319 = _9401 * _14966;
	                vec4 _7425 = (_14916 * _14966) + vec4(0.5);
	                vec4 _12904;
	                do
	                {
	                    if (_12575)
	                    {
	                        _12904 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _17876.xy, _12565.xy, _15405.xy);
	                        break;
	                    }
	                    _12904 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _17876.xy, _12565.xy, _15405.xy);
	                    break;
	                } while(false);
	                vec4 _19629;
	                do
	                {
	                    if (_12575)
	                    {
	                        _19629 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _7425.xy, _15902.xy, _11319.xy);
	                        break;
	                    }
	                    _19629 = textureGrad(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _7425.xy, _15902.xy, _11319.xy);
	                    break;
	                } while(false);
	                vec4 _13678 = mix(_19629.xyzw, _12904.xyzw, vec4(_16438 * _16438));
	                _16413.x = _13678.x;
	                _16413.y = _13678.y;
	                _16413.z = _13678.z;
	                _16413.w = _13678.w;
	                _16413.w = mix(_16419.w, _16413.w, float(_20506.y != 3u));
	                vec2 _16412 = _16418.xy;
	                vec3 _23251 = _16413.xyz * 12.9200000762939453125;
	                vec3 _7486 = (pow(_16413.xyz, vec3(0.4166666567325592041015625)) * 1.05499994754791259765625) - vec3(0.054999999701976776123046875);
	                float _21356;
	                if (_16413.x <= 0.003130800090730190277099609375)
	                {
	                    _21356 = _23251.x;
	                }
	                else
	                {
	                    _21356 = _7486.x;
	                }
	                float _19457;
	                if (_16413.y <= 0.003130800090730190277099609375)
	                {
	                    _19457 = _23251.y;
	                }
	                else
	                {
	                    _19457 = _7486.y;
	                }
	                vec2 _10456 = _16418.xy - (((vec3(_21356, _19457, _3).xy - vec2(0.5)) * 2.0) * (((SpriteCardPixelControls_t._m7.w * _16418.w) * 0.125) * _16413.w));
	                _16412.x = _10456.x;
	                _16412.y = _10456.y;
	                vec4 _12501;
	                do
	                {
	                    if (_12575)
	                    {
	                        _12501 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _16412.xy);
	                        break;
	                    }
	                    _12501 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _16412.xy);
	                    break;
	                } while(false);
	                _13174 = _12501;
	                _16054 = true;
	                break;
	            }
	            case 2u:
	            {
	                vec4 _20655 = vec4(_1270[_20506.y].y);
	                vec4 _9219 = mix(mix(vec4(_16419.xyz * _16419.www, 1.0), _16419, vec4(_1270[_20506.y].x)), _16419.wwww, _20655);
	                vec3 _25122 = _9219.xyz;
	                vec3 _17379 = _25122 * 12.9200000762939453125;
	                vec3 _7485 = (pow(_25122, vec3(0.4166666567325592041015625)) * 1.05499994754791259765625) - vec3(0.054999999701976776123046875);
	                float _21354;
	                if (_9219.x <= 0.003130800090730190277099609375)
	                {
	                    _21354 = _17379.x;
	                }
	                else
	                {
	                    _21354 = _7485.x;
	                }
	                float _21355;
	                if (_9219.y <= 0.003130800090730190277099609375)
	                {
	                    _21355 = _17379.y;
	                }
	                else
	                {
	                    _21355 = _7485.y;
	                }
	                float _19456;
	                if (_9219.z <= 0.003130800090730190277099609375)
	                {
	                    _19456 = _17379.z;
	                }
	                else
	                {
	                    _19456 = _7485.z;
	                }
	                vec2 _14593 = vec2((dot(vec3(_21354, _21355, _19456).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) + _16418.x) * _16418.z, _16418.y);
	                vec4 _22247;
	                do
	                {
	                    if (_12575)
	                    {
	                        _22247 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearClampUV]), _14593.xy);
	                        break;
	                    }
	                    _22247 = texture(sampler2D(g_bindless_Texture2D_float4[_6012._m0], g_bindless_Sampler[_Globals_.g_sParticleTrilinearWrap]), _14593.xy);
	                    break;
	                } while(false);
	                vec4 _16409 = _22247;
	                vec4 _16411 = _22247;
	                _16411.w = dot(_22247.xyz, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625));
	                _16409.w = _16419.w;
	                vec4 _15525 = _16409;
	                vec4 _22465 = mix(_15525, _16411, _20655);
	                _16409 = _22465;
	                _13174 = _22465;
	                _16054 = true;
	                break;
	            }
	            default:
	            {
	                _13174 = _4;
	                _16054 = false;
	                break;
	            }
	        }
	        if (_16054)
	        {
	            _6864 = _13174;
	            break;
	        }
	        _6864 = _16419;
	        break;
	    } while(false);
	    float _22608;
	    if (((_9501 >> 12) & 1) != 0)
	    {
	        _22608 = SpriteCardPixelControls_t._m7.y * _16418.w;
	    }
	    else
	    {
	        _22608 = SpriteCardPixelControls_t._m7.y;
	    }
	    vec4 _16408 = _6864;
	    switch (_20506.y)
	    {
	        case 0u:
	        {
	            _16408.w = mix(1.0, 0.0, float(_20506.z == 4u));
	            break;
	        }
	        case 1u:
	        {
	            break;
	        }
	        case 2u:
	        {
	            vec3 _16885 = mix(vec3(1.0), vec3(0.0), vec3(float(_20506.z == 4u)));
	            _16408.x = _16885.x;
	            _16408.y = _16885.y;
	            _16408.z = _16885.z;
	            break;
	        }
	        case 3u:
	        {
	            _16408.w = _6864.w;
	            break;
	        }
	        case 4u:
	        {
	            vec3 _10482 = mix(vec3(1.0), _6864.xyz, vec3(_6864.w));
	            _16408.x = _10482.x;
	            _16408.y = _10482.y;
	            _16408.z = _10482.z;
	            _16408.w = 1.0;
	            break;
	        }
	        case 5u:
	        {
	            vec3 _16090 = mix(vec3(1.0), _6864.xyz, vec3(dot(_6864.xyz, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625))));
	            _16408.x = _16090.x;
	            _16408.y = _16090.y;
	            _16408.z = _16090.z;
	            _16408.w = 1.0;
	            break;
	        }
	        case 6u:
	        {
	            _16408.w = dot(_6864.xyz, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625));
	            break;
	        }
	        case 7u:
	        {
	            vec3 _16884 = mix(vec3(1.0), vec3(0.0), vec3(float(_20506.z == 4u)));
	            _16408.x = _16884.x;
	            _16408.y = _16884.y;
	            _16408.z = _16884.z;
	            _16408.w = dot(_6864.xyz, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625));
	            break;
	        }
	        case 8u:
	        {
	            _16408.x = 1.0;
	            _16408.y = 1.0;
	            _16408.z = 1.0;
	            _16408.w = dot(_6864.xyz, vec3(0.2989999949932098388671875, 0.58700001239776611328125, 0.114000000059604644775390625));
	            break;
	        }
	        case 9u:
	        {
	            _16408.x = _6864.x;
	            _16408.y = _6864.x;
	            _16408.z = _6864.x;
	            _16408.w = 1.0;
	            vec4 _7234 = _16408;
	            vec3 _13760 = mix(_7234.yzw, vec3(0.0), vec3(float(_20506.z == 4u)));
	            _16408.y = _13760.x;
	            _16408.z = _13760.y;
	            _16408.w = _13760.z;
	            break;
	        }
	        case 10u:
	        {
	            _16408.x = _6864.y;
	            _16408.y = _6864.y;
	            _16408.z = _6864.y;
	            _16408.w = 1.0;
	            vec4 _7233 = _16408;
	            vec3 _13759 = mix(_7233.xzw, vec3(0.0), vec3(float(_20506.z == 4u)));
	            _16408.x = _13759.x;
	            _16408.z = _13759.y;
	            _16408.w = _13759.z;
	            break;
	        }
	        case 11u:
	        {
	            _16408.x = _6864.z;
	            _16408.y = _6864.z;
	            _16408.z = _6864.z;
	            _16408.w = 1.0;
	            vec4 _7232 = _16408;
	            vec3 _13758 = mix(_7232.xyw, vec3(0.0), vec3(float(_20506.z == 4u)));
	            _16408.x = _13758.x;
	            _16408.y = _13758.y;
	            _16408.w = _13758.z;
	            break;
	        }
	        case 12u:
	        {
	            _16408.x = _6864.x;
	            _16408.y = _6864.x;
	            _16408.z = _6864.x;
	            _16408.w = _6864.x;
	            vec4 _7231 = _16408;
	            vec2 _13757 = mix(_7231.yz, vec2(0.0), vec2(float(_20506.z == 4u)));
	            _16408.y = _13757.x;
	            _16408.z = _13757.y;
	            break;
	        }
	        case 13u:
	        {
	            _16408.x = _6864.y;
	            _16408.y = _6864.y;
	            _16408.z = _6864.y;
	            _16408.w = _6864.y;
	            vec4 _7230 = _16408;
	            vec2 _13756 = mix(_7230.xz, vec2(0.0), vec2(float(_20506.z == 4u)));
	            _16408.x = _13756.x;
	            _16408.z = _13756.y;
	            break;
	        }
	        case 14u:
	        {
	            _16408.x = _6864.z;
	            _16408.y = _6864.z;
	            _16408.z = _6864.z;
	            _16408.w = _6864.z;
	            vec4 _7229 = _16408;
	            vec2 _13755 = mix(_7229.xy, vec2(0.0), vec2(float(_20506.z == 4u)));
	            _16408.x = _13755.x;
	            _16408.y = _13755.y;
	            break;
	        }
	        default:
	        {
	            break;
	        }
	    }
	    switch (_20506.z)
	    {
	        case 0u:
	        {
	            vec4 _16835 = _16408;
	            _16408.x = _16835.x;
	            _16408.y = _16835.y;
	            _16408.z = _16835.z;
	            _16408.w = _16835.w;
	            break;
	        }
	        case 3u:
	        {
	            vec4 _15326 = _16408;
	            vec4 _10441 = vec4(1.0) + _15326.xyzw;
	            _16408.x = _10441.x;
	            _16408.y = _10441.y;
	            _16408.z = _10441.z;
	            _16408.w = _10441.w;
	            break;
	        }
	        case 4u:
	        {
	            vec4 _15363 = _16408;
	            vec4 _13128 = vec4(1.0) - _15363.xyzw;
	            _16408.x = _13128.x;
	            _16408.y = _13128.y;
	            _16408.z = _13128.z;
	            _16408.w = _13128.w;
	            break;
	        }
	        case 1u:
	        {
	            vec4 _15401 = _16408;
	            vec4 _15811 = _15401.xyzw * vec4(2.0);
	            _16408.x = _15811.x;
	            _16408.y = _15811.y;
	            _16408.z = _15811.z;
	            _16408.w = _15811.w;
	            break;
	        }
	        case 2u:
	        {
	            break;
	        }
	        case 5u:
	        {
	            vec4 _15325 = _16408;
	            vec4 _19225 = (vec4(1.0) + _15325.xyzw) * 0.5;
	            _16408.x = _19225.x;
	            _16408.y = _19225.y;
	            _16408.z = _19225.z;
	            _16408.w = _19225.w;
	            break;
	        }
	        case 6u:
	        {
	            vec4 _10842 = _16408;
	            vec3 _20351 = vec3(1.0) * dot(_10842.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	            _16408.x = _20351.x;
	            _16408.y = _20351.y;
	            _16408.z = _20351.z;
	            break;
	        }
	        default:
	        {
	            break;
	        }
	    }
	    vec4 _8276 = saturate(mix(vec4(1.0), _16408, vec4(_22608)));
	    _16419 = _8276;
	    vec3 _23871 = _8276.xyz * input_1.xyz;
	    _16419.x = _23871.x;
	    _16419.y = _23871.y;
	    _16419.z = _23871.z;
	    vec4 _15572 = _16419;
	    uint _19935 = clamp(SpriteCardPixelControls_t._m10 & 262144u, 0u, 1u);
	    if (_19935 == 0u)
	    {
	        SPIRV_CROSS_BRANCH
	        if (SpriteCardPixelControls_t._m0.w < SpriteCardPixelControls_t._m0.z)
	        {
	            _16419.w = smoothstep(SpriteCardPixelControls_t._m0.w, SpriteCardPixelControls_t._m0.z, _16419.w);
	        }
	        bool _12886;
	        if (_15572.w >= SpriteCardPixelControls_t._m6.x)
	        {
	            _12886 = _15572.w <= SpriteCardPixelControls_t._m6.w;
	        }
	        else
	        {
	            _12886 = false;
	        }
	        SPIRV_CROSS_BRANCH
	        if (_12886)
	        {
	            float _22477;
	            if (_15572.w <= SpriteCardPixelControls_t._m6.z)
	            {
	                _22477 = smoothstep(SpriteCardPixelControls_t._m6.x, SpriteCardPixelControls_t._m6.z, _15572.w);
	            }
	            else
	            {
	                _22477 = smoothstep(SpriteCardPixelControls_t._m6.w, SpriteCardPixelControls_t._m6.y, _15572.w);
	            }
	            _16419 = mix(_16419, SpriteCardPixelControls_t._m5, vec4(_22477));
	        }
	    }
	    vec4 _14375 = _16419;
	    vec3 _12633 = vec3(SpriteCardPixelControls_t._m8.x);
	    vec3 _7353 = mix(_14375.xyz, vec3(dot(_14375.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))), _12633);
	    _16419.x = _7353.x;
	    _16419.y = _7353.y;
	    _16419.z = _7353.z;
	    _16419 = SpriteCardPixelControls_t._m4.xyzw * _16419.xyzw;
	    _16419.w += SpriteCardPixelControls_t._m7.x;
	    if ((SpriteCardPixelControls_t._m10 & 1024u) != 0u)
	    {
	        _16419.w = saturate(_16419.w);
	    }
	    if (_19935 != 0u)
	    {
	        vec4 _13914 = _16419;
	        float _20523 = max(SpriteCardPixelControls_t._m6.x, _13914.w);
	        float _15029 = _13914.w - SpriteCardPixelControls_t._m0.w;
	        _16419.w = (saturate((input_4.z - _15029) / (_13914.w - _15029)) * (-_20523)) + _20523;
	        _16419.w = min(saturate(((input_4.z + input_4.w) - _13914.w) / ((_13914.w + SpriteCardPixelControls_t._m0.z) - _13914.w)) * _20523, _16419.w);
	        _16419.w *= max(SpriteCardPixelControls_t._m6.y, input_1.w);
	    }
	    else
	    {
	        _16419.w *= input_1.w;
	    }
	    _16419.w = _16419.w;
	    if (_16419.w <= 0.0)
	    {
	        discard;
	    }
	    _5271.x = _16419.x;
	    _5271.y = _16419.y;
	    _5271.z = _16419.z;
	    _5271.w = _16419.w;
	    vec4 _6849 = _5271;
	    vec3 _11127 = _6849.xyz * ((input_5.xyz * SpriteCardPixelControls_t._m0.y) + vec3(SpriteCardPixelControls_t._m0.x));
	    _5271.x = _11127.x;
	    _5271.y = _11127.y;
	    _5271.z = _11127.z;
	    vec4 _13026 = _5271;
	    float _9964;
	    if (_21944)
	    {
	        vec3 _16091 = mix(input_1.xyz, vec3(dot(input_1.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))), _12633);
	        vec3 _4115;
	        _4115.x = _16091.x;
	        _4115.y = _16091.y;
	        _4115.z = _16091.z;
	        vec4 _18716 = _5271;
	        vec3 _7354 = mix(vec3(0.5), mix(vec3(0.5), _16419.xyz, _4115.xyz).xyz, vec3(_18716.w));
	        _5271.x = _7354.x;
	        _5271.y = _7354.y;
	        _5271.z = _7354.z;
	        _9964 = _13026.w;
	    }
	    else
	    {
	        vec4 _11991 = _5271;
	        vec3 _16334 = _11991.xyz * SpriteCardPixelControls_t._m1.z;
	        _5271.x = _16334.x;
	        _5271.y = _16334.y;
	        _5271.z = _16334.z;
	        bool _12887;
	        if ((SpriteCardPixelControls_t._m10 & 524288u) == 0u)
	        {
	            _12887 = SpriteCardPixelControls_t._m2.z != 0.0;
	        }
	        else
	        {
	            _12887 = false;
	        }
	        float _10095;
	        if (_12887)
	        {
	            vec4 _8270 = _5271;
	            vec3 _24211 = (_8270.xyz * input_6.w) + input_6.xyz;
	            _5271.x = _24211.x;
	            _5271.y = _24211.y;
	            _5271.z = _24211.z;
	            _10095 = _13026.w * input_6.w;
	        }
	        else
	        {
	            _10095 = _13026.w;
	        }
	        vec4 _11331 = _5271;
	        vec3 _15229 = _11331.xyz * mix(_10095, 1.0, saturate(-SpriteCardPixelControls_t._m1.w));
	        _5271.x = _15229.x;
	        _5271.y = _15229.y;
	        _5271.z = _15229.z;
	        _9964 = _10095;
	    }
	    _5271.w = _9964 * abs(SpriteCardPixelControls_t._m1.w);
	    vec4 _5949 = _5271.xyzw;
	    vec4 _22421;
	    if (_21944)
	    {
	        vec4 _13145 = _5949;
	        vec3 _6738 = saturate(_13145.xyz);
	        _5949.x = _6738.x;
	        _5949.y = _6738.y;
	        _5949.z = _6738.z;
	        _22421 = vec4(0.5);
	    }
	    else
	    {
	        vec2 _23873 = gl_FragCoord.xy * PerViewConstantBuffer_t._m0.xy;
	        vec2 _23854;
	        _23854.x = _23873.x;
	        _23854.y = _23873.y;
	        vec4 _12503;
	        if (gl_FragCoord.z > float(uint16BitsToFloat16(uint16_t(uint(float16BitsToUint16(float16_t(texture(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], g_bindless_Sampler[_Globals_.g_sPointClamp]), _23854.xy).x))) & 4294967294u))))
	        {
	            vec4 _18124 = _5949;
	            _5949 = vec4(0.0);
	            _12503 = _18124;
	        }
	        else
	        {
	            _12503 = vec4(0.0);
	        }
	        _22421 = _12503;
	    }
	    output_0 = _5949;
	    output_1 = _22421;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(translucent, true);
	
}
