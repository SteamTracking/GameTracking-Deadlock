//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Render a portal texture";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	ToolsVis();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_PROCEDURAL_PORTAL, 0..1, "Portal" );
	Feature( F_JITTER_VERTICES, 0..2 (0="No", 1="World Space", 2="Object Space"), "Vertex Animation" );
	Feature( F_RENDER_BACKFACES, 0..1, "Rendering" );
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
	StaticCombo( S_JITTER_VERTICES, F_JITTER_VERTICES );
	
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Jitter Vertices
	float g_flJitterQuantizeDisplacement1 < UiType(Slider); UiGroup("Jitter Vertices"); >;
	float g_flJitterQuantizeTime1 < UiType(Slider); UiGroup("Jitter Vertices"); >;
	float g_flJitterSpeedA1 < Default(10); Range(0, 40); UiType(Slider); UiGroup("Jitter Vertices"); >;
	float g_flJitterSpeedB1 < Default(7); Range(0, 40); UiType(Slider); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesXA1 < Default(4); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesXB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesYA1 < Default(0); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesYB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesZA1 < Default(0); Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterAmplitudesZB1 < Range3(0, 0, 0, 64, 64, 64); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterExpression < Range3(-1024, -1024, -1024, 1024, 1024, 1024); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterFrequenciesA1 < Default3(0.02, 0.04, 0.08); Range3(-0.5, -0.5, -0.5, 0.5, 0.5, 0.5); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	float3 g_vJitterFrequenciesB1 < Default3(0.05, 0.09, 0.17); Range3(-0.5, -0.5, -0.5, 0.5, 0.5, 0.5); UiType(VectorText); UiGroup("Jitter Vertices"); >;
	
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
	    float3 PerViewConstantBuffer_t_1_m2 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static uint nInstanceIdx;
	static float3 vPositionOs;
	static float3 output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint nInstanceIdx : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float3x4 _9558 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
	    float3 _22017 = mul(_9558, float4(vPositionOs.xyz, 1.0f));
	    float4 _17914 = mul(PerViewConstantBuffer_t_1_m0, (float4(_22017.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m1 * 1.0f)).xyzw);
	    output_0 = _22017 - PerViewConstantBuffer_t_1_m2.xyz;
	    _17914.y = -_17914.y;
	    gl_Position = _17914;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vPositionOs = stage_input.vPositionOs;
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
	StaticCombo( S_PROCEDURAL_PORTAL, F_PROCEDURAL_PORTAL );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	
	RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(shadervar_wireframedepthenable) ? shadervar_wireframedepthenable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	Texture2D g_tPortalColor < Attribute("PortalColorTexture"); SrgbRead(false); >;
	TextureCube g_tPortalCubeTexture < Channel(RGB, GGXCubeMapBlur(PortalCubeTexture), Linear); OutputFormat(BC6H); SrgbRead(false); >;
	float4 g_vFadeColorAndVisibility < Attribute("FadeColorAndVisibility"); UiType(VectorText); >;
	
	// Portal
	CreateInputTexture2D(PortalCubeTexture, Linear, 8, "", "_cube", "Portal", Default4(1, 1, 1, 0));
	float g_flPortalBlur < Range(0, 12); UiType(Slider); UiGroup("Portal"); >;
	float g_flPortalBrightness < Default(1); Range(0, 2); UiType(Slider); UiGroup("Portal"); >;
	float g_flPortalSaturation < Default(1); UiType(Slider); UiGroup("Portal"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 _2;
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float _Globals_1_g_flPortalBlur : packoffset(c1);
	    float _Globals_1_g_flPortalSaturation : packoffset(c1.y);
	    float _Globals_1_g_flPortalBrightness : packoffset(c1.z);
	};
	
	TextureCube<float4> g_tPortalCubeTexture : register(t30, space1);
	SamplerState DefaultSamplerState_0 : register(s14, space1);
	
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
	    float _24162_tmp = g_tPortalCubeTexture.CalculateLevelOfDetail(DefaultSamplerState_0, input_0);
	    float2 _24162 = _24162_tmp.xx;
	    float4 _3300 = g_tPortalCubeTexture.SampleLevel(DefaultSamplerState_0, input_0.xyz, max(_24162.x, _Globals_1_g_flPortalBlur));
	    float4 _16478;
	    _16478.x = _3300.x;
	    _16478.y = _3300.y;
	    _16478.z = _3300.z;
	    float3 _23588 = lerp(dot(_16478.xyz, float3(0.2125000059604644775390625f, 0.7153999805450439453125f, 0.07209999859333038330078125f)).xxx, _16478.xyz, _Globals_1_g_flPortalSaturation.xxx);
	    float4 _17842;
	    _17842.x = _23588.x;
	    _17842.y = _23588.y;
	    _17842.z = _23588.z;
	    output_0 = float4(_17842.xyz * _Globals_1_g_flPortalBrightness, 1.0f);
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
	
	
	
	BoolAttribute(ForwardLayerOnly, true);
	BoolAttribute(mapbuilder_donotcollapse, true);
	
}
