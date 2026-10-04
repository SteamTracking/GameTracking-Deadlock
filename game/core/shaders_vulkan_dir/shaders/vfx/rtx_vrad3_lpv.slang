//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "General shaders for baked lighting preview in Hammer";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_60
	// Programs: rtx
}

MODES
{
	RayTrace();
}

FEATURES
{
}

COMMON
{
	#include "system.fxc"
}

RTX
{
	StaticCombo( S_EXECUTION_REORDERING, 0..1 );
	DynamicCombo( D_LPV_PASS, 0..1 );
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL: 5319
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
	#extension GL_KHR_shader_subgroup_vote : require
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
	
	struct PackedRtxInstanceData_t_natural
	{
	    uint nSrgbColor;
	    uint nTriangleGeometry;
	    uint nMaterialData;
	    uint nMaterialFlags_nInstanceFlags;
	    float fEmissiveBoost;
	    uint nInstanceFlags;
	    uint _pad1;
	    uint _pad2;
	};
	
	struct PayloadShadow_t
	{
	    float m_flVisibility;
	};
	
	layout(set = 6, binding = 159, std430) buffer RWStructuredBuffer
	{
	    uint _member0[];
	} g_SolidMask;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(push_constant, std430) uniform LpvPushConstants_t_natural
	{
	    int m_nEstimate;
	    int m_nDimensionCount;
	    int m_nFilterRadius;
	    int m_nFog;
	    uvec4 m_vPackedCellStartAndCount;
	    vec4 m_vOffset;
	    vec4 m_vLpvMinBounds;
	    vec4 m_vLpvMaxBounds;
	    layout(row_major) mat4x3 m_mLpvLocalToWorld;
	} g_PushConstants;
	
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	
	void main()
	{
	    do
	    {
	        int nIdx = int((gl_LaunchSizeEXT.x * ((gl_LaunchIDEXT.z * gl_LaunchSizeEXT.y) + gl_LaunchIDEXT.y)) + gl_LaunchIDEXT.x);
	        vec3 _186 = g_PushConstants.m_mLpvLocalToWorld * vec4((((g_PushConstants.m_vLpvMaxBounds.xyz - g_PushConstants.m_vLpvMinBounds.xyz) / vec3(gl_LaunchSizeEXT)) * (vec3(ivec3(gl_LaunchIDEXT)) + g_PushConstants.m_vOffset.xyz)) + g_PushConstants.m_vLpvMinBounds.xyz, 1.0);
	        uint nFlags;
	        if (g_PushConstants.m_nEstimate > 0)
	        {
	            nFlags = g_SolidMask._member0[nIdx];
	        }
	        else
	        {
	            nFlags = 0u;
	        }
	        bool bValidSample_2 = (nFlags & 1u) == 0u;
	        if (subgroupAll(!bValidSample_2))
	        {
	            break;
	        }
	        bool bValidSample = bValidSample_2;
	        int i = 0;
	        int nBackfacesSeen = 0;
	        bool bValidSample_1;
	        vec3 _136;
	        float _145;
	        bool _146;
	        bool _147;
	        int _148;
	        bool _149;
	        float _150;
	        SPIRV_CROSS_LOOP
	        for (;;)
	        {
	            if (i < 32)
	            {
	                _149 = bValidSample;
	            }
	            else
	            {
	                _149 = false;
	            }
	            if (!_149)
	            {
	                break;
	            }
	            uint _217 = uint(i);
	            uint _222 = (_217 << 16u) | (_217 >> 16u);
	            uint _227 = ((_222 & 1431655765u) << 1u) | ((_222 & 2863311530u) >> 1u);
	            uint _232 = ((_227 & 858993459u) << 2u) | ((_227 & 3435973836u) >> 2u);
	            uint _237 = ((_232 & 252645135u) << 4u) | ((_232 & 4042322160u) >> 4u);
	            vec2 _245 = vec2(float(_217) * 0.03125, float(((_237 & 16711935u) << 8u) | ((_237 & 4278255360u) >> 8u)) * 2.3283064365386962890625e-10);
	            float _246 = _245.y;
	            float _251 = 2.0 * sqrt(max(0.0, _246 - (_246 * _246)));
	            float _253 = 6.283185482025146484375 * _245.x;
	            vec3 _260 = vec3(cos(_253) * _251, sin(_253) * _251, 1.0 - (2.0 * _246));
	            vec3 _135 = _186.xyz;
	            float _134 = 0.0;
	            vec3 _133 = _260;
	            if (bValidSample)
	            {
	                _150 = 56755.83984375;
	            }
	            else
	            {
	                _150 = 0.0;
	            }
	            f16vec3 _267 = f16vec3(vec3(0.0));
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _136, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_267, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _267, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	            traceRayEXT(g_AccelStruct, 0u, 16u, 0u, 2u, 0u, _135, _134, _133, _150, 0);
	            vec3 _132 = _135;
	            vec3 _131 = _133;
	            vec3 _130 = p.vSmoothPositionWs;
	            vec3 _129 = p.vFaceNormalWs;
	            float _128 = p.flHitT;
	            int _127 = p.nInstance;
	            f16vec3 _126 = p.material.vNormalWs;
	            do
	            {
	                if (!(_127 != (-1)))
	                {
	                    _147 = false;
	                    break;
	                }
	                if (bValidSample)
	                {
	                    _148 = 1;
	                }
	                else
	                {
	                    _148 = 0;
	                }
	                uint _300 = uint(_148);
	                uint _140 = g_instanceBuffer._member0[uint(_127)].nMaterialFlags_nInstanceFlags;
	                vec3 _139 = (_132 + (_131 * _128)) + (_129 * ((abs(_132) + vec3(abs(_128))) * 9.9999997473787516355514526367188e-05));
	                vec3 _138 = _129;
	                int _137 = int(_140 & 65535u);
	                if ((_300 & 6u) != 0u)
	                {
	                    if ((_300 & 2u) != 0u)
	                    {
	                        _146 = (_137 & 256) != 0;
	                    }
	                    else
	                    {
	                        _146 = false;
	                    }
	                    if (_146)
	                    {
	                    }
	                    else
	                    {
	                        if ((_300 & 4u) != 0u)
	                        {
	                            _146 = (_137 & 512) != 0;
	                        }
	                        else
	                        {
	                            _146 = false;
	                        }
	                    }
	                }
	                if ((_300 & 1u) != 0u)
	                {
	                    _146 = any(notEqual(_130, vec3(3.4028234663852885981170418348452e+38)));
	                }
	                else
	                {
	                    _146 = false;
	                }
	                vec3 _363 = _130 - _139;
	                float _364 = length(_363);
	                vec3 _143 = _139;
	                float _142 = 0.0;
	                vec3 _141 = vec4(_363 / vec3(_364), _364).xyz;
	                if (_146)
	                {
	                    _145 = _364;
	                }
	                else
	                {
	                    _145 = 0.0;
	                }
	                p_1 = PayloadShadow_t(1.0);
	                traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _143, _142, _141, _145, 1);
	                if (_146)
	                {
	                    _145 = p_1.m_flVisibility;
	                }
	                else
	                {
	                    _145 = 0.0;
	                }
	                if (_145 == 1.0)
	                {
	                    _139 = _130;
	                    _138 = vec3(_126);
	                }
	                uint _144 = g_instanceBuffer._member0[uint(_127)].nMaterialFlags_nInstanceFlags;
	                if ((int((_144 >> uint(16)) & 65535u) & 1) != 0)
	                {
	                    _147 = false;
	                    break;
	                }
	                if ((int(_144 & 65535u) & 4096) != 0)
	                {
	                    _147 = false;
	                    break;
	                }
	                _147 = dot(_260, _138) > 0.0;
	                break;
	            } while(false);
	            if (_147)
	            {
	                int nBackfacesSeen_1 = nBackfacesSeen + 1;
	                if (float(nBackfacesSeen_1) > 12.80000019073486328125)
	                {
	                    bValidSample_1 = false;
	                }
	                else
	                {
	                    bValidSample_1 = bValidSample;
	                }
	                bValidSample = bValidSample_1;
	                nBackfacesSeen = nBackfacesSeen_1;
	            }
	            i++;
	            continue;
	        }
	        if (!bValidSample)
	        {
	            nFlags |= 1u;
	        }
	        g_SolidMask._member0[nIdx] = nFlags;
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
