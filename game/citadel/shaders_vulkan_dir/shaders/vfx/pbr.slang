//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Uber shader.";
	DevShader = false;
	Version = 15;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, rtx, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	FrontDepth("depth_only_bindless.vfx");
	ShadowSilhouette("depth_only_bindless.vfx");
	Forward();
	Deferred();
	Outline(S_MODE_OUTLINE);
	Raytrace();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
}

FEATURES
{
	Feature( F_MATERIAL_VARIANT, 0..1, "Material Referencing" );
	Feature( F_JITTER_VERTICES, 0..2 (0="No", 1="World Space", 2="Object Space"), "Vertex Animation" );
	Feature( F_ALPHA_TEST, 0..1, "Translucency" );
	Feature( F_TRANSLUCENT, 0..1, "Translucency" );
	Feature( F_ADDITIVE_BLEND, 0..1, "Translucency" );
	Feature( F_ADVANCED_TRANSLUCENCY, 0..1, "Translucency" );
	Feature( F_CLOAK, 0..1, "Translucency" );
	Feature( F_DETAIL, 0..1, "Detail Texture" );
	Feature( F_VERTEX_COLOR, 0..1, "Vertex Color" );
	Feature( F_PAINT_VERTEX_COLORS, 0..1, "Vertex Painting" );
	Feature( F_ENABLE_TEXTURE_TRANSFORMS, 0..1, "Texture Transforms" );
	Feature( F_SECONDARY_UV, 0..1, "Secondary UV" );
	Feature( F_RENDER_BACKFACES, 0..1, "Rendering" );
	Feature( F_USE_FRONT_FACE_NORMALS_FOR_BACK_FACES, 0..1, "Rendering" );
	Feature( F_DISABLE_DEPTH_WRITE, 0..1, "Rendering" );
	Feature( F_WRITE_DEPTH_BEFORE_ALPHA_BLENDING, 0..1, "Rendering" );
	Feature( F_OVERRIDE_BLOOM_AMOUNT, 0..1, "Rendering" );
	Feature( F_DISABLE_Z_PREPASS, 0..1, "Rendering" );
	Feature( F_DO_NOT_CAST_SHADOWS, 0..1, "Rendering" );
	Feature( F_SHEEN, 0..1, "PBR" );
	Feature( F_GLASS, 0..1, "PBR" );
	Feature( F_SELF_ILLUM, 0..1, "PBR" );
	Feature( F_UNLIT, 0..1, "NPR" );
	Feature( F_USE_NPR_LIGHTING, 0..1, "NPR" );
	Feature( F_NO_SPECULAR_AT_FULL_ROUGHNESS, 0..1, "NPR" );
	Feature( F_OVERRIDE_NPR_OUTLINE, 0..1, "NPR" );
	Feature( F_DISABLE_NPR_OUTLINE, 0..1, "NPR" );
	Feature( F_SOLID_COLOR_OUTLINE, 0..1, "NPR" );
	Feature( F_USE_STATUS_EFFECTS_PROXY, 0..1, "Enable Status Effects" );
	FeatureRule( Allow1( F_TRANSLUCENT, F_ALPHA_TEST ), "Translucent and Alpha Test are not compatible" );
	FeatureRule( Requires( F_ADDITIVE_BLEND, F_TRANSLUCENT ), "Additive blend requires Translucent" );
	FeatureRule( Requires( F_ADVANCED_TRANSLUCENCY, F_TRANSLUCENT, F_ALPHA_TEST ), "Advanced Translucency requires Translucent or Alpha Test" );
	FeatureRule( Allow1( F_VERTEX_COLOR, F_PAINT_VERTEX_COLORS ), "Vertex Color and Paint Vertex Colors are incompatible." );
	FeatureRule( Requires( F_WRITE_DEPTH_BEFORE_ALPHA_BLENDING, F_TRANSLUCENT ), "Write Depth Before Alpha Blending requires Translucent" );
	FeatureRule( Requires( F_NO_SPECULAR_AT_FULL_ROUGHNESS, F_USE_NPR_LIGHTING ), "No Specular At Full Roughness requires Use NPR Lighting (for now)" );
	FeatureRule( Requires( F_OVERRIDE_NPR_OUTLINE, F_USE_NPR_LIGHTING ), "Override NPR Outline requires Use NPR Lighting" );
	FeatureRule( Requires( F_DISABLE_NPR_OUTLINE, F_USE_NPR_LIGHTING ), "Disable NPR Outline requires NPR Lighting" );
	FeatureRule( Allow1( F_DISABLE_NPR_OUTLINE, F_OVERRIDE_NPR_OUTLINE ), "Disable NPR Outline and Override" );
	FeatureRule( Requires( F_SOLID_COLOR_OUTLINE, F_USE_NPR_LIGHTING ), "Solid Color Outline requires NPR Lighting" );
	FeatureRule( Allow1( F_SOLID_COLOR_OUTLINE, F_OVERRIDE_NPR_OUTLINE ), "Solid Color Outline and Disable Outline are incompatible" );
	FeatureRule( Requires( F_USE_STATUS_EFFECTS_PROXY, F_USE_NPR_LIGHTING, F_UNLIT, F_SELF_ILLUM ), "Effects Proxy requires NPR, Unlit, or Self-Illum" );
	FeatureRule( Allow1( F_OVERRIDE_BLOOM_AMOUNT, F_TRANSLUCENT ), "Override Bloom Amount and Translucent are not compatible" );
	FeatureRule( Allow1( F_SHEEN, F_GLASS, F_CLOAK, F_PAINT_VERTEX_COLORS ), "Aniso Gloss, Sheen, Clear Coat, Glass, Cloak, Cosmic Veil, and Paint Vertex Colors are not compatible" );
	FeatureRule( Allow1( F_SHEEN, F_GLASS, F_CLOAK, F_TRANSLUCENT ), "Aniso Gloss, Sheen, Clear Coat, Glass, Cloak, Cosmic Veil, and Translucent are not compatible" );
	FeatureRule( Allow1( F_SHEEN, F_GLASS, F_CLOAK, F_ADVANCED_TRANSLUCENCY ), "Aniso Gloss, Sheen, Clear Coat, Glass, Cloak, Cosmic Veil, and Advanced Translucency are not compatible" );
	FeatureRule( Allow1( F_SHEEN, F_GLASS, F_CLOAK, F_DETAIL ), "Aniso Gloss, Sheen, Clear Coat, Glass, Cloak, Cosmic Veil, and Detail are not compatible" );
	FeatureRule( Allow1( F_SHEEN, F_GLASS, F_CLOAK, F_UNLIT ), "Aniso Gloss, Sheen, Clear Coat, Glass, Cloak, Cosmic Veil, and Unlit are not compatible" );
	FeatureRule( Allow1( F_PAINT_VERTEX_COLORS, F_DETAIL ), "Paint vertex colors and Detail are not compatible" );
	FeatureRule( Requires( F_USE_FRONT_FACE_NORMALS_FOR_BACK_FACES, F_ALPHA_TEST ), "Use Front Face Normals requires Alpha Test" );
	FeatureRule( Requires( F_USE_FRONT_FACE_NORMALS_FOR_BACK_FACES, F_RENDER_BACKFACES ), "Use Front Face Normals requires Backfaces" );
	FeatureRule( Allow1( F_CLOAK, F_USE_STATUS_EFFECTS_PROXY ), "Cloak, Cosmic Veil, and Status Effects are not compatible" );
	FeatureRule( Allow1( F_UNLIT, F_DETAIL ), "Unlit and Detail are not compatible" );
	FeatureRule( Allow1( F_UNLIT, F_PAINT_VERTEX_COLORS ), "Unlit and Paint Vertex Colors are not compatible" );
	FeatureRule( Allow1( F_UNLIT, F_USE_NPR_LIGHTING ), "Unlit and NPR Lighting are not compatible" );
	FeatureRule( Allow1( F_UNLIT, F_SELF_ILLUM ), "Unlit and Self Illum are not compatible" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;             
	float4 vVertexColor               : COLOR0         < Semantic( Color ); >;                     // S_VERTEX_COLOR=1
	float4 vVertexColor               : COLOR0         < Semantic( VertexPaintTintColor ); >;      // S_PAINT_VERTEX_COLORS=1
	float4 vPerVertexLighting         : COLOR1         < Semantic( PerVertexLighting ); >;         // D_BAKED_LIGHTING_FROM_VERTEX_STREAM=1
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float2 vTexCoord2                 : TEXCOORD1      < Semantic( LowPrecisionUv1 ); >;           // S_SECONDARY_UV=1
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1, D_BAKED_LIGHTING_FROM_VERTEX_STREAM=1, S_JITTER_VERTICES=2
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_OUTLINE, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_USE_NPR_LIGHTING, F_USE_NPR_LIGHTING );
	StaticCombo( S_USE_STATUS_EFFECTS_PROXY, F_USE_STATUS_EFFECTS_PROXY );
	StaticCombo( S_JITTER_VERTICES, F_JITTER_VERTICES );
	StaticCombo( S_PAINT_VERTEX_COLORS, F_PAINT_VERTEX_COLORS );
	StaticCombo( S_VERTEX_COLOR, F_VERTEX_COLOR );
	StaticCombo( S_SECONDARY_UV, F_SECONDARY_UV );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Requires( S_MODE_OUTLINE, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_STATUS_EFFECTS_PROXY ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_PAINT_VERTEX_COLORS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_VERTEX_COLOR ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_SECONDARY_UV ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_SECONDARY_UV ) );
	StaticComboRule( Allow1( S_VERTEX_COLOR, S_PAINT_VERTEX_COLORS ) );
	DynamicCombo( D_OUTPUT_MOTION_VECTORS, 0..1 );
	DynamicCombo( D_USE_STATUS_EFFECTS_PROXY, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_GLITCH, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Requires( D_USE_STATUS_EFFECTS_PROXY, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Requires( D_GLITCH, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Allow1( S_JITTER_VERTICES, D_GLITCH ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, D_COMPRESSED_NORMALS_AND_TANGENTS ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_USE_STATUS_EFFECTS_PROXY, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	bool g_bOverrideNprOutline < UiType(CheckBox); Expression(F_OVERRIDE_NPR_OUTLINE ? 1 : 0); >;
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	float g_flGlitchDistortStrength < Default(0.4); Attribute("GlitchDistortStrength"); UiType(Slider); >;
	float g_flGlitchFrameRate < Default(15); Attribute("GlitchFrameRate"); UiType(Slider); >;
	float g_flGlitchJumpStrength < Default(1); Attribute("GlitchJumpStrength"); UiType(Slider); >;
	float g_flGlitchQuantizeScale < Default(0.25); Attribute("GlitchQuantizeScale"); UiType(Slider); >;
	float g_flGlitchQuantizeStrength < Default(0.95); Attribute("GlitchQuantizeStrength"); UiType(Slider); >;
	float g_flGlitchSpeed < Default(1); Attribute("GlitchSpeed"); UiType(Slider); >;
	float g_flGlitchStrength < Default(1); Attribute("GlitchStrength"); UiType(Slider); >;
	float g_flNPROutlineThickness < Attribute("g_flNPROutlineThickness"); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	int g_nGlitchQuantizeType < Default(2); Attribute("GlitchQuantizeType"); UiType(Slider); >;
	ByteAddressBuffer g_prevFrameAnimatedVertexCache < Attribute("PrevFrameAnimatedVertexCache"); >;
	[[layer_constant]] StructuredBuffer g_prevFrameTransformBuffer < Attribute("PrevFrameTransformBuffer"); >;
	Texture2D g_tJitterMask < Channel(R, None(TextureJitterMask), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNprOutlineMask < Channel(R, Box(TextureNprOutlineMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	float2 g_vTexCoord2ScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoord2UByModelScaleOrigin/2,g_nScaleTexCoord2VByModelScaleOrigin/2)); >;
	float4 g_vTexCoord2ScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoord2UByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoord2ScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoord2VByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==0) ? 1 : 0)); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// Vertex Animation
	CreateInputTexture2D(TextureJitterMask, Linear, 8, "", "_mask", "Vertex Animation,90", Default4(1, 0, 0, 0));
	bool g_bSynchronizeJitter1 < Default(1); UiType(CheckBox); UiGroup("Vertex Animation,90"); >;
	bool g_bUseSecondaryUvForJitterMask < UiType(CheckBox); UiGroup("Vertex Animation,90"); >;
	float g_flJitterQuantizeDisplacement1 < UiType(Slider); UiGroup("Vertex Animation,90"); >;
	float g_flJitterQuantizeTime1 < UiType(Slider); UiGroup("Vertex Animation,90"); >;
	float3 g_vJitterExpression < Range3(-1024, -1024, -1024, 1024, 1024, 1024); UiType(VectorText); UiGroup("Vertex Animation,90"); >;
	float g_flJitterSpeedA1 < Default(10); Range(0, 40); UiType(Slider); UiGroup("Vertex Animation,90 / Jitter Waves A,10"); >;
	float3 g_vJitterAmplitudesXA1 < Default(4); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves A,10"); >;
	float3 g_vJitterAmplitudesYA1 < Default(0); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves A,10"); >;
	float3 g_vJitterAmplitudesZA1 < Default(0); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves A,10"); >;
	float3 g_vJitterFrequenciesA1 < Default3(0.02, 0.04, 0.08); Range3(-0.5, -0.5, -0.5, 0.5, 0.5, 0.5); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves A,10"); >;
	float g_flJitterSpeedB1 < Default(7); Range(0, 40); UiType(Slider); UiGroup("Vertex Animation,90 / Jitter Waves B,20"); >;
	float3 g_vJitterAmplitudesXB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves B,20"); >;
	float3 g_vJitterAmplitudesYB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves B,20"); >;
	float3 g_vJitterAmplitudesZB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves B,20"); >;
	float3 g_vJitterFrequenciesB1 < Default3(0.05, 0.09, 0.17); Range3(-0.5, -0.5, -0.5, 0.5, 0.5, 0.5); UiType(VectorText); UiGroup("Vertex Animation,90 / Jitter Waves B,20"); >;
	
	// NPR
	CreateInputTexture2D(TextureNprOutlineMask1, Linear, 8, "", "_mask", "NPR,100 / NPR Outline, 30", Default4(1, 0, 0, 0));
	float g_flOverrideNprOutlineThickness < Default(0.2); Range(0, 2); UiType(Slider); UiGroup("NPR,100 / NPR Outline, 30"); UiVisibility(F_OVERRIDE_NPR_OUTLINE && !F_DISABLE_NPR_OUTLINE); >;
	
	// Texture Coordinates
	int g_nScaleTexCoordUByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/40"); >;
	int g_nScaleTexCoordVByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/50"); >;
	int g_nScaleTexCoordUByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/55"); >;
	int g_nScaleTexCoordVByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/56"); >;
	int g_nScaleTexCoord2UByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/60"); >;
	int g_nScaleTexCoord2VByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/70"); >;
	int g_nScaleTexCoord2UByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/75"); >;
	int g_nScaleTexCoord2VByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/76"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 1 (name: g_vTexCoordScaleByModelU) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	out float gl_ClipDistance[1];
	
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
	
	layout(set = 4, binding = 32, std430) readonly buffer g_instanceBuffer
	{
	    _1125 _m0[];
	} g_instanceBuffer_1;
	
	layout(set = 4, binding = 30, std430) readonly buffer g_transformBuffer
	{
	    _1119 _m0[];
	} g_transformBuffer_1;
	
	struct _1623
	{
	    int g_bTexCoordScaleByModel;
	    vec4 g_vTexCoordScaleByModelU;
	    vec4 g_vTexCoordScaleByModelV;
	    vec2 g_vTexCoordScaleByModelOrigin;
	    int g_bTexCoord2ScaleByModel;
	    vec4 g_vTexCoord2ScaleByModelU;
	    vec4 g_vTexCoord2ScaleByModelV;
	    vec2 g_vTexCoord2ScaleByModelOrigin;
	};
	
	layout(set = 0) uniform _1623 _Globals_;
	
	struct _1388
	{
	    mat4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    vec3 _m3;
	};
	
	layout(set = 0) uniform _1388 PerViewConstantBuffer_t;
	
	layout(location = 5) in uint nInstanceIdx;
	layout(location = 4) in uvec4 vBlendIndices;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 2) in vec3 vNormalOs;
	layout(location = 3) in vec4 vTangentUOs_flTangentVSign;
	layout(location = 1) in vec2 vTexCoord;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec4 output_3;
	layout(location = 4) out vec4 output_4;
	
	void main()
	{
	    uint _21785;
	    if (((g_instanceBuffer_1._m0[nInstanceIdx]._m5 >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer_1._m0[nInstanceIdx]._m1 + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer_1._m0[nInstanceIdx]._m1;
	    }
	    mat4x3 _10676 = transpose(g_transformBuffer_1._m0[_21785]._m0);
	    vec3 _7726 = _10676[0];
	    vec3 _16758 = _10676[1];
	    vec3 _16759 = _10676[2];
	    mat3 _13976 = transpose(mat3(_7726 * (1.0 / dot(_7726, _7726)), _16758 * (1.0 / dot(_16758, _16758)), _16759 * (1.0 / dot(_16759, _16759))));
	    vec4 _23812 = vec4(uvec4(g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 255u, (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 65280u) >> uint(8), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 16711680u) >> uint(16), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec3 _6253 = _23812.xyz;
	    vec3 _17828 = _6253 * vec3(0.077399380505084991455078125);
	    vec3 _7676 = pow((_6253 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _21354;
	    if (_23812.x <= 0.040449999272823333740234375)
	    {
	        _21354 = _17828.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (_23812.y <= 0.040449999272823333740234375)
	    {
	        _21355 = _17828.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    vec3 _23051 = vec4(vPositionOs.xyz, 1.0) * g_transformBuffer_1._m0[_21785]._m0;
	    vec4 _10829 = vTexCoord.xyxy;
	    bool _14874 = _Globals_.g_bTexCoordScaleByModel != 0;
	    bool _12885;
	    if (_14874)
	    {
	        _12885 = true;
	    }
	    else
	    {
	        _12885 = _Globals_.g_bTexCoord2ScaleByModel != 0;
	    }
	    vec4 _21710;
	    if (_12885)
	    {
	        bvec4 _9579 = greaterThanEqual(vTexCoord.xyxy, vec4(0.0));
	        float _25108 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].x, g_transformBuffer_1._m0[_21785]._m0[1].x, g_transformBuffer_1._m0[_21785]._m0[2].x));
	        float _25109 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].y, g_transformBuffer_1._m0[_21785]._m0[1].y, g_transformBuffer_1._m0[_21785]._m0[2].y));
	        float _18672 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].z, g_transformBuffer_1._m0[_21785]._m0[1].z, g_transformBuffer_1._m0[_21785]._m0[2].z));
	        vec4 _21709;
	        if (_14874)
	        {
	            vec4 _10934 = vec4(_25108, _25109, _18672, 1.0);
	            vec4 _22475;
	            if (_9579.x)
	            {
	                vec4 _10180 = _10829;
	                _10180.x = ((vTexCoord.x - _Globals_.g_vTexCoordScaleByModelOrigin.x) * dot(_10934, _Globals_.g_vTexCoordScaleByModelU.xyzw)) + _Globals_.g_vTexCoordScaleByModelOrigin.x;
	                _22475 = _10180;
	            }
	            else
	            {
	                _22475 = _10829;
	            }
	            vec4 _12501;
	            if (_9579.y)
	            {
	                vec4 _10181 = _22475;
	                _10181.y = ((_22475.y - _Globals_.g_vTexCoordScaleByModelOrigin.y) * dot(_10934, _Globals_.g_vTexCoordScaleByModelV.xyzw)) + _Globals_.g_vTexCoordScaleByModelOrigin.y;
	                _12501 = _10181;
	            }
	            else
	            {
	                _12501 = _22475;
	            }
	            _21709 = _12501;
	        }
	        else
	        {
	            _21709 = _10829;
	        }
	        vec4 _12503;
	        if (_Globals_.g_bTexCoord2ScaleByModel != 0)
	        {
	            vec4 _10935 = vec4(_25108, _25109, _18672, 1.0);
	            vec4 _22476;
	            if (_9579.z)
	            {
	                vec4 _10182 = _21709;
	                _10182.z = ((_21709.z - _Globals_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_10935, _Globals_.g_vTexCoord2ScaleByModelU.xyzw)) + _Globals_.g_vTexCoord2ScaleByModelOrigin.x;
	                _22476 = _10182;
	            }
	            else
	            {
	                _22476 = _21709;
	            }
	            vec4 _12502;
	            if (_9579.w)
	            {
	                vec4 _10183 = _22476;
	                _10183.w = ((_22476.w - _Globals_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_10935, _Globals_.g_vTexCoord2ScaleByModelV.xyzw)) + _Globals_.g_vTexCoord2ScaleByModelOrigin.y;
	                _12502 = _10183;
	            }
	            else
	            {
	                _12502 = _22476;
	            }
	            _12503 = _12502;
	        }
	        else
	        {
	            _12503 = _21709;
	        }
	        _21710 = _12503;
	    }
	    else
	    {
	        _21710 = _10829;
	    }
	    vec4 _18256 = (vec4(_23051.xyz, 1.0) + (PerViewConstantBuffer_t._m2 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = normalize(vNormalOs.xyz * _13976);
	    output_1 = _21710;
	    output_2 = _23051 - PerViewConstantBuffer_t._m3.xyz;
	    output_3 = vec4(_21354, _21355, _19302, _23812.w);
	    output_4 = vec4(normalize(vTangentUOs_flTangentVSign.xyz * _13976), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(vec4(_23051.xyz, 1.0), PerViewConstantBuffer_t._m1.xyzw);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	IntAttribute(TexCoordScaleByModelU, g_nScaleTexCoordUByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelV, g_nScaleTexCoordVByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelUOrigin, g_nScaleTexCoordUByModelScaleOrigin);
	IntAttribute(TexCoordScaleByModelVOrigin, g_nScaleTexCoordVByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelU, g_nScaleTexCoord2UByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelV, g_nScaleTexCoord2VByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelUOrigin, g_nScaleTexCoord2UByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelVOrigin, g_nScaleTexCoord2VByModelScaleOrigin);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(AllowBackfaceCulling, F_RENDER_BACKFACES ? 0 : 1);
	BoolAttribute(WriteDepthBeforeAlphaBlending, F_WRITE_DEPTH_BEFORE_ALPHA_BLENDING ? 1 : 0);
	BoolAttribute(PerVertexLighting, (F_USE_STATUS_EFFECTS_PROXY || F_UNLIT || F_USE_NPR_LIGHTING || F_CLOAK || F_ADVANCED_TRANSLUCENCY) ? 0 : 1);
	BoolAttribute(ForwardLayerOnly, F_USE_NPR_LIGHTING || F_USE_STATUS_EFFECTS_PROXY || F_UNLIT || F_SHEEN || F_CLOAK || F_GLASS || F_TRANSLUCENT);
	BoolAttribute(SupportsAggregateInstancing, (F_USE_STATUS_EFFECTS_PROXY || F_TRANSLUCENT || F_CLOAK) ? 0 : 1);
	BoolAttribute(UseShadowFastPath, (!F_JITTER_VERTICES && !F_ALPHA_TEST) ? 1 : 0);
	BoolAttribute(NprLitOutline, (F_USE_NPR_LIGHTING && !(F_DISABLE_NPR_OUTLINE || F_TRANSLUCENT || F_UNLIT || F_CLOAK || F_GLASS) && !F_SOLID_COLOR_OUTLINE) ? 1 : 0);
	BoolAttribute(NprSolidOutline, (F_USE_NPR_LIGHTING && !(F_DISABLE_NPR_OUTLINE || F_TRANSLUCENT || F_UNLIT || F_CLOAK || F_GLASS) && F_SOLID_COLOR_OUTLINE) ? 1 : 0);
	BoolAttribute(UseStatusEffectsProxy, F_USE_STATUS_EFFECTS_PROXY ? 1 : 0);
	
	#if (S_VERTEX_COLOR == 1)
		Float3Attribute(OcclusionCullingBoundsExpand, float3(dot3(abs(g_vJitterAmplitudesXA1),1.x),dot3(abs(g_vJitterAmplitudesYA1),1.x),dot3(abs(g_vJitterAmplitudesZA1),1.x)));
	#endif
	#if (S_PAINT_VERTEX_COLORS == 1)
		BoolAttribute(VertexPaintUIPickColor, true);
		BoolAttribute(VertexPaintUIPickColorAlpha, F_ALPHA_TEST || F_TRANSLUCENT);
	#endif
	#if (S_JITTER_VERTICES == 0)
		BoolAttribute(VertexPaintUIPickColor, true);
		BoolAttribute(VertexPaintUIPickColorAlpha, F_ALPHA_TEST || F_TRANSLUCENT);
	#endif
	#if (S_PAINT_VERTEX_COLORS == 0)
		Float3Attribute(OcclusionCullingBoundsExpand, float3(dot3(abs(g_vJitterAmplitudesXA1),1.x),dot3(abs(g_vJitterAmplitudesYA1),1.x),dot3(abs(g_vJitterAmplitudesZA1),1.x)));
	#endif
	#if (S_VERTEX_COLOR == 0)
		BoolAttribute(VertexPaintUIPickColor, true);
		BoolAttribute(VertexPaintUIPickColorAlpha, F_ALPHA_TEST || F_TRANSLUCENT);
	#endif
}

PS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_OUTLINE, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_USE_NPR_LIGHTING, F_USE_NPR_LIGHTING );
	StaticCombo( S_USE_STATUS_EFFECTS_PROXY, F_USE_STATUS_EFFECTS_PROXY );
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_TRANSLUCENT, F_TRANSLUCENT );
	StaticCombo( S_SHEEN, F_SHEEN );
	StaticCombo( S_GLASS, F_GLASS );
	StaticCombo( S_ENABLE_TEXTURE_TRANSFORMS, F_ENABLE_TEXTURE_TRANSFORMS );
	StaticCombo( S_DETAIL, F_DETAIL );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticCombo( S_CLOAK, F_CLOAK );
	StaticCombo( S_UNLIT, F_UNLIT );
	StaticCombo( S_ADVANCED_TRANSLUCENCY, F_ADVANCED_TRANSLUCENCY );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Requires( S_MODE_OUTLINE, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_STATUS_EFFECTS_PROXY ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_ENABLE_TEXTURE_TRANSFORMS ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_DETAIL ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_DETAIL ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_ENABLE_TEXTURE_TRANSFORMS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_SHEEN ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_ALPHA_TEST ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_OUTLINE, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_OUTLINE, S_UNLIT ) );
	StaticComboRule( Allow1( S_CLOAK, S_GLASS ) );
	StaticComboRule( Allow1( S_CLOAK, S_GLASS, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow1( S_CLOAK, S_GLASS, S_MODE_OUTLINE ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_CLOAK, S_GLASS ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_DETAIL ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_SHEEN ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_GLASS ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_UNLIT ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_TRANSLUCENT, S_ALPHA_TEST ) );
	StaticComboRule( Requires( S_ADVANCED_TRANSLUCENCY, S_TRANSLUCENT, S_ALPHA_TEST ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_CLOAK ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_CLOAK, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_CLOAK, S_ADVANCED_TRANSLUCENCY ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_CLOAK, S_DETAIL ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_CLOAK, S_UNLIT ) );
	StaticComboRule( Allow1( S_CLOAK, S_USE_STATUS_EFFECTS_PROXY ) );
	StaticComboRule( Allow1( S_UNLIT, S_DETAIL ) );
	StaticComboRule( Allow1( S_UNLIT, S_USE_NPR_LIGHTING ) );
	DynamicCombo( D_OUTPUT_MOTION_VECTORS, 0..1 );
	DynamicCombo( D_USE_STATUS_EFFECTS_PROXY, 0..1 );
	DynamicCombo( D_SOLID_OUTLINE, 0..1 );
	DynamicCombo( D_CLIP_BEHIND_VEIL, 0..1 );
	DynamicCombo( D_ENABLE_CLOAK, 0..1 );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	DynamicCombo( D_DISCARD_IN_FRONT_OF_REFRACTIVE, 0..1 );
	DynamicCombo( D_SATURATION_VOLUMES, 0..1 );
	DynamicCombo( D_GLITCH, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicCombo( D_DISTANCE_FIELD_OCCLUSION, 0, Sys( 0 ) );
	DynamicCombo( D_MBOIT_PASS, 0, Sys( 0 ) );
	DynamicCombo( D_SEE_THRU_WALLS, 0..2 );
	DynamicCombo( D_RENDER_FORWARD_NORMALS, 0..1 );
	DynamicCombo( D_AREA_LIGHTS, 0..1 );
	DynamicCombo( D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Requires( D_USE_STATUS_EFFECTS_PROXY, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Requires( D_SOLID_OUTLINE, S_MODE_OUTLINE ) );
	DynamicComboRule( Requires( D_CLIP_BEHIND_VEIL, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Requires( D_ENABLE_CLOAK, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_ENABLE_CLOAK, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Allow1( S_UNLIT, D_ENABLE_CLOAK ) );
	DynamicComboRule( Allow1( S_ADVANCED_TRANSLUCENCY, D_ENABLE_CLOAK ) );
	DynamicComboRule( Allow1( S_CLOAK, S_GLASS, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( S_TRANSLUCENT, S_CLOAK, S_GLASS, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( D_ENABLE_CLOAK, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_DISCARD_IN_FRONT_OF_REFRACTIVE ) );
	DynamicComboRule( Requires( D_DISCARD_IN_FRONT_OF_REFRACTIVE, S_CLOAK, S_GLASS, D_ENABLE_CLOAK ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, S_MODE_OUTLINE, D_SATURATION_VOLUMES ) );
	DynamicComboRule( Requires( D_SATURATION_VOLUMES, S_TRANSLUCENT, S_CLOAK, S_GLASS, S_UNLIT, S_SHEEN, S_USE_NPR_LIGHTING ) );
	DynamicComboRule( Requires( D_GLITCH, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, D_ENABLE_CLOAK, D_GLITCH ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( D_OUTPUT_MOTION_VECTORS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_USE_STATUS_EFFECTS_PROXY, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_UNLIT, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_USE_NPR_LIGHTING, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_CLOAK, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_GLASS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_ADVANCED_TRANSLUCENCY, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OUTPUT_MOTION_VECTORS, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_TRANSLUCENT, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_CLOAK, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_GLASS, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_UNLIT, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( D_ENABLE_CLOAK, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_USE_NPR_LIGHTING, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Allow1( S_USE_STATUS_EFFECTS_PROXY, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Requires( D_MBOIT_PASS, S_GLASS, S_TRANSLUCENT ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_OUTPUT_MOTION_VECTORS, D_SATURATION_VOLUMES, D_MBOIT_PASS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_SATURATION_VOLUMES, D_MBOIT_PASS ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_OUTPUT_MOTION_VECTORS, D_SATURATION_VOLUMES, D_MBOIT_PASS, D_SEE_THRU_WALLS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_SATURATION_VOLUMES, D_MBOIT_PASS, D_SEE_THRU_WALLS ) );
	DynamicComboRule( Allow1( S_USE_STATUS_EFFECTS_PROXY, D_SEE_THRU_WALLS ) );
	DynamicComboRule( Requires( D_SEE_THRU_WALLS, S_UNLIT, S_TRANSLUCENT ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_RENDER_FORWARD_NORMALS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_MBOIT_PASS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_RENDER_FORWARD_NORMALS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_SATURATION_VOLUMES ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_RENDER_FORWARD_NORMALS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_SEE_THRU_WALLS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_RENDER_FORWARD_NORMALS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_ENABLE_CLOAK ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_RENDER_FORWARD_NORMALS, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_DISTANCE_FIELD_OCCLUSION ) );
	DynamicComboRule( Requires( D_MBOIT_PASS, D_DISCARD_IN_FRONT_OF_REFRACTIVE ) );
	DynamicComboRule( Requires( D_AREA_LIGHTS, S_GLASS ) );
	DynamicComboRule( Allow1( S_USE_NPR_LIGHTING, D_AREA_LIGHTS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, S_MODE_DEPTH, D_AREA_LIGHTS ) );
	DynamicComboRule( Allow1( S_TRANSLUCENT, D_RENDER_FORWARD_NORMALS ) );
	DynamicComboRule( Allow1( S_GLASS, D_RENDER_FORWARD_NORMALS ) );
	DynamicComboRule( Requires( D_RENDER_FORWARD_NORMALS, S_UNLIT, S_CLOAK, S_SHEEN, S_USE_NPR_LIGHTING, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Requires( D_CLIP_BEHIND_VEIL, S_MODE_OUTLINE, D_RENDER_FORWARD_NORMALS ) );
	DynamicComboRule( Requires( D_OUTPUT_MOTION_VECTORS, D_RENDER_FORWARD_NORMALS, S_MODE_DEPTH, S_MODE_OUTLINE ) );
	DynamicComboRule( Allow1( S_UNLIT, D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS ) );
	DynamicComboRule( Allow1( S_MODE_OUTLINE, D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS ) );
	DynamicComboRule( Requires( D_DECAL_SHADOW_GAMEPLAY_OPTIMIZATIONS, S_USE_NPR_LIGHTING, S_UNLIT, S_USE_STATUS_EFFECTS_PROXY, S_SHEEN, S_CLOAK, D_ENABLE_CLOAK, S_GLASS, S_TRANSLUCENT ) );
	
	RenderState(BackStencilPassOp, Replace);
	RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : F_RENDER_BACKFACES ? None : Back);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthFunc, Always);
	RenderState(DepthFunc, (F_DISABLE_DEPTH_WRITE || F_DISABLE_Z_PREPASS) ? GreaterEqual : Equal);
	RenderState(DepthWriteEnable, false);
	RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
	RenderState(DepthWriteEnable, (F_DISABLE_DEPTH_WRITE && !F_DISABLE_Z_PREPASS) ? false : true);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	RenderState(StencilEnable, true);
	RenderState(StencilPassOp, Replace);
	RenderState(StencilRef, 2);
	RenderState(StencilRef, 6);
	RenderState(StencilRef, 16);
	RenderState(StencilWriteMask, 2);
	RenderState(StencilWriteMask, 6);
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	bool g_bNPRBounceDiffuse < Attribute("g_bNPRBounceDiffuse"); UiType(CheckBox); >;
	bool g_bNPRDirectDiffuse < Attribute("g_bNPRDirectDiffuse"); UiType(CheckBox); >;
	bool g_bNPRDirectSpecular < Attribute("g_bNPRDirectSpecular"); UiType(CheckBox); >;
	bool g_bNPRExposureControl < Attribute("g_bNPRExposureControl"); UiType(CheckBox); >;
	bool g_bNPRRimLighting < Attribute("g_bNPRRimLighting"); UiType(CheckBox); >;
	bool g_bNPRRimLightingDepthOcclusion < Attribute("g_bNPRRimLightingDepthOcclusion"); UiType(CheckBox); >;
	bool g_bNoSpecularAtFullRoughness < UiType(CheckBox); Expression(F_NO_SPECULAR_AT_FULL_ROUGHNESS ? 1 : 0); >;
	bool g_bOverrideBloomAmount < UiType(CheckBox); Expression(F_OVERRIDE_BLOOM_AMOUNT ? 1 : 0); >;
	bool g_bPaintVertexColors < UiType(CheckBox); Expression(F_PAINT_VERTEX_COLORS ? 1 : 0); >;
	bool g_bSelfIllum < UiType(CheckBox); Expression(F_SELF_ILLUM ? 1 : 0); >;
	bool g_bUseFrontFaceNormalsForBackFaces < UiType(CheckBox); Expression(F_USE_FRONT_FACE_NORMALS_FOR_BACK_FACES ? 1 : 0); >;
	bool g_bVertexColor < UiType(CheckBox); Expression(F_VERTEX_COLOR ? 1 : 0); >;
	float g_fNPRSpecularRoughnessBias < Attribute("g_fNPRSpecularRoughnessBias"); UiType(Slider); >;
	float g_fToolsVisMaxLightingComplexity < Default(8); Attribute("g_fToolsVisMaxLightingComplexity"); UiType(Slider); >;
	float2 g_flAlphaAngleScaleBias1 < UiType(VectorText); Expression((g_flAlphaAnglePower1<0) ? float2(-1,1) : float2(1,0)); >;
	float g_flCloakFactorFromCode < Default(1); Attribute("$cloakfactor"); UiType(Slider); >;
	float g_flFullyCloakedRefractFactorFromCode < Default(1); Attribute("$fullycloakedrefractfactor"); UiType(Slider); >;
	float g_flGlitchBreakupStrength < Default(0.2); Attribute("GlitchBreakupStrength"); UiType(Slider); >;
	float g_flGlitchFrameRate < Default(15); Attribute("GlitchFrameRate"); UiType(Slider); >;
	float g_flGlitchScanlineStrength < Default(0.5); Attribute("GlitchScanlineStrength"); UiType(Slider); >;
	float g_flGlitchSpeed < Default(1); Attribute("GlitchSpeed"); UiType(Slider); >;
	float g_flGlitchStrength < Default(1); Attribute("GlitchStrength"); UiType(Slider); >;
	float g_flGlitchWhiteNoiseStrength < Default(1); Attribute("GlitchWhiteNoiseStrength"); UiType(Slider); >;
	float g_flIsAdditive < UiType(Slider); Expression(F_ADDITIVE_BLEND ? 1 : 0); >;
	float g_flNPRDiffusePbrBlend < Attribute("g_flNPRDiffusePbrBlend"); UiType(Slider); >;
	float g_flNPRDiffuseStepSharpness < Attribute("g_flNPRDiffuseStepSharpness"); UiType(Slider); >;
	float g_flNPRDirectLightWrap < Attribute("g_flNPRDirectLightWrap"); UiType(Slider); >;
	float g_flNPRExposureControlPbrBlend < Attribute("g_flNPRExposureControlPbrBlend"); UiType(Slider); >;
	float g_flNPRRimLightFalloff < Attribute("g_flNPRRimLightFalloff"); UiType(Slider); >;
	float g_flNPRRimLightStrength < Attribute("g_flNPRRimLightStrength"); UiType(Slider); >;
	float g_flNPRRimLightWrap < Attribute("g_flNPRRimLightWrap"); UiType(Slider); >;
	float g_flNPRRimOcclusionDepthToleranceMin < Attribute("g_flNPRRimOcclusionDepthToleranceMin"); UiType(Slider); >;
	float g_flNPRRimOcclusionDepthToleranceRange < Attribute("g_flNPRRimOcclusionDepthToleranceRange"); UiType(Slider); >;
	float g_flNPRRimOcclusionSampleDistance < Attribute("g_flNPRRimOcclusionSampleDistance"); UiType(Slider); >;
	float g_flNPRSpecularReflectance < Attribute("g_flNPRSpecularReflectance"); UiType(Slider); >;
	float g_flNPRSpecularStepSharpness < Attribute("g_flNPRSpecularStepSharpness"); UiType(Slider); >;
	float g_flNPRSpecularTint < Attribute("g_flNPRSpecularTint"); UiType(Slider); >;
	float g_flOoNPRDirectLightNormalization < Attribute("g_flOoNPRDirectLightNormalization"); UiType(Slider); >;
	float g_flSFXColorWarpAmount < Attribute("$SFXColorWarpAmount"); UiType(Slider); >;
	float g_flSFXDetailAmount < Attribute("$SFXDetailAmount"); UiType(Slider); >;
	float g_flSFXDetailBlendMode < Attribute("$SFXDetailBlendMode"); UiType(Slider); >;
	float g_flSFXDetailScale < Attribute("$SFXDetailTextureScale"); UiType(Slider); >;
	float g_flSFXDetailScrollX < Attribute("$SFXDetailTextureScrollX"); UiType(Slider); >;
	float g_flSFXDetailScrollY < Attribute("$SFXDetailTextureScrollY"); UiType(Slider); >;
	float g_flSFXDetailScrollZ < Attribute("$SFXDetailTextureScrollZ"); UiType(Slider); >;
	float g_flSFXMetalnessAmount < Attribute("$SFXMetalnessAmount"); UiType(Slider); >;
	float g_flSFXNormalAmount < Attribute("$SFXNormalAmount"); UiType(Slider); >;
	float g_flSFXOffsetX < Attribute("$SFXTextureOffsetX"); UiType(Slider); >;
	float g_flSFXOffsetY < Attribute("$SFXTextureOffsetY"); UiType(Slider); >;
	float g_flSFXOffsetZ < Attribute("$SFXTextureOffsetZ"); UiType(Slider); >;
	float g_flSFXRoughnessAmount < Attribute("$SFXRoughnessAmount"); UiType(Slider); >;
	float g_flSFXScale < Attribute("$SFXTextureScale"); UiType(Slider); >;
	float g_flSFXScrollX < Attribute("$SFXTextureScrollX"); UiType(Slider); >;
	float g_flSFXScrollY < Attribute("$SFXTextureScrollY"); UiType(Slider); >;
	float g_flSFXScrollZ < Attribute("$SFXTextureScrollZ"); UiType(Slider); >;
	float g_flSFXSelfIllumAmount < Attribute("$SFXSelfIllumAmount"); UiType(Slider); >;
	float g_flSFXUseModelUVs < Attribute("$SFXUseModelUVs"); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mAlbedoColorCorrect < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor))); >;
	float4x4 g_mSheenTextureColorTint < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vSheenColorTint1),.85,g_nSheenTextureColorTintMode1)); >;
	float4x4 g_mTextureColorTint < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
	int g_nIgnoreDepthTestGlowColor < Attribute("g_nIgnoreDepthTestGlowColor"); UiType(Slider); >;
	float g_nNPRSpecularSteps < Attribute("g_nNPRSpecularSteps"); UiType(Slider); >;
	Texture2D g_tAltColor_Reveal < Channel(RGB, Box(TextureAltColor1), Srgb); Channel(A, Box(TextureAltTextureReveal), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tAltTranslucency < Channel(R, Box(TextureAltTranslucency1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tAmbientOcclusion < Channel(R, Box3(TextureAmbientOcclusion1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMetalness1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, PreserveCoverage(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, Box(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tDetail < Channel(RGBA, Box(TextureDetail), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tFrameBufferCopyTexture < Attribute("FrameBufferCopyTexture"); SrgbRead(false); >;
	Texture2D g_tGlass < Channel(R, Box(TextureGlassMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tGlowIndex < Attribute("GlowIndexTexture"); SrgbRead(false); >;
	Texture2D g_tGpuPreviewLightingBakedShadow < Attribute("GpuPreviewLightingBakedShadow"); SrgbRead(false); >;
	Texture2D g_tGpuPreviewLightingIndirectDiffuse < Attribute("GpuPreviewLightingIndirectDiffuse"); SrgbRead(false); >;
	Texture2D g_tMasks1 < Channel(R, Box(TextureDetailMask), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tMetalness < Channel(R, Box(TextureMetalness1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNprTransmissiveColor < Channel(RGB, Box(TextureNprTramsissiveColor1), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	Texture3D g_tSFXColorWarp3D < Attribute("$SFXColorWarp"); SrgbRead(false); >;
	Texture2D g_tSFXDetail < Attribute("$SFXDetail"); SrgbRead(true); >;
	Texture2D g_tSFXMetalness < Attribute("$SFXMetalness"); SrgbRead(false); >;
	Texture2D g_tSFXNormal < Attribute("$SFXNormal"); SrgbRead(false); >;
	Texture2D g_tSFXRoughness < Attribute("$SFXRoughness"); SrgbRead(false); >;
	Texture2D g_tSFXSelfIllum < Attribute("$SFXSelfIllum"); SrgbRead(true); >;
	Texture2D g_tSelfIllumMask < Channel(R, Box(TextureSelfIllumMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tSheen < Channel(RGB, Box(TextureSheenColor1), Srgb); Channel(A, Box(TextureSheenRoughness1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tTintMask < Channel(R, Box(TextureTintMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tTintMaskRimLightMask < Channel(R, Box(TextureTintMask1), Linear); Channel(G, Box(TextureRimLightMask1), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	float4 g_vAlbedoTexcoordXform < UiType(VectorText); Expression(v0 = g_flAlbedoTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vAlbedoTexcoordScale1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vAlbedoTexcoordXformOffset < UiType(VectorText); Expression(v0 = g_flAlbedoTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vAlbedoTexcoordScale1;
		v4 = g_vAlbedoTexcoordOffset1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float4 g_vAmbientOcclusionTexcoordXform < UiType(VectorText); Expression(v0 = g_flAmbientOcclusionTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vAmbientOcclusionTexcoordScale1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vAmbientOcclusionTexcoordXformOffset < UiType(VectorText); Expression(v0 = g_flAmbientOcclusionTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vAmbientOcclusionTexcoordScale1;
		v4 = g_vAmbientOcclusionTexcoordOffset1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float4 g_vDamageFlashParams < Attribute("g_vDamageFlashParams"); UiType(VectorText); >;
	float4 g_vDamageFlashSphere < Default(0); Attribute("g_vDamageFlashSphere"); UiType(VectorText); >;
	float4 g_vDetailTexCoordXform < UiType(VectorText); Expression(v0 = g_flDetailTexCoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vDetailTexCoordScale1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vDetailTexCoordXformOffset < UiType(VectorText); Expression(v0 = g_flDetailTexCoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vDetailTexCoordScale1;
		v4 = g_vDetailTexCoordOffset1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float2 g_vNPRDfaoInfluenceRange < Attribute("g_vNPRDfaoInfluenceRange"); UiType(VectorText); >;
	float3 g_vNPRExposureTargets < Attribute("g_vNPRExposureTargets"); UiType(VectorText); >;
	float4 g_vNPROutlineBrightColor < Attribute("g_vNPROutlineBrightColor"); UiType(VectorText); >;
	float4 g_vNPROutlineDarkColor < Attribute("g_vNPROutlineDarkColor"); UiType(VectorText); >;
	float3 g_vNPRPrimaryLightDirection < Attribute("g_vNPRPrimaryLightDirection"); UiType(VectorText); >;
	float2 g_vNPRRimLightUpRamp < Attribute("g_vNPRRimLightUpRamp"); UiType(VectorText); >;
	float4 g_vNormalTexcoordXform < UiType(VectorText); Expression(v0 = g_flNormalTexCoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vNormalTexcoordScale1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vNormalTexcoordXformOffset < UiType(VectorText); Expression(v0 = g_flNormalTexCoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vNormalTexcoordScale1;
		v4 = g_vNormalTexcoordOffset1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float4 g_vSelfIllumTexcoordXform < UiType(VectorText); Expression(v0 = g_flSelfIllumTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vSelfIllumTexcoordScale1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vSelfIllumTexcoordXformOffset < UiType(VectorText); Expression(v0 = g_flSelfIllumTexcoordRotation1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vSelfIllumTexcoordScale1;
		v4 = g_vSelfIllumTexcoordOffset1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	float4 g_vTranslucentTexcoordXform0 < UiType(VectorText); Expression(v0 = g_flTranslucentTexcoordRotation0_1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vTranslucentTexcoordScale0_1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float4 g_vTranslucentTexcoordXform1 < UiType(VectorText); Expression(v0 = g_flTranslucentTexcoordRotation1_1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vTranslucentTexcoordScale1_1;
		v3.xxy*float4(v1,-v2,v2,v1)); >;
	float2 g_vTranslucentTexcoordXformOffset0 < UiType(VectorText); Expression(v0 = g_flTranslucentTexcoordRotation0_1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vTranslucentTexcoordScale0_1;
		v4 = g_vTranslucentTexcoordOffset0_1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	float2 g_vTranslucentTexcoordXformOffset1 < UiType(VectorText); Expression(v0 = g_flTranslucentTexcoordRotation1_1*3.1415927/180;
		v1 = cos(v0);
		v2 = sin(v0);
		v3 = g_vTranslucentTexcoordScale1_1;
		v4 = g_vTranslucentTexcoordOffset1_1;
		-.5*v3*float2(v1-v2,v2+v1)+v4+.5); >;
	
	// Alt Textures
	CreateInputTexture2D(TextureAltColor1, Srgb, 8, "", "_color", "Alt Textures,100", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureAltTextureReveal, Linear, 8, "", "_blend", "Alt Textures,100", Default4(0.5, 0.5, 0.5, 0));
	float g_flAltTextureAmount < UiType(Slider); UiGroup("Alt Textures,100"); >;
	float g_flAltTextureRevealSoftness < Default(0.05); Range(0, 0.5); UiType(Slider); UiGroup("Alt Textures,100"); >;
	
	// Translucency
	bool g_bUseSecondaryUvForAltTranslucency < UiType(CheckBox); UiGroup("Translucency,80 / Uvs,-1"); >;
	bool g_bUseSecondaryUvForTranslucency < UiType(CheckBox); UiGroup("Translucency,80 / Uvs,-1"); >;
	float g_flTranslucentScrollQuantize0_1 < UiType(Slider); UiGroup("Translucency,80 / Uvs,-1"); >;
	float g_flTranslucentScrollQuantize1_1 < UiType(Slider); UiGroup("Translucency,80 / Uvs,-1"); >;
	float g_flTranslucentTexcoordRotation0_1 < Range(0, 360); UiType(Slider); UiGroup("Translucency,80 / Uvs,-1"); >;
	float g_flTranslucentTexcoordRotation1_1 < Range(0, 360); UiType(Slider); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentScrollSpeed0_1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentScrollSpeed1_1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentTexcoordOffset0_1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentTexcoordOffset1_1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentTexcoordScale0_1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	float2 g_vTranslucentTexcoordScale1_1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Translucency,80 / Uvs,-1"); >;
	CreateInputTexture2D(TextureAltTranslucency1, Linear, 8, "", "_trans", "Translucency,80", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureTranslucency1, Linear, 8, "", "_trans", "Translucency,80", Default4(1, 1, 1, 0));
	float g_flAlphaAnglePower1 < Range(-8, 8); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flAlphaBoostDistance < Default(20000); Range(5000, 20000); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flAlphaBoostStrength < Default(3); Range(1, 20); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flAlphaTestReference1 < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakBlurAmount < Default(0.005); Range(0, 0.1); UiStep(0.001); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakBlurFactorMaxRoughness < Default(1); Range(0, 4); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakBlurFactorMinRoughness < Default(1); Range(0, 4); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakBlurNoiseAmount < Default(0.5); Range(0, 8); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakFactor1 < Default(1); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakIntensity < Default(0.85); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flCloakRefractAmount < Default(0.075); Range(-1, 1); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flFullyCloakedRefractFactor1 < Default(1); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flOpacityScale1 < Default(1); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flUnlitAdditiveScale1 < Default(1); Range(0, 32); UiType(Slider); UiGroup("Translucency,80"); Expression(F_ADDITIVE_BLEND ? this : 1); UiVisibility(F_ADDITIVE_BLEND ? 1 : 0); >;
	int g_nTranslucencyBlendMode1 < Range(0, 2); Attribute("0=Multiply,1=Add,2=Subtract"); UiType(Slider); UiGroup("Translucency,80"); >;
	float3 g_vCloakColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("Translucency,80"); >;
	
	// Occlusion
	float g_flAmbientOcclusionTexcoordRotation1 < Range(0, 360); UiType(Slider); UiGroup("Occlusion,50 / Uvs,-1"); >;
	float2 g_vAmbientOcclusionTexcoordOffset1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Occlusion,50 / Uvs,-1"); >;
	float2 g_vAmbientOcclusionTexcoordScale1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Occlusion,50 / Uvs,-1"); >;
	CreateInputTexture2D(TextureAmbientOcclusion1, Linear, 8, "", "_ao", "Occlusion,50", Default4(1, 1, 1, 0));
	bool g_bAcceptSsao < Default(1); UiType(CheckBox); UiGroup("Occlusion,50"); >;
	bool g_bUseSecondaryUvForAmbientOcclusion < UiType(CheckBox); UiGroup("Occlusion,50"); >;
	
	// Color
	float g_flAlbedoScrollQuantize1 < UiType(Slider); UiGroup("Color,10 / Uvs,-1"); >;
	float g_flAlbedoTexcoordRotation1 < Range(0, 360); UiType(Slider); UiGroup("Color,10 / Uvs,-1"); >;
	float2 g_vAlbedoScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Color,10 / Uvs,-1"); >;
	float2 g_vAlbedoTexcoordOffset1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Color,10 / Uvs,-1"); >;
	float2 g_vAlbedoTexcoordScale1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Color,10 / Uvs,-1"); >;
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "Color,10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureTintMask1, Linear, 8, "", "_mask", "Color,10", Default4(1, 1, 1, 0));
	bool g_bApplyTintToVertexColors < UiType(CheckBox); UiGroup("Color,10"); >;
	bool g_bMaskColorTint1 < Default(1); UiType(CheckBox); UiGroup("Color,10"); >;
	bool g_bMaskVertexColorTint1 < Default(1); UiType(CheckBox); UiGroup("Color,10"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("Color,10"); >;
	int g_nTextureColorTintMode1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("Color,10"); >;
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Color,10"); >;
	float3 g_vColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Color,10"); >;
	
	// Detail
	bool g_bUseSecondaryUvForDetail1 < UiType(CheckBox); UiGroup("Detail,60"); >;
	float g_flDetailBlendFactor1 < Default(1); UiType(Slider); UiGroup("Detail,60"); >;
	float g_flDetailTexCoordRotation1 < Range(0, 360); UiType(Slider); UiGroup("Detail,60"); >;
	int g_nDetailBlendMode < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Add,1=Add Self Illum (requires self illum),2=Mod2X"); UiType(Enum); UiGroup("Detail,60"); >;
	float3 g_vDetailColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Detail,60"); Expression(SrgbGammaToLinear(this)); >;
	float2 g_vDetailTexCoordOffset1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Detail,60"); >;
	float2 g_vDetailTexCoordScale1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Detail,60"); >;
	CreateInputTexture2D(TextureDetail, Srgb, 8, "", "_detail", "Detail,80/10", Default4(1, 1, 1, 1));
	CreateInputTexture2D(TextureDetailMask, Linear, 8, "", "_detailmask", "Detail,80/20", Default4(1, 1, 1, 1));
	
	// Glass
	CreateInputTexture2D(TextureGlassMask1, Linear, 8, "", "_mask", "Glass,53", Default4(1, 0, 0, 0));
	float g_flGlassReflectance1 < Default(0.04); UiType(Slider); UiGroup("Glass,53"); >;
	
	// Metalness
	CreateInputTexture2D(TextureMetalness1, Linear, 8, "", "_metal", "Metalness,40", Default4(0, 0, 0, 0));
	
	// Normal and Roughness
	float g_flNormalAndRoughnessScrollQuantize1 < UiType(Slider); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	float g_flNormalTexcoordRotation1 < Range(0, 360); UiType(Slider); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	float2 g_vNormalAndRoughnessScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	float2 g_vNormalTexcoordOffset1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	float2 g_vNormalTexcoordScale1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "Normal and Roughness,30", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "Normal and Roughness,30", Default4(0.5, 0.5, 0.5, 0));
	
	// NPR
	float g_fSolidOutlineVertexColorTint < UiType(Slider); UiGroup("NPR,100 / NPR Outline, 30"); UiVisibility(!F_DISABLE_NPR_OUTLINE); >;
	float3 g_vSolidOutlineTint < Default3(0.1, 0.1, 0.1); UiType(Color); UiGroup("NPR,100 / NPR Outline, 30"); Expression(SrgbGammaToLinear(this)); UiVisibility(!F_DISABLE_NPR_OUTLINE); >;
	CreateInputTexture2D(TextureRimLightMask1, Linear, 8, "", "_mask", "NPR,100 / NPR Rim Light, 40", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureNprTramsissiveColor1, Srgb, 8, "", "_color", "NPR,100 / NPR Transmissive, 50", "materials/default/default_black_mask.tga");
	
	// Self Illum
	float g_flSelfIllumFresnelMaskExponent < Default(5); Range(0.001, 10); UiType(Slider); UiGroup("Self Illum,70 / Fresnel Mask,-2"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float2 g_vSelfIllumFresnelMaskRange1 < Default(0); UiType(VectorText); UiGroup("Self Illum,70 / Fresnel Mask,-2"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float3 g_vSelfIllumFresnelMaskTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Self Illum,70 / Fresnel Mask,-2"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	bool g_bUseSecondaryUvForSelfIllum1 < UiType(CheckBox); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float g_flSelfIllumScrollQuantize1 < UiType(Slider); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float g_flSelfIllumTexcoordRotation1 < Range(0, 360); UiType(Slider); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float2 g_vSelfIllumScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float2 g_vSelfIllumTexcoordOffset1 < Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float2 g_vSelfIllumTexcoordScale1 < Default2(1, 1); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	CreateInputTexture2D(TextureSelfIllumMask1, Linear, 8, "", "_mask", "Self Illum,70", Default4(0, 0, 0, 0));
	float g_flOverrideBloomAmount1 < Default(1); Range(0, 20); UiType(Slider); UiGroup("Self Illum,70"); UiVisibility(F_OVERRIDE_BLOOM_AMOUNT ? 1 : 0); >;
	float g_flSelfIllumAlbedoFactor1 < Default(1); UiType(Slider); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float g_flSelfIllumScale1 < Range(0, 10); UiType(Slider); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float3 g_vSelfIllumTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	
	// Sheen
	CreateInputTexture2D(TextureSheenColor1, Srgb, 8, "", "_sheen", "Sheen,51", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSheenRoughness1, Linear, 8, "", "_rough", "Sheen,51", Default4(0.5, 0.5, 0.5, 0));
	bool g_bSheenMaskColorTint1 < Default(1); UiType(CheckBox); UiGroup("Sheen,51"); >;
	bool g_bSheenMaskVertexColorTint1 < Default(1); UiType(CheckBox); UiGroup("Sheen,51"); >;
	float g_fSheenVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("Sheen,51"); >;
	int g_nSheenTextureColorTintMode1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("Sheen,51"); >;
	float3 g_vSheenColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Sheen,51"); >;
	
	// Rendering
	bool g_bCustomHolePunch < UiType(CheckBox); UiGroup("Rendering,200"); >;
	float g_flCubmapFogAmount < Default(1); UiType(Slider); UiGroup("Rendering,200"); >;
	float g_flGradientFogAmount < Default(1); UiType(Slider); UiGroup("Rendering,200"); >;
	float g_flVolumeFogAmount < Default(1); UiType(Slider); UiGroup("Rendering,200"); >;
	
	// Fog
	float g_flCubemapFogStrength1 < Default(1); UiType(Slider); UiGroup("Fog,300"); >;
	float g_flGradientFogStrength1 < Default(1); UiType(Slider); UiGroup("Fog,300"); >;
	float g_flVolumeFogStrength1 < Default(1); UiType(Slider); UiGroup("Fog,300"); >;
	
	#if (S_USE_STATUS_EFFECTS_PROXY == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_OUTLINE == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_ALPHA_TEST == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, Box(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_ALPHA_TEST == 1)
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, PreserveCoverage(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_TRANSLUCENT == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, Box(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_DETAIL == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_USE_NPR_LIGHTING == 0)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_DEPTH == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(StencilRef, 6);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 1)
		Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMetalness1), Linear); OutputFormat(BC7); SrgbRead(true); >;
		RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, false);
	#endif
	#if (S_MODE_OUTLINE == 1)
		RenderState(StencilRef, 6);
		RenderState(StencilRef, 16);
	#endif
	#if (S_GLASS == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
	#endif
	#if (S_ENABLE_TEXTURE_TRANSFORMS == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_TOOLS_VIS == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_CLOAK == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
		RenderState(StencilRef, 2);
		RenderState(StencilWriteMask, 2);
	#endif
	#if (S_UNLIT == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
		RenderState(DepthFunc, GreaterEqual);
		RenderState(DepthWriteEnable, F_DISABLE_DEPTH_WRITE ? false : true);
	#endif
	
	// Variant parameters
	RenderState(DepthFunc, Always);
	RenderState(DepthFunc, (F_DISABLE_DEPTH_WRITE || F_DISABLE_Z_PREPASS) ? GreaterEqual : Equal);
	RenderState(DepthWriteEnable, (F_DISABLE_DEPTH_WRITE && !F_DISABLE_Z_PREPASS) ? false : true);
	RenderState(StencilWriteMask, 6);
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 9 (name: g_vSelfIllumTint1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _2582
	{
	    uint g_sAniso;
	    uint g_sTrilinearWrap;
	    uint g_tColor;
	    uint g_tTintMask;
	    uint g_tNormalRoughness;
	    uint g_tSelfIllumMask;
	    int g_bOverrideBloomAmount;
	    int g_bUseFrontFaceNormalsForBackFaces;
	    int g_bAcceptSsao;
	    vec3 g_vSelfIllumTint1;
	    float g_flSelfIllumScale1;
	    float g_flSelfIllumAlbedoFactor1;
	    float g_flOverrideBloomAmount1;
	    vec3 g_vSelfIllumFresnelMaskTint1;
	    vec2 g_vSelfIllumFresnelMaskRange1;
	    float g_flSelfIllumFresnelMaskExponent;
	    int g_bSelfIllum;
	    int g_bMaskColorTint1;
	    int g_bMaskVertexColorTint1;
	    int g_bApplyTintToVertexColors;
	    float g_fVertexColorStrength1;
	    vec2 g_vAlbedoScrollSpeed1;
	    float g_flAlbedoScrollQuantize1;
	    mat4 g_mTextureColorTint;
	    mat4 g_mAlbedoColorCorrect;
	    vec2 g_vNormalAndRoughnessScrollSpeed1;
	    float g_flNormalAndRoughnessScrollQuantize1;
	    vec2 g_vSelfIllumScrollSpeed1;
	    float g_flSelfIllumScrollQuantize1;
	    int g_bUseSecondaryUvForSelfIllum1;
	};
	
	layout(set = 1) uniform _2582 _Globals_;
	
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
	
	layout(location = 0) in vec3 input_0;
	layout(location = 1) in vec4 input_1;
	layout(location = 2) in vec3 input_2;
	layout(location = 3) in vec4 input_3;
	layout(location = 4) in vec4 input_4;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    bool _21316;
	    if (!gl_FrontFacing)
	    {
	        _21316 = _Globals_.g_bUseFrontFaceNormalsForBackFaces == 0;
	    }
	    else
	    {
	        _21316 = false;
	    }
	    float _12157 = 1.0 / length(input_0);
	    vec3 _11587 = input_0 * _12157;
	    vec3 _19363;
	    if (_21316)
	    {
	        _19363 = _11587 * (-1.0);
	    }
	    else
	    {
	        _19363 = _11587;
	    }
	    float _7467;
	    if (_Globals_.g_flAlbedoScrollQuantize1 != 0.0)
	    {
	        _7467 = round(PerViewConstantBuffer_t._m0 / _Globals_.g_flAlbedoScrollQuantize1) * _Globals_.g_flAlbedoScrollQuantize1;
	    }
	    else
	    {
	        _7467 = PerViewConstantBuffer_t._m0;
	    }
	    vec2 _11084 = (input_1.xy + fract(_Globals_.g_vAlbedoScrollSpeed1 * _7467)).xy;
	    vec4 _19068 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tTintMask], g_bindless_Sampler[_Globals_.g_sAniso]), _11084);
	    float _17476 = _19068.x;
	    vec4 _19414 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), _11084);
	    vec3 _14791 = _19414.xyz;
	    vec3 _21709;
	    if (_Globals_.g_bApplyTintToVertexColors != 0)
	    {
	        _21709 = mix(_14791, _14791 * input_3.xyz, vec3(((_Globals_.g_bMaskVertexColorTint1 != 0) ? _17476 : 1.0) * _Globals_.g_fVertexColorStrength1));
	    }
	    else
	    {
	        _21709 = _14791;
	    }
	    vec3 _13630 = (vec4(_21709, 1.0) * _Globals_.g_mAlbedoColorCorrect).xyz;
	    vec3 _20944 = mix(_13630, (vec4(_13630, 1.0) * _Globals_.g_mTextureColorTint).xyz, vec3((_Globals_.g_bMaskColorTint1 != 0) ? _17476 : 1.0));
	    vec3 _21785;
	    if (_Globals_.g_bApplyTintToVertexColors == 0)
	    {
	        _21785 = mix(_20944, _20944 * input_3.xyz, vec3(((_Globals_.g_bMaskVertexColorTint1 != 0) ? _17476 : 1.0) * _Globals_.g_fVertexColorStrength1));
	    }
	    else
	    {
	        _21785 = _20944;
	    }
	    float _7468;
	    if (_Globals_.g_flNormalAndRoughnessScrollQuantize1 != 0.0)
	    {
	        _7468 = round(PerViewConstantBuffer_t._m0 / _Globals_.g_flNormalAndRoughnessScrollQuantize1) * _Globals_.g_flNormalAndRoughnessScrollQuantize1;
	    }
	    else
	    {
	        _7468 = PerViewConstantBuffer_t._m0;
	    }
	    vec4 _19372 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), (input_1.xy + fract(_Globals_.g_vNormalAndRoughnessScrollSpeed1.xy * _7468)).xy);
	    float _16000 = _19372.x;
	    float _19720 = _19372.y;
	    float _16783 = (_16000 + _19720) - 1.00392162799835205078125;
	    float _11176 = _16000 - _19720;
	    vec3 _13706 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	    vec3 _9822 = abs(_13706);
	    vec2 _16475 = (-vec2(_13706.x, (-1.0) * _13706.y)) / vec2(max(_9822.z, 0.0078125 * max(_9822.x, _9822.y)));
	    vec3 _24566 = normalize(_19363 - (((input_4.xyz * _12157) * _16475.x) + (((cross(input_0, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))) * _12157) * _16475.y)));
	    bool _14875 = _Globals_.g_bSelfIllum != 0;
	    float _13136;
	    float _16343;
	    vec3 _16863;
	    if (_14875)
	    {
	        vec2 _21710;
	        if (_Globals_.g_bUseSecondaryUvForSelfIllum1 != 0)
	        {
	            _21710 = input_1.zw;
	        }
	        else
	        {
	            _21710 = input_1.xy;
	        }
	        float _7469;
	        if (_Globals_.g_flSelfIllumScrollQuantize1 != 0.0)
	        {
	            _7469 = round(PerViewConstantBuffer_t._m0 / _Globals_.g_flSelfIllumScrollQuantize1) * _Globals_.g_flSelfIllumScrollQuantize1;
	        }
	        else
	        {
	            _7469 = PerViewConstantBuffer_t._m0;
	        }
	        _13136 = _Globals_.g_flSelfIllumScale1;
	        _16343 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tSelfIllumMask], g_bindless_Sampler[_Globals_.g_sTrilinearWrap]), (_21710 + fract(_Globals_.g_vSelfIllumScrollSpeed1.xy * _7469)).xy).x;
	        _16863 = mix(_Globals_.g_vSelfIllumTint1.xyz, _Globals_.g_vSelfIllumTint1.xyz * _21785.xyz, vec3(_Globals_.g_flSelfIllumAlbedoFactor1));
	    }
	    else
	    {
	        _13136 = 0.0;
	        _16343 = 1.0;
	        _16863 = vec3(1.0);
	    }
	    vec3 _11008;
	    vec3 _13456;
	    if (_14875)
	    {
	        vec3 _22811 = mix(_Globals_.g_vSelfIllumFresnelMaskTint1, vec3(1.0), vec3(saturate((pow(max(0.0, dot(-normalize(input_2), _24566)), _Globals_.g_flSelfIllumFresnelMaskExponent) - _Globals_.g_vSelfIllumFresnelMaskRange1.x) / (_Globals_.g_vSelfIllumFresnelMaskRange1.y - _Globals_.g_vSelfIllumFresnelMaskRange1.x))));
	        _11008 = _16863 * _22811;
	        _13456 = _21785 * mix(vec3(1.0), _22811, vec3(_16343));
	    }
	    else
	    {
	        _11008 = _16863;
	        _13456 = _21785;
	    }
	    float _13201 = _16343 * _13136;
	    vec3 _13298 = mix(_13456.xyz, _11008.xyz, vec3(_16343 * saturate(_13136)));
	    float _8768;
	    if (_Globals_.g_bOverrideBloomAmount != 0)
	    {
	        _8768 = saturate((_Globals_.g_flOverrideBloomAmount1 * _16343) * 0.0500000007450580596923828125);
	    }
	    else
	    {
	        _8768 = 0.0;
	    }
	    vec3 _14631 = _13298 * _13201;
	    float _19929 = max(_13201, max(_14631.x, max(_14631.y, _14631.z)));
	    float _16190 = saturate(_19929 * 0.100000001490116119384765625);
	    float _19133;
	    if (_16190 != 0.0)
	    {
	        _19133 = _16190 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m1)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19133 = _16190;
	    }
	    output_0 = vec4((_24566.xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4(((_13298 * 0.100000001490116119384765625) + _14631) / vec3(0.100000001490116119384765625 + _19929), float(uint((_Globals_.g_bAcceptSsao != 0) ? 32 : 0)) * 0.0039215688593685626983642578125);
	    output_2 = vec4(_19372.z, _8768, _19133, _19414.w);
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsLightmapping, (F_USE_STATUS_EFFECTS_PROXY || F_UNLIT || F_USE_NPR_LIGHTING || F_CLOAK || F_GLASS || F_ADVANCED_TRANSLUCENCY) ? 0 : 1);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(alphatest, F_ALPHA_TEST);
	BoolAttribute(translucent, F_TRANSLUCENT || F_CLOAK || F_GLASS);
	BoolAttribute(mapbuilder_donotcollapse, F_TRANSLUCENT || F_CLOAK);
	BoolAttribute(renderbackfaces, F_RENDER_BACKFACES);
	BoolAttribute(bWantsFBCopyTexture, F_CLOAK || F_GLASS);
	BoolAttribute(NoZPrepass, F_DISABLE_Z_PREPASS);
	BoolAttribute(DoNotCastShadows, F_DO_NOT_CAST_SHADOWS ? 1 : 0);
	StringAttribute(MaterialLayerType, pbr);
	IntAttribute(MaterialLayerCount, F_MATERIAL_VARIANT);
	StringAttribute(MaterialLayerRefType, pbr);
	
}

RTX
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_OUTLINE, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_USE_NPR_LIGHTING, F_USE_NPR_LIGHTING );
	StaticCombo( S_USE_STATUS_EFFECTS_PROXY, F_USE_STATUS_EFFECTS_PROXY );
	StaticCombo( S_JITTER_VERTICES, F_JITTER_VERTICES );
	StaticCombo( S_PAINT_VERTEX_COLORS, F_PAINT_VERTEX_COLORS );
	StaticCombo( S_VERTEX_COLOR, F_VERTEX_COLOR );
	StaticCombo( S_SECONDARY_UV, F_SECONDARY_UV );
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_TRANSLUCENT, F_TRANSLUCENT );
	StaticCombo( S_SHEEN, F_SHEEN );
	StaticCombo( S_GLASS, F_GLASS );
	StaticCombo( S_ENABLE_TEXTURE_TRANSFORMS, F_ENABLE_TEXTURE_TRANSFORMS );
	StaticCombo( S_DETAIL, F_DETAIL );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Requires( S_MODE_OUTLINE, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_USE_STATUS_EFFECTS_PROXY ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_PAINT_VERTEX_COLORS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_VERTEX_COLOR ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_SECONDARY_UV ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_SECONDARY_UV ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_ENABLE_TEXTURE_TRANSFORMS ) );
	StaticComboRule( Allow1( S_MODE_OUTLINE, S_DETAIL ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_DETAIL ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_ENABLE_TEXTURE_TRANSFORMS ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_SHEEN ) );
	StaticComboRule( Allow0( S_MODE_DEPTH ) );
	StaticComboRule( Allow0( S_MODE_OUTLINE ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow0( S_DETAIL ) );
	StaticComboRule( Allow0( S_ENABLE_TEXTURE_TRANSFORMS ) );
	StaticComboRule( Allow0( S_USE_NPR_LIGHTING ) );
	StaticComboRule( Allow0( S_USE_STATUS_EFFECTS_PROXY ) );
	StaticComboRule( Allow0( S_JITTER_VERTICES ) );
	StaticComboRule( Allow0( S_SHEEN ) );
	StaticComboRule( Allow0( S_SECONDARY_UV ) );
	StaticComboRule( Allow0( S_VERTEX_COLOR ) );
	StaticComboRule( Allow0( S_PAINT_VERTEX_COLORS ) );
	StaticComboRule( Allow1( S_TRANSLUCENT, S_ALPHA_TEST ) );
	StaticComboRule( Allow1( S_VERTEX_COLOR, S_PAINT_VERTEX_COLORS ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_PAINT_VERTEX_COLORS ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_TRANSLUCENT ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS, S_DETAIL ) );
	StaticComboRule( Allow1( S_SHEEN, S_GLASS ) );
	StaticComboRule( Allow1( S_PAINT_VERTEX_COLORS, S_DETAIL ) );
	DynamicCombo( D_OUTPUT_MOTION_VECTORS, 0..1 );
	DynamicCombo( D_USE_STATUS_EFFECTS_PROXY, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_GLITCH, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Requires( D_USE_STATUS_EFFECTS_PROXY, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Requires( D_GLITCH, S_USE_STATUS_EFFECTS_PROXY ) );
	DynamicComboRule( Allow1( S_JITTER_VERTICES, D_GLITCH ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, D_COMPRESSED_NORMALS_AND_TANGENTS ) );
	DynamicComboRule( Allow1( S_MODE_DEPTH, S_MODE_OUTLINE, S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_USE_STATUS_EFFECTS_PROXY, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_OUTPUT_MOTION_VECTORS ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	bool g_bPaintVertexColors < UiType(CheckBox); Expression(F_PAINT_VERTEX_COLORS ? 1 : 0); >;
	bool g_bSelfIllum < UiType(CheckBox); Expression(F_SELF_ILLUM ? 1 : 0); >;
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	bool g_bUseFrontFaceNormalsForBackFaces < UiType(CheckBox); Expression(F_USE_FRONT_FACE_NORMALS_FOR_BACK_FACES ? 1 : 0); >;
	bool g_bVertexColor < UiType(CheckBox); Expression(F_VERTEX_COLOR ? 1 : 0); >;
	float2 g_flAlphaAngleScaleBias1 < UiType(VectorText); Expression((g_flAlphaAnglePower1<0) ? float2(-1,1) : float2(1,0)); >;
	float4x4 g_mAlbedoColorCorrect < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor))); >;
	float4x4 g_mTextureColorTint < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMetalness1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, PreserveCoverage(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, Box(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tGlass < Channel(R, Box(TextureGlassMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tMetalness < Channel(R, Box(TextureMetalness1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tSelfIllumMask < Channel(R, Box(TextureSelfIllumMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tTintMask < Channel(R, Box(TextureTintMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// Color
	float g_flAlbedoScrollQuantize1 < UiType(Slider); UiGroup("Color,10 / Uvs,-1"); >;
	float2 g_vAlbedoScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Color,10 / Uvs,-1"); >;
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "Color,10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureTintMask1, Linear, 8, "", "_mask", "Color,10", Default4(1, 1, 1, 0));
	bool g_bApplyTintToVertexColors < UiType(CheckBox); UiGroup("Color,10"); >;
	bool g_bMaskColorTint1 < Default(1); UiType(CheckBox); UiGroup("Color,10"); >;
	bool g_bMaskVertexColorTint1 < Default(1); UiType(CheckBox); UiGroup("Color,10"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("Color,10"); >;
	int g_nTextureColorTintMode1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("Color,10"); >;
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Color,10"); >;
	float3 g_vColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Color,10"); >;
	
	// Glass
	CreateInputTexture2D(TextureGlassMask1, Linear, 8, "", "_mask", "Glass,53", Default4(1, 0, 0, 0));
	float g_flGlassReflectance1 < Default(0.04); UiType(Slider); UiGroup("Glass,53"); >;
	
	// Metalness
	CreateInputTexture2D(TextureMetalness1, Linear, 8, "", "_metal", "Metalness,40", Default4(0, 0, 0, 0));
	
	// Normal and Roughness
	float g_flNormalAndRoughnessScrollQuantize1 < UiType(Slider); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	float2 g_vNormalAndRoughnessScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Normal and Roughness,30 / UVs,-1"); >;
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "Normal and Roughness,30", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "Normal and Roughness,30", Default4(0.5, 0.5, 0.5, 0));
	
	// Self Illum
	float g_flSelfIllumScrollQuantize1 < UiType(Slider); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	float2 g_vSelfIllumScrollSpeed1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Self Illum,70 / UVs,-1"); UiVisibility(F_SELF_ILLUM); >;
	CreateInputTexture2D(TextureSelfIllumMask1, Linear, 8, "", "_mask", "Self Illum,70", Default4(0, 0, 0, 0));
	float g_flSelfIllumAlbedoFactor1 < Default(1); UiType(Slider); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float g_flSelfIllumScale1 < Range(0, 10); UiType(Slider); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	float3 g_vSelfIllumTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("Self Illum,70"); UiVisibility(F_SELF_ILLUM ? 1 : 0); >;
	
	// Translucency
	CreateInputTexture2D(TextureTranslucency1, Linear, 8, "", "_trans", "Translucency,80", Default4(1, 1, 1, 0));
	float g_flAlphaAnglePower1 < Range(-8, 8); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flAlphaTestReference1 < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Translucency,80"); >;
	float g_flOpacityScale1 < Default(1); UiType(Slider); UiGroup("Translucency,80"); >;
	
	// Texture Coordinates
	int g_nScaleTexCoordUByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/40"); >;
	int g_nScaleTexCoordVByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/50"); >;
	int g_nScaleTexCoordUByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/55"); >;
	int g_nScaleTexCoordVByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/56"); >;
	int g_nScaleTexCoord2UByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/60"); >;
	int g_nScaleTexCoord2VByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/70"); >;
	int g_nScaleTexCoord2UByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/75"); >;
	int g_nScaleTexCoord2VByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/76"); >;
	
	#if (S_ALPHA_TEST == 1)
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, PreserveCoverage(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_TRANSLUCENT == 1)
		Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor1, TextureTranslucency1), Srgb); Channel(A, Box(TextureTranslucency1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	
	// Variant parameters
	Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMetalness1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL: 5326
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
	#extension GL_EXT_ray_tracing : require
	#extension GL_EXT_nonuniform_qualifier : require
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
	
	struct PackedRtxInstanceData_t_natural
	{
	    uint nSrgbColor;
	    uint nTriangleGeometry;
	    uint nMaterialData;
	    uint nMaterialFlags_nInstanceFlags;
	    float fEmissiveBoost;
	    uint nInstanceFlags;
	    uint _pad1;
	    uint _pad2;
	};
	
	struct _RTX_MATERIAL_DATA_
	{
	    uint g_sAniso;
	    uint g_sAnisoClamp;
	    uint g_sBilinearWrap;
	    uint g_sBilinearClamp;
	    uint g_sBilinearClamp_NoGlobalMipBias;
	    uint g_sTrilinearWrap;
	    uint g_sTrilinearWrap_NoGlobalMipBias;
	    uint g_sTrilinearClamp;
	    uint g_sPointClamp;
	    uint g_sPointWrap;
	    float _g_fl_AutoPad0_;
	    float _g_fl_AutoPad1_;
	    vec4 g_vPixelToProj;
	    mat4 g_mHighPrecisionWorldFromProj;
	    mat4 g_mHighPrecisionWorldFromProjNoJitter;
	    bool g_bPaintVertexColors;
	    bool g_bVertexColor;
	    float _g_fl_AutoPad2_;
	    float _g_fl_AutoPad3_;
	    vec3 g_vJitterFrequenciesA1;
	    float _g_fl_AutoPad4_;
	    vec3 g_vJitterAmplitudesXA1;
	    float _g_fl_AutoPad5_;
	    vec3 g_vJitterAmplitudesYA1;
	    float _g_fl_AutoPad6_;
	    vec3 g_vJitterAmplitudesZA1;
	    float g_flJitterSpeedA1;
	    vec3 g_vJitterFrequenciesB1;
	    float _g_fl_AutoPad7_;
	    vec3 g_vJitterAmplitudesXB1;
	    float _g_fl_AutoPad8_;
	    vec3 g_vJitterAmplitudesYB1;
	    float _g_fl_AutoPad9_;
	    vec3 g_vJitterAmplitudesZB1;
	    float g_flJitterSpeedB1;
	    float g_flJitterQuantizeTime1;
	    float g_flJitterQuantizeDisplacement1;
	    float _g_fl_AutoPad10_;
	    float _g_fl_AutoPad11_;
	    vec3 g_vJitterExpression;
	    bool g_bUseSecondaryUvForJitterMask;
	    bool g_bSynchronizeJitter1;
	    uint g_tJitterMask;
	    int g_nScaleTexCoordUByModelScaleAxis;
	    int g_nScaleTexCoordVByModelScaleAxis;
	    bool g_bTexCoordScaleByModel;
	    int g_nScaleTexCoordUByModelScaleOrigin;
	    int g_nScaleTexCoordVByModelScaleOrigin;
	    float _g_fl_AutoPad12_;
	    vec4 g_vTexCoordScaleByModelU;
	    vec4 g_vTexCoordScaleByModelV;
	    vec2 g_vTexCoordScaleByModelOrigin;
	    int g_nScaleTexCoord2UByModelScaleAxis;
	    int g_nScaleTexCoord2VByModelScaleAxis;
	    int g_nScaleTexCoord2UByModelScaleOrigin;
	    int g_nScaleTexCoord2VByModelScaleOrigin;
	    bool g_bTexCoord2ScaleByModel;
	    float _g_fl_AutoPad13_;
	    vec4 g_vTexCoord2ScaleByModelU;
	    vec4 g_vTexCoord2ScaleByModelV;
	    vec2 g_vTexCoord2ScaleByModelOrigin;
	    uint g_tNprOutlineMask;
	    bool g_bUseSecondaryUvForNprOutlineMask;
	    bool g_bOverrideNprOutline;
	    float g_flOverrideNprOutlineThickness;
	    uint g_tColor;
	    uint g_tTintMask;
	    uint g_tNormalRoughness;
	    uint g_tAmbientOcclusion;
	    uint g_tSelfIllumMask;
	    uint g_tAltColor_Reveal;
	    bool g_bOverrideBloomAmount;
	    bool g_bRenderBackfaces;
	    bool g_bUseFrontFaceNormalsForBackFaces;
	    bool g_bUseSecondaryUvForAmbientOcclusion;
	    bool g_bAcceptSsao;
	    bool g_bNoSpecularAtFullRoughness;
	    float g_flGradientFogAmount;
	    float g_flCubmapFogAmount;
	    float g_flVolumeFogAmount;
	    bool g_bCustomHolePunch;
	    float g_flOpacityScale1;
	    float g_flAlphaTestReference1;
	    float g_flAlphaAnglePower1;
	    float _g_fl_AutoPad14_;
	    vec2 g_flAlphaAngleScaleBias1;
	    float g_flGrazingAngleMask;
	    float g_flAlphaBoostStrength;
	    float g_flAlphaBoostDistance;
	    float _g_fl_AutoPad15_;
	    vec3 g_vSelfIllumTint1;
	    float g_flSelfIllumScale1;
	    float g_flSelfIllumAlbedoFactor1;
	    float g_flOverrideBloomAmount1;
	    float _g_fl_AutoPad16_;
	    float _g_fl_AutoPad17_;
	    vec3 g_vSelfIllumFresnelMaskTint1;
	    float _g_fl_AutoPad18_;
	    vec2 g_vSelfIllumFresnelMaskRange1;
	    float g_flSelfIllumFresnelMaskExponent;
	    bool g_bSelfIllum;
	    float g_flAltTextureAmount;
	    float g_flAltTextureRevealSoftness;
	    float g_flVertexAOAmount1;
	    float g_flCloakFactor1;
	    float g_flFullyCloakedRefractFactor1;
	    float _g_fl_AutoPad19_;
	    float _g_fl_AutoPad20_;
	    float _g_fl_AutoPad21_;
	    vec3 g_vAlbedoContrastSaturationBrightness1;
	    float _g_fl_AutoPad22_;
	    vec3 g_vColorTint1;
	    int g_nTextureColorTintMode1;
	    bool g_bMaskColorTint1;
	    bool g_bMaskVertexColorTint1;
	    bool g_bApplyTintToVertexColors;
	    float g_fVertexColorStrength1;
	    vec2 g_vAlbedoTexcoordScale1;
	    float g_flAlbedoTexcoordRotation1;
	    float _g_fl_AutoPad23_;
	    vec2 g_vAlbedoScrollSpeed1;
	    float g_flAlbedoScrollQuantize1;
	    float _g_fl_AutoPad24_;
	    vec2 g_vAlbedoTexcoordOffset1;
	    float _g_fl_AutoPad25_;
	    float _g_fl_AutoPad26_;
	    mat4 g_mTextureColorTint;
	    mat4 g_mAlbedoColorCorrect;
	    float g_flGlassReflectance1;
	    float g_flGradientFogStrength1;
	    float g_flCubemapFogStrength1;
	    float g_flVolumeFogStrength1;
	    vec2 g_vNormalTexcoordScale1;
	    float g_flNormalTexcoordRotation1;
	    float _g_fl_AutoPad27_;
	    vec2 g_vNormalAndRoughnessScrollSpeed1;
	    float g_flNormalAndRoughnessScrollQuantize1;
	    float _g_fl_AutoPad28_;
	    vec2 g_vNormalTexcoordOffset1;
	    vec2 g_vSelfIllumTexcoordScale1;
	    float g_flSelfIllumTexcoordRotation1;
	    float _g_fl_AutoPad29_;
	    vec2 g_vSelfIllumScrollSpeed1;
	    float g_flSelfIllumScrollQuantize1;
	    float _g_fl_AutoPad30_;
	    vec2 g_vSelfIllumTexcoordOffset1;
	    bool g_bUseSecondaryUvForSelfIllum1;
	    float _g_fl_AutoPad31_;
	    vec2 g_vAmbientOcclusionTexcoordScale1;
	    float g_flAmbientOcclusionTexcoordRotation1;
	    float _g_fl_AutoPad32_;
	    vec2 g_vAmbientOcclusionTexcoordOffset1;
	    float g_flUnlitAdditiveScale1;
	    float g_flIsAdditive;
	    float _g_fl_AutoPad33_;
	    float _g_fl_AutoPad34_;
	};
	
	struct MaterialDataMinimal_t
	{
	    f16vec3 vNormalWs;
	    float16_t flMetalness;
	    f16vec3 vAlbedo;
	    float16_t flRoughness;
	    f16vec3 vEmissive;
	    float16_t flReflectance;
	    uint nMaterialTypeAndFlags;
	    f16vec4 vMaterialBits;
	};
	
	struct Payload_t
	{
	    vec3 vSmoothPositionWs;
	    vec3 vFaceNormalWs;
	    vec3 vInterpolatedNormalWs;
	    float flHitT;
	    float flOpacityRng;
	    int nInstance;
	    bool bFlippedNormal;
	    MaterialDataMinimal_t material;
	};
	
	struct VS_INPUT
	{
	    vec3 vPositionOs;
	    vec2 vTexCoord;
	    vec4 vVertexColor;
	    vec3 vNormalOs;
	    vec4 vTangentUOs_flTangentVSign;
	    uvec4 vBlendIndices;
	    uint nInstanceIdx;
	};
	
	struct _Array_natural_vector_int_4_8
	{
	    ivec4 data[8];
	};
	
	struct GeometryInfo_t_natural
	{
	    ivec4 m_nVertexAndIndexBuffers;
	    ivec4 m_nBufferBindOffsetBytes;
	    ivec4 m_nBufferStrideInBytes;
	    ivec4 m_vNormalFieldInfo;
	    ivec4 m_vTangentFieldInfo;
	    _Array_natural_vector_int_4_8 m_vTexCoordFieldInfo;
	    _Array_natural_vector_int_4_8 m_vColorFieldInfo;
	};
	
	struct BuiltInTriangleIntersectionAttributes
	{
	    vec2 barycentrics;
	};
	
	vec2 _743;
	
	struct PayloadShadow_t
	{
	    float m_flVisibility;
	};
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData
	{
	    uint _member0[];
	} g_MaterialData_1;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_2
	{
	    float _member0[];
	} g_MaterialData_3;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_4
	{
	    int _member0[];
	} g_MaterialData_5;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_6
	{
	    int _member0[];
	} g_MaterialData_7;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_Geometries
	{
	    GeometryInfo_t_natural _member0[];
	} g_Geometries_1;
	
	layout(set = 3, binding = 33, std430) readonly buffer g_Indices
	{
	    uint _member0[];
	} g_Indices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices
	{
	    float _member0[];
	} g_Vertices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices_2
	{
	    uint _member0[];
	} g_Vertices_3[];
	
	struct SLANG_ParameterGroup_PerViewConstantBuffer_t_natural
	{
	    mat4 g_matWorldToProjection;
	    mat4 g_matProjectionToWorld;
	    mat4 g_matWorldToView;
	    mat4 g_matViewToProjection;
	    vec4 g_vInvProjLowerRight2x2;
	    vec4 g_vClipPlane0;
	    float g_flToneMapScalarLinear;
	    float g_flInvToneMapScalarLinear;
	    float g_flRealTime;
	    float g_flGameTime;
	    vec2 g_vViewportToGBufferRatio;
	    float g_fInvViewportZRange;
	    float g_fMinViewportZScaled;
	    vec2 g_vViewportOffset;
	    vec2 g_vViewportSize;
	    vec2 g_vInvViewportSize;
	    vec2 g_vRenderTargetSize;
	    vec4 g_vInvGBufferSize;
	    float g_flViewportMinZ;
	    float g_flViewportMaxZ;
	    float g_flNearPlane;
	    float g_flFarPlane;
	    vec4 g_vWorldToCameraOffset;
	    vec4 g_vCameraAngles;
	    vec3 g_vCameraPositionWs;
	    float _PerViewPad0;
	    vec3 g_vCameraUpDirWs;
	    float _PerViewPad1;
	    vec3 g_vCameraDirWs;
	    float g_flInvMSAASampleCount;
	    vec3 g_vDepthPsToVsConversion;
	    int g_nMSAASampleCount;
	    vec2 g_vMorphTextureAtlasSize;
	    uint g_tCompositeMorphAtlasTextureIndex;
	    float _PerViewPad4;
	    vec3 g_vFogColor;
	    float g_flNegFogStartOverFogRange;
	    float g_flInvFogRange;
	    float g_flFogMaxDensity;
	    float g_flFogExponent;
	    float g_flFogBlendToBackground;
	    vec4 g_vFrameBufferCopyInvSizeAndUvScale;
	    vec4 g_vPrevWorldToCameraOffset;
	    mat4 g_matPrevWorldToProjection;
	    vec4 g_vWireframeColor;
	};
	
	layout(set = 5) uniform SLANG_ParameterGroup_PerViewConstantBuffer_t_natural PerViewConstantBuffer_t;
	
	layout(location = 0) rayPayloadInEXT Payload_t payload;
	hitAttributeEXT BuiltInTriangleIntersectionAttributes attrs;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	void main()
	{
	    uint _777 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    _RTX_MATERIAL_DATA_ _2104 = _RTX_MATERIAL_DATA_(g_MaterialData_1._member0[_777 / 4u], g_MaterialData_1._member0[(_777 + 4u) / 4u], g_MaterialData_1._member0[(_777 + 8u) / 4u], g_MaterialData_1._member0[(_777 + 12u) / 4u], g_MaterialData_1._member0[(_777 + 16u) / 4u], g_MaterialData_1._member0[(_777 + 20u) / 4u], g_MaterialData_1._member0[(_777 + 24u) / 4u], g_MaterialData_1._member0[(_777 + 28u) / 4u], g_MaterialData_1._member0[(_777 + 32u) / 4u], g_MaterialData_1._member0[(_777 + 36u) / 4u], g_MaterialData_3._member0[(_777 + 40u) / 4u], g_MaterialData_3._member0[(_777 + 44u) / 4u], vec4(g_MaterialData_3._member0[(_777 + 48u) / 4u], g_MaterialData_3._member0[(_777 + 52u) / 4u], g_MaterialData_3._member0[(_777 + 56u) / 4u], g_MaterialData_3._member0[(_777 + 60u) / 4u]), mat4(vec4(g_MaterialData_3._member0[(_777 + 64u) / 4u], g_MaterialData_3._member0[(_777 + 80u) / 4u], g_MaterialData_3._member0[(_777 + 96u) / 4u], g_MaterialData_3._member0[(_777 + 112u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 68u) / 4u], g_MaterialData_3._member0[(_777 + 84u) / 4u], g_MaterialData_3._member0[(_777 + 100u) / 4u], g_MaterialData_3._member0[(_777 + 116u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 72u) / 4u], g_MaterialData_3._member0[(_777 + 88u) / 4u], g_MaterialData_3._member0[(_777 + 104u) / 4u], g_MaterialData_3._member0[(_777 + 120u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 76u) / 4u], g_MaterialData_3._member0[(_777 + 92u) / 4u], g_MaterialData_3._member0[(_777 + 108u) / 4u], g_MaterialData_3._member0[(_777 + 124u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_777 + 128u) / 4u], g_MaterialData_3._member0[(_777 + 144u) / 4u], g_MaterialData_3._member0[(_777 + 160u) / 4u], g_MaterialData_3._member0[(_777 + 176u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 132u) / 4u], g_MaterialData_3._member0[(_777 + 148u) / 4u], g_MaterialData_3._member0[(_777 + 164u) / 4u], g_MaterialData_3._member0[(_777 + 180u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 136u) / 4u], g_MaterialData_3._member0[(_777 + 152u) / 4u], g_MaterialData_3._member0[(_777 + 168u) / 4u], g_MaterialData_3._member0[(_777 + 184u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 140u) / 4u], g_MaterialData_3._member0[(_777 + 156u) / 4u], g_MaterialData_3._member0[(_777 + 172u) / 4u], g_MaterialData_3._member0[(_777 + 188u) / 4u])), g_MaterialData_5._member0[(_777 + 192u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 196u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 200u) / 4u], g_MaterialData_3._member0[(_777 + 204u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 208u) / 4u], g_MaterialData_3._member0[(_777 + 212u) / 4u], g_MaterialData_3._member0[(_777 + 216u) / 4u]), g_MaterialData_3._member0[(_777 + 220u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 224u) / 4u], g_MaterialData_3._member0[(_777 + 228u) / 4u], g_MaterialData_3._member0[(_777 + 232u) / 4u]), g_MaterialData_3._member0[(_777 + 236u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 240u) / 4u], g_MaterialData_3._member0[(_777 + 244u) / 4u], g_MaterialData_3._member0[(_777 + 248u) / 4u]), g_MaterialData_3._member0[(_777 + 252u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 256u) / 4u], g_MaterialData_3._member0[(_777 + 260u) / 4u], g_MaterialData_3._member0[(_777 + 264u) / 4u]), g_MaterialData_3._member0[(_777 + 268u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 272u) / 4u], g_MaterialData_3._member0[(_777 + 276u) / 4u], g_MaterialData_3._member0[(_777 + 280u) / 4u]), g_MaterialData_3._member0[(_777 + 284u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 288u) / 4u], g_MaterialData_3._member0[(_777 + 292u) / 4u], g_MaterialData_3._member0[(_777 + 296u) / 4u]), g_MaterialData_3._member0[(_777 + 300u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 304u) / 4u], g_MaterialData_3._member0[(_777 + 308u) / 4u], g_MaterialData_3._member0[(_777 + 312u) / 4u]), g_MaterialData_3._member0[(_777 + 316u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 320u) / 4u], g_MaterialData_3._member0[(_777 + 324u) / 4u], g_MaterialData_3._member0[(_777 + 328u) / 4u]), g_MaterialData_3._member0[(_777 + 332u) / 4u], g_MaterialData_3._member0[(_777 + 336u) / 4u], g_MaterialData_3._member0[(_777 + 340u) / 4u], g_MaterialData_3._member0[(_777 + 344u) / 4u], g_MaterialData_3._member0[(_777 + 348u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 352u) / 4u], g_MaterialData_3._member0[(_777 + 356u) / 4u], g_MaterialData_3._member0[(_777 + 360u) / 4u]), g_MaterialData_5._member0[(_777 + 364u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 368u) / 4u] != 0, g_MaterialData_1._member0[(_777 + 372u) / 4u], g_MaterialData_7._member0[(_777 + 376u) / 4u], g_MaterialData_7._member0[(_777 + 380u) / 4u], g_MaterialData_5._member0[(_777 + 384u) / 4u] != 0, g_MaterialData_7._member0[(_777 + 388u) / 4u], g_MaterialData_7._member0[(_777 + 392u) / 4u], g_MaterialData_3._member0[(_777 + 396u) / 4u], vec4(g_MaterialData_3._member0[(_777 + 400u) / 4u], g_MaterialData_3._member0[(_777 + 404u) / 4u], g_MaterialData_3._member0[(_777 + 408u) / 4u], g_MaterialData_3._member0[(_777 + 412u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 416u) / 4u], g_MaterialData_3._member0[(_777 + 420u) / 4u], g_MaterialData_3._member0[(_777 + 424u) / 4u], g_MaterialData_3._member0[(_777 + 428u) / 4u]), vec2(g_MaterialData_3._member0[(_777 + 432u) / 4u], g_MaterialData_3._member0[(_777 + 436u) / 4u]), g_MaterialData_7._member0[(_777 + 440u) / 4u], g_MaterialData_7._member0[(_777 + 444u) / 4u], g_MaterialData_7._member0[(_777 + 448u) / 4u], g_MaterialData_7._member0[(_777 + 452u) / 4u], g_MaterialData_5._member0[(_777 + 456u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 460u) / 4u], vec4(g_MaterialData_3._member0[(_777 + 464u) / 4u], g_MaterialData_3._member0[(_777 + 468u) / 4u], g_MaterialData_3._member0[(_777 + 472u) / 4u], g_MaterialData_3._member0[(_777 + 476u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 480u) / 4u], g_MaterialData_3._member0[(_777 + 484u) / 4u], g_MaterialData_3._member0[(_777 + 488u) / 4u], g_MaterialData_3._member0[(_777 + 492u) / 4u]), vec2(g_MaterialData_3._member0[(_777 + 496u) / 4u], g_MaterialData_3._member0[(_777 + 500u) / 4u]), g_MaterialData_1._member0[(_777 + 504u) / 4u], g_MaterialData_5._member0[(_777 + 508u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 512u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 516u) / 4u], g_MaterialData_1._member0[(_777 + 520u) / 4u], g_MaterialData_1._member0[(_777 + 524u) / 4u], g_MaterialData_1._member0[(_777 + 528u) / 4u], g_MaterialData_1._member0[(_777 + 532u) / 4u], g_MaterialData_1._member0[(_777 + 536u) / 4u], g_MaterialData_1._member0[(_777 + 540u) / 4u], g_MaterialData_5._member0[(_777 + 544u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 548u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 552u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 556u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 560u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 564u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 568u) / 4u], g_MaterialData_3._member0[(_777 + 572u) / 4u], g_MaterialData_3._member0[(_777 + 576u) / 4u], g_MaterialData_5._member0[(_777 + 580u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 584u) / 4u], g_MaterialData_3._member0[(_777 + 588u) / 4u], g_MaterialData_3._member0[(_777 + 592u) / 4u], g_MaterialData_3._member0[(_777 + 596u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 600u) / 4u], g_MaterialData_3._member0[(_777 + 604u) / 4u]), g_MaterialData_3._member0[(_777 + 608u) / 4u], g_MaterialData_3._member0[(_777 + 612u) / 4u], g_MaterialData_3._member0[(_777 + 616u) / 4u], g_MaterialData_3._member0[(_777 + 620u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 624u) / 4u], g_MaterialData_3._member0[(_777 + 628u) / 4u], g_MaterialData_3._member0[(_777 + 632u) / 4u]), g_MaterialData_3._member0[(_777 + 636u) / 4u], g_MaterialData_3._member0[(_777 + 640u) / 4u], g_MaterialData_3._member0[(_777 + 644u) / 4u], g_MaterialData_3._member0[(_777 + 648u) / 4u], g_MaterialData_3._member0[(_777 + 652u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 656u) / 4u], g_MaterialData_3._member0[(_777 + 660u) / 4u], g_MaterialData_3._member0[(_777 + 664u) / 4u]), g_MaterialData_3._member0[(_777 + 668u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 672u) / 4u], g_MaterialData_3._member0[(_777 + 676u) / 4u]), g_MaterialData_3._member0[(_777 + 680u) / 4u], g_MaterialData_5._member0[(_777 + 684u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 688u) / 4u], g_MaterialData_3._member0[(_777 + 692u) / 4u], g_MaterialData_3._member0[(_777 + 696u) / 4u], g_MaterialData_3._member0[(_777 + 700u) / 4u], g_MaterialData_3._member0[(_777 + 704u) / 4u], g_MaterialData_3._member0[(_777 + 708u) / 4u], g_MaterialData_3._member0[(_777 + 712u) / 4u], g_MaterialData_3._member0[(_777 + 716u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 720u) / 4u], g_MaterialData_3._member0[(_777 + 724u) / 4u], g_MaterialData_3._member0[(_777 + 728u) / 4u]), g_MaterialData_3._member0[(_777 + 732u) / 4u], vec3(g_MaterialData_3._member0[(_777 + 736u) / 4u], g_MaterialData_3._member0[(_777 + 740u) / 4u], g_MaterialData_3._member0[(_777 + 744u) / 4u]), g_MaterialData_7._member0[(_777 + 748u) / 4u], g_MaterialData_5._member0[(_777 + 752u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 756u) / 4u] != 0, g_MaterialData_5._member0[(_777 + 760u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 764u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 768u) / 4u], g_MaterialData_3._member0[(_777 + 772u) / 4u]), g_MaterialData_3._member0[(_777 + 776u) / 4u], g_MaterialData_3._member0[(_777 + 780u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 784u) / 4u], g_MaterialData_3._member0[(_777 + 788u) / 4u]), g_MaterialData_3._member0[(_777 + 792u) / 4u], g_MaterialData_3._member0[(_777 + 796u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 800u) / 4u], g_MaterialData_3._member0[(_777 + 804u) / 4u]), g_MaterialData_3._member0[(_777 + 808u) / 4u], g_MaterialData_3._member0[(_777 + 812u) / 4u], mat4(vec4(g_MaterialData_3._member0[(_777 + 816u) / 4u], g_MaterialData_3._member0[(_777 + 832u) / 4u], g_MaterialData_3._member0[(_777 + 848u) / 4u], g_MaterialData_3._member0[(_777 + 864u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 820u) / 4u], g_MaterialData_3._member0[(_777 + 836u) / 4u], g_MaterialData_3._member0[(_777 + 852u) / 4u], g_MaterialData_3._member0[(_777 + 868u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 824u) / 4u], g_MaterialData_3._member0[(_777 + 840u) / 4u], g_MaterialData_3._member0[(_777 + 856u) / 4u], g_MaterialData_3._member0[(_777 + 872u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 828u) / 4u], g_MaterialData_3._member0[(_777 + 844u) / 4u], g_MaterialData_3._member0[(_777 + 860u) / 4u], g_MaterialData_3._member0[(_777 + 876u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_777 + 880u) / 4u], g_MaterialData_3._member0[(_777 + 896u) / 4u], g_MaterialData_3._member0[(_777 + 912u) / 4u], g_MaterialData_3._member0[(_777 + 928u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 884u) / 4u], g_MaterialData_3._member0[(_777 + 900u) / 4u], g_MaterialData_3._member0[(_777 + 916u) / 4u], g_MaterialData_3._member0[(_777 + 932u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 888u) / 4u], g_MaterialData_3._member0[(_777 + 904u) / 4u], g_MaterialData_3._member0[(_777 + 920u) / 4u], g_MaterialData_3._member0[(_777 + 936u) / 4u]), vec4(g_MaterialData_3._member0[(_777 + 892u) / 4u], g_MaterialData_3._member0[(_777 + 908u) / 4u], g_MaterialData_3._member0[(_777 + 924u) / 4u], g_MaterialData_3._member0[(_777 + 940u) / 4u])), g_MaterialData_3._member0[(_777 + 944u) / 4u], g_MaterialData_3._member0[(_777 + 948u) / 4u], g_MaterialData_3._member0[(_777 + 952u) / 4u], g_MaterialData_3._member0[(_777 + 956u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 960u) / 4u], g_MaterialData_3._member0[(_777 + 964u) / 4u]), g_MaterialData_3._member0[(_777 + 968u) / 4u], g_MaterialData_3._member0[(_777 + 972u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 976u) / 4u], g_MaterialData_3._member0[(_777 + 980u) / 4u]), g_MaterialData_3._member0[(_777 + 984u) / 4u], g_MaterialData_3._member0[(_777 + 988u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 992u) / 4u], g_MaterialData_3._member0[(_777 + 996u) / 4u]), vec2(g_MaterialData_3._member0[(_777 + 1000u) / 4u], g_MaterialData_3._member0[(_777 + 1004u) / 4u]), g_MaterialData_3._member0[(_777 + 1008u) / 4u], g_MaterialData_3._member0[(_777 + 1012u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 1016u) / 4u], g_MaterialData_3._member0[(_777 + 1020u) / 4u]), g_MaterialData_3._member0[(_777 + 1024u) / 4u], g_MaterialData_3._member0[(_777 + 1028u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 1032u) / 4u], g_MaterialData_3._member0[(_777 + 1036u) / 4u]), g_MaterialData_5._member0[(_777 + 1040u) / 4u] != 0, g_MaterialData_3._member0[(_777 + 1044u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 1048u) / 4u], g_MaterialData_3._member0[(_777 + 1052u) / 4u]), g_MaterialData_3._member0[(_777 + 1056u) / 4u], g_MaterialData_3._member0[(_777 + 1060u) / 4u], vec2(g_MaterialData_3._member0[(_777 + 1064u) / 4u], g_MaterialData_3._member0[(_777 + 1068u) / 4u]), g_MaterialData_3._member0[(_777 + 1072u) / 4u], g_MaterialData_3._member0[(_777 + 1076u) / 4u], g_MaterialData_3._member0[(_777 + 1080u) / 4u], g_MaterialData_3._member0[(_777 + 1084u) / 4u]);
	    _RTX_MATERIAL_DATA_ _g_rtx_material_data_ = _2104;
	    uint _778 = g_instanceBuffer._member0[uint(payload.nInstance)].nMaterialFlags_nInstanceFlags;
	    bool _766;
	    vec3 _767;
	    vec3 _768;
	    vec3 _769;
	    vec3 _770;
	    float _771;
	    vec3 _772;
	    vec2 _773;
	    float _774;
	    float _775;
	    vec3 _776;
	    SPIRV_CROSS_BRANCH
	    if (!((int((_778 >> uint(16)) & 65535u) & 4) != 0))
	    {
	        uvec3 _926;
	        do
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	            {
	                uint _2165 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	                _926 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_2165 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_2165 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_2165 + 8u) / 4u]);
	                break;
	            }
	            else
	            {
	                uint _2144 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	                uint _2145 = _2144 & 4294967292u;
	                uint _58 = _2145 / 4u;
	                uint _61 = (_2145 + 4u) / 4u;
	                uint _2149 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_58] & 4294901760u) >> uint(16);
	                uint _2150 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_61] & 65535u;
	                uvec3 _927;
	                if (_2144 == _2145)
	                {
	                    _927 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_58] & 65535u, _2149, _2150);
	                }
	                else
	                {
	                    _927 = uvec3(_2149, _2150, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_61] & 4294901760u) >> uint(16));
	                }
	                _926 = _927;
	                break;
	            }
	            break;
	        } while(false);
	        uint _74 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	        uvec3 _2186 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _926) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	        vec3 _928[3];
	        uint _2188 = _2186.x;
	        _928[0] = vec3(g_Vertices_1[nonuniformEXT(_74)]._member0[_2188 / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2188 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2188 + 8u) / 4u]);
	        uint _2193 = _2186.y;
	        _928[1] = vec3(g_Vertices_1[nonuniformEXT(_74)]._member0[_2193 / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2193 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2193 + 8u) / 4u]);
	        uint _2198 = _2186.z;
	        _928[2] = vec3(g_Vertices_1[nonuniformEXT(_74)]._member0[_2198 / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2198 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_74)]._member0[(_2198 + 8u) / 4u]);
	        int _929 = 0;
	        VS_INPUT _935[3];
	        for (;;)
	        {
	            if (!(_929 < 3))
	            {
	                break;
	            }
	            _935[_929].vPositionOs = _928[_929];
	            _929++;
	            continue;
	        }
	        vec2 _930[3];
	        _930[0] = vec2(0.0);
	        _930[1] = vec2(0.0);
	        _930[2] = vec2(0.0);
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	        {
	            ivec4 _925 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _103 = uint(_925[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	            uint _2240 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	            ivec4 _923 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _924 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _2256 = (uvec3(uint(_923[_2240])) * _926) + uvec3(uint(_924[_2240]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	            {
	                uint _2370 = _2256.x;
	                _930[0] = vec2(g_Vertices_1[nonuniformEXT(_103)]._member0[_2370 / 4u], g_Vertices_1[nonuniformEXT(_103)]._member0[(_2370 + 4u) / 4u]);
	                uint _2373 = _2256.y;
	                _930[1] = vec2(g_Vertices_1[nonuniformEXT(_103)]._member0[_2373 / 4u], g_Vertices_1[nonuniformEXT(_103)]._member0[(_2373 + 4u) / 4u]);
	                uint _2376 = _2256.z;
	                _930[2] = vec2(g_Vertices_1[nonuniformEXT(_103)]._member0[_2376 / 4u], g_Vertices_1[nonuniformEXT(_103)]._member0[(_2376 + 4u) / 4u]);
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	                {
	                    uint _115 = _2256.x / 4u;
	                    _930[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_103)]._member0[_115], g_Vertices_3[nonuniformEXT(_103)]._member0[_115] >> uint(16)) & uvec2(65535u))));
	                    uint _118 = _2256.y / 4u;
	                    _930[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_103)]._member0[_118], g_Vertices_3[nonuniformEXT(_103)]._member0[_118] >> uint(16)) & uvec2(65535u))));
	                    uint _121 = _2256.z / 4u;
	                    _930[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_103)]._member0[_121], g_Vertices_3[nonuniformEXT(_103)]._member0[_121] >> uint(16)) & uvec2(65535u))));
	                }
	                else
	                {
	                    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                    {
	                        uint _105 = _2256.x / 4u;
	                        uint _2269 = g_Vertices_3[nonuniformEXT(_103)]._member0[_105] & 65535u;
	                        int _922;
	                        if (_2269 > 32767u)
	                        {
	                            _922 = int(4294901760u | _2269);
	                        }
	                        else
	                        {
	                            _922 = int(_2269);
	                        }
	                        uint _2282 = (g_Vertices_3[nonuniformEXT(_103)]._member0[_105] & 4294901760u) >> uint(16);
	                        int _921;
	                        if (_2282 > 32767u)
	                        {
	                            _921 = int(4294901760u | _2282);
	                        }
	                        else
	                        {
	                            _921 = int(_2282);
	                        }
	                        _930[0] = vec2(max(float(_922) * 3.0518509447574615478515625e-05, -1.0), max(float(_921) * 3.0518509447574615478515625e-05, -1.0));
	                        uint _108 = _2256.y / 4u;
	                        uint _2296 = g_Vertices_3[nonuniformEXT(_103)]._member0[_108] & 65535u;
	                        int _920;
	                        if (_2296 > 32767u)
	                        {
	                            _920 = int(4294901760u | _2296);
	                        }
	                        else
	                        {
	                            _920 = int(_2296);
	                        }
	                        uint _2309 = (g_Vertices_3[nonuniformEXT(_103)]._member0[_108] & 4294901760u) >> uint(16);
	                        int _919;
	                        if (_2309 > 32767u)
	                        {
	                            _919 = int(4294901760u | _2309);
	                        }
	                        else
	                        {
	                            _919 = int(_2309);
	                        }
	                        _930[1] = vec2(max(float(_920) * 3.0518509447574615478515625e-05, -1.0), max(float(_919) * 3.0518509447574615478515625e-05, -1.0));
	                        uint _111 = _2256.z / 4u;
	                        uint _2323 = g_Vertices_3[nonuniformEXT(_103)]._member0[_111] & 65535u;
	                        int _918;
	                        if (_2323 > 32767u)
	                        {
	                            _918 = int(4294901760u | _2323);
	                        }
	                        else
	                        {
	                            _918 = int(_2323);
	                        }
	                        uint _2336 = (g_Vertices_3[nonuniformEXT(_103)]._member0[_111] & 4294901760u) >> uint(16);
	                        int _917;
	                        if (_2336 > 32767u)
	                        {
	                            _917 = int(4294901760u | _2336);
	                        }
	                        else
	                        {
	                            _917 = int(_2336);
	                        }
	                        _930[2] = vec2(max(float(_918) * 3.0518509447574615478515625e-05, -1.0), max(float(_917) * 3.0518509447574615478515625e-05, -1.0));
	                    }
	                }
	            }
	        }
	        _929 = 0;
	        for (;;)
	        {
	            if (!(_929 < 3))
	            {
	                break;
	            }
	            _935[_929].vTexCoord = _930[_929];
	            _929++;
	            continue;
	        }
	        vec3 _931[3];
	        vec4 _932[3];
	        do
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	            {
	                ivec4 _903 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	                uint _143 = uint(_903[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	                uint _2420 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	                ivec4 _901 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	                ivec4 _902 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	                uvec3 _2436 = (uvec3(uint(_901[_2420])) * _926) + uvec3(uint(_902[_2420]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	                {
	                    uint _2937 = _2436.x;
	                    _931[0] = vec3(g_Vertices_1[nonuniformEXT(_143)]._member0[_2937 / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2937 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2937 + 8u) / 4u]);
	                    uint _2942 = _2436.y;
	                    _931[1] = vec3(g_Vertices_1[nonuniformEXT(_143)]._member0[_2942 / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2942 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2942 + 8u) / 4u]);
	                    uint _2947 = _2436.z;
	                    _931[2] = vec3(g_Vertices_1[nonuniformEXT(_143)]._member0[_2947 / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2947 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_143)]._member0[(_2947 + 8u) / 4u]);
	                }
	                else
	                {
	                    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	                    {
	                        uint _2691 = _2436.x;
	                        uvec2 _2693 = uvec2(g_Vertices_3[nonuniformEXT(_143)]._member0[_2691 / 4u], g_Vertices_3[nonuniformEXT(_143)]._member0[(_2691 + 4u) / 4u]);
	                        uint _2694 = _2436.y;
	                        uvec2 _761 = uvec2(g_Vertices_3[nonuniformEXT(_143)]._member0[_2694 / 4u], g_Vertices_3[nonuniformEXT(_143)]._member0[(_2694 + 4u) / 4u]);
	                        uint _2697 = _2436.z;
	                        uvec2 _760 = uvec2(g_Vertices_3[nonuniformEXT(_143)]._member0[_2697 / 4u], g_Vertices_3[nonuniformEXT(_143)]._member0[(_2697 + 4u) / 4u]);
	                        uint _2703 = _2693.x;
	                        uint _2711 = _2693.y;
	                        vec2 _2721 = ((vec2(float(_2703 & 65535u), float((_2703 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                        float _2722 = _2721.x;
	                        float _2727 = (1.0 - abs(_2722)) - abs(_2721.y);
	                        vec3 _2728 = vec3(_2722, _2721.y, _2727);
	                        float _2730 = saturate(-_2727);
	                        vec2 _2736 = _2721 + mix(vec2(_2730), vec2(-_2730), greaterThanEqual(_2721, vec2(0.0)));
	                        _2728.x = _2736.x;
	                        _2728.y = _2736.y;
	                        vec3 _905 = normalize(_2728);
	                        vec2 _2743 = ((vec2(float((_2711 >> uint(1)) & 32767u), float((_2711 >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                        float _2744 = _2743.x;
	                        float _2749 = (1.0 - abs(_2744)) - abs(_2743.y);
	                        vec3 _2750 = vec3(_2744, _2743.y, _2749);
	                        float _2752 = saturate(-_2749);
	                        vec2 _2758 = _2743 + mix(vec2(_2752), vec2(-_2752), greaterThanEqual(_2743, vec2(0.0)));
	                        _2750.x = _2758.x;
	                        _2750.y = _2758.y;
	                        vec3 _904 = normalize(_2750);
	                        float _891;
	                        if ((_2711 & 1u) != 0u)
	                        {
	                            _891 = 1.0;
	                        }
	                        else
	                        {
	                            _891 = -1.0;
	                        }
	                        _931[0] = _905;
	                        _932[0].w = _891;
	                        _932[0].x = _904.x;
	                        _932[0].y = _904.y;
	                        _932[0].z = _904.z;
	                        vec2 _2800 = ((vec2(float(_761.x & 65535u), float((_761.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                        float _2801 = _2800.x;
	                        float _2806 = (1.0 - abs(_2801)) - abs(_2800.y);
	                        vec3 _2807 = vec3(_2801, _2800.y, _2806);
	                        float _2809 = saturate(-_2806);
	                        vec2 _2815 = _2800 + mix(vec2(_2809), vec2(-_2809), greaterThanEqual(_2800, vec2(0.0)));
	                        _2807.x = _2815.x;
	                        _2807.y = _2815.y;
	                        vec3 _907 = normalize(_2807);
	                        vec2 _2822 = ((vec2(float((_761.y >> uint(1)) & 32767u), float((_761.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                        float _2823 = _2822.x;
	                        float _2828 = (1.0 - abs(_2823)) - abs(_2822.y);
	                        vec3 _2829 = vec3(_2823, _2822.y, _2828);
	                        float _2831 = saturate(-_2828);
	                        vec2 _2837 = _2822 + mix(vec2(_2831), vec2(-_2831), greaterThanEqual(_2822, vec2(0.0)));
	                        _2829.x = _2837.x;
	                        _2829.y = _2837.y;
	                        vec3 _906 = normalize(_2829);
	                        float _890;
	                        if ((_761.y & 1u) != 0u)
	                        {
	                            _890 = 1.0;
	                        }
	                        else
	                        {
	                            _890 = -1.0;
	                        }
	                        _931[1] = _907;
	                        _932[1].w = _890;
	                        _932[1].x = _906.x;
	                        _932[1].y = _906.y;
	                        _932[1].z = _906.z;
	                        vec2 _2879 = ((vec2(float(_760.x & 65535u), float((_760.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                        float _2880 = _2879.x;
	                        float _2885 = (1.0 - abs(_2880)) - abs(_2879.y);
	                        vec3 _2886 = vec3(_2880, _2879.y, _2885);
	                        float _2888 = saturate(-_2885);
	                        vec2 _2894 = _2879 + mix(vec2(_2888), vec2(-_2888), greaterThanEqual(_2879, vec2(0.0)));
	                        _2886.x = _2894.x;
	                        _2886.y = _2894.y;
	                        vec3 _909 = normalize(_2886);
	                        vec2 _2901 = ((vec2(float((_760.y >> uint(1)) & 32767u), float((_760.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                        float _2902 = _2901.x;
	                        float _2907 = (1.0 - abs(_2902)) - abs(_2901.y);
	                        vec3 _2908 = vec3(_2902, _2901.y, _2907);
	                        float _2910 = saturate(-_2907);
	                        vec2 _2916 = _2901 + mix(vec2(_2910), vec2(-_2910), greaterThanEqual(_2901, vec2(0.0)));
	                        _2908.x = _2916.x;
	                        _2908.y = _2916.y;
	                        vec3 _908 = normalize(_2908);
	                        float _889;
	                        if ((_760.y & 1u) != 0u)
	                        {
	                            _889 = 1.0;
	                        }
	                        else
	                        {
	                            _889 = -1.0;
	                        }
	                        _931[2] = _909;
	                        _932[2].w = _889;
	                        _932[2].x = _908.x;
	                        _932[2].y = _908.y;
	                        _932[2].z = _908.z;
	                        break;
	                    }
	                    else
	                    {
	                        uint _145 = _2436.x / 4u;
	                        vec4 _911 = _932[0];
	                        float _2458 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_145] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2461 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_145] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2465 = (1.0 - abs(_2458)) - abs(_2461);
	                        vec3 _2466 = vec3(_2458, _2461, _2465);
	                        float _2468 = saturate(-_2465);
	                        vec2 _2469 = vec2(_2458, _2461);
	                        vec2 _2475 = _2469 + mix(vec2(_2468), vec2(-_2468), greaterThanEqual(_2469, vec2(0.0)));
	                        _2466.x = _2475.x;
	                        _2466.y = _2475.y;
	                        vec3 _2480 = normalize(_2466);
	                        vec3 _910 = _2480;
	                        float _2481 = _2480.z;
	                        float _898;
	                        if (_2481 >= 0.0)
	                        {
	                            _898 = 1.0;
	                        }
	                        else
	                        {
	                            _898 = -1.0;
	                        }
	                        float _2488 = (-1.0) / (_898 + _2481);
	                        float _2489 = _2480.x;
	                        vec3 _899;
	                        vec3 _2497 = _899;
	                        _2497.x = 1.0 + (((_898 * _2489) * _2489) * _2488);
	                        _2497.y = _898 * ((_2489 * _2480.y) * _2488);
	                        _2497.z = (-_898) * _2489;
	                        _899 = _2497;
	                        float _2505 = float((g_Vertices_3[nonuniformEXT(_143)]._member0[_145] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                        vec3 _2511 = (_2497 * cos(_2505)) + (cross(_2480, _2497) * sin(_2505));
	                        vec4 _2513 = _911;
	                        _2513.x = _2511.x;
	                        _2513.y = _2511.y;
	                        _2513.z = _2511.z;
	                        _911 = _2513;
	                        float _900;
	                        if ((g_Vertices_3[nonuniformEXT(_143)]._member0[_145] & 1u) == 0u)
	                        {
	                            _900 = -1.0;
	                        }
	                        else
	                        {
	                            _900 = 1.0;
	                        }
	                        vec4 _2524 = _911;
	                        _2524.w = _900;
	                        _911 = _2524;
	                        _931[0] = _910;
	                        _932[0] = _2524;
	                        uint _148 = _2436.y / 4u;
	                        vec4 _913 = _932[1];
	                        float _2540 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_148] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2543 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_148] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2547 = (1.0 - abs(_2540)) - abs(_2543);
	                        vec3 _2548 = vec3(_2540, _2543, _2547);
	                        float _2550 = saturate(-_2547);
	                        vec2 _2551 = vec2(_2540, _2543);
	                        vec2 _2557 = _2551 + mix(vec2(_2550), vec2(-_2550), greaterThanEqual(_2551, vec2(0.0)));
	                        _2548.x = _2557.x;
	                        _2548.y = _2557.y;
	                        vec3 _2562 = normalize(_2548);
	                        vec3 _912 = _2562;
	                        float _2563 = _2562.z;
	                        float _895;
	                        if (_2563 >= 0.0)
	                        {
	                            _895 = 1.0;
	                        }
	                        else
	                        {
	                            _895 = -1.0;
	                        }
	                        float _2570 = (-1.0) / (_895 + _2563);
	                        float _2571 = _2562.x;
	                        vec3 _896;
	                        vec3 _2579 = _896;
	                        _2579.x = 1.0 + (((_895 * _2571) * _2571) * _2570);
	                        _2579.y = _895 * ((_2571 * _2562.y) * _2570);
	                        _2579.z = (-_895) * _2571;
	                        _896 = _2579;
	                        float _2587 = float((g_Vertices_3[nonuniformEXT(_143)]._member0[_148] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                        vec3 _2593 = (_2579 * cos(_2587)) + (cross(_2562, _2579) * sin(_2587));
	                        vec4 _2595 = _913;
	                        _2595.x = _2593.x;
	                        _2595.y = _2593.y;
	                        _2595.z = _2593.z;
	                        _913 = _2595;
	                        float _897;
	                        if ((g_Vertices_3[nonuniformEXT(_143)]._member0[_148] & 1u) == 0u)
	                        {
	                            _897 = -1.0;
	                        }
	                        else
	                        {
	                            _897 = 1.0;
	                        }
	                        vec4 _2606 = _913;
	                        _2606.w = _897;
	                        _913 = _2606;
	                        _931[1] = _912;
	                        _932[1] = _2606;
	                        uint _151 = _2436.z / 4u;
	                        vec4 _915 = _932[2];
	                        float _2622 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_151] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2625 = (float((g_Vertices_3[nonuniformEXT(_143)]._member0[_151] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                        float _2629 = (1.0 - abs(_2622)) - abs(_2625);
	                        vec3 _2630 = vec3(_2622, _2625, _2629);
	                        float _2632 = saturate(-_2629);
	                        vec2 _2633 = vec2(_2622, _2625);
	                        vec2 _2639 = _2633 + mix(vec2(_2632), vec2(-_2632), greaterThanEqual(_2633, vec2(0.0)));
	                        _2630.x = _2639.x;
	                        _2630.y = _2639.y;
	                        vec3 _2644 = normalize(_2630);
	                        vec3 _914 = _2644;
	                        float _2645 = _2644.z;
	                        float _892;
	                        if (_2645 >= 0.0)
	                        {
	                            _892 = 1.0;
	                        }
	                        else
	                        {
	                            _892 = -1.0;
	                        }
	                        float _2652 = (-1.0) / (_892 + _2645);
	                        float _2653 = _2644.x;
	                        vec3 _893;
	                        vec3 _2661 = _893;
	                        _2661.x = 1.0 + (((_892 * _2653) * _2653) * _2652);
	                        _2661.y = _892 * ((_2653 * _2644.y) * _2652);
	                        _2661.z = (-_892) * _2653;
	                        _893 = _2661;
	                        float _2669 = float((g_Vertices_3[nonuniformEXT(_143)]._member0[_151] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                        vec3 _2675 = (_2661 * cos(_2669)) + (cross(_2644, _2661) * sin(_2669));
	                        vec4 _2677 = _915;
	                        _2677.x = _2675.x;
	                        _2677.y = _2675.y;
	                        _2677.z = _2675.z;
	                        _915 = _2677;
	                        float _894;
	                        if ((g_Vertices_3[nonuniformEXT(_143)]._member0[_151] & 1u) == 0u)
	                        {
	                            _894 = -1.0;
	                        }
	                        else
	                        {
	                            _894 = 1.0;
	                        }
	                        vec4 _2688 = _915;
	                        _2688.w = _894;
	                        _915 = _2688;
	                        _931[2] = _914;
	                        _932[2] = _2688;
	                        break;
	                    }
	                    break;
	                }
	            }
	            else
	            {
	                _931[0] = vec3(0.0);
	                _931[1] = vec3(0.0);
	                _931[2] = vec3(0.0);
	            }
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.y != 0)
	            {
	                ivec4 _916 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	                uint _201 = uint(_916[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z]);
	                uint _2966 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z);
	                ivec4 _887 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	                ivec4 _888 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	                uvec3 _2982 = (uvec3(uint(_887[_2966])) * _926) + uvec3(uint(_888[_2966]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.x));
	                uint _2984 = _2982.x;
	                _932[0] = vec4(g_Vertices_1[nonuniformEXT(_201)]._member0[_2984 / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2984 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2984 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2984 + 12u) / 4u]);
	                uint _2990 = _2982.y;
	                _932[1] = vec4(g_Vertices_1[nonuniformEXT(_201)]._member0[_2990 / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2990 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2990 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2990 + 12u) / 4u]);
	                uint _2996 = _2982.z;
	                _932[2] = vec4(g_Vertices_1[nonuniformEXT(_201)]._member0[_2996 / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2996 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2996 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_201)]._member0[(_2996 + 12u) / 4u]);
	            }
	            else
	            {
	                _932[0] = vec4(0.0);
	                _932[1] = vec4(0.0);
	                _932[2] = vec4(0.0);
	            }
	            break;
	        } while(false);
	        _929 = 0;
	        for (;;)
	        {
	            if (!(_929 < 3))
	            {
	                break;
	            }
	            _935[_929].vNormalOs = _931[_929];
	            _935[_929].vTangentUOs_flTangentVSign = _932[_929];
	            _929++;
	            continue;
	        }
	        bool _933;
	        if (_g_rtx_material_data_.g_bPaintVertexColors)
	        {
	            _933 = true;
	        }
	        else
	        {
	            _933 = _g_rtx_material_data_.g_bVertexColor;
	        }
	        if (_933)
	        {
	            vec4 _934[3];
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y != 0)
	            {
	                ivec4 _886 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	                uint _239 = uint(_886[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z]);
	                uint _3053 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z);
	                ivec4 _884 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	                ivec4 _885 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	                uvec3 _3069 = (uvec3(uint(_884[_3053])) * _926) + uvec3(uint(_885[_3053]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].x));
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y == 2)
	                {
	                    uint _3111 = _3069.x;
	                    _934[0] = vec4(g_Vertices_1[nonuniformEXT(_239)]._member0[_3111 / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3111 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3111 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3111 + 12u) / 4u]);
	                    uint _3117 = _3069.y;
	                    _934[1] = vec4(g_Vertices_1[nonuniformEXT(_239)]._member0[_3117 / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3117 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3117 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3117 + 12u) / 4u]);
	                    uint _3123 = _3069.z;
	                    _934[2] = vec4(g_Vertices_1[nonuniformEXT(_239)]._member0[_3123 / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3123 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3123 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_239)]._member0[(_3123 + 12u) / 4u]);
	                }
	                else
	                {
	                    uint _241 = _3069.x / 4u;
	                    _934[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_239)]._member0[_241] & 255u, (g_Vertices_3[nonuniformEXT(_239)]._member0[_241] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_239)]._member0[_241] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_239)]._member0[_241] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	                    uint _244 = _3069.y / 4u;
	                    _934[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_239)]._member0[_244] & 255u, (g_Vertices_3[nonuniformEXT(_239)]._member0[_244] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_239)]._member0[_244] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_239)]._member0[_244] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	                    uint _247 = _3069.z / 4u;
	                    _934[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_239)]._member0[_247] & 255u, (g_Vertices_3[nonuniformEXT(_239)]._member0[_247] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_239)]._member0[_247] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_239)]._member0[_247] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	                }
	            }
	            else
	            {
	                _934[0] = vec4(0.0);
	                _934[1] = vec4(0.0);
	                _934[2] = vec4(0.0);
	            }
	            _929 = 0;
	            for (;;)
	            {
	                if (!(_929 < 3))
	                {
	                    break;
	                }
	                _935[_929].vVertexColor = _934[_929];
	                _929++;
	                continue;
	            }
	        }
	        vec3 _808 = _935[0].vPositionOs;
	        vec2 _807 = _935[0].vTexCoord;
	        vec4 _806 = _935[0].vVertexColor;
	        vec3 _805 = _935[0].vNormalOs;
	        vec4 _804 = _935[0].vTangentUOs_flTangentVSign;
	        vec3 _811 = vec3(0.0);
	        vec4 _810 = vec4(0.0);
	        vec4 _809 = vec4(0.0);
	        mat3x4 _3155 = transpose(gl_ObjectToWorldEXT);
	        mat3x4 _3157 = transpose(gl_WorldToObjectEXT);
	        mat3 _881;
	        mat3 _3160 = _881;
	        _3160[0] = _3157[0].xyz;
	        _3160[1] = _3157[1].xyz;
	        _3160[2] = _3157[2].xyz;
	        _881 = _3160;
	        mat3 _3168 = transpose(_3160);
	        vec4 _3182 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        vec4 _880 = _3182;
	        vec3 _3183 = _3182.xyz;
	        vec3 _3184 = _3183 * vec3(0.077399380505084991455078125);
	        vec3 _3187 = pow((_3183 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	        float _877;
	        if (_3182.x <= 0.040449999272823333740234375)
	        {
	            _877 = _3184.x;
	        }
	        else
	        {
	            _877 = _3187.x;
	        }
	        float _878;
	        if (_3182.y <= 0.040449999272823333740234375)
	        {
	            _878 = _3184.y;
	        }
	        else
	        {
	            _878 = _3187.y;
	        }
	        float _879;
	        if (_3182.z <= 0.040449999272823333740234375)
	        {
	            _879 = _3184.z;
	        }
	        else
	        {
	            _879 = _3187.z;
	        }
	        vec3 _3212 = vec3(_877, _878, _879);
	        vec4 _3214 = _880;
	        _3214.x = _3212.x;
	        _3214.y = _3212.y;
	        _3214.z = _3212.z;
	        _880 = _3214;
	        vec4 _3221 = _810;
	        _3221.x = _3214.x;
	        _3221.y = _3214.y;
	        _3221.z = _3214.z;
	        _3221.w = _3214.w;
	        _810 = _3221;
	        bool _882;
	        if (_g_rtx_material_data_.g_bPaintVertexColors)
	        {
	            _882 = true;
	        }
	        else
	        {
	            _882 = _g_rtx_material_data_.g_bVertexColor;
	        }
	        if (_882)
	        {
	            vec3 _3243 = _806.xyz * vec3(0.077399380505084991455078125);
	            vec3 _3246 = pow((_806.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	            float _874;
	            if (_806.x <= 0.040449999272823333740234375)
	            {
	                _874 = _3243.x;
	            }
	            else
	            {
	                _874 = _3246.x;
	            }
	            float _875;
	            if (_806.y <= 0.040449999272823333740234375)
	            {
	                _875 = _3243.y;
	            }
	            else
	            {
	                _875 = _3246.y;
	            }
	            float _876;
	            if (_806.z <= 0.040449999272823333740234375)
	            {
	                _876 = _3243.z;
	            }
	            else
	            {
	                _876 = _3246.z;
	            }
	            vec3 _3272 = _810.xyz * vec3(_874, _875, _876);
	            vec4 _3274 = _810;
	            _3274.x = _3272.x;
	            _3274.y = _3272.y;
	            _3274.z = _3272.z;
	            _3274.w = _3274.w * _806.w;
	            _810 = _3274;
	        }
	        vec4 _883;
	        vec4 _3288 = _883;
	        _3288.x = _804.x;
	        _3288.y = _804.y;
	        _3288.z = _804.z;
	        _3288.w = _804.w;
	        _883 = _3288;
	        vec3 _3298 = normalize(_805.xyz * _3168);
	        vec3 _3301 = normalize(_3288.xyz * _3168);
	        vec4 _3303 = _809;
	        _3303.x = _3301.x;
	        _3303.y = _3301.y;
	        _3303.z = _3301.z;
	        _3303.w = _3288.w;
	        _809 = _3303;
	        vec3 _3312 = _811;
	        _3312.x = _3298.x;
	        _3312.y = _3298.y;
	        _3312.z = _3298.z;
	        _811 = _3312;
	        vec4 _872 = _807.xyxy;
	        bool _873;
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            _873 = true;
	        }
	        else
	        {
	            _873 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	        }
	        if (_873)
	        {
	            vec4 _3333 = _872;
	            bvec4 _3335 = greaterThanEqual(_3333.xyzw, vec4(0.0));
	            vec4 _3336 = _3155[0];
	            vec4 _3338 = _3155[1];
	            vec4 _3340 = _3155[2];
	            float _3343 = length(vec3(_3336.x, _3338.x, _3340.x));
	            float _3348 = length(vec3(_3336.y, _3338.y, _3340.y));
	            float _3353 = length(vec3(_3336.z, _3338.z, _3340.z));
	            if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	            {
	                vec4 _3358 = vec4(_3343, _3348, _3353, 1.0);
	                if (_3335.x)
	                {
	                    vec4 _3372 = _872;
	                    _3372.x = ((_3372.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_3358, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                    _872 = _3372;
	                }
	                if (_3335.y)
	                {
	                    vec4 _3384 = _872;
	                    _3384.y = ((_3384.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_3358, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                    _872 = _3384;
	                }
	            }
	            if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	            {
	                vec4 _3394 = vec4(_3343, _3348, _3353, 1.0);
	                if (_3335.z)
	                {
	                    vec4 _3408 = _872;
	                    _3408.z = ((_3408.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_3394, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                    _872 = _3408;
	                }
	                if (_3335.w)
	                {
	                    vec4 _3420 = _872;
	                    _3420.w = ((_3420.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_3394, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                    _872 = _3420;
	                }
	            }
	        }
	        vec3 _759 = _811;
	        vec4 _758 = _872;
	        vec3 _757 = (vec4(_808.xyz, 1.0) * _3155) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	        vec4 _756 = _810;
	        vec4 _755 = _809;
	        vec3 _803 = _935[1].vPositionOs;
	        vec2 _802 = _935[1].vTexCoord;
	        vec4 _801 = _935[1].vVertexColor;
	        vec3 _800 = _935[1].vNormalOs;
	        vec4 _799 = _935[1].vTangentUOs_flTangentVSign;
	        vec3 _814 = vec3(0.0);
	        vec4 _813 = vec4(0.0);
	        vec4 _812 = vec4(0.0);
	        mat3x4 _3442 = transpose(gl_ObjectToWorldEXT);
	        mat3x4 _3444 = transpose(gl_WorldToObjectEXT);
	        mat3 _869;
	        mat3 _3447 = _869;
	        _3447[0] = _3444[0].xyz;
	        _3447[1] = _3444[1].xyz;
	        _3447[2] = _3444[2].xyz;
	        _869 = _3447;
	        mat3 _3455 = transpose(_3447);
	        vec4 _3469 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        vec4 _868 = _3469;
	        vec3 _3470 = _3469.xyz;
	        vec3 _3471 = _3470 * vec3(0.077399380505084991455078125);
	        vec3 _3474 = pow((_3470 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	        float _865;
	        if (_3469.x <= 0.040449999272823333740234375)
	        {
	            _865 = _3471.x;
	        }
	        else
	        {
	            _865 = _3474.x;
	        }
	        float _866;
	        if (_3469.y <= 0.040449999272823333740234375)
	        {
	            _866 = _3471.y;
	        }
	        else
	        {
	            _866 = _3474.y;
	        }
	        float _867;
	        if (_3469.z <= 0.040449999272823333740234375)
	        {
	            _867 = _3471.z;
	        }
	        else
	        {
	            _867 = _3474.z;
	        }
	        vec3 _3499 = vec3(_865, _866, _867);
	        vec4 _3501 = _868;
	        _3501.x = _3499.x;
	        _3501.y = _3499.y;
	        _3501.z = _3499.z;
	        _868 = _3501;
	        vec4 _3508 = _813;
	        _3508.x = _3501.x;
	        _3508.y = _3501.y;
	        _3508.z = _3501.z;
	        _3508.w = _3501.w;
	        _813 = _3508;
	        bool _870;
	        if (_g_rtx_material_data_.g_bPaintVertexColors)
	        {
	            _870 = true;
	        }
	        else
	        {
	            _870 = _g_rtx_material_data_.g_bVertexColor;
	        }
	        if (_870)
	        {
	            vec3 _3530 = _801.xyz * vec3(0.077399380505084991455078125);
	            vec3 _3533 = pow((_801.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	            float _862;
	            if (_801.x <= 0.040449999272823333740234375)
	            {
	                _862 = _3530.x;
	            }
	            else
	            {
	                _862 = _3533.x;
	            }
	            float _863;
	            if (_801.y <= 0.040449999272823333740234375)
	            {
	                _863 = _3530.y;
	            }
	            else
	            {
	                _863 = _3533.y;
	            }
	            float _864;
	            if (_801.z <= 0.040449999272823333740234375)
	            {
	                _864 = _3530.z;
	            }
	            else
	            {
	                _864 = _3533.z;
	            }
	            vec3 _3559 = _813.xyz * vec3(_862, _863, _864);
	            vec4 _3561 = _813;
	            _3561.x = _3559.x;
	            _3561.y = _3559.y;
	            _3561.z = _3559.z;
	            _3561.w = _3561.w * _801.w;
	            _813 = _3561;
	        }
	        vec4 _871;
	        vec4 _3575 = _871;
	        _3575.x = _799.x;
	        _3575.y = _799.y;
	        _3575.z = _799.z;
	        _3575.w = _799.w;
	        _871 = _3575;
	        vec3 _3585 = normalize(_800.xyz * _3455);
	        vec3 _3588 = normalize(_3575.xyz * _3455);
	        vec4 _3590 = _812;
	        _3590.x = _3588.x;
	        _3590.y = _3588.y;
	        _3590.z = _3588.z;
	        _3590.w = _3575.w;
	        _812 = _3590;
	        vec3 _3599 = _814;
	        _3599.x = _3585.x;
	        _3599.y = _3585.y;
	        _3599.z = _3585.z;
	        _814 = _3599;
	        vec4 _860 = _802.xyxy;
	        bool _861;
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            _861 = true;
	        }
	        else
	        {
	            _861 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	        }
	        if (_861)
	        {
	            vec4 _3620 = _860;
	            bvec4 _3622 = greaterThanEqual(_3620.xyzw, vec4(0.0));
	            vec4 _3623 = _3442[0];
	            vec4 _3625 = _3442[1];
	            vec4 _3627 = _3442[2];
	            float _3630 = length(vec3(_3623.x, _3625.x, _3627.x));
	            float _3635 = length(vec3(_3623.y, _3625.y, _3627.y));
	            float _3640 = length(vec3(_3623.z, _3625.z, _3627.z));
	            if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	            {
	                vec4 _3645 = vec4(_3630, _3635, _3640, 1.0);
	                if (_3622.x)
	                {
	                    vec4 _3659 = _860;
	                    _3659.x = ((_3659.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_3645, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                    _860 = _3659;
	                }
	                if (_3622.y)
	                {
	                    vec4 _3671 = _860;
	                    _3671.y = ((_3671.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_3645, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                    _860 = _3671;
	                }
	            }
	            if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	            {
	                vec4 _3681 = vec4(_3630, _3635, _3640, 1.0);
	                if (_3622.z)
	                {
	                    vec4 _3695 = _860;
	                    _3695.z = ((_3695.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_3681, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                    _860 = _3695;
	                }
	                if (_3622.w)
	                {
	                    vec4 _3707 = _860;
	                    _3707.w = ((_3707.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_3681, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                    _860 = _3707;
	                }
	            }
	        }
	        vec3 _754 = _814;
	        vec4 _753 = _860;
	        vec3 _752 = (vec4(_803.xyz, 1.0) * _3442) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	        vec4 _751 = _813;
	        vec4 _750 = _812;
	        vec3 _798 = _935[2].vPositionOs;
	        vec2 _797 = _935[2].vTexCoord;
	        vec4 _796 = _935[2].vVertexColor;
	        vec3 _795 = _935[2].vNormalOs;
	        vec4 _794 = _935[2].vTangentUOs_flTangentVSign;
	        vec3 _817 = vec3(0.0);
	        vec4 _816 = vec4(0.0);
	        vec4 _815 = vec4(0.0);
	        mat3x4 _3729 = transpose(gl_ObjectToWorldEXT);
	        mat3x4 _3731 = transpose(gl_WorldToObjectEXT);
	        mat3 _857;
	        mat3 _3734 = _857;
	        _3734[0] = _3731[0].xyz;
	        _3734[1] = _3731[1].xyz;
	        _3734[2] = _3731[2].xyz;
	        _857 = _3734;
	        mat3 _3742 = transpose(_3734);
	        vec4 _3756 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        vec4 _856 = _3756;
	        vec3 _3757 = _3756.xyz;
	        vec3 _3758 = _3757 * vec3(0.077399380505084991455078125);
	        vec3 _3761 = pow((_3757 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	        float _853;
	        if (_3756.x <= 0.040449999272823333740234375)
	        {
	            _853 = _3758.x;
	        }
	        else
	        {
	            _853 = _3761.x;
	        }
	        float _854;
	        if (_3756.y <= 0.040449999272823333740234375)
	        {
	            _854 = _3758.y;
	        }
	        else
	        {
	            _854 = _3761.y;
	        }
	        float _855;
	        if (_3756.z <= 0.040449999272823333740234375)
	        {
	            _855 = _3758.z;
	        }
	        else
	        {
	            _855 = _3761.z;
	        }
	        vec3 _3786 = vec3(_853, _854, _855);
	        vec4 _3788 = _856;
	        _3788.x = _3786.x;
	        _3788.y = _3786.y;
	        _3788.z = _3786.z;
	        _856 = _3788;
	        vec4 _3795 = _816;
	        _3795.x = _3788.x;
	        _3795.y = _3788.y;
	        _3795.z = _3788.z;
	        _3795.w = _3788.w;
	        _816 = _3795;
	        bool _858;
	        if (_g_rtx_material_data_.g_bPaintVertexColors)
	        {
	            _858 = true;
	        }
	        else
	        {
	            _858 = _g_rtx_material_data_.g_bVertexColor;
	        }
	        if (_858)
	        {
	            vec3 _3817 = _796.xyz * vec3(0.077399380505084991455078125);
	            vec3 _3820 = pow((_796.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	            float _850;
	            if (_796.x <= 0.040449999272823333740234375)
	            {
	                _850 = _3817.x;
	            }
	            else
	            {
	                _850 = _3820.x;
	            }
	            float _851;
	            if (_796.y <= 0.040449999272823333740234375)
	            {
	                _851 = _3817.y;
	            }
	            else
	            {
	                _851 = _3820.y;
	            }
	            float _852;
	            if (_796.z <= 0.040449999272823333740234375)
	            {
	                _852 = _3817.z;
	            }
	            else
	            {
	                _852 = _3820.z;
	            }
	            vec3 _3846 = _816.xyz * vec3(_850, _851, _852);
	            vec4 _3848 = _816;
	            _3848.x = _3846.x;
	            _3848.y = _3846.y;
	            _3848.z = _3846.z;
	            _3848.w = _3848.w * _796.w;
	            _816 = _3848;
	        }
	        vec4 _859;
	        vec4 _3862 = _859;
	        _3862.x = _794.x;
	        _3862.y = _794.y;
	        _3862.z = _794.z;
	        _3862.w = _794.w;
	        _859 = _3862;
	        vec3 _3872 = normalize(_795.xyz * _3742);
	        vec3 _3875 = normalize(_3862.xyz * _3742);
	        vec4 _3877 = _815;
	        _3877.x = _3875.x;
	        _3877.y = _3875.y;
	        _3877.z = _3875.z;
	        _3877.w = _3862.w;
	        _815 = _3877;
	        vec3 _3886 = _817;
	        _3886.x = _3872.x;
	        _3886.y = _3872.y;
	        _3886.z = _3872.z;
	        _817 = _3886;
	        vec4 _848 = _797.xyxy;
	        bool _849;
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            _849 = true;
	        }
	        else
	        {
	            _849 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	        }
	        if (_849)
	        {
	            vec4 _3907 = _848;
	            bvec4 _3909 = greaterThanEqual(_3907.xyzw, vec4(0.0));
	            vec4 _3910 = _3729[0];
	            vec4 _3912 = _3729[1];
	            vec4 _3914 = _3729[2];
	            float _3917 = length(vec3(_3910.x, _3912.x, _3914.x));
	            float _3922 = length(vec3(_3910.y, _3912.y, _3914.y));
	            float _3927 = length(vec3(_3910.z, _3912.z, _3914.z));
	            if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	            {
	                vec4 _3932 = vec4(_3917, _3922, _3927, 1.0);
	                if (_3909.x)
	                {
	                    vec4 _3946 = _848;
	                    _3946.x = ((_3946.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_3932, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                    _848 = _3946;
	                }
	                if (_3909.y)
	                {
	                    vec4 _3958 = _848;
	                    _3958.y = ((_3958.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_3932, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                    _848 = _3958;
	                }
	            }
	            if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	            {
	                vec4 _3968 = vec4(_3917, _3922, _3927, 1.0);
	                if (_3909.z)
	                {
	                    vec4 _3982 = _848;
	                    _3982.z = ((_3982.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_3968, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                    _848 = _3982;
	                }
	                if (_3909.w)
	                {
	                    vec4 _3994 = _848;
	                    _3994.w = ((_3994.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_3968, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                    _848 = _3994;
	                }
	            }
	        }
	        vec3 _4004 = (vec4(_798.xyz, 1.0) * _3729) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	        vec3 _749 = _817;
	        vec3 _748 = _4004;
	        vec3 _783 = ((_759 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_754 * attrs.barycentrics.x)) + (_817 * attrs.barycentrics.y);
	        vec4 _782 = ((_758 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_753 * attrs.barycentrics.x)) + (_848 * attrs.barycentrics.y);
	        vec4 _781 = ((_756 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_751 * attrs.barycentrics.x)) + (_816 * attrs.barycentrics.y);
	        vec4 _780 = ((_755 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_750 * attrs.barycentrics.x)) + (_815 * attrs.barycentrics.y);
	        vec3 _779 = normalize(cross(_752 - _757, _4004 - _757));
	        bool _842;
	        if (!(gl_HitKindEXT == 254u))
	        {
	            _842 = !_g_rtx_material_data_.g_bUseFrontFaceNormalsForBackFaces;
	        }
	        else
	        {
	            _842 = false;
	        }
	        float _841;
	        if (_780.w > 0.0)
	        {
	            _841 = 1.0;
	        }
	        else
	        {
	            _841 = -1.0;
	        }
	        float _4082 = 1.0 / length(_783);
	        vec3 _828 = _783 * _4082;
	        vec3 _763 = _780.xyz * _4082;
	        vec3 _762 = (cross(_783, _780.xyz) * _841) * _4082;
	        if (_842)
	        {
	            _828 *= (-1.0);
	        }
	        vec3 _829 = _828;
	        vec3 _765 = _763;
	        vec3 _764 = _762;
	        vec3 _843;
	        if (_842)
	        {
	            _843 = -_779;
	        }
	        else
	        {
	            _843 = _779;
	        }
	        float _840;
	        if (_g_rtx_material_data_.g_flAlbedoScrollQuantize1 != 0.0)
	        {
	            _840 = round(PerViewConstantBuffer_t.g_flGameTime / _g_rtx_material_data_.g_flAlbedoScrollQuantize1) * _g_rtx_material_data_.g_flAlbedoScrollQuantize1;
	        }
	        else
	        {
	            _840 = PerViewConstantBuffer_t.g_flGameTime;
	        }
	        vec2 _4119 = (_782.xy + fract(_g_rtx_material_data_.g_vAlbedoScrollSpeed1 * _840)).xy;
	        vec2 _4121;
	        _4121.x = _4119.x;
	        _4121.y = _4119.y;
	        vec4 _4129 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tTintMask], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _4121.xy, 0.0);
	        float _4130 = _4129.x;
	        vec4 _4135 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _4121.xy, 0.0);
	        vec3 _4136 = _4135.xyz;
	        vec3 _844;
	        float _845;
	        if (_g_rtx_material_data_.g_bApplyTintToVertexColors)
	        {
	            if (_g_rtx_material_data_.g_bMaskVertexColorTint1)
	            {
	                _845 = _4130;
	            }
	            else
	            {
	                _845 = 1.0;
	            }
	            _844 = mix(_4136, _4136 * _781.xyz, vec3(_845 * _g_rtx_material_data_.g_fVertexColorStrength1));
	        }
	        else
	        {
	            _844 = _4136;
	        }
	        vec3 _4157 = _844;
	        vec3 _4160 = (vec4(_4157, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect).xyz;
	        if (_g_rtx_material_data_.g_bMaskColorTint1)
	        {
	            _845 = _4130;
	        }
	        else
	        {
	            _845 = 1.0;
	        }
	        float _4169 = _845;
	        vec3 _4171 = mix(_4160, (vec4(_4160, 1.0) * _g_rtx_material_data_.g_mTextureColorTint).xyz, vec3(_4169));
	        if (!_g_rtx_material_data_.g_bApplyTintToVertexColors)
	        {
	            if (_g_rtx_material_data_.g_bMaskVertexColorTint1)
	            {
	                _845 = _4130;
	            }
	            else
	            {
	                _845 = 1.0;
	            }
	            _844 = mix(_4171, _4171 * _781.xyz, vec3(_845 * _g_rtx_material_data_.g_fVertexColorStrength1));
	        }
	        else
	        {
	            _844 = _4171;
	        }
	        float _839;
	        if (_g_rtx_material_data_.g_flNormalAndRoughnessScrollQuantize1 != 0.0)
	        {
	            _839 = round(PerViewConstantBuffer_t.g_flGameTime / _g_rtx_material_data_.g_flNormalAndRoughnessScrollQuantize1) * _g_rtx_material_data_.g_flNormalAndRoughnessScrollQuantize1;
	        }
	        else
	        {
	            _839 = PerViewConstantBuffer_t.g_flGameTime;
	        }
	        vec2 _4209 = (_782.xy + fract(_g_rtx_material_data_.g_vNormalAndRoughnessScrollSpeed1.xy * _839)).xy;
	        vec2 _4211;
	        _4211.x = _4209.x;
	        _4211.y = _4209.y;
	        vec4 _4219 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughness], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _4211.xy, 0.0);
	        float _4223 = _4219.x;
	        float _4224 = _4219.y;
	        float _4226 = (_4223 + _4224) - 1.00392162799835205078125;
	        float _4227 = _4223 - _4224;
	        vec3 _4234 = normalize(vec3(vec2(_4226, _4227), (1.0 - abs(_4226)) - abs(_4227)));
	        vec3 _4235 = abs(_4234);
	        vec2 _4248 = (-vec2(_4234.x, (-1.0) * _4234.y)) / vec2(max(_4235.z, 0.0078125 * max(_4235.x, _4235.y)));
	        vec3 _846 = vec3(1.0);
	        float _847;
	        if (_g_rtx_material_data_.g_bSelfIllum)
	        {
	            float _838;
	            if (_g_rtx_material_data_.g_flSelfIllumScrollQuantize1 != 0.0)
	            {
	                _838 = round(PerViewConstantBuffer_t.g_flGameTime / _g_rtx_material_data_.g_flSelfIllumScrollQuantize1) * _g_rtx_material_data_.g_flSelfIllumScrollQuantize1;
	            }
	            else
	            {
	                _838 = PerViewConstantBuffer_t.g_flGameTime;
	            }
	            vec2 _4281 = (_782.xy + fract(_g_rtx_material_data_.g_vSelfIllumScrollSpeed1.xy * _838)).xy;
	            vec2 _4283;
	            _4283.x = _4281.x;
	            _4283.y = _4281.y;
	            vec3 _4289 = vec3(1.0);
	            _4289.x = _g_rtx_material_data_.g_vSelfIllumTint1.x;
	            _4289.y = _g_rtx_material_data_.g_vSelfIllumTint1.y;
	            _4289.z = _g_rtx_material_data_.g_vSelfIllumTint1.z;
	            vec3 _4301 = mix(_4289.xyz, _4289.xyz * _844.xyz, vec3(_g_rtx_material_data_.g_flSelfIllumAlbedoFactor1));
	            vec3 _4303 = _4289;
	            _4303.x = _4301.x;
	            _4303.y = _4301.y;
	            _4303.z = _4301.z;
	            _846 = _4303;
	            _845 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tSelfIllumMask], g_bindless_Sampler[_g_rtx_material_data_.g_sTrilinearWrap])), _4283.xy, 0.0).x;
	            _847 = _g_rtx_material_data_.g_flSelfIllumScale1;
	        }
	        else
	        {
	            _845 = 1.0;
	            _847 = 0.0;
	        }
	        float _825 = 0.039999999105930328369140625;
	        vec3 _821 = normalize(_829 - ((_765 * _4248.x) + (_764 * _4248.y)));
	        vec3 _820 = _829;
	        vec3 _819 = _843;
	        bool _818 = _842;
	        float _822 = _845 * _847;
	        vec3 _827 = mix(_844.xyz, _846.xyz, vec3(_845 * saturate(_847)));
	        vec2 _824 = _4219.zz;
	        float _826 = _4135.w;
	        vec3 _823 = vec3(0.0);
	        vec3 _793 = _827;
	        float _792 = _826;
	        float _791 = _825;
	        vec2 _790 = _824;
	        vec3 _789 = _823;
	        float _788 = _822;
	        vec3 _787 = _821;
	        vec3 _786 = _820;
	        vec3 _785 = _819;
	        bool _784 = _818;
	        vec3 _836[3] = vec3[](_757, _752, _748);
	        vec3 _837[3] = vec3[](_759, _754, _749);
	        vec3 _4362 = ((_836[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_836[1] * attrs.barycentrics.x)) + (_836[2] * attrs.barycentrics.y);
	        vec3 _830[3];
	        _830[0] = _4362 - (_837[0] * dot(_4362 - _836[0], _837[0]));
	        _830[1] = _4362 - (_837[1] * dot(_4362 - _836[1], _837[1]));
	        _830[2] = _4362 - (_837[2] * dot(_4362 - _836[2], _837[2]));
	        vec3 _4402 = ((_830[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_830[1] * attrs.barycentrics.x)) + (_830[2] * attrs.barycentrics.y);
	        vec3 _831[3];
	        _831[0] = cross(_836[0] - _836[1], _819);
	        _831[1] = cross(_836[1] - _836[2], _819);
	        _831[2] = cross(_836[2] - _836[0], _819);
	        float _832 = dot(_4402 - _4362, _819);
	        vec3 _833 = _4402;
	        int _834 = 0;
	        for (;;)
	        {
	            bool _4418_ladder_break = false;
	            do
	            {
	                if (!(_834 < 3))
	                {
	                    _4418_ladder_break = true;
	                    break;
	                }
	                if (_832 > 0.00999999977648258209228515625)
	                {
	                    _4418_ladder_break = true;
	                    break;
	                }
	                if (dot(_831[_834], _831[_834]) == 0.0)
	                {
	                    break;
	                }
	                _831[_834] = normalize(_831[_834]);
	                int _835 = 0;
	                for (;;)
	                {
	                    if (!(_835 < 3))
	                    {
	                        break;
	                    }
	                    vec3 _4456 = _837[_835] - (_831[_834] * dot(_831[_834], _837[_835]));
	                    _830[_835] = _4362 - (_4456 * dot(_4362 - _836[_835], _4456));
	                    _835++;
	                    continue;
	                }
	                vec3 _4480 = ((_830[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_830[1] * attrs.barycentrics.x)) + (_830[2] * attrs.barycentrics.y);
	                _832 = dot(_4480 - _4362, _819);
	                _833 = _4480;
	                break;
	            } while(false);
	            if (_4418_ladder_break)
	            {
	                break;
	            }
	            _834++;
	            continue;
	        }
	        if (!(_832 > 0.00999999977648258209228515625))
	        {
	            _833 = vec3(3.4028234663852885981170418348452e+38);
	        }
	        _776 = _793;
	        _775 = _792;
	        _774 = _791;
	        _773 = _790;
	        _772 = _789;
	        _771 = _788;
	        _770 = _787;
	        _769 = _786;
	        _768 = _785;
	        _767 = _833;
	        _766 = _784;
	    }
	    else
	    {
	        _776 = vec3(0.5);
	        _775 = 0.0;
	        _774 = 0.039999999105930328369140625;
	        _773 = vec2(0.5);
	        _772 = vec3(0.0);
	        _771 = 0.0;
	        _770 = vec3(0.0, 0.0, 1.0);
	        _769 = vec3(0.0, 0.0, 1.0);
	        _768 = vec3(0.0, 0.0, 1.0);
	        _767 = vec3(0.0);
	        _766 = false;
	    }
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _768;
	    payload.vInterpolatedNormalWs = _769;
	    payload.vSmoothPositionWs = _767;
	    payload.bFlippedNormal = _766;
	    f16vec3 _4521 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_4521, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _4521, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_770);
	    payload.material.vAlbedo = f16vec3(_776);
	    f16vec3 _4530 = f16vec3(_772);
	    payload.material.vEmissive = _4530;
	    payload.material.vEmissive = _4530 + f16vec3(_776 * _771);
	    payload.material.flReflectance = float16_t(_774);
	    payload.material.flMetalness = float16_t(_775);
	    payload.material.flRoughness = float16_t(_773.x);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	IntAttribute(TexCoordScaleByModelU, g_nScaleTexCoordUByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelV, g_nScaleTexCoordVByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelUOrigin, g_nScaleTexCoordUByModelScaleOrigin);
	IntAttribute(TexCoordScaleByModelVOrigin, g_nScaleTexCoordVByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelU, g_nScaleTexCoord2UByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelV, g_nScaleTexCoord2VByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelUOrigin, g_nScaleTexCoord2UByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelVOrigin, g_nScaleTexCoord2VByModelScaleOrigin);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(AllowBackfaceCulling, F_RENDER_BACKFACES ? 0 : 1);
	BoolAttribute(WriteDepthBeforeAlphaBlending, F_WRITE_DEPTH_BEFORE_ALPHA_BLENDING ? 1 : 0);
	BoolAttribute(PerVertexLighting, (F_USE_STATUS_EFFECTS_PROXY || F_UNLIT || F_USE_NPR_LIGHTING || F_CLOAK || F_ADVANCED_TRANSLUCENCY) ? 0 : 1);
	BoolAttribute(ForwardLayerOnly, F_USE_NPR_LIGHTING || F_USE_STATUS_EFFECTS_PROXY || F_UNLIT || F_SHEEN || F_CLOAK || F_GLASS || F_TRANSLUCENT);
	BoolAttribute(SupportsAggregateInstancing, (F_USE_STATUS_EFFECTS_PROXY || F_TRANSLUCENT || F_CLOAK) ? 0 : 1);
	BoolAttribute(UseShadowFastPath, (!F_JITTER_VERTICES && !F_ALPHA_TEST) ? 1 : 0);
	BoolAttribute(NprLitOutline, (F_USE_NPR_LIGHTING && !(F_DISABLE_NPR_OUTLINE || F_TRANSLUCENT || F_UNLIT || F_CLOAK || F_GLASS) && !F_SOLID_COLOR_OUTLINE) ? 1 : 0);
	BoolAttribute(NprSolidOutline, (F_USE_NPR_LIGHTING && !(F_DISABLE_NPR_OUTLINE || F_TRANSLUCENT || F_UNLIT || F_CLOAK || F_GLASS) && F_SOLID_COLOR_OUTLINE) ? 1 : 0);
	BoolAttribute(UseStatusEffectsProxy, F_USE_STATUS_EFFECTS_PROXY ? 1 : 0);
	
}
