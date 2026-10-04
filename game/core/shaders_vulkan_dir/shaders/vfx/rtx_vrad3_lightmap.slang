//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Shader to generate lightmaps";
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
	DynamicCombo( D_SH_LIGHTMAPS, 0..1 );
	
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
	#extension GL_EXT_nonuniform_qualifier : require
	#extension GL_EXT_samplerless_texture_functions : require
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
	#extension GL_KHR_shader_subgroup_arithmetic : require
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
	
	struct Luxel_t_natural
	{
	    vec4 vIrradiance_flSampleCount;
	    vec4 vShr;
	    vec4 vShg;
	    vec4 vShb;
	    vec4 vQuadraticr;
	    vec4 vQuadraticg;
	    vec4 vQuadraticb;
	    vec4 vQuadraticFinalrgb;
	    vec4 vBakedShadow;
	    vec4 vBakedShadowUnoccluded;
	    ivec4 vBakedShadowLightId;
	    vec4 vTangent;
	    vec4 vNormal;
	    vec4 flAmbientOcclusion_vPadding;
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
	
	struct _Array_natural_vector_float_4_5
	{
	    vec4 data[5];
	};
	
	struct PathTraceBarnLightGPU_t_natural
	{
	    mat4 m_mToClipSpace;
	    mat4 m_mFromClipSpace;
	    vec4 m_vNearPlane;
	    vec4 m_vLightPosition;
	    vec4 m_vCookieParameters;
	    vec4 m_vColor;
	    vec4 m_vBounceColor;
	    vec4 m_vOrientation;
	    vec4 m_vAngleFade;
	    vec4 m_vDistanceFade_vSkirt;
	    _Array_natural_vector_float_4_5 m_vLuminaireVectors;
	    vec4 m_vMinBounds;
	    vec4 m_vMaxBounds;
	    vec4 m_vIlluminationBoundsCenter;
	    vec4 m_qIlluminationBoundsOrient;
	    vec4 m_vIlluminationBoundsExtent;
	    mat4x3 m_mBarnIlluminationFromWorld;
	    int m_nCookie;
	    int m_nLuminaireType;
	    int m_nPathTraceFlags;
	    int m_bSphericalCookie;
	    int m_nBakedShadowIndex;
	    int m_nShadowedLightId;
	    int m_nPreviewBakedShadowIndex;
	    int _pad;
	};
	
	struct _Array_natural_vector_float_4_480
	{
	    vec4 data[480];
	};
	
	struct SSProfileConstants_natural
	{
	    vec4 m_vNearInv2Variance;
	    vec4 m_vNearInvPi2Variance;
	    vec4 m_vFarInv2Variance;
	    vec4 m_vFarInvPi2Variance_NearWt;
	    vec4 m_vNormalization;
	    uint m_bDualLobeSpecular;
	    float m_fDualLobeRoughness0;
	    float m_fDualLobeRoughness1;
	    float m_fDualLobeRoughnessMix;
	    vec3 m_vTransmissiveLogColor;
	    float m_fTransmissiveSaturation;
	    float m_fFresnelExponent;
	    float m_fPad0;
	    float m_fPad1;
	    float m_fPad2;
	};
	
	struct _Array_natural_SSProfileConstants32
	{
	    SSProfileConstants_natural data[32];
	};
	
	const vec4 _305[5] = vec4[](vec4(0.0), vec4(1.0, 0.0, 0.0, 0.0), vec4(0.0, 1.0, 0.0, 0.0), vec4(0.0, 0.0, 1.0, 0.0), vec4(0.0, 0.0, 0.0, 1.0));
	vec4 _337;
	float _338;
	
	layout(set = 6, binding = 158, std430) buffer RWStructuredBuffer
	{
	    Luxel_t_natural _member0[];
	} g_Luxels;
	
	layout(set = 3, binding = 37, std430) readonly buffer StructuredBuffer
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo;
	
	layout(set = 6, binding = 160, std430) buffer g_LightmapSamples
	{
	    LightmapSample_t_natural _member0[];
	} g_LightmapSamples_1;
	
	layout(set = 3, binding = 35, std430) readonly buffer g_instanceBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer_1;
	
	layout(set = 6, binding = 159, std430) buffer g_LightBins
	{
	    uint _member0[];
	} g_LightBins_1;
	
	layout(set = 3, binding = 36, std430) readonly buffer g_Lights
	{
	    layout(row_major) PathTraceBarnLightGPU_t_natural _member0[];
	} g_Lights_1;
	
	struct SLANG_ParameterGroup_SubsurfaceProfilesConstantBuffer_t_natural
	{
	    uint g_nSampleCount;
	    uint _padA;
	    uint _padB;
	    uint _padC;
	    _Array_natural_vector_float_4_480 g_vSubsurfaceSamples;
	    _Array_natural_SSProfileConstants32 g_SubsurfaceProfile;
	};
	
	layout(set = 3) uniform SLANG_ParameterGroup_SubsurfaceProfilesConstantBuffer_t_natural SubsurfaceProfilesConstantBuffer_t;
	
	layout(push_constant, std430) uniform LightmapPushConstants_t_natural
	{
	    ivec4 m_nEstimate_DimensionCount;
	    vec4 m_vLightmapOffsetAndSize;
	    vec4 m_vCordonMins;
	    vec4 m_vCordonMaxs;
	} g_PushConstants;
	
	layout(set = 6, binding = 162, r32ui) uniform readonly uimage3D g_LightmapBlockConverged;
	layout(set = 6, binding = 161) uniform readonly image3D g_RandomSamples;
	layout(set = 6, binding = 30) uniform utexture2D g_LuxelChartIDs;
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube[65536];
	layout(set = 3, binding = 14) uniform sampler g_Sampler;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 3, binding = 15) uniform sampler g_CookieSampler;
	
	void main()
	{
	    bool _654 = false;
	    bool _756 = false;
	    bool _810 = false;
	    do
	    {
	        uint _890 = (gl_LaunchIDEXT.y * gl_LaunchSizeEXT.x) + gl_LaunchIDEXT.x;
	        if (g_PushConstants.m_nEstimate_DimensionCount.x == 0)
	        {
	            g_Luxels._member0[_890].vIrradiance_flSampleCount = vec4(0.0);
	            g_Luxels._member0[_890].vShr = vec4(0.0);
	            g_Luxels._member0[_890].vShg = vec4(0.0);
	            g_Luxels._member0[_890].vShb = vec4(0.0);
	            g_Luxels._member0[_890].vQuadraticr = vec4(0.0);
	            g_Luxels._member0[_890].vQuadraticg = vec4(0.0);
	            g_Luxels._member0[_890].vQuadraticb = vec4(0.0);
	            g_Luxels._member0[_890].vQuadraticFinalrgb = vec4(0.0);
	            g_Luxels._member0[_890].vBakedShadow = vec4(0.0);
	            g_Luxels._member0[_890].vBakedShadowUnoccluded = vec4(0.0);
	            g_Luxels._member0[_890].vBakedShadowLightId = ivec4(255);
	            g_Luxels._member0[_890].vTangent = vec4(0.0);
	            g_Luxels._member0[_890].vNormal = vec4(0.0);
	            g_Luxels._member0[_890].flAmbientOcclusion_vPadding = vec4(0.0);
	        }
	        else
	        {
	            if (imageLoad(g_LightmapBlockConverged, ivec3(gl_LaunchIDEXT / uvec3(4u, 4u, 1u))).x != 0u)
	            {
	                break;
	            }
	        }
	        uvec3 _930 = uvec3(imageSize(g_RandomSamples));
	        ivec3 _875;
	        ivec3 _933 = _875;
	        _933.x = int(_930.x);
	        _933.y = int(_930.y);
	        _933.z = int(_930.z);
	        _875 = _933;
	        ivec2 _942 = ivec2(gl_LaunchIDEXT.xy) - _933.xy * (ivec2(gl_LaunchIDEXT.xy) / _933.xy);
	        uint _943 = uint(g_PushConstants.m_nEstimate_DimensionCount.y);
	        uint _963 = uint(max(1, ((g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.w + 31) / 32)));
	        uvec3 _964 = uvec3(g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.xyz);
	        vec3 _967 = vec3(_964) / (g_SceneGlobalInfo._member0[0].m_vLocalLightMaxBounds.xyz - g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz);
	        vec3 _969 = (-g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz) * _967;
	        uvec4 _sampled = texelFetch(g_LuxelChartIDs, ivec2(gl_LaunchIDEXT.xy), 0);
	        uint _973 = _sampled.x;
	        if (_973 == 4294967295u)
	        {
	            break;
	        }
	        vec2 _981 = (g_PushConstants.m_vLightmapOffsetAndSize.xy + vec2(gl_LaunchIDEXT.xy)) + vec2(0.5);
	        vec2 vSeed = imageLoad(g_RandomSamples, ivec3(_942.xy, 1)).xy;
	        float flReservoirWt = 0.0;
	        vec4 _517 = vec4(0.0);
	        vec4 _516 = vec4(0.0);
	        vec4 _515 = vec4(0.0);
	        vec4 _514 = vec4(0.0);
	        vec4 _513 = vec4(0.0);
	        int _512 = 0;
	        uint _511 = 0u;
	        int dy = -2;
	        bool _873;
	        bool _874;
	        bool _876;
	        bool _877;
	        for (;;)
	        {
	            if (!(dy <= 2))
	            {
	                break;
	            }
	            int dx = -2;
	            for (;;)
	            {
	                bool _1001_ladder_break = false;
	                do
	                {
	                    if (!(dx <= 2))
	                    {
	                        _1001_ladder_break = true;
	                        break;
	                    }
	                    uvec2 _1014 = gl_LaunchIDEXT.xy + uvec2(ivec2(dx, dy));
	                    ivec2 _1015 = ivec2(_1014);
	                    int _1016 = _1015.x;
	                    if (_1016 < 0)
	                    {
	                        _876 = true;
	                    }
	                    else
	                    {
	                        _876 = uint(_1016) >= gl_LaunchSizeEXT.x;
	                    }
	                    if (_876)
	                    {
	                        break;
	                    }
	                    int _1028 = _1015.y;
	                    if (_1028 < 0)
	                    {
	                        _877 = true;
	                    }
	                    else
	                    {
	                        _877 = uint(_1028) >= gl_LaunchSizeEXT.y;
	                    }
	                    if (_877)
	                    {
	                        break;
	                    }
	                    if (texelFetch(g_LuxelChartIDs, ivec2(_1014), 0).x != _973)
	                    {
	                        break;
	                    }
	                    uint nSample = (uint(_1028) * gl_LaunchSizeEXT.y) + uint(_1016);
	                    vec2 _510 = g_LightmapSamples_1._member0[nSample].m_vLightmapUv;
	                    if (g_LightmapSamples_1._member0[nSample].m_vPositionWs.w <= 0.0)
	                    {
	                        break;
	                    }
	                    vec2 vDx = (_510.xy * g_PushConstants.m_vLightmapOffsetAndSize.zw) - _981;
	                    float _1077 = 0.79788458347320556640625 * exp(dot(vDx, vDx) * (-2.0));
	                    float _878 = vSeed.y;
	                    do
	                    {
	                        float _1082 = flReservoirWt;
	                        float _1083 = _1082 + _1077;
	                        flReservoirWt = _1083;
	                        if (_1083 == 0.0)
	                        {
	                            _873 = false;
	                            break;
	                        }
	                        float _1088 = _1077 / flReservoirWt;
	                        do
	                        {
	                            if (_1088 <= 0.0)
	                            {
	                                _874 = false;
	                                break;
	                            }
	                            if (_1088 >= 1.0)
	                            {
	                                _874 = true;
	                                break;
	                            }
	                            if (_878 < _1088)
	                            {
	                                _878 = min(_878 / _1088, 0.99999988079071044921875);
	                                _874 = true;
	                                break;
	                            }
	                            _878 = min((_878 - _1088) / (1.0 - _1088), 0.99999988079071044921875);
	                            _874 = false;
	                            break;
	                        } while(false);
	                        _873 = _874;
	                        break;
	                    } while(false);
	                    vec2 _1113 = vSeed;
	                    _1113.y = _878;
	                    vSeed = _1113;
	                    if (_873)
	                    {
	                        _517 = g_LightmapSamples_1._member0[nSample].m_vPositionWs;
	                        _516 = g_LightmapSamples_1._member0[nSample].m_vShadingNormalWs_vTransmissiveR;
	                        _515 = g_LightmapSamples_1._member0[nSample].m_vInterpolatedNormalWs_vTransmissiveG;
	                        _514 = g_LightmapSamples_1._member0[nSample].m_vFaceNormalWs_vTransmissiveB;
	                        _513 = g_LightmapSamples_1._member0[nSample].m_vTangentWs;
	                        _512 = g_LightmapSamples_1._member0[nSample].m_nInstanceFlags;
	                        _511 = g_LightmapSamples_1._member0[nSample].m_nSampleFlags;
	                    }
	                    break;
	                } while(false);
	                if (_1001_ladder_break)
	                {
	                    break;
	                }
	                dx++;
	                continue;
	            }
	            dy++;
	            continue;
	        }
	        if (!(_517.w != 0.0))
	        {
	            break;
	        }
	        vec3 _1133 = abs(_517.xyz);
	        vec3 _509 = _517.xyz + (_514.xyz * ((abs(_517.xyz) + vec3(abs(max(_1133.x, max(_1133.y, _1133.z))))) * 9.9999997473787516355514526367188e-05));
	        vec3 _1149 = abs(_517.xyz);
	        vec3 _508 = _517.xyz + ((-_514.xyz) * ((abs(_517.xyz) + vec3(abs(max(_1149.x, max(_1149.y, _1149.z))))) * 9.9999997473787516355514526367188e-05));
	        f16vec3 _349 = f16vec3(_516.xyz);
	        vec3 _507 = _514.xyz;
	        vec3 _399;
	        vec3 _879 = _399;
	        vec3 _398;
	        vec3 _880 = _398;
	        float _872;
	        if (_516.z >= 0.0)
	        {
	            _872 = 1.0;
	        }
	        else
	        {
	            _872 = -1.0;
	        }
	        float _1175 = (-1.0) / (_872 + _516.z);
	        float _1179 = (_516.x * _516.y) * _1175;
	        vec3 _1184 = _879;
	        _1184.x = 1.0 + (((_872 * _516.x) * _516.x) * _1175);
	        _1184.y = _872 * _1179;
	        _1184.z = (-_872) * _516.x;
	        _879 = _1184;
	        vec3 _1191 = _880;
	        _1191.x = _1179;
	        _1191.y = _872 + ((_516.y * _516.y) * _1175);
	        _1191.z = -_516.y;
	        _880 = _1191;
	        _399 = _1184;
	        _398 = _1191;
	        f16vec3 _347 = f16vec3(vec3(1.0));
	        int _506 = _512;
	        vec3 vTransmissiveRatio = vec3(_516.w, _515.w, _514.w);
	        vec4 _505 = vec4(0.0);
	        vec4 _504 = vec4(0.0);
	        vec4 _503 = vec4(0.0);
	        vec4 _502 = vec4(0.0);
	        vec4 _501 = vec4(0.0);
	        vec4 _500 = vec4(0.0);
	        vec4 _499 = vec4(0.0);
	        vec4 _498 = vec4(0.0);
	        vec4 _497 = vec4(0.0);
	        vec4 _496 = vec4(0.0);
	        ivec4 _495 = ivec4(255);
	        vec4 _494 = vec4(0.0);
	        vec4 _493 = vec4(0.0);
	        vec4 _492 = vec4(0.0);
	        if (all(greaterThanEqual(_517.xyz, g_PushConstants.m_vCordonMins.xyz)))
	        {
	            _876 = all(lessThanEqual(_517.xyz, g_PushConstants.m_vCordonMaxs.xyz));
	        }
	        else
	        {
	            _876 = false;
	        }
	        if (_876)
	        {
	            f16vec4 _343;
	            uint _344;
	            float16_t _345;
	            float16_t _346;
	            float16_t _348;
	            if ((_511 & 2u) != 0u)
	            {
	                f16vec3 _1239 = f16vec3(vec3(0.0));
	                vec3 _518;
	                p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _518, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_1239, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _1239, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, _509 + (_514.xyz * 0.037500001490116119384765625), 0.0, -_514.xyz, 0.07500000298023223876953125, 0);
	                if (p.nInstance != (-1))
	                {
	                    _349 = p.material.vNormalWs;
	                    _348 = p.material.flMetalness;
	                    _347 = p.material.vAlbedo;
	                    _346 = p.material.flRoughness;
	                    _345 = p.material.flReflectance;
	                    _344 = p.material.nMaterialTypeAndFlags;
	                    _343 = p.material.vMaterialBits;
	                }
	            }
	            _511 &= 4294967292u;
	            vec4 _1270 = _493;
	            _1270.x = _515.x;
	            _1270.y = _515.y;
	            _1270.z = _515.z;
	            _493 = _1270;
	            _494 = _513;
	            vec3 _395;
	            float _396;
	            float _397;
	            ivec2 _491 = _942;
	            uint _490 = _943;
	            uint _489 = _963;
	            uvec3 _488 = _964;
	            vec3 _487 = _969;
	            vec3 _486 = _967;
	            vec3 _522 = _509;
	            vec3 _521 = _508;
	            vec3 _520 = _507;
	            int _519 = _506;
	            f16vec3 _356 = _349;
	            float16_t _355 = _348;
	            f16vec3 _354 = _347;
	            float16_t _353 = _346;
	            float16_t _352 = _345;
	            uint _351 = _344;
	            f16vec4 _350 = _343;
	            vec3 _404 = _399;
	            vec3 _403 = _398;
	            float _402 = _397;
	            float _401 = _396;
	            vec3 _400 = _395;
	            vec2 _864 = vSeed;
	            float _865;
	            if (false)
	            {
	                _865 = 0.5;
	            }
	            else
	            {
	                float _1298 = max(_516.w, max(_515.w, _514.w));
	                _865 = _1298 / (_1298 + 1.0);
	            }
	            float _866 = _864.x;
	            bool _863;
	            do
	            {
	                if (_865 <= 0.0)
	                {
	                    _863 = false;
	                    break;
	                }
	                if (_865 >= 1.0)
	                {
	                    _863 = true;
	                    break;
	                }
	                if (_866 < _865)
	                {
	                    _866 = min(_866 / _865, 0.99999988079071044921875);
	                    _863 = true;
	                    break;
	                }
	                _866 = min((_866 - _865) / (1.0 - _865), 0.99999988079071044921875);
	                _863 = false;
	                break;
	            } while(false);
	            vec2 _1326 = _864;
	            _1326.x = _866;
	            _864 = _1326;
	            if (_863)
	            {
	                _522 = _521;
	            }
	            else
	            {
	                _865 = 1.0 - _865;
	            }
	            float _1336 = sqrt(_864.y);
	            float _1338 = 6.283185482025146484375 * _864.x;
	            vec3 _1346 = vec3(cos(_1338) * _1336, sin(_1338) * _1336, sqrt(max(0.0, 1.0 - _864.y)));
	            vec3 _867 = _1346;
	            float _1349 = _865;
	            if (_863)
	            {
	                _865 = -_867.z;
	            }
	            else
	            {
	                _865 = _867.z;
	            }
	            vec3 _1360 = _867;
	            _1360.z = _865;
	            _867 = _1360;
	            vec3 _1367 = mat3(_404, _403, vec3(_356)) * _1360;
	            vec3 _852 = _1367;
	            vec3 _550 = _522;
	            vec3 _549 = _521;
	            vec3 _548 = _520;
	            int _547 = _519;
	            f16vec3 _378 = _356;
	            float16_t _377 = _355;
	            f16vec3 _376 = _354;
	            float16_t _375 = _353;
	            float16_t _374 = _352;
	            uint _373 = _351;
	            f16vec4 _372 = _350;
	            vec3 _440 = _404;
	            vec3 _439 = _403;
	            float _438 = _402;
	            float _437 = _401;
	            vec3 _436 = _400;
	            int _853;
	            if (false)
	            {
	                _853 = 4;
	            }
	            else
	            {
	                _853 = 2;
	            }
	            int _1386 = _853;
	            uint _1388 = uint(1 | _1386);
	            _853 = 1;
	            vec3 _854 = vec3(1.0 / (_1349 * (_1346.z * 0.3183098733425140380859375)));
	            vec3 _855 = vec3(0.0);
	            vec3 _551;
	            vec3 _567;
	            vec3 _597;
	            bool _693;
	            float _694;
	            bool _695;
	            vec3 _696;
	            bool _697;
	            vec3 _698;
	            vec3 _699;
	            float _700;
	            float _701;
	            bool _702;
	            vec3 _703;
	            bool _704;
	            vec3 _705;
	            bool _708;
	            bool _709;
	            bool _710;
	            float _711;
	            uint _712;
	            float _713;
	            bool _714;
	            float _715;
	            bool _716;
	            bool _717;
	            float _718;
	            float _719;
	            float _720;
	            bool _721;
	            float _722;
	            bool _723;
	            vec3 _724;
	            bool _725;
	            vec3 _726;
	            vec3 _727;
	            bool _728;
	            bool _729;
	            float _730;
	            vec4 _731;
	            vec4 _732;
	            float _733;
	            vec3 _734;
	            float _735;
	            float _736;
	            bool _737;
	            float _738;
	            vec4 _739;
	            vec2 _740;
	            float _741;
	            float _742;
	            vec4 _743;
	            float _744;
	            vec3 _745;
	            vec3 _746;
	            bool _747;
	            float _748;
	            vec4 _749;
	            vec2 _750;
	            float _751;
	            float _752;
	            vec3 _754;
	            vec3 _755;
	            vec4 _757;
	            float _758;
	            float _759;
	            vec3 _760;
	            vec3 _761;
	            float _762;
	            float _763;
	            bool _764;
	            vec3 _765;
	            vec3 _766;
	            bool _767;
	            bool _768;
	            vec3 _769;
	            float _776;
	            bool _778;
	            float _779;
	            bool _780;
	            vec3 _781;
	            bool _782;
	            vec3 _783;
	            vec3 _784;
	            vec4 _785;
	            vec4 _786;
	            float _787;
	            vec3 _788;
	            float _789;
	            float _790;
	            bool _791;
	            float _792;
	            vec4 _793;
	            vec2 _794;
	            float _795;
	            float _796;
	            vec4 _797;
	            float _798;
	            vec3 _799;
	            vec3 _800;
	            bool _801;
	            float _802;
	            vec4 _803;
	            vec2 _804;
	            float _805;
	            float _806;
	            vec3 _808;
	            vec3 _809;
	            vec4 _811;
	            float _812;
	            float _813;
	            vec3 _814;
	            vec3 _815;
	            float _816;
	            float _817;
	            bool _818;
	            vec3 _819;
	            vec3 _820;
	            bool _821;
	            bool _822;
	            vec3 _823;
	            float _828;
	            bool _829;
	            bool _830;
	            bool _831;
	            vec3 _833;
	            float _835;
	            float _836;
	            bool _839;
	            float _840;
	            float _841;
	            bool _844;
	            bool _845;
	            vec3 _846;
	            bool _848;
	            vec3 _850;
	            vec3 _851;
	            vec3 _856;
	            float _857;
	            float _860;
	            vec3 _862;
	            SPIRV_CROSS_LOOP
	            for (;;)
	            {
	                if (!(_853 <= 16))
	                {
	                    break;
	                }
	                SPIRV_CROSS_FLATTEN
	                if (false)
	                {
	                    SPIRV_CROSS_FLATTEN
	                    if (_853 > (-1))
	                    {
	                        _857 = 1.0;
	                        _856 = vec3(0.0);
	                    }
	                    else
	                    {
	                        if (_853 != (-1))
	                        {
	                            _857 = 0.0;
	                        }
	                        else
	                        {
	                            _857 = 1.0;
	                        }
	                        _856 = _854;
	                    }
	                }
	                else
	                {
	                    _857 = 1.0;
	                    _856 = _854;
	                }
	                if (all(equal(_856, vec3(0.0))))
	                {
	                    break;
	                }
	                vec3 _546 = _550;
	                vec3 _545 = _852;
	                vec2 _1430 = imageLoad(g_RandomSamples, ivec3(_491.xy, int(1u + uint(_853)))).xy;
	                f16vec3 _1432 = f16vec3(vec3(0.0));
	                vec2 _1438 = _1430;
	                _1438.y = 0.0;
	                p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _551, 3.4028234663852885981170418348452e+38, _1430.y, -1, false, MaterialDataMinimal_t(_1432, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _1432, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                traceRayEXT(g_AccelStruct, 0u, 4u, 0u, 2u, 0u, _550, 0.0, _852, 56755.83984375, 0);
	                float _1472 = p.flHitT;
	                vec2 _1473 = _1430;
	                _1473.y = p.flOpacityRng;
	                vec2 _858 = _1473;
	                if (!(p.nInstance != (-1)))
	                {
	                    vec2 _1488 = imageLoad(g_RandomSamples, ivec3(_491.xy, int(1u + uint(_853 + 1)))).xy;
	                    _858 = _1488;
	                    do
	                    {
	                        vec2 _847 = _1488;
	                        if ((g_SceneGlobalInfo._member0[0].m_nSkyLightFlags & 1u) == 0u)
	                        {
	                            _846 = vec3(0.0);
	                            break;
	                        }
	                        if (_852.z < 0.0)
	                        {
	                            float _849 = _847.y;
	                            do
	                            {
	                                if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w <= 0.0)
	                                {
	                                    _845 = false;
	                                    break;
	                                }
	                                if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w >= 1.0)
	                                {
	                                    _845 = true;
	                                    break;
	                                }
	                                if (_849 < g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w)
	                                {
	                                    _849 = min(_849 / g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w, 0.99999988079071044921875);
	                                    _845 = true;
	                                    break;
	                                }
	                                _849 = min((_849 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w) / (1.0 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w), 0.99999988079071044921875);
	                                _845 = false;
	                                break;
	                            } while(false);
	                            vec2 _1533 = _847;
	                            _1533.y = _849;
	                            _847 = _1533;
	                            _848 = _845;
	                        }
	                        else
	                        {
	                            _848 = false;
	                        }
	                        if (_848)
	                        {
	                            float _1541 = sqrt(_847.y);
	                            float _1543 = 6.283185482025146484375 * _847.x;
	                            _850 = vec3(cos(_1543) * _1541, sin(_1543) * _1541, sqrt(max(0.0, 1.0 - _847.y)));
	                            _851 = g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.xyz;
	                        }
	                        else
	                        {
	                            _850 = _852;
	                            _851 = vec3(0.0);
	                        }
	                        if (g_SceneGlobalInfo._member0[0].m_nIBLCubeMap >= 0)
	                        {
	                            vec4 _1588 = textureLod(samplerCube(g_bindless_TextureCube[g_SceneGlobalInfo._member0[0].m_nIBLCubeMap], g_Sampler), normalize(g_SceneGlobalInfo._member0[0].m_mIBLTransformI * vec4(_850, 0.0)), 0.0);
	                            if (dot(_1588.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) < g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.w)
	                            {
	                                _851 += (g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.xyz * _1588.xyz);
	                            }
	                        }
	                        else
	                        {
	                            _851 += g_SceneGlobalInfo._member0[0].m_vSkyColor.xyz;
	                        }
	                        if (_853 > 1)
	                        {
	                            _851 *= g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.w;
	                        }
	                        if (_848)
	                        {
	                            _851 *= g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.xyz;
	                        }
	                        _846 = _851;
	                        break;
	                    } while(false);
	                    _855 += ((_856 * _846) * _857);
	                    break;
	                }
	                uint _552 = g_instanceBuffer_1._member0[uint(p.nInstance)].nMaterialFlags_nInstanceFlags;
	                if ((int((_552 >> uint(16)) & 65535u) & 4) != 0)
	                {
	                    break;
	                }
	                vec3 _540 = _546;
	                vec3 _539 = _545;
	                vec3 _538 = p.vSmoothPositionWs;
	                vec3 _537 = p.vFaceNormalWs;
	                float _536 = p.flHitT;
	                f16vec3 _430 = p.material.vNormalWs;
	                float16_t _429 = p.material.flMetalness;
	                f16vec3 _428 = p.material.vAlbedo;
	                float16_t _427 = p.material.flRoughness;
	                f16vec3 _426 = p.material.vEmissive;
	                float16_t _425 = p.material.flReflectance;
	                uint _424 = p.material.nMaterialTypeAndFlags;
	                f16vec4 _423 = p.material.vMaterialBits;
	                uint _1640 = uint(p.nInstance);
	                uint _558 = g_instanceBuffer_1._member0[_1640].nMaterialFlags_nInstanceFlags;
	                float _557 = g_instanceBuffer_1._member0[_1640].fEmissiveBoost;
	                vec3 _556 = (_540 + (_539 * _536)) + (_537 * ((abs(_540) + vec3(abs(_536))) * 9.9999997473787516355514526367188e-05));
	                vec3 _555 = (_540 + (_539 * _536)) + ((-_537) * ((abs(_540) + vec3(abs(_536))) * 9.9999997473787516355514526367188e-05));
	                vec3 _554 = _537;
	                int _553 = int(_558 & 65535u);
	                vec3 _563 = vec3(0.0);
	                vec3 _562 = vec3(0.0);
	                float _561 = 0.0;
	                float _560 = 0.0;
	                vec3 _559 = vec3(0.0);
	                f16vec3 _453 = _430;
	                float16_t _452 = _429;
	                f16vec3 _451 = _428;
	                f16vec3 _449 = _426;
	                float16_t _448 = _425;
	                uint _447 = _424;
	                f16vec4 _446 = _423;
	                float16_t _450 = float16_t(max(float(_427), 0.07999999821186065673828125));
	                vec3 _1688 = vec3(_430);
	                vec3 _842 = vec3(0.0);
	                vec3 _843 = vec3(0.0);
	                float _1689 = _1688.z;
	                if (_1689 >= 0.0)
	                {
	                    _841 = 1.0;
	                }
	                else
	                {
	                    _841 = -1.0;
	                }
	                float _1696 = (-1.0) / (_841 + _1689);
	                float _1697 = _1688.x;
	                float _1698 = _1688.y;
	                float _1700 = (_1697 * _1698) * _1696;
	                vec3 _1705 = _842;
	                _1705.x = 1.0 + (((_841 * _1697) * _1697) * _1696);
	                _1705.y = _841 * _1700;
	                _1705.z = (-_841) * _1697;
	                _842 = _1705;
	                vec3 _1712 = _843;
	                _1712.x = _1700;
	                _1712.y = _841 + ((_1698 * _1698) * _1696);
	                _1712.z = -_1698;
	                _843 = _1712;
	                _563 = _1705;
	                _562 = _1712;
	                vec3 _1724 = transpose(mat3(_1705, _1712, vec3(_453))) * (-_539);
	                _559 = _1724;
	                vec3 _1732 = vec3(mix(f16vec3(_448), _451, f16vec3(_452)));
	                _561 = dot((_1732 + ((vec3(1.0) - _1732) * pow(max(0.0, 1.0 - _1724.z), 5.0))).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                if ((_447 & 65535u) == 1u)
	                {
	                    float _1751 = dot(vec3(_446.xyz).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                    _560 = _1751 / max(9.9999997473787516355514526367188e-05, _1751 + dot(vec3(_451).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)));
	                }
	                f16vec3 _386 = _453;
	                float16_t _385 = _452;
	                f16vec3 _384 = _451;
	                float16_t _383 = _450;
	                f16vec3 _382 = _449;
	                float16_t _381 = _448;
	                uint _380 = _447;
	                f16vec4 _379 = _446;
	                vec3 _445 = _563;
	                vec3 _444 = _562;
	                float _443 = _561;
	                float _442 = _560;
	                vec3 _441 = _559;
	                if ((_1388 & 6u) != 0u)
	                {
	                    if ((_1388 & 2u) != 0u)
	                    {
	                        _844 = (_553 & 256) != 0;
	                    }
	                    else
	                    {
	                        _844 = false;
	                    }
	                    if (_844)
	                    {
	                        _382 *= float16_t(_557);
	                    }
	                    else
	                    {
	                        if ((_1388 & 4u) != 0u)
	                        {
	                            _844 = (_553 & 512) != 0;
	                        }
	                        else
	                        {
	                            _844 = false;
	                        }
	                        if (_844)
	                        {
	                            _382 *= float16_t(_557);
	                        }
	                        else
	                        {
	                            _382 = f16vec3(vec3(0.0));
	                        }
	                    }
	                }
	                if ((_1388 & 1u) != 0u)
	                {
	                    _844 = any(notEqual(_538, vec3(3.4028234663852885981170418348452e+38)));
	                }
	                else
	                {
	                    _844 = false;
	                }
	                vec3 _1817 = _538 - _556;
	                float _1818 = length(_1817);
	                vec3 _566 = _556;
	                float _565 = 0.0;
	                vec3 _564 = vec4(_1817 / vec3(_1818), _1818).xyz;
	                if (_844)
	                {
	                    _840 = _1818;
	                }
	                else
	                {
	                    _840 = 0.0;
	                }
	                p_1 = PayloadShadow_t(1.0);
	                traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _566, _565, _564, _840, 1);
	                if (_844)
	                {
	                    _840 = p_1.m_flVisibility;
	                }
	                else
	                {
	                    _840 = 0.0;
	                }
	                if (_840 == 1.0)
	                {
	                    _556 = _538;
	                    _554 = vec3(_430);
	                }
	                vec3 _544 = _556;
	                vec3 _543 = _555;
	                vec3 _542 = _554;
	                int _541 = _553;
	                f16vec3 _371 = _386;
	                float16_t _370 = _385;
	                f16vec3 _369 = _384;
	                float16_t _368 = _383;
	                f16vec3 _367 = _382;
	                float16_t _366 = _381;
	                uint _365 = _380;
	                f16vec4 _364 = _379;
	                vec3 _435 = _445;
	                vec3 _434 = _444;
	                float _433 = _443;
	                float _432 = _442;
	                vec3 _431 = _441;
	                if (!(dot(_554, -_852) > 0.0))
	                {
	                    if ((_541 & 2048) != 0)
	                    {
	                        _542 = -_542;
	                        _371 = -_371;
	                        vec3 _2156 = _550;
	                        _550 = _549;
	                        _549 = _2156;
	                    }
	                    else
	                    {
	                        vec2 _1884 = imageLoad(g_RandomSamples, ivec3(_491.xy, int(1u + uint(_853)))).xy;
	                        f16vec3 _1886 = f16vec3(vec3(0.0));
	                        vec2 _1892 = _1884;
	                        _1892.y = 0.0;
	                        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _567, 3.4028234663852885981170418348452e+38, _1884.y, -1, false, MaterialDataMinimal_t(_1886, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _1886, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                        traceRayEXT(g_AccelStruct, 16u, 4u, 0u, 2u, 0u, _546, _1472 * 0.99989998340606689453125, _545, _1472 * 1.00010001659393310546875, 0);
	                        vec2 _1925 = _1884;
	                        _1925.y = p.flOpacityRng;
	                        _858 = _1925;
	                        if (p.nInstance != (-1))
	                        {
	                            vec3 _535 = _546;
	                            vec3 _534 = _545;
	                            vec3 _533 = p.vSmoothPositionWs;
	                            vec3 _532 = p.vFaceNormalWs;
	                            float _531 = p.flHitT;
	                            f16vec3 _422 = p.material.vNormalWs;
	                            float16_t _421 = p.material.flMetalness;
	                            f16vec3 _420 = p.material.vAlbedo;
	                            float16_t _419 = p.material.flRoughness;
	                            f16vec3 _418 = p.material.vEmissive;
	                            float16_t _417 = p.material.flReflectance;
	                            uint _416 = p.material.nMaterialTypeAndFlags;
	                            f16vec4 _415 = p.material.vMaterialBits;
	                            uint _1932 = uint(p.nInstance);
	                            uint _573 = g_instanceBuffer_1._member0[_1932].nMaterialFlags_nInstanceFlags;
	                            float _572 = g_instanceBuffer_1._member0[_1932].fEmissiveBoost;
	                            vec3 _571 = (_535 + (_534 * _531)) + (_532 * ((abs(_535) + vec3(abs(_531))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _570 = (_535 + (_534 * _531)) + ((-_532) * ((abs(_535) + vec3(abs(_531))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _569 = _532;
	                            int _568 = int(_573 & 65535u);
	                            vec3 _578 = vec3(0.0);
	                            vec3 _577 = vec3(0.0);
	                            float _576 = 0.0;
	                            float _575 = 0.0;
	                            vec3 _574 = vec3(0.0);
	                            f16vec3 _466 = _422;
	                            float16_t _465 = _421;
	                            f16vec3 _464 = _420;
	                            f16vec3 _462 = _418;
	                            float16_t _461 = _417;
	                            uint _460 = _416;
	                            f16vec4 _459 = _415;
	                            float16_t _463 = float16_t(max(float(_419), 0.07999999821186065673828125));
	                            vec3 _1980 = vec3(_422);
	                            vec3 _837 = vec3(0.0);
	                            vec3 _838 = vec3(0.0);
	                            float _1981 = _1980.z;
	                            if (_1981 >= 0.0)
	                            {
	                                _836 = 1.0;
	                            }
	                            else
	                            {
	                                _836 = -1.0;
	                            }
	                            float _1988 = (-1.0) / (_836 + _1981);
	                            float _1989 = _1980.x;
	                            float _1990 = _1980.y;
	                            float _1992 = (_1989 * _1990) * _1988;
	                            vec3 _1997 = _837;
	                            _1997.x = 1.0 + (((_836 * _1989) * _1989) * _1988);
	                            _1997.y = _836 * _1992;
	                            _1997.z = (-_836) * _1989;
	                            _837 = _1997;
	                            vec3 _2004 = _838;
	                            _2004.x = _1992;
	                            _2004.y = _836 + ((_1990 * _1990) * _1988);
	                            _2004.z = -_1990;
	                            _838 = _2004;
	                            _578 = _1997;
	                            _577 = _2004;
	                            vec3 _2016 = transpose(mat3(_1997, _2004, vec3(_466))) * (-_534);
	                            _574 = _2016;
	                            vec3 _2024 = vec3(mix(f16vec3(_461), _464, f16vec3(_465)));
	                            _576 = dot((_2024 + ((vec3(1.0) - _2024) * pow(max(0.0, 1.0 - _2016.z), 5.0))).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                            if ((_460 & 65535u) == 1u)
	                            {
	                                float _2043 = dot(vec3(_459.xyz).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                                _575 = _2043 / max(9.9999997473787516355514526367188e-05, _2043 + dot(vec3(_464).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)));
	                            }
	                            f16vec3 _394 = _466;
	                            float16_t _393 = _465;
	                            f16vec3 _392 = _464;
	                            float16_t _391 = _463;
	                            f16vec3 _390 = _462;
	                            float16_t _389 = _461;
	                            uint _388 = _460;
	                            f16vec4 _387 = _459;
	                            vec3 _458 = _578;
	                            vec3 _457 = _577;
	                            float _456 = _576;
	                            float _455 = _575;
	                            vec3 _454 = _574;
	                            if ((_1388 & 6u) != 0u)
	                            {
	                                if ((_1388 & 2u) != 0u)
	                                {
	                                    _839 = (_568 & 256) != 0;
	                                }
	                                else
	                                {
	                                    _839 = false;
	                                }
	                                if (_839)
	                                {
	                                    _390 *= float16_t(_572);
	                                }
	                                else
	                                {
	                                    if ((_1388 & 4u) != 0u)
	                                    {
	                                        _839 = (_568 & 512) != 0;
	                                    }
	                                    else
	                                    {
	                                        _839 = false;
	                                    }
	                                    if (_839)
	                                    {
	                                        _390 *= float16_t(_572);
	                                    }
	                                    else
	                                    {
	                                        _390 = f16vec3(vec3(0.0));
	                                    }
	                                }
	                            }
	                            if ((_1388 & 1u) != 0u)
	                            {
	                                _839 = any(notEqual(_533, vec3(3.4028234663852885981170418348452e+38)));
	                            }
	                            else
	                            {
	                                _839 = false;
	                            }
	                            vec3 _2109 = _533 - _571;
	                            float _2110 = length(_2109);
	                            vec3 _581 = _571;
	                            float _580 = 0.0;
	                            vec3 _579 = vec4(_2109 / vec3(_2110), _2110).xyz;
	                            if (_839)
	                            {
	                                _835 = _2110;
	                            }
	                            else
	                            {
	                                _835 = 0.0;
	                            }
	                            p_1 = PayloadShadow_t(1.0);
	                            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _581, _580, _579, _835, 1);
	                            if (_839)
	                            {
	                                _835 = p_1.m_flVisibility;
	                            }
	                            else
	                            {
	                                _835 = 0.0;
	                            }
	                            if (_835 == 1.0)
	                            {
	                                _571 = _533;
	                                _569 = vec3(_422);
	                            }
	                            _544 = _571;
	                            _543 = _570;
	                            _542 = _569;
	                            _541 = _568;
	                            _371 = _394;
	                            _370 = _393;
	                            _369 = _392;
	                            _368 = _391;
	                            _367 = _390;
	                            _366 = _389;
	                            _365 = _388;
	                            _364 = _387;
	                            _435 = _458;
	                            _434 = _457;
	                            _433 = _456;
	                            _432 = _455;
	                            _431 = _454;
	                        }
	                        else
	                        {
	                            break;
	                        }
	                    }
	                }
	                vec3 _530 = _544;
	                vec3 _529 = _543;
	                vec3 _528 = _542;
	                f16vec3 _363 = _371;
	                float16_t _362 = _370;
	                f16vec3 _361 = _369;
	                float16_t _360 = _368;
	                float16_t _359 = _366;
	                uint _358 = _365;
	                f16vec4 _357 = _364;
	                vec3 _414 = _435;
	                vec3 _413 = _434;
	                vec3 _412 = _431;
	                vec3 _2173 = (_544 + _543) * 0.5;
	                bool _2174 = _853 != 0;
	                f16vec4 _583 = _364;
	                if ((_365 & 65535u) == 1u)
	                {
	                    _830 = any(greaterThan(vec3(_583.xyz), vec3(0.0)));
	                }
	                else
	                {
	                    _830 = false;
	                }
	                if (_830)
	                {
	                    _831 = true;
	                }
	                else
	                {
	                    f16vec4 _582 = _357;
	                    if ((_358 & 65535u) == 2u)
	                    {
	                        _829 = float(_582.x) > 0.0;
	                    }
	                    else
	                    {
	                        _829 = false;
	                    }
	                    _831 = _829;
	                }
	                vec2 _2212 = imageLoad(g_RandomSamples, ivec3(_491.xy, int(1u + ((2u * _490) + uint(_853))))).xy;
	                bool _832 = false;
	                vec3 _2225 = (_530 + _529) * 0.5;
	                uvec3 _2233 = min(uvec3(max(fma(_2225, _486, _487), vec3(0.0))), (_488 - uvec3(1u)));
	                uint _824 = 0u;
	                vec3 _825 = vec3(0.0);
	                for (;;)
	                {
	                    if (!(_824 < _489))
	                    {
	                        break;
	                    }
	                    uint _2249 = _489 * _488.x;
	                    uint _826 = subgroupOr(g_LightBins_1._member0[((((_2249 * _488.y) * _2233.z) + (_2249 * _2233.y)) + (_489 * _2233.x)) + _824]);
	                    vec3 _827 = _825;
	                    for (;;)
	                    {
	                        if (!(_826 != 0u))
	                        {
	                            break;
	                        }
	                        uint _2273 = _826;
	                        uint _2277 = uint(findLSB(_2273)) + (_824 * 32u);
	                        uint _2279 = _2273 & (_2273 - 1u);
	                        if ((uint(g_Lights_1._member0[_2277].m_nPathTraceFlags) & 1u) == 0u)
	                        {
	                            _826 = _2279;
	                            continue;
	                        }
	                        if ((g_Lights_1._member0[_2277].m_nPathTraceFlags & 8) != 0)
	                        {
	                            _832 = true;
	                            _826 = _2279;
	                            continue;
	                        }
	                        do
	                        {
	                            do
	                            {
	                                vec4 _2305 = g_Lights_1._member0[_2277].m_mToClipSpace * vec4(_2225.xyz, 1.0);
	                                vec3 _2309 = _2305.xyz / vec3(_2305.w);
	                                vec4 _2311;
	                                _2311.x = _2309.x;
	                                _2311.y = _2309.y;
	                                _2311.z = _2309.z;
	                                if (all(greaterThanEqual(_2311.xyz, vec3(-1.0, -1.0, 0.0))))
	                                {
	                                    _821 = all(lessThanEqual(_2311.xyz, vec3(1.0)));
	                                }
	                                else
	                                {
	                                    _821 = false;
	                                }
	                                if (!_821)
	                                {
	                                    _822 = false;
	                                    break;
	                                }
	                                if (!all(lessThanEqual(abs((g_Lights_1._member0[_2277].m_mBarnIlluminationFromWorld * vec4(_2225, 1.0)).xyz), vec3(1.0))))
	                                {
	                                    _822 = false;
	                                    break;
	                                }
	                                _822 = true;
	                                break;
	                            } while(false);
	                            if (!_822)
	                            {
	                                _823 = vec3(0.0);
	                                break;
	                            }
	                            vec4 _2348 = g_Lights_1._member0[_2277].m_mToClipSpace * vec4(_2225.xyz, 1.0);
	                            vec3 _2352 = _2348.xyz / vec3(_2348.w);
	                            vec4 _2354;
	                            _2354.x = _2352.x;
	                            _2354.y = _2352.y;
	                            _2354.z = _2352.z;
	                            if (_2174)
	                            {
	                                _820 = g_Lights_1._member0[_2277].m_vBounceColor.xyz;
	                            }
	                            else
	                            {
	                                _820 = g_Lights_1._member0[_2277].m_vColor.xyz;
	                            }
	                            if (true)
	                            {
	                                if (g_Lights_1._member0[_2277].m_nCookie >= 0)
	                                {
	                                    if (g_Lights_1._member0[_2277].m_bSphericalCookie != 0)
	                                    {
	                                        vec4 _2412 = vec4(-g_Lights_1._member0[_2277].m_vOrientation.xyz, g_Lights_1._member0[_2277].m_vOrientation.w);
	                                        vec4 _2414 = _2412.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                                        vec3 _2417 = _2414.xyz;
	                                        vec3 _2418 = vec4((-normalize(g_Lights_1._member0[_2277].m_vLightPosition.xyz - _2225)).xyz, 0.0).xyz;
	                                        vec4 _2425 = vec4((_2418 * _2414.w) + cross(_2418, _2417), -dot(_2418, _2417));
	                                        vec3 _2426 = _2425.xyz;
	                                        float _2427 = _2412.w;
	                                        vec3 _2429 = _2412.xyz;
	                                        float _2430 = _2425.w;
	                                        vec3 _2438 = vec4(((_2426 * _2427) + (_2429 * _2430)) + cross(_2429, _2426), _338).xyz;
	                                        vec2 _2447 = vec2(atan(_2438.y, -_2438.x) * 0.15915493667125701904296875, acos(_2438.z) * 0.3183098733425140380859375);
	                                        vec2 _2454 = (_2447.xy * g_Lights_1._member0[_2277].m_vCookieParameters.zw) + g_Lights_1._member0[_2277].m_vCookieParameters.xy;
	                                        vec2 _2456 = _2447;
	                                        _2456.x = _2454.x;
	                                        _2456.y = _2454.y;
	                                        _819 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_2277].m_nCookie], g_Sampler)), _2456, 0.0).xyz;
	                                    }
	                                    else
	                                    {
	                                        vec2 _2385 = fma(_2354.xyz.xy, vec2(0.5, -0.5), vec2(0.5));
	                                        vec2 _2392 = (_2385.xy * g_Lights_1._member0[_2277].m_vCookieParameters.zw) + g_Lights_1._member0[_2277].m_vCookieParameters.xy;
	                                        vec2 _2394 = _2385;
	                                        _2394.x = _2392.x;
	                                        _2394.y = _2392.y;
	                                        _819 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_2277].m_nCookie], g_CookieSampler)), _2394, 0.0).xyz;
	                                    }
	                                }
	                                else
	                                {
	                                    _819 = vec3(1.0);
	                                }
	                                _820 *= _819;
	                            }
	                            if (g_Lights_1._member0[_2277].m_nLuminaireType != 0)
	                            {
	                                _820 = (_820 * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].w) * 0.3183098733425140380859375;
	                            }
	                            else
	                            {
	                                if (!(g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0))
	                                {
	                                    vec3 _2483 = g_Lights_1._member0[_2277].m_vLightPosition.xyz - _2225;
	                                    _820 *= (vec3(g_Lights_1._member0[_2277].m_vLightPosition.w) / max(vec3(dot(_2483, _2483)), vec3(g_Lights_1._member0[_2277].m_vLightPosition.w)));
	                                }
	                            }
	                            if (g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.z > 0.0)
	                            {
	                                _816 = smoothstep(0.0, 1.0, _2354.xyz.z * g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.z);
	                            }
	                            else
	                            {
	                                _816 = 1.0;
	                            }
	                            if (g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.w > 0.0)
	                            {
	                                _816 *= smoothstep(0.0, 1.0, (1.0 - _2354.xyz.z) * g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.w);
	                            }
	                            if (!(g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0))
	                            {
	                                vec3 _2537 = g_Lights_1._member0[_2277].m_vLightPosition.xyz - _2225;
	                                float _2538 = length(_2537);
	                                vec3 _2540 = _2537 / vec3(_2538);
	                                float _2549 = _816 * smoothstep(0.0, 1.0, g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.x + (g_Lights_1._member0[_2277].m_vDistanceFade_vSkirt.y * _2538));
	                                if (g_Lights_1._member0[_2277].m_nLuminaireType != 2)
	                                {
	                                    _818 = g_Lights_1._member0[_2277].m_nLuminaireType != 1;
	                                }
	                                else
	                                {
	                                    _818 = false;
	                                }
	                                if (_818)
	                                {
	                                    float _2568 = 2.0 * g_Lights_1._member0[_2277].m_vOrientation.x;
	                                    float _2572 = 2.0 * g_Lights_1._member0[_2277].m_vOrientation.w;
	                                    vec3 _2586 = vec3((_2568 * g_Lights_1._member0[_2277].m_vOrientation.y) - (_2572 * g_Lights_1._member0[_2277].m_vOrientation.z), (1.0 - (_2568 * g_Lights_1._member0[_2277].m_vOrientation.x)) - ((2.0 * g_Lights_1._member0[_2277].m_vOrientation.z) * g_Lights_1._member0[_2277].m_vOrientation.z), ((2.0 * g_Lights_1._member0[_2277].m_vOrientation.y) * g_Lights_1._member0[_2277].m_vOrientation.z) + (_2572 * g_Lights_1._member0[_2277].m_vOrientation.x)) * g_Lights_1._member0[_2277].m_vAngleFade.z;
	                                    vec3 _2587 = _2540 - _2586;
	                                    vec3 _2588 = _2540 + _2586;
	                                    do
	                                    {
	                                        vec3 _2591 = _2588 - _2587;
	                                        float _2593 = dot(-_2587, _2591);
	                                        if (_2593 <= 0.0)
	                                        {
	                                            _814 = _2587;
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            float _2598 = dot(_2591, _2591);
	                                            if (_2593 > _2598)
	                                            {
	                                                _814 = _2588;
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                _814 = _2587 + (_2591 * (_2593 / _2598));
	                                                break;
	                                            }
	                                            break;
	                                        }
	                                        break;
	                                    } while(false);
	                                    if (any(notEqual(_814, vec3(0.0))))
	                                    {
	                                        _815 = normalize(_814);
	                                    }
	                                    else
	                                    {
	                                        _815 = _814;
	                                    }
	                                    float _2622 = 2.0 * g_Lights_1._member0[_2277].m_vOrientation.x;
	                                    float _2625 = 2.0 * g_Lights_1._member0[_2277].m_vOrientation.w;
	                                    _817 = _2549 * saturate(g_Lights_1._member0[_2277].m_vAngleFade.x + (g_Lights_1._member0[_2277].m_vAngleFade.y * dot(vec3((1.0 - ((2.0 * g_Lights_1._member0[_2277].m_vOrientation.y) * g_Lights_1._member0[_2277].m_vOrientation.y)) - ((2.0 * g_Lights_1._member0[_2277].m_vOrientation.z) * g_Lights_1._member0[_2277].m_vOrientation.z), (_2622 * g_Lights_1._member0[_2277].m_vOrientation.y) + (_2625 * g_Lights_1._member0[_2277].m_vOrientation.z), (_2622 * g_Lights_1._member0[_2277].m_vOrientation.z) - (_2625 * g_Lights_1._member0[_2277].m_vOrientation.y)), _815)));
	                                }
	                                else
	                                {
	                                    _817 = _2549;
	                                }
	                            }
	                            else
	                            {
	                                _817 = _816;
	                            }
	                            if (g_Lights_1._member0[_2277].m_nCookie == (-1))
	                            {
	                                do
	                                {
	                                    vec2 _2654 = abs(_2354.xyz.xy);
	                                    if (g_Lights_1._member0[_2277].m_vCookieParameters.z == 0.0)
	                                    {
	                                        _812 = smoothstep(1.0, g_Lights_1._member0[_2277].m_vCookieParameters.x, _2654.x) * smoothstep(1.0, g_Lights_1._member0[_2277].m_vCookieParameters.y, _2654.y);
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        float _2659 = _2654.x;
	                                        float _2663 = _2654.y;
	                                        float _2670 = (-0.5) * g_Lights_1._member0[_2277].m_vCookieParameters.z;
	                                        float _2672 = (g_Lights_1._member0[_2277].m_vCookieParameters.x * g_Lights_1._member0[_2277].m_vCookieParameters.y) * pow(max(pow(g_Lights_1._member0[_2277].m_vCookieParameters.y * _2659, 2.0 / g_Lights_1._member0[_2277].m_vCookieParameters.z) + pow(g_Lights_1._member0[_2277].m_vCookieParameters.x * _2663, 2.0 / g_Lights_1._member0[_2277].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _2670);
	                                        float _2679 = pow(max(pow(_2659, 2.0 / g_Lights_1._member0[_2277].m_vCookieParameters.z) + pow(_2663, 2.0 / g_Lights_1._member0[_2277].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _2670);
	                                        if (_2672 < _2679)
	                                        {
	                                            _812 = smoothstep(_2679, _2672, 1.0);
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            if (_2679 > 1.0)
	                                            {
	                                                _813 = 1.0;
	                                            }
	                                            else
	                                            {
	                                                _813 = 0.0;
	                                            }
	                                            _812 = _813;
	                                            break;
	                                        }
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                _817 *= _812;
	                            }
	                            _823 = _820 * _817;
	                            break;
	                        } while(false);
	                        SPIRV_CROSS_BRANCH
	                        if (any(greaterThan(_823, vec3(0.0))))
	                        {
	                            _810 = false;
	                            do
	                            {
	                                switch (g_Lights_1._member0[_2277].m_nLuminaireType)
	                                {
	                                    case 0:
	                                    {
	                                        _828 = 1.0;
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0)
	                                            {
	                                                _785 = vec4(normalize(g_Lights_1._member0[_2277].m_vLightPosition.xyz), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3227 = g_Lights_1._member0[_2277].m_vLightPosition.xyz - _2225;
	                                                float _3228 = length(_3227);
	                                                _785 = vec4(_3227 / vec3(_3228), _3228);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _810 = true;
	                                        _811 = _785;
	                                        break;
	                                    }
	                                    case 1:
	                                    {
	                                        vec3 _3067 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].xyz - g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz;
	                                        vec3 _3071 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[2].xyz - g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz;
	                                        float _3072 = length(_3067);
	                                        float _3073 = length(_3071);
	                                        vec3 _3075 = _3067 / vec3(_3072);
	                                        vec3 _3077 = _3071 / vec3(_3073);
	                                        vec3 _3078 = cross(_3075, _3077);
	                                        vec3 _3079 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz - _2225;
	                                        float _3080 = dot(_3079, _3078);
	                                        if (_3080 > 0.0)
	                                        {
	                                            _787 = _3080 * (-1.0);
	                                            _788 = _3078 * (-1.0);
	                                        }
	                                        else
	                                        {
	                                            _787 = _3080;
	                                            _788 = _3078;
	                                        }
	                                        float _3089 = dot(_3079, _3075);
	                                        float _3090 = dot(_3079, _3077);
	                                        float _3091 = _3089 + _3072;
	                                        float _3092 = _3090 + _3073;
	                                        vec3 _3095 = vec3(_3089, _3090, _787);
	                                        vec3 _3096 = vec3(_3089, _3092, _787);
	                                        vec3 _3097 = vec3(_3091, _3090, _787);
	                                        vec3 _3098 = vec3(_3091, _3092, _787);
	                                        vec3 _3100 = normalize(cross(_3095, _3097));
	                                        vec3 _3102 = normalize(cross(_3097, _3098));
	                                        vec3 _3104 = normalize(cross(_3098, _3096));
	                                        vec3 _3106 = normalize(cross(_3096, _3095));
	                                        float _3123 = _3100.z;
	                                        float _3127 = (6.283185482025146484375 - acos(clamp(-dot(_3104, _3106), -1.0, 1.0))) - acos(clamp(-dot(_3106, _3100), -1.0, 1.0));
	                                        float _3129 = (acos(clamp(-dot(_3100, _3102), -1.0, 1.0)) + acos(clamp(-dot(_3102, _3104), -1.0, 1.0))) - _3127;
	                                        if (isnan(_3129))
	                                        {
	                                            _789 = 0.0;
	                                        }
	                                        else
	                                        {
	                                            _789 = _3129;
	                                        }
	                                        float _3137 = (_2212.x * _789) + _3127;
	                                        float _3142 = ((cos(_3137) * _3123) - _3104.z) / sin(_3137);
	                                        if (_3142 > 0.0)
	                                        {
	                                            _790 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _790 = -1.0;
	                                        }
	                                        float _3151 = _790;
	                                        float _3153 = clamp((1.0 / sqrt((_3142 * _3142) + (_3123 * _3123))) * _3151, -1.0, 1.0);
	                                        float _3161 = clamp((-(_3153 * _787)) / sqrt(1.0 - (_3153 * _3153)), _3089, _3091);
	                                        float _3164 = sqrt((_3161 * _3161) + (_787 * _787));
	                                        float _3165 = _3164 * _3164;
	                                        float _3168 = _3090 / sqrt(_3165 + (_3090 * _3090));
	                                        float _3175 = _3168 + (_2212.y * ((_3092 / sqrt(_3165 + (_3092 * _3092))) - _3168));
	                                        float _3176 = _3175 * _3175;
	                                        if (_3176 < 0.99999988079071044921875)
	                                        {
	                                            _790 = (_3175 * _3164) / sqrt(1.0 - _3176);
	                                        }
	                                        else
	                                        {
	                                            _790 = _3092;
	                                        }
	                                        vec3 _3193 = ((_2225 + (_3075 * _3161)) + (_3077 * _790)) + (_788 * _787);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0)
	                                            {
	                                                _786 = vec4(normalize(_3193), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3204 = _3193 - _2225;
	                                                float _3205 = length(_3204);
	                                                _786 = vec4(_3204 / vec3(_3205), _3205);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _828 = 1.0 / _789;
	                                        _810 = true;
	                                        _811 = _786;
	                                        break;
	                                    }
	                                    case 2:
	                                    {
	                                        do
	                                        {
	                                            vec2 _2975 = (_2212 * 2.0) - vec2(1.0);
	                                            if (all(equal(_2975, vec2(0.0))))
	                                            {
	                                                _794 = vec2(0.0);
	                                                break;
	                                            }
	                                            float _2980 = _2975.x;
	                                            float _2982 = _2975.y;
	                                            if (abs(_2980) > abs(_2982))
	                                            {
	                                                _795 = _2980;
	                                                _796 = 0.785398185253143310546875 * (_2982 / _2980);
	                                            }
	                                            else
	                                            {
	                                                _795 = _2982;
	                                                _796 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_2980 / _2982));
	                                            }
	                                            _794 = vec2(cos(_796), sin(_796)) * _795;
	                                            break;
	                                        } while(false);
	                                        vec3 _3016 = (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz + (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].xyz * _794.x)) + (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[2].xyz * _794.y);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0)
	                                            {
	                                                _793 = vec4(normalize(_3016), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3027 = _3016 - _2225;
	                                                float _3028 = length(_3027);
	                                                _793 = vec4(_3027 / vec3(_3028), _3028);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_793.w))
	                                        {
	                                            _791 = true;
	                                        }
	                                        else
	                                        {
	                                            _791 = isnan(_793.w);
	                                        }
	                                        if (!_791)
	                                        {
	                                            _792 = _793.w * _793.w;
	                                        }
	                                        else
	                                        {
	                                            _792 = 1.0;
	                                        }
	                                        _828 = _792 / (max(0.0, dot(g_Lights_1._member0[_2277].m_vLuminaireVectors.data[3].xyz, -_793.xyz)) * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].w);
	                                        _810 = true;
	                                        _811 = _793;
	                                        break;
	                                    }
	                                    case 3:
	                                    {
	                                        vec3 _2870 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz - _2225;
	                                        float _2871 = dot(_2870, _2870);
	                                        float _2872 = sqrt(_2871);
	                                        vec3 _2874 = _2870 / vec3(_2872);
	                                        float _2875 = _2874.z;
	                                        if (_2875 >= 0.0)
	                                        {
	                                            _798 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _798 = -1.0;
	                                        }
	                                        float _2882 = (-1.0) / (_798 + _2875);
	                                        float _2883 = _2874.x;
	                                        float _2884 = _2874.y;
	                                        float _2886 = (_2883 * _2884) * _2882;
	                                        vec3 _2891 = _799;
	                                        _2891.x = 1.0 + (((_798 * _2883) * _2883) * _2882);
	                                        _2891.y = _798 * _2886;
	                                        _2891.z = (-_798) * _2883;
	                                        _799 = _2891;
	                                        vec3 _2898 = _800;
	                                        _2898.x = _2886;
	                                        _2898.y = _798 + ((_2884 * _2884) * _2882);
	                                        _2898.z = -_2884;
	                                        _800 = _2898;
	                                        float _2906 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].x * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].x;
	                                        float _2910 = sqrt(max(0.0, 1.0 - (_2906 / _2871)));
	                                        float _2911 = _2212.x;
	                                        float _2914 = (1.0 - _2911) + (_2911 * _2910);
	                                        float _2918 = sqrt(max(0.0, 1.0 - (_2914 * _2914)));
	                                        float _2920 = _2212.y * 6.283185482025146484375;
	                                        float _2922 = _2872 * _2872;
	                                        float _2928 = (_2872 * _2914) - sqrt(max(0.0, _2906 - ((_2922 * _2918) * _2918)));
	                                        float _2934 = ((_2922 + _2906) - (_2928 * _2928)) / ((2.0 * _2872) * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].x);
	                                        float _2938 = sqrt(max(0.0, 1.0 - (_2934 * _2934)));
	                                        vec3 _2950 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz + ((mat3(-_2891, -_2898, -_2874) * vec3(cos(_2920) * _2938, sin(_2920) * _2938, _2934)) * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].x);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0)
	                                            {
	                                                _797 = vec4(normalize(_2950), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2961 = _2950 - _2225;
	                                                float _2962 = length(_2961);
	                                                _797 = vec4(_2961 / vec3(_2962), _2962);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _828 = 0.15915493667125701904296875 / (1.0 - _2910);
	                                        _810 = true;
	                                        _811 = _797;
	                                        break;
	                                    }
	                                    case 4:
	                                    case 5:
	                                    {
	                                        vec2 _807 = _2212;
	                                        if (_2212.x < g_Lights_1._member0[_2277].m_vLuminaireVectors.data[4].y)
	                                        {
	                                            vec2 _2761 = _807;
	                                            _2761.x = clamp(_2761.x / g_Lights_1._member0[_2277].m_vLuminaireVectors.data[4].y, 0.0, 0.99999988079071044921875);
	                                            _807 = _2761;
	                                            vec3 _2767 = normalize(g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz - g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].xyz);
	                                            if (_2761.x >= 0.5)
	                                            {
	                                                vec2 _2778 = _807;
	                                                _2778.x = clamp((2.0 * _2778.x) - 1.0, 0.0, 0.99999988079071044921875);
	                                                _807 = _2778;
	                                                _808 = -_2767;
	                                                _809 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].xyz;
	                                            }
	                                            else
	                                            {
	                                                vec2 _2773 = _807;
	                                                _2773.x = clamp(2.0 * _2773.x, 0.0, 0.99999988079071044921875);
	                                                _807 = _2773;
	                                                _808 = _2767;
	                                                _809 = g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz;
	                                            }
	                                            do
	                                            {
	                                                vec2 _2789 = (_807 * 2.0) - vec2(1.0);
	                                                if (all(equal(_2789, vec2(0.0))))
	                                                {
	                                                    _804 = vec2(0.0);
	                                                    break;
	                                                }
	                                                float _2794 = _2789.x;
	                                                float _2796 = _2789.y;
	                                                if (abs(_2794) > abs(_2796))
	                                                {
	                                                    _805 = _2794;
	                                                    _806 = 0.785398185253143310546875 * (_2796 / _2794);
	                                                }
	                                                else
	                                                {
	                                                    _805 = _2796;
	                                                    _806 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_2794 / _2796));
	                                                }
	                                                _804 = vec2(cos(_806), sin(_806)) * _805;
	                                                break;
	                                            } while(false);
	                                            _809 += ((g_Lights_1._member0[_2277].m_vLuminaireVectors.data[2].xyz * _804.x) + (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[3].xyz * _804.y));
	                                        }
	                                        else
	                                        {
	                                            vec2 _2740 = _807;
	                                            _2740.x = clamp((_2740.x - g_Lights_1._member0[_2277].m_vLuminaireVectors.data[4].y) / (1.0 - g_Lights_1._member0[_2277].m_vLuminaireVectors.data[4].y), 0.0, 0.99999988079071044921875);
	                                            _807 = _2740;
	                                            vec3 _2755 = (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[2].xyz * cos(_2740.x * 6.283185482025146484375)) + (g_Lights_1._member0[_2277].m_vLuminaireVectors.data[3].xyz * sin(_2740.x * 6.283185482025146484375));
	                                            _808 = normalize(_2755);
	                                            _809 = mix(g_Lights_1._member0[_2277].m_vLuminaireVectors.data[0].xyz, g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].xyz, vec3(_2740.y)) + _2755;
	                                        }
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_2277].m_vLightPosition.w == 0.0)
	                                            {
	                                                _803 = vec4(normalize(_809), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2832 = _809 - _2225;
	                                                float _2833 = length(_2832);
	                                                _803 = vec4(_2832 / vec3(_2833), _2833);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_803.w))
	                                        {
	                                            _801 = true;
	                                        }
	                                        else
	                                        {
	                                            _801 = isnan(_803.w);
	                                        }
	                                        if (!_801)
	                                        {
	                                            _802 = _803.w * _803.w;
	                                        }
	                                        else
	                                        {
	                                            _802 = 1.0;
	                                        }
	                                        _828 = _802 / (max(0.0, dot(_808, -_803.xyz)) * g_Lights_1._member0[_2277].m_vLuminaireVectors.data[1].w);
	                                        _810 = true;
	                                        _811 = _803;
	                                        break;
	                                    }
	                                    default:
	                                    {
	                                        _828 = 0.0;
	                                        _810 = true;
	                                        _811 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	                                        break;
	                                    }
	                                }
	                                if (_810)
	                                {
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            bool _3245 = !(dot(_528, _811.xyz) > 0.0);
	                            vec3 _3247 = vec3(_363);
	                            vec3 _3252 = transpose(mat3(_414, _413, _3247)) * _811.xyz;
	                            float16_t _472 = _362;
	                            f16vec3 _471 = _361;
	                            float16_t _470 = _360;
	                            float16_t _469 = _359;
	                            uint _468 = _358;
	                            f16vec4 _467 = _357;
	                            vec3 _584 = _412;
	                            do
	                            {
	                                if (_3245)
	                                {
	                                    f16vec4 _585 = _467;
	                                    if ((_468 & 65535u) == 1u)
	                                    {
	                                        _780 = any(greaterThan(vec3(_585.xyz), vec3(0.0)));
	                                    }
	                                    else
	                                    {
	                                        _780 = false;
	                                    }
	                                    if (_780)
	                                    {
	                                        _784 = vec3(_467.xyz);
	                                    }
	                                    else
	                                    {
	                                        _784 = vec3(1.0);
	                                    }
	                                    _783 = _784 * 0.3183098733425140380859375;
	                                    break;
	                                }
	                                else
	                                {
	                                    vec3 _3272 = vec3(mix(f16vec3(_469), _471, f16vec3(_472)));
	                                    float _3274 = float(_470);
	                                    do
	                                    {
	                                        float _3277 = _3252.z;
	                                        vec3 _3279 = _3252 + _584;
	                                        if (_3277 <= 0.0)
	                                        {
	                                            _782 = true;
	                                        }
	                                        else
	                                        {
	                                            _782 = _584.z <= 0.0;
	                                        }
	                                        if (_782)
	                                        {
	                                            _781 = vec3(0.0);
	                                            break;
	                                        }
	                                        if (all(equal(_3279, vec3(0.0))))
	                                        {
	                                            _781 = vec3(0.0);
	                                            break;
	                                        }
	                                        vec3 _3292 = normalize(_3279);
	                                        float _3293 = _3292.z;
	                                        float _3301 = _3274 * _3274;
	                                        float _3302 = _3301 * _3301;
	                                        float _3306 = (((_3293 * _3302) - _3293) * _3293) + 1.0;
	                                        float _3310 = _3274 * _3274;
	                                        float _3311 = _3310 * _3310;
	                                        _781 = (_3272 + ((vec3(1.0) - _3272) * pow(max(0.0, 1.0 - dot(_3252, _3292)), 5.0))) * (((_3302 / max(9.9999999392252902907785028219223e-09, _3306 * _3306)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_3277 * sqrt(((_584.z - (_3311 * _584.z)) * _584.z) + _3311)) + (_584.z * sqrt(((_3277 - (_3311 * _3277)) * _3277) + _3311))))) * 0.3183098733425140380859375);
	                                        break;
	                                    } while(false);
	                                    _783 = ((vec3(_471) * (1.0 - float(_472))) * 0.3183098733425140380859375) + _781;
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            float _3363 = dot(_3247, _811.xyz);
	                            if (_3245)
	                            {
	                                _779 = -_3363;
	                            }
	                            else
	                            {
	                                _779 = _3363;
	                            }
	                            _827 += (((_823 / vec3(_828)) * (_783 * 3.1415927410125732421875)) * max(0.0, _779));
	                        }
	                        _826 = _2279;
	                        continue;
	                    }
	                    _824++;
	                    _825 = _827;
	                    continue;
	                }
	                if (_832)
	                {
	                    vec2 _770 = imageLoad(g_RandomSamples, ivec3(_491.xy, int(1u + (_490 + uint(_853))))).xy;
	                    vec3 _3387 = (_530 + _529) * 0.5;
	                    float _771 = 0.0;
	                    vec3 _590 = vec3(0.0);
	                    vec3 _589 = vec3(0.0);
	                    vec4 _588 = vec4(0.0);
	                    int _591 = -1;
	                    uvec3 _3395 = min(uvec3(max(fma(_3387, _486, _487), vec3(0.0))), (_488 - uvec3(1u)));
	                    float _772 = 0.0;
	                    uint _773 = 0u;
	                    for (;;)
	                    {
	                        if (!(_773 < _489))
	                        {
	                            break;
	                        }
	                        uint _3411 = _489 * _488.x;
	                        float _774 = _772;
	                        uint _775 = subgroupOr(g_LightBins_1._member0[((((_3411 * _488.y) * _3395.z) + (_3411 * _3395.y)) + (_489 * _3395.x)) + _773]);
	                        for (;;)
	                        {
	                            if (!(_775 != 0u))
	                            {
	                                break;
	                            }
	                            uint _3435 = _775;
	                            uint _3439 = uint(findLSB(_3435)) + (_773 * 32u);
	                            uint _3441 = _3435 & (_3435 - 1u);
	                            if ((uint(g_Lights_1._member0[_3439].m_nPathTraceFlags) & 1u) == 0u)
	                            {
	                                _775 = _3441;
	                                continue;
	                            }
	                            if (!((g_Lights_1._member0[_3439].m_nPathTraceFlags & 8) != 0))
	                            {
	                                _775 = _3441;
	                                continue;
	                            }
	                            do
	                            {
	                                do
	                                {
	                                    vec4 _3468 = g_Lights_1._member0[_3439].m_mToClipSpace * vec4(_3387.xyz, 1.0);
	                                    vec3 _3472 = _3468.xyz / vec3(_3468.w);
	                                    vec4 _3474;
	                                    _3474.x = _3472.x;
	                                    _3474.y = _3472.y;
	                                    _3474.z = _3472.z;
	                                    if (all(greaterThanEqual(_3474.xyz, vec3(-1.0, -1.0, 0.0))))
	                                    {
	                                        _767 = all(lessThanEqual(_3474.xyz, vec3(1.0)));
	                                    }
	                                    else
	                                    {
	                                        _767 = false;
	                                    }
	                                    if (!_767)
	                                    {
	                                        _768 = false;
	                                        break;
	                                    }
	                                    if (!all(lessThanEqual(abs((g_Lights_1._member0[_3439].m_mBarnIlluminationFromWorld * vec4(_3387, 1.0)).xyz), vec3(1.0))))
	                                    {
	                                        _768 = false;
	                                        break;
	                                    }
	                                    _768 = true;
	                                    break;
	                                } while(false);
	                                if (!_768)
	                                {
	                                    _769 = vec3(0.0);
	                                    break;
	                                }
	                                vec4 _3511 = g_Lights_1._member0[_3439].m_mToClipSpace * vec4(_3387.xyz, 1.0);
	                                vec3 _3515 = _3511.xyz / vec3(_3511.w);
	                                vec4 _3517;
	                                _3517.x = _3515.x;
	                                _3517.y = _3515.y;
	                                _3517.z = _3515.z;
	                                if (_2174)
	                                {
	                                    _766 = g_Lights_1._member0[_3439].m_vBounceColor.xyz;
	                                }
	                                else
	                                {
	                                    _766 = g_Lights_1._member0[_3439].m_vColor.xyz;
	                                }
	                                if (true)
	                                {
	                                    if (g_Lights_1._member0[_3439].m_nCookie >= 0)
	                                    {
	                                        if (g_Lights_1._member0[_3439].m_bSphericalCookie != 0)
	                                        {
	                                            vec4 _3575 = vec4(-g_Lights_1._member0[_3439].m_vOrientation.xyz, g_Lights_1._member0[_3439].m_vOrientation.w);
	                                            vec4 _3577 = _3575.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                                            vec3 _3580 = _3577.xyz;
	                                            vec3 _3581 = vec4((-normalize(g_Lights_1._member0[_3439].m_vLightPosition.xyz - _3387)).xyz, 0.0).xyz;
	                                            vec4 _3588 = vec4((_3581 * _3577.w) + cross(_3581, _3580), -dot(_3581, _3580));
	                                            vec3 _3589 = _3588.xyz;
	                                            float _3590 = _3575.w;
	                                            vec3 _3592 = _3575.xyz;
	                                            float _3593 = _3588.w;
	                                            vec3 _3601 = vec4(((_3589 * _3590) + (_3592 * _3593)) + cross(_3592, _3589), _338).xyz;
	                                            vec2 _3610 = vec2(atan(_3601.y, -_3601.x) * 0.15915493667125701904296875, acos(_3601.z) * 0.3183098733425140380859375);
	                                            vec2 _3617 = (_3610.xy * g_Lights_1._member0[_3439].m_vCookieParameters.zw) + g_Lights_1._member0[_3439].m_vCookieParameters.xy;
	                                            vec2 _3619 = _3610;
	                                            _3619.x = _3617.x;
	                                            _3619.y = _3617.y;
	                                            _765 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_3439].m_nCookie], g_Sampler)), _3619, 0.0).xyz;
	                                        }
	                                        else
	                                        {
	                                            vec2 _3548 = fma(_3517.xyz.xy, vec2(0.5, -0.5), vec2(0.5));
	                                            vec2 _3555 = (_3548.xy * g_Lights_1._member0[_3439].m_vCookieParameters.zw) + g_Lights_1._member0[_3439].m_vCookieParameters.xy;
	                                            vec2 _3557 = _3548;
	                                            _3557.x = _3555.x;
	                                            _3557.y = _3555.y;
	                                            _765 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_3439].m_nCookie], g_CookieSampler)), _3557, 0.0).xyz;
	                                        }
	                                    }
	                                    else
	                                    {
	                                        _765 = vec3(1.0);
	                                    }
	                                    _766 *= _765;
	                                }
	                                if (g_Lights_1._member0[_3439].m_nLuminaireType != 0)
	                                {
	                                    _766 = (_766 * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].w) * 0.3183098733425140380859375;
	                                }
	                                else
	                                {
	                                    if (!(g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0))
	                                    {
	                                        vec3 _3646 = g_Lights_1._member0[_3439].m_vLightPosition.xyz - _3387;
	                                        _766 *= (vec3(g_Lights_1._member0[_3439].m_vLightPosition.w) / max(vec3(dot(_3646, _3646)), vec3(g_Lights_1._member0[_3439].m_vLightPosition.w)));
	                                    }
	                                }
	                                if (g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.z > 0.0)
	                                {
	                                    _762 = smoothstep(0.0, 1.0, _3517.xyz.z * g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.z);
	                                }
	                                else
	                                {
	                                    _762 = 1.0;
	                                }
	                                if (g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.w > 0.0)
	                                {
	                                    _762 *= smoothstep(0.0, 1.0, (1.0 - _3517.xyz.z) * g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.w);
	                                }
	                                if (!(g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0))
	                                {
	                                    vec3 _3700 = g_Lights_1._member0[_3439].m_vLightPosition.xyz - _3387;
	                                    float _3701 = length(_3700);
	                                    vec3 _3703 = _3700 / vec3(_3701);
	                                    float _3712 = _762 * smoothstep(0.0, 1.0, g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.x + (g_Lights_1._member0[_3439].m_vDistanceFade_vSkirt.y * _3701));
	                                    if (g_Lights_1._member0[_3439].m_nLuminaireType != 2)
	                                    {
	                                        _764 = g_Lights_1._member0[_3439].m_nLuminaireType != 1;
	                                    }
	                                    else
	                                    {
	                                        _764 = false;
	                                    }
	                                    if (_764)
	                                    {
	                                        float _3731 = 2.0 * g_Lights_1._member0[_3439].m_vOrientation.x;
	                                        float _3735 = 2.0 * g_Lights_1._member0[_3439].m_vOrientation.w;
	                                        vec3 _3749 = vec3((_3731 * g_Lights_1._member0[_3439].m_vOrientation.y) - (_3735 * g_Lights_1._member0[_3439].m_vOrientation.z), (1.0 - (_3731 * g_Lights_1._member0[_3439].m_vOrientation.x)) - ((2.0 * g_Lights_1._member0[_3439].m_vOrientation.z) * g_Lights_1._member0[_3439].m_vOrientation.z), ((2.0 * g_Lights_1._member0[_3439].m_vOrientation.y) * g_Lights_1._member0[_3439].m_vOrientation.z) + (_3735 * g_Lights_1._member0[_3439].m_vOrientation.x)) * g_Lights_1._member0[_3439].m_vAngleFade.z;
	                                        vec3 _3750 = _3703 - _3749;
	                                        vec3 _3751 = _3703 + _3749;
	                                        do
	                                        {
	                                            vec3 _3754 = _3751 - _3750;
	                                            float _3756 = dot(-_3750, _3754);
	                                            if (_3756 <= 0.0)
	                                            {
	                                                _760 = _3750;
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                float _3761 = dot(_3754, _3754);
	                                                if (_3756 > _3761)
	                                                {
	                                                    _760 = _3751;
	                                                    break;
	                                                }
	                                                else
	                                                {
	                                                    _760 = _3750 + (_3754 * (_3756 / _3761));
	                                                    break;
	                                                }
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (any(notEqual(_760, vec3(0.0))))
	                                        {
	                                            _761 = normalize(_760);
	                                        }
	                                        else
	                                        {
	                                            _761 = _760;
	                                        }
	                                        float _3785 = 2.0 * g_Lights_1._member0[_3439].m_vOrientation.x;
	                                        float _3788 = 2.0 * g_Lights_1._member0[_3439].m_vOrientation.w;
	                                        _763 = _3712 * saturate(g_Lights_1._member0[_3439].m_vAngleFade.x + (g_Lights_1._member0[_3439].m_vAngleFade.y * dot(vec3((1.0 - ((2.0 * g_Lights_1._member0[_3439].m_vOrientation.y) * g_Lights_1._member0[_3439].m_vOrientation.y)) - ((2.0 * g_Lights_1._member0[_3439].m_vOrientation.z) * g_Lights_1._member0[_3439].m_vOrientation.z), (_3785 * g_Lights_1._member0[_3439].m_vOrientation.y) + (_3788 * g_Lights_1._member0[_3439].m_vOrientation.z), (_3785 * g_Lights_1._member0[_3439].m_vOrientation.z) - (_3788 * g_Lights_1._member0[_3439].m_vOrientation.y)), _761)));
	                                    }
	                                    else
	                                    {
	                                        _763 = _3712;
	                                    }
	                                }
	                                else
	                                {
	                                    _763 = _762;
	                                }
	                                if (g_Lights_1._member0[_3439].m_nCookie == (-1))
	                                {
	                                    do
	                                    {
	                                        vec2 _3817 = abs(_3517.xyz.xy);
	                                        if (g_Lights_1._member0[_3439].m_vCookieParameters.z == 0.0)
	                                        {
	                                            _758 = smoothstep(1.0, g_Lights_1._member0[_3439].m_vCookieParameters.x, _3817.x) * smoothstep(1.0, g_Lights_1._member0[_3439].m_vCookieParameters.y, _3817.y);
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            float _3822 = _3817.x;
	                                            float _3826 = _3817.y;
	                                            float _3833 = (-0.5) * g_Lights_1._member0[_3439].m_vCookieParameters.z;
	                                            float _3835 = (g_Lights_1._member0[_3439].m_vCookieParameters.x * g_Lights_1._member0[_3439].m_vCookieParameters.y) * pow(max(pow(g_Lights_1._member0[_3439].m_vCookieParameters.y * _3822, 2.0 / g_Lights_1._member0[_3439].m_vCookieParameters.z) + pow(g_Lights_1._member0[_3439].m_vCookieParameters.x * _3826, 2.0 / g_Lights_1._member0[_3439].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _3833);
	                                            float _3842 = pow(max(pow(_3822, 2.0 / g_Lights_1._member0[_3439].m_vCookieParameters.z) + pow(_3826, 2.0 / g_Lights_1._member0[_3439].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _3833);
	                                            if (_3835 < _3842)
	                                            {
	                                                _758 = smoothstep(_3842, _3835, 1.0);
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                if (_3842 > 1.0)
	                                                {
	                                                    _759 = 1.0;
	                                                }
	                                                else
	                                                {
	                                                    _759 = 0.0;
	                                                }
	                                                _758 = _759;
	                                                break;
	                                            }
	                                            break;
	                                        }
	                                        break;
	                                    } while(false);
	                                    _763 *= _758;
	                                }
	                                _769 = _766 * _763;
	                                break;
	                            } while(false);
	                            float _3865 = dot(_769.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                            if (_3865 == 0.0)
	                            {
	                                _775 = _3441;
	                                continue;
	                            }
	                            _756 = false;
	                            do
	                            {
	                                switch (g_Lights_1._member0[_3439].m_nLuminaireType)
	                                {
	                                    case 0:
	                                    {
	                                        _776 = 1.0;
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0)
	                                            {
	                                                _731 = vec4(normalize(g_Lights_1._member0[_3439].m_vLightPosition.xyz), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _4391 = g_Lights_1._member0[_3439].m_vLightPosition.xyz - _3387;
	                                                float _4392 = length(_4391);
	                                                _731 = vec4(_4391 / vec3(_4392), _4392);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _756 = true;
	                                        _757 = _731;
	                                        break;
	                                    }
	                                    case 1:
	                                    {
	                                        vec3 _4231 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].xyz - g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz;
	                                        vec3 _4235 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[2].xyz - g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz;
	                                        float _4236 = length(_4231);
	                                        float _4237 = length(_4235);
	                                        vec3 _4239 = _4231 / vec3(_4236);
	                                        vec3 _4241 = _4235 / vec3(_4237);
	                                        vec3 _4242 = cross(_4239, _4241);
	                                        vec3 _4243 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz - _3387;
	                                        float _4244 = dot(_4243, _4242);
	                                        if (_4244 > 0.0)
	                                        {
	                                            _733 = _4244 * (-1.0);
	                                            _734 = _4242 * (-1.0);
	                                        }
	                                        else
	                                        {
	                                            _733 = _4244;
	                                            _734 = _4242;
	                                        }
	                                        float _4253 = dot(_4243, _4239);
	                                        float _4254 = dot(_4243, _4241);
	                                        float _4255 = _4253 + _4236;
	                                        float _4256 = _4254 + _4237;
	                                        vec3 _4259 = vec3(_4253, _4254, _733);
	                                        vec3 _4260 = vec3(_4253, _4256, _733);
	                                        vec3 _4261 = vec3(_4255, _4254, _733);
	                                        vec3 _4262 = vec3(_4255, _4256, _733);
	                                        vec3 _4264 = normalize(cross(_4259, _4261));
	                                        vec3 _4266 = normalize(cross(_4261, _4262));
	                                        vec3 _4268 = normalize(cross(_4262, _4260));
	                                        vec3 _4270 = normalize(cross(_4260, _4259));
	                                        float _4287 = _4264.z;
	                                        float _4291 = (6.283185482025146484375 - acos(clamp(-dot(_4268, _4270), -1.0, 1.0))) - acos(clamp(-dot(_4270, _4264), -1.0, 1.0));
	                                        float _4293 = (acos(clamp(-dot(_4264, _4266), -1.0, 1.0)) + acos(clamp(-dot(_4266, _4268), -1.0, 1.0))) - _4291;
	                                        if (isnan(_4293))
	                                        {
	                                            _735 = 0.0;
	                                        }
	                                        else
	                                        {
	                                            _735 = _4293;
	                                        }
	                                        float _4301 = (_2212.x * _735) + _4291;
	                                        float _4306 = ((cos(_4301) * _4287) - _4268.z) / sin(_4301);
	                                        if (_4306 > 0.0)
	                                        {
	                                            _736 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _736 = -1.0;
	                                        }
	                                        float _4315 = _736;
	                                        float _4317 = clamp((1.0 / sqrt((_4306 * _4306) + (_4287 * _4287))) * _4315, -1.0, 1.0);
	                                        float _4325 = clamp((-(_4317 * _733)) / sqrt(1.0 - (_4317 * _4317)), _4253, _4255);
	                                        float _4328 = sqrt((_4325 * _4325) + (_733 * _733));
	                                        float _4329 = _4328 * _4328;
	                                        float _4332 = _4254 / sqrt(_4329 + (_4254 * _4254));
	                                        float _4339 = _4332 + (_2212.y * ((_4256 / sqrt(_4329 + (_4256 * _4256))) - _4332));
	                                        float _4340 = _4339 * _4339;
	                                        if (_4340 < 0.99999988079071044921875)
	                                        {
	                                            _736 = (_4339 * _4328) / sqrt(1.0 - _4340);
	                                        }
	                                        else
	                                        {
	                                            _736 = _4256;
	                                        }
	                                        vec3 _4357 = ((_3387 + (_4239 * _4325)) + (_4241 * _736)) + (_734 * _733);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0)
	                                            {
	                                                _732 = vec4(normalize(_4357), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _4368 = _4357 - _3387;
	                                                float _4369 = length(_4368);
	                                                _732 = vec4(_4368 / vec3(_4369), _4369);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _776 = 1.0 / _735;
	                                        _756 = true;
	                                        _757 = _732;
	                                        break;
	                                    }
	                                    case 2:
	                                    {
	                                        do
	                                        {
	                                            vec2 _4139 = (_2212 * 2.0) - vec2(1.0);
	                                            if (all(equal(_4139, vec2(0.0))))
	                                            {
	                                                _740 = vec2(0.0);
	                                                break;
	                                            }
	                                            float _4144 = _4139.x;
	                                            float _4146 = _4139.y;
	                                            if (abs(_4144) > abs(_4146))
	                                            {
	                                                _741 = _4144;
	                                                _742 = 0.785398185253143310546875 * (_4146 / _4144);
	                                            }
	                                            else
	                                            {
	                                                _741 = _4146;
	                                                _742 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_4144 / _4146));
	                                            }
	                                            _740 = vec2(cos(_742), sin(_742)) * _741;
	                                            break;
	                                        } while(false);
	                                        vec3 _4180 = (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz + (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].xyz * _740.x)) + (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[2].xyz * _740.y);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0)
	                                            {
	                                                _739 = vec4(normalize(_4180), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _4191 = _4180 - _3387;
	                                                float _4192 = length(_4191);
	                                                _739 = vec4(_4191 / vec3(_4192), _4192);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_739.w))
	                                        {
	                                            _737 = true;
	                                        }
	                                        else
	                                        {
	                                            _737 = isnan(_739.w);
	                                        }
	                                        if (!_737)
	                                        {
	                                            _738 = _739.w * _739.w;
	                                        }
	                                        else
	                                        {
	                                            _738 = 1.0;
	                                        }
	                                        _776 = _738 / (max(0.0, dot(g_Lights_1._member0[_3439].m_vLuminaireVectors.data[3].xyz, -_739.xyz)) * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].w);
	                                        _756 = true;
	                                        _757 = _739;
	                                        break;
	                                    }
	                                    case 3:
	                                    {
	                                        vec3 _4034 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz - _3387;
	                                        float _4035 = dot(_4034, _4034);
	                                        float _4036 = sqrt(_4035);
	                                        vec3 _4038 = _4034 / vec3(_4036);
	                                        float _4039 = _4038.z;
	                                        if (_4039 >= 0.0)
	                                        {
	                                            _744 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _744 = -1.0;
	                                        }
	                                        float _4046 = (-1.0) / (_744 + _4039);
	                                        float _4047 = _4038.x;
	                                        float _4048 = _4038.y;
	                                        float _4050 = (_4047 * _4048) * _4046;
	                                        vec3 _4055 = _745;
	                                        _4055.x = 1.0 + (((_744 * _4047) * _4047) * _4046);
	                                        _4055.y = _744 * _4050;
	                                        _4055.z = (-_744) * _4047;
	                                        _745 = _4055;
	                                        vec3 _4062 = _746;
	                                        _4062.x = _4050;
	                                        _4062.y = _744 + ((_4048 * _4048) * _4046);
	                                        _4062.z = -_4048;
	                                        _746 = _4062;
	                                        float _4070 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].x * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].x;
	                                        float _4074 = sqrt(max(0.0, 1.0 - (_4070 / _4035)));
	                                        float _4075 = _2212.x;
	                                        float _4078 = (1.0 - _4075) + (_4075 * _4074);
	                                        float _4082 = sqrt(max(0.0, 1.0 - (_4078 * _4078)));
	                                        float _4084 = _2212.y * 6.283185482025146484375;
	                                        float _4086 = _4036 * _4036;
	                                        float _4092 = (_4036 * _4078) - sqrt(max(0.0, _4070 - ((_4086 * _4082) * _4082)));
	                                        float _4098 = ((_4086 + _4070) - (_4092 * _4092)) / ((2.0 * _4036) * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].x);
	                                        float _4102 = sqrt(max(0.0, 1.0 - (_4098 * _4098)));
	                                        vec3 _4114 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz + ((mat3(-_4055, -_4062, -_4038) * vec3(cos(_4084) * _4102, sin(_4084) * _4102, _4098)) * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].x);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0)
	                                            {
	                                                _743 = vec4(normalize(_4114), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _4125 = _4114 - _3387;
	                                                float _4126 = length(_4125);
	                                                _743 = vec4(_4125 / vec3(_4126), _4126);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _776 = 0.15915493667125701904296875 / (1.0 - _4074);
	                                        _756 = true;
	                                        _757 = _743;
	                                        break;
	                                    }
	                                    case 4:
	                                    case 5:
	                                    {
	                                        vec2 _753 = _2212;
	                                        if (_2212.x < g_Lights_1._member0[_3439].m_vLuminaireVectors.data[4].y)
	                                        {
	                                            vec2 _3925 = _753;
	                                            _3925.x = clamp(_3925.x / g_Lights_1._member0[_3439].m_vLuminaireVectors.data[4].y, 0.0, 0.99999988079071044921875);
	                                            _753 = _3925;
	                                            vec3 _3931 = normalize(g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz - g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].xyz);
	                                            if (_3925.x >= 0.5)
	                                            {
	                                                vec2 _3942 = _753;
	                                                _3942.x = clamp((2.0 * _3942.x) - 1.0, 0.0, 0.99999988079071044921875);
	                                                _753 = _3942;
	                                                _754 = -_3931;
	                                                _755 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].xyz;
	                                            }
	                                            else
	                                            {
	                                                vec2 _3937 = _753;
	                                                _3937.x = clamp(2.0 * _3937.x, 0.0, 0.99999988079071044921875);
	                                                _753 = _3937;
	                                                _754 = _3931;
	                                                _755 = g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz;
	                                            }
	                                            do
	                                            {
	                                                vec2 _3953 = (_753 * 2.0) - vec2(1.0);
	                                                if (all(equal(_3953, vec2(0.0))))
	                                                {
	                                                    _750 = vec2(0.0);
	                                                    break;
	                                                }
	                                                float _3958 = _3953.x;
	                                                float _3960 = _3953.y;
	                                                if (abs(_3958) > abs(_3960))
	                                                {
	                                                    _751 = _3958;
	                                                    _752 = 0.785398185253143310546875 * (_3960 / _3958);
	                                                }
	                                                else
	                                                {
	                                                    _751 = _3960;
	                                                    _752 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_3958 / _3960));
	                                                }
	                                                _750 = vec2(cos(_752), sin(_752)) * _751;
	                                                break;
	                                            } while(false);
	                                            _755 += ((g_Lights_1._member0[_3439].m_vLuminaireVectors.data[2].xyz * _750.x) + (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[3].xyz * _750.y));
	                                        }
	                                        else
	                                        {
	                                            vec2 _3904 = _753;
	                                            _3904.x = clamp((_3904.x - g_Lights_1._member0[_3439].m_vLuminaireVectors.data[4].y) / (1.0 - g_Lights_1._member0[_3439].m_vLuminaireVectors.data[4].y), 0.0, 0.99999988079071044921875);
	                                            _753 = _3904;
	                                            vec3 _3919 = (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[2].xyz * cos(_3904.x * 6.283185482025146484375)) + (g_Lights_1._member0[_3439].m_vLuminaireVectors.data[3].xyz * sin(_3904.x * 6.283185482025146484375));
	                                            _754 = normalize(_3919);
	                                            _755 = mix(g_Lights_1._member0[_3439].m_vLuminaireVectors.data[0].xyz, g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].xyz, vec3(_3904.y)) + _3919;
	                                        }
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3439].m_vLightPosition.w == 0.0)
	                                            {
	                                                _749 = vec4(normalize(_755), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3996 = _755 - _3387;
	                                                float _3997 = length(_3996);
	                                                _749 = vec4(_3996 / vec3(_3997), _3997);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_749.w))
	                                        {
	                                            _747 = true;
	                                        }
	                                        else
	                                        {
	                                            _747 = isnan(_749.w);
	                                        }
	                                        if (!_747)
	                                        {
	                                            _748 = _749.w * _749.w;
	                                        }
	                                        else
	                                        {
	                                            _748 = 1.0;
	                                        }
	                                        _776 = _748 / (max(0.0, dot(_754, -_749.xyz)) * g_Lights_1._member0[_3439].m_vLuminaireVectors.data[1].w);
	                                        _756 = true;
	                                        _757 = _749;
	                                        break;
	                                    }
	                                    default:
	                                    {
	                                        _776 = 0.0;
	                                        _756 = true;
	                                        _757 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	                                        break;
	                                    }
	                                }
	                                if (_756)
	                                {
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            float _4412 = dot(vec3(_363), _757.xyz);
	                            if ((!(dot(_528, _757.xyz) > 0.0)) && _831)
	                            {
	                                _730 = -_4412;
	                            }
	                            else
	                            {
	                                _730 = _4412;
	                            }
	                            float _4419 = (_3865 / _776) * max(0.0, _730);
	                            float _777 = _770.x;
	                            do
	                            {
	                                float _4424 = _771;
	                                float _4425 = _4424 + _4419;
	                                _771 = _4425;
	                                if (_4425 == 0.0)
	                                {
	                                    _728 = false;
	                                    break;
	                                }
	                                float _4430 = _4419 / _771;
	                                do
	                                {
	                                    if (_4430 <= 0.0)
	                                    {
	                                        _729 = false;
	                                        break;
	                                    }
	                                    if (_4430 >= 1.0)
	                                    {
	                                        _729 = true;
	                                        break;
	                                    }
	                                    if (_777 < _4430)
	                                    {
	                                        _777 = min(_777 / _4430, 0.99999988079071044921875);
	                                        _729 = true;
	                                        break;
	                                    }
	                                    _777 = min((_777 - _4430) / (1.0 - _4430), 0.99999988079071044921875);
	                                    _729 = false;
	                                    break;
	                                } while(false);
	                                _728 = _729;
	                                break;
	                            } while(false);
	                            vec2 _4455 = _770;
	                            _4455.x = _777;
	                            _770 = _4455;
	                            if (_728)
	                            {
	                                _591 = int(_3439);
	                                _590 = _769 / vec3(_776);
	                                _588 = _757;
	                                _774 = _4419;
	                            }
	                            _775 = _3441;
	                            continue;
	                        }
	                        _772 = _774;
	                        _773++;
	                        continue;
	                    }
	                    if (_591 != (-1))
	                    {
	                        vec3 _4475 = _590;
	                        vec3 _4476 = _4475 * (_771 / _772);
	                        bool _4485 = !(dot(_528, _588.xyz) > 0.0);
	                        vec3 _4488 = vec3(_363);
	                        vec3 _4493 = transpose(mat3(_414, _413, _4488)) * _588.xyz;
	                        float16_t _479 = _362;
	                        f16vec3 _478 = _361;
	                        float16_t _477 = _360;
	                        float16_t _476 = _359;
	                        uint _475 = _358;
	                        f16vec4 _474 = _357;
	                        vec3 _587 = _412;
	                        do
	                        {
	                            if (_4485)
	                            {
	                                f16vec4 _592 = _474;
	                                if ((_475 & 65535u) == 1u)
	                                {
	                                    _723 = any(greaterThan(vec3(_592.xyz), vec3(0.0)));
	                                }
	                                else
	                                {
	                                    _723 = false;
	                                }
	                                if (_723)
	                                {
	                                    _727 = vec3(_474.xyz);
	                                }
	                                else
	                                {
	                                    _727 = vec3(1.0);
	                                }
	                                _726 = _727 * 0.3183098733425140380859375;
	                                break;
	                            }
	                            else
	                            {
	                                vec3 _4512 = vec3(mix(f16vec3(_476), _478, f16vec3(_479)));
	                                float _4514 = float(_477);
	                                do
	                                {
	                                    float _4517 = _4493.z;
	                                    vec3 _4519 = _4493 + _587;
	                                    if (_4517 <= 0.0)
	                                    {
	                                        _725 = true;
	                                    }
	                                    else
	                                    {
	                                        _725 = _587.z <= 0.0;
	                                    }
	                                    if (_725)
	                                    {
	                                        _724 = vec3(0.0);
	                                        break;
	                                    }
	                                    if (all(equal(_4519, vec3(0.0))))
	                                    {
	                                        _724 = vec3(0.0);
	                                        break;
	                                    }
	                                    vec3 _4532 = normalize(_4519);
	                                    float _4533 = _4532.z;
	                                    float _4541 = _4514 * _4514;
	                                    float _4542 = _4541 * _4541;
	                                    float _4546 = (((_4533 * _4542) - _4533) * _4533) + 1.0;
	                                    float _4550 = _4514 * _4514;
	                                    float _4551 = _4550 * _4550;
	                                    _724 = (_4512 + ((vec3(1.0) - _4512) * pow(max(0.0, 1.0 - dot(_4493, _4532)), 5.0))) * (((_4542 / max(9.9999999392252902907785028219223e-09, _4546 * _4546)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_4517 * sqrt(((_587.z - (_4551 * _587.z)) * _587.z) + _4551)) + (_587.z * sqrt(((_4517 - (_4551 * _4517)) * _4517) + _4551))))) * 0.3183098733425140380859375);
	                                    break;
	                                } while(false);
	                                _726 = ((vec3(_478) * (1.0 - float(_479))) * 0.3183098733425140380859375) + _724;
	                                break;
	                            }
	                            break;
	                        } while(false);
	                        float _4605 = dot(_4488, _588.xyz);
	                        if (_4485)
	                        {
	                            _722 = -_4605;
	                        }
	                        else
	                        {
	                            _722 = _4605;
	                        }
	                        _590 = (_4476 * (_726 * 3.1415927410125732421875)) * max(0.0, _722);
	                        if (_4485)
	                        {
	                            f16vec4 _586 = _357;
	                            if ((_358 & 65535u) == 2u)
	                            {
	                                _721 = float(_586.x) > 0.0;
	                            }
	                            else
	                            {
	                                _721 = false;
	                            }
	                            _778 = _721;
	                        }
	                        else
	                        {
	                            _778 = false;
	                        }
	                        if (_778)
	                        {
	                            f16vec4 _473 = _357;
	                            uint _4636 = uint(_357.w);
	                            float _4641 = pow(saturate(-dot(normalize(_528 + _4488), _588.xyz)), 2.0);
	                            f16vec3 _4642 = f16vec3(vec3(0.0));
	                            if (isinf(_588.w))
	                            {
	                                _717 = true;
	                            }
	                            else
	                            {
	                                _717 = isnan(_588.w);
	                            }
	                            if (!_717)
	                            {
	                                _718 = _588.w;
	                            }
	                            else
	                            {
	                                _718 = 1000.0;
	                            }
	                            vec3 _596 = _530 + (_588.xyz * _718);
	                            float _595 = 0.0;
	                            vec3 _594 = -_588.xyz;
	                            if (_4641 > 0.0)
	                            {
	                                _719 = _718;
	                            }
	                            else
	                            {
	                                _719 = 0.0;
	                            }
	                            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _597, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_4642, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _4642, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                            traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, _596, _595, _594, _719, 0);
	                            if (p.nInstance != (-1))
	                            {
	                                f16vec4 _593 = p.material.vMaterialBits;
	                                if ((p.material.nMaterialTypeAndFlags & 65535u) == 2u)
	                                {
	                                    _716 = float(_593.x) > 0.0;
	                                }
	                                else
	                                {
	                                    _716 = false;
	                                }
	                                if (!_716)
	                                {
	                                    _719 = 0.0;
	                                }
	                                else
	                                {
	                                    _719 = _4641;
	                                }
	                                _720 = _718 - p.flHitT;
	                            }
	                            else
	                            {
	                                _719 = _4641;
	                                _720 = _718;
	                            }
	                            float _4707 = _720 * float(_473.x);
	                            _589 = (_4476 * vec3(_361)) * ((exp2(SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_4636].m_vTransmissiveLogColor.xyz * (1.0 + (_4707 * SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_4636].m_fTransmissiveSaturation))) * exp(-_4707)) * _719);
	                        }
	                    }
	                    vec4 _834 = _588;
	                    if (_591 != (-1))
	                    {
	                        bool _4735 = any(notEqual(_590, vec3(0.0)));
	                        if (isinf(_834.w))
	                        {
	                            _714 = true;
	                        }
	                        else
	                        {
	                            _714 = isnan(_834.w);
	                        }
	                        if (!_714)
	                        {
	                            _715 = _834.w;
	                        }
	                        else
	                        {
	                            _715 = 56755.83984375;
	                        }
	                        vec4 _4752 = _834;
	                        _4752.w = _715;
	                        _834 = _4752;
	                        do
	                        {
	                            float _4761 = dot(_4752.xyz, g_Lights_1._member0[_591].m_vNearPlane.xyz);
	                            if (_4761 == 0.0)
	                            {
	                                _713 = 0.0;
	                                break;
	                            }
	                            _713 = (g_Lights_1._member0[_591].m_vNearPlane.w - dot(_2173, g_Lights_1._member0[_591].m_vNearPlane.xyz)) * (1.0 / _4761);
	                            break;
	                        } while(false);
	                        if (_713 > 0.0)
	                        {
	                            vec4 _4773 = _834;
	                            _4773.w = min(_4773.w, _713);
	                            _834 = _4773;
	                        }
	                        if (dot(_834.xyz, _528.xyz) < 0.0)
	                        {
	                            _833 = _543;
	                        }
	                        else
	                        {
	                            _833 = _544;
	                        }
	                        vec4 _4786 = _834;
	                        vec3 _4788 = _833 - _2173;
	                        _4786.w = _4786.w + dot(_4786.xyz, _4788);
	                        vec3 _4798 = normalize((_4786.xyz * _4786.w) + _4788);
	                        vec4 _4800 = _4786;
	                        _4800.x = _4798.x;
	                        _4800.y = _4798.y;
	                        _4800.z = _4798.z;
	                        _834 = _4800;
	                        do
	                        {
	                            int _4811 = int(g_SceneGlobalInfo._member0[0].m_nSceneGlobalInfoFlags);
	                            if ((_4811 & 1) != 0)
	                            {
	                                _712 = 32u;
	                                break;
	                            }
	                            if ((_4811 & 2) != 0)
	                            {
	                                _712 = 16u;
	                                break;
	                            }
	                            _712 = 0u;
	                            break;
	                        } while(false);
	                        vec3 _600 = _833;
	                        float _599 = 0.0;
	                        vec3 _598 = _4800.xyz;
	                        if (_4735)
	                        {
	                            _711 = _4800.w;
	                        }
	                        else
	                        {
	                            _711 = 0.0;
	                        }
	                        p_1 = PayloadShadow_t(1.0);
	                        traceRayEXT(g_AccelStruct, _712, 2u, 1u, 2u, 1u, _600, _599, _598, _711, 1);
	                        if (_4735)
	                        {
	                            _711 = p_1.m_flVisibility;
	                        }
	                        else
	                        {
	                            _711 = 0.0;
	                        }
	                        _833 = (_825 + _589) + (_590 * _711);
	                    }
	                    else
	                    {
	                        _833 = _825;
	                    }
	                }
	                else
	                {
	                    _833 = _825;
	                }
	                _550 = _544;
	                _549 = _543;
	                _548 = _542;
	                _547 = _541;
	                _378 = _371;
	                _377 = _370;
	                _376 = _369;
	                _375 = _368;
	                _374 = _366;
	                _373 = _365;
	                _372 = _364;
	                _440 = _435;
	                _439 = _434;
	                _438 = _433;
	                _437 = _432;
	                _436 = _431;
	                vec3 _4869 = vec3(_369);
	                float _4875 = min(0.89999997615814208984375, max(_4869.x, max(_4869.y, _4869.z)));
	                float _859 = _858.x;
	                do
	                {
	                    if (_4875 <= 0.0)
	                    {
	                        _710 = false;
	                        break;
	                    }
	                    if (_4875 >= 1.0)
	                    {
	                        _710 = true;
	                        break;
	                    }
	                    if (_859 < _4875)
	                    {
	                        _859 = min(_859 / _4875, 0.99999988079071044921875);
	                        _710 = true;
	                        break;
	                    }
	                    _859 = min((_859 - _4875) / (1.0 - _4875), 0.99999988079071044921875);
	                    _710 = false;
	                    break;
	                } while(false);
	                vec2 _4900 = _858;
	                _4900.x = _859;
	                _858 = _4900;
	                if (_710)
	                {
	                    float _527 = _437;
	                    do
	                    {
	                        _860 = 1.0;
	                        do
	                        {
	                            if (_527 <= 0.0)
	                            {
	                                _709 = false;
	                                break;
	                            }
	                            if (_527 >= 1.0)
	                            {
	                                _709 = true;
	                                break;
	                            }
	                            if (_858.x < _527)
	                            {
	                                vec2 _4923 = _858;
	                                _4923.x = min(_4923.x / _527, 0.99999988079071044921875);
	                                _858 = _4923;
	                                _709 = true;
	                                break;
	                            }
	                            vec2 _4928 = _858;
	                            _4928.x = min((_4928.x - _527) / (1.0 - _527), 0.99999988079071044921875);
	                            _858 = _4928;
	                            _709 = false;
	                            break;
	                        } while(false);
	                        if (_709)
	                        {
	                            _860 = _527;
	                            _708 = true;
	                            break;
	                        }
	                        else
	                        {
	                            _860 = 1.0 - _527;
	                            _708 = false;
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    if (_708)
	                    {
	                        _550 = _549;
	                    }
	                    f16vec3 _411 = _378;
	                    float16_t _410 = _377;
	                    f16vec3 _409 = _376;
	                    float16_t _408 = _375;
	                    float16_t _407 = _374;
	                    uint _406 = _373;
	                    f16vec4 _405 = _372;
	                    vec3 _526 = _440;
	                    vec3 _525 = _439;
	                    float _524 = _438;
	                    vec3 _523 = _436;
	                    do
	                    {
	                        vec2 _706 = _858;
	                        if (_708)
	                        {
	                            float _5039 = sqrt(_706.y);
	                            float _5041 = 6.283185482025146484375 * _706.x;
	                            vec3 _5049 = vec3(cos(_5041) * _5039, sin(_5041) * _5039, sqrt(max(0.0, 1.0 - _706.y)));
	                            _5049.z = -_5049.z;
	                            _705 = _5049;
	                            break;
	                        }
	                        else
	                        {
	                            float _707 = _706.x;
	                            do
	                            {
	                                if (_524 <= 0.0)
	                                {
	                                    _704 = false;
	                                    break;
	                                }
	                                if (_524 >= 1.0)
	                                {
	                                    _704 = true;
	                                    break;
	                                }
	                                if (_707 < _524)
	                                {
	                                    _707 = min(_707 / _524, 0.99999988079071044921875);
	                                    _704 = true;
	                                    break;
	                                }
	                                _707 = min((_707 - _524) / (1.0 - _524), 0.99999988079071044921875);
	                                _704 = false;
	                                break;
	                            } while(false);
	                            vec2 _4987 = _706;
	                            _4987.x = _707;
	                            _706 = _4987;
	                            if (_704)
	                            {
	                                float _4992 = float(_408);
	                                float _5000 = ((_4992 * _4992) * sqrt(_706.x)) / sqrt(1.0 - _706.x);
	                                float _5003 = 1.0 / (1.0 + (_5000 * _5000));
	                                float _5006 = sqrt(max(0.0, 1.0 - _5003));
	                                float _5009 = 6.283185482025146484375 * _706.y;
	                                vec3 _5014 = vec3(cos(_5009) * _5006, sin(_5009) * _5006, sqrt(_5003));
	                                if (dot(_523, _5014) > 0.0)
	                                {
	                                    _703 = _5014;
	                                }
	                                else
	                                {
	                                    _703 = -_5014;
	                                }
	                                _705 = -reflect(_523, _703);
	                                break;
	                            }
	                            float _5026 = sqrt(_706.y);
	                            float _5028 = 6.283185482025146484375 * _706.x;
	                            _705 = vec3(cos(_5028) * _5026, sin(_5028) * _5026, sqrt(max(0.0, 1.0 - _706.y)));
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    _852 = _705;
	                    vec3 _5056 = normalize(_705 + _523);
	                    float _5057 = _5056.z;
	                    if (_708)
	                    {
	                        _701 = _705.z * (-0.3183098733425140380859375);
	                    }
	                    else
	                    {
	                        if (_524 > 0.0)
	                        {
	                            float _5070 = float(_408);
	                            float _5071 = _5070 * _5070;
	                            float _5072 = _5071 * _5071;
	                            float _5076 = (((_5057 * _5072) - _5057) * _5057) + 1.0;
	                            _700 = 1.0 - _524;
	                            _701 = _524 * (((_5072 / max(9.9999999392252902907785028219223e-09, _5076 * _5076)) * _5057) / (12.56637096405029296875 * max(0.0, dot(_523, _5056))));
	                        }
	                        else
	                        {
	                            _700 = 1.0;
	                            _701 = 0.0;
	                        }
	                        _701 += (_700 * (_705.z * 0.3183098733425140380859375));
	                    }
	                    if (_701 == 0.0)
	                    {
	                        _702 = true;
	                    }
	                    else
	                    {
	                        _702 = isnan(_701);
	                    }
	                    if (_702)
	                    {
	                        _700 = 3.4028234663852885981170418348452e+38;
	                    }
	                    else
	                    {
	                        _700 = _701;
	                    }
	                    float _861 = _700;
	                    do
	                    {
	                        if (_708)
	                        {
	                            f16vec4 _601 = _405;
	                            if ((_406 & 65535u) == 1u)
	                            {
	                                _695 = any(greaterThan(vec3(_601.xyz), vec3(0.0)));
	                            }
	                            else
	                            {
	                                _695 = false;
	                            }
	                            if (_695)
	                            {
	                                _699 = vec3(_405.xyz);
	                            }
	                            else
	                            {
	                                _699 = vec3(1.0);
	                            }
	                            _698 = _699 * 0.3183098733425140380859375;
	                            break;
	                        }
	                        else
	                        {
	                            vec3 _5117 = vec3(mix(f16vec3(_407), _409, f16vec3(_410)));
	                            float _5119 = float(_408);
	                            do
	                            {
	                                vec3 _5124 = _852 + _523;
	                                if (_852.z <= 0.0)
	                                {
	                                    _697 = true;
	                                }
	                                else
	                                {
	                                    _697 = _523.z <= 0.0;
	                                }
	                                if (_697)
	                                {
	                                    _696 = vec3(0.0);
	                                    break;
	                                }
	                                if (all(equal(_5124, vec3(0.0))))
	                                {
	                                    _696 = vec3(0.0);
	                                    break;
	                                }
	                                vec3 _5137 = normalize(_5124);
	                                float _5138 = _5137.z;
	                                float _5146 = _5119 * _5119;
	                                float _5147 = _5146 * _5146;
	                                float _5151 = (((_5138 * _5147) - _5138) * _5138) + 1.0;
	                                float _5155 = _5119 * _5119;
	                                float _5156 = _5155 * _5155;
	                                _696 = (_5117 + ((vec3(1.0) - _5117) * pow(max(0.0, 1.0 - dot(_852, _5137)), 5.0))) * (((_5147 / max(9.9999999392252902907785028219223e-09, _5151 * _5151)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_852.z * sqrt(((_523.z - (_5156 * _523.z)) * _523.z) + _5156)) + (_523.z * sqrt(((_852.z - (_5156 * _852.z)) * _852.z) + _5156))))) * 0.3183098733425140380859375);
	                                break;
	                            } while(false);
	                            _698 = ((vec3(_409) * (1.0 - float(_410))) * 0.3183098733425140380859375) + _696;
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    vec3 _5206 = _852;
	                    vec3 _5212 = mat3(_526, _525, vec3(_411)) * _5206;
	                    _852 = _5212;
	                    float _5215 = dot(vec3(_378), _5212);
	                    if (_708)
	                    {
	                        _694 = -_5215;
	                    }
	                    else
	                    {
	                        _694 = _5215;
	                    }
	                    do
	                    {
	                        if ((_547 & 2048) != 0)
	                        {
	                            _693 = true;
	                            break;
	                        }
	                        _693 = (dot(_548, _852) > 0.0) != _708;
	                        break;
	                    } while(false);
	                    if (_693)
	                    {
	                        _862 = (_856 * (_698 * max(0.0, _694))) / vec3((_4875 * _860) * _861);
	                    }
	                    else
	                    {
	                        _862 = vec3(0.0);
	                    }
	                    _854 = _862;
	                }
	                else
	                {
	                    _854 = vec3(0.0);
	                }
	                _853++;
	                _855 = (_855 + ((_833 * _856) * _857)) + ((vec3(_367) * _856) * _857);
	                continue;
	            }
	            vec3 _5256 = abs(_855);
	            float _5261 = max(_5256.x, max(_5256.y, _5256.z));
	            float _5265 = clamp(_5261, -100.0, 100.0);
	            vec3 _692;
	            if (_5265 == 0.0)
	            {
	                _692 = vec3(0.0);
	            }
	            else
	            {
	                _692 = clamp(_855 / vec3(_5261), vec3(-1.0), vec3(1.0)) * _5265;
	            }
	            vec3 _5272 = abs(vec3(0.0));
	            vec3 _691;
	            if (clamp(max(_5272.x, max(_5272.y, _5272.z)), -100.0, 100.0) == 0.0)
	            {
	                _691 = vec3(0.0);
	            }
	            else
	            {
	                _691 = vec3(0.0);
	            }
	            float _5284 = dot(_1367, vec3(_356));
	            float _868;
	            vec3 _869;
	            if (_863)
	            {
	                _868 = -_5284;
	                _869 = _692 * vTransmissiveRatio;
	            }
	            else
	            {
	                _868 = _5284;
	                _869 = _692;
	            }
	            vec4 _5290 = _505;
	            vec3 _5297 = _5290.xyz + ((_869 * max(0.0, _868)) * 0.3183098733425140380859375);
	            vec4 _5299 = _5290;
	            _5299.x = _5297.x;
	            _5299.y = _5297.y;
	            _5299.z = _5297.z;
	            vec3 _5305 = _5299.xyz + _691;
	            vec4 _5307 = _5299;
	            _5307.x = _5305.x;
	            _5307.y = _5305.y;
	            _5307.z = _5305.z;
	            _505 = _5307;
	            if (_868 > 0.0)
	            {
	                vec4 _870;
	                vec4 _5315 = _870;
	                _5315.x = 0.2820948064327239990234375;
	                float _5317 = _1367.y;
	                _5315.y = (-0.48860251903533935546875) * _5317;
	                float _5320 = _1367.z;
	                _5315.z = 0.48860251903533935546875 * _5320;
	                float _5323 = _1367.x;
	                _5315.w = (-0.48860251903533935546875) * _5323;
	                _870 = _5315;
	                vec4 _871;
	                vec4 _5328 = _871;
	                _5328.x = (1.09254848957061767578125 * _5323) * _5317;
	                _5328.y = ((-1.09254848957061767578125) * _5317) * _5320;
	                _5328.z = 0.3153915703296661376953125 * (((3.0 * _5320) * _5320) - 1.0);
	                _5328.w = ((-1.09254848957061767578125) * _5323) * _5320;
	                _871 = _5328;
	                _504 += (_5315 * _869.x);
	                _501 += (_5328 * _869.x);
	                _503 += (_5315 * _869.y);
	                _500 += (_5328 * _869.y);
	                _502 += (_5315 * _869.z);
	                _499 += (_5328 * _869.z);
	                vec4 _5367 = _498;
	                vec3 _5370 = _5367.xyz + (_869 * (0.546274244785308837890625 * ((_5323 * _5323) - (_5317 * _5317))));
	                vec4 _5372 = _5367;
	                _5372.x = _5370.x;
	                _5372.y = _5370.y;
	                _5372.z = _5370.z;
	                _498 = _5372;
	            }
	            vec3 _485 = _507;
	            f16vec3 _342 = _349;
	            uint _341 = _344;
	            f16vec4 _340 = _343;
	            uint _484 = _963;
	            uvec3 _483 = _964;
	            vec3 _482 = _969;
	            vec3 _481 = _967;
	            vec3 _5385 = (_509 + _508) * 0.5;
	            vec2 _5393 = imageLoad(g_RandomSamples, ivec3(_942.xy, int(1u + (2u * _943)))).xy;
	            vec2 _668 = imageLoad(g_RandomSamples, ivec3(_942.xy, int(1u + _943))).xy;
	            bool _669;
	            if (any(notEqual(vTransmissiveRatio, vec3(0.0))))
	            {
	                _669 = true;
	            }
	            else
	            {
	                _669 = false;
	            }
	            if (_669)
	            {
	                _669 = true;
	            }
	            else
	            {
	                _669 = false;
	            }
	            vec4 _670 = vec4(0.0);
	            float _671 = 0.0;
	            uvec3 _5417 = min(uvec3(max(fma(_5385, _481, _482), vec3(0.0))), (_483 - uvec3(1u)));
	            int _673 = -1;
	            float _674 = 0.0;
	            bool _672 = false;
	            uint _675 = 0u;
	            vec3 _676 = vec3(0.0);
	            bool _625;
	            bool _626;
	            vec3 _627;
	            vec3 _628;
	            vec4 _629;
	            vec4 _630;
	            float _631;
	            vec3 _632;
	            float _633;
	            float _634;
	            bool _635;
	            float _636;
	            vec4 _637;
	            vec2 _638;
	            float _639;
	            float _640;
	            vec4 _641;
	            float _642;
	            vec3 _643;
	            vec3 _644;
	            bool _645;
	            float _646;
	            vec4 _647;
	            vec2 _648;
	            float _649;
	            float _650;
	            vec3 _652;
	            vec3 _653;
	            vec4 _655;
	            float _656;
	            float _657;
	            vec3 _658;
	            vec3 _659;
	            float _660;
	            float _661;
	            bool _662;
	            vec3 _663;
	            vec3 _664;
	            bool _665;
	            bool _666;
	            vec3 _667;
	            float _677;
	            uint _678;
	            vec3 _679;
	            vec3 _680;
	            float _683;
	            float _684;
	            vec4 _685;
	            vec4 _686;
	            bool _687;
	            for (;;)
	            {
	                if (!(_675 < _484))
	                {
	                    break;
	                }
	                uint _5433 = _484 * _483.x;
	                int _682 = _673;
	                _677 = _674;
	                bool _681 = _672;
	                _678 = subgroupOr(g_LightBins_1._member0[((((_5433 * _483.y) * _5417.z) + (_5433 * _5417.y)) + (_484 * _5417.x)) + _675]);
	                _679 = _676;
	                for (;;)
	                {
	                    if (!(_678 != 0u))
	                    {
	                        break;
	                    }
	                    uint _5460 = _678;
	                    uint _5464 = uint(findLSB(_5460)) + (_675 * 32u);
	                    uint _5466 = _5460 & (_5460 - 1u);
	                    if ((g_Lights_1._member0[_5464].m_nPathTraceFlags & 2) == 0)
	                    {
	                        _678 = _5466;
	                        continue;
	                    }
	                    do
	                    {
	                        do
	                        {
	                            vec4 _5484 = g_Lights_1._member0[_5464].m_mToClipSpace * vec4(_5385.xyz, 1.0);
	                            vec3 _5488 = _5484.xyz / vec3(_5484.w);
	                            vec4 _5490;
	                            _5490.x = _5488.x;
	                            _5490.y = _5488.y;
	                            _5490.z = _5488.z;
	                            if (all(greaterThanEqual(_5490.xyz, vec3(-1.0, -1.0, 0.0))))
	                            {
	                                _665 = all(lessThanEqual(_5490.xyz, vec3(1.0)));
	                            }
	                            else
	                            {
	                                _665 = false;
	                            }
	                            if (!_665)
	                            {
	                                _666 = false;
	                                break;
	                            }
	                            if (!all(lessThanEqual(abs((g_Lights_1._member0[_5464].m_mBarnIlluminationFromWorld * vec4(_5385, 1.0)).xyz), vec3(1.0))))
	                            {
	                                _666 = false;
	                                break;
	                            }
	                            _666 = true;
	                            break;
	                        } while(false);
	                        if (!_666)
	                        {
	                            _667 = vec3(0.0);
	                            break;
	                        }
	                        vec4 _5527 = g_Lights_1._member0[_5464].m_mToClipSpace * vec4(_5385.xyz, 1.0);
	                        vec3 _5531 = _5527.xyz / vec3(_5527.w);
	                        vec4 _5533;
	                        _5533.x = _5531.x;
	                        _5533.y = _5531.y;
	                        _5533.z = _5531.z;
	                        if (false)
	                        {
	                            _664 = g_Lights_1._member0[_5464].m_vBounceColor.xyz;
	                        }
	                        else
	                        {
	                            _664 = g_Lights_1._member0[_5464].m_vColor.xyz;
	                        }
	                        if (true)
	                        {
	                            if (g_Lights_1._member0[_5464].m_nCookie >= 0)
	                            {
	                                if (g_Lights_1._member0[_5464].m_bSphericalCookie != 0)
	                                {
	                                    vec4 _5591 = vec4(-g_Lights_1._member0[_5464].m_vOrientation.xyz, g_Lights_1._member0[_5464].m_vOrientation.w);
	                                    vec4 _5593 = _5591.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                                    vec3 _5596 = _5593.xyz;
	                                    vec3 _5597 = vec4((-normalize(g_Lights_1._member0[_5464].m_vLightPosition.xyz - _5385)).xyz, 0.0).xyz;
	                                    vec4 _5604 = vec4((_5597 * _5593.w) + cross(_5597, _5596), -dot(_5597, _5596));
	                                    vec3 _5605 = _5604.xyz;
	                                    float _5606 = _5591.w;
	                                    vec3 _5608 = _5591.xyz;
	                                    float _5609 = _5604.w;
	                                    vec3 _5617 = vec4(((_5605 * _5606) + (_5608 * _5609)) + cross(_5608, _5605), _338).xyz;
	                                    vec2 _5626 = vec2(atan(_5617.y, -_5617.x) * 0.15915493667125701904296875, acos(_5617.z) * 0.3183098733425140380859375);
	                                    vec2 _5633 = (_5626.xy * g_Lights_1._member0[_5464].m_vCookieParameters.zw) + g_Lights_1._member0[_5464].m_vCookieParameters.xy;
	                                    vec2 _5635 = _5626;
	                                    _5635.x = _5633.x;
	                                    _5635.y = _5633.y;
	                                    _663 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_5464].m_nCookie], g_Sampler)), _5635, 0.0).xyz;
	                                }
	                                else
	                                {
	                                    vec2 _5564 = fma(_5533.xyz.xy, vec2(0.5, -0.5), vec2(0.5));
	                                    vec2 _5571 = (_5564.xy * g_Lights_1._member0[_5464].m_vCookieParameters.zw) + g_Lights_1._member0[_5464].m_vCookieParameters.xy;
	                                    vec2 _5573 = _5564;
	                                    _5573.x = _5571.x;
	                                    _5573.y = _5571.y;
	                                    _663 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_5464].m_nCookie], g_CookieSampler)), _5573, 0.0).xyz;
	                                }
	                            }
	                            else
	                            {
	                                _663 = vec3(1.0);
	                            }
	                            _664 *= _663;
	                        }
	                        if (g_Lights_1._member0[_5464].m_nLuminaireType != 0)
	                        {
	                            _664 = (_664 * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].w) * 0.3183098733425140380859375;
	                        }
	                        else
	                        {
	                            if (!(g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0))
	                            {
	                                vec3 _5662 = g_Lights_1._member0[_5464].m_vLightPosition.xyz - _5385;
	                                _664 *= (vec3(g_Lights_1._member0[_5464].m_vLightPosition.w) / max(vec3(dot(_5662, _5662)), vec3(g_Lights_1._member0[_5464].m_vLightPosition.w)));
	                            }
	                        }
	                        if (g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.z > 0.0)
	                        {
	                            _660 = smoothstep(0.0, 1.0, _5533.xyz.z * g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.z);
	                        }
	                        else
	                        {
	                            _660 = 1.0;
	                        }
	                        if (g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.w > 0.0)
	                        {
	                            _660 *= smoothstep(0.0, 1.0, (1.0 - _5533.xyz.z) * g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.w);
	                        }
	                        if (!(g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0))
	                        {
	                            vec3 _5716 = g_Lights_1._member0[_5464].m_vLightPosition.xyz - _5385;
	                            float _5717 = length(_5716);
	                            vec3 _5719 = _5716 / vec3(_5717);
	                            float _5728 = _660 * smoothstep(0.0, 1.0, g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.x + (g_Lights_1._member0[_5464].m_vDistanceFade_vSkirt.y * _5717));
	                            if (g_Lights_1._member0[_5464].m_nLuminaireType != 2)
	                            {
	                                _662 = g_Lights_1._member0[_5464].m_nLuminaireType != 1;
	                            }
	                            else
	                            {
	                                _662 = false;
	                            }
	                            if (_662)
	                            {
	                                float _5747 = 2.0 * g_Lights_1._member0[_5464].m_vOrientation.x;
	                                float _5751 = 2.0 * g_Lights_1._member0[_5464].m_vOrientation.w;
	                                vec3 _5765 = vec3((_5747 * g_Lights_1._member0[_5464].m_vOrientation.y) - (_5751 * g_Lights_1._member0[_5464].m_vOrientation.z), (1.0 - (_5747 * g_Lights_1._member0[_5464].m_vOrientation.x)) - ((2.0 * g_Lights_1._member0[_5464].m_vOrientation.z) * g_Lights_1._member0[_5464].m_vOrientation.z), ((2.0 * g_Lights_1._member0[_5464].m_vOrientation.y) * g_Lights_1._member0[_5464].m_vOrientation.z) + (_5751 * g_Lights_1._member0[_5464].m_vOrientation.x)) * g_Lights_1._member0[_5464].m_vAngleFade.z;
	                                vec3 _5766 = _5719 - _5765;
	                                vec3 _5767 = _5719 + _5765;
	                                do
	                                {
	                                    vec3 _5770 = _5767 - _5766;
	                                    float _5772 = dot(-_5766, _5770);
	                                    if (_5772 <= 0.0)
	                                    {
	                                        _658 = _5766;
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        float _5777 = dot(_5770, _5770);
	                                        if (_5772 > _5777)
	                                        {
	                                            _658 = _5767;
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            _658 = _5766 + (_5770 * (_5772 / _5777));
	                                            break;
	                                        }
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                if (any(notEqual(_658, vec3(0.0))))
	                                {
	                                    _659 = normalize(_658);
	                                }
	                                else
	                                {
	                                    _659 = _658;
	                                }
	                                float _5801 = 2.0 * g_Lights_1._member0[_5464].m_vOrientation.x;
	                                float _5804 = 2.0 * g_Lights_1._member0[_5464].m_vOrientation.w;
	                                _661 = _5728 * saturate(g_Lights_1._member0[_5464].m_vAngleFade.x + (g_Lights_1._member0[_5464].m_vAngleFade.y * dot(vec3((1.0 - ((2.0 * g_Lights_1._member0[_5464].m_vOrientation.y) * g_Lights_1._member0[_5464].m_vOrientation.y)) - ((2.0 * g_Lights_1._member0[_5464].m_vOrientation.z) * g_Lights_1._member0[_5464].m_vOrientation.z), (_5801 * g_Lights_1._member0[_5464].m_vOrientation.y) + (_5804 * g_Lights_1._member0[_5464].m_vOrientation.z), (_5801 * g_Lights_1._member0[_5464].m_vOrientation.z) - (_5804 * g_Lights_1._member0[_5464].m_vOrientation.y)), _659)));
	                            }
	                            else
	                            {
	                                _661 = _5728;
	                            }
	                        }
	                        else
	                        {
	                            _661 = _660;
	                        }
	                        if (g_Lights_1._member0[_5464].m_nCookie == (-1))
	                        {
	                            do
	                            {
	                                vec2 _5833 = abs(_5533.xyz.xy);
	                                if (g_Lights_1._member0[_5464].m_vCookieParameters.z == 0.0)
	                                {
	                                    _656 = smoothstep(1.0, g_Lights_1._member0[_5464].m_vCookieParameters.x, _5833.x) * smoothstep(1.0, g_Lights_1._member0[_5464].m_vCookieParameters.y, _5833.y);
	                                    break;
	                                }
	                                else
	                                {
	                                    float _5838 = _5833.x;
	                                    float _5842 = _5833.y;
	                                    float _5849 = (-0.5) * g_Lights_1._member0[_5464].m_vCookieParameters.z;
	                                    float _5851 = (g_Lights_1._member0[_5464].m_vCookieParameters.x * g_Lights_1._member0[_5464].m_vCookieParameters.y) * pow(max(pow(g_Lights_1._member0[_5464].m_vCookieParameters.y * _5838, 2.0 / g_Lights_1._member0[_5464].m_vCookieParameters.z) + pow(g_Lights_1._member0[_5464].m_vCookieParameters.x * _5842, 2.0 / g_Lights_1._member0[_5464].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _5849);
	                                    float _5858 = pow(max(pow(_5838, 2.0 / g_Lights_1._member0[_5464].m_vCookieParameters.z) + pow(_5842, 2.0 / g_Lights_1._member0[_5464].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _5849);
	                                    if (_5851 < _5858)
	                                    {
	                                        _656 = smoothstep(_5858, _5851, 1.0);
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        if (_5858 > 1.0)
	                                        {
	                                            _657 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _657 = 0.0;
	                                        }
	                                        _656 = _657;
	                                        break;
	                                    }
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            _661 *= _656;
	                        }
	                        _667 = _664 * _661;
	                        break;
	                    } while(false);
	                    if (all(equal(_667, vec3(0.0))))
	                    {
	                        _678 = _5466;
	                        continue;
	                    }
	                    _654 = false;
	                    do
	                    {
	                        switch (g_Lights_1._member0[_5464].m_nLuminaireType)
	                        {
	                            case 0:
	                            {
	                                _683 = 1.0;
	                                do
	                                {
	                                    if (g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0)
	                                    {
	                                        _629 = vec4(normalize(g_Lights_1._member0[_5464].m_vLightPosition.xyz), uintBitsToFloat(0x7f800000u /* inf */));
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        vec3 _6406 = g_Lights_1._member0[_5464].m_vLightPosition.xyz - _5385;
	                                        float _6407 = length(_6406);
	                                        _629 = vec4(_6406 / vec3(_6407), _6407);
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                _654 = true;
	                                _655 = _629;
	                                break;
	                            }
	                            case 1:
	                            {
	                                vec3 _6246 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].xyz - g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz;
	                                vec3 _6250 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[2].xyz - g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz;
	                                float _6251 = length(_6246);
	                                float _6252 = length(_6250);
	                                vec3 _6254 = _6246 / vec3(_6251);
	                                vec3 _6256 = _6250 / vec3(_6252);
	                                vec3 _6257 = cross(_6254, _6256);
	                                vec3 _6258 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz - _5385;
	                                float _6259 = dot(_6258, _6257);
	                                if (_6259 > 0.0)
	                                {
	                                    _631 = _6259 * (-1.0);
	                                    _632 = _6257 * (-1.0);
	                                }
	                                else
	                                {
	                                    _631 = _6259;
	                                    _632 = _6257;
	                                }
	                                float _6268 = dot(_6258, _6254);
	                                float _6269 = dot(_6258, _6256);
	                                float _6270 = _6268 + _6251;
	                                float _6271 = _6269 + _6252;
	                                vec3 _6274 = vec3(_6268, _6269, _631);
	                                vec3 _6275 = vec3(_6268, _6271, _631);
	                                vec3 _6276 = vec3(_6270, _6269, _631);
	                                vec3 _6277 = vec3(_6270, _6271, _631);
	                                vec3 _6279 = normalize(cross(_6274, _6276));
	                                vec3 _6281 = normalize(cross(_6276, _6277));
	                                vec3 _6283 = normalize(cross(_6277, _6275));
	                                vec3 _6285 = normalize(cross(_6275, _6274));
	                                float _6302 = _6279.z;
	                                float _6306 = (6.283185482025146484375 - acos(clamp(-dot(_6283, _6285), -1.0, 1.0))) - acos(clamp(-dot(_6285, _6279), -1.0, 1.0));
	                                float _6308 = (acos(clamp(-dot(_6279, _6281), -1.0, 1.0)) + acos(clamp(-dot(_6281, _6283), -1.0, 1.0))) - _6306;
	                                if (isnan(_6308))
	                                {
	                                    _633 = 0.0;
	                                }
	                                else
	                                {
	                                    _633 = _6308;
	                                }
	                                float _6316 = (_5393.x * _633) + _6306;
	                                float _6321 = ((cos(_6316) * _6302) - _6283.z) / sin(_6316);
	                                if (_6321 > 0.0)
	                                {
	                                    _634 = 1.0;
	                                }
	                                else
	                                {
	                                    _634 = -1.0;
	                                }
	                                float _6330 = _634;
	                                float _6332 = clamp((1.0 / sqrt((_6321 * _6321) + (_6302 * _6302))) * _6330, -1.0, 1.0);
	                                float _6340 = clamp((-(_6332 * _631)) / sqrt(1.0 - (_6332 * _6332)), _6268, _6270);
	                                float _6343 = sqrt((_6340 * _6340) + (_631 * _631));
	                                float _6344 = _6343 * _6343;
	                                float _6347 = _6269 / sqrt(_6344 + (_6269 * _6269));
	                                float _6354 = _6347 + (_5393.y * ((_6271 / sqrt(_6344 + (_6271 * _6271))) - _6347));
	                                float _6355 = _6354 * _6354;
	                                if (_6355 < 0.99999988079071044921875)
	                                {
	                                    _634 = (_6354 * _6343) / sqrt(1.0 - _6355);
	                                }
	                                else
	                                {
	                                    _634 = _6271;
	                                }
	                                vec3 _6372 = ((_5385 + (_6254 * _6340)) + (_6256 * _634)) + (_632 * _631);
	                                do
	                                {
	                                    if (g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0)
	                                    {
	                                        _630 = vec4(normalize(_6372), uintBitsToFloat(0x7f800000u /* inf */));
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        vec3 _6383 = _6372 - _5385;
	                                        float _6384 = length(_6383);
	                                        _630 = vec4(_6383 / vec3(_6384), _6384);
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                _683 = 1.0 / _633;
	                                _654 = true;
	                                _655 = _630;
	                                break;
	                            }
	                            case 2:
	                            {
	                                do
	                                {
	                                    vec2 _6154 = (_5393 * 2.0) - vec2(1.0);
	                                    if (all(equal(_6154, vec2(0.0))))
	                                    {
	                                        _638 = vec2(0.0);
	                                        break;
	                                    }
	                                    float _6159 = _6154.x;
	                                    float _6161 = _6154.y;
	                                    if (abs(_6159) > abs(_6161))
	                                    {
	                                        _639 = _6159;
	                                        _640 = 0.785398185253143310546875 * (_6161 / _6159);
	                                    }
	                                    else
	                                    {
	                                        _639 = _6161;
	                                        _640 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_6159 / _6161));
	                                    }
	                                    _638 = vec2(cos(_640), sin(_640)) * _639;
	                                    break;
	                                } while(false);
	                                vec3 _6195 = (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz + (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].xyz * _638.x)) + (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[2].xyz * _638.y);
	                                do
	                                {
	                                    if (g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0)
	                                    {
	                                        _637 = vec4(normalize(_6195), uintBitsToFloat(0x7f800000u /* inf */));
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        vec3 _6206 = _6195 - _5385;
	                                        float _6207 = length(_6206);
	                                        _637 = vec4(_6206 / vec3(_6207), _6207);
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                if (isinf(_637.w))
	                                {
	                                    _635 = true;
	                                }
	                                else
	                                {
	                                    _635 = isnan(_637.w);
	                                }
	                                if (!_635)
	                                {
	                                    _636 = _637.w * _637.w;
	                                }
	                                else
	                                {
	                                    _636 = 1.0;
	                                }
	                                _683 = _636 / (max(0.0, dot(g_Lights_1._member0[_5464].m_vLuminaireVectors.data[3].xyz, -_637.xyz)) * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].w);
	                                _654 = true;
	                                _655 = _637;
	                                break;
	                            }
	                            case 3:
	                            {
	                                vec3 _6049 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz - _5385;
	                                float _6050 = dot(_6049, _6049);
	                                float _6051 = sqrt(_6050);
	                                vec3 _6053 = _6049 / vec3(_6051);
	                                float _6054 = _6053.z;
	                                if (_6054 >= 0.0)
	                                {
	                                    _642 = 1.0;
	                                }
	                                else
	                                {
	                                    _642 = -1.0;
	                                }
	                                float _6061 = (-1.0) / (_642 + _6054);
	                                float _6062 = _6053.x;
	                                float _6063 = _6053.y;
	                                float _6065 = (_6062 * _6063) * _6061;
	                                vec3 _6070 = _643;
	                                _6070.x = 1.0 + (((_642 * _6062) * _6062) * _6061);
	                                _6070.y = _642 * _6065;
	                                _6070.z = (-_642) * _6062;
	                                _643 = _6070;
	                                vec3 _6077 = _644;
	                                _6077.x = _6065;
	                                _6077.y = _642 + ((_6063 * _6063) * _6061);
	                                _6077.z = -_6063;
	                                _644 = _6077;
	                                float _6085 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].x * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].x;
	                                float _6089 = sqrt(max(0.0, 1.0 - (_6085 / _6050)));
	                                float _6090 = _5393.x;
	                                float _6093 = (1.0 - _6090) + (_6090 * _6089);
	                                float _6097 = sqrt(max(0.0, 1.0 - (_6093 * _6093)));
	                                float _6099 = _5393.y * 6.283185482025146484375;
	                                float _6101 = _6051 * _6051;
	                                float _6107 = (_6051 * _6093) - sqrt(max(0.0, _6085 - ((_6101 * _6097) * _6097)));
	                                float _6113 = ((_6101 + _6085) - (_6107 * _6107)) / ((2.0 * _6051) * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].x);
	                                float _6117 = sqrt(max(0.0, 1.0 - (_6113 * _6113)));
	                                vec3 _6129 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz + ((mat3(-_6070, -_6077, -_6053) * vec3(cos(_6099) * _6117, sin(_6099) * _6117, _6113)) * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].x);
	                                do
	                                {
	                                    if (g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0)
	                                    {
	                                        _641 = vec4(normalize(_6129), uintBitsToFloat(0x7f800000u /* inf */));
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        vec3 _6140 = _6129 - _5385;
	                                        float _6141 = length(_6140);
	                                        _641 = vec4(_6140 / vec3(_6141), _6141);
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                _683 = 0.15915493667125701904296875 / (1.0 - _6089);
	                                _654 = true;
	                                _655 = _641;
	                                break;
	                            }
	                            case 4:
	                            case 5:
	                            {
	                                vec2 _651 = _5393;
	                                if (_5393.x < g_Lights_1._member0[_5464].m_vLuminaireVectors.data[4].y)
	                                {
	                                    vec2 _5940 = _651;
	                                    _5940.x = clamp(_5940.x / g_Lights_1._member0[_5464].m_vLuminaireVectors.data[4].y, 0.0, 0.99999988079071044921875);
	                                    _651 = _5940;
	                                    vec3 _5946 = normalize(g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz - g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].xyz);
	                                    if (_5940.x >= 0.5)
	                                    {
	                                        vec2 _5957 = _651;
	                                        _5957.x = clamp((2.0 * _5957.x) - 1.0, 0.0, 0.99999988079071044921875);
	                                        _651 = _5957;
	                                        _652 = -_5946;
	                                        _653 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].xyz;
	                                    }
	                                    else
	                                    {
	                                        vec2 _5952 = _651;
	                                        _5952.x = clamp(2.0 * _5952.x, 0.0, 0.99999988079071044921875);
	                                        _651 = _5952;
	                                        _652 = _5946;
	                                        _653 = g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz;
	                                    }
	                                    do
	                                    {
	                                        vec2 _5968 = (_651 * 2.0) - vec2(1.0);
	                                        if (all(equal(_5968, vec2(0.0))))
	                                        {
	                                            _648 = vec2(0.0);
	                                            break;
	                                        }
	                                        float _5973 = _5968.x;
	                                        float _5975 = _5968.y;
	                                        if (abs(_5973) > abs(_5975))
	                                        {
	                                            _649 = _5973;
	                                            _650 = 0.785398185253143310546875 * (_5975 / _5973);
	                                        }
	                                        else
	                                        {
	                                            _649 = _5975;
	                                            _650 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_5973 / _5975));
	                                        }
	                                        _648 = vec2(cos(_650), sin(_650)) * _649;
	                                        break;
	                                    } while(false);
	                                    _653 += ((g_Lights_1._member0[_5464].m_vLuminaireVectors.data[2].xyz * _648.x) + (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[3].xyz * _648.y));
	                                }
	                                else
	                                {
	                                    vec2 _5919 = _651;
	                                    _5919.x = clamp((_5919.x - g_Lights_1._member0[_5464].m_vLuminaireVectors.data[4].y) / (1.0 - g_Lights_1._member0[_5464].m_vLuminaireVectors.data[4].y), 0.0, 0.99999988079071044921875);
	                                    _651 = _5919;
	                                    vec3 _5934 = (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[2].xyz * cos(_5919.x * 6.283185482025146484375)) + (g_Lights_1._member0[_5464].m_vLuminaireVectors.data[3].xyz * sin(_5919.x * 6.283185482025146484375));
	                                    _652 = normalize(_5934);
	                                    _653 = mix(g_Lights_1._member0[_5464].m_vLuminaireVectors.data[0].xyz, g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].xyz, vec3(_5919.y)) + _5934;
	                                }
	                                do
	                                {
	                                    if (g_Lights_1._member0[_5464].m_vLightPosition.w == 0.0)
	                                    {
	                                        _647 = vec4(normalize(_653), uintBitsToFloat(0x7f800000u /* inf */));
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        vec3 _6011 = _653 - _5385;
	                                        float _6012 = length(_6011);
	                                        _647 = vec4(_6011 / vec3(_6012), _6012);
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                if (isinf(_647.w))
	                                {
	                                    _645 = true;
	                                }
	                                else
	                                {
	                                    _645 = isnan(_647.w);
	                                }
	                                if (!_645)
	                                {
	                                    _646 = _647.w * _647.w;
	                                }
	                                else
	                                {
	                                    _646 = 1.0;
	                                }
	                                _683 = _646 / (max(0.0, dot(_652, -_647.xyz)) * g_Lights_1._member0[_5464].m_vLuminaireVectors.data[1].w);
	                                _654 = true;
	                                _655 = _647;
	                                break;
	                            }
	                            default:
	                            {
	                                _683 = 0.0;
	                                _654 = true;
	                                _655 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	                                break;
	                            }
	                        }
	                        if (_654)
	                        {
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    vec3 _6419 = _667 * (3.1415927410125732421875 / _683);
	                    bool _6424 = !(dot(_485, _655.xyz) > 0.0);
	                    if (!((g_Lights_1._member0[_5464].m_nPathTraceFlags & 8) != 0))
	                    {
	                        vec3 _6435 = abs(_6419);
	                        float _6440 = max(_6435.x, max(_6435.y, _6435.z));
	                        float _6444 = clamp(_6440, -100.0, 100.0);
	                        if (_6444 == 0.0)
	                        {
	                            _628 = vec3(0.0);
	                        }
	                        else
	                        {
	                            _628 = clamp(_6419 / vec3(_6440), vec3(-1.0), vec3(1.0)) * _6444;
	                        }
	                        vec3 _6451 = abs(vec3(0.0));
	                        if (clamp(max(_6451.x, max(_6451.y, _6451.z)), -100.0, 100.0) == 0.0)
	                        {
	                            _627 = vec3(0.0);
	                        }
	                        else
	                        {
	                            _627 = vec3(0.0);
	                        }
	                        float _6463 = dot(_655.xyz, vec3(_342));
	                        if (_6424)
	                        {
	                            _684 = -_6463;
	                            _680 = _628 * vTransmissiveRatio;
	                        }
	                        else
	                        {
	                            _684 = _6463;
	                            _680 = _628;
	                        }
	                        vec4 _6469 = _505;
	                        vec3 _6476 = _6469.xyz + ((_680 * max(0.0, _684)) * 0.3183098733425140380859375);
	                        vec4 _6478 = _6469;
	                        _6478.x = _6476.x;
	                        _6478.y = _6476.y;
	                        _6478.z = _6476.z;
	                        vec3 _6484 = _6478.xyz + _627;
	                        vec4 _6486 = _6478;
	                        _6486.x = _6484.x;
	                        _6486.y = _6484.y;
	                        _6486.z = _6484.z;
	                        _505 = _6486;
	                        if (_684 > 0.0)
	                        {
	                            vec4 _6494 = _685;
	                            _6494.x = 0.2820948064327239990234375;
	                            _6494.y = (-0.48860251903533935546875) * _655.y;
	                            _6494.z = 0.48860251903533935546875 * _655.z;
	                            _6494.w = (-0.48860251903533935546875) * _655.x;
	                            _685 = _6494;
	                            vec4 _6507 = _686;
	                            _6507.x = (1.09254848957061767578125 * _655.x) * _655.y;
	                            _6507.y = ((-1.09254848957061767578125) * _655.y) * _655.z;
	                            _6507.z = 0.3153915703296661376953125 * (((3.0 * _655.z) * _655.z) - 1.0);
	                            _6507.w = ((-1.09254848957061767578125) * _655.x) * _655.z;
	                            _686 = _6507;
	                            _504 += (_6494 * _680.x);
	                            _501 += (_6507 * _680.x);
	                            _503 += (_6494 * _680.y);
	                            _500 += (_6507 * _680.y);
	                            _502 += (_6494 * _680.z);
	                            _499 += (_6507 * _680.z);
	                            vec4 _6546 = _498;
	                            vec3 _6549 = _6546.xyz + (_680 * (0.546274244785308837890625 * ((_655.x * _655.x) - (_655.y * _655.y))));
	                            vec4 _6551 = _6546;
	                            _6551.x = _6549.x;
	                            _6551.y = _6549.y;
	                            _6551.z = _6549.z;
	                            _498 = _6551;
	                        }
	                        _678 = _5466;
	                        continue;
	                    }
	                    if (_6424)
	                    {
	                        _687 = !_669;
	                    }
	                    else
	                    {
	                        _687 = false;
	                    }
	                    if (_687)
	                    {
	                        _678 = _5466;
	                        continue;
	                    }
	                    float _6569 = max(_6419.x, max(_6419.y, _6419.z));
	                    float _688 = _668.x;
	                    do
	                    {
	                        float _6574 = _671;
	                        float _6575 = _6574 + _6569;
	                        _671 = _6575;
	                        if (_6575 == 0.0)
	                        {
	                            _625 = false;
	                            break;
	                        }
	                        float _6580 = _6569 / _671;
	                        do
	                        {
	                            if (_6580 <= 0.0)
	                            {
	                                _626 = false;
	                                break;
	                            }
	                            if (_6580 >= 1.0)
	                            {
	                                _626 = true;
	                                break;
	                            }
	                            if (_688 < _6580)
	                            {
	                                _688 = min(_688 / _6580, 0.99999988079071044921875);
	                                _626 = true;
	                                break;
	                            }
	                            _688 = min((_688 - _6580) / (1.0 - _6580), 0.99999988079071044921875);
	                            _626 = false;
	                            break;
	                        } while(false);
	                        _625 = _626;
	                        break;
	                    } while(false);
	                    vec2 _6605 = _668;
	                    _6605.x = _688;
	                    _668 = _6605;
	                    if (_625)
	                    {
	                        _670 = _655;
	                        _682 = int(_5464);
	                        _677 = _6569;
	                        _681 = _6424;
	                        _679 = _6419;
	                    }
	                    _678 = _5466;
	                    continue;
	                }
	                _673 = _682;
	                _674 = _677;
	                _672 = _681;
	                _675++;
	                _676 = _679;
	                continue;
	            }
	            bool _6620 = any(notEqual(_676, vec3(0.0)));
	            if (_673 != (-1))
	            {
	                _669 = _6620;
	            }
	            else
	            {
	                _669 = false;
	            }
	            if (_669)
	            {
	                vec3 _6634 = _676;
	                vec3 _6635 = _6634 * (_671 / _674);
	                bool _623;
	                if (isinf(_670.w))
	                {
	                    _623 = true;
	                }
	                else
	                {
	                    _623 = isnan(_670.w);
	                }
	                float _624;
	                if (!_623)
	                {
	                    _624 = _670.w;
	                }
	                else
	                {
	                    _624 = 56755.83984375;
	                }
	                vec4 _6652 = _670;
	                _6652.w = _624;
	                _670 = _6652;
	                float _622;
	                do
	                {
	                    float _6661 = dot(_6652.xyz, g_Lights_1._member0[_673].m_vNearPlane.xyz);
	                    if (_6661 == 0.0)
	                    {
	                        _622 = 0.0;
	                        break;
	                    }
	                    _622 = (g_Lights_1._member0[_673].m_vNearPlane.w - dot(_5385, g_Lights_1._member0[_673].m_vNearPlane.xyz)) * (1.0 / _6661);
	                    break;
	                } while(false);
	                if (_622 > 0.0)
	                {
	                    vec4 _6673 = _670;
	                    _6673.w = min(_6673.w, _622);
	                    _670 = _6673;
	                }
	                if (_672)
	                {
	                    _679 = _508;
	                }
	                else
	                {
	                    _679 = _509;
	                }
	                vec4 _6681 = _670;
	                vec3 _6683 = _679 - _5385;
	                _6681.w = _6681.w + dot(_6681.xyz, _6683);
	                vec3 _6693 = normalize((_6681.xyz * _6681.w) + _6683);
	                vec4 _6695 = _6681;
	                _6695.x = _6693.x;
	                _6695.y = _6693.y;
	                _6695.z = _6693.z;
	                _670 = _6695;
	                if (false)
	                {
	                    _678 = 8u;
	                }
	                else
	                {
	                    _678 = 2u;
	                }
	                uint _621;
	                do
	                {
	                    int _6709 = int(g_SceneGlobalInfo._member0[0].m_nSceneGlobalInfoFlags);
	                    if ((_6709 & 1) != 0)
	                    {
	                        _621 = 32u;
	                        break;
	                    }
	                    if ((_6709 & 2) != 0)
	                    {
	                        _621 = 16u;
	                        break;
	                    }
	                    _621 = 0u;
	                    break;
	                } while(false);
	                vec3 _605 = _679;
	                float _604 = 0.0;
	                vec3 _603 = _670.xyz;
	                float _620;
	                if (_6620)
	                {
	                    _620 = _670.w;
	                }
	                else
	                {
	                    _620 = 0.0;
	                }
	                p_1 = PayloadShadow_t(1.0);
	                traceRayEXT(g_AccelStruct, _621, _678, 1u, 2u, 1u, _605, _604, _603, _620, 1);
	                if (_6620)
	                {
	                    _620 = p_1.m_flVisibility;
	                }
	                else
	                {
	                    _620 = 0.0;
	                }
	                vec4 _6745 = _305[g_Lights_1._member0[_673].m_nBakedShadowIndex + 1] * dot(_6635.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                _497 += (_6745 * _620);
	                _496 += _6745;
	                _495 = mix(_495, ivec4(g_Lights_1._member0[_673].m_nShadowedLightId), notEqual(_6745, vec4(0.0)));
	                if (g_Lights_1._member0[_673].m_nBakedShadowIndex == (-1))
	                {
	                    if (_672)
	                    {
	                        f16vec4 _602 = _340;
	                        bool _618;
	                        if ((_341 & 65535u) == 2u)
	                        {
	                            _618 = float(_602.x) > 0.0;
	                        }
	                        else
	                        {
	                            _618 = false;
	                        }
	                        _669 = _618;
	                    }
	                    else
	                    {
	                        _669 = false;
	                    }
	                    if (_669)
	                    {
	                        f16vec4 _480 = _340;
	                        uint _6788 = uint(_340.w);
	                        float _6793 = pow(saturate(-dot(normalize(_485 + vec3(_342)), _670.xyz)), 2.0);
	                        f16vec3 _6794 = f16vec3(vec3(0.0));
	                        vec3 _610;
	                        bool _614;
	                        if (isinf(_670.w))
	                        {
	                            _614 = true;
	                        }
	                        else
	                        {
	                            _614 = isnan(_670.w);
	                        }
	                        float _615;
	                        if (!_614)
	                        {
	                            _615 = _670.w;
	                        }
	                        else
	                        {
	                            _615 = 1000.0;
	                        }
	                        vec3 _609 = _509 + (_670.xyz * _615);
	                        float _608 = 0.0;
	                        vec3 _607 = -_670.xyz;
	                        float _616;
	                        if (_6793 > 0.0)
	                        {
	                            _616 = _615;
	                        }
	                        else
	                        {
	                            _616 = 0.0;
	                        }
	                        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _610, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_6794, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _6794, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                        traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, _609, _608, _607, _616, 0);
	                        float _617;
	                        if (p.nInstance != (-1))
	                        {
	                            f16vec4 _606 = p.material.vMaterialBits;
	                            bool _613;
	                            if ((p.material.nMaterialTypeAndFlags & 65535u) == 2u)
	                            {
	                                _613 = float(_606.x) > 0.0;
	                            }
	                            else
	                            {
	                                _613 = false;
	                            }
	                            if (!_613)
	                            {
	                                _616 = 0.0;
	                            }
	                            else
	                            {
	                                _616 = _6793;
	                            }
	                            _617 = _615 - p.flHitT;
	                        }
	                        else
	                        {
	                            _616 = _6793;
	                            _617 = _615;
	                        }
	                        float _6859 = _617 * float(_480.x);
	                        _676 = vec3(0.0);
	                        _680 = ((exp2(SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_6788].m_vTransmissiveLogColor.xyz * (1.0 + (_6859 * SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_6788].m_fTransmissiveSaturation))) * exp(-_6859)) * _616) * _6635;
	                    }
	                    else
	                    {
	                        _676 = _6635;
	                        _680 = vec3(0.0);
	                    }
	                    vec3 _6881 = _676 * _620;
	                    vec3 _6885 = abs(_6881);
	                    float _6890 = max(_6885.x, max(_6885.y, _6885.z));
	                    float _6894 = clamp(_6890, -100.0, 100.0);
	                    vec3 _612;
	                    if (_6894 == 0.0)
	                    {
	                        _612 = vec3(0.0);
	                    }
	                    else
	                    {
	                        _612 = clamp(_6881 / vec3(_6890), vec3(-1.0), vec3(1.0)) * _6894;
	                    }
	                    vec3 _6902 = abs(_680);
	                    float _6907 = max(_6902.x, max(_6902.y, _6902.z));
	                    float _6911 = clamp(_6907, -100.0, 100.0);
	                    vec3 _611;
	                    if (_6911 == 0.0)
	                    {
	                        _611 = vec3(0.0);
	                    }
	                    else
	                    {
	                        _611 = clamp(_680 / vec3(_6907), vec3(-1.0), vec3(1.0)) * _6911;
	                    }
	                    float _6918 = dot(_670.xyz, vec3(_342));
	                    if (_672)
	                    {
	                        _677 = -_6918;
	                        _676 = _612 * vTransmissiveRatio;
	                    }
	                    else
	                    {
	                        _677 = _6918;
	                        _676 = _612;
	                    }
	                    vec4 _6925 = _505;
	                    vec3 _6932 = _6925.xyz + ((_676 * max(0.0, _677)) * 0.3183098733425140380859375);
	                    vec4 _6934 = _6925;
	                    _6934.x = _6932.x;
	                    _6934.y = _6932.y;
	                    _6934.z = _6932.z;
	                    vec3 _6940 = _6934.xyz + _611;
	                    vec4 _6942 = _6934;
	                    _6942.x = _6940.x;
	                    _6942.y = _6940.y;
	                    _6942.z = _6940.z;
	                    _505 = _6942;
	                    if (_677 > 0.0)
	                    {
	                        vec4 _689;
	                        vec4 _6950 = _689;
	                        _6950.x = 0.2820948064327239990234375;
	                        _6950.y = (-0.48860251903533935546875) * _670.y;
	                        _6950.z = 0.48860251903533935546875 * _670.z;
	                        _6950.w = (-0.48860251903533935546875) * _670.x;
	                        _689 = _6950;
	                        vec4 _690;
	                        vec4 _6963 = _690;
	                        _6963.x = (1.09254848957061767578125 * _670.x) * _670.y;
	                        _6963.y = ((-1.09254848957061767578125) * _670.y) * _670.z;
	                        _6963.z = 0.3153915703296661376953125 * (((3.0 * _670.z) * _670.z) - 1.0);
	                        _6963.w = ((-1.09254848957061767578125) * _670.x) * _670.z;
	                        _690 = _6963;
	                        _504 += (_6950 * _676.x);
	                        _501 += (_6963 * _676.x);
	                        _503 += (_6950 * _676.y);
	                        _500 += (_6963 * _676.y);
	                        _502 += (_6950 * _676.z);
	                        _499 += (_6963 * _676.z);
	                        vec4 _7002 = _498;
	                        vec3 _7005 = _7002.xyz + (_676 * (0.546274244785308837890625 * ((_670.x * _670.x) - (_670.y * _670.y))));
	                        vec4 _7007 = _7002;
	                        _7007.x = _7005.x;
	                        _7007.y = _7005.y;
	                        _7007.z = _7005.z;
	                        _498 = _7007;
	                    }
	                }
	            }
	            float _7019 = sqrt(vSeed.y);
	            float _7021 = 6.283185482025146484375 * vSeed.x;
	            p_1 = PayloadShadow_t(1.0);
	            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _509, 0.0, mat3(_399, _398, vec3(_349)) * vec3(cos(_7021) * _7019, sin(_7021) * _7019, sqrt(max(0.0, 1.0 - vSeed.y))), 16.0, 1);
	            vec4 _7037 = _492;
	            _7037.x = _7037.x + p_1.m_flVisibility;
	            _492 = _7037;
	        }
	        vec4 _7041 = _505;
	        _7041.w = 1.0;
	        _505 = _7041;
	        if (g_PushConstants.m_nEstimate_DimensionCount.x > 0)
	        {
	            vec4 _7064 = g_Luxels._member0[_890].vIrradiance_flSampleCount;
	            float _7093 = 1.0 / (1.0 + _7064.w);
	            vec3 _7097 = mix(_7064.xyz, _505.xyz, vec3(_7093));
	            vec4 _7099 = _7064;
	            _7099.x = _7097.x;
	            _7099.y = _7097.y;
	            _7099.z = _7097.z;
	            vec4 _7104 = vec4(_7093);
	            _7099.w = _7099.w + 1.0;
	            _505 = _7099;
	            _504 = mix(g_Luxels._member0[_890].vShr, _504, _7104);
	            _503 = mix(g_Luxels._member0[_890].vShg, _503, _7104);
	            _502 = mix(g_Luxels._member0[_890].vShb, _502, _7104);
	            _501 = mix(g_Luxels._member0[_890].vQuadraticr, _501, _7104);
	            _500 = mix(g_Luxels._member0[_890].vQuadraticg, _500, _7104);
	            _499 = mix(g_Luxels._member0[_890].vQuadraticb, _499, _7104);
	            _498 = mix(g_Luxels._member0[_890].vQuadraticFinalrgb, _498, _7104);
	            _497 = mix(g_Luxels._member0[_890].vBakedShadow, _497, _7104);
	            _496 = mix(g_Luxels._member0[_890].vBakedShadowUnoccluded, _496, _7104);
	            _495 = mix(_495, g_Luxels._member0[_890].vBakedShadowLightId, notEqual(g_Luxels._member0[_890].vBakedShadowLightId, ivec4(255)));
	            _494 = mix(g_Luxels._member0[_890].vTangent, _494, _7104);
	            _493 = mix(g_Luxels._member0[_890].vNormal, _493, _7104);
	            _492 = mix(g_Luxels._member0[_890].flAmbientOcclusion_vPadding, _492, _7104);
	        }
	        g_Luxels._member0[_890].vIrradiance_flSampleCount = _505;
	        g_Luxels._member0[_890].vShr = _504;
	        g_Luxels._member0[_890].vShg = _503;
	        g_Luxels._member0[_890].vShb = _502;
	        g_Luxels._member0[_890].vQuadraticr = _501;
	        g_Luxels._member0[_890].vQuadraticg = _500;
	        g_Luxels._member0[_890].vQuadraticb = _499;
	        g_Luxels._member0[_890].vQuadraticFinalrgb = _498;
	        g_Luxels._member0[_890].vBakedShadow = _497;
	        g_Luxels._member0[_890].vBakedShadowUnoccluded = _496;
	        g_Luxels._member0[_890].vBakedShadowLightId = _495;
	        g_Luxels._member0[_890].vTangent = _494;
	        g_Luxels._member0[_890].vNormal = _493;
	        g_Luxels._member0[_890].flAmbientOcclusion_vPadding = _492;
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
