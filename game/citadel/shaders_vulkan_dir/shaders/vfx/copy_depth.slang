//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Copy depth texture";
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
	
	float4 g_vInputTextureRect < Attribute("g_vInputTextureRect"); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    float4 _Globals_1_g_vInputTextureRect : packoffset(c0);
	};
	
	
	static float4 gl_Position;
	static float3 vPositionSs;
	static float2 output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionSs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float2 output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _12862 = float4(vPositionSs, 1.0f);
	    float2 _24074 = (vPositionSs.xy * 0.5f) + 0.5f.xx;
	    float _15464 = 1.0f - _24074.y;
	    float2 _20772 = float2((saturate(_24074.x) * (_Globals_1_g_vInputTextureRect.z - _Globals_1_g_vInputTextureRect.x)) + _Globals_1_g_vInputTextureRect.x, _15464);
	    _20772.y = (saturate(_15464) * (_Globals_1_g_vInputTextureRect.w - _Globals_1_g_vInputTextureRect.y)) + _Globals_1_g_vInputTextureRect.y;
	    output_0 = _20772;
	    _12862.y = -vPositionSs.y;
	    gl_Position = _12862;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionSs = stage_input.vPositionSs;
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
	
	Texture2D g_tDepthTexture < Attribute("DepthTexture"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	Texture2D<float4> g_tDepthTexture : register(t30, space1);
	SamplerState Filter_MinMagMipPoint : register(s14, space1);
	
	static float gl_FragDepth;
	static float2 input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float2 input_0 : TEXCOORD0;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	    float gl_FragDepth : SV_Depth;
	};
	
	void MainPs_inner()
	{
	    output_0 = 0.0f.xxxx;
	    gl_FragDepth = g_tDepthTexture.Sample(Filter_MinMagMipPoint, input_0.xy).x;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.gl_FragDepth = gl_FragDepth;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
