//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Simple environment shader using vertex colors to drive PBR parameters.";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, rtx, vs
}

MODES
{
	Depth("depth_only_bindless.vfx");
	Deferred();
	Raytrace();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
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
	float4 vBlendIndices : BLENDINDICES0  < Semantic( BlendIndices ); >;                           // D_CS_VERTEX_ANIMATION=0
	float3 vPositionOs   : POSITION0      < Semantic( PosXyz ); >;                                 // D_CS_VERTEX_ANIMATION=0
	float2 nInstanceIdx  : TEXCOORD13     < Semantic( InstanceTransformUv ); >;                   
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
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
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 vPositionOs;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint4 vBlendIndices : TEXCOORD1;
	    uint nInstanceIdx : TEXCOORD2;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    uint _21785;
	    if (((g_instanceBuffer.Load(nInstanceIdx * 32 + 20) >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4) + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4);
	    }
	    float3x4 _9558 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
	    float3 _19937 = mul(_9558, float4(vPositionOs.xyz, 1.0f));
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_19937.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_19937.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    vPositionOs = stage_input.vPositionOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 output_0;
	static float4 output_1;
	static float4 output_2;
	static float2 output_3;
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	    float4 output_1 : SV_Target1;
	    float4 output_2 : SV_Target2;
	    float2 output_3 : SV_Target3;
	};
	
	void MainPs_inner()
	{
	    output_0 = float4(0.5f, 0.5f, 1.0f, 1.0f);
	    output_1 = float4(0.0f, 0.0f, 0.0f, 0.12549020349979400634765625f);
	    output_2 = float4(1.0f, 0.0f, 0.0f, 0.0f);
	    output_3 = 0.0f.xx;
	}
	
	PS_OUTPUT MainPs()
	{
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(SupportsLightmapping, false);
	BoolAttribute(SupportsMappingDimensions, false);
	
}

