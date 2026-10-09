//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Used to display legacy content. Do not use to author new materials.";
	DevShader = true;
	Version = 7;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Depth("depth_only_bindless.vfx");
	FrontDepth("depth_only_bindless.vfx");
	Forward();
	Deferred();
	ToolsVis(S_MODE_TOOLS_VIS);
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_UNLIT, 0..1, "Lighting" );
	Feature( F_ALPHA_TEST, 0..1, "Translucent" );
	Feature( F_TRANSLUCENT, 0..1, "Translucent" );
	Feature( F_ADDITIVE_BLEND, 0..1, "Translucent" );
	Feature( F_RENDER_BACKFACES, 0..1, "2-Sided Rendering" );
	Feature( F_SELF_ILLUM, 0..1, "Self Illum" );
	Feature( F_PAINT_VERTEX_COLORS, 0..1, "Vertex Color Painting" );
	FeatureRule( Allow1( F_TRANSLUCENT, F_ALPHA_TEST ), "Translucent and Alpha Test are not compatible" );
	FeatureRule( Requires( F_ADDITIVE_BLEND, F_TRANSLUCENT ), "Requires translucency" );
	FeatureRule( Allow1( F_SELF_ILLUM, F_UNLIT ), "Self Illum and Unlit are not compatible" );
	FeatureRule( Allow1( F_PAINT_VERTEX_COLORS, F_TRANSLUCENT ), "Vertex Color Painting and Tranlucent are not compatible" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;              // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vColor                     : COLOR0         < Semantic( VertexPaintTintColor ); >;      // S_PAINT_VERTEX_COLORS=1
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_PAINT_VERTEX_COLORS, F_PAINT_VERTEX_COLORS );
	StaticCombo( S_UNLIT, F_UNLIT );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
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
	static uint4 vBlendIndices;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static float3 vPositionOs;
	static float2 vTexCoord;
	static float3 output_0;
	static float4 output_1;
	static float4 output_2;
	static float4 output_3;
	static float4 output_4;
	
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
	    float4 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
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
	    float3 _16758 = _10676[1];
	    float3 _16759 = _10676[2];
	    float3x3 _13976 = transpose(float3x3(_7726 * (1.0f / dot(_7726, _7726)), _16758 * (1.0f / dot(_16758, _16758)), _16759 * (1.0f / dot(_16759, _16759))));
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
	    float3 _22017 = mul(_24688, float4(vPositionOs.xyz, 1.0f));
	    float3 _10377 = _22017 - PerViewConstantBuffer_t_1_m3.xyz;
	    float4 _22101 = float4(0.0f, 0.0f, 0.0f, 1.0f);
	    _22101.x = _10377.x;
	    _22101.y = _10377.y;
	    _22101.z = _10377.z;
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_22017.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_13976, vNormalOs));
	    output_1 = float4(vTexCoord.xyxy);
	    output_2 = _22101;
	    output_3 = float4(_21354, _21355, _19302, _23812.w);
	    output_4 = float4(normalize(mul(_13976, vTangentUOs_flTangentVSign.xyz)), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_22017.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
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
	BoolAttribute(AllowBackfaceCulling, F_RENDER_BACKFACES ? 0 : 1);
	BoolAttribute(WriteDepthBeforeAlphaBlending, true);
	
	#if (S_PAINT_VERTEX_COLORS == 1)
		BoolAttribute(VertexPaintUIPickColor, true);
	#endif
}

