//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Additive light geometry";
	DevShader = true;
	Version = 1;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	ToolsVis();
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
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static float3 vPositionOs;
	static float3 output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : POSITION0;
	    uint nInstanceIdx : TEXCOORD13;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    float3x4 _9577 = float3x4(g_transformBuffer.Load<float4>(g_instanceBuffer.Load<uint>(nInstanceIdx * 32 + 4) * 48 + 0), g_transformBuffer.Load<float4>(g_instanceBuffer.Load<uint>(nInstanceIdx * 32 + 4) * 48 + 16), g_transformBuffer.Load<float4>(g_instanceBuffer.Load<uint>(nInstanceIdx * 32 + 4) * 48 + 32));
	    float3 _20414 = mul(_9577, float4(vPositionOs, 1.0f));
	    float4 _18144 = mul(PerViewConstantBuffer_t_1_m0, (float4(_20414.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = _20414 - PerViewConstantBuffer_t_1_m3.xyz;
	    _18144.y = -_18144.y;
	    gl_Position = _18144;
	    gl_ClipDistance[0] = dot(float4(_20414, 1.0f), PerViewConstantBuffer_t_1_m1);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vPositionOs = stage_input.vPositionOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float3 g_vRadiance < Default3(1, 1, 1); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3534 (name: PerViewConstantBufferCitadel_t), member index 12 (name: _m12) cannot be expressed with either HLSL packing layout or packoffset.
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
	#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
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
	
	struct _1854
	{
	    float _m0;
	    float _m1;
	    float _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	    mat4 _m6;
	};
	
	vec4 _3;
	float _4;
	
	struct _1065
	{
	    vec4 _m0;
	    vec3 _m1;
	};
	
	layout(set = 1) uniform _1065 PerViewConstantBuffer_t;
	
	struct _1082
	{
	    uint g_sPointClamp;
	    uint g_sPointWrap;
	    uint g_sFogVolume;
	    vec3 g_vRadiance;
	};
	
	layout(set = 1) uniform _1082 _Globals_;
	
	struct _1358
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    vec4 _m4;
	    vec4 _m5;
	    vec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    vec4 _m9;
	    vec4 _m10;
	    vec4 _m11;
	    _1854 _m12;
	};
	
	layout(set = 1) uniform _1358 PerViewConstantBufferCitadel_t;
	
	struct _1017
	{
	    vec4 _m0;
	};
	
	layout(set = 3) uniform _1017 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 46) uniform texture3D g_bindless_Texture3D_float4[65536];
	
	layout(location = 0) in vec3 input_0;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	
	void main()
	{
	    vec3 _5578 = input_0 + PerViewConstantBuffer_t._m1.xyz;
	    vec3 _12904;
	    do
	    {
	        vec2 _17534 = _5578.xy - PerViewConstantBufferCitadel_t._m8.xy;
	        bool _12885;
	        if (dot(_17534, _17534) > PerViewConstantBufferCitadel_t._m7.x)
	        {
	            _12885 = _5578.z < PerViewConstantBufferCitadel_t._m7.y;
	        }
	        else
	        {
	            _12885 = false;
	        }
	        SPIRV_CROSS_BRANCH
	        if (_12885)
	        {
	            vec2 _9342 = saturate(PerViewConstantBufferCitadel_t._m4.xy + (PerViewConstantBufferCitadel_t._m4.zw * vec2(length(_17534), _5578.z)));
	            _12904 = _Globals_.g_vRadiance * vec3(1.0 - ((pow(_9342.x, PerViewConstantBufferCitadel_t._m5.x) * pow(_9342.y, PerViewConstantBufferCitadel_t._m5.y)) * PerViewConstantBufferCitadel_t._m6.w));
	            break;
	        }
	        _12904 = _Globals_.g_vRadiance;
	        break;
	    } while(false);
	    vec3 _6864;
	    do
	    {
	        bool _12886;
	        if (dot(input_0, input_0) > PerViewConstantBufferCitadel_t._m11.x)
	        {
	            _12886 = true;
	        }
	        else
	        {
	            _12886 = _5578.z > PerViewConstantBufferCitadel_t._m11.y;
	        }
	        if (_12886)
	        {
	            _6864 = _12904 * vec3(1.0 - saturate(max(pow(max(0.0, (length(input_0) * PerViewConstantBufferCitadel_t._m9.y) + PerViewConstantBufferCitadel_t._m9.x), PerViewConstantBufferCitadel_t._m9.w), pow(max(0.0, (_5578.z * PerViewConstantBufferCitadel_t._m10.y) + PerViewConstantBufferCitadel_t._m10.x), PerViewConstantBufferCitadel_t._m10.z))));
	            break;
	        }
	        _6864 = _12904;
	        break;
	    } while(false);
	    vec3 _19190;
	    do
	    {
	        if (PerViewConstantBufferCitadel_t._m0 != 0u)
	        {
	            vec4 _18372 = vec4(_5578.xyz + fma(textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m1], g_bindless_Sampler[_Globals_.g_sPointWrap]), fma(gl_FragCoord.xy, PerViewLightingConstantBufferGpu_t._m0.zz, PerViewLightingConstantBufferGpu_t._m0.xy).xy, 0.0).xyz, vec3(PerViewConstantBufferCitadel_t._m12._m0), vec3(PerViewConstantBufferCitadel_t._m12._m1)), 1.0) * PerViewConstantBufferCitadel_t._m12._m6;
	            float _20176 = _18372.w;
	            vec2 _10521 = _18372.xy / vec2(_20176);
	            vec4 _22905;
	            _22905.x = _10521.x;
	            _22905.y = _10521.y;
	            float _21043 = (_20176 * PerViewConstantBufferCitadel_t._m12._m3) + PerViewConstantBufferCitadel_t._m12._m2;
	            vec3 _17137 = vec3((_22905.xy * 0.5) + vec2(0.5), _21043);
	            _17137.z = log2((saturate(_21043) * PerViewConstantBufferCitadel_t._m12._m4) + 1.0) * PerViewConstantBufferCitadel_t._m12._m5;
	            _19190 = _6864 * vec4(_4, _4, _4, textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sFogVolume]), _17137, 0.0).w).www;
	            break;
	        }
	        _19190 = _6864;
	        break;
	    } while(false);
	    vec4 _16525 = vec4(_19190, 0.0);
	    bvec4 _13859 = bvec4(gl_FragCoord.z > float(uint16BitsToFloat16(uint16_t(uint(float16BitsToUint16(float16_t(texture(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m3], g_bindless_Sampler[_Globals_.g_sPointClamp]), (gl_FragCoord.xy * PerViewConstantBuffer_t._m0.xy).xy).x))) & 4294967294u))));
	    output_0 = mix(_16525, vec4(0.0), _13859);
	    output_1 = mix(vec4(0.0), _16525, _13859);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(translucent, true);
	
}
