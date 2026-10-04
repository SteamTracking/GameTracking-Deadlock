//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Used to draw UI elements";
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
	
	float4 g_vViewport < Source(Viewport); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float _2;
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    float4 _Globals_1_g_vViewport : packoffset(c0);
	};
	
	
	static float4 gl_Position;
	static float2 vPositionSs;
	
	struct VS_INPUT
	{
	    float2 vPositionSs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float2 _15639 = (((vPositionSs.xy - _Globals_1_g_vViewport.xy) * 2.0f) / _Globals_1_g_vViewport.zw) - 1.0f.xx;
	    float4 _10823 = float4(_15639.x, _2, 1.0f, 1.0f);
	    _10823.y = _15639.y;
	    gl_Position = _10823;
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
	
	float g_flTime < Attribute("Time"); UiType(Slider); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float _Globals_1_g_flTime : packoffset(c0);
	};
	
	
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
	    float _24507 = ((sin((_Globals_1_g_flTime * 0.5f) + (gl_FragCoord.x * 0.00999999977648258209228515625f)) * 0.5f) + 0.5f) * 6.0f;
	    float _8430 = floor(_24507);
	    float _18832 = _24507 - _8430;
	    float _6692 = 1.0f - _18832;
	    float3 _19321;
	    if (_8430 == 0.0f)
	    {
	        _19321 = float3(1.0f, _18832, 0.0f);
	    }
	    else
	    {
	        float3 _12504;
	        if (_8430 == 1.0f)
	        {
	            _12504 = float3(_6692, 1.0f, 0.0f);
	        }
	        else
	        {
	            float3 _12503;
	            if (_8430 == 2.0f)
	            {
	                _12503 = float3(0.0f, 1.0f, _18832);
	            }
	            else
	            {
	                float3 _12502;
	                if (_8430 == 3.0f)
	                {
	                    _12502 = float3(0.0f, _6692, 1.0f);
	                }
	                else
	                {
	                    float3 _12501;
	                    if (_8430 == 4.0f)
	                    {
	                        _12501 = float3(_18832, 0.0f, 1.0f);
	                    }
	                    else
	                    {
	                        _12501 = float3(1.0f, 0.0f, _6692);
	                    }
	                    _12502 = _12501;
	                }
	                _12503 = _12502;
	            }
	            _12504 = _12503;
	        }
	        _19321 = _12504;
	    }
	    output_0 = float4(_19321, 1.0f);
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
