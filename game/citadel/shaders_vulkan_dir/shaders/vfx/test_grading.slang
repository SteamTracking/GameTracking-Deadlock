//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Test Grading";
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
	
	
}

PS
{
	
	Texture2D g_tAuxTex < Attribute("AuxTex"); SrgbRead(false); >;
	Texture2D g_tColorBuffer < Attribute("ColorBuffer"); SrgbRead(false); >;
	float4 g_vParams0 < Attribute("Params0"); UiType(VectorText); >;
	float4 g_vParams1 < Attribute("Params1"); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float4 _Globals_1_g_vParams0 : packoffset(c0);
	    float4 _Globals_1_g_vParams1 : packoffset(c1);
	};
	
	Texture2D<float4> g_tColorBuffer : register(t30, space1);
	Texture2D<float4> g_tAuxTex : register(t31, space1);
	SamplerState AddressU_Wrap_AddressV_Wrap_Filter_MinMagLinearMipPoint : register(s15, space1);
	
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
	    int2 _17364 = int2(gl_FragCoord.xy);
	    float3 _21016 = g_tColorBuffer.Load(int3(int3(_17364, 0).xy, 0)).xyz;
	    float _6886 = dot(_21016, float3(0.2989999949932098388671875f, 0.58700001239776611328125f, 0.114000000059604644775390625f)) * 255.0f;
	    float _12351 = (((_6886 < _Globals_1_g_vParams1.x) ? 0.0f : (_Globals_1_g_vParams0.y + ((_Globals_1_g_vParams0.z - _Globals_1_g_vParams0.y) * saturate(saturate((_6886 - _Globals_1_g_vParams1.x) / (_Globals_1_g_vParams1.y - _Globals_1_g_vParams1.x)) * (_Globals_1_g_vParams1.w + saturate(abs(_6886 - ((((dot(g_tColorBuffer.Load(int3(int3(_17364 + int2(0, -1), 0).xy, 0)).xyz, float3(0.2989999949932098388671875f, 0.58700001239776611328125f, 0.114000000059604644775390625f)) + dot(g_tColorBuffer.Load(int3(int3(_17364 + int2(0, 1), 0).xy, 0)).xyz, float3(0.2989999949932098388671875f, 0.58700001239776611328125f, 0.114000000059604644775390625f))) + dot(g_tColorBuffer.Load(int3(int3(_17364 + int2(1, 0), 0).xy, 0)).xyz, float3(0.2989999949932098388671875f, 0.58700001239776611328125f, 0.114000000059604644775390625f))) + dot(g_tColorBuffer.Load(int3(int3(_17364 + int2(-1, 0), 0).xy, 0)).xyz, float3(0.2989999949932098388671875f, 0.58700001239776611328125f, 0.114000000059604644775390625f))) * 63.75f)) * _Globals_1_g_vParams1.z)))))) * (((g_tAuxTex.SampleLevel(AddressU_Wrap_AddressV_Wrap_Filter_MinMagLinearMipPoint, (gl_FragCoord.xy / _Globals_1_g_vParams0.x.xx).xy, 0.0f).x - 0.5f) * 2.0f) * _Globals_1_g_vParams0.w)) * 0.0039215688593685626983642578125f;
	    output_0 = float4(clamp(_21016 + _12351.xxx, 0.0f.xxx, 1.0f.xxx), 1.0f);
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
