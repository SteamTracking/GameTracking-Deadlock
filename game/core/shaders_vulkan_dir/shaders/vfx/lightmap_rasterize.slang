//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Rasterize Lightmap to produce discrete samples";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: gs, ps, vs
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
	uint4  nPackedFrame : NORMAL0    < Semantic( CompressedTangentFrame ); >;                     
	float4 vPositionWs  : POSITION0  < Semantic( position ); >;                                   
	float2 vLightmapUv  : TEXCOORD0  < Semantic( lightmapuv ); >;                                 
};

VS
{
	
	float4 g_vWindow < Attribute("g_vWindow"); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float _3;
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    float4 _Globals_1_g_vWindow : packoffset(c0);
	};
	
	
	static float4 gl_Position;
	static float3 vPositionWs;
	static float2 vLightmapUv;
	static uint nPackedFrame;
	static float3 output_0;
	static float3 output_1;
	static float3 output_2;
	static float4 output_3;
	static float2 output_4;
	static uint output_5;
	
	struct VS_INPUT
	{
	    float3 vPositionWs : TEXCOORD0;
	    float2 vLightmapUv : TEXCOORD1;
	    uint nPackedFrame : TEXCOORD2;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float3 output_1 : TEXCOORD1;
	    float3 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float2 output_4 : TEXCOORD4;
	    nointerpolation uint output_5 : TEXCOORD5;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float _22483 = (float((nPackedFrame >> 12u) & 1023u) * 0.00195503421127796173095703125f) - 1.0f;
	    float _7589 = (float((nPackedFrame >> 22u) & 1023u) * 0.00195503421127796173095703125f) - 1.0f;
	    float _23404 = (1.0f - abs(_22483)) - abs(_7589);
	    float3 _8254 = float3(_22483, _7589, _23404);
	    float _24228 = saturate(-_23404);
	    float2 _7335 = float2(_22483, _7589);
	    bool2 _10803 = bool2(_7335.x >= 0.0f.xx.x, _7335.y >= 0.0f.xx.y);
	    float2 _14501 = (-_24228).xx;
	    float2 _8565 = _24228.xx;
	    float2 _14348 = _7335 + float2(_10803.x ? _14501.x : _8565.x, _10803.y ? _14501.y : _8565.y);
	    _8254.x = _14348.x;
	    _8254.y = _14348.y;
	    float3 _21001 = normalize(_8254);
	    float _6384 = _21001.z;
	    float _8220 = (_6384 >= 0.0f) ? 1.0f : (-1.0f);
	    float _16417 = (-1.0f) / (_8220 + _6384);
	    float _14755 = _21001.x;
	    float3 _23176 = float3(1.0f + (((_8220 * _14755) * _14755) * _16417), _8220 * ((_14755 * _21001.y) * _16417), (-_8220) * _14755);
	    float _23966 = float((nPackedFrame >> uint(1)) & 2047u) * 0.003069460391998291015625f;
	    float4 _15436 = float4((((vLightmapUv.x - _Globals_1_g_vWindow.x) / (_Globals_1_g_vWindow.z - _Globals_1_g_vWindow.x)) * 2.0f) + (-1.0f), _3, 0.0f, 1.0f);
	    output_0 = vPositionWs;
	    output_1 = _21001;
	    output_2 = 0.0f.xxx;
	    output_3 = float4((_23176 * cos(_23966)) + (cross(_21001, _23176) * sin(_23966)), ((nPackedFrame & 1u) == 0u) ? (-1.0f) : 1.0f);
	    output_4 = vLightmapUv;
	    output_5 = 4294967295u;
	    _15436.y = 1.0f - (((vLightmapUv.y - _Globals_1_g_vWindow.y) / (_Globals_1_g_vWindow.w - _Globals_1_g_vWindow.y)) * 2.0f);
	    gl_Position = _15436;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionWs = stage_input.vPositionWs;
	    vLightmapUv = stage_input.vLightmapUv;
	    nPackedFrame = stage_input.nPackedFrame;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    stage_output.output_4 = output_4;
	    stage_output.output_5 = output_5;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

GS
{
	
	StructuredBuffer g_ChartIDs < Attribute("g_ChartIDs"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	layout(triangles) in;
	layout(max_vertices = 3, triangle_strip) out;
	
	layout(set = 2, binding = 30, std430) readonly buffer g_ChartIDs
	{
	    uint _m0[];
	} g_ChartIDs_1;
	
	layout(location = 0) in vec3 input_0[3];
	layout(location = 1) in vec3 input_1[3];
	layout(location = 3) in vec4 input_3[3];
	layout(location = 4) in vec2 input_4[3];
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec3 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec4 output_3;
	layout(location = 4) out vec2 output_4;
	layout(location = 5) flat out uint output_5;
	
	void main()
	{
	    vec3 _7777 = normalize(cross(input_0[1] - input_0[0], input_0[2] - input_0[0]));
	    uint _11093 = uint(gl_PrimitiveIDIn);
	    uvec2 _16324;
	    _16324 = uvec2(_11093, 0u);
	    int _6352;
	    uint _15272;
	    uvec2 _16189;
	    uint _13136 = 0u;
	    int _17017 = 0;
	    for (;;)
	    {
	        if (!(_17017 < 6))
	        {
	            break;
	        }
	        _15272 = _13136 + 2654435769u;
	        _16189 = _16324.xy + ((((_16324.yx << uvec2(ivec2(4))) + uvec2(2738958700u, 2911926141u)) ^ (_16324.yx + uvec2(_15272))) ^ ((_16324.yx >> uvec2(ivec2(5))) + uvec2(3355524772u, 2123724318u)));
	        _6352 = _17017 + 1;
	        _13136 = _15272;
	        _16324 = _16189;
	        _17017 = _6352;
	        continue;
	    }
	    float _21748 = float(_16324.x & 1048575u) * 9.5367431640625e-07;
	    vec4 _9829 = gl_in[0].gl_Position;
	    vec4 _12875 = _9829;
	    _12875.z = _21748;
	    output_0 = input_0[0];
	    output_1 = input_1[0];
	    output_2 = _7777;
	    output_3 = input_3[0];
	    output_4 = input_4[0];
	    output_5 = g_ChartIDs_1._m0[_11093];
	    _12875.y = -_9829.y;
	    gl_Position = _12875;
	    EmitVertex();
	    vec4 _9830 = gl_in[1].gl_Position;
	    vec4 _12876 = _9830;
	    _12876.z = _21748;
	    output_0 = input_0[1];
	    output_1 = input_1[1];
	    output_2 = _7777;
	    output_3 = input_3[1];
	    output_4 = input_4[1];
	    output_5 = g_ChartIDs_1._m0[_11093];
	    _12876.y = -_9830.y;
	    gl_Position = _12876;
	    EmitVertex();
	    vec4 _9831 = gl_in[2].gl_Position;
	    vec4 _12877 = _9831;
	    _12877.z = _21748;
	    output_0 = input_0[2];
	    output_1 = input_1[2];
	    output_2 = _7777;
	    output_3 = input_3[2];
	    output_4 = input_4[2];
	    output_5 = g_ChartIDs_1._m0[_11093];
	    _12877.y = -_9831.y;
	    gl_Position = _12877;
	    EmitVertex();
	    EndPrimitive();
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	DynamicCombo( D_PASS, 0..1 );
	DynamicCombo( D_REVERSE_DEPTH, 0..1 );
	DynamicComboRule( Requires( D_REVERSE_DEPTH, D_PASS==0 ) );
	
	StructuredBuffer g_ChartInfo < Attribute("g_ChartInfo"); >;
	RWStructuredBuffer g_LightmapSamples < Attribute("g_LightmapSamples"); >;
	Texture2D g_LuxelChartIDs < Attribute("g_LuxelChartIDs"); SrgbRead(false); >;
	int g_nSampleStride < Attribute("g_nSampleStride"); UiType(Slider); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	Texture2D<uint4> g_LuxelChartIDs : register(t30, space1);
	
	static float4 gl_FragCoord;
	static uint input_5;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    nointerpolation uint input_5 : TEXCOORD5;
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    if (input_5 != g_LuxelChartIDs.Load(int3(uint2(gl_FragCoord.xy), 0)).x)
	    {
	        discard;
	    }
	    output_0 = 0.0f.xxxx;
	}
	
	[earlydepthstencil]
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    input_5 = stage_input.input_5;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
