//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Farfield lpv computation";
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
	DynamicCombo( D_FARFIELD_PASS, 0..1 );
	
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
	
	struct FarfieldBrick_t_natural
	{
	    ivec3 m_vCellOffset;
	    uint m_nLevel;
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
	
	layout(set = 6, binding = 162, std430) buffer RWStructuredBuffer
	{
	    FarfieldBrick_t_natural _member0[];
	} g_Bricks;
	
	layout(set = 6, binding = 159, std430) buffer g_SolidMaskBits
	{
	    uint _member0[];
	} g_SolidMaskBits_1;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 6, binding = 163, std430) buffer g_UnsignedDistance
	{
	    float _member0[];
	} g_UnsignedDistance_1;
	
	layout(push_constant, std430) uniform FarfieldPushConstants_t_natural
	{
	    int m_nEstimate;
	    int m_nDimensionCount;
	    int m_nFilterRadius;
	    int m_nFirstBrick;
	    int m_nWriteDistance;
	    int m_nRayCount;
	    uint m_nInstanceFlags;
	    int m_nPad;
	    uvec4 m_vCellCount;
	    layout(row_major) mat4x3 m_mCellToWorld;
	} g_PushConstants;
	
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	
	void main()
	{
	    do
	    {
	        uint nBrick = uint(g_PushConstants.m_nFirstBrick) + gl_LaunchIDEXT.z;
	        uint _191 = gl_LaunchIDEXT.x + (gl_LaunchIDEXT.y * 512u);
	        ivec3 _162 = g_Bricks._member0[nBrick].m_vCellOffset;
	        uint _161 = g_Bricks._member0[nBrick].m_nLevel;
	        uvec3 _177;
	        uvec3 _198 = _177;
	        _198.x = _191 % 32u;
	        uint _200 = _191 / 32u;
	        _198.y = _200 % 32u;
	        _198.z = _200 / 32u;
	        _177 = _198;
	        vec3 _205 = vec3(_198);
	        vec3 _176;
	        do
	        {
	            if (_161 == 7u)
	            {
	                _176 = _205 * (vec3(g_PushConstants.m_vCellCount.xyz) * vec3(0.03125));
	                break;
	            }
	            _176 = vec3(_162) + (_205 * (float(1u << _161) * 0.03125));
	            break;
	        } while(false);
	        vec3 _229 = g_PushConstants.m_mCellToWorld * vec4(_176, 1.0);
	        uvec3 _232 = uvec3(clamp(ivec3(_198), ivec3(0), ivec3(31)));
	        uint _241 = (nBrick * 32768u) + (_232.x + (32u * (_232.y + (32u * _232.z))));
	        bool _248 = ((g_SolidMaskBits_1._member0[_241 >> uint(5)] >> (_241 & 31u)) & 1u) != 0u;
	        if (subgroupAll(_248))
	        {
	            break;
	        }
	        int _254 = max(1, g_PushConstants.m_nRayCount);
	        uvec2 _262 = (uvec2((nBrick * 32768u) + _191, uint(g_PushConstants.m_nEstimate)) * uvec2(1664525u)) + uvec2(1013904223u);
	        _262.x = _262.x + (_262.y * 1664525u);
	        _262.y = _262.y + (_262.x * 1664525u);
	        uvec2 _274 = _262 ^ (_262 >> uvec2(16u));
	        _274.x = _274.x + (_274.y * 1664525u);
	        _274.y = _274.y + (_274.x * 1664525u);
	        vec2 _288 = vec2(_274 ^ (_274 >> uvec2(16u))) * vec2(2.3283064365386962890625e-10);
	        bool bValidSample = !_248;
	        float fMinHitT = 56755.83984375;
	        int i = 0;
	        int nBackfacesSeen = 0;
	        bool bValidSample_1;
	        float fMinHitT_1;
	        int nBackfacesSeen_1;
	        vec3 _163;
	        float _172;
	        bool _173;
	        bool _174;
	        int _175;
	        bool _178;
	        float _179;
	        SPIRV_CROSS_LOOP
	        for (;;)
	        {
	            if (i < _254)
	            {
	                _178 = bValidSample;
	            }
	            else
	            {
	                _178 = false;
	            }
	            if (!_178)
	            {
	                break;
	            }
	            vec2 _312 = fract(_288 + (vec2(float(i * 12664745), float(i * 9560333)) * vec2(5.9604644775390625e-08)));
	            float _313 = _312.y;
	            float _318 = 2.0 * sqrt(max(0.0, _313 - (_313 * _313)));
	            float _320 = 6.283185482025146484375 * _312.x;
	            vec3 _327 = vec3(cos(_320) * _318, sin(_320) * _318, 1.0 - (2.0 * _313));
	            vec3 _160 = _229.xyz;
	            float _159 = 0.0;
	            vec3 _158 = _327;
	            if (bValidSample)
	            {
	                _179 = 56755.83984375;
	            }
	            else
	            {
	                _179 = 0.0;
	            }
	            f16vec3 _334 = f16vec3(vec3(0.0));
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _163, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_334, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _334, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	            traceRayEXT(g_AccelStruct, 0u, g_PushConstants.m_nInstanceFlags, 0u, 2u, 0u, _160, _159, _158, _179, 0);
	            if (p.nInstance != (-1))
	            {
	                vec3 _157 = _160;
	                vec3 _156 = _158;
	                vec3 _155 = p.vSmoothPositionWs;
	                vec3 _154 = p.vFaceNormalWs;
	                float _153 = p.flHitT;
	                int _152 = p.nInstance;
	                f16vec3 _151 = p.material.vNormalWs;
	                do
	                {
	                    if (!(_152 != (-1)))
	                    {
	                        _174 = false;
	                        break;
	                    }
	                    if (bValidSample)
	                    {
	                        _175 = 1;
	                    }
	                    else
	                    {
	                        _175 = 0;
	                    }
	                    uint _383 = uint(_175);
	                    uint _167 = g_instanceBuffer._member0[uint(_152)].nMaterialFlags_nInstanceFlags;
	                    vec3 _166 = (_157 + (_156 * _153)) + (_154 * ((abs(_157) + vec3(abs(_153))) * 9.9999997473787516355514526367188e-05));
	                    vec3 _165 = _154;
	                    int _164 = int(_167 & 65535u);
	                    if ((_383 & 6u) != 0u)
	                    {
	                        if ((_383 & 2u) != 0u)
	                        {
	                            _173 = (_164 & 256) != 0;
	                        }
	                        else
	                        {
	                            _173 = false;
	                        }
	                        if (_173)
	                        {
	                        }
	                        else
	                        {
	                            if ((_383 & 4u) != 0u)
	                            {
	                                _173 = (_164 & 512) != 0;
	                            }
	                            else
	                            {
	                                _173 = false;
	                            }
	                        }
	                    }
	                    if ((_383 & 1u) != 0u)
	                    {
	                        _173 = any(notEqual(_155, vec3(3.4028234663852885981170418348452e+38)));
	                    }
	                    else
	                    {
	                        _173 = false;
	                    }
	                    vec3 _446 = _155 - _166;
	                    float _447 = length(_446);
	                    vec3 _170 = _166;
	                    float _169 = 0.0;
	                    vec3 _168 = vec4(_446 / vec3(_447), _447).xyz;
	                    if (_173)
	                    {
	                        _172 = _447;
	                    }
	                    else
	                    {
	                        _172 = 0.0;
	                    }
	                    p_1 = PayloadShadow_t(1.0);
	                    traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _170, _169, _168, _172, 1);
	                    if (_173)
	                    {
	                        _172 = p_1.m_flVisibility;
	                    }
	                    else
	                    {
	                        _172 = 0.0;
	                    }
	                    if (_172 == 1.0)
	                    {
	                        _166 = _155;
	                        _165 = vec3(_151);
	                    }
	                    uint _171 = g_instanceBuffer._member0[uint(_152)].nMaterialFlags_nInstanceFlags;
	                    if ((int((_171 >> uint(16)) & 65535u) & 1) != 0)
	                    {
	                        _174 = false;
	                        break;
	                    }
	                    if ((int(_171 & 65535u) & 4096) != 0)
	                    {
	                        _174 = false;
	                        break;
	                    }
	                    _174 = dot(_327, _165) > 0.0;
	                    break;
	                } while(false);
	                if (_174)
	                {
	                    int nBackfacesSeen_2 = nBackfacesSeen + 1;
	                    if (float(nBackfacesSeen_2) > (0.4000000059604644775390625 * float(_254)))
	                    {
	                        bValidSample_1 = false;
	                    }
	                    else
	                    {
	                        bValidSample_1 = bValidSample;
	                    }
	                    nBackfacesSeen_1 = nBackfacesSeen_2;
	                }
	                else
	                {
	                    bValidSample_1 = bValidSample;
	                    nBackfacesSeen_1 = nBackfacesSeen;
	                }
	                fMinHitT_1 = min(fMinHitT, p.flHitT);
	                nBackfacesSeen = nBackfacesSeen_1;
	            }
	            else
	            {
	                bValidSample_1 = bValidSample;
	                fMinHitT_1 = fMinHitT;
	            }
	            bValidSample = bValidSample_1;
	            fMinHitT = fMinHitT_1;
	            i++;
	            continue;
	        }
	        if (!bValidSample)
	        {
	            uint _531 = (nBrick * 32768u) + (_198.x + (32u * (_198.y + (32u * _198.z))));
	            uint _536 = atomicOr(g_SolidMaskBits_1._member0[_531 >> uint(5)], 1u << (_531 & 31u));
	        }
	        do
	        {
	            if (g_PushConstants.m_nWriteDistance == 0)
	            {
	                break;
	            }
	            uint _553 = (nBrick * 32768u) + (_198.x + (32u * (_198.y + (32u * _198.z))));
	            g_UnsignedDistance_1._member0[_553] = min(g_UnsignedDistance_1._member0[_553], fMinHitT);
	            break;
	        } while(false);
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
