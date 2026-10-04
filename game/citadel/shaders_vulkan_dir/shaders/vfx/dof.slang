//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "DOF shader";
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
	float4 vPositionPs : POSITION0  < Semantic( position ); >;                                    
	float4 vTexCoord   : TEXCOORD0  < Semantic( texcoord ); >;                                    
};

VS
{
	DynamicCombo( D_DOF_DOWNSAMPLE, 0..1 );
	DynamicCombo( D_DOF_NEAR_COC, 0..1 );
	DynamicCombo( D_DOF_SMALL_BLUR, 0..1 );
	DynamicCombo( D_SUBRECT_RENDER, 0..1 );
	DynamicComboRule( Allow1( D_DOF_DOWNSAMPLE, D_DOF_NEAR_COC, D_DOF_SMALL_BLUR ) );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4 g_vInvSourceDim < Attribute("InvSourceDim"); UiType(VectorText); >;
	
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
	    float4 _14779 = float4(vPositionPs, 0.0f, 1.0f);
	    output_0 = vTexCoord.xy;
	    _14779.y = -vPositionPs.y;
	    gl_Position = _14779;
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
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	DynamicCombo( D_DOF_DOWNSAMPLE, 0..1 );
	DynamicCombo( D_DOF_NEAR_COC, 0..1 );
	DynamicCombo( D_DOF_SMALL_BLUR, 0..1 );
	DynamicCombo( D_SUBRECT_RENDER, 0..1 );
	DynamicComboRule( Allow1( D_DOF_DOWNSAMPLE, D_DOF_NEAR_COC, D_DOF_SMALL_BLUR ) );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tInputColor < Attribute("InputColor"); SrgbRead(true); >;
	Texture2D g_tInputDepth < Attribute("InputDepth"); SrgbRead(false); >;
	Texture2D g_tInputLargeBlur < Attribute("InputLargeBlur"); SrgbRead(true); >;
	Texture2D g_tInputShrunk < Attribute("InputShrunk"); SrgbRead(true); >;
	Texture2D g_tInputShrunkAndBlurred < Attribute("InputShrunkAndBlurred"); SrgbRead(true); >;
	Texture2D g_tInputSmallBlur < Attribute("InputSmallBlur"); SrgbRead(true); >;
	float4 g_vDofEqFar < Attribute("DofEqFar"); UiType(VectorText); >;
	float4 g_vDofEqNear < Attribute("DofEqNear"); UiType(VectorText); >;
	float4 g_vDofLerpBias < Attribute("DofLerpBias"); UiType(VectorText); >;
	float4 g_vDofLerpScale < Attribute("DofLerpScale"); UiType(VectorText); >;
	float4 g_vDofRowDelta < Attribute("DofRowDelta"); UiType(VectorText); >;
	float4 g_vInvSourceDim < Attribute("InvSourceDim"); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c23.z);
	};
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float4 _Globals_1_g_vDofEqFar : packoffset(c11);
	    float4 _Globals_1_g_vDofLerpScale : packoffset(c12);
	    float4 _Globals_1_g_vDofLerpBias : packoffset(c13);
	};
	
	Texture2D<float4> g_tInputColor : register(t56, space1);
	SamplerState AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint : register(s27, space1);
	Texture2D<float4> g_tInputDepth : register(t57, space1);
	SamplerState AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_1 : register(s28, space1);
	Texture2D<float4> g_tInputSmallBlur : register(t60, space1);
	SamplerState AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_2 : register(s14, space1);
	Texture2D<float4> g_tInputLargeBlur : register(t61, space1);
	SamplerState AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_3 : register(s15, space1);
	
	static float2 input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float2 input_0 : TEXCOORD0;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float4 _19338 = g_tInputColor.Sample(AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint, input_0.xy);
	    float4 _18992 = g_tInputDepth.Sample(AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_1, input_0.xy);
	    float _3064 = _18992.x;
	    float4 _20877 = g_tInputColor.Sample(AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint, input_0.xy);
	    float4 _22452 = g_tInputSmallBlur.Sample(AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_2, input_0.xy);
	    float4 _3300 = g_tInputLargeBlur.Sample(AddressU_Clamp_AddressV_Clamp_Filter_MinMagLinearMipPoint_3, input_0.xy);
	    float _3319 = _22452.w;
	    float _19363;
	    if (_3064 > 1000000.0f)
	    {
	        _19363 = _3319;
	    }
	    else
	    {
	        _19363 = max(_3319, saturate((_Globals_1_g_vDofEqFar.x * (PerViewConstantBuffer_t_1_m0 / max(_3064, 0.001000000047497451305389404296875f))) + _Globals_1_g_vDofEqFar.y) * _Globals_1_g_vDofEqFar.z);
	    }
	    float4 _23870 = clamp((_Globals_1_g_vDofLerpScale.xyzw * _19363) + _Globals_1_g_vDofLerpBias.xyzw, 0.0f.xxxx, 1.0f.xxxx);
	    float2 _21875 = min(_23870.yz, 1.0f.xx - _23870.xy);
	    float _8196 = _21875.x;
	    float4 _23929 = _23870;
	    _23929.y = _8196;
	    float _22972 = _21875.y;
	    _23929.z = _22972;
	    output_0 = float4(((((_20877.xyz * 0.941176474094390869140625f) * _8196) + (_22452.xyz * _22972)) + (_3300.xyz * _23870.w)) + (_19338.xyz * (1.0f - dot(_23929.yzw, float3(0.941176474094390869140625f, 1.0f, 1.0f)))), 1.0f);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
