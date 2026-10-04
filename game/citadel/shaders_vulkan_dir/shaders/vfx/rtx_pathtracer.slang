//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Sampled path tracer, to be used for baked lighting or general path tracing";
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
	DynamicCombo( D_DIRECT_LIGHT, 0..1 );
	DynamicCombo( D_INDIRECT_LIGHT, 0..1 );
	DynamicCombo( D_LIGHTING_ONLY, 0..1 );
	DynamicCombo( D_MATERIAL_MODE, 0..2 );
	DynamicCombo( D_MULTISCATTERING, 0..1 );
	DynamicCombo( D_SHADER_CLOCK, 0..1 );
	DynamicCombo( D_GPU_PREVIEW_LIGHTING, 0..1 );
	DynamicCombo( D_COMPUTE_BAKED_SHADOWS, 0..1 );
	DynamicComboRule( Requires( D_MULTISCATTERING, D_MATERIAL_MODE==0 ) );
	DynamicComboRule( Requires( D_GPU_PREVIEW_LIGHTING, D_LIGHTING_ONLY==1 ) );
	DynamicComboRule( Requires( D_GPU_PREVIEW_LIGHTING, D_DIRECT_LIGHT==0 ) );
	DynamicComboRule( Requires( D_GPU_PREVIEW_LIGHTING, D_INDIRECT_LIGHT==1 ) );
	DynamicComboRule( Requires( D_COMPUTE_BAKED_SHADOWS, D_GPU_PREVIEW_LIGHTING ) );
	
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
	
	vec4 _156;
	
	layout(set = 3, binding = 37, std430) readonly buffer StructuredBuffer
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo;
	
	layout(set = 3, binding = 35, std430) readonly buffer g_instanceBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer_1;
	
	layout(push_constant, std430) uniform PathTracePushConstants_t_natural
	{
	    layout(row_major) mat4 m_mInvViewProj;
	    vec4 m_vCameraOrigin;
	    vec4 m_vRandomOffsets;
	    uint m_nSamplerDimensionCount;
	    uint m_nSampleCount;
	    uint m_nSamplesPerFrame;
	    uint m_nBounceToShow;
	    uint m_nSharcPass;
	} PathTracePushConstants;
	
	layout(set = 6, binding = 161) uniform readonly image3D g_RandomSamples;
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube[65536];
	layout(set = 3, binding = 14) uniform sampler g_Sampler;
	layout(set = 6, binding = 158) uniform image2D g_OutputImage;
	layout(set = 6, binding = 159) uniform image2D g_VarianceImage;
	
	void main()
	{
	    vec2 _232 = (((vec2(gl_LaunchIDEXT.xy) + PathTracePushConstants.m_vRandomOffsets.xy) / vec2(gl_LaunchSizeEXT.xy)) * 2.0) - vec2(1.0);
	    _232.y = -_232.y;
	    vec4 _238 = PathTracePushConstants.m_mInvViewProj * vec4(_232.xy, 0.0, 1.0);
	    vec3 _242 = _238.xyz / vec3(_238.w);
	    vec4 _244;
	    _244.x = _242.x;
	    _244.y = _242.y;
	    _244.z = _242.z;
	    vec3 _253 = normalize(_244.xyz - PathTracePushConstants.m_vCameraOrigin.xyz);
	    uvec3 _262 = uvec3(imageSize(g_RandomSamples));
	    ivec3 _215;
	    ivec3 _265 = _215;
	    _265.x = int(_262.x);
	    _265.y = int(_262.y);
	    _265.z = int(_262.z);
	    _215 = _265;
	    ivec2 _274 = ivec2(gl_LaunchIDEXT.xy) - _265.xy * (ivec2(gl_LaunchIDEXT.xy) / _265.xy);
	    f16vec3 _281 = f16vec3(vec3(0.0));
	    vec3 _186;
	    p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _186, 3.4028234663852885981170418348452e+38, imageLoad(g_RandomSamples, ivec3(_274.xy, 1)).xy.y, -1, false, MaterialDataMinimal_t(_281, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _281, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	    traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, PathTracePushConstants.m_vCameraOrigin.xyz, 0.0, _253, 56755.83984375, 0);
	    vec3 _185 = p.vSmoothPositionWs;
	    vec3 _184 = p.vFaceNormalWs;
	    float _183 = p.flHitT;
	    int _182 = p.nInstance;
	    f16vec3 _165 = p.material.vNormalWs;
	    float16_t _164 = p.material.flMetalness;
	    f16vec3 _163 = p.material.vAlbedo;
	    float16_t _162 = p.material.flRoughness;
	    f16vec3 _161 = p.material.vEmissive;
	    float16_t _160 = p.material.flReflectance;
	    uint _159 = p.material.nMaterialTypeAndFlags;
	    f16vec4 _158 = p.material.vMaterialBits;
	    vec3 vIndirectSample;
	    if (p.nInstance != (-1))
	    {
	        vec3 _181 = PathTracePushConstants.m_vCameraOrigin.xyz;
	        vec3 _180 = _253;
	        do
	        {
	            vec3 _189 = _185;
	            vec3 _188 = _184;
	            float _187 = _183;
	            f16vec3 _174 = _165;
	            uint _193 = g_instanceBuffer_1._member0[uint(_182)].nMaterialFlags_nInstanceFlags;
	            vec3 _192 = (_181 + (_180 * _187)) + (_188 * ((abs(_181) + vec3(abs(_187))) * 9.9999997473787516355514526367188e-05));
	            vec3 _191 = _188;
	            int _190 = int(_193 & 65535u);
	            bool _214;
	            if (false)
	            {
	                if (false)
	                {
	                    _214 = (_190 & 256) != 0;
	                }
	                else
	                {
	                    _214 = false;
	                }
	                if (_214)
	                {
	                }
	                else
	                {
	                    if (false)
	                    {
	                        _214 = (_190 & 512) != 0;
	                    }
	                    else
	                    {
	                        _214 = false;
	                    }
	                }
	            }
	            if (false)
	            {
	                _214 = any(notEqual(_189, vec3(3.4028234663852885981170418348452e+38)));
	            }
	            else
	            {
	                _214 = false;
	            }
	            vec3 _379 = _189 - _192;
	            float _380 = length(_379);
	            vec3 _196 = _192;
	            float _195 = 0.0;
	            vec3 _194 = vec4(_379 / vec3(_380), _380).xyz;
	            float _213;
	            if (_214)
	            {
	                _213 = _380;
	            }
	            else
	            {
	                _213 = 0.0;
	            }
	            p_1 = PayloadShadow_t(1.0);
	            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _196, _195, _194, _213, 1);
	            if (_214)
	            {
	                _213 = p_1.m_flVisibility;
	            }
	            else
	            {
	                _213 = 0.0;
	            }
	            if (_213 == 1.0)
	            {
	                _192 = _189;
	                _191 = vec3(_174);
	            }
	            vec3 _197;
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _197, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_165, _164, _163, _162, _161, _160, _159, _158));
	            traceRayEXT(g_AccelStruct, 32u, 32u, 0u, 2u, 0u, _192 - ((_191 * 0.5) * 0.5), 0.0, _191, 0.5, 0);
	            f16vec3 _173 = p.material.vNormalWs;
	            float16_t _172 = p.material.flMetalness;
	            f16vec3 _171 = p.material.vAlbedo;
	            float16_t _170 = p.material.flRoughness;
	            f16vec3 _169 = p.material.vEmissive;
	            float16_t _168 = p.material.flReflectance;
	            uint _167 = p.material.nMaterialTypeAndFlags;
	            f16vec4 _166 = p.material.vMaterialBits;
	            if (p.nInstance != (-1))
	            {
	                _165 = _173;
	                _164 = _172;
	                _163 = _171;
	                _162 = _170;
	                _161 = _169;
	                _160 = _168;
	                _159 = _167;
	                _158 = _166;
	                break;
	            }
	            else
	            {
	                break;
	            }
	            break;
	        } while(false);
	        vec3 _179 = PathTracePushConstants.m_vCameraOrigin.xyz;
	        vec3 _178 = _253;
	        vec3 _177 = _185;
	        vec3 _176 = _184;
	        float _175 = _183;
	        uint _200 = g_instanceBuffer_1._member0[uint(_182)].nMaterialFlags_nInstanceFlags;
	        vec3 _199 = (_179 + (_178 * _175)) + (_176 * ((abs(_179) + vec3(abs(_175))) * 9.9999997473787516355514526367188e-05));
	        int _198 = int(_200 & 65535u);
	        bool _212;
	        if (false)
	        {
	            if (false)
	            {
	                _212 = (_198 & 256) != 0;
	            }
	            else
	            {
	                _212 = false;
	            }
	            if (_212)
	            {
	            }
	            else
	            {
	                if (false)
	                {
	                    _212 = (_198 & 512) != 0;
	                }
	                else
	                {
	                    _212 = false;
	                }
	            }
	        }
	        if (true)
	        {
	            _212 = any(notEqual(_177, vec3(3.4028234663852885981170418348452e+38)));
	        }
	        else
	        {
	            _212 = false;
	        }
	        vec3 _510 = _177 - _199;
	        float _511 = length(_510);
	        vec3 _203 = _199;
	        float _202 = 0.0;
	        vec3 _201 = vec4(_510 / vec3(_511), _511).xyz;
	        float _211;
	        if (_212)
	        {
	            _211 = _511;
	        }
	        else
	        {
	            _211 = 0.0;
	        }
	        p_1 = PayloadShadow_t(1.0);
	        traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _203, _202, _201, _211, 1);
	        if (_212)
	        {
	            _211 = p_1.m_flVisibility;
	        }
	        else
	        {
	            _211 = 0.0;
	        }
	        if (_211 == 1.0)
	        {
	            _199 = _177;
	        }
	        if (int(PathTracePushConstants.m_nBounceToShow) < 1)
	        {
	            vIndirectSample = vec3(0.0) + vec3(_161);
	        }
	        else
	        {
	            vIndirectSample = vec3(0.0);
	        }
	    }
	    else
	    {
	        vec3 _205;
	        do
	        {
	            vec2 _206 = imageLoad(g_RandomSamples, ivec3(_274.xy, 2)).xy;
	            if ((g_SceneGlobalInfo._member0[0].m_nSkyLightFlags & 1u) == 0u)
	            {
	                _205 = vec3(0.0);
	                break;
	            }
	            bool _207;
	            if (_253.z < 0.0)
	            {
	                float _208 = _206.y;
	                bool _204;
	                do
	                {
	                    if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w <= 0.0)
	                    {
	                        _204 = false;
	                        break;
	                    }
	                    if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w >= 1.0)
	                    {
	                        _204 = true;
	                        break;
	                    }
	                    if (_208 < g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w)
	                    {
	                        _208 = min(_208 / g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w, 0.99999988079071044921875);
	                        _204 = true;
	                        break;
	                    }
	                    _208 = min((_208 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w) / (1.0 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w), 0.99999988079071044921875);
	                    _204 = false;
	                    break;
	                } while(false);
	                vec2 _587 = _206;
	                _587.y = _208;
	                _206 = _587;
	                _207 = _204;
	            }
	            else
	            {
	                _207 = false;
	            }
	            vec3 _209;
	            vec3 _210;
	            if (_207)
	            {
	                float _595 = sqrt(_206.y);
	                float _597 = 6.283185482025146484375 * _206.x;
	                _209 = vec3(cos(_597) * _595, sin(_597) * _595, sqrt(max(0.0, 1.0 - _206.y)));
	                _210 = g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.xyz;
	            }
	            else
	            {
	                _209 = _253;
	                _210 = vec3(0.0);
	            }
	            if (g_SceneGlobalInfo._member0[0].m_nIBLCubeMap >= 0)
	            {
	                vec4 _636 = textureLod(samplerCube(g_bindless_TextureCube[g_SceneGlobalInfo._member0[0].m_nIBLCubeMap], g_Sampler), normalize(g_SceneGlobalInfo._member0[0].m_mIBLTransformI * vec4(_209, 0.0)), 0.0);
	                if (dot(_636.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) < g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.w)
	                {
	                    _210 += (g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.xyz * _636.xyz);
	                }
	            }
	            else
	            {
	                _210 += g_SceneGlobalInfo._member0[0].m_vSkyColor.xyz;
	            }
	            if (false)
	            {
	                _210 *= g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.w;
	            }
	            if (_207)
	            {
	                _210 *= g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.xyz;
	            }
	            _205 = _210;
	            break;
	        } while(false);
	        vIndirectSample = _205;
	    }
	    vec4 vIndirectCurrent;
	    vec2 vIndirectVariance;
	    if (int(PathTracePushConstants.m_nSampleCount) > 0)
	    {
	        vIndirectCurrent = imageLoad(g_OutputImage, ivec2(gl_LaunchIDEXT.xy));
	        vIndirectVariance = imageLoad(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy)).xy;
	    }
	    else
	    {
	        vIndirectCurrent = vec4(0.0);
	        vIndirectVariance = vec2(0.0);
	    }
	    vec4 _693 = vec4(mix(vIndirectCurrent.xyz, vIndirectSample, vec3(1.0 / (1.0 + vIndirectCurrent.w))), 1.0 + vIndirectCurrent.w);
	    imageStore(g_OutputImage, ivec2(gl_LaunchIDEXT.xy), _693);
	    float _700 = dot(vIndirectSample.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    float _705 = _700 - vIndirectVariance.x;
	    float _707 = vIndirectVariance.x + (_705 / _693.w);
	    imageStore(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy), vec4(vec2(_707, vIndirectVariance.y + (_705 * (_700 - _707))), 0.0, 0.0));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
