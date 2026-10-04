//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Depth Only Bindless - Used as a Mode Fallback";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	FrontDepth(S_MODE_FRONT_DEPTH);
	ShadowSilhouette(S_MODE_SHADOW_SILHOUETTE);
}

FEATURES
{
	Feature( F_ALPHA_TEST, 0..1, "Translucent" );
	Feature( F_ADVANCED_TRANSLUCENCY, 0..1, "Translucency" );
	Feature( F_RENDER_BACKFACES, 0..1, "2-Sided Rendering" );
	Feature( F_SECONDARY_UV, 0..1, "Secondary UV" );
	Feature( F_JITTER_VERTICES, 0..2 (0="No", 1="World Space", 2="Object Space"), "Vertex Animation" );
	FeatureRule( Requires( F_ADVANCED_TRANSLUCENCY, F_ALPHA_TEST ), "Advanced Translucency requires Translucent or Alpha Test" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices : BLENDINDICES0  < Semantic( BlendIndices ); >;                           // D_CS_VERTEX_ANIMATION=0, S_JITTER_VERTICES=2
	float3 vPositionOs   : POSITION0      < Semantic( PosXyz ); >;                                 // D_CS_VERTEX_ANIMATION=0, S_JITTER_VERTICES=2
	float2 vTexCoord     : TEXCOORD0      < Semantic( LowPrecisionUv ); >;                         // S_ALPHA_TEST=1, S_JITTER_VERTICES=1, S_JITTER_VERTICES=2
	float2 vTexCoord2    : TEXCOORD1      < Semantic( LowPrecisionUv1 ); >;                       
	float2 nInstanceIdx  : TEXCOORD13     < Semantic( InstanceTransformUv ); >;                   
};

VS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_SECONDARY_UV, F_SECONDARY_UV );
	StaticCombo( S_JITTER_VERTICES, F_JITTER_VERTICES );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tJitterMask < Channel(R, None(TextureJitterMask), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
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
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static float3 vPositionOs;
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint4 vBlendIndices : TEXCOORD1;
	    uint nInstanceIdx : TEXCOORD2;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
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
	    float3x4 _6463 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
	    float3 _19956 = mul(_6463, float4(vPositionOs.xyz, 1.0f));
	    float4 _17914 = mul(PerViewConstantBuffer_t_1_m0, (float4(_19956.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = _19956;
	    _17914.y = -_17914.y;
	    gl_Position = _17914;
	    gl_ClipDistance[0] = dot(float4(_19956.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionOs = stage_input.vPositionOs;
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	
	#if (S_ALPHA_TEST == 0)
		IntAttribute(DepthPassBatchID, 1);
	#endif
	#if (S_JITTER_VERTICES == 0)
		IntAttribute(DepthPassBatchID, 1);
	#endif
}

PS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_MODE_SHADOW_SILHOUETTE, 0..1 );
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_ADVANCED_TRANSLUCENCY, F_ADVANCED_TRANSLUCENCY );
	StaticCombo( S_SECONDARY_UV, F_SECONDARY_UV );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, S_MODE_SHADOW_SILHOUETTE ) );
	StaticComboRule( Requires( S_ADVANCED_TRANSLUCENCY, S_ALPHA_TEST ) );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	DynamicComboRule( Allow1( S_MODE_SHADOW_SILHOUETTE, D_OPAQUE_FADE ) );
	
	RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tAltTranslucency < Channel(R, Box(TextureAltTranslucency1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, PreserveCoverage(TextureTranslucency), Linear); OutputFormat(DXT5); SrgbRead(true); >;
	
	// Translucency
	CreateInputTexture2D(TextureAltTranslucency1, Linear, 8, "", "_trans", "Translucency", Default4(1, 1, 1, 0));
	bool g_bUseSecondaryUvForAltTranslucency < UiType(CheckBox); UiGroup("Translucency"); >;
	bool g_bUseSecondaryUvForTranslucency < UiType(CheckBox); UiGroup("Translucency"); >;
	float g_flTranslucentScrollQuantize0_1 < UiType(Slider); UiGroup("Translucency"); >;
	float g_flTranslucentScrollQuantize1_1 < UiType(Slider); UiGroup("Translucency"); >;
	int g_nTranslucencyBlendMode1 < Range(0, 2); Attribute("0=Multiply,1=Add,2=Subtract"); UiType(Slider); UiGroup("Translucency"); >;
	float2 g_vTranslucentScrollSpeed0_1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency"); >;
	float2 g_vTranslucentScrollSpeed1_1 < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Translucency"); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(1, 1, 1, 0));
	
	// Translucent
	CreateInputTexture2D(TextureTranslucency, Linear, 8, "", "_trans", "Translucent", Default4(1, 1, 1, 0));
	float g_flAlphaTestReference1 < Default(0.7); Range(0.01, 0.99); UiType(Slider); UiGroup("Translucent"); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space1)
	{
	    uint PerViewConstantBufferCitadel_t_1_m0 : packoffset(c1);
	    int2 PerViewConstantBufferCitadel_t_1_m1 : packoffset(c6);
	    float PerViewConstantBufferCitadel_t_1_m2 : packoffset(c6.w);
	    float4 PerViewConstantBufferCitadel_t_1_m3 : packoffset(c35);
	    float4 PerViewConstantBufferCitadel_t_1_m4 : packoffset(c36);
	    float4 PerViewConstantBufferCitadel_t_1_m5 : packoffset(c37);
	};
	
	Texture2D<float4> g_bindless_Texture2D_float4[65536] : register(t46, space4);
	
	static float4 gl_FragCoord;
	static float3 input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float3 input_0 : TEXCOORD0;
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float _21709;
	    do
	    {
	        bool _12885;
	        if (PerViewConstantBufferCitadel_t_1_m3.w > 0.0f)
	        {
	            _12885 = true;
	        }
	        else
	        {
	            _12885 = PerViewConstantBufferCitadel_t_1_m4.w > 0.0f;
	        }
	        if (_12885)
	        {
	            float3 _8407 = PerViewConstantBufferCitadel_t_1_m4.xyz - PerViewConstantBufferCitadel_t_1_m3.xyz;
	            float _15380 = saturate(dot(input_0.xyz - PerViewConstantBufferCitadel_t_1_m3.xyz, normalize(_8407)) / length(_8407));
	            float _8523 = lerp(PerViewConstantBufferCitadel_t_1_m3.w, PerViewConstantBufferCitadel_t_1_m4.w, _15380);
	            float _19396 = length(input_0.xyz - lerp(PerViewConstantBufferCitadel_t_1_m3.xyz, PerViewConstantBufferCitadel_t_1_m4.xyz, _15380.xxx));
	            if (_19396 < _8523)
	            {
	                _21709 = lerp(PerViewConstantBufferCitadel_t_1_m5.y, 1.0f, pow((saturate((_19396 - _8523) / ((_8523 * PerViewConstantBufferCitadel_t_1_m5.x) - _8523)) * (-1.0f)) + 1.0f, 2.0f));
	                break;
	            }
	        }
	        _21709 = 1.0f;
	        break;
	    } while(false);
	    if (_21709 < frac(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t_1_m0].Load(int3(int3(int2(gl_FragCoord.xy) & PerViewConstantBufferCitadel_t_1_m1, 0).xy, 0)).x + PerViewConstantBufferCitadel_t_1_m2))
	    {
	        discard;
	    }
	    output_0 = 1.0f.xxxx;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
	#if (S_ALPHA_TEST == 1)
		BoolAttribute(alphatest, true);
	#endif
}
