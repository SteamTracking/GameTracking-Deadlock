//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Fog Plane Shader.";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	FrontDepth(S_MODE_FRONT_DEPTH);
	Forward();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
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
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;             
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;    // D_COMPRESSED_NORMALS_AND_TANGENTS=1
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                   
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, D_COMPRESSED_NORMALS_AND_TANGENTS ) );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1125
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    uint _m5;
	    uint _m6;
	    float _m7;
	};
	
	struct _1119
	{
	    row_major float3x4 _m0;
	};
	
	ByteAddressBuffer g_instanceBuffer : register(t32, space4);
	ByteAddressBuffer g_transformBuffer : register(t30, space4);
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space0)
	{
	    float4 PerViewConstantBufferCitadel_t_1_m0 : packoffset(c300);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 vPositionOs;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static float2 vTexCoord;
	static float3 output_0;
	static float4 output_1;
	static float3 output_2;
	static float4 output_3;
	static float4 output_4;
	static uint output_5;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	    float3 vNormalOs : TEXCOORD2;
	    float4 vTangentUOs_flTangentVSign : TEXCOORD3;
	    uint4 vBlendIndices : TEXCOORD4;
	    uint nInstanceIdx : TEXCOORD5;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float4 output_1 : TEXCOORD1;
	    float3 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
	    nointerpolation uint output_5 : TEXCOORD5;
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    uint _21785;
	    if (((g_instanceBuffer.Load(nInstanceIdx * 32 + 20) >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4) + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4);
	    }
	    float3x4 _24688 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
	    float4x3 _10676 = transpose(_24688);
	    float3 _7726 = _10676[0];
	    float _17198 = dot(_7726, _7726);
	    float3 _16758 = _10676[1];
	    float _25233 = dot(_16758, _16758);
	    float3 _16759 = _10676[2];
	    float _25234 = dot(_16759, _16759);
	    float3x3 _13976 = transpose(float3x3(_7726 * (1.0f / _17198), _16758 * (1.0f / _25233), _16759 * (1.0f / _25234)));
	    float4 _23812 = float4(uint4(g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 255u, (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 65280u) >> uint(8), (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 16711680u) >> uint(16), (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 4278190080u) >> uint(24))) * 0.0039215688593685626983642578125f.xxxx;
	    float3 _6253 = _23812.xyz;
	    float3 _17828 = _6253 * 0.077399380505084991455078125f.xxx;
	    float3 _7676 = pow((_6253 * 0.947867333889007568359375f.xxx) + 0.052132703363895416259765625f.xxx, 2.400000095367431640625f.xxx);
	    float _21354;
	    if (_23812.x <= 0.040449999272823333740234375f)
	    {
	        _21354 = _17828.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (_23812.y <= 0.040449999272823333740234375f)
	    {
	        _21355 = _17828.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    float3 _21568 = sqrt(float3(_17198, _25233, _25234));
	    float4x3 _20621 = _10676;
	    _20621[0] = _7726 / _21568.x.xxx;
	    _20621[1] = _16758 / _21568.y.xxx;
	    _20621[2] = _16759 / _21568.z.xxx;
	    float4x3 _21739 = transpose(transpose(_20621));
	    float3 _9329 = _21739[0];
	    float3 _16760 = _21739[1];
	    float3 _16761 = _21739[2];
	    float3 _20744 = (_21568 * 64.0f) - abs(mul(float3x3(_9329 * (1.0f / dot(_9329, _9329)), _16760 * (1.0f / dot(_16760, _16760)), _16761 * (1.0f / dot(_16761, _16761))), PerViewConstantBufferCitadel_t_1_m0.xyz - _21739[3]) + float3(0.0f, 0.0f, 100.0f));
	    float3 _22401;
	    if (saturate(min(_20744.x, min(_20744.y, _20744.z)) * 0.00999999977648258209228515625f) > 0.0f)
	    {
	        _22401 = vPositionOs.xyz * 99.0f;
	    }
	    else
	    {
	        _22401 = vPositionOs.xyz;
	    }
	    float3 _23051 = mul(_24688, float4(_22401.xyz, 1.0f));
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_23051.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_13976, vNormalOs.xyz));
	    output_1 = vTexCoord.xyxy;
	    output_2 = _22401;
	    output_3 = float4(_21354, _21355, _19302, _23812.w);
	    output_4 = float4(normalize(mul(_13976, vTangentUOs_flTangentVSign.xyz)), vTangentUOs_flTangentVSign.w);
	    output_5 = nInstanceIdx;
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_23051.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    vPositionOs = stage_input.vPositionOs;
	    vNormalOs = stage_input.vNormalOs;
	    vTangentUOs_flTangentVSign = stage_input.vTangentUOs_flTangentVSign;
	    vTexCoord = stage_input.vTexCoord;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    stage_output.output_4 = output_4;
	    stage_output.output_5 = output_5;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(AllowBackfaceCulling, false);
	BoolAttribute(SupportsAggregateInstancing, false);
	
}

