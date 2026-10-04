//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Blurs cubemap faces according to the GGX specular term.";
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
	float2 vDir        : NORMAL0    < Semantic( LowPrecisionUv ); >;                              
	float3 vPositionPs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	
	float3 g_vMatRow0 < UiType(VectorText); Expression(matrixrow0); >;
	float3 g_vMatRow1 < UiType(VectorText); Expression(matrixrow1); >;
	float3 g_vMatRow2 < UiType(VectorText); Expression(matrixrow2); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 1 (name: g_vMatRow1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	struct _1119
	{
	    vec3 g_vMatRow0;
	    vec3 g_vMatRow1;
	    vec3 g_vMatRow2;
	};
	
	layout(set = 0) uniform _1119 _Globals_;
	
	layout(location = 0) in vec3 vPositionPs;
	layout(location = 1) in vec3 vDir;
	layout(location = 0) out vec3 output_0;
	
	void main()
	{
	    vec4 _14779 = vec4(vPositionPs.xy, 0.0, 1.0);
	    output_0 = vec3(dot(_Globals_.g_vMatRow0, vDir.xyz), dot(_Globals_.g_vMatRow1, vDir.xyz), dot(_Globals_.g_vMatRow2, vDir.xyz));
	    _14779.y = -vPositionPs.y;
	    gl_Position = _14779;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	
	int g_nSampleCount < Attribute("SampleCount"); UiType(Slider); >;
	TextureCube g_tCubemap < Attribute("SrcCubemap"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _30
	{
	    float4 _m0[2048];
	};
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    int _Globals_1_g_nSampleCount : packoffset(c0.y);
	};
	
	cbuffer FilterTapConstantBuffer_t : register(b2, space1)
	{
	    _30 FilterTapConstantBuffer_t_1_m0 : packoffset(c0);
	    _30 FilterTapConstantBuffer_t_1_m1 : packoffset(c2048);
	};
	
	TextureCube<float4> g_tCubemap : register(t30, space1);
	SamplerState Filter_MinMagLinearMipPoint : register(s14, space1);
	
	static float3 input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float3 input_0 : TEXCOORD0;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float3 _21611 = normalize(input_0.xyz);
	    bool3 _13349 = (abs(_21611.z) < 0.999000012874603271484375f).xxx;
	    float3 _18324 = _21611.xyz;
	    float3 _21771 = normalize(cross(float3(_13349.x ? float3(0.0f, 0.0f, 1.0f).x : float3(1.0f, 0.0f, 0.0f).x, _13349.y ? float3(0.0f, 0.0f, 1.0f).y : float3(1.0f, 0.0f, 0.0f).y, _13349.z ? float3(0.0f, 0.0f, 1.0f).z : float3(1.0f, 0.0f, 0.0f).z).xyz, _18324)).xyz;
	    float3x3 _10722 = float3x3(_21771, cross(_21611, _21771).xyz, _18324);
	    float4 _13155;
	    _13155 = float4(0.0f, 0.0f, 0.0f, 1.0f);
	    int _11515;
	    float4 _13138;
	    int _16208 = 0;
	    for (;;)
	    {
	        if (!(_16208 < _Globals_1_g_nSampleCount))
	        {
	            break;
	        }
	        float3 _15752 = _13155.xyz + max((g_tCubemap.SampleLevel(Filter_MinMagLinearMipPoint, mul(FilterTapConstantBuffer_t_1_m0._m0[_16208].xyz, _10722).xyz, FilterTapConstantBuffer_t_1_m0._m0[_16208].w).xyz * FilterTapConstantBuffer_t_1_m1._m0[_16208].x).xyz, 0.0f.xxx).xyz;
	        float4 _20488 = _13155;
	        _20488.x = _15752.x;
	        _20488.y = _15752.y;
	        _13138 = _20488;
	        _13138.z = _15752.z;
	        _11515 = _16208 + 1;
	        _13155 = _13138;
	        _16208 = _11515;
	        continue;
	    }
	    output_0 = _13155;
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
	
	
}
