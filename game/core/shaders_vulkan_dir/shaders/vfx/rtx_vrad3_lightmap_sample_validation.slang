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
	
	struct LightmapSample_t_natural
	{
	    vec4 m_vPositionWs;
	    vec4 m_vShadingNormalWs_vTransmissiveR;
	    vec4 m_vInterpolatedNormalWs_vTransmissiveG;
	    vec4 m_vFaceNormalWs_vTransmissiveB;
	    vec4 m_vTangentWs;
	    vec2 m_vLightmapUv;
	    int m_nInstanceFlags;
	    uint m_nSampleFlags;
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
	
	layout(set = 6, binding = 158, std430) buffer RWStructuredBuffer
	{
	    LightmapSample_t_natural _member0[];
	} g_LightmapSamples;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	
	void main()
	{
	    uint nSample = (gl_LaunchIDEXT.y * gl_LaunchSizeEXT.x) + gl_LaunchIDEXT.x;
	    vec4 _154 = g_LightmapSamples._member0[nSample].m_vPositionWs;
	    vec4 _153 = g_LightmapSamples._member0[nSample].m_vShadingNormalWs_vTransmissiveR;
	    vec4 _152 = g_LightmapSamples._member0[nSample].m_vInterpolatedNormalWs_vTransmissiveG;
	    vec4 _151 = g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB;
	    vec4 _150 = g_LightmapSamples._member0[nSample].m_vTangentWs;
	    vec2 _149 = g_LightmapSamples._member0[nSample].m_vLightmapUv;
	    int _148 = g_LightmapSamples._member0[nSample].m_nInstanceFlags;
	    uint _147 = g_LightmapSamples._member0[nSample].m_nSampleFlags;
	    vec4 _162 = g_LightmapSamples._member0[nSample].m_vPositionWs;
	    vec4 _161 = g_LightmapSamples._member0[nSample].m_vShadingNormalWs_vTransmissiveR;
	    vec4 _160 = g_LightmapSamples._member0[nSample].m_vInterpolatedNormalWs_vTransmissiveG;
	    vec4 _159 = g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB;
	    vec4 _158 = g_LightmapSamples._member0[nSample].m_vTangentWs;
	    vec2 _157 = g_LightmapSamples._member0[nSample].m_vLightmapUv;
	    int _156 = g_LightmapSamples._member0[nSample].m_nInstanceFlags;
	    uint _155 = g_LightmapSamples._member0[nSample].m_nSampleFlags;
	    float _206;
	    if (g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.z >= 0.0)
	    {
	        _206 = 1.0;
	    }
	    else
	    {
	        _206 = -1.0;
	    }
	    float _239 = (-1.0) / (_206 + g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.z);
	    float _243 = (g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.x * g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.y) * _239;
	    vec3 vTangent1Ws;
	    vec3 _248 = vTangent1Ws;
	    _248.x = 1.0 + (((_206 * g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.x) * g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.x) * _239);
	    _248.y = _206 * _243;
	    _248.z = (-_206) * g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.x;
	    vTangent1Ws = _248;
	    vec3 vTangent2Ws;
	    vec3 _255 = vTangent2Ws;
	    _255.x = _243;
	    _255.y = _206 + ((g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.y * g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.y) * _239);
	    _255.z = -g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB.y;
	    vTangent2Ws = _255;
	    vec4 _263 = _162;
	    bool bValidSample_2 = _263.w != 0.0;
	    float _207;
	    if (bValidSample_2)
	    {
	        _207 = 12.0;
	    }
	    else
	    {
	        _207 = 0.0;
	    }
	    float _205 = _207;
	    vec4 _170 = _154;
	    vec4 _169 = _153;
	    vec4 _168 = _152;
	    vec4 _167 = _151;
	    vec4 _166 = _150;
	    vec2 _165 = _149;
	    int _164 = _148;
	    uint _163 = _147;
	    vec3 _279 = _151.xyz * 0.0078125;
	    vec3 _280 = _154.xyz - _279;
	    do
	    {
	        f16vec3 _284 = f16vec3(vec3(0.0));
	        vec3 _172;
	        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _172, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_284, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _284, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	        traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, _280, 0.0, _151.xyz, _205, 0);
	        if (!(p.nInstance != (-1)))
	        {
	            break;
	        }
	        vec3 _201;
	        if (p.bFlippedNormal)
	        {
	            _201 = -p.vFaceNormalWs;
	        }
	        else
	        {
	            _201 = p.vFaceNormalWs;
	        }
	        if (!(dot(_151.xyz, _201) > 0.0))
	        {
	            break;
	        }
	        float _202;
	        if (p.bFlippedNormal)
	        {
	            _202 = -1.0;
	        }
	        else
	        {
	            _202 = 1.0;
	        }
	        vec3 _345 = (_280 + (_151.xyz * p.flHitT)) + (p.vFaceNormalWs * ((abs(_280) + vec3(abs(p.flHitT))) * 9.9999997473787516355514526367188e-05));
	        float _349 = length(_345 - _154.xyz);
	        if (_349 < _205)
	        {
	            vec4 _355 = _170;
	            _355.x = _345.x;
	            _355.y = _345.y;
	            _355.z = _345.z;
	            _170 = _355;
	            vec3 _363 = vec3(p.material.vNormalWs) * _202;
	            vec4 _365 = _169;
	            _365.x = _363.x;
	            _365.y = _363.y;
	            _365.z = _363.z;
	            _169 = _365;
	            vec3 _372 = p.vInterpolatedNormalWs.xyz * _202;
	            vec4 _374 = _168;
	            _374.x = _372.x;
	            _374.y = _372.y;
	            _374.z = _372.z;
	            _168 = _374;
	            vec3 _380 = p.vFaceNormalWs * _202;
	            vec4 _382 = _167;
	            _382.x = _380.x;
	            _382.y = _380.y;
	            _382.z = _380.z;
	            _167 = _382;
	            uint _203;
	            if (p.nInstance >= 0)
	            {
	                uint _173 = g_instanceBuffer._member0[uint(p.nInstance)].nMaterialFlags_nInstanceFlags;
	                _203 = _173 & 65535u;
	            }
	            else
	            {
	                _203 = 0u;
	            }
	            _164 = int(_203);
	            _205 = _349;
	            f16vec4 _171 = p.material.vMaterialBits;
	            bool _200;
	            if ((p.material.nMaterialTypeAndFlags & 65535u) == 1u)
	            {
	                _200 = any(greaterThan(vec3(_171.xyz), vec3(0.0)));
	            }
	            else
	            {
	                _200 = false;
	            }
	            vec3 _204;
	            if (_200)
	            {
	                _204 = vec3(p.material.vMaterialBits.xyz) / max(vec3(p.material.vAlbedo), vec3(0.100000001490116119384765625));
	            }
	            else
	            {
	                _204 = vec3(0.0);
	            }
	            vec4 _424 = _169;
	            _424.w = _204.x;
	            _169 = _424;
	            vec4 _427 = _168;
	            _427.w = _204.y;
	            _168 = _427;
	            vec4 _430 = _167;
	            _430.w = _204.z;
	            _167 = _430;
	        }
	        break;
	    } while(false);
	    vec3 _432 = _154.xyz + _279;
	    vec3 _433 = -_151.xyz;
	    do
	    {
	        f16vec3 _437 = f16vec3(vec3(0.0));
	        vec3 _175;
	        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _175, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_437, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _437, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	        traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, _432, 0.0, _433, _205, 0);
	        if (!(p.nInstance != (-1)))
	        {
	            break;
	        }
	        vec3 _196;
	        if (p.bFlippedNormal)
	        {
	            _196 = -p.vFaceNormalWs;
	        }
	        else
	        {
	            _196 = p.vFaceNormalWs;
	        }
	        if (!(dot(_151.xyz, _196) > 0.0))
	        {
	            break;
	        }
	        float _197;
	        if (p.bFlippedNormal)
	        {
	            _197 = -1.0;
	        }
	        else
	        {
	            _197 = 1.0;
	        }
	        vec3 _498 = (_432 + (_433 * p.flHitT)) + (p.vFaceNormalWs * ((abs(_432) + vec3(abs(p.flHitT))) * 9.9999997473787516355514526367188e-05));
	        float _502 = length(_498 - _154.xyz);
	        if (_502 < _205)
	        {
	            vec4 _508 = _170;
	            _508.x = _498.x;
	            _508.y = _498.y;
	            _508.z = _498.z;
	            _170 = _508;
	            vec3 _516 = vec3(p.material.vNormalWs) * _197;
	            vec4 _518 = _169;
	            _518.x = _516.x;
	            _518.y = _516.y;
	            _518.z = _516.z;
	            _169 = _518;
	            vec3 _525 = p.vInterpolatedNormalWs.xyz * _197;
	            vec4 _527 = _168;
	            _527.x = _525.x;
	            _527.y = _525.y;
	            _527.z = _525.z;
	            _168 = _527;
	            vec3 _533 = p.vFaceNormalWs * _197;
	            vec4 _535 = _167;
	            _535.x = _533.x;
	            _535.y = _533.y;
	            _535.z = _533.z;
	            _167 = _535;
	            uint _198;
	            if (p.nInstance >= 0)
	            {
	                uint _176 = g_instanceBuffer._member0[uint(p.nInstance)].nMaterialFlags_nInstanceFlags;
	                _198 = _176 & 65535u;
	            }
	            else
	            {
	                _198 = 0u;
	            }
	            _164 = int(_198);
	            _205 = _502;
	            f16vec4 _174 = p.material.vMaterialBits;
	            bool _195;
	            if ((p.material.nMaterialTypeAndFlags & 65535u) == 1u)
	            {
	                _195 = any(greaterThan(vec3(_174.xyz), vec3(0.0)));
	            }
	            else
	            {
	                _195 = false;
	            }
	            vec3 _199;
	            if (_195)
	            {
	                _199 = vec3(p.material.vMaterialBits.xyz) / max(vec3(p.material.vAlbedo), vec3(0.100000001490116119384765625));
	            }
	            else
	            {
	                _199 = vec3(0.0);
	            }
	            vec4 _577 = _169;
	            _577.w = _199.x;
	            _169 = _577;
	            vec4 _580 = _168;
	            _580.w = _199.y;
	            _168 = _580;
	            vec4 _583 = _167;
	            _583.w = _199.z;
	            _167 = _583;
	        }
	        break;
	    } while(false);
	    _162 = _170;
	    _161 = _169;
	    _160 = _168;
	    _159 = _167;
	    _158 = _166;
	    _157 = _165;
	    _156 = _164;
	    _155 = _163;
	    do
	    {
	        vec3 _178 = _162.xyz;
	        vec3 _177 = _159.xyz;
	        f16vec3 _599 = f16vec3(vec3(0.0));
	        vec3 _179;
	        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _179, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_599, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _599, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	        traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, _162.xyz, 0.0, _159.xyz, 1.0, 0);
	        if (!(p.nInstance != (-1)))
	        {
	            break;
	        }
	        vec3 _626 = (_178 + (_177 * p.flHitT)) + (_159.xyz * ((abs(_178) + vec3(abs(p.flHitT))) * 9.9999997473787516355514526367188e-05));
	        vec4 _628 = _162;
	        _628.x = _626.x;
	        _628.y = _626.y;
	        _628.z = _626.z;
	        _162 = _628;
	        break;
	    } while(false);
	    bool bValidSample = bValidSample_2;
	    int i = 0;
	    int nBackfacesSeen = 0;
	    bool bValidSample_1;
	    vec3 _180;
	    vec3 _190;
	    float _191;
	    bool _192;
	    bool _193;
	    int _194;
	    for (;;)
	    {
	        bool _638_ladder_break = false;
	        do
	        {
	            if (!(i < 8))
	            {
	                _638_ladder_break = true;
	                break;
	            }
	            if (!bValidSample)
	            {
	                _638_ladder_break = true;
	                break;
	            }
	            if ((nBackfacesSeen + (8 - i)) <= 2)
	            {
	                _638_ladder_break = true;
	                break;
	            }
	            uint _655 = uint(i);
	            uint _660 = (_655 << 16u) | (_655 >> 16u);
	            uint _665 = ((_660 & 1431655765u) << 1u) | ((_660 & 2863311530u) >> 1u);
	            uint _670 = ((_665 & 858993459u) << 2u) | ((_665 & 3435973836u) >> 2u);
	            uint _675 = ((_670 & 252645135u) << 4u) | ((_670 & 4042322160u) >> 4u);
	            vec2 _683 = vec2(float(_655) * 0.125, float(((_675 & 16711935u) << 8u) | ((_675 & 4278255360u) >> 8u)) * 2.3283064365386962890625e-10);
	            float _684 = _683.y;
	            float _685 = sqrt(_684);
	            float _687 = 6.283185482025146484375 * _683.x;
	            vec3 _701 = mat3(vTangent1Ws, vTangent2Ws, _159.xyz) * vec3(cos(_687) * _685, sin(_687) * _685, sqrt(max(0.0, 1.0 - _684)));
	            vec3 _146 = _162.xyz;
	            vec3 _145 = _701;
	            f16vec3 _704 = f16vec3(vec3(0.0));
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _180, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_704, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _704, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	            traceRayEXT(g_AccelStruct, 0u, 16u, 0u, 2u, 0u, _162.xyz, 0.0, _701, 56755.83984375, 0);
	            float _729 = p.flHitT;
	            float flRng = p.flOpacityRng;
	            vec3 _144 = _162.xyz;
	            vec3 _143 = _701;
	            vec3 _142 = p.vSmoothPositionWs;
	            vec3 _141 = p.vFaceNormalWs;
	            float _140 = p.flHitT;
	            int _139 = p.nInstance;
	            f16vec3 _138 = p.material.vNormalWs;
	            do
	            {
	                if (!(_139 != (-1)))
	                {
	                    _193 = false;
	                    break;
	                }
	                if (bValidSample)
	                {
	                    _194 = 1;
	                }
	                else
	                {
	                    _194 = 0;
	                }
	                uint _742 = uint(_194);
	                uint _184 = g_instanceBuffer._member0[uint(_139)].nMaterialFlags_nInstanceFlags;
	                vec3 _183 = (_144 + (_143 * _140)) + (_141 * ((abs(_144) + vec3(abs(_140))) * 9.9999997473787516355514526367188e-05));
	                vec3 _182 = _141;
	                int _181 = int(_184 & 65535u);
	                if ((_742 & 6u) != 0u)
	                {
	                    if ((_742 & 2u) != 0u)
	                    {
	                        _192 = (_181 & 256) != 0;
	                    }
	                    else
	                    {
	                        _192 = false;
	                    }
	                    if (_192)
	                    {
	                    }
	                    else
	                    {
	                        if ((_742 & 4u) != 0u)
	                        {
	                            _192 = (_181 & 512) != 0;
	                        }
	                        else
	                        {
	                            _192 = false;
	                        }
	                    }
	                }
	                if ((_742 & 1u) != 0u)
	                {
	                    _192 = any(notEqual(_142, vec3(3.4028234663852885981170418348452e+38)));
	                }
	                else
	                {
	                    _192 = false;
	                }
	                vec3 _805 = _142 - _183;
	                float _806 = length(_805);
	                vec3 _187 = _183;
	                float _186 = 0.0;
	                vec3 _185 = vec4(_805 / vec3(_806), _806).xyz;
	                if (_192)
	                {
	                    _191 = _806;
	                }
	                else
	                {
	                    _191 = 0.0;
	                }
	                p_1 = PayloadShadow_t(1.0);
	                traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _187, _186, _185, _191, 1);
	                if (_192)
	                {
	                    _191 = p_1.m_flVisibility;
	                }
	                else
	                {
	                    _191 = 0.0;
	                }
	                if (_191 == 1.0)
	                {
	                    _183 = _142;
	                    _182 = vec3(_138);
	                }
	                uint _188 = g_instanceBuffer._member0[uint(_139)].nMaterialFlags_nInstanceFlags;
	                if ((int((_188 >> uint(16)) & 65535u) & 1) != 0)
	                {
	                    _193 = false;
	                    break;
	                }
	                if ((int(_188 & 65535u) & 4096) != 0)
	                {
	                    _193 = false;
	                    break;
	                }
	                _193 = dot(_701, _182) > 0.0;
	                break;
	            } while(false);
	            if (!_193)
	            {
	                break;
	            }
	            if (p.nInstance != (-1))
	            {
	                uint _189 = g_instanceBuffer._member0[uint(p.nInstance)].nMaterialFlags_nInstanceFlags;
	                if (!((int(_189 & 65535u) & 6) != 0))
	                {
	                    break;
	                }
	            }
	            f16vec3 _881 = f16vec3(vec3(0.0));
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _190, 3.4028234663852885981170418348452e+38, flRng, -1, false, MaterialDataMinimal_t(_881, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _881, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	            traceRayEXT(g_AccelStruct, 16u, 16u, 0u, 2u, 0u, _146, _729 * 0.99989998340606689453125, _145, _729 * 1.00010001659393310546875, 0);
	            flRng = p.flOpacityRng;
	            if (p.nInstance != (-1))
	            {
	                break;
	            }
	            int nBackfacesSeen_1 = nBackfacesSeen + 1;
	            if (nBackfacesSeen_1 > 2)
	            {
	                bValidSample_1 = false;
	            }
	            else
	            {
	                bValidSample_1 = bValidSample;
	            }
	            bValidSample = bValidSample_1;
	            nBackfacesSeen = nBackfacesSeen_1;
	            break;
	        } while(false);
	        if (_638_ladder_break)
	        {
	            break;
	        }
	        i++;
	        continue;
	    }
	    if (!bValidSample)
	    {
	        _162 = vec4(0.0);
	        _161 = vec4(0.0);
	        _160 = vec4(0.0);
	        _159 = vec4(0.0);
	        _158 = vec4(0.0);
	        _156 = 0;
	        _155 = 0u;
	    }
	    g_LightmapSamples._member0[nSample].m_vPositionWs = _162;
	    g_LightmapSamples._member0[nSample].m_vShadingNormalWs_vTransmissiveR = _161;
	    g_LightmapSamples._member0[nSample].m_vInterpolatedNormalWs_vTransmissiveG = _160;
	    g_LightmapSamples._member0[nSample].m_vFaceNormalWs_vTransmissiveB = _159;
	    g_LightmapSamples._member0[nSample].m_vTangentWs = _158;
	    g_LightmapSamples._member0[nSample].m_vLightmapUv = _157;
	    g_LightmapSamples._member0[nSample].m_nInstanceFlags = _156;
	    g_LightmapSamples._member0[nSample].m_nSampleFlags = _155;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
