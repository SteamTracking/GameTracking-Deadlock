//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Post processing";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Default();
}

FEATURES
{
	Feature( F_FILM_GRAIN, 0..1, "Film Grain" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float3 vPositionPs : POSITION0  < Semantic( PosXyz ); >;                                      
	float2 vTexCoord   : TEXCOORD0  < Semantic( LowPrecisionUv ); >;                              
};

VS
{
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float2 vPositionPs;
	static float2 vTexCoord;
	static float2 output_0;
	
	struct VS_INPUT
	{
	    float2 vPositionPs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float2 output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _14456 = float4(vPositionPs, 0.0f, 1.0f);
	    output_0 = vTexCoord;
	    _14456.y = -vPositionPs.y;
	    gl_Position = _14456;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionPs = stage_input.vPositionPs;
	    vTexCoord = stage_input.vTexCoord;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_FILM_GRAIN, F_FILM_GRAIN );
	DynamicCombo( D_COLOR_CORRECTION_LUT, 0..1 );
	DynamicCombo( D_VIGNETTE, 0..1 );
	DynamicCombo( D_BLOOM, 0..1 );
	DynamicCombo( D_OUTPUT_LINEAR, 0..1 );
	
	float g_flColorCorrectionDefaultWeight < Attribute("ColorCorrectionDefaultWeight"); UiType(Slider); >;
	Texture2D g_tBloom < Attribute("BlurBuffer"); SrgbRead(false); >;
	Texture3D g_tColorCorrection < Attribute("ColorCorrectionTex"); SrgbRead(false); >;
	Texture2D g_tHDRBuffer < Attribute("ColorBuffer"); SrgbRead(false); >;
	Texture2D g_tNoise < Channel(RGB, None(TextureNoise), Linear); OutputFormat(DXT1); SrgbRead(false); >;
	float4 g_vBloomUvScaleClamp < UiType(VectorText); Expression(bloomBufferScaleClamp); >;
	float3 g_vNormalizedBloomStrengths < UiType(VectorText); Expression(float3(normalizedAdditiveBloomStrength,normalizedScreenBloomStrength,normalizedBlurBloomStrength)); >;
	float3 g_vUnNormalizedBloomStrengths < UiType(VectorText); Expression(float3(additiveBloomStrength,screenBloomStrength,blurBloomStrength)); >;
	
	// Film Grain
	CreateInputTexture2D(TextureNoise, Linear, 8, "", "_noise", "Film Grain", Default4(0.5, 0.5, 0.5, 0));
	float g_flFilmGrainIntensity < Default(0.5); Range(0, 2); UiType(Slider); UiGroup("Film Grain"); >;
	float g_flFilmGrainRange < Default(0.2); Range(0, 0.5); UiType(Slider); UiGroup("Film Grain"); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 _3;
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c18);
	};
	
	cbuffer PostProcessingConstantBuffer_t : register(b2, space1)
	{
	    float PostProcessingConstantBuffer_t_1_m0 : packoffset(c0);
	    float PostProcessingConstantBuffer_t_1_m1 : packoffset(c0.y);
	    float PostProcessingConstantBuffer_t_1_m2 : packoffset(c0.z);
	    float PostProcessingConstantBuffer_t_1_m3 : packoffset(c0.w);
	    float PostProcessingConstantBuffer_t_1_m4 : packoffset(c1);
	    float PostProcessingConstantBuffer_t_1_m5 : packoffset(c1.y);
	    float PostProcessingConstantBuffer_t_1_m6 : packoffset(c1.z);
	    float PostProcessingConstantBuffer_t_1_m7 : packoffset(c1.w);
	    float PostProcessingConstantBuffer_t_1_m8 : packoffset(c2);
	};
	
	Texture2D<float4> g_tHDRBuffer : register(t30, space1);
	
	static float4 gl_FragCoord;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float4 _7754 = max(0.0f.xxxx, g_tHDRBuffer.Load(int3(int3(int2(gl_FragCoord.xy), 0).xy, 0)));
	    float3 _9388 = _7754.xyz * (PerViewConstantBuffer_t_1_m0 * PostProcessingConstantBuffer_t_1_m0);
	    float4 _13888;
	    _13888.x = _9388.x;
	    _13888.y = _9388.y;
	    _13888.z = _9388.z;
	    float3 _18130 = min(_13888.xyz * 2.7999999523162841796875f, PostProcessingConstantBuffer_t_1_m7.xxx);
	    float3 _21494 = _18130 * PostProcessingConstantBuffer_t_1_m1;
	    float3 _22374 = clamp((((((_18130 * (_21494 + (PostProcessingConstantBuffer_t_1_m3 * PostProcessingConstantBuffer_t_1_m2).xxx)) + (PostProcessingConstantBuffer_t_1_m4 * PostProcessingConstantBuffer_t_1_m5).xxx) / ((_18130 * (_21494 + PostProcessingConstantBuffer_t_1_m2.xxx)) + (PostProcessingConstantBuffer_t_1_m4 * PostProcessingConstantBuffer_t_1_m6).xxx)) - (PostProcessingConstantBuffer_t_1_m5 / PostProcessingConstantBuffer_t_1_m6).xxx) * PostProcessingConstantBuffer_t_1_m8).xyz, 0.0f.xxx, 1.0f.xxx);
	    float3 _15246 = _22374.xyz;
	    float3 _13051 = _15246 * 12.9200000762939453125f;
	    float3 _7485 = (pow(_15246, 0.4166666567325592041015625f.xxx) * 1.05499994754791259765625f) - 0.054999999701976776123046875f.xxx;
	    float _21354;
	    if (_22374.x <= 0.003130800090730190277099609375f)
	    {
	        _21354 = _13051.x;
	    }
	    else
	    {
	        _21354 = _7485.x;
	    }
	    float _21355;
	    if (_22374.y <= 0.003130800090730190277099609375f)
	    {
	        _21355 = _13051.y;
	    }
	    else
	    {
	        _21355 = _7485.y;
	    }
	    float _19302;
	    if (_22374.z <= 0.003130800090730190277099609375f)
	    {
	        _19302 = _13051.z;
	    }
	    else
	    {
	        _19302 = _7485.z;
	    }
	    output_0 = float4(_21354, _21355, _19302, _7754.w);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
