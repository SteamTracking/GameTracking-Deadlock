//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Projected Decals";
	DevShader = false;
	Version = 3;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Deferred();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_USE_SHEETS, 0..1, "Use Sheet Textures" );
	Feature( F_BIPLANAR_PROJECTION, 0..1, "Use Biplanar Projection" );
	Feature( F_MULTIPLY_ALBEDO, 0..1, "Multiply Albedo" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float3 vPositionOs  : POSITION0  < Semantic( PosXyz ); >;                                     
	uint4  nSheetIdx    : TEXCOORD2  < Semantic( SheetIdx ); >;                                    // S_USE_SHEETS=1
	float4 flAnimParam  : TEXCOORD3  < Semantic( AnimParam ); >;                                   // S_USE_SHEETS=1
	uint4  nFlags       : TEXCOORD1  < Semantic( Flags ); >;                                       // S_USE_SHEETS=0
	float2 nInstanceIdx : TEXCOORD13 < Semantic( InstanceTransformUv ); >;                        
};

VS
{
	StaticCombo( S_USE_SHEETS, F_USE_SHEETS );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tColor < Channel(RGBA, Box(TextureColor), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	float4 g_vSheetSequenceAndSizes < Source(TextureSheetData); SourceArg(g_tColor) UiType(VectorText); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(1, 1, 1, 0));
	
	// PBR
	float3 g_vColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("PBR,10 / Albedo,10 / 20"); >;
	
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
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c24);
	};
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    float3 _Globals_1_g_vColorTint : packoffset(c12.y);
	};
	
	
	static float4 gl_Position;
	static uint nInstanceIdx;
	static float3 vPositionOs;
	static uint nFlags;
	static float4 output_0;
	static uint output_1;
	static uint output_2;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint nFlags : TEXCOORD1;
	    uint nInstanceIdx : TEXCOORD4;
	};
	
	struct PS_INPUT
	{
	    float4 output_0 : TEXCOORD0;
	    nointerpolation uint output_1 : TEXCOORD1;
	    nointerpolation uint output_2 : TEXCOORD2;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
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
	    float _21709;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _21709 = _17828.z;
	    }
	    else
	    {
	        _21709 = _7676.z;
	    }
	    float3x4 _9558 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
	    float4 _18275 = mul(PerViewConstantBuffer_t_1_m0, (float4(mul(_9558, float4(vPositionOs.xyz, 1.0f)).xyz, 1.0f) + (PerViewConstantBuffer_t_1_m1 * 1.0f)).xyzw);
	    float4 _11399 = float4(_21354, _21355, _21709, _23812.w);
	    float3 _13062 = _11399.xyz * _Globals_1_g_vColorTint.xyz;
	    float4 _23714 = _11399;
	    _23714.x = _13062.x;
	    _23714.y = _13062.y;
	    _23714.z = _13062.z;
	    output_0 = _23714;
	    output_1 = nFlags;
	    _18275.y = -_18275.y;
	    gl_Position = _18275;
	    output_2 = nInstanceIdx;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vPositionOs = stage_input.vPositionOs;
	    nFlags = stage_input.nFlags;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(decal, true);
	
	#if (S_USE_SHEETS == 1)
		TextureAttribute(DecalSheetTexture, g_tColor);
	#endif
}