RTX
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_VIS, S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	float4x4 g_mHighPrecisionWorldFromProjNoJitter < Attribute("HighPrecisionWorldFromProjNoJitter"); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL: 5326
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#if defined(GL_AMD_gpu_shader_half_float)
	#extension GL_AMD_gpu_shader_half_float : require
	#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
	#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
	#else
	#error No extension available for FP16.
	#endif
	#extension GL_EXT_shader_16bit_storage : require
	#extension GL_EXT_ray_tracing : require
	#extension GL_EXT_nonuniform_qualifier : require
	
	struct VS_INPUT
	{
	    vec3 vPositionOs;
	    uvec4 vBlendIndices;
	    uint nInstanceIdx;
	};
	
	struct _Array_natural_vector_int_4_8
	{
	    ivec4 data[8];
	};
	
	struct GeometryInfo_t_natural
	{
	    ivec4 m_nVertexAndIndexBuffers;
	    ivec4 m_nBufferBindOffsetBytes;
	    ivec4 m_nBufferStrideInBytes;
	    ivec4 m_vNormalFieldInfo;
	    ivec4 m_vTangentFieldInfo;
	    _Array_natural_vector_int_4_8 m_vTexCoordFieldInfo;
	    _Array_natural_vector_int_4_8 m_vColorFieldInfo;
	};
	
	struct BuiltInTriangleIntersectionAttributes
	{
	    vec2 barycentrics;
	};
	
	struct MaterialDataMinimal_t
	{
	    f16vec3 vNormalWs;
	    float16_t flMetalness;
	    f16vec3 vAlbedo;
	    float16_t flRoughness;
	    f16vec3 vEmissive;
	    float16_t flReflectance;
	    uint nMaterialTypeAndFlags;
	    f16vec4 vMaterialBits;
	};
	
	struct Payload_t
	{
	    vec3 vSmoothPositionWs;
	    vec3 vFaceNormalWs;
	    vec3 vInterpolatedNormalWs;
	    float flHitT;
	    float flOpacityRng;
	    int nInstance;
	    bool bFlippedNormal;
	    MaterialDataMinimal_t material;
	};
	
	struct PayloadShadow_t
	{
	    float m_flVisibility;
	};
	
	layout(set = 3, binding = 31, std430) readonly buffer StructuredBuffer
	{
	    GeometryInfo_t_natural _member0[];
	} g_Geometries;
	
	layout(set = 3, binding = 33, std430) readonly buffer g_Indices
	{
	    uint _member0[];
	} g_Indices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices
	{
	    float _member0[];
	} g_Vertices_1[];
	
	hitAttributeEXT BuiltInTriangleIntersectionAttributes attrs;
	layout(location = 0) rayPayloadInEXT Payload_t payload;
	
	void main()
	{
	    uvec3 _164;
	    do
	    {
	        if (g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _209 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _164 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_209 / 4u], g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_209 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_209 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _188 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _189 = _188 & 4294967292u;
	            uint _35 = _189 / 4u;
	            uint _38 = (_189 + 4u) / 4u;
	            uint _193 = (g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_35] & 4294901760u) >> uint(16);
	            uint _194 = g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_38] & 65535u;
	            uvec3 _165;
	            if (_188 == _189)
	            {
	                _165 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_35] & 65535u, _193, _194);
	            }
	            else
	            {
	                _165 = uvec3(_193, _194, (g_Indices_1[nonuniformEXT(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_38] & 4294901760u) >> uint(16));
	            }
	            _164 = _165;
	            break;
	        }
	        break;
	    } while(false);
	    uint _51 = uint(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _230 = (uvec3(uint(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _164) + uvec3(uint(g_Geometries._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    vec3 _166[3];
	    uint _232 = _230.x;
	    _166[0] = vec3(g_Vertices_1[nonuniformEXT(_51)]._member0[_232 / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_232 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_232 + 8u) / 4u]);
	    uint _237 = _230.y;
	    _166[1] = vec3(g_Vertices_1[nonuniformEXT(_51)]._member0[_237 / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_237 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_237 + 8u) / 4u]);
	    uint _242 = _230.z;
	    _166[2] = vec3(g_Vertices_1[nonuniformEXT(_51)]._member0[_242 / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_242 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_51)]._member0[(_242 + 8u) / 4u]);
	    int _167 = 0;
	    VS_INPUT _168[3];
	    for (;;)
	    {
	        if (!(_167 < 3))
	        {
	            break;
	        }
	        _168[_167].vPositionOs = _166[_167];
	        _167++;
	        continue;
	    }
	    vec3 _272 = vec4(_168[0].vPositionOs.xyz, 1.0) * transpose(gl_ObjectToWorldEXT);
	    vec3 _163 = _272;
	    vec3 _280 = vec4(_168[1].vPositionOs.xyz, 1.0) * transpose(gl_ObjectToWorldEXT);
	    vec3 _162 = _280;
	    vec3 _288 = vec4(_168[2].vPositionOs.xyz, 1.0) * transpose(gl_ObjectToWorldEXT);
	    vec3 _161 = _288;
	    vec3 _294 = normalize(cross(_280 - _272, _288 - _272));
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _294;
	    payload.vInterpolatedNormalWs = _294;
	    payload.vSmoothPositionWs = ((_163 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_162 * attrs.barycentrics.x)) + (_161 * attrs.barycentrics.y);
	    payload.bFlippedNormal = false;
	    f16vec3 _318 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_318, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _318, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_294);
	    payload.material.vAlbedo = f16vec3(vec3(0.0));
	    f16vec3 _327 = f16vec3(vec3(0.0));
	    payload.material.vEmissive = _327;
	    vec3 _328 = vec3(0.0) * 0.0;
	    payload.material.vEmissive = _327 + f16vec3(_328);
	    payload.material.flReflectance = float16_t(0.039999999105930328369140625);
	    payload.material.flMetalness = float16_t(0.0);
	    payload.material.flRoughness = float16_t(1.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, true);
	
}
