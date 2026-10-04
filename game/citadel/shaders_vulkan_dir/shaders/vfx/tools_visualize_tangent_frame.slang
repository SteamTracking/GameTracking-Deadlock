//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Debug shader that render normals or tangent space as lines";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: gs, ps, vs
}

MODES
{
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsUtil(S_MODE_FORWARD);
}

FEATURES
{
	Feature( F_SHOW_TANGENTS, 0..1, "General" );
	Feature( F_SHOW_BENT_NORMALS, 0..1, "General" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;              // D_CS_VERTEX_ANIMATION=0, S_SHOW_BENT_NORMALS=1
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vBentNormalOs              : TEXCOORD3      < Semantic( BentNormal ); >;                // S_SHOW_BENT_NORMALS=1
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_FORWARD, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_SHOW_TANGENTS, F_SHOW_TANGENTS );
	StaticCombo( S_SHOW_BENT_NORMALS, F_SHOW_BENT_NORMALS );
	StaticComboRule( Allow1( S_MODE_FORWARD, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow1( S_SHOW_TANGENTS, S_SHOW_BENT_NORMALS ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
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
	
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 vPositionOs;
	static float3 vNormalOs;
	static float3 output_0;
	static float3 output_1;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float3 vNormalOs : TEXCOORD1;
	    uint4 vBlendIndices : TEXCOORD3;
	    uint nInstanceIdx : TEXCOORD4;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float3 output_1 : TEXCOORD1;
	};
	
	void MainVs_inner()
	{
	    uint _13771 = (g_instanceBuffer.Load(nInstanceIdx * 32 + 20) >> uint(16)) & 15u;
	    uint _21785;
	    if (_13771 == 1u)
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4) + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4);
	    }
	    float3x4 _24688 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
	    float4x3 _10676 = transpose(_24688);
	    float3 _7726 = _10676[0];
	    float3 _16758 = _10676[1];
	    float3 _16759 = _10676[2];
	    float3 _22401;
	    if (_13771 > 0u)
	    {
	        float3x4 _25207 = asfloat(uint3x4(g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load4(g_instanceBuffer.Load(nInstanceIdx * 32 + 4) * 48 + 32)));
	        _22401 = _25207[0].z.xxx;
	    }
	    else
	    {
	        _22401 = 1.0f.xxx;
	    }
	    output_0 = mul(_24688, float4(vPositionOs.xyz * _22401.xyz, 1.0f));
	    output_1 = normalize(mul(transpose(float3x3(_7726 * (1.0f / dot(_7726, _7726)), _16758 * (1.0f / dot(_16758, _16758)), _16759 * (1.0f / dot(_16759, _16759)))), vNormalOs.xyz));
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    vPositionOs = stage_input.vPositionOs;
	    vNormalOs = stage_input.vNormalOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

GS
{
	StaticCombo( S_SHOW_TANGENTS, F_SHOW_TANGENTS );
	StaticCombo( S_SHOW_BENT_NORMALS, F_SHOW_BENT_NORMALS );
	
	float g_flVectorLength < Default(1); Range(0, 1000); UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported shader stage.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	layout(triangles) in;
	layout(max_vertices = 6, line_strip) out;
	
	struct _1224
	{
	    mat4 _m0;
	    vec4 _m1;
	};
	
	layout(set = 2) uniform _1224 PerViewConstantBuffer_t;
	
	struct _985
	{
	    float _m0;
	};
	
	layout(set = 2) uniform _985 undetermined;
	
	layout(location = 0) in vec3 input_0[3];
	layout(location = 1) in vec3 input_1[3];
	layout(location = 0) out vec3 output_0;
	
	void main()
	{
	    int _10337;
	    int _13039 = 0;
	    for (;;)
	    {
	        if (!(_13039 < 3))
	        {
	            break;
	        }
	        vec4 _21447 = PerViewConstantBuffer_t._m1 * 1.0;
	        vec4 _18241 = (vec4(input_0[_13039].xyz, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	        output_0 = vec3(0.0, 0.0, 1.0);
	        _18241.y = -_18241.y;
	        gl_Position = _18241;
	        EmitVertex();
	        vec4 _8486 = (vec4((input_0[_13039].xyz + (input_1[_13039].xyz * undetermined._m0)).xyz, 1.0) + _21447).xyzw * PerViewConstantBuffer_t._m0;
	        output_0 = vec3(0.300000011920928955078125, 0.300000011920928955078125, 1.0);
	        _8486.y = -_8486.y;
	        gl_Position = _8486;
	        EmitVertex();
	        EndPrimitive();
	        _10337 = _13039 + 1;
	        _13039 = _10337;
	        continue;
	    }
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
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
	    output_0 = float4(input_0.xyz, 1.0f);
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
