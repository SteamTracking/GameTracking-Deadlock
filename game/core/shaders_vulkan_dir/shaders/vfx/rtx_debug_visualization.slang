//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Debug visualization for various ray traced properties";
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
	DynamicCombo( D_DEBUG_MODE, 0..13 );
	
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
	#extension GL_EXT_shader_image_load_formatted : require
	
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
	
	struct SceneGlobalInfoGPU_t_natural
	{
	    vec4 m_vSkyColor;
	    vec4 m_vSkyAmbientBounce;
	    vec4 m_vSunLightIrradiance;
	    vec4 m_vLocalLightMinBounds;
	    vec4 m_vLocalLightMaxBounds;
	    ivec4 m_vLightBinCellCount_nLightCount;
	    mat4x3 m_mIBLTransformI;
	    vec4 m_vIBLCubeMapScale;
	    int m_nIBLTexture;
	    int m_nIBLCubeMap;
	    int m_nIBLCubeMapFormat;
	    uint m_nSkyLightFlags;
	    int m_nBrdfLut;
	    int m_nBrdfMultiscatterLut;
	    uint m_nSceneGlobalInfoFlags;
	    uint _unused0;
	};
	
	vec4 _153;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 3, binding = 37, std430) readonly buffer g_SceneGlobalInfo
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo_1;
	
	layout(push_constant, std430) uniform PushConstants_t_t_natural
	{
	    layout(row_major) mat4 m_mInvViewProj;
	    vec4 m_vCameraOrigin;
	    vec4 m_vRandomOffsets;
	    ivec4 m_nIntParams;
	} PushConstants_t;
	
	layout(set = 6, binding = 158) uniform image2D g_OutputImage;
	layout(set = 6, binding = 161) uniform readonly image3D g_RandomSamples;
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube[65536];
	layout(set = 3, binding = 14) uniform sampler g_Sampler;
	layout(set = 6, binding = 159) uniform image2D g_VarianceImage;
	
	void main()
	{
	    vec2 _230 = (((vec2(gl_LaunchIDEXT.xy) + PushConstants_t.m_vRandomOffsets.xy) / vec2(gl_LaunchSizeEXT.xy)) * 2.0) - vec2(1.0);
	    _230.y = -_230.y;
	    vec4 _236 = PushConstants_t.m_mInvViewProj * vec4(_230.xy, 0.0, 1.0);
	    vec3 _240 = _236.xyz / vec3(_236.w);
	    vec4 _242;
	    _242.x = _240.x;
	    _242.y = _240.y;
	    _242.z = _240.z;
	    vec3 _251 = normalize(_242.xyz - PushConstants_t.m_vCameraOrigin.xyz);
	    vec4 vCurrentSample;
	    if (PushConstants_t.m_nIntParams.y > 0)
	    {
	        vCurrentSample = imageLoad(g_OutputImage, ivec2(gl_LaunchIDEXT.xy));
	    }
	    else
	    {
	        vCurrentSample = vec4(0.0);
	    }
	    uvec3 _266 = uvec3(imageSize(g_RandomSamples));
	    ivec3 _212;
	    ivec3 _269 = _212;
	    _269.x = int(_266.x);
	    _269.y = int(_266.y);
	    _269.z = int(_266.z);
	    _212 = _269;
	    ivec2 _278 = ivec2(gl_LaunchIDEXT.xy) - _269.xy * (ivec2(gl_LaunchIDEXT.xy) / _269.xy);
	    f16vec3 _285 = f16vec3(vec3(0.0));
	    vec3 _183;
	    p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _183, 3.4028234663852885981170418348452e+38, imageLoad(g_RandomSamples, ivec3(_278.xy, 1)).xy.y, -1, false, MaterialDataMinimal_t(_285, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _285, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	    traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, PushConstants_t.m_vCameraOrigin.xyz, 0.0, _251, 56755.83984375, 0);
	    vec3 _182 = p.vSmoothPositionWs;
	    vec3 _181 = p.vFaceNormalWs;
	    float _180 = p.flHitT;
	    int _179 = p.nInstance;
	    f16vec3 _162 = p.material.vNormalWs;
	    float16_t _161 = p.material.flMetalness;
	    f16vec3 _160 = p.material.vAlbedo;
	    float16_t _159 = p.material.flRoughness;
	    f16vec3 _158 = p.material.vEmissive;
	    float16_t _157 = p.material.flReflectance;
	    uint _156 = p.material.nMaterialTypeAndFlags;
	    f16vec4 _155 = p.material.vMaterialBits;
	    vec3 vNewSample;
	    if (p.nInstance != (-1))
	    {
	        vec3 _178 = PushConstants_t.m_vCameraOrigin.xyz;
	        vec3 _177 = _251;
	        do
	        {
	            vec3 _186 = _182;
	            vec3 _185 = _181;
	            float _184 = _180;
	            f16vec3 _171 = _162;
	            uint _190 = g_instanceBuffer._member0[uint(_179)].nMaterialFlags_nInstanceFlags;
	            vec3 _189 = (_178 + (_177 * _184)) + (_185 * ((abs(_178) + vec3(abs(_184))) * 9.9999997473787516355514526367188e-05));
	            vec3 _188 = _185;
	            int _187 = int(_190 & 65535u);
	            bool _211;
	            if (false)
	            {
	                if (false)
	                {
	                    _211 = (_187 & 256) != 0;
	                }
	                else
	                {
	                    _211 = false;
	                }
	                if (_211)
	                {
	                }
	                else
	                {
	                    if (false)
	                    {
	                        _211 = (_187 & 512) != 0;
	                    }
	                    else
	                    {
	                        _211 = false;
	                    }
	                }
	            }
	            if (false)
	            {
	                _211 = any(notEqual(_186, vec3(3.4028234663852885981170418348452e+38)));
	            }
	            else
	            {
	                _211 = false;
	            }
	            vec3 _383 = _186 - _189;
	            float _384 = length(_383);
	            vec3 _193 = _189;
	            float _192 = 0.0;
	            vec3 _191 = vec4(_383 / vec3(_384), _384).xyz;
	            float _210;
	            if (_211)
	            {
	                _210 = _384;
	            }
	            else
	            {
	                _210 = 0.0;
	            }
	            p_1 = PayloadShadow_t(1.0);
	            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _193, _192, _191, _210, 1);
	            if (_211)
	            {
	                _210 = p_1.m_flVisibility;
	            }
	            else
	            {
	                _210 = 0.0;
	            }
	            if (_210 == 1.0)
	            {
	                _189 = _186;
	                _188 = vec3(_171);
	            }
	            vec3 _194;
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _194, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_162, _161, _160, _159, _158, _157, _156, _155));
	            traceRayEXT(g_AccelStruct, 32u, 32u, 0u, 2u, 0u, _189 - ((_188 * 0.5) * 0.5), 0.0, _188, 0.5, 0);
	            f16vec3 _170 = p.material.vNormalWs;
	            float16_t _169 = p.material.flMetalness;
	            f16vec3 _168 = p.material.vAlbedo;
	            float16_t _167 = p.material.flRoughness;
	            f16vec3 _166 = p.material.vEmissive;
	            float16_t _165 = p.material.flReflectance;
	            uint _164 = p.material.nMaterialTypeAndFlags;
	            f16vec4 _163 = p.material.vMaterialBits;
	            if (p.nInstance != (-1))
	            {
	                _162 = _170;
	                _161 = _169;
	                _160 = _168;
	                _159 = _167;
	                _158 = _166;
	                _157 = _165;
	                _156 = _164;
	                _155 = _163;
	                break;
	            }
	            else
	            {
	                break;
	            }
	            break;
	        } while(false);
	        vec3 _176 = PushConstants_t.m_vCameraOrigin.xyz;
	        vec3 _175 = _251;
	        vec3 _174 = _182;
	        vec3 _173 = _181;
	        float _172 = _180;
	        uint _197 = g_instanceBuffer._member0[uint(_179)].nMaterialFlags_nInstanceFlags;
	        vec3 _196 = (_176 + (_175 * _172)) + (_173 * ((abs(_176) + vec3(abs(_172))) * 9.9999997473787516355514526367188e-05));
	        int _195 = int(_197 & 65535u);
	        bool _209;
	        if (false)
	        {
	            if (false)
	            {
	                _209 = (_195 & 256) != 0;
	            }
	            else
	            {
	                _209 = false;
	            }
	            if (_209)
	            {
	            }
	            else
	            {
	                if (false)
	                {
	                    _209 = (_195 & 512) != 0;
	                }
	                else
	                {
	                    _209 = false;
	                }
	            }
	        }
	        if (true)
	        {
	            _209 = any(notEqual(_174, vec3(3.4028234663852885981170418348452e+38)));
	        }
	        else
	        {
	            _209 = false;
	        }
	        vec3 _514 = _174 - _196;
	        float _515 = length(_514);
	        vec3 _200 = _196;
	        float _199 = 0.0;
	        vec3 _198 = vec4(_514 / vec3(_515), _515).xyz;
	        float _208;
	        if (_209)
	        {
	            _208 = _515;
	        }
	        else
	        {
	            _208 = 0.0;
	        }
	        p_1 = PayloadShadow_t(1.0);
	        traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _200, _199, _198, _208, 1);
	        if (_209)
	        {
	            _208 = p_1.m_flVisibility;
	        }
	        else
	        {
	            _208 = 0.0;
	        }
	        if (_208 == 1.0)
	        {
	            _196 = _174;
	        }
	        vNewSample = vec3(_160);
	    }
	    else
	    {
	        vec3 _202;
	        do
	        {
	            vec2 _203 = imageLoad(g_RandomSamples, ivec3(_278.xy, 2)).xy;
	            if ((g_SceneGlobalInfo_1._member0[0].m_nSkyLightFlags & 1u) == 0u)
	            {
	                _202 = vec3(0.0);
	                break;
	            }
	            bool _204;
	            if (_251.z < 0.0)
	            {
	                float _205 = _203.y;
	                bool _201;
	                do
	                {
	                    if (g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w <= 0.0)
	                    {
	                        _201 = false;
	                        break;
	                    }
	                    if (g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w >= 1.0)
	                    {
	                        _201 = true;
	                        break;
	                    }
	                    if (_205 < g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w)
	                    {
	                        _205 = min(_205 / g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w, 0.99999988079071044921875);
	                        _201 = true;
	                        break;
	                    }
	                    _205 = min((_205 - g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w) / (1.0 - g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w), 0.99999988079071044921875);
	                    _201 = false;
	                    break;
	                } while(false);
	                vec2 _587 = _203;
	                _587.y = _205;
	                _203 = _587;
	                _204 = _201;
	            }
	            else
	            {
	                _204 = false;
	            }
	            vec3 _206;
	            vec3 _207;
	            if (_204)
	            {
	                float _595 = sqrt(_203.y);
	                float _597 = 6.283185482025146484375 * _203.x;
	                _206 = vec3(cos(_597) * _595, sin(_597) * _595, sqrt(max(0.0, 1.0 - _203.y)));
	                _207 = g_SceneGlobalInfo_1._member0[0].m_vSunLightIrradiance.xyz;
	            }
	            else
	            {
	                _206 = _251;
	                _207 = vec3(0.0);
	            }
	            if (g_SceneGlobalInfo_1._member0[0].m_nIBLCubeMap >= 0)
	            {
	                vec4 _636 = textureLod(samplerCube(g_bindless_TextureCube[g_SceneGlobalInfo_1._member0[0].m_nIBLCubeMap], g_Sampler), normalize(g_SceneGlobalInfo_1._member0[0].m_mIBLTransformI * vec4(_206, 0.0)), 0.0);
	                if (dot(_636.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) < g_SceneGlobalInfo_1._member0[0].m_vSunLightIrradiance.w)
	                {
	                    _207 += (g_SceneGlobalInfo_1._member0[0].m_vIBLCubeMapScale.xyz * _636.xyz);
	                }
	            }
	            else
	            {
	                _207 += g_SceneGlobalInfo_1._member0[0].m_vSkyColor.xyz;
	            }
	            if (false)
	            {
	                _207 *= g_SceneGlobalInfo_1._member0[0].m_vIBLCubeMapScale.w;
	            }
	            if (_204)
	            {
	                _207 *= g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.xyz;
	            }
	            _202 = _207;
	            break;
	        } while(false);
	        vNewSample = _202;
	    }
	    vec4 _680 = vec4(mix(vCurrentSample.xyz, vNewSample, vec3(1.0 / (1.0 + vCurrentSample.w))), 1.0 + vCurrentSample.w);
	    imageStore(g_OutputImage, ivec2(gl_LaunchIDEXT.xy), _680);
	    vec2 _213;
	    if (PushConstants_t.m_nIntParams.y == 0)
	    {
	        _213 = vec2(0.0);
	    }
	    else
	    {
	        _213 = imageLoad(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy)).xy;
	    }
	    float _697 = dot(vNewSample.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    float _702 = _697 - _213.x;
	    float _704 = _213.x + (_702 / _680.w);
	    imageStore(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy), vec4(vec2(_704, _213.y + (_702 * (_697 - _704))), 0.0, 0.0));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