PS
{
	StaticCombo( S_PAINT_VERTEX_COLORS, F_PAINT_VERTEX_COLORS );
	StaticCombo( S_UNLIT, F_UNLIT );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_TRANSLUCENT, F_TRANSLUCENT );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_ALPHA_TEST ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_TRANSLUCENT, S_ALPHA_TEST ) );
	StaticComboRule( Allow1( S_PAINT_VERTEX_COLORS, S_TRANSLUCENT ) );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	RenderState(BackStencilPassOp, Replace);
	RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : F_RENDER_BACKFACES ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	RenderState(StencilEnable, true);
	RenderState(StencilPassOp, Replace);
	RenderState(StencilRef, 2);
	RenderState(StencilWriteMask, 2);
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	bool g_bRenderBackfaces < UiType(CheckBox); Expression(F_RENDER_BACKFACES); >;
	float g_fToolsVisMaxLightingComplexity < Default(8); Attribute("g_fToolsVisMaxLightingComplexity"); UiType(Slider); >;
	float g_flAdditiveAmount < UiType(Slider); Expression(F_ADDITIVE_BLEND ? 1 : 0); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, PreserveCoverage(TextureTranslucency), Linear); OutputFormat(DXT5); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(DXT5); SrgbRead(true); >;
	Texture2D g_tNormal < Channel(AG, MipNormal(TextureNormal), Linear); OutputFormat(DXT5); SrgbRead(false); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color/10", Default4(1, 1, 1, 0));
	float3 g_vColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("Color,10/20"); >;
	
	// Normal
	CreateInputTexture2D(TextureNormal, Linear, 8, "NormalizeNormals", "_normal", "Normal,20", Default4(0.5, 0.5, 1, 0));
	
	// Translucent
	CreateInputTexture2D(TextureTranslucency, Linear, 8, "", "_trans", "Translucent", Default4(1, 1, 1, 0));
	float g_flAlphaTestReference < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Translucent"); >;
	float g_flOpacityScale < Default(1); UiType(Slider); UiGroup("Translucent"); >;
	
	// Normal Map
	float g_flBumpStrength < Default(1); Range(0, 10); UiType(Slider); UiGroup("Normal Map"); >;
	
	#if (S_ALPHA_TEST == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, PreserveCoverage(TextureTranslucency), Linear); OutputFormat(DXT5); SrgbRead(true); >;
	#endif
	#if (S_TRANSLUCENT == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(DXT5); SrgbRead(true); >;
	#endif
	#if (S_TRANSLUCENT == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 1)
		Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
		RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_ALPHA_TEST == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 3 (name: g_vColorTint) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	vec3 _3;
	
	struct _1161
	{
	    uint g_sAniso;
	    uint g_sBilinearWrap;
	    float g_flBumpStrength;
	    vec3 g_vColorTint;
	    uint g_tColor;
	    uint g_tNormal;
	    int g_bRenderBackfaces;
	};
	
	layout(set = 1) uniform _1161 _Globals_;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 0) in vec3 input_0;
	layout(location = 1) in vec4 input_1;
	layout(location = 3) in vec4 input_3;
	layout(location = 4) in vec4 input_4;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    vec3 _21709;
	    if (_Globals_.g_bRenderBackfaces != 0)
	    {
	        _21709 = input_0.xyz * (gl_FrontFacing ? 1.0 : (-1.0));
	    }
	    else
	    {
	        _21709 = input_0;
	    }
	    vec2 _7707 = (texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormal], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy).wy * 2.0) - vec2(1.0);
	    float _9481 = _7707.x;
	    vec3 _22101;
	    _22101.x = _9481;
	    float _21775 = _7707.y;
	    _22101.y = _21775;
	    vec3 _19739 = vec3(_9481, _21775, sqrt(saturate(1.0 - dot(_22101.xy, _22101.xy))));
	    _19739.y = -_21775;
	    vec3 _24157 = _19739.xyz;
	    vec2 _11003 = _19739.xy * _Globals_.g_flBumpStrength;
	    _24157.x = _11003.x;
	    _24157.y = _11003.y;
	    vec3 _23712 = normalize(_24157.xyz);
	    output_0 = vec4((normalize((((input_4.xyz * _23712.x).xyz + ((cross(_21709.xyz, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))).xyz * _23712.y)).xyz + (_21709.xyz * _23712.z)).xyz).xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4((texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sBilinearWrap]), input_1.xy).xyz * _Globals_.g_vColorTint.xyz) * input_3.xyz, 0.12549020349979400634765625);
	    output_2 = vec4(1.0, 0.0, 0.0, 0.0);
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(NeedsLightProbe, F_UNLIT ? 0 : 1);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(SupportsLightmapping, (F_UNLIT || F_RENDER_BACKFACES) ? 0 : 1);
	
	#if (S_UNLIT == 1)
		BoolAttribute(unlit, true);
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_ALPHA_TEST == 1)
		BoolAttribute(alphatest, true);
	#endif
	#if (S_ALPHA_TEST == 0)
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_PAINT_VERTEX_COLORS == 0)
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_TRANSLUCENT == 0)
		BoolAttribute(alphatest, true);
	#endif
	#if (S_TRANSLUCENT == 1)
		BoolAttribute(translucent, true);
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 1)
		BoolAttribute(unlit, true);
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 0)
		BoolAttribute(translucent, true);
		BoolAttribute(unlit, true);
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
	#if (S_PAINT_VERTEX_COLORS == 1)
		BoolAttribute(alphatest, true);
		BoolAttribute(unlit, true);
		BoolAttribute(ForwardLayerOnly, true);
		BoolAttribute(mapbuilder_donotcollapse, true);
	#endif
}
