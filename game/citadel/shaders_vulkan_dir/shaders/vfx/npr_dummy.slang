//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "NPR Dummy Shader for NPR Params";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
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
	float3 vPositionOs  : POSITION0  < Semantic( PosXyz ); >;                                     
	float2 nInstanceIdx : TEXCOORD13 < Semantic( InstanceTransformUv ); >;                        
};

VS
{
	
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Diffuse
	float g_flDiffusePbrBlend < Default(0.25); UiType(Slider); UiGroup("Diffuse,10 / 5"); >;
	bool g_bBounceDiffuse < Default(1); UiType(CheckBox); UiGroup("Diffuse,10 / Bounce,10 / 10"); >;
	bool g_bDirectDiffuse < Default(1); UiType(CheckBox); UiGroup("Diffuse,10 / Direct,10 / 10"); >;
	float g_flDirectLightWrap < Default(0.85); UiType(Slider); UiGroup("Diffuse,10 / Direct,10 / 11"); >;
	float g_flDiffuseStepSharpness < Default(0.9); Range(0.01, 0.99); UiType(Slider); UiGroup("Diffuse,10 / Bounce,10 / 12"); >;
	float2 g_vDfaoInfluenceRange < Default2(0.4, 0.8); UiType(VectorText); UiGroup("Diffuse,10 / Bounce,10 / 14"); >;
	float g_flPrimaryLightCameraWeight < Default(0.3); UiType(Slider); UiGroup("Diffuse,10 / Bounce Light Angle,20 / 81"); >;
	
	// Specular
	bool g_bDirectSpecular < Default(1); UiType(CheckBox); UiGroup("Specular,11 / Direct / 10"); >;
	float g_fSpecularRoughnessBias < UiType(Slider); UiGroup("Specular / Direct / 11"); >;
	int g_nSpecularSteps < Default(3); Range(1, 8); UiType(Slider); UiGroup("Specular / Direct / 11"); >;
	float g_flSpecularReflectance < Default(0.01); Range(0.04, 0.6); UiType(Slider); UiGroup("Specular / Direct / 12"); >;
	float g_flSpecularStepSharpness < Default(0.9); Range(0.01, 0.99); UiType(Slider); UiGroup("Specular / Direct / 12"); >;
	float g_flSpecularTint < UiType(Slider); UiGroup("Specular / Direct / 12"); >;
	
	// Exposure Control
	bool g_bExposureControl < Default(1); UiType(CheckBox); UiGroup("Exposure Control,15 / 10"); >;
	float3 g_vExposureTargets < Default3(1, 0.5, 0.1); Range3(0, 0, 0, 2, 2, 2); UiType(VectorText); UiGroup("Exposure Control,15 / 20"); >;
	float g_flExposureControlPbrBlend < Default(0.5); UiType(Slider); UiGroup("Exposure Control,15 / 90"); >;
	
	// Character Outlines
	bool g_bOutlines < Default(1); UiType(CheckBox); UiGroup("Character Outlines,20/1"); >;
	float g_flOutlineThickness < Default(0.2); Range(0, 0.5); UiType(Slider); UiGroup("Character Outlines,20/2"); >;
	float4 g_vOutlineDarkColor < Default4(0.025, 0.025, 0.025, 0.75); UiType(Color); UiGroup("Character Outlines,20/20"); Expression(SrgbGammaToLinear(this)); >;
	float4 g_vOutlineBrightColor < Default4(0.25, 0.25, 0.25, 0.25); UiType(Color); UiGroup("Character Outlines,20/21"); Expression(SrgbGammaToLinear(this)); >;
	
	// Rim Lighting
	bool g_bRimLighting < Default(1); UiType(CheckBox); UiGroup("Rim Lighting,30/1"); >;
	float g_flRimLightFalloff < Default(0.5); Range(0.05, 2); UiType(Slider); UiGroup("Rim Lighting,30/3"); >;
	float g_flRimLightWrap < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Rim Lighting,30/3"); >;
	float g_flRimLightStrength < Default(0.75); Range(0, 3); UiType(Slider); UiGroup("Rim Lighting,30/4"); >;
	float2 g_vRimLightUpRamp < Default(0); Range2(-1, -1, 1, 1); UiType(VectorText); UiGroup("Rim Lighting,30/5"); >;
	bool g_bRimLightingDepthOcclusion < Default(1); UiType(CheckBox); UiGroup("Rim Lighting,30/10"); >;
	float g_flRimOcclusionDepthToleranceMin < Default(1); Range(0.5, 10); UiType(Slider); UiGroup("Rim Lighting,30/11"); >;
	float g_flRimOcclusionDepthToleranceRange < Default(2); Range(0.5, 10); UiType(Slider); UiGroup("Rim Lighting,30/11"); >;
	float g_flRimOcclusionSampleDistance < Default(1); Range(0.5, 10); UiType(Slider); UiGroup("Rim Lighting,30/11"); >;
	
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
	
	ByteAddressBuffer g_instanceBuffer : register(t32, space0);
	ByteAddressBuffer g_transformBuffer : register(t30, space0);
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c24);
	};
	
	
	static float4 gl_Position;
	static uint nInstanceIdx;
	static float3 vPositionOs;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint nInstanceIdx : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float3x4 _9558 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
	    float4 _19149 = mul(PerViewConstantBuffer_t_1_m0, (float4(mul(_9558, float4(vPositionOs.xyz, 1.0f)).xyz, 1.0f) + (PerViewConstantBuffer_t_1_m1 * 1.0f)).xyzw);
	    _19149.y = -_19149.y;
	    gl_Position = _19149;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vPositionOs = stage_input.vPositionOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(g_bNPRBounceDiffuse, g_bBounceDiffuse);
	FloatAttribute(g_flNPRDiffuseStepSharpness, g_flDiffuseStepSharpness);
	Float2Attribute(g_vNPRDfaoInfluenceRange, g_vDfaoInfluenceRange);
	BoolAttribute(g_bNPRDirectSpecular, g_bDirectSpecular);
	FloatAttribute(g_fNPRSpecularRoughnessBias, g_fSpecularRoughnessBias);
	FloatAttribute(g_nNPRSpecularSteps, g_nSpecularSteps);
	FloatAttribute(g_flNPRSpecularStepSharpness, g_flSpecularStepSharpness);
	FloatAttribute(g_flNPRSpecularTint, g_flSpecularTint);
	FloatAttribute(g_flNPRSpecularReflectance, g_flSpecularReflectance);
	FloatAttribute(g_flNPRPrimaryLightCameraWeight, g_flPrimaryLightCameraWeight);
	BoolAttribute(g_bNPRDirectDiffuse, g_bDirectDiffuse);
	FloatAttribute(g_flNPRDirectLightWrap, g_flDirectLightWrap);
	FloatAttribute(g_flNPRDiffusePbrBlend, g_flDiffusePbrBlend);
	FloatAttribute(g_flOoNPRDirectLightNormalization, v0 = 1-g_flDirectLightWrap;
v1 = 2*(1-v0);
1/v1);
	BoolAttribute(g_bNPRExposureControl, g_bExposureControl);
	Float3Attribute(g_vNPRExposureTargets, g_vExposureTargets);
	FloatAttribute(g_flNPRExposureControlPbrBlend, g_flExposureControlPbrBlend);
	BoolAttribute(g_bNPROutlines, g_bOutlines);
	FloatAttribute(g_flNPROutlineThickness, g_flOutlineThickness);
	Float4Attribute(g_vNPROutlineDarkColor, g_vOutlineDarkColor);
	Float4Attribute(g_vNPROutlineBrightColor, g_vOutlineBrightColor);
	BoolAttribute(g_bNPRRimLighting, g_bRimLighting);
	FloatAttribute(g_flNPRRimLightFalloff, g_flRimLightFalloff);
	FloatAttribute(g_flNPRRimLightWrap, g_flRimLightWrap);
	FloatAttribute(g_flNPRRimLightStrength, g_flRimLightStrength);
	Float2Attribute(g_vNPRRimLightUpRamp, float2(min(g_vRimLightUpRamp.x,g_vRimLightUpRamp.y),max(g_vRimLightUpRamp.x,g_vRimLightUpRamp.y)));
	BoolAttribute(g_bNPRRimLightingDepthOcclusion, g_bRimLightingDepthOcclusion);
	FloatAttribute(g_flNPRRimOcclusionSampleDistance, g_flRimOcclusionSampleDistance);
	FloatAttribute(g_flNPRRimOcclusionDepthToleranceMin, g_flRimOcclusionDepthToleranceMin);
	FloatAttribute(g_flNPRRimOcclusionDepthToleranceRange, g_flRimOcclusionDepthToleranceRange);
	BoolAttribute(ForwardLayerOnly, true);
	
}

PS
{
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 output_0;
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    output_0 = 1.0f.xxxx;
	}
	
	PS_OUTPUT MainPs()
	{
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
