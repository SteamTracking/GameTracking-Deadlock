//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "denoise blur for effects";
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
	Feature( F_KERNEL_SIZE, 0..4 (0="No Blur", 1="5 pixels wide", 2="7 pixels wide", 3="9 pixels wide", 4="11 pixels wide"), "Kernel Size" );
	Feature( F_SPREAD_TYPE, 0..2 (0="No Spread", 1="Spread of 2", 2="Spread of 3"), "Spread Type" );
	Feature( F_GAUSSIAN_KERNEL, 0..1 (0="Box kernel", 1="Gaussian Kernel"), "Gaussian" );
	Feature( F_WRITE_RED, 0..1 (0="No red", 1="Write red"), "Write Red" );
	FeatureRule( Requires( F_GAUSSIAN_KERNEL, F_SPREAD_TYPE==0 ), "Gaussian Kernel requires Spread Type of 0" );
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
	StaticCombo( S_KERNEL_SIZE, F_KERNEL_SIZE );
	StaticCombo( S_SPREAD_TYPE, F_SPREAD_TYPE );
	StaticCombo( S_GAUSSIAN_KERNEL, F_GAUSSIAN_KERNEL );
	StaticComboRule( Requires( S_GAUSSIAN_KERNEL, S_SPREAD_TYPE==0 ) );
	DynamicCombo( D_BLUR_Y, 0..1 );
	DynamicCombo( D_NUM_TARGET_LAYERS, 0..2 );
	DynamicCombo( D_BLUR_TYPE0, 0..2 );
	DynamicCombo( D_BLUR_TYPE1, 0..2 );
	
	RenderState(ColorWriteEnable0, F_WRITE_RED ? All : G|B|A);
	float g_flBlurZThresh < Default(50); Range(1, 200); UiType(Slider); >;
	float g_flDiscThresh < Default(1); Range(1, 500); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tGBufferDepth < Attribute("GBufferDepth"); SrgbRead(false); >;
	Texture2D g_tGBufferNormal < Attribute("GBufferGeometricNormal"); SrgbRead(false); >;
	Texture2D g_tRawInput0 < Attribute("RawInput0"); SrgbRead(false); >;
	Texture2D g_tRawInput1 < Attribute("RawInput1"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	Texture2D<float4> g_tRawInput0 : register(t56, space1);
	
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
	    output_0 = g_tRawInput0.Load(int3(int3(int2(gl_FragCoord.xy), 0).xy, 0));
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
