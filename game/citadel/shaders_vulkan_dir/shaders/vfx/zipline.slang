//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Zipline shader.";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	Deferred();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
}

FEATURES
{
	Feature( F_TRANSLUCENT, 0..1, "Translucency" );
	Feature( F_ADDITIVE_BLEND, 0..1, "Additive Blend" );
	Feature( F_ADVANCED_TRANSLUCENCY, 0..1, "Translucency" );
	Feature( F_OVERRIDE_BLOOM_AMOUNT, 0..1, "Override the automatic bloom for a fixed bloom amount" );
	Feature( F_RENDER_BACKFACES_ONLY, 0..1, "Render Backfaces Only" );
	Feature( F_SCREEN_FACING, 0..1, "Screen Facing" );
	FeatureRule( Requires( F_ADDITIVE_BLEND, F_TRANSLUCENT ), "Additive blend requires Translucent" );
	FeatureRule( Requires( F_ADVANCED_TRANSLUCENCY, F_TRANSLUCENT ), "Advanced Translucency requires Translucent" );
	FeatureRule( Allow1( F_OVERRIDE_BLOOM_AMOUNT, F_TRANSLUCENT ), "Override Bloom Amount and Translucent are not compatible" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	uint4  nPackedFrame               : NORMAL0    < Semantic( CompressedTangentFrame ); >;        // D_COMPRESSED_NORMALS_AND_TANGENTS=1
	float4 vNormalOs                  : NORMAL0    < Semantic( Normal ); >;                        // D_COMPRESSED_NORMALS_AND_TANGENTS=0
	float3 vPositionOs                : POSITION0  < Semantic( PosXyz ); >;                       
	float4 vTangentUOs_flTangentVSign : TANGENT0   < Semantic( TangentU_SignV ); >;                // D_COMPRESSED_NORMALS_AND_TANGENTS=0
	float2 vTexCoord                  : TEXCOORD0  < Semantic( LowPrecisionUv ); >;                // S_SCREEN_FACING=0
	float2 nInstanceIdx               : TEXCOORD13 < Semantic( InstanceTransformUv ); >;          
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_SCREEN_FACING, F_SCREEN_FACING );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Geometry
	float g_flRadiusScale < Default(1); Range(0.1, 10); UiType(Slider); UiGroup("Geometry,10 / 10"); >;
	float g_flWorldUnitsPerTextureV < Default(16); Range(1, 1024); UiType(Slider); UiGroup("Geometry,10 / 20"); >;
	float g_flTextureURepeat < Default(2); Range(0.1, 16); UiType(Slider); UiGroup("Geometry,10 / 30"); >;
	
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
	cbuffer _Globals_ : register(b0, space0)
	{
	    float _Globals_1_g_flRadiusScale : packoffset(c20.w);
	    float _Globals_1_g_flWorldUnitsPerTextureV : packoffset(c21);
	    float _Globals_1_g_flTextureURepeat : packoffset(c21.y);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static float3 vPositionOs;
	static float2 vTexCoord;
	static float3 output_0;
	static float2 output_1;
	static float3 output_2;
	static float4 output_3;
	static float4 output_4;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	    float3 vNormalOs : TEXCOORD2;
	    float4 vTangentUOs_flTangentVSign : TEXCOORD3;
	    uint nInstanceIdx : TEXCOORD4;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float2 output_1 : TEXCOORD1;
	    float3 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    float3x4 _8524 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
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
	    float _19167;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _19167 = _17828.z;
	    }
	    else
	    {
	        _19167 = _7676.z;
	    }
	    _23812.x = _21354;
	    _23812.y = _21355;
	    _23812.z = _19167;
	    float3 _18715 = vPositionOs.xyz;
	    float2 _11003 = vPositionOs.yz * _Globals_1_g_flRadiusScale;
	    _18715.y = _11003.x;
	    _18715.z = _11003.y;
	    float3 _22017 = mul(_8524, float4(_18715.xyz, 1.0f));
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_22017.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_8524, float4(vNormalOs.xyz, 0.0f)));
	    output_1 = float2(vTexCoord.x * _Globals_1_g_flTextureURepeat, vTexCoord.y * (length(float3(_8524[0].x, _8524[1].x, _8524[2].x)) / _Globals_1_g_flWorldUnitsPerTextureV));
	    output_2 = _22017 - PerViewConstantBuffer_t_1_m3.xyz;
	    output_3 = _23812;
	    output_4 = float4(normalize(mul(_8524, float4(vTangentUOs_flTangentVSign.xyz, 0.0f))), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_22017.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vNormalOs = stage_input.vNormalOs;
	    vTangentUOs_flTangentVSign = stage_input.vTangentUOs_flTangentVSign;
	    vPositionOs = stage_input.vPositionOs;
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
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticCombo( S_TRANSLUCENT, F_TRANSLUCENT );
	StaticCombo( S_ADVANCED_TRANSLUCENCY, F_ADVANCED_TRANSLUCENCY );
	StaticCombo( S_OVERRIDE_BLOOM_AMOUNT, F_OVERRIDE_BLOOM_AMOUNT );
	StaticCombo( S_RENDER_BACKFACES_ONLY, F_RENDER_BACKFACES_ONLY );
	StaticCombo( S_SCREEN_FACING, F_SCREEN_FACING );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_SCREEN_FACING ) );
	StaticComboRule( Requires( S_ADVANCED_TRANSLUCENCY, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_OVERRIDE_BLOOM_AMOUNT, S_TRANSLUCENT ) );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( S_TRANSLUCENT, D_OPAQUE_FADE ) );
	
	RenderState(BlendEnable, true);
	RenderState(CullMode, F_RENDER_BACKFACES_ONLY ? Front : Back);
	RenderState(DepthBias, 64);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	RenderState(DstBlend, F_ADDITIVE_BLEND ? One : SrcAlpha);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	RenderState(SrcBlend, One);
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	float g_fToolsVisMaxLightingComplexity < Default(8); Attribute("g_fToolsVisMaxLightingComplexity"); UiType(Slider); >;
	float2 g_flAlphaAngleScaleBias < UiType(VectorText); Expression((g_flAlphaAnglePower<0) ? float2(-1,1) : float2(1,0)); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tAmbientOcclusionSelfIllum < Channel(G, Box3(TextureSelfIllumMask), Linear); Channel(A, Box3(TextureAmbientOcclusion), Linear); OutputFormat(DXT5); SrgbRead(false); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureMetalness), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tMetalness < Channel(R, Box(TextureMetalness), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal, TextureRoughness), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tTintMask < Channel(R, Box(TextureTintMask), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tTranslucency1 < Channel(R, Box(TextureTranslucency1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// PBR
	CreateInputTexture2D(TextureSelfIllumMask, Linear, 8, "", "_mask", "PBR,10 / Self Illum, 30 / 5", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureAmbientOcclusion, Linear, 8, "", "_ao", "PBR,10 / Ambient Occlusion,40 / 10", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "PBR,10 / Albedo,10 / 10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness, Linear, 8, "", "_metal", "PBR,10 / Metalness,30 / 10", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal, Linear, 8, "NormalizeNormals", "_normal", "PBR,10 / Normal and Roughness,20 / 10", Default4(0.5, 0.5, 1, 0));
	float3 g_vColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("PBR,10 / Albedo,10 / 10"); Expression(SrgbGammaToLinear(this)); >;
	CreateInputTexture2D(TextureRoughness, Linear, 8, "Inverse", "_rough", "PBR,10 / Normal and Roughness,20 / 20", Default4(0.5, 0.5, 0.5, 0));
	float g_flTexelAOAmount < Default(1); UiType(Slider); UiGroup("PBR,10 / Ambient Occlusion,40 / 20"); >;
	float3 g_vSelfIllumTint < Default3(1, 1, 1); UiType(Color); UiGroup("PBR,10 / Self Illum,30 / 20"); >;
	float g_flBumpStrength < Default(1); Range(0, 10); UiType(Slider); UiGroup("PBR,10 / Normal and Roughness,20 / 30"); >;
	float g_flSelfIllumScale < Range(0, 10); UiType(Slider); UiGroup("PBR,10 / Self Illum,30 / 40"); >;
	float g_flSelfIllumAlbedoFactor < Default(1); UiType(Slider); UiGroup("PBR,10 / Self Illum,30 / 50"); >;
	float2 g_vAlbedoScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("PBR,10 / Albedo, 10 / 50"); >;
	float g_flOverrideBloomAmount < Default(1); Range(0, 20); UiType(Slider); UiGroup("PBR,10 / Self Illum,30 / 60"); >;
	float2 g_vNormalAndRoughnessScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("PBR,10 / Normal and Roughness, 20 / 70"); >;
	float2 g_vSelfIllumScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("PBR,10 / Self Illum,30 / 90"); >;
	
	// Color
	CreateInputTexture2D(TextureTintMask, Linear, 8, "", "_mask", "Color", Default4(1, 1, 1, 0));
	
	// Translucency
	CreateInputTexture2D(TextureTranslucency, Linear, 8, "", "_trans", "Translucency,20 / Translucency,10 / 10", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureTranslucency1, Linear, 8, "", "_trans", "Translucency,20 / Translucency 1,20 / 10", Default4(1, 1, 1, 0));
	float g_flOpacityScale < Default(1); UiType(Slider); UiGroup("Translucency,20 / Translucency Global,30 / 20"); >;
	float g_flAlphaAnglePower < Range(-8, 8); UiType(Slider); UiGroup("Translucency,20 / Translucency Global,30 / 40"); >;
	int g_nTranslucencyBlendMode < Range(0, 2); UiType(Slider); UiGroup("Translucency,20 / Translucency Global,30 / 50"); >;
	float2 g_vTranslucentScrollSpeed0 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 50"); >;
	float2 g_vTranslucentScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency,20 / Translucency 1,20 / 50"); >;
	
	#if (S_TRANSLUCENT == 1)
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_OVERRIDE_BLOOM_AMOUNT == 1)
		Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureMetalness), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 1)
		Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureMetalness), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_TRANSLUCENT == 0)
		Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureMetalness), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_ADVANCED_TRANSLUCENCY == 1)
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 11 (name: g_vAlbedoScrollSpeed) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _1955
	{
	    uint g_sAniso;
	    uint g_sTrilinearWrap;
	    uint g_tColor;
	    uint g_tTintMask;
	    uint g_tNormalRoughness;
	    uint g_tAmbientOcclusionSelfIllum;
	    vec3 g_vColorTint;
	    vec3 g_vSelfIllumTint;
	    float g_flSelfIllumScale;
	    float g_flSelfIllumAlbedoFactor;
	    float g_flBumpStrength;
	    vec2 g_vAlbedoScrollSpeed;
	    vec2 g_vNormalAndRoughnessScrollSpeed;
	    vec2 g_vSelfIllumScrollSpeed;
	};
	
	layout(set = 1) uniform _1955 _Globals_;
	
	struct _985
	{
	    float _m0;
	};
	
	layout(set = 1) uniform _985 PerViewConstantBuffer_t;
	
	struct _1011
	{
	    uint _m0;
	    ivec2 _m1;
	};
	
	layout(set = 1) uniform _1011 PerViewConstantBufferCitadel_t;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 1) in vec2 input_1;
	layout(location = 0) in vec3 input_0;
	layout(location = 4) in vec4 input_4;
	layout(location = 3) in vec4 input_3;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    vec4 _19372 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), (input_1.xy + fract(_Globals_.g_vNormalAndRoughnessScrollSpeed.xy * PerViewConstantBuffer_t._m0)).xy);
	    float _8915 = _19372.x;
	    float _14881 = _19372.y;
	    float _16783 = (_8915 + _14881) - 1.00392162799835205078125;
	    float _11176 = _8915 - _14881;
	    vec3 _15728 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	    _15728.y = -_15728.y;
	    vec2 _11003 = _15728.xy * _Globals_.g_flBumpStrength;
	    vec3 _8673 = _15728;
	    _8673.x = _11003.x;
	    _8673.y = _11003.y;
	    vec3 _23712 = normalize(_8673.xyz);
	    vec2 _11085 = (input_1.xy + fract(_Globals_.g_vAlbedoScrollSpeed.xy * PerViewConstantBuffer_t._m0)).xy;
	    vec4 _21760 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), _11085);
	    vec4 _19414 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tTintMask], g_bindless_Sampler[_Globals_.g_sAniso]), _11085);
	    vec3 _14791 = _21760.xyz;
	    vec3 _13989 = mix(_14791, (_14791 * _Globals_.g_vColorTint.xyz) * input_3.xyz, vec3(_19414.x)).xyz;
	    vec4 _3300 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tAmbientOcclusionSelfIllum], g_bindless_Sampler[_Globals_.g_sTrilinearWrap]), (input_1.xy + fract(_Globals_.g_vSelfIllumScrollSpeed.xy * PerViewConstantBuffer_t._m0)).xy);
	    float _4668 = _3300.y;
	    float _18612 = saturate((_4668 * _Globals_.g_flSelfIllumScale) * 0.100000001490116119384765625);
	    float _19133;
	    if (_18612 != 0.0)
	    {
	        _19133 = _18612 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m1)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19133 = _18612;
	    }
	    output_0 = vec4((normalize((((input_4.xyz * _23712.x).xyz + ((cross(input_0.xyz, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))).xyz * _23712.y)).xyz + (input_0.xyz * _23712.z)).xyz).xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4(mix(_13989, mix(_Globals_.g_vSelfIllumTint.xyz, _Globals_.g_vSelfIllumTint.xyz * _13989, vec3(_Globals_.g_flSelfIllumAlbedoFactor)).xyz, vec3(_4668 * saturate(_Globals_.g_flSelfIllumScale))), 0.12549020349979400634765625);
	    output_2 = vec4(_19372.z, 0.0, _19133, _21760.w);
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(translucent, F_TRANSLUCENT);
	BoolAttribute(NoZPrepass, true);
	
	
	// Variant Attributes
	BoolAttribute(ForwardOnly, true);
}
