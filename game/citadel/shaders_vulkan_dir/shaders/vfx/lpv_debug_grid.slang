//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Shader for debugging LPV sample points.";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_50
	// Programs: gs, ps, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	Deferred();
	ToolsVis(S_MODE_TOOLS_VIS);
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
	StaticCombo( S_MODE_DEPTH, 0..1 );
	DynamicCombo( D_POINT_TO_CUBE, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_PROBE, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
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
	
	ByteAddressBuffer g_instanceBuffer : register(t32, space4);
	ByteAddressBuffer g_transformBuffer : register(t30, space4);
	
	static float3 vPositionOs;
	static uint nInstanceIdx;
	static float3 output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint nInstanceIdx : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	};
	
	void MainVs_inner()
	{
	    float3x4 _6463 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
	    output_0 = mul(_6463, float4(vPositionOs.xyz, 1.0f));
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionOs = stage_input.vPositionOs;
	    nInstanceIdx = stage_input.nInstanceIdx;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

GS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	DynamicCombo( D_POINT_TO_CUBE, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_PROBE, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4 g_vHighPrecisionLightingOffsetWs < UiType(VectorText); >;
	
	// Color
	float g_flPointSize < Default(4); Range(0, 16); UiType(Slider); UiGroup("Color, 10/25"); Expression(pointsize); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported shader stage.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	layout(points) in;
	layout(max_vertices = 4, triangle_strip) out;
	
	struct _1368
	{
	    mat4 _m0;
	    vec4 _m1;
	    vec3 _m2;
	    vec3 _m3;
	};
	
	layout(set = 2) uniform _1368 PerViewConstantBuffer_t;
	
	struct _1032
	{
	    vec4 _m0;
	    float _m1;
	};
	
	layout(set = 2) uniform _1032 undetermined;
	
	layout(location = 0) in vec3 input_0[1];
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	
	void main()
	{
	    vec3 _17615 = normalize(input_0[0] - PerViewConstantBuffer_t._m2);
	    vec3 _11686 = cross(_17615, PerViewConstantBuffer_t._m3).xyz;
	    vec4 _9918 = vec4(input_0[0], undetermined._m1 * 0.5);
	    vec3 _16500 = input_0[0] - (_17615 * undetermined._m1);
	    float _25224 = undetermined._m1 * (-0.60000002384185791015625);
	    vec3 _21046 = _16500 + (_11686 * _25224);
	    float _13108 = 0.60000002384185791015625 * undetermined._m1;
	    vec3 _8702 = PerViewConstantBuffer_t._m3 * _13108;
	    vec3 _7336 = (_21046 + _8702).xyz;
	    vec4 _21447 = PerViewConstantBuffer_t._m1 * 1.0;
	    vec4 _20663 = (vec4(_7336, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = _7336 - undetermined._m0.xyz;
	    output_1 = _9918;
	    _20663.y = -_20663.y;
	    gl_Position = _20663;
	    EmitVertex();
	    vec3 _24428 = PerViewConstantBuffer_t._m3 * _25224;
	    vec3 _8552 = (_21046 + _24428).xyz;
	    vec4 _18907 = (vec4(_8552, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = _8552 - undetermined._m0.xyz;
	    output_1 = _9918;
	    _18907.y = -_18907.y;
	    gl_Position = _18907;
	    EmitVertex();
	    vec3 _15138 = _16500 + (_11686 * _13108);
	    vec3 _7753 = (_15138 + _8702).xyz;
	    vec4 _18908 = (vec4(_7753, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = _7753 - undetermined._m0.xyz;
	    output_1 = _9918;
	    _18908.y = -_18908.y;
	    gl_Position = _18908;
	    EmitVertex();
	    vec3 _18190 = (_15138 + _24428).xyz;
	    vec4 _18909 = (vec4(_18190, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = _18190 - undetermined._m0.xyz;
	    output_1 = _9918;
	    _18909.y = -_18909.y;
	    gl_Position = _18909;
	    EmitVertex();
	    EndPrimitive();
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_POINT_TO_CUBE, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_PROBE, 0..1 );
	
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vHighPrecisionLightingOffsetWs < UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Color
	float3 g_vAlbedo < Default3(0.5, 0.5, 0.5); UiType(Color); UiGroup("Color,10/20"); Expression(SrgbGammaToLinear(albedo)); >;
	float g_flRoughness < Default(0.5); UiType(Slider); UiGroup("Color,10/30"); Expression(roughness); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float3 PerViewConstantBuffer_t_1_m0 : packoffset(c26);
	};
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float4 _Globals_1_g_vHighPrecisionLightingOffsetWs : packoffset(c0);
	    float3 _Globals_1_g_vAlbedo : packoffset(c1);
	    float _Globals_1_g_flRoughness : packoffset(c1.w);
	};
	
	
	static float3 input_0;
	static float4 input_1;
	static float4 output_0;
	static float4 output_1;
	static float4 output_2;
	static float2 output_3;
	
	struct PS_INPUT
	{
	    float3 input_0 : TEXCOORD0;
	    float4 input_1 : TEXCOORD1;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	    float4 output_1 : SV_Target1;
	    float4 output_2 : SV_Target2;
	    float2 output_3 : SV_Target3;
	};
	
	void MainPs_inner()
	{
	    float3 _17493 = normalize((input_0 + _Globals_1_g_vHighPrecisionLightingOffsetWs.xyz) - PerViewConstantBuffer_t_1_m0.xyz);
	    float3 _7812 = PerViewConstantBuffer_t_1_m0.xyz - input_1.xyz;
	    float _14320 = dot(_17493, _7812);
	    float _15399 = (_14320 * _14320) - (dot(_7812, _7812) - (input_1.w * input_1.w));
	    if (_15399 < 0.0f)
	    {
	        discard;
	    }
	    float _23182 = -_14320;
	    float _9680;
	    if (_15399 > 0.0f)
	    {
	        _9680 = _23182 - sqrt(_15399);
	    }
	    else
	    {
	        _9680 = _23182;
	    }
	    output_0 = float4((normalize((PerViewConstantBuffer_t_1_m0.xyz + (_17493 * _9680)) - input_1.xyz).xyz * 0.5f) + 0.5f.xxx, 0.0f);
	    output_1 = float4(_Globals_1_g_vAlbedo, 0.12549020349979400634765625f);
	    output_2 = float4(_Globals_1_g_flRoughness, 0.0f, 0.0f, 0.0f);
	    output_3 = 0.0f.xx;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_0 = stage_input.input_0;
	    input_1 = stage_input.input_1;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
