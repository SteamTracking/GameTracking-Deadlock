//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Shader to downsample rendertargets with bloom thresholds";
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
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float3 vPositionSs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float3 vPositionSs;
	
	struct VS_INPUT
	{
	    float3 vPositionSs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _22489 = float4(vPositionSs, 1.0f);
	    _22489.y = -vPositionSs.y;
	    gl_Position = _22489;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionSs = stage_input.vPositionSs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	DynamicCombo( D_DOWNSAMPLE_MODE, 0..1 );
	DynamicCombo( D_OUTPUT_PANO, 0..1 );
	
	float g_flBloomScale < Attribute("bloomScale"); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tGBufferTarget2 < Attribute("GBufferTarget2"); SrgbRead(false); >;
	Texture2D g_tInput < Attribute("InputTexture"); SrgbRead(false); >;
	float4 g_vInvTexDim < Source(InvTextureDim); SourceArg(g_tInput) UiType(VectorText); >;
	float3 g_vThresholdParams < UiType(VectorText); Expression(float3(-bloomThreshold/bloomThresholdWidth,1/bloomThresholdWidth,skyboxBloomStrength)); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float4 _Globals_1_g_vInvTexDim : packoffset(c9);
	    float3 _Globals_1_g_vThresholdParams : packoffset(c10);
	    float _Globals_1_g_flBloomScale : packoffset(c10.w);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c18);
	};
	
	Texture2D<float4> g_tInput : register(t56, space1);
	SamplerState Filter_MinMagLinearMipPoint : register(s27, space1);
	Texture2D<float4> g_tGBufferTarget2 : register(t57, space1);
	SamplerState Filter_MinMagMipPoint : register(s28, space1);
	
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
	    float2 _22165 = (gl_FragCoord.xy * (_Globals_1_g_vInvTexDim.xy * 2.0f)).xy;
	    float4 _14259 = g_tInput.SampleLevel(Filter_MinMagLinearMipPoint, _22165, 0.0f, int2(0, 0));
	    float4 _3300 = g_tGBufferTarget2.SampleLevel(Filter_MinMagMipPoint, _22165, 0.0f, int2(0, 0));
	    float3 _19634 = _14259.xyz;
	    float _12956 = _3300.y;
	    float4 _9716;
	    float _24878;
	    if (_12956 > 0.0f)
	    {
	        float _15011 = _12956 * 20.0f;
	        float3 _13253 = _19634 * _15011;
	        float4 _8673 = _14259;
	        _8673.x = _13253.x;
	        _8673.y = _13253.y;
	        _8673.z = _13253.z;
	        _9716 = _8673;
	        _24878 = _15011;
	    }
	    else
	    {
	        _9716 = _14259;
	        _24878 = dot(_19634, float3(0.300000011920928955078125f, 0.589999973773956298828125f, 0.10999999940395355224609375f));
	    }
	    float4 _8396 = _9716 * saturate(((_24878 * PerViewConstantBuffer_t_1_m0) * _Globals_1_g_vThresholdParams.y) + _Globals_1_g_vThresholdParams.x);
	    float3 _11003 = _8396.xyz * _Globals_1_g_flBloomScale;
	    float4 _8674 = _8396;
	    _8674.x = _11003.x;
	    _8674.y = _11003.y;
	    _8674.z = _11003.z;
	    output_0 = _8674;
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
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
