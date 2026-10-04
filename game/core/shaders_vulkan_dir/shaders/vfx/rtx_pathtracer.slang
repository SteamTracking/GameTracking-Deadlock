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
	DynamicComboRule( Requires( D_MULTISCATTERING, D_MATERIAL_MODE==0 ) );
	
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
	
	vec4 _154;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 3, binding = 37, std430) readonly buffer g_SceneGlobalInfo
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo_1;
	
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
	    vec2 _231 = (((vec2(gl_LaunchIDEXT.xy) + PathTracePushConstants.m_vRandomOffsets.xy) / vec2(gl_LaunchSizeEXT.xy)) * 2.0) - vec2(1.0);
	    _231.y = -_231.y;
	    vec4 _237 = PathTracePushConstants.m_mInvViewProj * vec4(_231.xy, 0.0, 1.0);
	    vec3 _241 = _237.xyz / vec3(_237.w);
	    vec4 _243;
	    _243.x = _241.x;
	    _243.y = _241.y;
	    _243.z = _241.z;
	    vec3 _252 = normalize(_243.xyz - PathTracePushConstants.m_vCameraOrigin.xyz);
	    int nSampleCount = int(PathTracePushConstants.m_nSampleCount);
	    vec4 vCurrentSample;
	    if (nSampleCount > 0)
	    {
	        vCurrentSample = imageLoad(g_OutputImage, ivec2(gl_LaunchIDEXT.xy));
	    }
	    else
	    {
	        vCurrentSample = vec4(0.0);
	    }
	    uvec3 _269 = uvec3(imageSize(g_RandomSamples));
	    ivec3 _213;
	    ivec3 _272 = _213;
	    _272.x = int(_269.x);
	    _272.y = int(_269.y);
	    _272.z = int(_269.z);
	    _213 = _272;
	    ivec2 _281 = ivec2(gl_LaunchIDEXT.xy) - _272.xy * (ivec2(gl_LaunchIDEXT.xy) / _272.xy);
	    f16vec3 _288 = f16vec3(vec3(0.0));
	    vec3 _184;
	    p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _184, 3.4028234663852885981170418348452e+38, imageLoad(g_RandomSamples, ivec3(_281.xy, 1)).xy.y, -1, false, MaterialDataMinimal_t(_288, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _288, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	    traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, PathTracePushConstants.m_vCameraOrigin.xyz, 0.0, _252, 56755.83984375, 0);
	    vec3 _183 = p.vSmoothPositionWs;
	    vec3 _182 = p.vFaceNormalWs;
	    float _181 = p.flHitT;
	    int _180 = p.nInstance;
	    f16vec3 _163 = p.material.vNormalWs;
	    float16_t _162 = p.material.flMetalness;
	    f16vec3 _161 = p.material.vAlbedo;
	    float16_t _160 = p.material.flRoughness;
	    f16vec3 _159 = p.material.vEmissive;
	    float16_t _158 = p.material.flReflectance;
	    uint _157 = p.material.nMaterialTypeAndFlags;
	    f16vec4 _156 = p.material.vMaterialBits;
	    vec3 vNewSample;
	    if (p.nInstance != (-1))
	    {
	        vec3 _179 = PathTracePushConstants.m_vCameraOrigin.xyz;
	        vec3 _178 = _252;
	        do
	        {
	            vec3 _187 = _183;
	            vec3 _186 = _182;
	            float _185 = _181;
	            f16vec3 _172 = _163;
	            uint _191 = g_instanceBuffer._member0[uint(_180)].nMaterialFlags_nInstanceFlags;
	            vec3 _190 = (_179 + (_178 * _185)) + (_186 * ((abs(_179) + vec3(abs(_185))) * 9.9999997473787516355514526367188e-05));
	            vec3 _189 = _186;
	            int _188 = int(_191 & 65535u);
	            bool _212;
	            if (false)
	            {
	                if (false)
	                {
	                    _212 = (_188 & 256) != 0;
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
	                        _212 = (_188 & 512) != 0;
	                    }
	                    else
	                    {
	                        _212 = false;
	                    }
	                }
	            }
	            if (false)
	            {
	                _212 = any(notEqual(_187, vec3(3.4028234663852885981170418348452e+38)));
	            }
	            else
	            {
	                _212 = false;
	            }
	            vec3 _386 = _187 - _190;
	            float _387 = length(_386);
	            vec3 _194 = _190;
	            float _193 = 0.0;
	            vec3 _192 = vec4(_386 / vec3(_387), _387).xyz;
	            float _211;
	            if (_212)
	            {
	                _211 = _387;
	            }
	            else
	            {
	                _211 = 0.0;
	            }
	            p_1 = PayloadShadow_t(1.0);
	            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _194, _193, _192, _211, 1);
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
	                _190 = _187;
	                _189 = vec3(_172);
	            }
	            vec3 _195;
	            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _195, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_163, _162, _161, _160, _159, _158, _157, _156));
	            traceRayEXT(g_AccelStruct, 32u, 32u, 0u, 2u, 0u, _190 - ((_189 * 0.5) * 0.5), 0.0, _189, 0.5, 0);
	            f16vec3 _171 = p.material.vNormalWs;
	            float16_t _170 = p.material.flMetalness;
	            f16vec3 _169 = p.material.vAlbedo;
	            float16_t _168 = p.material.flRoughness;
	            f16vec3 _167 = p.material.vEmissive;
	            float16_t _166 = p.material.flReflectance;
	            uint _165 = p.material.nMaterialTypeAndFlags;
	            f16vec4 _164 = p.material.vMaterialBits;
	            if (p.nInstance != (-1))
	            {
	                _163 = _171;
	                _162 = _170;
	                _161 = _169;
	                _160 = _168;
	                _159 = _167;
	                _158 = _166;
	                _157 = _165;
	                _156 = _164;
	                break;
	            }
	            else
	            {
	                break;
	            }
	            break;
	        } while(false);
	        vec3 _177 = PathTracePushConstants.m_vCameraOrigin.xyz;
	        vec3 _176 = _252;
	        vec3 _175 = _183;
	        vec3 _174 = _182;
	        float _173 = _181;
	        uint _198 = g_instanceBuffer._member0[uint(_180)].nMaterialFlags_nInstanceFlags;
	        vec3 _197 = (_177 + (_176 * _173)) + (_174 * ((abs(_177) + vec3(abs(_173))) * 9.9999997473787516355514526367188e-05));
	        int _196 = int(_198 & 65535u);
	        bool _210;
	        if (false)
	        {
	            if (false)
	            {
	                _210 = (_196 & 256) != 0;
	            }
	            else
	            {
	                _210 = false;
	            }
	            if (_210)
	            {
	            }
	            else
	            {
	                if (false)
	                {
	                    _210 = (_196 & 512) != 0;
	                }
	                else
	                {
	                    _210 = false;
	                }
	            }
	        }
	        if (true)
	        {
	            _210 = any(notEqual(_175, vec3(3.4028234663852885981170418348452e+38)));
	        }
	        else
	        {
	            _210 = false;
	        }
	        vec3 _517 = _175 - _197;
	        float _518 = length(_517);
	        vec3 _201 = _197;
	        float _200 = 0.0;
	        vec3 _199 = vec4(_517 / vec3(_518), _518).xyz;
	        float _209;
	        if (_210)
	        {
	            _209 = _518;
	        }
	        else
	        {
	            _209 = 0.0;
	        }
	        p_1 = PayloadShadow_t(1.0);
	        traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _201, _200, _199, _209, 1);
	        if (_210)
	        {
	            _209 = p_1.m_flVisibility;
	        }
	        else
	        {
	            _209 = 0.0;
	        }
	        if (_209 == 1.0)
	        {
	            _197 = _175;
	        }
	        if (int(PathTracePushConstants.m_nBounceToShow) < 1)
	        {
	            vNewSample = vec3(_159);
	        }
	        else
	        {
	            vNewSample = vec3(0.0);
	        }
	    }
	    else
	    {
	        vec3 _203;
	        do
	        {
	            vec2 _204 = imageLoad(g_RandomSamples, ivec3(_281.xy, 2)).xy;
	            if ((g_SceneGlobalInfo_1._member0[0].m_nSkyLightFlags & 1u) == 0u)
	            {
	                _203 = vec3(0.0);
	                break;
	            }
	            bool _205;
	            if (_252.z < 0.0)
	            {
	                float _206 = _204.y;
	                bool _202;
	                do
	                {
	                    if (g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w <= 0.0)
	                    {
	                        _202 = false;
	                        break;
	                    }
	                    if (g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w >= 1.0)
	                    {
	                        _202 = true;
	                        break;
	                    }
	                    if (_206 < g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w)
	                    {
	                        _206 = min(_206 / g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w, 0.99999988079071044921875);
	                        _202 = true;
	                        break;
	                    }
	                    _206 = min((_206 - g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w) / (1.0 - g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.w), 0.99999988079071044921875);
	                    _202 = false;
	                    break;
	                } while(false);
	                vec2 _594 = _204;
	                _594.y = _206;
	                _204 = _594;
	                _205 = _202;
	            }
	            else
	            {
	                _205 = false;
	            }
	            vec3 _207;
	            vec3 _208;
	            if (_205)
	            {
	                float _602 = sqrt(_204.y);
	                float _604 = 6.283185482025146484375 * _204.x;
	                _207 = vec3(cos(_604) * _602, sin(_604) * _602, sqrt(max(0.0, 1.0 - _204.y)));
	                _208 = g_SceneGlobalInfo_1._member0[0].m_vSunLightIrradiance.xyz;
	            }
	            else
	            {
	                _207 = _252;
	                _208 = vec3(0.0);
	            }
	            if (g_SceneGlobalInfo_1._member0[0].m_nIBLCubeMap >= 0)
	            {
	                vec4 _643 = textureLod(samplerCube(g_bindless_TextureCube[g_SceneGlobalInfo_1._member0[0].m_nIBLCubeMap], g_Sampler), normalize(g_SceneGlobalInfo_1._member0[0].m_mIBLTransformI * vec4(_207, 0.0)), 0.0);
	                if (dot(_643.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) < g_SceneGlobalInfo_1._member0[0].m_vSunLightIrradiance.w)
	                {
	                    _208 += (g_SceneGlobalInfo_1._member0[0].m_vIBLCubeMapScale.xyz * _643.xyz);
	                }
	            }
	            else
	            {
	                _208 += g_SceneGlobalInfo_1._member0[0].m_vSkyColor.xyz;
	            }
	            if (false)
	            {
	                _208 *= g_SceneGlobalInfo_1._member0[0].m_vIBLCubeMapScale.w;
	            }
	            if (_205)
	            {
	                _208 *= g_SceneGlobalInfo_1._member0[0].m_vSkyAmbientBounce.xyz;
	            }
	            _203 = _208;
	            break;
	        } while(false);
	        vNewSample = _203;
	    }
	    vec4 _687 = vec4(mix(vCurrentSample.xyz, vNewSample, vec3(1.0 / (1.0 + vCurrentSample.w))), 1.0 + vCurrentSample.w);
	    imageStore(g_OutputImage, ivec2(gl_LaunchIDEXT.xy), _687);
	    vec2 _214;
	    if (nSampleCount == 0)
	    {
	        _214 = vec2(0.0);
	    }
	    else
	    {
	        _214 = imageLoad(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy)).xy;
	    }
	    float _704 = dot(vNewSample.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    float _709 = _704 - _214.x;
	    float _711 = _214.x + (_709 / _687.w);
	    imageStore(g_VarianceImage, ivec2(gl_LaunchIDEXT.xy), vec4(vec2(_711, _214.y + (_709 * (_704 - _711))), 0.0, 0.0));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
