//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Simple shader to use as a starting point for writing new shaders";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	Forward();
	DotaForward(S_MODE_FORWARD);
	CsgoForward(S_MODE_FORWARD);
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_VERTEX_COLORS, 0..1, "" );
	Feature( F_TRIANGLE_EDGES, 0..1, "" );
	Feature( F_WIREFRAME, 0..1, "" );
	Feature( F_TRANSLUCENT, 0..1, "" );
	FeatureRule( Allow1( F_TRIANGLE_EDGES, F_WIREFRAME ), "Triangle edges and wireframe a mutually exclusive." );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vColor       : COLOR0     < Semantic( Color ); >;                                       // S_VERTEX_COLORS=1
	float3 vPositionOs  : POSITION0  < Semantic( PosXyz ); >;                                     
	float2 nInstanceIdx : TEXCOORD13 < Semantic( InstanceTransformUv ); >;                        
};

VS
{
	StaticCombo( S_MODE_FORWARD, 0..1 );
	StaticCombo( S_VERTEX_COLORS, F_VERTEX_COLORS );
	DynamicCombo( D_BLEND_WEIGHT_COUNT, 0..4 );
	DynamicComboRule( Allow0( D_BLEND_WEIGHT_COUNT ) );
	
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Depth Bias Amount
	float g_DepthBiasAmount < Default(0.025); UiType(Slider); UiGroup("Depth Bias Amount"); >;
	
	// Color
	float g_flAlpha < Default(1); UiType(Slider); UiGroup("Color"); >;
	float3 g_vColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("Color"); >;
	
	// WireframeEmit
	float3 g_vWireframeEmit < UiType(Color); UiGroup("WireframeEmit"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 1 (name: g_vWireframeEmit) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
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
	    mat3x4 _m0;
	};
	
	layout(set = 0, binding = 32, std430) readonly buffer g_instanceBuffer
	{
	    _1125 _m0[];
	} g_instanceBuffer_1;
	
	struct _1100
	{
	    vec3 g_vColorTint;
	    vec3 g_vWireframeEmit;
	    float g_flAlpha;
	    float g_DepthBiasAmount;
	};
	
	layout(set = 0) uniform _1100 _Globals_;
	
	layout(set = 0, binding = 30, std430) readonly buffer g_transformBuffer
	{
	    _1119 _m0[];
	} g_transformBuffer_1;
	
	struct _1224
	{
	    mat4 _m0;
	    vec4 _m1;
	};
	
	layout(set = 0) uniform _1224 PerViewConstantBuffer_t;
	
	layout(location = 1) in uint nInstanceIdx;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec3 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec3 output_3;
	layout(location = 4) out vec3 output_4;
	
	void main()
	{
	    vec4 _23812 = vec4(uvec4(g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 255u, (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 65280u) >> uint(8), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 16711680u) >> uint(16), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec3 _6253 = _23812.xyz;
	    vec3 _17828 = _6253 * vec3(0.077399380505084991455078125);
	    vec3 _7676 = pow((_6253 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _21354;
	    if (_23812.x <= 0.040449999272823333740234375)
	    {
	        _21354 = _17828.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (_23812.y <= 0.040449999272823333740234375)
	    {
	        _21355 = _17828.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    float _25150 = _23812.w;
	    vec3 _19956 = vec4(vPositionOs.xyz, 1.0) * g_transformBuffer_1._m0[g_instanceBuffer_1._m0[nInstanceIdx]._m1]._m0;
	    vec4 _18275 = (vec4(_19956.xyz, 1.0) + (PerViewConstantBuffer_t._m1 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    float _13048 = _18275.z;
	    float _11452 = _18275.w;
	    vec4 _19428 = _18275;
	    _19428.z = _13048 - (mix(_Globals_.g_DepthBiasAmount, 9.9999999747524270787835121154785e-07, saturate(_13048 / _11452)) * _11452);
	    output_0 = vec3(0.0);
	    output_1 = _19956;
	    output_2 = vec4(vec4(_21354, _21355, _19302, _25150).xyz * _Globals_.g_vColorTint.xyz, _25150 * _Globals_.g_flAlpha);
	    output_3 = vec3(0.0);
	    output_4 = _Globals_.g_vWireframeEmit;
	    _19428.y = -_18275.y;
	    gl_Position = _19428;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_MODE_FORWARD, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_WIREFRAME, F_WIREFRAME );
	StaticCombo( S_TRIANGLE_EDGES, F_TRIANGLE_EDGES );
	StaticComboRule( Allow1( S_MODE_FORWARD, S_MODE_TOOLS_WIREFRAME, S_MODE_DEPTH ) );
	StaticComboRule( Allow1( S_TRIANGLE_EDGES, S_WIREFRAME ) );
	
	RenderState(BlendEnable, F_TRANSLUCENT ? true : false);
	RenderState(StencilRef, 1);
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 input_2;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float4 input_2 : TEXCOORD2;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    output_0 = input_2;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_2 = stage_input.input_2;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
