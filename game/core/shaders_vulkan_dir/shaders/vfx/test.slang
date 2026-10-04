//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_60
	// Programs: gs, ms, ps, vs
}

MODES
{
	Default();
	Depth(S_TEST1);
	NormalDepthSpec();
}

FEATURES
{
	Feature( F_GS_FORCE_ENABLE, 0..2 (0="Force off", 1="dynamic combo", 2="Force on"), "Misc" );
	Feature( F_MY_ALIAS, 0..0, "F_GS_FORCE_ENABLE" );
}

COMMON
{
	#include "system.fxc"
}

MS
{
	StaticCombo( S_GS_FORCE_ENABLE, F_GS_FORCE_ENABLE );
	DynamicCombo( D_GS_TEST, 0, Sys( 0 ) );
	DynamicCombo( D_MS_TEST, 0..1 );
	
	ExternalDescriptorSet ExtTestDescSet < Source(ExternalDescSet); Attribute("ExtTestDescSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	// Dynamic combos: D_MS_TEST
	
	static float _4;
	
	ByteAddressBuffer g_inputVB : register(t31, space3);
	
	static uint3 gl_GlobalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
	};
	
	struct gl_MeshPerVertexEXT
	{
	    float3 output_0 : TEXCOORD0;
	    float2 output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	struct gl_MeshPerPrimitiveEXT
	{
	};
	
	void MainMs_inner(inout gl_MeshPerVertexEXT gl_MeshVerticesEXT[4], inout uint3 gl_PrimitiveTriangleIndicesEXT[2])
	{
	    SetMeshOutputCounts(4u, 2u);
	    uint _11265 = gl_GlobalInvocationID.x * 36u;
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].output_0.x = asfloat(g_inputVB.Load(((_11265 + 12u) / 4u) * 4 + 0));
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].output_0.y = asfloat(g_inputVB.Load(((_11265 + 16u) / 4u) * 4 + 0));
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].output_0.z = asfloat(g_inputVB.Load(((_11265 + 20u) / 4u) * 4 + 0));
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].output_1.x = asfloat(g_inputVB.Load(((_11265 + 28u) / 4u) * 4 + 0));
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].output_1.y = asfloat(g_inputVB.Load(((_11265 + 32u) / 4u) * 4 + 0));
	    float4 _15926 = float4(asfloat(g_inputVB.Load((_11265 / 4u) * 4 + 0)), _4, asfloat(g_inputVB.Load(((_11265 + 8u) / 4u) * 4 + 0)), 1.0f);
	    _15926.y = asfloat(g_inputVB.Load(((_11265 + 4u) / 4u) * 4 + 0));
	    gl_MeshVerticesEXT[gl_GlobalInvocationID.x].gl_Position = _15926;
	    if (gl_GlobalInvocationID.x == 0u)
	    {
	        gl_PrimitiveTriangleIndicesEXT[0u] = uint3(2u, 1u, 0u);
	    }
	    else
	    {
	        if (gl_GlobalInvocationID.x == 1u)
	        {
	            gl_PrimitiveTriangleIndicesEXT[1u] = uint3(2u, 0u, 3u);
	        }
	    }
	}
	
	[outputtopology("triangle")]
	[numthreads(4, 1, 1)]
	void MainMs(SPIRV_Cross_Input stage_input, out vertices gl_MeshPerVertexEXT gl_MeshVerticesEXT[4], out indices uint3 gl_PrimitiveTriangleIndicesEXT[2])
	{
	    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
	    MainMs_inner(gl_MeshVerticesEXT, gl_PrimitiveTriangleIndicesEXT);
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

struct VS_INPUT
{
	float4 vNormalOs   : NORMAL0    < Semantic( Normal ); >;                                      
	float4 vPositionOs : POSITION0  < Semantic( Pos ); >;                                         
	float4 vUv0        : TEXCOORD0  < Semantic( TexCoord ); >;                                    
};

VS
{
	StaticCombo( S_GS_FORCE_ENABLE, F_GS_FORCE_ENABLE );
	DynamicCombo( D_GS_TEST, 0..1 );
	DynamicCombo( D_MS_TEST, 0, Sys( 0 ) );
	
	ExternalDescriptorSet ExtTestDescSet < Source(ExternalDescSet); Attribute("ExtTestDescSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float3 vPositionOs;
	static float2 vUv0;
	static float3 vNormalOs;
	static float3 output_0;
	static float2 output_1;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float3 vNormalOs : TEXCOORD1;
	    float2 vUv0 : TEXCOORD3;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float2 output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _14437 = float4(vPositionOs, 1.0f);
	    output_0 = vNormalOs;
	    output_1 = vUv0;
	    _14437.y = -vPositionOs.y;
	    gl_Position = _14437;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionOs = stage_input.vPositionOs;
	    vUv0 = stage_input.vUv0;
	    vNormalOs = stage_input.vNormalOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

GS
{
	StaticCombo( S_GS_FORCE_ENABLE, F_GS_FORCE_ENABLE );
	DynamicCombo( D_GS_TEST, 0..1 );
	DynamicCombo( D_MS_TEST, 0..1 );
	
	ExternalDescriptorSet ExtTestDescSet < Source(ExternalDescSet); Attribute("ExtTestDescSet"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported shader stage.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	// Static combos: S_GS_FORCE_ENABLE
	// Dynamic combos: D_GS_TEST
	
	#version 460
	#if defined(GL_EXT_control_flow_attributes)
	#extension GL_EXT_control_flow_attributes : require
	#define SPIRV_CROSS_FLATTEN [[flatten]]
	#define SPIRV_CROSS_BRANCH [[dont_flatten]]
	#define SPIRV_CROSS_UNROLL [[unroll]]
	#define SPIRV_CROSS_LOOP [[dont_unroll]]
	#else
	#define SPIRV_CROSS_FLATTEN
	#define SPIRV_CROSS_BRANCH
	#define SPIRV_CROSS_UNROLL
	#define SPIRV_CROSS_LOOP
	#endif
	layout(triangles) in;
	layout(max_vertices = 3, triangle_strip) out;
	
	struct _985
	{
	    float _m0;
	};
	
	layout(set = 2) uniform _985 ExternalTestCB1;
	
	layout(location = 0) in vec4 input_0[3];
	layout(location = 1) in vec3 input_1[3];
	layout(location = 2) in vec2 input_2[3];
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec2 output_1;
	
	void main()
	{
	    vec4 _25074 = ((input_0[0] + input_0[1]) + input_0[2]).xyzw * vec4(0.3333333432674407958984375);
	    float _11735 = (0.5 * ExternalTestCB1._m0) + 0.5;
	    int _7155;
	    int _13039 = 0;
	    SPIRV_CROSS_UNROLL
	    for (;;)
	    {
	        if (!(_13039 < 3))
	        {
	            break;
	        }
	        vec4 _17221 = mix(_25074, input_0[_13039], vec4((0.300000011920928955078125 * _11735) + 0.699999988079071044921875));
	        output_0 = input_1[_13039];
	        output_1 = input_2[_13039];
	        _17221.y = -_17221.y;
	        gl_Position = _17221;
	        EmitVertex();
	        _7155 = _13039 + 1;
	        _13039 = _7155;
	        continue;
	    }
	    EndPrimitive();
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_TEST1, 0..1 );
	DynamicCombo( D_DESCRIPTOR_SET_TEST, 0..1 );
	DynamicCombo( D_BUFFER_DEVICE_ADDRESS_TEST, 0..1 );
	
	RenderState(DepthBias, g_nValue);
	ExternalDescriptorSet ExtTestDescSet < Source(ExternalDescSet); Attribute("ExtTestDescSet"); >;
	RenderState(FillMode, Wireframe);
	float g_flPinch < Default(1); UiType(Slider); >;
	[[vk::constant_id(1)]] int g_nGPUDeviceID < UiType(Slider); Expression(S_GPU_DEVICE_ID); >;
	[[vk::constant_id(0)]] int g_nGPUVendorID < UiType(Slider); Expression(S_GPU_VENDOR_ID); >;
	int g_nValue < UiType(Slider); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	float3 g_vModulationColor2 < Default(0); UiType(Color); >;
	float3 g_vModulationColor3 < Default3(1, 1, 0.5); UiType(Color); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(1, 1, 1, 0));
	
	// SPIR-V reflection failed for backend HLSL:
	// Only Logical addressing model can be used with HLSL.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_buffer_reference2 : require
	
	layout(constant_id = 0) const uint g_nGPUVendorID = 0u;
	const bool _2 = (g_nGPUVendorID == 4318u);
	layout(constant_id = 1) const uint g_nGPUDeviceID = 0u;
	const bool _3 = (g_nGPUDeviceID == 9988u);
	
	struct _1022
	{
	    vec3 g_vModulationColor3;
	    float g_flPinch;
	};
	
	layout(set = 1) uniform _1022 _Globals_;
	
	struct _1048
	{
	    float _m0;
	    vec4 _m1;
	};
	
	layout(set = 1) uniform _1048 ExternalTestCB1;
	
	layout(push_constant, std430) uniform _997_4179
	{
	    vec2 _m0;
	} _4179;
	
	layout(set = 1, binding = 30) uniform texture2D g_tColor;
	layout(set = 1, binding = 14) uniform sampler Filter_MinMagMipLinear_MaxAniso_1_MipBias_0;
	
	layout(location = 1) in vec2 input_1;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    vec2 _10937 = (input_1.xy * 2.0) - vec2(1.0);
	    vec2 _4360 = _10937;
	    vec2 _15983 = _10937.xy;
	    vec2 _14526 = normalize(_15983) * pow(length(_15983), _Globals_.g_flPinch);
	    _4360.x = _14526.x;
	    _4360.y = _14526.y;
	    vec2 _14835 = _4360;
	    vec2 _23713 = (_14835.xy * 0.5) + vec2(0.5);
	    _4360.x = _23713.x;
	    _4360.y = _23713.y;
	    vec4 _3300 = texture(sampler2D(g_tColor, Filter_MinMagMipLinear_MaxAniso_1_MipBias_0), _4360.xy);
	    vec4 _20506 = _3300;
	    vec3 _14381 = _3300.xyz * ((ExternalTestCB1._m0 * _4179._m0.x) + _4179._m0.y);
	    _20506.x = _14381.x;
	    _20506.y = _14381.y;
	    _20506.z = _14381.z;
	    vec4 _13372 = _20506;
	    vec3 _25167 = _13372.xyz * (ExternalTestCB1._m1.xyz * _Globals_.g_vModulationColor3.xyz);
	    _20506.x = _25167.x;
	    _20506.y = _25167.y;
	    _20506.z = _25167.z;
	    if (_2)
	    {
	        vec3 _5319 = vec3(1.0, 0.0, 0.0);
	        if (_3)
	        {
	            _5319.z = 1.0;
	        }
	        vec4 _14033 = _20506;
	        vec3 _12910 = _14033.xyz * _5319;
	        _20506.x = _12910.x;
	        _20506.y = _12910.y;
	        _20506.z = _12910.z;
	    }
	    else
	    {
	        vec4 _15401 = _20506;
	        vec3 _12682 = _15401.xyz * vec3(0.0, 1.0, 0.0);
	        _20506.x = _12682.x;
	        _20506.y = _12682.y;
	        _20506.z = _12682.z;
	    }
	    output_0 = _20506;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	IntAttribute(foo, 42);
	BoolAttribute(bar, true);
	TextureAttribute(texturetest, g_tColor);
	
}