PS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_DISCARD_IN_FRONT_OF_REFRACTIVE, 0..1 );
	DynamicCombo( D_SATURATION_VOLUMES, 0..1 );
	DynamicCombo( D_COSMIC_VEIL_FRONT_DEPTH, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_DISCARD_IN_FRONT_OF_REFRACTIVE ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_SATURATION_VOLUMES ) );
	DynamicComboRule( Requires( D_COSMIC_VEIL_FRONT_DEPTH, S_MODE_DEPTH, S_MODE_FRONT_DEPTH ) );
	
	RenderState(DepthEnable, exists(shadervar_wireframedepthenable) ? shadervar_wireframedepthenable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tClouds < Channel(R, Box(TextureClouds), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tFrameBufferCopyTexture < Attribute("FrameBufferCopyTexture"); SrgbRead(false); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Textures
	CreateInputTexture2D(TextureClouds, Linear, 8, "", "_height", "Textures", Default4(0.5, 0.5, 0.5, 0));
	float g_flFogTextureScale < Default(0.002); Range(0.001, 0.01); UiType(Slider); UiGroup("Textures"); >;
	
	// Layers
	bool g_bSideFog < Default(1); UiType(CheckBox); UiGroup("Layers"); >;
	float g_flCeilingThickness < Default(32); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	float g_flCoreThickness < Default(8); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	float g_flFloorThickness < Default(64); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	float g_flRoofThickness < Default(96); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	float g_flSideStart < Default(16); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	float g_flSideThickness < Default(48); Range(0, 256); UiType(Slider); UiGroup("Layers"); >;
	
	// Fog
	float g_flFogDensity < Default(0.01); Range(0, 0.3); UiType(Slider); UiGroup("Fog"); >;
	
	// Lighting
	float g_flLightingBlurWhenUsingTAA < Default(16); Range(0, 128); UiType(Slider); UiGroup("Lighting"); >;
	float g_flMinOcclusion < Default(0.5); UiType(Slider); UiGroup("Lighting"); >;
	float3 g_vColor < Default3(1, 1, 1); UiType(Color); UiGroup("Lighting"); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 18 (name: g_vColor) cannot be expressed with either HLSL packing layout or packoffset.
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
	
	struct _1125
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    uint _m5;
	    uint _m6;
	    float _m7;
	};
	
	struct _1119
	{
	    mat3x4 _m0;
	};
	
	struct _2016
	{
	    vec4 _m0[3];
	};
	
	struct _2478
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
	
	struct _1866
	{
	    _2036 _m0[128];
	};
	
	struct _2045
	{
	    mat4 _m0[4];
	};
	
	struct _1079
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
	
	struct _1114
	{
	    _1664 _m0[400];
	};
	
	const vec2 _105[32] = vec2[](vec2(0.64073598384857177734375, -0.355204999446868896484375), vec2(-0.725410997867584228515625, -0.68831598758697509765625), vec2(-0.18509499728679656982421875, 0.72264802455902099609375), vec2(0.770596027374267578125, 0.63732397556304931640625), vec2(-0.92144501209259033203125, 0.19699700176715850830078125), vec2(0.07657100260257720947265625, -0.9882199764251708984375), vec2(-0.13480000197887420654296875, -0.0908536016941070556640625), vec2(0.32010900974273681640625, 0.2572410106658935546875), vec2(0.994020998477935791015625, 0.1091929972171783447265625), vec2(0.3049339950084686279296875, 0.952373981475830078125), vec2(-0.698576986789703369140625, 0.715534985065460205078125), vec2(0.548700988292694091796875, -0.836018979549407958984375), vec2(-0.4431590139865875244140625, 0.29612100124359130859375), vec2(0.15067000687122344970703125, -0.489731013774871826171875), vec2(-0.62382900714874267578125, -0.20816700160503387451171875), vec2(-0.29477798938751220703125, -0.5965449810028076171875), vec2(0.334086000919342041015625, -0.12820799648761749267578125), vec2(-0.061983101069927215576171875, 0.311747014522552490234375), vec2(0.166112005710601806640625, 0.616259992122650146484375), vec2(-0.28912699222564697265625, -0.95729100704193115234375), vec2(-0.987479984760284423828125, -0.15774500370025634765625), vec2(0.6375010013580322265625, 0.06515710055828094482421875), vec2(0.971376001834869384765625, -0.23754499852657318115234375), vec2(-0.017059899866580963134765625, 0.98058998584747314453125), vec2(-0.4425640106201171875, 0.89673697948455810546875), vec2(0.4861899912357330322265625, 0.518723011016845703125), vec2(-0.725271999835968017578125, 0.4199649989604949951171875), vec2(0.78141701221466064453125, -0.62400901317596435546875), vec2(-0.89922702312469482421875, -0.43748199939727783203125), vec2(0.769218981266021728515625, 0.3337199985980987548828125), vec2(-0.414411008358001708984375, 0.0037537799216806888580322265625), vec2(0.262856006622314453125, -0.75951397418975830078125));
	
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
	
	layout(set = 4, binding = 32, std430) readonly buffer g_instanceBuffer
	{
	    _1125 _m0[];
	} g_instanceBuffer_1;
	
	layout(set = 4, binding = 30, std430) readonly buffer g_transformBuffer
	{
	    _1119 _m0[];
	} g_transformBuffer_1;
	
	struct _2063
	{
	    mat4 _m0;
	    float _m1;
	    vec2 _m2;
	    vec2 _m3;
	    vec2 _m4;
	    vec4 _m5;
	    float _m6;
	    vec3 _m7;
	    vec3 _m8;
	    vec4 _m9;
	};
	
	layout(set = 1) uniform _2063 PerViewConstantBuffer_t;
	
	struct _2505
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    vec4 _m5;
	    vec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    vec4 _m9;
	    vec4 _m10;
	    vec4 _m11;
	};
	
	layout(set = 1) uniform _2505 PerViewConstantBufferCitadel_t;
	
	struct _2218
	{
	    uint g_sBilinearWrap;
	    uint g_sBilinearClamp;
	    uint g_sTrilinearWrap;
	    uint g_sTrilinearWrap_NoGlobalMipBias;
	    uint g_sPointClamp;
	    uint g_sCookieSampler;
	    uint g_tFrameBufferCopyTexture;
	    float g_flRoofThickness;
	    float g_flCoreThickness;
	    float g_flCeilingThickness;
	    float g_flFloorThickness;
	    float g_flSideStart;
	    float g_flSideThickness;
	    int g_bSideFog;
	    float g_flFogDensity;
	    float g_flFogTextureScale;
	    float g_flLightingBlurWhenUsingTAA;
	    float g_flMinOcclusion;
	    vec3 g_vColor;
	    uint g_tClouds;
	};
	
	layout(set = 1) uniform _2218 _Globals_;
	
	struct _243
	{
	    vec4 _m0;
	    _2016 _m1;
	    vec4 _m2;
	    vec4 _m3;
	    uvec4 _m4;
	    uvec4 _m5;
	    uvec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    _1866 _m9;
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
	    _2045 _m20;
	    _2478 _m21;
	    _2478 _m22;
	    uint _m23;
	    uint _m24;
	    _1079 _m25;
	};
	
	layout(set = 3) uniform _243 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 3, binding = 30, std430) readonly buffer g_CullBits
	{
	    uint _m0[];
	} g_CullBits_1;
	
	struct _176
	{
	    _1114 _m0;
	};
	
	layout(set = 1) uniform _176 PerViewLightProbeVolumeConstantBuffer_t;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_BarnLights
	{
	    layout(row_major) _200 _m0[];
	} g_BarnLights_1;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	layout(set = 4, binding = 46) uniform textureCubeArray g_bindless_TextureCubeArray[65536];
	layout(set = 4, binding = 46) uniform texture3D g_bindless_Texture3D_float4[65536];
	layout(set = 4, binding = 46) uniform texture2DArray g_bindless_Texture2DArray_float4[65536];
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_1[65536];
	
	layout(location = 5) flat in uint input_5;
	layout(location = 2) in vec3 input_2;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    mat4x3 _10676 = transpose(g_transformBuffer_1._m0[g_instanceBuffer_1._m0[input_5]._m1]._m0);
	    vec3 _6681 = _10676[0];
	    vec3 _17989 = _10676[1];
	    vec3 _17970 = _10676[2];
	    vec3 _9718 = sqrt(vec3(dot(_6681, _6681), dot(_17989, _17989), dot(_17970, _17970)));
	    mat4x3 _20621 = _10676;
	    _20621[0] = _6681 / vec3(_9718.x);
	    _20621[1] = _17989 / vec3(_9718.y);
	    _20621[2] = _17970 / vec3(_9718.z);
	    mat3x4 _14389 = transpose(_20621);
	    vec3 _19587 = _9718 * 64.0;
	    vec3 _3528 = _9718 * input_2;
	    vec3 _11866 = vec4(_3528, 1.0) * _14389;
	    mat4x3 _21739 = transpose(_14389);
	    vec3 _9329 = _21739[0];
	    vec3 _16758 = _21739[1];
	    vec3 _16759 = _21739[2];
	    mat3 _17376 = mat3(_9329 * (1.0 / dot(_9329, _9329)), _16758 * (1.0 / dot(_16758, _16758)), _16759 * (1.0 / dot(_16759, _16759)));
	    vec3 _9643 = _21739[3];
	    vec3 _22979 = (PerViewConstantBuffer_t._m7.xyz - _9643) * _17376;
	    vec3 _10933 = normalize(_3528 - _22979);
	    vec3 _17199 = normalize(_11866.xyz - PerViewConstantBuffer_t._m7.xyz);
	    vec3 _14575 = (PerViewConstantBufferCitadel_t._m11.xyz - _9643) * _17376;
	    vec2 _7190 = gl_FragCoord.xy;
	    vec2 _12497 = ((gl_FragCoord.xy * PerViewConstantBuffer_t._m4.xy) * 2.0) - vec2(1.0);
	    vec4 _18334 = vec4(vec3(_12497.x, -_12497.y, texelFetch(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m1], ivec3(ivec2(_7190), 0).xy, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15614 = _18334.xyz / _18334.www;
	    vec4 _22905;
	    _22905.x = _15614.x;
	    _22905.y = _15614.y;
	    _22905.z = _15614.z;
	    uint _25030 = floatBitsToUint(PerViewConstantBuffer_t._m1);
	    uint _7531 = _25030 + (_25030 << uint(10));
	    uint _20813 = _7531 ^ (_7531 >> uint(6));
	    uint _15556 = _20813 + (_20813 << uint(3));
	    uint _20814 = _15556 ^ (_15556 >> uint(11));
	    uvec4 _11912 = uvec4(uvec2(_7190).xy, _20814 + (_20814 << uint(15)), 0u);
	    vec3 _16249 = abs(_14575 + vec3(0.0, 0.0, 100.0));
	    vec3 _20744 = _19587 - _16249;
	    float _12464 = saturate(min(_20744.x, min(_20744.y, _20744.z)) * 0.00999999977648258209228515625);
	    float _10118 = _12464 * 512.0;
	    vec3 _11944;
	    if (_Globals_.g_bSideFog == 0)
	    {
	        vec3 _6984 = _19587;
	        _6984.z = _19587.z + _10118;
	        _11944 = _6984;
	    }
	    else
	    {
	        _11944 = _19587 + vec3(_10118);
	    }
	    vec3 _17083;
	    float _16179 = dot(_17199, _22905.xyz - PerViewConstantBuffer_t._m7.xyz);
	    vec2 _23381;
	    do
	    {
	        _17083 = vec3(1.0) / _10933;
	        vec3 _24791 = ((-_19587) - _22979) * _17083;
	        vec3 _17509 = (_19587 - _22979) * _17083;
	        vec3 _7453 = min(_24791, _17509);
	        vec3 _12729 = max(_24791, _17509);
	        float _15374 = max(_7453.x, max(_7453.y, _7453.z));
	        float _20272 = min(_12729.x, min(_12729.y, _12729.z));
	        vec2 _7465 = vec2(_15374, _20272);
	        float _24383 = max(_15374, 0.0);
	        _7465.x = _24383;
	        if (_24383 >= _20272)
	        {
	            _23381 = vec2(-1.0);
	            break;
	        }
	        _23381 = _7465;
	        break;
	    } while(false);
	    vec2 _9680;
	    if (_12464 > 0.0)
	    {
	        vec2 _12501;
	        do
	        {
	            vec3 _24792 = ((-_11944) - _22979) * _17083;
	            vec3 _17510 = (_11944 - _22979) * _17083;
	            vec3 _7454 = min(_24792, _17510);
	            vec3 _12730 = max(_24792, _17510);
	            float _15375 = max(_7454.x, max(_7454.y, _7454.z));
	            float _20273 = min(_12730.x, min(_12730.y, _12730.z));
	            vec2 _7466 = vec2(_15375, _20273);
	            float _24384 = max(_15375, 0.0);
	            _7466.x = _24384;
	            if (_24384 >= _20273)
	            {
	                _12501 = vec2(-1.0);
	                break;
	            }
	            _12501 = _7466;
	            break;
	        } while(false);
	        _9680 = _12501;
	    }
	    else
	    {
	        _9680 = vec2(-1.0);
	    }
	    bool _10838;
	    float _20543;
	    vec3 _21413 = vec3(0.0, 0.0, 100.0) + (_10933 * 50.0);
	    vec3 _10169 = _22979 - _14575;
	    float _17698 = length(_21413 - _10169);
	    float _15574 = 0.5 * _17698;
	    float _19221 = 2.0 * _17698;
	    float _13140;
	    float _16308;
	    float _16882;
	    float _17152;
	    do
	    {
	        _20543 = _9680.y;
	        _10838 = !(_20543 > 0.0);
	        if (_10838)
	        {
	            _13140 = 0.0;
	            _16308 = 0.0;
	            _17152 = 0.0;
	            _16882 = 1.0;
	            break;
	        }
	        bool _24663 = _23381.y > 0.0;
	        if (_23381.x == 0.0)
	        {
	            _13140 = 0.0;
	            _16308 = 0.0;
	            _17152 = 0.0;
	            _16882 = 1.0;
	            break;
	        }
	        float _20819 = (_20543 - _9680.x) * 0.25;
	        float _13136;
	        float _16305;
	        float _17114;
	        float _17115;
	        _13136 = 0.0;
	        _16305 = 0.0;
	        _17114 = 0.0;
	        _17115 = 1.0;
	        float _7258;
	        int _8896;
	        float _13139;
	        float _14891;
	        float _16307;
	        float _18360;
	        int _17017 = 0;
	        float _17133 = _9680.x;
	        for (;;)
	        {
	            if (!(_17017 < 4))
	            {
	                break;
	            }
	            _7258 = _17133 + _20819;
	            float _7534 = min(_7258, _16179);
	            float _23727;
	            if (_24663)
	            {
	                _23727 = min(_7534, _23381.x);
	            }
	            else
	            {
	                _23727 = _7534;
	            }
	            if (_17133 < _23727)
	            {
	                float _7627 = mix(_17133, _23727, 0.5);
	                vec3 _10595 = _22979 + (_10933 * _7627);
	                bool _12885;
	                if (_Globals_.g_bSideFog != 0)
	                {
	                    _12885 = true;
	                }
	                else
	                {
	                    _12885 = _10595.z > (_19587.z - _Globals_.g_flRoofThickness);
	                }
	                float _13137;
	                float _16306;
	                float _16479;
	                float _17190;
	                if (_12885)
	                {
	                    vec3 _14823 = _10595 - _14575;
	                    vec3 _7808;
	                    do
	                    {
	                        vec3 _19537 = _10169 - _21413;
	                        float _11853 = dot(_14823 - _21413, _19537);
	                        if (_11853 <= 0.0)
	                        {
	                            _7808 = _21413;
	                            break;
	                        }
	                        else
	                        {
	                            float _21155 = dot(_19537, _19537);
	                            if (_11853 > _21155)
	                            {
	                                _7808 = _10169;
	                                break;
	                            }
	                            else
	                            {
	                                _7808 = _21413 + (_19537 * (_11853 / _21155));
	                                break;
	                            }
	                            break; // unreachable workaround
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    float _22990 = exp2(((-((_Globals_.g_flFogDensity * _12464) * saturate((length(_14823 - _7808) - _15574) / (_19221 - _15574)))) * (_23727 - _17133)) * 1.44269502162933349609375);
	                    float _21162 = 1.0 - _22990;
	                    float _20802 = _17115 * _21162;
	                    _13137 = _13136 + _20802;
	                    _16306 = _16305 + ((_7627 * _17115) * _21162);
	                    _17190 = _17114 + _20802;
	                    _16479 = _17115 * _22990;
	                }
	                else
	                {
	                    _13137 = _13136;
	                    _16306 = _16305;
	                    _17190 = _17114;
	                    _16479 = _17115;
	                }
	                _13139 = _13137;
	                _16307 = _16306;
	                _14891 = _17190;
	                _18360 = _16479;
	            }
	            else
	            {
	                _13139 = _13136;
	                _16307 = _16305;
	                _14891 = _17114;
	                _18360 = _17115;
	            }
	            _8896 = _17017 + 1;
	            _13136 = _13139;
	            _16305 = _16307;
	            _17114 = _14891;
	            _17115 = _18360;
	            _17133 = _7258;
	            _17017 = _8896;
	            continue;
	        }
	        _13140 = _13136;
	        _16308 = _16305;
	        _17152 = _17114;
	        _16882 = _17115;
	        break;
	    } while(false);
	    bool _10839;
	    float _20544;
	    float _13145;
	    float _16312;
	    float _16884;
	    float _17153;
	    do
	    {
	        _20544 = _23381.y;
	        _10839 = !(_20544 > 0.0);
	        if (_10839)
	        {
	            _13145 = _13140;
	            _16312 = _16308;
	            _17153 = _17152;
	            _16884 = _16882;
	            break;
	        }
	        float _17777 = _19587.z;
	        float _8140 = _17777 - _Globals_.g_flRoofThickness;
	        float _8141 = _8140 - _Globals_.g_flCoreThickness;
	        float _8142 = _8141 - _Globals_.g_flCeilingThickness;
	        float _16173 = _Globals_.g_flFloorThickness - _17777;
	        vec3 _21738 = _16249 - _19587;
	        bool _18980 = _Globals_.g_bSideFog != 0;
	        float _25241 = _18980 ? mix(0.20000000298023223876953125 * _Globals_.g_flFogDensity, 0.0, (saturate(max(_21738.x, max(_21738.y, _21738.z)) * 0.006666666828095912933349609375) * (-1.0)) + 1.0) : 0.0;
	        float _20820 = (_20544 - _23381.x) * 0.0416666679084300994873046875;
	        float _13141;
	        float _16309;
	        float _17116;
	        float _17117;
	        _13141 = _13140;
	        _16309 = _16308;
	        _17116 = _17152;
	        _17117 = _16882;
	        int _8897;
	        float _25132;
	        float _13144;
	        float _14892;
	        float _16311;
	        float _18361;
	        int _17018 = 0;
	        float _17134 = _23381.x;
	        for (;;)
	        {
	            if (!(_17018 < 24))
	            {
	                break;
	            }
	            _25132 = _17134 + _20820;
	            float _18376 = min(_25132, _16179);
	            if (_17134 < _18376)
	            {
	                float _7628 = mix(_17134, _18376, 0.5);
	                vec3 _6328 = _22979 + (_10933 * _7628);
	                vec4 _11179 = textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tClouds], g_bindless_Sampler[_Globals_.g_sBilinearWrap]), (_6328.xy * _Globals_.g_flFogTextureScale).xy, 0.0);
	                float _16834 = _11179.x;
	                float _9641 = _6328.z;
	                float _13143;
	                float _14948;
	                float _15599;
	                float _16310;
	                float _17118;
	                if (_9641 > _8140)
	                {
	                    float _19903 = 0.5 * _Globals_.g_flRoofThickness;
	                    float _17652 = _8140 + (_19903 * _16834);
	                    _13143 = 0.0;
	                    _16310 = 1.0;
	                    _17118 = _12464 * _Globals_.g_flFogDensity;
	                    _14948 = _17652;
	                    _15599 = _17652 + _19903;
	                }
	                else
	                {
	                    bool _23532 = _9641 > _8141;
	                    float _11267;
	                    float _13142;
	                    float _14861;
	                    if (_23532)
	                    {
	                        _13142 = _9641;
	                        _14861 = _9641 - 1.0;
	                        _11267 = 0.0;
	                    }
	                    else
	                    {
	                        bool _23533 = _9641 > _8142;
	                        float _10458;
	                        float _11692;
	                        if (_23533)
	                        {
	                            float _19902 = 0.5 * _Globals_.g_flCeilingThickness;
	                            float _19855 = _8142 + (_19902 * _16834);
	                            _11692 = _19855 + _19902;
	                            _10458 = _19855;
	                        }
	                        else
	                        {
	                            bool _12886;
	                            if (_18980)
	                            {
	                                _12886 = _9641 < _16173;
	                            }
	                            else
	                            {
	                                _12886 = false;
	                            }
	                            float _13212;
	                            float _15670;
	                            if (_12886)
	                            {
	                                float _19940 = 0.5 * _Globals_.g_flFloorThickness;
	                                float _22540 = (_19940 * _16834) - _17777;
	                                _13212 = _22540;
	                                _15670 = _22540 + _19940;
	                            }
	                            else
	                            {
	                                _13212 = _9641;
	                                _15670 = _9641;
	                            }
	                            _11692 = _13212;
	                            _10458 = _15670;
	                        }
	                        _13142 = _11692;
	                        _14861 = _10458;
	                        _11267 = _23533 ? 0.0 : 1.0;
	                    }
	                    _13143 = _11267;
	                    _16310 = _23532 ? 0.0 : 1.0;
	                    _17118 = _25241;
	                    _14948 = _13142;
	                    _15599 = _14861;
	                }
	                float _11242 = saturate((_9641 - _15599) / (_14948 - _15599));
	                float _15692 = (_11242 * (_Globals_.g_flFogDensity - _17118)) + _17118;
	                bool _12887;
	                if (_18980)
	                {
	                    _12887 = _9641 < _8141;
	                }
	                else
	                {
	                    _12887 = false;
	                }
	                float _13825;
	                if (_12887)
	                {
	                    _13825 = max(_15692, (saturate((min(_19587.x - abs(_6328.x), _19587.y - abs(_6328.y)) - _Globals_.g_flSideStart) / _Globals_.g_flSideThickness) * (-_Globals_.g_flFogDensity)) + _Globals_.g_flFogDensity);
	                }
	                else
	                {
	                    _13825 = _15692;
	                }
	                vec3 _22053 = _6328 - _14575;
	                vec3 _7809;
	                do
	                {
	                    vec3 _19538 = _10169 - _21413;
	                    float _11854 = dot(_22053 - _21413, _19538);
	                    if (_11854 <= 0.0)
	                    {
	                        _7809 = _21413;
	                        break;
	                    }
	                    else
	                    {
	                        float _21156 = dot(_19538, _19538);
	                        if (_11854 > _21156)
	                        {
	                            _7809 = _10169;
	                            break;
	                        }
	                        else
	                        {
	                            _7809 = _21413 + (_19538 * (_11854 / _21156));
	                            break;
	                        }
	                        break; // unreachable workaround
	                    }
	                    break; // unreachable workaround
	                } while(false);
	                float _22606 = exp2(((-(_13825 * saturate((length(_22053 - _7809) - _15574) / (_19221 - _15574)))) * (_18376 - _17134)) * 1.44269502162933349609375);
	                float _16851 = 1.0 - _22606;
	                _13144 = _13141 + (_17117 * _16851);
	                _16311 = _16309 + ((_7628 * _17117) * _16851);
	                _14892 = _17116 + ((((_11242 * (_13143 - _16310)) + _16310) * _17117) * _16851);
	                _18361 = _17117 * _22606;
	            }
	            else
	            {
	                _13144 = _13141;
	                _16311 = _16309;
	                _14892 = _17116;
	                _18361 = _17117;
	            }
	            _8897 = _17018 + 1;
	            _13141 = _13144;
	            _16309 = _16311;
	            _17116 = _14892;
	            _17117 = _18361;
	            _17134 = _25132;
	            _17018 = _8897;
	            continue;
	        }
	        _13145 = _13141;
	        _16312 = _16309;
	        _17153 = _17116;
	        _16884 = _17117;
	        break;
	    } while(false);
	    float _13149;
	    float _14949;
	    float _15600;
	    float _16316;
	    do
	    {
	        if (_10838)
	        {
	            _13149 = _17153;
	            _16316 = _16312;
	            _14949 = _13145;
	            _15600 = _16884;
	            break;
	        }
	        if (_10839)
	        {
	            _13149 = _17153;
	            _16316 = _16312;
	            _14949 = _13145;
	            _15600 = _16884;
	            break;
	        }
	        float _20821 = (_20543 - _9680.x) * 0.25;
	        float _13146;
	        float _16313;
	        float _17119;
	        float _17120;
	        _13146 = _13145;
	        _16313 = _16312;
	        _17119 = _17153;
	        _17120 = _16884;
	        int _8898;
	        float _21904;
	        float _13148;
	        float _14893;
	        float _16315;
	        float _18362;
	        int _17019 = 0;
	        float _17135 = _9680.x;
	        for (;;)
	        {
	            if (!(_17019 < 4))
	            {
	                break;
	            }
	            _21904 = _17135 + _20821;
	            float _11440 = min(_21904, _16179);
	            float _13909 = max(_17135, _20544);
	            if (_13909 < _11440)
	            {
	                float _7629 = mix(_13909, _11440, 0.5);
	                vec3 _10596 = _22979 + (_10933 * _7629);
	                bool _12888;
	                if (_Globals_.g_bSideFog != 0)
	                {
	                    _12888 = true;
	                }
	                else
	                {
	                    _12888 = _10596.z > (_19587.z - _Globals_.g_flRoofThickness);
	                }
	                float _13147;
	                float _16314;
	                float _16481;
	                float _17191;
	                if (_12888)
	                {
	                    vec3 _14824 = _10596 - _14575;
	                    vec3 _7810;
	                    do
	                    {
	                        vec3 _19539 = _10169 - _21413;
	                        float _11855 = dot(_14824 - _21413, _19539);
	                        if (_11855 <= 0.0)
	                        {
	                            _7810 = _21413;
	                            break;
	                        }
	                        else
	                        {
	                            float _21157 = dot(_19539, _19539);
	                            if (_11855 > _21157)
	                            {
	                                _7810 = _10169;
	                                break;
	                            }
	                            else
	                            {
	                                _7810 = _21413 + (_19539 * (_11855 / _21157));
	                                break;
	                            }
	                            break; // unreachable workaround
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    float _22991 = exp2(((-((_Globals_.g_flFogDensity * _12464) * saturate((length(_14824 - _7810) - _15574) / (_19221 - _15574)))) * (_11440 - _13909)) * 1.44269502162933349609375);
	                    float _21163 = 1.0 - _22991;
	                    float _20803 = _17120 * _21163;
	                    _13147 = _13146 + _20803;
	                    _16314 = _16313 + ((_7629 * _17120) * _21163);
	                    _17191 = _17119 + _20803;
	                    _16481 = _17120 * _22991;
	                }
	                else
	                {
	                    _13147 = _13146;
	                    _16314 = _16313;
	                    _17191 = _17119;
	                    _16481 = _17120;
	                }
	                _13148 = _13147;
	                _16315 = _16314;
	                _14893 = _17191;
	                _18362 = _16481;
	            }
	            else
	            {
	                _13148 = _13146;
	                _16315 = _16313;
	                _14893 = _17119;
	                _18362 = _17120;
	            }
	            _8898 = _17019 + 1;
	            _13146 = _13148;
	            _16313 = _16315;
	            _17119 = _14893;
	            _17120 = _18362;
	            _17135 = _21904;
	            _17019 = _8898;
	            continue;
	        }
	        _13149 = _17119;
	        _16316 = _16313;
	        _14949 = _13146;
	        _15600 = _17120;
	        break;
	    } while(false);
	    if ((0.9900000095367431640625 - _15600) < 0.0)
	    {
	        discard;
	    }
	    float _9917 = _16316 / max(9.9999997473787516355514526367188e-06, _14949);
	    float _9681;
	    if (_Globals_.g_bSideFog != 0)
	    {
	        float _12502;
	        if (_20544 > 0.0)
	        {
	            _12502 = min(_9917, _20544);
	        }
	        else
	        {
	            _12502 = 0.0;
	        }
	        _9681 = _12502;
	    }
	    else
	    {
	        _9681 = _9917;
	    }
	    vec3 _12430 = _22979 + (_10933 * _9681);
	    float _15303 = dot(PerViewConstantBuffer_t._m8, _17199 * _9681);
	    float _24388 = PerViewConstantBuffer_t._m6 / _15303;
	    bool _12889;
	    if (PerViewConstantBufferCitadel_t._m4 > 0u)
	    {
	        _12889 = _Globals_.g_flLightingBlurWhenUsingTAA > 0.0;
	    }
	    else
	    {
	        _12889 = false;
	    }
	    vec3 _20691;
	    if (_12889)
	    {
	        _11912.w = 1u;
	        uvec4 _8720 = (_11912 * uvec4(1664525u)) + uvec4(1013904223u);
	        uint _9762 = _8720.y;
	        uint _22261 = _8720.w;
	        uint _25171 = _8720.x + (_9762 * _22261);
	        uint _14316 = _8720.z;
	        uint _22283 = _9762 + (_14316 * _25171);
	        uint _24675 = _14316 + (_25171 * _22283);
	        uvec4 _18731 = uvec4(_25171, _22283, _24675, _22261 + (_22283 * _24675));
	        uvec4 _14318 = _18731 ^ (_18731 >> uvec4(16u));
	        uint _21164 = _14318.y;
	        uint _25172 = _14318.x + (_21164 * _14318.w);
	        uint _14319 = _14318.z;
	        uint _22284 = _21164 + (_14319 * _25172);
	        vec3 _18903 = vec3(uintBitsToFloat(1065353216u | (_25172 >> uint(9))) - 1.0, uintBitsToFloat(1065353216u | (_22284 >> uint(9))) - 1.0, uintBitsToFloat(1065353216u | ((_14319 + (_25172 * _22284)) >> uint(9))) - 1.0);
	        _20691 = _12430 + ((vec3(ivec3(sign(_18903 - vec3(0.5)))) * (vec3(1.0) - sqrt(vec3(1.0) - abs((_18903 * 2.0) - vec3(1.0))))) * _Globals_.g_flLightingBlurWhenUsingTAA);
	    }
	    else
	    {
	        _20691 = _12430;
	    }
	    vec3 _6893 = vec4(_20691, 1.0) * _14389;
	    vec3 _3172 = _6893.xyz;
	    vec3 _3379 = _3172 - PerViewConstantBuffer_t._m7.xyz;
	    vec3 _18290 = normalize((vec4(0.0, 0.0, 1.0, 0.0) * _14389).xyz);
	    float _10147 = float(PerViewConstantBufferCitadel_t._m3);
	    vec3 _13353 = -normalize(_6893.xyz - PerViewConstantBuffer_t._m7.xyz);
	    vec3 _24254 = _13353.xyz;
	    vec3 _18460 = _18290.xyz;
	    float _17197 = saturate(dot(_24254, _18460));
	    vec3 _12200 = vec3(1.0) + (vec3(0.039999999105930328369140625) * (2.0 * _17197));
	    vec3 _7264 = _6893.xyz;
	    vec3 _9451 = normalize(_18290);
	    uvec2 _12083 = uvec2(_7190 - PerViewConstantBuffer_t._m3.xy) >> uvec2(PerViewLightingConstantBufferGpu_t._m6.x);
	    uint _7520 = (_12083.y * PerViewLightingConstantBufferGpu_t._m6.y) + _12083.x;
	    uint _13530 = PerViewLightingConstantBufferGpu_t._m5.y + (_7520 * PerViewLightingConstantBufferGpu_t._m5.z);
	    uint _6274 = uint(clamp(_15303 * PerViewLightingConstantBufferGpu_t._m7.x, 0.0, PerViewLightingConstantBufferGpu_t._m7.y));
	    uint _23393 = PerViewLightingConstantBufferGpu_t._m5.x + (_6274 * PerViewLightingConstantBufferGpu_t._m5.z);
	    vec4 _13150;
	    vec4 _16317;
	    vec3 _17121;
	    float _17122;
	    vec3 _17123;
	    float _17124;
	    _13150 = vec4(0.0);
	    _16317 = vec4(0.0);
	    _17121 = vec3(0.0);
	    _17122 = 0.0;
	    _17123 = vec3(0.0);
	    _17124 = 0.0;
	    uint _21567;
	    vec4 _13152;
	    bool _15708;
	    vec3 _16318;
	    vec3 _17125;
	    float _17126;
	    vec4 _17127;
	    float _17128;
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
	        _13152 = _13150;
	        _16318 = _17121;
	        _17125 = _17123;
	        _17126 = _17122;
	        _17127 = _16317;
	        _17128 = _17124;
	        _15708 = _15803;
	        uint _10154;
	        vec4 _13154;
	        vec3 _16319;
	        bool _16482;
	        vec3 _17129;
	        float _17130;
	        vec4 _17131;
	        float _17192;
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
	            vec3 _11008;
	            float _14482;
	            SPIRV_CROSS_BRANCH
	            if ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m7 & 1u) != 0u)
	            {
	                float _8220 = 1.0 - saturate((length(_3172 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m6) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.x) + PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.y);
	                if (_8220 == 0.0)
	                {
	                    _13154 = _13152;
	                    _16319 = _16318;
	                    _17129 = _17125;
	                    _17130 = _17126;
	                    _17131 = _17127;
	                    _17192 = _17128;
	                    _16482 = _15708;
	                    _13152 = _13154;
	                    _16318 = _16319;
	                    _17125 = _17129;
	                    _17126 = _17130;
	                    _17127 = _17131;
	                    _17128 = _17192;
	                    _15708 = _16482;
	                    _10864 = _10154;
	                    continue;
	                }
	                _11008 = _9451;
	                _14482 = _8220;
	            }
	            else
	            {
	                vec3 _7743 = (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_7264, 1.0)).xyz;
	                vec3 _8793 = saturate((_7743 - PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m1) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                vec3 _19651 = saturate((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m3 - _7743) * PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m5.xyz);
	                float _17265 = min(min(_8793.x, min(_8793.y, _8793.z)), min(_19651.x, min(_19651.y, _19651.z)));
	                if (_17265 == 0.0)
	                {
	                    _13154 = _13152;
	                    _16319 = _16318;
	                    _17129 = _17125;
	                    _17130 = _17126;
	                    _17131 = _17127;
	                    _17192 = _17128;
	                    _16482 = _15708;
	                    _13152 = _13154;
	                    _16318 = _16319;
	                    _17125 = _17129;
	                    _17126 = _17130;
	                    _17127 = _17131;
	                    _17128 = _17192;
	                    _15708 = _16482;
	                    _10864 = _10154;
	                    continue;
	                }
	                _11008 = (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m0 * vec4(_9451, 0.0)).xyz;
	                _14482 = _17265;
	            }
	            float _11057 = (_14482 * _14482) * (((-2.0) * _14482) + 3.0);
	            float _9614 = _11057 * (1.0 - _17128);
	            float _6671 = _17128 + _9614;
	            float _8288;
	            vec4 _13153;
	            vec3 _15184;
	            if (int(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9) >= 0)
	            {
	                float _21648 = _11057 * (1.0 - _17126);
	                vec3 _24893 = PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m0 * vec4(_7264, 1.0);
	                vec3 _6343 = _24893.xyz;
	                vec3 _6393 = _6343;
	                _6393.z = _24893.z * 0.16666667163372039794921875;
	                vec3 _19423 = clamp(_6393.xyz, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m1, PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m2);
	                _19423.z = _19423.z * 6.0;
	                vec3 _23126 = (_19423.xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7;
	                _23126.z = _23126.z * 0.16666667163372039794921875;
	                vec3 _15791 = mix(vec3(0.0, 0.16666667163372039794921875, 0.3333333432674407958984375), vec3(0.5, 0.666666686534881591796875, 0.833333313465118408203125), step(_18460, vec3(0.0)).xyz);
	                vec3 _18910 = _18460 * _18460;
	                _13153 = _13152 + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m6], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), ((saturate(_6343).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m5).xyz + PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m7).xyz, 0.0).xyzw * _21648);
	                _15184 = _16318 + (((((textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.x), 0.0).xyz * _18910.x) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.y), 0.0).xyz * _18910.y)) + (textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m3], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), _23126.xyz + vec3(0.0, 0.0, _15791.z), 0.0).xyz * _18910.z)).xyz * PerViewLightProbeVolumeConstantBuffer_t._m0._m0[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m9]._m4.xyz) * _21648);
	                _8288 = _17126 + _21648;
	            }
	            else
	            {
	                _13153 = _13152;
	                _15184 = _16318;
	                _8288 = _17126;
	            }
	            bool _7462;
	            if (_6671 > 0.9900000095367431640625)
	            {
	                _7462 = _8288 > 0.9900000095367431640625;
	            }
	            else
	            {
	                _7462 = false;
	            }
	            _13154 = _13153;
	            _16319 = _15184;
	            _17129 = _17125 + ((PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m8 * _9614) * textureLod(samplerCubeArray(g_bindless_TextureCubeArray[PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m4], g_bindless_Sampler[_Globals_.g_sTrilinearWrap_NoGlobalMipBias]), vec4(_11008.xyz, float(PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m2)), PerViewLightingConstantBufferGpu_t._m8.y).xyz);
	            _17130 = _8288;
	            _17131 = _17127 + (PerViewLightingConstantBufferGpu_t._m9._m0[_12608]._m10 * _9614);
	            _17192 = _6671;
	            _16482 = !_7462;
	            _13152 = _13154;
	            _16318 = _16319;
	            _17125 = _17129;
	            _17126 = _17130;
	            _17127 = _17131;
	            _17128 = _17192;
	            _15708 = _16482;
	            _10864 = _10154;
	            continue;
	        }
	        _21567 = _9999 + 1u;
	        _13150 = _13152;
	        _16317 = _17127;
	        _17121 = _16318;
	        _17122 = _17126;
	        _17123 = _17125;
	        _17124 = _17128;
	        _15803 = _15708;
	        _9999 = _21567;
	        continue;
	    }
	    float _6275 = 1.0 - _17124;
	    vec4 _23875 = vec4(_9451.xyz, 1.0);
	    vec4 _19344 = vec4(_18460, 1.0);
	    vec3 _24040 = _17121 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m1._m0[0].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m1._m0[1].xyzw, _19344), dot(PerViewLightingConstantBufferGpu_t._m1._m0[2].xyzw, _19344)) * (1.0 - _17122));
	    vec4 _11487 = textureLod(sampler2DArray(g_bindless_Texture2DArray_float4[PerViewConstantBufferCitadel_t._m0], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), vec3((vec2(1.0, sqrt(1.0 - _17197)) * 0.984375) + vec2(0.0078125), 1.0).xyz, 0.0);
	    vec3 _8738 = mix(_11487.xxx, _11487.yyy, vec3(0.039999999105930328369140625));
	    float _12465 = 1.0 - _11487.y;
	    vec3 _23170 = ((_8738 * vec3(0.085714280605316162109375)) / (vec3(1.0) - (vec3(0.085714280605316162109375) * _12465))) * _12465;
	    float _13151 = 1.0 - dot(_13150, PerViewLightingConstantBufferGpu_t._m12);
	    float _11857 = (dot(_18290, PerViewLightingConstantBufferGpu_t._m10.xyz) > 0.0) ? _13151 : 0.0;
	    bool _12890;
	    if (PerViewLightingConstantBufferGpu_t._m13 != 0)
	    {
	        _12890 = _11857 > 0.0;
	    }
	    else
	    {
	        _12890 = false;
	    }
	    float _21709;
	    SPIRV_CROSS_BRANCH
	    if (_12890)
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
	            vec4 _16719 = vec4(_3379, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_13039];
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
	            vec2 _19983 = _7190;
	            _19983.x = gl_FragCoord.x + _10147;
	            int _20353 = int(fract(52.98291778564453125 * fract(dot(_19983, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	            vec2 _22193 = vec2(1.0) - saturate((abs(_11806.xy) * vec2(PerViewLightingConstantBufferGpu_t._m17)) + vec2(PerViewLightingConstantBufferGpu_t._m16));
	            float _20456 = saturate(_22193.x * _22193.y);
	            mat2 _14940 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m25._m0[_20353].xy), vec2(-PerViewLightingConstantBufferGpu_t._m25._m0[_20353].y, PerViewLightingConstantBufferGpu_t._m25._m0[_20353].x));
	            float _12244 = saturate(_11806.z + PerViewLightingConstantBufferGpu_t._m22._m0[_9382].y);
	            float _13155;
	            float _16324;
	            _13155 = 0.0;
	            _16324 = 0.0;
	            uint _21568;
	            float _13156;
	            float _16325;
	            uint _17020 = 0u;
	            for (;;)
	            {
	                if (!(_17020 < 16u))
	                {
	                    break;
	                }
	                vec4 _16176 = textureGather(sampler2D(g_bindless_Texture2D[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_11806.xy + (_14940 * (_105[_17020].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_9382].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_9382].xy));
	                _13156 = _13155;
	                _16325 = _16324;
	                uint _14722;
	                float _16615;
	                float _23259;
	                uint _17021 = 0u;
	                for (;;)
	                {
	                    if (!(_17021 < 4u))
	                    {
	                        break;
	                    }
	                    float _14149 = _16176[_17021] - _12244;
	                    float _9229 = step(0.0, _14149);
	                    _16615 = _16325 + _9229;
	                    _23259 = _13156 + (_9229 * _14149);
	                    _14722 = _17021 + 1u;
	                    _13156 = _23259;
	                    _16325 = _16615;
	                    _17021 = _14722;
	                    continue;
	                }
	                _21568 = _17020 + 1u;
	                _13155 = _13156;
	                _16324 = _16325;
	                _17020 = _21568;
	                continue;
	            }
	            float _19848 = (2.0 * saturate(_16324 * 0.015625)) - 1.0;
	            float _22550 = float(int(sign(_19848)));
	            float _14815 = 1.0 - (_22550 * _19848);
	            float _10969 = 0.5 - (0.5 * ((1.0 - mix((_14815 * _14815) * _14815, _14815, saturate((_13155 / _16324) / _12244))) * _22550));
	            float _23728;
	            if (_9382 > PerViewLightingConstantBufferGpu_t._m14)
	            {
	                _23728 = _13151 * _10969;
	            }
	            else
	            {
	                _23728 = _10969;
	            }
	            float _12503;
	            SPIRV_CROSS_BRANCH
	            if (_20456 < 1.0)
	            {
	                int _15335 = _9382 + 1;
	                vec4 _23643 = vec4(_3379, 1.0) * PerViewLightingConstantBufferGpu_t._m20._m0[_15335];
	                float _6559;
	                if (_15335 < PerViewLightingConstantBufferGpu_t._m13)
	                {
	                    float _12245 = saturate(_23643.z + PerViewLightingConstantBufferGpu_t._m22._m0[_15335].y);
	                    float _13157;
	                    float _16326;
	                    _13157 = 0.0;
	                    _16326 = 0.0;
	                    uint _21569;
	                    float _13158;
	                    float _16327;
	                    uint _17022 = 0u;
	                    for (;;)
	                    {
	                        if (!(_17022 < 16u))
	                        {
	                            break;
	                        }
	                        vec4 _16409 = textureGather(sampler2D(g_bindless_Texture2D[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_23643.xy + (_14940 * (_105[_17022].xy * PerViewLightingConstantBufferGpu_t._m22._m0[_15335].x)), vec2(-1.0), vec2(1.0)).xy, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].zw, PerViewLightingConstantBufferGpu_t._m21._m0[_15335].xy));
	                        _13158 = _13157;
	                        _16327 = _16326;
	                        uint _14723;
	                        float _16616;
	                        float _23260;
	                        uint _17023 = 0u;
	                        for (;;)
	                        {
	                            if (!(_17023 < 4u))
	                            {
	                                break;
	                            }
	                            float _14150 = _16409[_17023] - _12245;
	                            float _9230 = step(0.0, _14150);
	                            _16616 = _16327 + _9230;
	                            _23260 = _13158 + (_9230 * _14150);
	                            _14723 = _17023 + 1u;
	                            _13158 = _23260;
	                            _16327 = _16616;
	                            _17023 = _14723;
	                            continue;
	                        }
	                        _21569 = _17022 + 1u;
	                        _13157 = _13158;
	                        _16326 = _16327;
	                        _17022 = _21569;
	                        continue;
	                    }
	                    float _19849 = (2.0 * saturate(_16326 * 0.015625)) - 1.0;
	                    float _22551 = float(int(sign(_19849)));
	                    float _14816 = 1.0 - (_22551 * _19849);
	                    _6559 = 0.5 - (0.5 * ((1.0 - mix((_14816 * _14816) * _14816, _14816, saturate((_13157 / _16326) / _12245))) * _22551));
	                }
	                else
	                {
	                    _6559 = 1.0;
	                }
	                float _7934;
	                if (_15335 > PerViewLightingConstantBufferGpu_t._m14)
	                {
	                    _7934 = _13151 * _6559;
	                }
	                else
	                {
	                    _7934 = _6559;
	                }
	                _12503 = mix(_7934, _23728, _20456);
	            }
	            else
	            {
	                _12503 = _23728;
	            }
	            _15297 = _12503;
	        }
	        else
	        {
	            _15297 = _13151;
	        }
	        _21709 = mix(_15297, _13151, saturate((length(_3379) * PerViewLightingConstantBufferGpu_t._m19) + PerViewLightingConstantBufferGpu_t._m18));
	    }
	    else
	    {
	        _21709 = _11857;
	    }
	    vec3 _13064 = (PerViewConstantBufferCitadel_t._m10.xyz * PerViewLightingConstantBufferGpu_t._m11.xyz) * _21709;
	    bool _12891;
	    if (_21709 > 0.0)
	    {
	        _12891 = dot(PerViewLightingConstantBufferGpu_t._m10.xyz, _18460) > 0.0;
	    }
	    else
	    {
	        _12891 = false;
	    }
	    vec3 _9716;
	    vec3 _24878;
	    SPIRV_CROSS_BRANCH
	    if (_12891)
	    {
	        float _15489 = saturate(dot(_18460, PerViewLightingConstantBufferGpu_t._m10.xyz));
	        _9716 = PerViewLightingConstantBufferGpu_t._m3.xyz + (_13064 * _15489);
	        _24878 = ((((vec3(0.039999999105930328369140625) + (vec3(0.959999978542327880859375) * pow(max(0.0, 1.0 - saturate(dot(PerViewLightingConstantBufferGpu_t._m10.xyz, normalize(PerViewLightingConstantBufferGpu_t._m10.xyz + _24254)))), 5.0))) * ((0.5 / max(9.9999997473787516355514526367188e-06, _15489 + saturate(dot(_18290, _13353)))) * _15489)) * _12200).xyz * 1.0) * _13064;
	    }
	    else
	    {
	        _9716 = PerViewLightingConstantBufferGpu_t._m3.xyz;
	        _24878 = vec3(0.0);
	    }
	    uint _12111 = PerViewLightingConstantBufferGpu_t._m4.y + (_7520 * PerViewLightingConstantBufferGpu_t._m4.z);
	    uint _23394 = PerViewLightingConstantBufferGpu_t._m4.x + (_6274 * PerViewLightingConstantBufferGpu_t._m4.z);
	    vec3 _13160;
	    vec3 _16328;
	    _13160 = _9716;
	    _16328 = _24878;
	    uint _21570;
	    vec3 _13161;
	    vec3 _16329;
	    uint _17024 = 0u;
	    for (;;)
	    {
	        if (!(_17024 < PerViewLightingConstantBufferGpu_t._m4.z))
	        {
	            break;
	        }
	        uint _14476 = subgroupOr(g_CullBits_1._m0[_12111 + _17024] & g_CullBits_1._m0[_23394 + _17024]);
	        _13161 = _16328;
	        _16329 = _13160;
	        uint _20344;
	        vec3 _13213;
	        vec3 _15671;
	        uint _17025 = _14476;
	        for (;;)
	        {
	            if (!(_17025 != 0u))
	            {
	                break;
	            }
	            int _12609 = int(uint(findLSB(_17025)) + (_17024 * 32u));
	            _20344 = _17025 & (_17025 - 1u);
	            do
	            {
	                vec3 _10086 = -normalize(_3379);
	                float _15846 = 1.0 - dot(_13150, g_BarnLights_1._m0[_12609]._m10);
	                if (_15846 == 0.0)
	                {
	                    _13213 = _13161;
	                    _15671 = _16329;
	                    break;
	                }
	                vec3 _12573 = _3379.xyz;
	                vec4 _24897 = g_BarnLights_1._m0[_12609]._m0 * vec4(_12573, 1.0);
	                vec3 _10521 = _24897.xyz / vec3(_24897.w);
	                vec4 _22906;
	                _22906.x = _10521.x;
	                _22906.y = _10521.y;
	                float _21776 = _10521.z;
	                vec4 _20418 = _22906;
	                _20418.z = _21776;
	                bool _7424;
	                if (all(greaterThan(_20418.xyz, vec3(-1.0, -1.0, 0.0))))
	                {
	                    _7424 = all(lessThan(_20418.xyz, vec3(1.0)));
	                }
	                else
	                {
	                    _7424 = false;
	                }
	                bool _12892;
	                if (!_7424)
	                {
	                    _12892 = true;
	                }
	                else
	                {
	                    _12892 = !all(lessThanEqual(abs((g_BarnLights_1._m0[_12609]._m15 * vec4(_3379, 1.0)).xyz), vec3(1.0)));
	                }
	                if (_12892)
	                {
	                    _13213 = _13161;
	                    _15671 = _16329;
	                    break;
	                }
	                if (((dot(g_BarnLights_1._m0[_12609]._m16.xyz, _18290) - dot(_3379, _18290)) + (2.0 * g_BarnLights_1._m0[_12609]._m16.w)) < 0.0)
	                {
	                    _13213 = _13161;
	                    _15671 = _16329;
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
	                    _21316 = smoothstep(0.0, 1.0, _21776 * g_BarnLights_1._m0[_12609]._m3.z);
	                }
	                else
	                {
	                    _21316 = 1.0;
	                }
	                float _19667;
	                if (g_BarnLights_1._m0[_12609]._m3.w > 0.0)
	                {
	                    _19667 = _21316 * smoothstep(0.0, 1.0, (1.0 - _21776) * g_BarnLights_1._m0[_12609]._m3.w);
	                }
	                else
	                {
	                    _19667 = _21316;
	                }
	                vec3 _11180;
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
	                    _11180 = _10017 / vec3(_17647);
	                    _13818 = ((_19667 * (g_BarnLights_1._m0[_12609]._m2.w / max(_18345, g_BarnLights_1._m0[_12609]._m2.w))) * smoothstep(0.0, 1.0, g_BarnLights_1._m0[_12609]._m3.x + (g_BarnLights_1._m0[_12609]._m3.y * _17647))) * saturate(g_BarnLights_1._m0[_12609]._m6.x + (g_BarnLights_1._m0[_12609]._m6.y * dot(vec3((1.0 - (_23571 * g_BarnLights_1._m0[_12609]._m5.y)) - _18492, _9058 + _19825, (_14805 * g_BarnLights_1._m0[_12609]._m5.z) - (_17330 * g_BarnLights_1._m0[_12609]._m5.y)), normalize(_10210))));
	                }
	                else
	                {
	                    _11180 = g_BarnLights_1._m0[_12609]._m2.xyz;
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
	                            float _15018 = _22154.y;
	                            float _23041 = (-0.5) * g_BarnLights_1._m0[_12609]._m9.z;
	                            float _11981 = (g_BarnLights_1._m0[_12609]._m9.x * g_BarnLights_1._m0[_12609]._m9.y) * pow(max(pow(g_BarnLights_1._m0[_12609]._m9.y * _11473, _15266) + pow(g_BarnLights_1._m0[_12609]._m9.x * _15018, _15266), 1.1754943508222875079687365372222e-38), _23041);
	                            float _16524 = pow(max(pow(_11473, _15266) + pow(_15018, _15266), 1.1754943508222875079687365372222e-38), _23041);
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
	                    if (g_BarnLights_1._m0[_12609]._m4.w < 0.0)
	                    {
	                        vec4 _17795 = vec4(-g_BarnLights_1._m0[_12609]._m5.xyz, g_BarnLights_1._m0[_12609]._m5.w);
	                        vec4 _19008 = _17795.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                        vec3 _24989 = _19008.xyz;
	                        vec3 _23629 = vec4((-_11180).xyz, 0.0).xyz;
	                        float _15156 = -dot(_23629, _24989);
	                        vec3 _20479 = vec4((_23629 * _19008.w) + cross(_23629, _24989), _15156).xyz;
	                        vec3 _23593 = _17795.xyz;
	                        vec3 _12170 = ((_20479 * g_BarnLights_1._m0[_12609]._m5.w) + (_23593 * _15156)) + cross(_23593, _20479);
	                        vec3 _14081 = vec3(vec2(atan(_12170.y, -_12170.x) * 0.15915493667125701904296875, acos(_12170.z) * 0.3183098733425140380859375), -g_BarnLights_1._m0[_12609]._m4.w);
	                        vec2 _20562 = (_14081.xy * g_BarnLights_1._m0[_12609]._m9.zw) + g_BarnLights_1._m0[_12609]._m9.xy;
	                        vec3 _20489 = _14081;
	                        _20489.x = _20562.x;
	                        _20489.y = _20562.y;
	                        _12504 = _20538.xyz * textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightingConstantBufferGpu_t._m24], g_bindless_Sampler[_Globals_.g_sTrilinearWrap]), _20489.xyz, 0.0).xyz;
	                    }
	                    else
	                    {
	                        vec3 _13791 = vec3(fma(_20418.xy, vec2(0.5, -0.5), vec2(0.5)), g_BarnLights_1._m0[_12609]._m4.w);
	                        vec2 _20561 = (_13791.xy * g_BarnLights_1._m0[_12609]._m9.zw) + g_BarnLights_1._m0[_12609]._m9.xy;
	                        vec3 _20488 = _13791;
	                        _20488.x = _20561.x;
	                        _20488.y = _20561.y;
	                        _12504 = _20538.xyz * textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewLightingConstantBufferGpu_t._m24], g_bindless_Sampler[_Globals_.g_sCookieSampler]), _20488.xyz, 0.0).xyz;
	                    }
	                    _21548 = _12504;
	                }
	                if (all(equal(_21548.xyz, vec3(0.0))))
	                {
	                    _13213 = _13161;
	                    _15671 = _16329;
	                    break;
	                }
	                bool _10513 = g_BarnLights_1._m0[_12609]._m8.z > 0.0;
	                float _12893;
	                if (_10513)
	                {
	                    _12893 = g_BarnLights_1._m0[_12609]._m12;
	                }
	                else
	                {
	                    _12893 = 0.0;
	                }
	                vec3 _19629;
	                if (_10513)
	                {
	                    vec3 _11396 = vec3(_22906.xy, 1.0 - _21776);
	                    vec3 _21710;
	                    if ((g_BarnLights_1._m0[_12609]._m13 & 4u) != 0u)
	                    {
	                        vec2 _6281 = _11396.yx * vec2(1.0, -1.0);
	                        vec3 _23714 = _11396;
	                        _23714.x = _6281.x;
	                        _23714.y = _6281.y;
	                        _21710 = _23714;
	                    }
	                    else
	                    {
	                        _21710 = _11396;
	                    }
	                    vec2 _19985 = _7190;
	                    _19985.x = gl_FragCoord.x + (_10147 + float(_12609));
	                    int _23702 = int(fract(52.98291778564453125 * fract(dot(_19985, vec2(0.067110560834407806396484375, 0.005837149918079376220703125)))) * 15.0);
	                    mat2 _14942 = mat2(vec2(PerViewLightingConstantBufferGpu_t._m25._m0[_23702].xy), vec2(-PerViewLightingConstantBufferGpu_t._m25._m0[_23702].y, PerViewLightingConstantBufferGpu_t._m25._m0[_23702].x));
	                    float _12246 = saturate(_21710.z + 9.9999999747524270787835121154785e-07);
	                    float _13162;
	                    _13162 = 0.0;
	                    uint _21571;
	                    float _13163;
	                    uint _16208 = 0u;
	                    for (;;)
	                    {
	                        if (!(_16208 < 1u))
	                        {
	                            break;
	                        }
	                        vec4 _23854 = textureGather(sampler2D(g_bindless_Texture2D_1[PerViewLightingConstantBufferGpu_t._m23], g_bindless_Sampler[_Globals_.g_sBilinearClamp]), fma(clamp(_21710.xy + (_14942 * (_105[_16208].xy * g_BarnLights_1._m0[_12609]._m22)), vec2(-1.0), vec2(1.0)).xy, g_BarnLights_1._m0[_12609]._m8.zw, g_BarnLights_1._m0[_12609]._m8.xy));
	                        _13163 = _13162;
	                        uint _9583;
	                        float _19760;
	                        uint _16209 = 0u;
	                        for (;;)
	                        {
	                            if (!(_16209 < 4u))
	                            {
	                                break;
	                            }
	                            _19760 = _13163 + step(0.0, _23854[_16209] - _12246);
	                            _9583 = _16209 + 1u;
	                            _13163 = _19760;
	                            _16209 = _9583;
	                            continue;
	                        }
	                        _21571 = _16208 + 1u;
	                        _13162 = _13163;
	                        _16208 = _21571;
	                        continue;
	                    }
	                    vec3 _24492 = _21548.xyz * mix(1.0, 1.0 - (_13162 * 0.25), _12893);
	                    if (all(equal(_24492.xyz, vec3(0.0))))
	                    {
	                        _13213 = _13161;
	                        _15671 = _16329;
	                        break;
	                    }
	                    _19629 = _24492;
	                }
	                else
	                {
	                    _19629 = _21548 * mix(1.0, 1.0, _12893);
	                }
	                float _7221 = saturate(dot(_18460, _11180.xyz));
	                vec3 _16230 = normalize(_11180.xyz + _10086.xyz);
	                vec2 _16715 = max(vec2(1.0), vec2(g_BarnLights_1._m0[_12609]._m11));
	                float _23802 = _16715.x;
	                float _21243 = dot(_16230, _18290);
	                float _6782 = saturate(dot(_18290, _10086.xyz));
	                float _22508 = _23802 * _23802;
	                float _12091 = _22508 * _22508;
	                float _13087 = (((_21243 * _12091) - _21243) * _21243) + 1.0;
	                float _16907 = 1.0 - _22508;
	                _13213 = _13161.xyz + (((((vec3(0.039999999105930328369140625) + (vec3(0.959999978542327880859375) * pow(max(0.0, 1.0 - saturate(dot(_11180.xyz, _16230))), 5.0))) * (((_12091 / max(9.9999999392252902907785028219223e-09, _13087 * _13087)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_7221 * ((_6782 * _16907) + _22508)) + (_6782 * ((_7221 * _16907) + _22508))))) * _7221)) * _12200).xyz * 1.0) * _19629);
	                _15671 = _16329.xyz + (_19629 * _7221);
	                break;
	            } while(false);
	            _13161 = _13213;
	            _16329 = _15671;
	            _17025 = _20344;
	            continue;
	        }
	        _21570 = _17024 + 1u;
	        _13160 = _16329;
	        _16328 = _13161;
	        _17024 = _21570;
	        continue;
	    }
	    vec3 _3543 = (((((_13160 + ((_24040 * (vec3(1.0) - (_8738 + _23170))).xyz * vec3(1.000099658966064453125))) + _16328) + ((((_8738 * ((_17123 + (vec3(dot(PerViewLightingConstantBufferGpu_t._m1._m0[0].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m1._m0[1].xyzw, _23875), dot(PerViewLightingConstantBufferGpu_t._m1._m0[2].xyzw, _23875)) * _6275)) * min(dot(_24040.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) / dot(_19344, (_16317 + (PerViewLightingConstantBufferGpu_t._m2 * _6275)).xyzw), max(PerViewLightingConstantBufferGpu_t._m0.x + PerViewLightingConstantBufferGpu_t._m0.y, 1.0)))) * 1.0) + ((_23170 * _24040) * 1.0)).xyz * saturate(pow(saturate(dot(_18290, _13353)) + 1.0, 1.0)))) * 1.0).xyz * mix(_Globals_.g_flMinOcclusion, 1.0, _13149)) * _Globals_.g_vColor;
	    vec4 _20322 = texture(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), (gl_FragCoord.xy * PerViewConstantBuffer_t._m5.xy).xy);
	    float _24202 = _20322.x;
	    if (!((0.01600000075995922088623046875 - (abs(_24388 - _24202) / max(_24388, _24202))) > 0.0))
	    {
	        discard;
	    }
	    vec2 _13326;
	    vec2 _22265;
	    vec2 _22914;
	    vec2 _21412 = (gl_FragCoord.xy - PerViewConstantBuffer_t._m3.xy).xy * PerViewConstantBuffer_t._m4.xy;
	    vec4 _12904;
	    do
	    {
	        _22914 = saturate(_21412.xy);
	        _22265 = PerViewConstantBuffer_t._m2.xy;
	        _13326 = (_22914 * _22265).xy;
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _12904 = vec4(0.0);
	            break;
	        }
	        _12904 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14171;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14171 = vec4(0.0);
	            break;
	        }
	        _14171 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14172;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14172 = vec4(0.0);
	            break;
	        }
	        _14172 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14174;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14174 = vec4(0.0);
	            break;
	        }
	        _14174 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14175;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14175 = vec4(0.0);
	            break;
	        }
	        _14175 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14176;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14176 = vec4(0.0);
	            break;
	        }
	        _14176 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14177;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14177 = vec4(0.0);
	            break;
	        }
	        _14177 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _14178;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _14178 = vec4(0.0);
	            break;
	        }
	        _14178 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _11017;
	    do
	    {
	        if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), _13326, 0.0).x == 0.0)
	        {
	            _11017 = vec4(0.0);
	            break;
	        }
	        _11017 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _8709 = (((((((_12904 + _14171) + _14172) + _14174) + _14175) + _14176) + _14177) + _14178) + _11017;
	    float _10412 = _8709.w;
	    vec4 _19648;
	    if (_10412 > 0.0)
	    {
	        vec3 _8908 = _8709.xyz / vec3(_10412);
	        vec4 _22907;
	        _22907.x = _8908.x;
	        _22907.y = _8908.y;
	        _22907.z = _8908.z;
	        _19648 = _22907;
	    }
	    else
	    {
	        vec4 _12505;
	        do
	        {
	            vec2 _11492 = saturate(_21412.xy);
	            if (textureLod(sampler2D(g_bindless_Texture2D[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11492 * _22265).xy, 0.0).x == 0.0)
	            {
	                _12505 = vec4(0.0);
	                break;
	            }
	            _12505 = vec4(textureLod(sampler2D(g_bindless_Texture2D[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11492 * PerViewConstantBuffer_t._m9.zw).xy, 0.0).xyz, 1.0);
	            break;
	        } while(false);
	        _19648 = _12505;
	    }
	    vec3 _18755 = mix(_19648.xyz, _3543, vec3(1.0 - _15600));
	    vec3 _19321;
	    do
	    {
	        vec2 _17536 = _11866.xy - PerViewConstantBufferCitadel_t._m9.xy;
	        bool _12894;
	        if (dot(_17536, _17536) > PerViewConstantBufferCitadel_t._m8.x)
	        {
	            _12894 = _11866.z < PerViewConstantBufferCitadel_t._m8.y;
	        }
	        else
	        {
	            _12894 = false;
	        }
	        SPIRV_CROSS_BRANCH
	        if (_12894)
	        {
	            vec2 _9342 = saturate(PerViewConstantBufferCitadel_t._m5.xy + (PerViewConstantBufferCitadel_t._m5.zw * vec2(length(_17536), _11866.z)));
	            float _12872 = (pow(_9342.x, PerViewConstantBufferCitadel_t._m6.x) * pow(_9342.y, PerViewConstantBufferCitadel_t._m6.y)) * PerViewConstantBufferCitadel_t._m7.w;
	            _19321 = (_18755 * vec3(1.0 - _12872)) + (vec4(PerViewConstantBufferCitadel_t._m7.xyz, _12872).xyz * _12872);
	            break;
	        }
	        _19321 = _18755;
	        break;
	    } while(false);
	    output_0 = vec4(_19321, 1.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(SupportsLightmapping, false);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(translucent, true);
	BoolAttribute(mapbuilder_donotcollapse, false);
	BoolAttribute(renderbackfaces, true);
	BoolAttribute(bWantsFBCopyTexture, true);
	BoolAttribute(CosmicVeil, true);
	BoolAttribute(DoNotCastShadows, true);
	
}