PS
{
	StaticCombo( S_USE_SHEETS, F_USE_SHEETS );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	
	RenderState(BlendEnable, true);
	RenderState(ColorWriteEnable0, R|G|B);
	RenderState(ColorWriteEnable1, R|G|B);
	RenderState(ColorWriteEnable2, R|B);
	RenderState(DstBlend1, F_MULTIPLY_ALBEDO ? SrcColor : InvSrcAlpha);
	RenderState(DstBlendAlpha0, One);
	RenderState(DstBlendAlpha1, One);
	RenderState(DstBlendAlpha2, One);
	RenderState(IndependentBlendEnable, true);
	RenderState(SrcBlend1, F_MULTIPLY_ALBEDO ? Zero : SrcAlpha);
	RenderState(SrcBlendAlpha0, Zero);
	RenderState(SrcBlendAlpha1, Zero);
	RenderState(SrcBlendAlpha2, Zero);
	bool g_bBiplanarProjection < UiType(CheckBox); Expression(F_BIPLANAR_PROJECTION ? 1 : 0); >;
	bool g_bMultiplyAlbedo < UiType(CheckBox); Expression(F_MULTIPLY_ALBEDO ? 1 : 0); >;
	float g_flDesatAmount < Attribute("DesatAmount"); UiType(Slider); >;
	float g_flOoCutoffWidth < UiType(Slider); Expression(1/max(.001,g_flCutoffWidth)); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tColor < Channel(RGBA, Box(TextureColor), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal, TextureRoughness), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tSceneDepth < Attribute("SceneDepth"); SrgbRead(false); >;
	Texture2D g_tSelfIllum < Channel(G, Box(TextureSelfIllumMask), Linear); OutputFormat(DXT1); SrgbRead(false); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	float2 g_vOoTileSize < UiType(VectorText); Expression(float2((g_vTileSize.x>0) ? 1/g_vTileSize.x : 0,(g_vTileSize.y>0) ? 1/g_vTileSize.y : 0)); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(1, 1, 1, 0));
	
	// PBR
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "PBR,10 / Albedo,10 / 10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureNormal, Linear, 8, "NormalizeNormals", "_normal", "PBR,10 / Normal,20 / 10", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness, Linear, 8, "Inverse", "_rough", "PBR,10 / Roughness,30 / 10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllumMask, Linear, 8, "", "_mask", "PBR,10 / Self Illum Mask,40 / 10", Default4(0, 0, 0, 0));
	
	// Translucency
	CreateInputTexture2D(TextureTranslucency, Linear, 8, "", "_trans", "Translucency,30 / Translucency,10 / 10", Default4(1, 1, 1, 0));
	bool g_bCutoff < UiType(CheckBox); UiGroup("Translucency,30 / Cutoff,30 / 10"); >;
	float g_flOpacityScale < Default(1); UiType(Slider); UiGroup("Translucency,30 / Translucency,10 / 20"); >;
	float g_flSlopeFade < UiType(Slider); UiGroup("Translucency,30 / Slope,40 / 20"); >;
	float g_flCutoffWidth < Default(0.1); UiType(Slider); UiGroup("Translucency,30 / Cutoff,30 / 30"); >;
	float g_flNormalOpacity < Default(1); UiType(Slider); UiGroup("Translucency,30 / Translucency,10 / 30"); >;
	float g_flSlopeFadeSharpness < Default(1); Range(1, 30); UiType(Slider); UiGroup("Translucency,30 / Slope,40 / 30"); >;
	bool g_bMaskFacingCenter < UiType(CheckBox); UiGroup("Translucency,30 / Mask Facing Center / 40"); >;
	float g_flAlbedoOpacity < Default(1); UiType(Slider); UiGroup("Translucency,30 / Translucency,10 / 40"); >;
	float g_flEdgeWidth < Range(0, 0.5); UiType(Slider); UiGroup("Translucency,30 / Edge / 50"); >;
	float g_flRoughMetalEmitOpacity < Default(1); UiType(Slider); UiGroup("Translucency,30 / Translucency,10 / 50"); >;
	
	// Ripples
	bool g_bRipples < UiType(CheckBox); UiGroup("Ripples"); >;
	float4 g_vRippleAlphaPerturb < Default4(0.005, 0.005, 0.005, 0.005); Range4(0, 0, 0, 0, 0.1, 0.1, 0.1, 0.1); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	float4 g_vRippleFrequencies < Default4(50, 30, 70, 110); Range4(1, 1, 1, 1, 500, 500, 500, 500); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	float4 g_vRippleRoughnessPerturb < Range4(0, 0, 0, 0, 0.1, 0.1, 0.1, 0.1); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	float4 g_vRippleSharpnesses < Default4(8, 8, 8, 8); Range4(1, 1, 1, 1, 32, 32, 32, 32); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	float4 g_vRippleSpeeds < Default4(5, 5, 5, 5); Range4(-15, -15, -15, -15, 15, 15, 15, 15); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	float4 g_vRippleStrengths < Default(0.5); Range4(-1, -1, -1, -1, 1, 1, 1, 1); UiType(VectorText); UiGroup("Ripples"); UiVisibility(g_bRipples); >;
	
	// Self Illum
	float g_flSelfIllumScale < Range(0, 10); UiType(Slider); UiGroup("Self Illum,30 / 40"); >;
	
	// Texture Coordinates
	float2 g_vTileSize < Range2(0, 0, 4000, 4000); UiType(VectorText); UiGroup("Texture Coordinates"); >;
	
	#if (S_USE_SHEETS == 1)
		Texture2D g_tColor < Channel(RGBA, Box(TextureColor), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	
	// Variant parameters
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "PBR,10 / Albedo,10 / 10", Default4(0.5, 0.5, 0.5, 0));
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 21 (name: g_vRippleStrengths) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
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
	
	vec4 _3;
	
	struct _1220
	{
	    mat4 _m0;
	    float _m1;
	    vec2 _m2;
	};
	
	layout(set = 1) uniform _1220 PerViewConstantBuffer_t;
	
	struct _2433
	{
	    uint g_sAniso;
	    uint g_tColor;
	    uint g_tSelfIllum;
	    uint g_tNormalRoughness;
	    uint g_tSceneDepth;
	    float g_flDesatAmount;
	    float g_flOpacityScale;
	    float g_flNormalOpacity;
	    float g_flAlbedoOpacity;
	    float g_flRoughMetalEmitOpacity;
	    float g_flSlopeFade;
	    float g_flSlopeFadeSharpness;
	    int g_bCutoff;
	    int g_bMaskFacingCenter;
	    float g_flEdgeWidth;
	    float g_flOoCutoffWidth;
	    float g_flSelfIllumScale;
	    int g_bBiplanarProjection;
	    int g_bMultiplyAlbedo;
	    vec2 g_vOoTileSize;
	    int g_bRipples;
	    vec4 g_vRippleStrengths;
	    vec4 g_vRippleFrequencies;
	    vec4 g_vRippleSpeeds;
	    vec4 g_vRippleSharpnesses;
	    vec4 g_vRippleAlphaPerturb;
	    vec4 g_vRippleRoughnessPerturb;
	};
	
	layout(set = 1) uniform _2433 _Globals_;
	
	layout(set = 4, binding = 32, std430) readonly buffer g_instanceBuffer
	{
	    _1125 _m0[];
	} g_instanceBuffer_1;
	
	layout(set = 4, binding = 30, std430) readonly buffer g_transformBuffer
	{
	    _1119 _m0[];
	} g_transformBuffer_1;
	
	struct _1030
	{
	    uint _m0;
	    uint _m1;
	    ivec2 _m2;
	};
	
	layout(set = 1) uniform _1030 PerViewConstantBufferCitadel_t;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float[65536];
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float_1[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 0) in vec4 input_0;
	layout(location = 1) flat in uint input_1;
	layout(location = 2) flat in uint input_2;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	
	void main()
	{
	    vec2 _12497 = ((gl_FragCoord.xy * PerViewConstantBuffer_t._m2.xy) * 2.0) - vec2(1.0);
	    float _10528 = _12497.x;
	    float _10094 = -_12497.y;
	    ivec2 _11700 = ivec3(ivec2(gl_FragCoord.xy), 0).xy;
	    vec4 _18334 = vec4(vec3(_10528, _10094, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], _11700, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15614 = _18334.xyz / _18334.www;
	    vec4 _22905;
	    _22905.x = _15614.x;
	    _22905.y = _15614.y;
	    _22905.z = _15614.z;
	    mat4x3 _10676 = transpose(g_transformBuffer_1._m0[g_instanceBuffer_1._m0[input_2]._m1]._m0);
	    vec3 _7726 = _10676[0];
	    vec3 _10294 = _7726 * (1.0 / dot(_7726, _7726));
	    vec3 _16758 = _10676[1];
	    vec3 _10295 = _16758 * (1.0 / dot(_16758, _16758));
	    vec3 _16759 = _10676[2];
	    vec3 _9251 = _16759 * (1.0 / dot(_16759, _16759));
	    mat3 _15603 = mat3(_10294, _10295, _9251);
	    mat3 _13976 = transpose(_15603);
	    vec3 _20336 = ((_22905.xyz - _10676[3]) * _15603) + vec3(0.5);
	    vec3 _18404;
	    if (_Globals_.g_bBiplanarProjection == 0)
	    {
	        vec3 _19100 = _20336;
	        _19100.y = 1.0 - _20336.y;
	        _18404 = _19100;
	    }
	    else
	    {
	        _18404 = _20336;
	    }
	    vec3 _7472 = step(vec3(0.0), _18404.xyz) * step(_18404.xyz, vec3(1.0));
	    if ((((_7472.x * _7472.y) * _7472.z) - 0.5) < 0.0)
	    {
	        discard;
	    }
	    vec4 _23972 = vec4(vec3(_10528, _10094, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], _11700, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15615 = _23972.xyz / _23972.www;
	    vec4 _22906;
	    _22906.x = _15615.x;
	    _22906.y = _15615.y;
	    _22906.z = _15615.z;
	    vec2 _9862 = (gl_FragCoord.xy + vec2(-1.0, 0.0)).xy;
	    vec2 _12498 = ((_9862 * PerViewConstantBuffer_t._m2.xy) * 2.0) - vec2(1.0);
	    vec4 _23973 = vec4(vec3(_12498.x, -_12498.y, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], ivec3(ivec2(_9862), 0).xy, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15616 = _23973.xyz / _23973.www;
	    vec4 _22907;
	    _22907.x = _15616.x;
	    _22907.y = _15616.y;
	    _22907.z = _15616.z;
	    vec2 _9053 = (gl_FragCoord.xy + vec2(1.0, 0.0)).xy;
	    vec2 _12499 = ((_9053 * PerViewConstantBuffer_t._m2.xy) * 2.0) - vec2(1.0);
	    vec4 _23974 = vec4(vec3(_12499.x, -_12499.y, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], ivec3(ivec2(_9053), 0).xy, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15617 = _23974.xyz / _23974.www;
	    vec4 _22908;
	    _22908.x = _15617.x;
	    _22908.y = _15617.y;
	    _22908.z = _15617.z;
	    vec2 _9054 = (gl_FragCoord.xy + vec2(0.0, -1.0)).xy;
	    vec2 _12500 = ((_9054 * PerViewConstantBuffer_t._m2.xy) * 2.0) - vec2(1.0);
	    vec4 _23975 = vec4(vec3(_12500.x, -_12500.y, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], ivec3(ivec2(_9054), 0).xy, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15618 = _23975.xyz / _23975.www;
	    vec4 _22909;
	    _22909.x = _15618.x;
	    _22909.y = _15618.y;
	    _22909.z = _15618.z;
	    vec2 _9055 = (gl_FragCoord.xy + vec2(0.0, 1.0)).xy;
	    vec2 _12501 = ((_9055 * PerViewConstantBuffer_t._m2.xy) * 2.0) - vec2(1.0);
	    vec4 _23976 = vec4(vec3(_12501.x, -_12501.y, texelFetch(g_bindless_Texture2D_float[_Globals_.g_tSceneDepth], ivec3(ivec2(_9055), 0).xy, 0).x), 1.0) * PerViewConstantBuffer_t._m0;
	    vec3 _15619 = _23976.xyz / _23976.www;
	    vec4 _22910;
	    _22910.x = _15619.x;
	    _22910.y = _15619.y;
	    _22910.z = _15619.z;
	    vec3 _19714 = _22906.xyz - _22907.xyz;
	    vec3 _22911 = _22908.xyz - _22906.xyz;
	    vec3 _22912 = _22906.xyz - _22909.xyz;
	    vec3 _20307 = _22910.xyz - _22906.xyz;
	    vec2 _4360 = _18404.xy;
	    vec3 _18430 = mix(_22911, _19714, bvec3(abs(_19714.z) < abs(_22911.z))).xyz;
	    vec3 _9238 = _10294.xyz;
	    vec3 _8659 = -_10295.xyz;
	    vec2 _5218 = vec2(dot(_18430, _9238), dot(_18430, _8659)) * 0.5;
	    vec3 _15332 = mix(_20307, _22912, bvec3(abs(_22912.z) < abs(_20307.z))).xyz;
	    vec2 _5581 = vec2(dot(_15332, _9238), dot(_15332, _8659)) * 0.5;
	    vec3 _13528 = normalize((texelFetch(g_bindless_Texture2D_float_1[PerViewConstantBufferCitadel_t._m1], ivec3(ivec2(gl_FragCoord.xy), 0).xy, 0).xyz * 2.0) - vec3(1.0));
	    vec3 _24386 = normalize(_13528 * _13976);
	    vec3 _13136;
	    vec4 _13960;
	    vec4 _16305;
	    vec4 _23265;
	    if (_Globals_.g_bBiplanarProjection != 0)
	    {
	        vec3 _20506 = dFdxFine(_18404);
	        vec3 _23854 = dFdyFine(_18404);
	        vec3 _16408 = vec3(ivec3(sign(_24386)));
	        vec3 _10629 = abs(_24386);
	        vec3 _16409 = _10629;
	        float _17349 = _10629.x;
	        float _8043 = _10629.y;
	        bool _12885;
	        if (_17349 > _8043)
	        {
	            _12885 = _17349 > _10629.z;
	        }
	        else
	        {
	            _12885 = false;
	        }
	        ivec3 _23727;
	        if (_12885)
	        {
	            _23727 = ivec3(0, 1, 2);
	        }
	        else
	        {
	            _23727 = mix(ivec3(2, 0, 1), ivec3(1, 2, 0), bvec3(_8043 > _10629.z));
	        }
	        bool _12886;
	        if (_17349 < _8043)
	        {
	            _12886 = _17349 < _10629.z;
	        }
	        else
	        {
	            _12886 = false;
	        }
	        ivec3 _11775;
	        if (_12886)
	        {
	            _11775 = ivec3(0, 1, 2);
	        }
	        else
	        {
	            _11775 = mix(ivec3(2, 0, 1), ivec3(1, 2, 0), bvec3(_8043 < _10629.z));
	        }
	        ivec3 _17390 = (ivec3(3) - _11775) - _23727;
	        vec3 _16410 = _18404;
	        vec3 _16411 = _18404;
	        vec2 _6421 = vec2(_16410[_23727.y], _16411[_23727.z]);
	        vec2 _6422 = vec2(_20506[_23727.y], _20506[_23727.z]);
	        vec2 _22743 = vec2(_23854[_23727.y], _23854[_23727.z]);
	        int _9637 = _17390.y;
	        vec3 _16412 = _18404;
	        int _17895 = _17390.z;
	        vec3 _16413 = _18404;
	        vec2 _6423 = vec2(_16412[_9637], _16413[_17895]);
	        vec2 _6424 = vec2(_20506[_9637], _20506[_17895]);
	        vec2 _24795 = vec2(_23854[_9637], _23854[_17895]);
	        bool _7285 = _23727.x == 1;
	        vec2 _21012;
	        if (_7285)
	        {
	            _21012 = _6421.yx;
	        }
	        else
	        {
	            _21012 = _6421;
	        }
	        int _12772 = _17390.x;
	        bool _14746 = _12772 == 1;
	        vec2 _20195;
	        if (_14746)
	        {
	            _20195 = _6423.yx;
	        }
	        else
	        {
	            _20195 = _6423;
	        }
	        vec2 _15176 = _21012;
	        _15176.y = -_21012.y;
	        vec2 _17788 = _20195;
	        _17788.y = -_20195.y;
	        mat3 _16414 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        mat3 _16415 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        mat3 _16416 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        mat3 _16417 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        mat3 _16418 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        mat3 _16419 = mat3(vec3(1.0, 0.0, 0.0), vec3(0.0, 1.0, 0.0), vec3(0.0, 0.0, 1.0));
	        vec2 _19651 = saturate((vec2(_16409[_23727.x], _16409[_12772]) - vec2(0.577300012111663818359375)) * vec2(2.365744113922119140625));
	        vec2 _19317 = _19651 / vec2(_19651.x + _19651.y);
	        float _13747 = _19317.y;
	        vec4 _17962 = vec4(_13747);
	        vec4 _14261 = textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), _15176, _6422, _22743);
	        vec4 _15367 = textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), _17788, _6424, _24795);
	        float _8867 = _14261.x;
	        float _18662 = _14261.y;
	        float _16784 = (_8867 + _18662) - 1.00392162799835205078125;
	        float _11177 = _8867 - _18662;
	        vec3 _15729 = normalize(vec3(vec2(_16784, _11177), (1.0 - abs(_16784)) - abs(_11177)));
	        float _23408 = _15367.x;
	        float _7081 = _15367.y;
	        float _16785 = (_23408 + _7081) - 1.00392162799835205078125;
	        float _11178 = _23408 - _7081;
	        vec3 _15730 = normalize(vec3(vec2(_16785, _11178), (1.0 - abs(_16785)) - abs(_11178)));
	        vec3 _13758 = mix((((_16414[_7285 ? _23727.z : _23727.y].xyz * _15729.x).xyz + (_16415[_7285 ? _23727.y : _23727.z].xyz * (-_15729.y))).xyz + ((_16416[_23727.x] * _16408[_23727.x]).xyz * _15729.z)).xyz, (((_16417[_14746 ? _17895 : _9637].xyz * _15730.x).xyz + (_16418[_14746 ? _9637 : _17895].xyz * (-_15730.y))).xyz + ((_16419[_12772] * _16408[_12772]).xyz * _15730.z)).xyz, vec3(_13747)) * _13976;
	        _13136 = normalize(_13758);
	        _16305 = mix(textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tSelfIllum], g_bindless_Sampler[_Globals_.g_sAniso]), _15176, _6422, _22743), textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tSelfIllum], g_bindless_Sampler[_Globals_.g_sAniso]), _17788, _6424, _24795), _17962);
	        _13960 = mix(_14261, _15367, _17962);
	        _23265 = mix(textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), _15176, _6422, _22743), textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), _17788, _6424, _24795), _17962);
	    }
	    else
	    {
	        int _23989;
	        int _13039 = 0;
	        SPIRV_CROSS_UNROLL
	        for (;;)
	        {
	            if (!(_13039 < 2))
	            {
	                break;
	            }
	            vec2 _16420 = _Globals_.g_vOoTileSize;
	            if (_16420[_13039] > 0.0)
	            {
	                mat4x3 _16446 = _10676;
	                vec2 _16442 = _Globals_.g_vOoTileSize;
	                float _4384 = sqrt(dot(_16446[_13039], _16446[_13039])) * _16442[_13039];
	                _4360[_13039] = ((_4360[_13039] - 0.5) * _4384) + 0.5;
	                _5218[_13039] *= _4384;
	                _5581[_13039] *= _4384;
	            }
	            _23989 = _13039 + 1;
	            _13039 = _23989;
	            continue;
	        }
	        vec2 _25061 = _4360;
	        bool _9197 = (input_1 & 1u) != 0u;
	        vec2 _19629;
	        if (_9197)
	        {
	            vec2 _19101 = _25061;
	            _19101.x = 1.0 - _25061.x;
	            _19629 = _19101;
	        }
	        else
	        {
	            _19629 = _25061;
	        }
	        vec2 _16670 = _4360;
	        vec2 _19630;
	        if (_9197)
	        {
	            vec2 _19102 = _16670;
	            _19102.x = 1.0 - _16670.x;
	            _19630 = _19102;
	        }
	        else
	        {
	            _19630 = _16670;
	        }
	        vec4 _13568 = textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), _19630.xy, _5218.xy, _5581.xy);
	        vec2 _16671 = _4360;
	        vec2 _19631;
	        if (_9197)
	        {
	            vec2 _19103 = _16671;
	            _19103.x = 1.0 - _16671.x;
	            _19631 = _19103;
	        }
	        else
	        {
	            _19631 = _16671;
	        }
	        float _15751 = _13568.x;
	        float _17298 = _13568.y;
	        float _16783 = (_15751 + _17298) - 1.00392162799835205078125;
	        float _11176 = _15751 - _17298;
	        vec3 _15728 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	        _13136 = normalize((((normalize(_10294).xyz * _15728.x).xyz + (normalize(_10295).xyz * (-_15728.y))).xyz + (_13528.xyz * _15728.z)).xyz);
	        _16305 = textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tSelfIllum], g_bindless_Sampler[_Globals_.g_sAniso]), _19631.xy, _5218.xy, _5581.xy);
	        _13960 = _13568;
	        _23265 = textureGrad(sampler2D(g_bindless_Texture2D_float_1[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), _19629.xy, _5218.xy, _5581.xy);
	    }
	    vec3 _13043 = _23265.xyz * input_0.xyz;
	    float _19494 = (_Globals_.g_flOpacityScale * input_0.w) * ((pow(saturate(dot(normalize(_9251), _13528)), _Globals_.g_flSlopeFadeSharpness) * _Globals_.g_flSlopeFade) + (1.0 - _Globals_.g_flSlopeFade));
	    float _21709;
	    if (_Globals_.g_bMaskFacingCenter != 0)
	    {
	        _21709 = _19494 * ((saturate((dot(normalize(vec3(g_transformBuffer_1._m0[g_instanceBuffer_1._m0[input_2]._m1]._m0[0].w, g_transformBuffer_1._m0[g_instanceBuffer_1._m0[input_2]._m1]._m0[1].w, g_transformBuffer_1._m0[g_instanceBuffer_1._m0[input_2]._m1]._m0[2].w) - _22905.xyz), _13528) - (-0.0500000007450580596923828125)) * (-4.0)) * (-1.0)) + 1.0);
	    }
	    else
	    {
	        _21709 = _19494;
	    }
	    float _21710;
	    if (_Globals_.g_flEdgeWidth > 0.0)
	    {
	        vec3 _13472 = min(_18404, vec3(1.0) - _18404);
	        _21710 = _21709 * smoothstep(0.0, 1.0, saturate(min(_13472.x, min(_13472.y, _13472.z)) / _Globals_.g_flEdgeWidth));
	    }
	    else
	    {
	        _21710 = _21709;
	    }
	    float _12628;
	    if (_Globals_.g_bCutoff != 0)
	    {
	        _12628 = min(_Globals_.g_flOoCutoffWidth * ((_23265.w + _21710) - 1.0), 1.0);
	    }
	    else
	    {
	        _12628 = _21710 * _23265.w;
	    }
	    if ((_12628 - 0.0039215688593685626983642578125) < 0.0)
	    {
	        discard;
	    }
	    vec3 _20940;
	    if (_Globals_.g_bRipples != 0)
	    {
	        vec2 _4374 = _18404.xy - vec2(0.5);
	        float _11498 = length(_4374);
	        vec3 _13259 = normalize(vec3(normalize(_4374), 0.0) * _13976);
	        vec3 _5057 = (((_13136 + (_13259 * (_Globals_.g_vRippleStrengths.x * pow(0.5 + (0.5 * sin((_Globals_.g_vRippleFrequencies.x * _11498) - (PerViewConstantBuffer_t._m1 * ((_Globals_.g_vRippleSpeeds.x + (_Globals_.g_vRippleAlphaPerturb.x * _23265.w)) + (_Globals_.g_vRippleRoughnessPerturb.x * _13960.z))))), _Globals_.g_vRippleSharpnesses.x)))) + (_13259 * (_Globals_.g_vRippleStrengths.y * pow(0.5 + (0.5 * sin((_Globals_.g_vRippleFrequencies.y * _11498) - (PerViewConstantBuffer_t._m1 * ((_Globals_.g_vRippleSpeeds.y + (_Globals_.g_vRippleAlphaPerturb.y * _23265.w)) + (_Globals_.g_vRippleRoughnessPerturb.y * _13960.z))))), _Globals_.g_vRippleSharpnesses.y)))) + (_13259 * (_Globals_.g_vRippleStrengths.z * pow(0.5 + (0.5 * sin((_Globals_.g_vRippleFrequencies.z * _11498) - (PerViewConstantBuffer_t._m1 * ((_Globals_.g_vRippleSpeeds.z + (_Globals_.g_vRippleAlphaPerturb.z * _23265.w)) + (_Globals_.g_vRippleRoughnessPerturb.z * _13960.z))))), _Globals_.g_vRippleSharpnesses.z)))) + (_13259 * (_Globals_.g_vRippleStrengths.w * pow(0.5 + (0.5 * sin((_Globals_.g_vRippleFrequencies.w * _11498) - (PerViewConstantBuffer_t._m1 * ((_Globals_.g_vRippleSpeeds.w + (_Globals_.g_vRippleAlphaPerturb.w * _23265.w)) + (_Globals_.g_vRippleRoughnessPerturb.w * _13960.z))))), _Globals_.g_vRippleSharpnesses.w)));
	        _20940 = normalize(_5057);
	    }
	    else
	    {
	        _20940 = _13136;
	    }
	    vec3 _23569 = mix(_13043, vec3(dot(_13043.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))), vec3(_Globals_.g_flDesatAmount));
	    vec3 _22733 = vec3(_Globals_.g_flNormalOpacity, _Globals_.g_flAlbedoOpacity, _Globals_.g_flRoughMetalEmitOpacity).xyz * _12628;
	    float _16190 = saturate((_16305.y * _Globals_.g_flSelfIllumScale) * 0.100000001490116119384765625);
	    float _19302;
	    if (_16190 != 0.0)
	    {
	        _19302 = _16190 + ((texelFetch(g_bindless_Texture2D_float_1[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m2)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19302 = _16190;
	    }
	    vec4 _22247;
	    if (_Globals_.g_bMultiplyAlbedo != 0)
	    {
	        _22247 = vec4(mix(vec3(1.0), _23569, vec3(_Globals_.g_flAlbedoOpacity * _12628)), 1.0);
	    }
	    else
	    {
	        _22247 = vec4(_23569, _22733.y);
	    }
	    output_0 = vec4((_20940.xyz * 0.5) + vec3(0.5), _22733.x);
	    output_1 = _22247;
	    output_2 = vec4(_13960.z, 0.0, _19302, _22733.z);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	TextureAttribute(ColorTexture, g_tColor);
	TextureAttribute(SelfIllumMetalnessTexture, g_tSelfIllum);
	TextureAttribute(NormalRoughnessTexture, g_tNormalRoughness);
	BoolAttribute(SupportsMappingDimensions, true);
	FloatAttribute(SelfIllumScale, g_flSelfIllumScale);
	FloatAttribute(OpacityScale, g_flOpacityScale);
	FloatAttribute(NormalOpacity, g_flNormalOpacity);
	FloatAttribute(AlbedoOpacity, g_flAlbedoOpacity);
	FloatAttribute(RoughMetalEmitOpacity, g_flRoughMetalEmitOpacity);
	
	#if (S_USE_SHEETS == 0)
		BoolAttribute(userdefinedsheets, false);
	#endif
	#if (S_USE_SHEETS == 1)
		TextureAttribute(DecalSheetTexture, g_tColor);
		BoolAttribute(userdefinedsheets, true);
	#endif
}
