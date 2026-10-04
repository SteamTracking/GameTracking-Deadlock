//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Full-screen Tunnel";
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

VS
{
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static int gl_VertexIndex;
	static int gl_BaseVertexARB;
	cbuffer SPIRV_Cross_VertexInfo
	{
	    int SPIRV_Cross_BaseVertex;
	    int SPIRV_Cross_BaseInstance;
	};
	
	static float2 output_0;
	
	struct VS_INPUT
	{
	    uint gl_VertexIndex : SV_VertexID;
	};
	
	struct PS_INPUT
	{
	    float2 output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    uint _8400 = uint(gl_VertexIndex - gl_BaseVertexARB);
	    float _19114 = (_8400 == 1u) ? 2.0f : 0.0f;
	    bool _22614 = _8400 == 2u;
	    float2 _24337 = (float2(_19114, _22614 ? (-1.0f) : 1.0f) * 2.0f) - 1.0f.xx;
	    float4 _11169 = float4(_24337, 1.0f, 1.0f);
	    output_0 = float2(_19114, _22614 ? 2.0f : 0.0f);
	    _11169.y = -_24337.y;
	    gl_Position = _11169;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    gl_VertexIndex = int(stage_input.gl_VertexIndex);
	    gl_BaseVertexARB = SPIRV_Cross_BaseVertex;
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
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float g_vTunnelAlpha < Attribute("TunnelAlpha"); UiType(Slider); >;
	float g_vTunnelClipZ < Attribute("TunnelClipZ"); UiType(Slider); >;
	float3 g_vTunnelColor < Default3(0.1, 0.1, 0.1); UiType(Color); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 _3;
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float3 _Globals_1_g_vTunnelColor : packoffset(c0);
	    float _Globals_1_g_vTunnelAlpha : packoffset(c0.w);
	    float _Globals_1_g_vTunnelClipZ : packoffset(c1);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c4);
	    float2 PerViewConstantBuffer_t_1_m1 : packoffset(c21);
	};
	
	cbuffer PerViewConstantBufferCitadel_t : register(b3, space1)
	{
	    float4 PerViewConstantBufferCitadel_t_1_m0 : packoffset(c35);
	    float4 PerViewConstantBufferCitadel_t_1_m1 : packoffset(c36);
	    float4 PerViewConstantBufferCitadel_t_1_m2 : packoffset(c37);
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
	    float2 _12497 = ((gl_FragCoord.xy * PerViewConstantBuffer_t_1_m1.xy) * 2.0f) - 1.0f.xx;
	    float4 _18334 = mul(PerViewConstantBuffer_t_1_m0, float4(float3(_12497.x, -_12497.y, _Globals_1_g_vTunnelClipZ), 1.0f));
	    float3 _15614 = _18334.xyz / _18334.www;
	    float4 _22905;
	    _22905.x = _15614.x;
	    _22905.y = _15614.y;
	    _22905.z = _15614.z;
	    float _21709;
	    do
	    {
	        bool _12885;
	        if (PerViewConstantBufferCitadel_t_1_m0.w > 0.0f)
	        {
	            _12885 = true;
	        }
	        else
	        {
	            _12885 = PerViewConstantBufferCitadel_t_1_m1.w > 0.0f;
	        }
	        if (_12885)
	        {
	            float3 _8407 = PerViewConstantBufferCitadel_t_1_m1.xyz - PerViewConstantBufferCitadel_t_1_m0.xyz;
	            float _15380 = saturate(dot(_22905.xyz - PerViewConstantBufferCitadel_t_1_m0.xyz, normalize(_8407)) / length(_8407));
	            float _8523 = lerp(PerViewConstantBufferCitadel_t_1_m0.w, PerViewConstantBufferCitadel_t_1_m1.w, _15380);
	            float _19396 = length(_22905.xyz - lerp(PerViewConstantBufferCitadel_t_1_m0.xyz, PerViewConstantBufferCitadel_t_1_m1.xyz, _15380.xxx));
	            if (_19396 < _8523)
	            {
	                _21709 = lerp(PerViewConstantBufferCitadel_t_1_m2.y, 1.0f, pow((saturate((_19396 - _8523) / ((_8523 * PerViewConstantBufferCitadel_t_1_m2.x) - _8523)) * (-1.0f)) + 1.0f, 2.0f));
	                break;
	            }
	        }
	        _21709 = 1.0f;
	        break;
	    } while(false);
	    output_0 = float4(_Globals_1_g_vTunnelColor, pow(_Globals_1_g_vTunnelAlpha * _21709, 2.2000000476837158203125f));
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
