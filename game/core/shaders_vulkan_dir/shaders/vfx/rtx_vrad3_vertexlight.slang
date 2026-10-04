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
	
	struct VertexLightSample_t_natural
	{
	    vec4 vIrradiance_flSampleCount;
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
	
	float _283;
	vec4 _284;
	
	layout(set = 6, binding = 160, std430) buffer RWStructuredBuffer
	{
	    VertexLightSample_t_natural _member0[];
	} g_Samples;
	
	layout(set = 3, binding = 37, std430) readonly buffer StructuredBuffer
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo;
	
	layout(set = 6, binding = 158, std430) buffer g_Triangles
	{
	    float _member0[];
	} g_Triangles_1;
	
	layout(set = 3, binding = 35, std430) readonly buffer g_instanceBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer_1;
	
	layout(set = 6, binding = 161, std430) buffer g_LightBins
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
	
	layout(push_constant, std430) uniform VertexLightPushConstants_t_natural
	{
	    ivec4 m_nEstimate_nDimensionCount_nVertexStride_nMinSamples;
	    ivec4 m_nTriangleCount_Unused0;
	    vec4 m_vCordonMins;
	    vec4 m_vCordonMaxs;
	} g_PushConstants;
	
	layout(set = 6, binding = 159, r32ui) uniform readonly uimage3D g_TrianglesConverged;
	layout(set = 6, binding = 162) uniform readonly image3D g_RandomSamples;
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube[65536];
	layout(set = 3, binding = 14) uniform sampler g_Sampler;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 3, binding = 15) uniform sampler g_CookieSampler;
	
	void main()
	{
	    bool _565 = false;
	    bool _619 = false;
	    do
	    {
	        uvec2 vTriangle = gl_LaunchIDEXT.xy / uvec2(4u);
	        uint nSampleIndex = (gl_LaunchIDEXT.x + (gl_LaunchIDEXT.y * gl_LaunchSizeEXT.x)) + ((gl_LaunchIDEXT.z * gl_LaunchSizeEXT.x) * gl_LaunchSizeEXT.y);
	        int nTriangle = int(vTriangle.x + ((gl_LaunchSizeEXT.x / 4u) * vTriangle.y));
	        if (nTriangle >= g_PushConstants.m_nTriangleCount_Unused0.x)
	        {
	            break;
	        }
	        vec2 _706 = (vec2((gl_LaunchIDEXT.xy - (vTriangle.xy * uvec2(4u))).xy) + vec2(0.5)) * vec2(0.25);
	        float _708 = sqrt(_706.x);
	        vec3 _713 = vec3(1.0 - _708, _708 * (1.0 - _706.y), _283);
	        if (g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.x == 0)
	        {
	            g_Samples._member0[nSampleIndex].vIrradiance_flSampleCount = vec4(0.0);
	        }
	        else
	        {
	            if (imageLoad(g_TrianglesConverged, ivec3(ivec2(vTriangle), 0)).x != 0u)
	            {
	                break;
	            }
	        }
	        uvec3 _736 = uvec3(imageSize(g_RandomSamples));
	        ivec3 _673;
	        ivec3 _739 = _673;
	        _739.x = int(_736.x);
	        _739.y = int(_736.y);
	        _739.z = int(_736.z);
	        _673 = _739;
	        ivec2 _748 = ivec2(gl_LaunchIDEXT.xy) - _739.xy * (ivec2(gl_LaunchIDEXT.xy) / _739.xy);
	        uvec3 _770 = uvec3(g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.xyz);
	        vec3 _773 = vec3(_770) / (g_SceneGlobalInfo._member0[0].m_vLocalLightMaxBounds.xyz - g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz);
	        int _776 = 3 * nTriangle;
	        vec3 v0 = vec3(g_Triangles_1._member0[_776 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z], g_Triangles_1._member0[(_776 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 1], g_Triangles_1._member0[(_776 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 2]);
	        int _794 = _776 + 1;
	        vec3 v1 = vec3(g_Triangles_1._member0[_794 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z], g_Triangles_1._member0[(_794 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 1], g_Triangles_1._member0[(_794 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 2]);
	        int _812 = _776 + 2;
	        vec3 v2 = vec3(g_Triangles_1._member0[_812 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z], g_Triangles_1._member0[(_812 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 1], g_Triangles_1._member0[(_812 * g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.z) + 2]);
	        vec3 _833 = normalize(cross(v1 - v0, v2 - v0));
	        float _834 = _713.x;
	        float _836 = _713.y;
	        vec3 _842 = ((v0 * ((1.0 - _834) - _836)) + (v1 * _834)) + (v2 * _836);
	        f16vec3 _292 = f16vec3(_833);
	        vec3 _418 = _833;
	        vec3 _335;
	        vec3 _674 = _335;
	        vec3 _334;
	        vec3 _675 = _334;
	        float _846 = _833.z;
	        float _672;
	        if (_846 >= 0.0)
	        {
	            _672 = 1.0;
	        }
	        else
	        {
	            _672 = -1.0;
	        }
	        float _853 = (-1.0) / (_672 + _846);
	        float _854 = _833.x;
	        float _855 = _833.y;
	        float _857 = (_854 * _855) * _853;
	        vec3 _862 = _674;
	        _862.x = 1.0 + (((_672 * _854) * _854) * _853);
	        _862.y = _672 * _857;
	        _862.z = (-_672) * _854;
	        _674 = _862;
	        vec3 _869 = _675;
	        _869.x = _857;
	        _869.y = _672 + ((_855 * _855) * _853);
	        _869.z = -_855;
	        _675 = _869;
	        _335 = _862;
	        _334 = _869;
	        f16vec3 _290 = f16vec3(vec3(1.0));
	        float _879 = abs(1.0);
	        vec3 _884 = _842 + (_833 * ((abs(_842) + vec3(_879)) * 9.9999997473787516355514526367188e-05));
	        vec3 _420 = _884;
	        vec2 _889 = imageLoad(g_RandomSamples, ivec3(_748.xy, 1)).xy;
	        bool _676;
	        if (all(greaterThanEqual(_884.xyz, g_PushConstants.m_vCordonMins.xyz)))
	        {
	            _676 = all(lessThanEqual(_420.xyz, g_PushConstants.m_vCordonMaxs.xyz));
	        }
	        else
	        {
	            _676 = false;
	        }
	        vec3 vIrradiance;
	        if (_676)
	        {
	            vec3 _331;
	            float _332;
	            float _333;
	            f16vec4 _286;
	            uint _287;
	            float16_t _288;
	            float16_t _289;
	            float16_t _291;
	            int _417;
	            vec3 _419;
	            ivec2 _416 = _748;
	            uint _415 = uint(g_PushConstants.m_nEstimate_nDimensionCount_nVertexStride_nMinSamples.y);
	            uint _414 = uint(max(1, ((g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.w + 31) / 32)));
	            uvec3 _413 = _770;
	            vec3 _412 = (-g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz) * _773;
	            vec3 _411 = _773;
	            float _926 = _889.y;
	            float _927 = sqrt(_926);
	            float _929 = 6.283185482025146484375 * _889.x;
	            vec3 _937 = vec3(cos(_929) * _927, sin(_929) * _927, sqrt(max(0.0, 1.0 - _926)));
	            vec3 _940 = vec3(_292);
	            vec3 _942 = mat3(_335, _334, _940) * _937;
	            vec3 _661 = _942;
	            vec3 _448 = _420;
	            vec3 _447 = _419;
	            vec3 _446 = _418;
	            int _445 = _417;
	            f16vec3 _314 = _292;
	            float16_t _313 = _291;
	            f16vec3 _312 = _290;
	            float16_t _311 = _289;
	            float16_t _310 = _288;
	            uint _309 = _287;
	            f16vec4 _308 = _286;
	            vec3 _371 = _335;
	            vec3 _370 = _334;
	            float _369 = _333;
	            float _368 = _332;
	            vec3 _367 = _331;
	            int _662;
	            if (false)
	            {
	                _662 = 4;
	            }
	            else
	            {
	                _662 = 2;
	            }
	            int _948 = _662;
	            uint _950 = uint(1 | _948);
	            _662 = 1;
	            vec3 _663 = vec3(1.0 / (_937.z * 0.3183098733425140380859375));
	            vec3 _664 = vec3(0.0);
	            vec3 _449;
	            vec3 _465;
	            vec3 _495;
	            bool _502;
	            float _503;
	            bool _504;
	            vec3 _505;
	            bool _506;
	            vec3 _507;
	            vec3 _508;
	            float _509;
	            float _510;
	            bool _511;
	            vec3 _512;
	            bool _513;
	            vec3 _514;
	            bool _517;
	            bool _518;
	            bool _519;
	            float _520;
	            uint _521;
	            float _522;
	            bool _523;
	            float _524;
	            bool _525;
	            bool _526;
	            float _527;
	            float _528;
	            float _529;
	            bool _530;
	            float _531;
	            bool _532;
	            vec3 _533;
	            bool _534;
	            vec3 _535;
	            vec3 _536;
	            bool _537;
	            bool _538;
	            float _539;
	            vec4 _540;
	            vec4 _541;
	            float _542;
	            vec3 _543;
	            float _544;
	            float _545;
	            bool _546;
	            float _547;
	            vec4 _548;
	            vec2 _549;
	            float _550;
	            float _551;
	            vec4 _552;
	            float _553;
	            vec3 _554;
	            vec3 _555;
	            bool _556;
	            float _557;
	            vec4 _558;
	            vec2 _559;
	            float _560;
	            float _561;
	            vec3 _563;
	            vec3 _564;
	            vec4 _566;
	            float _567;
	            float _568;
	            vec3 _569;
	            vec3 _570;
	            float _571;
	            float _572;
	            bool _573;
	            vec3 _574;
	            vec3 _575;
	            bool _576;
	            bool _577;
	            vec3 _578;
	            float _585;
	            bool _587;
	            float _588;
	            bool _589;
	            vec3 _590;
	            bool _591;
	            vec3 _592;
	            vec3 _593;
	            vec4 _594;
	            vec4 _595;
	            float _596;
	            vec3 _597;
	            float _598;
	            float _599;
	            bool _600;
	            float _601;
	            vec4 _602;
	            vec2 _603;
	            float _604;
	            float _605;
	            vec4 _606;
	            float _607;
	            vec3 _608;
	            vec3 _609;
	            bool _610;
	            float _611;
	            vec4 _612;
	            vec2 _613;
	            float _614;
	            float _615;
	            vec3 _617;
	            vec3 _618;
	            vec4 _620;
	            float _621;
	            float _622;
	            vec3 _623;
	            vec3 _624;
	            float _625;
	            float _626;
	            bool _627;
	            vec3 _628;
	            vec3 _629;
	            bool _630;
	            bool _631;
	            vec3 _632;
	            float _637;
	            bool _638;
	            bool _639;
	            bool _640;
	            vec3 _642;
	            float _644;
	            float _645;
	            bool _648;
	            float _649;
	            float _650;
	            bool _653;
	            bool _654;
	            vec3 _655;
	            bool _657;
	            vec3 _659;
	            vec3 _660;
	            vec3 _665;
	            float _666;
	            float _669;
	            vec3 _671;
	            SPIRV_CROSS_LOOP
	            for (;;)
	            {
	                if (!(_662 <= 16))
	                {
	                    break;
	                }
	                SPIRV_CROSS_FLATTEN
	                if (false)
	                {
	                    SPIRV_CROSS_FLATTEN
	                    if (_662 > (-1))
	                    {
	                        _666 = 1.0;
	                        _665 = vec3(0.0);
	                    }
	                    else
	                    {
	                        if (_662 != (-1))
	                        {
	                            _666 = 0.0;
	                        }
	                        else
	                        {
	                            _666 = 1.0;
	                        }
	                        _665 = _663;
	                    }
	                }
	                else
	                {
	                    _666 = 1.0;
	                    _665 = _663;
	                }
	                if (all(equal(_665, vec3(0.0))))
	                {
	                    break;
	                }
	                vec3 _444 = _448;
	                vec3 _443 = _661;
	                vec2 _992 = imageLoad(g_RandomSamples, ivec3(_416.xy, int(1u + uint(_662)))).xy;
	                f16vec3 _994 = f16vec3(vec3(0.0));
	                vec2 _1000 = _992;
	                _1000.y = 0.0;
	                p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _449, 3.4028234663852885981170418348452e+38, _992.y, -1, false, MaterialDataMinimal_t(_994, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _994, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                traceRayEXT(g_AccelStruct, 0u, 4u, 0u, 2u, 0u, _448, 0.0, _661, 56755.83984375, 0);
	                float _1034 = p.flHitT;
	                vec2 _1035 = _992;
	                _1035.y = p.flOpacityRng;
	                vec2 _667 = _1035;
	                if (!(p.nInstance != (-1)))
	                {
	                    vec2 _1050 = imageLoad(g_RandomSamples, ivec3(_416.xy, int(1u + uint(_662 + 1)))).xy;
	                    _667 = _1050;
	                    do
	                    {
	                        vec2 _656 = _1050;
	                        if ((g_SceneGlobalInfo._member0[0].m_nSkyLightFlags & 1u) == 0u)
	                        {
	                            _655 = vec3(0.0);
	                            break;
	                        }
	                        if (_661.z < 0.0)
	                        {
	                            float _658 = _656.y;
	                            do
	                            {
	                                if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w <= 0.0)
	                                {
	                                    _654 = false;
	                                    break;
	                                }
	                                if (g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w >= 1.0)
	                                {
	                                    _654 = true;
	                                    break;
	                                }
	                                if (_658 < g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w)
	                                {
	                                    _658 = min(_658 / g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w, 0.99999988079071044921875);
	                                    _654 = true;
	                                    break;
	                                }
	                                _658 = min((_658 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w) / (1.0 - g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.w), 0.99999988079071044921875);
	                                _654 = false;
	                                break;
	                            } while(false);
	                            vec2 _1095 = _656;
	                            _1095.y = _658;
	                            _656 = _1095;
	                            _657 = _654;
	                        }
	                        else
	                        {
	                            _657 = false;
	                        }
	                        if (_657)
	                        {
	                            float _1103 = sqrt(_656.y);
	                            float _1105 = 6.283185482025146484375 * _656.x;
	                            _659 = vec3(cos(_1105) * _1103, sin(_1105) * _1103, sqrt(max(0.0, 1.0 - _656.y)));
	                            _660 = g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.xyz;
	                        }
	                        else
	                        {
	                            _659 = _661;
	                            _660 = vec3(0.0);
	                        }
	                        if (g_SceneGlobalInfo._member0[0].m_nIBLCubeMap >= 0)
	                        {
	                            vec4 _1150 = textureLod(samplerCube(g_bindless_TextureCube[g_SceneGlobalInfo._member0[0].m_nIBLCubeMap], g_Sampler), normalize(g_SceneGlobalInfo._member0[0].m_mIBLTransformI * vec4(_659, 0.0)), 0.0);
	                            if (dot(_1150.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)) < g_SceneGlobalInfo._member0[0].m_vSunLightIrradiance.w)
	                            {
	                                _660 += (g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.xyz * _1150.xyz);
	                            }
	                        }
	                        else
	                        {
	                            _660 += g_SceneGlobalInfo._member0[0].m_vSkyColor.xyz;
	                        }
	                        if (_662 > 1)
	                        {
	                            _660 *= g_SceneGlobalInfo._member0[0].m_vIBLCubeMapScale.w;
	                        }
	                        if (_657)
	                        {
	                            _660 *= g_SceneGlobalInfo._member0[0].m_vSkyAmbientBounce.xyz;
	                        }
	                        _655 = _660;
	                        break;
	                    } while(false);
	                    _664 += ((_665 * _655) * _666);
	                    break;
	                }
	                uint _450 = g_instanceBuffer_1._member0[uint(p.nInstance)].nMaterialFlags_nInstanceFlags;
	                if ((int((_450 >> uint(16)) & 65535u) & 4) != 0)
	                {
	                    break;
	                }
	                vec3 _438 = _444;
	                vec3 _437 = _443;
	                vec3 _436 = p.vSmoothPositionWs;
	                vec3 _435 = p.vFaceNormalWs;
	                float _434 = p.flHitT;
	                f16vec3 _361 = p.material.vNormalWs;
	                float16_t _360 = p.material.flMetalness;
	                f16vec3 _359 = p.material.vAlbedo;
	                float16_t _358 = p.material.flRoughness;
	                f16vec3 _357 = p.material.vEmissive;
	                float16_t _356 = p.material.flReflectance;
	                uint _355 = p.material.nMaterialTypeAndFlags;
	                f16vec4 _354 = p.material.vMaterialBits;
	                uint _1202 = uint(p.nInstance);
	                uint _456 = g_instanceBuffer_1._member0[_1202].nMaterialFlags_nInstanceFlags;
	                float _455 = g_instanceBuffer_1._member0[_1202].fEmissiveBoost;
	                vec3 _454 = (_438 + (_437 * _434)) + (_435 * ((abs(_438) + vec3(abs(_434))) * 9.9999997473787516355514526367188e-05));
	                vec3 _453 = (_438 + (_437 * _434)) + ((-_435) * ((abs(_438) + vec3(abs(_434))) * 9.9999997473787516355514526367188e-05));
	                vec3 _452 = _435;
	                int _451 = int(_456 & 65535u);
	                vec3 _461 = vec3(0.0);
	                vec3 _460 = vec3(0.0);
	                float _459 = 0.0;
	                float _458 = 0.0;
	                vec3 _457 = vec3(0.0);
	                f16vec3 _384 = _361;
	                float16_t _383 = _360;
	                f16vec3 _382 = _359;
	                f16vec3 _380 = _357;
	                float16_t _379 = _356;
	                uint _378 = _355;
	                f16vec4 _377 = _354;
	                float16_t _381 = float16_t(max(float(_358), 0.07999999821186065673828125));
	                vec3 _1250 = vec3(_361);
	                vec3 _651 = vec3(0.0);
	                vec3 _652 = vec3(0.0);
	                float _1251 = _1250.z;
	                if (_1251 >= 0.0)
	                {
	                    _650 = 1.0;
	                }
	                else
	                {
	                    _650 = -1.0;
	                }
	                float _1258 = (-1.0) / (_650 + _1251);
	                float _1259 = _1250.x;
	                float _1260 = _1250.y;
	                float _1262 = (_1259 * _1260) * _1258;
	                vec3 _1267 = _651;
	                _1267.x = 1.0 + (((_650 * _1259) * _1259) * _1258);
	                _1267.y = _650 * _1262;
	                _1267.z = (-_650) * _1259;
	                _651 = _1267;
	                vec3 _1274 = _652;
	                _1274.x = _1262;
	                _1274.y = _650 + ((_1260 * _1260) * _1258);
	                _1274.z = -_1260;
	                _652 = _1274;
	                _461 = _1267;
	                _460 = _1274;
	                vec3 _1286 = transpose(mat3(_1267, _1274, vec3(_384))) * (-_437);
	                _457 = _1286;
	                vec3 _1294 = vec3(mix(f16vec3(_379), _382, f16vec3(_383)));
	                _459 = dot((_1294 + ((vec3(1.0) - _1294) * pow(max(0.0, 1.0 - _1286.z), 5.0))).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                if ((_378 & 65535u) == 1u)
	                {
	                    float _1313 = dot(vec3(_377.xyz).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                    _458 = _1313 / max(9.9999997473787516355514526367188e-05, _1313 + dot(vec3(_382).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)));
	                }
	                f16vec3 _322 = _384;
	                float16_t _321 = _383;
	                f16vec3 _320 = _382;
	                float16_t _319 = _381;
	                f16vec3 _318 = _380;
	                float16_t _317 = _379;
	                uint _316 = _378;
	                f16vec4 _315 = _377;
	                vec3 _376 = _461;
	                vec3 _375 = _460;
	                float _374 = _459;
	                float _373 = _458;
	                vec3 _372 = _457;
	                if ((_950 & 6u) != 0u)
	                {
	                    if ((_950 & 2u) != 0u)
	                    {
	                        _653 = (_451 & 256) != 0;
	                    }
	                    else
	                    {
	                        _653 = false;
	                    }
	                    if (_653)
	                    {
	                        _318 *= float16_t(_455);
	                    }
	                    else
	                    {
	                        if ((_950 & 4u) != 0u)
	                        {
	                            _653 = (_451 & 512) != 0;
	                        }
	                        else
	                        {
	                            _653 = false;
	                        }
	                        if (_653)
	                        {
	                            _318 *= float16_t(_455);
	                        }
	                        else
	                        {
	                            _318 = f16vec3(vec3(0.0));
	                        }
	                    }
	                }
	                if ((_950 & 1u) != 0u)
	                {
	                    _653 = any(notEqual(_436, vec3(3.4028234663852885981170418348452e+38)));
	                }
	                else
	                {
	                    _653 = false;
	                }
	                vec3 _1379 = _436 - _454;
	                float _1380 = length(_1379);
	                vec3 _464 = _454;
	                float _463 = 0.0;
	                vec3 _462 = vec4(_1379 / vec3(_1380), _1380).xyz;
	                if (_653)
	                {
	                    _649 = _1380;
	                }
	                else
	                {
	                    _649 = 0.0;
	                }
	                p_1 = PayloadShadow_t(1.0);
	                traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _464, _463, _462, _649, 1);
	                if (_653)
	                {
	                    _649 = p_1.m_flVisibility;
	                }
	                else
	                {
	                    _649 = 0.0;
	                }
	                if (_649 == 1.0)
	                {
	                    _454 = _436;
	                    _452 = vec3(_361);
	                }
	                vec3 _442 = _454;
	                vec3 _441 = _453;
	                vec3 _440 = _452;
	                int _439 = _451;
	                f16vec3 _307 = _322;
	                float16_t _306 = _321;
	                f16vec3 _305 = _320;
	                float16_t _304 = _319;
	                f16vec3 _303 = _318;
	                float16_t _302 = _317;
	                uint _301 = _316;
	                f16vec4 _300 = _315;
	                vec3 _366 = _376;
	                vec3 _365 = _375;
	                float _364 = _374;
	                float _363 = _373;
	                vec3 _362 = _372;
	                if (!(dot(_452, -_661) > 0.0))
	                {
	                    if ((_439 & 2048) != 0)
	                    {
	                        _440 = -_440;
	                        _307 = -_307;
	                        vec3 _1718 = _448;
	                        _448 = _447;
	                        _447 = _1718;
	                    }
	                    else
	                    {
	                        vec2 _1446 = imageLoad(g_RandomSamples, ivec3(_416.xy, int(1u + uint(_662)))).xy;
	                        f16vec3 _1448 = f16vec3(vec3(0.0));
	                        vec2 _1454 = _1446;
	                        _1454.y = 0.0;
	                        p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _465, 3.4028234663852885981170418348452e+38, _1446.y, -1, false, MaterialDataMinimal_t(_1448, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _1448, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                        traceRayEXT(g_AccelStruct, 16u, 4u, 0u, 2u, 0u, _444, _1034 * 0.99989998340606689453125, _443, _1034 * 1.00010001659393310546875, 0);
	                        vec2 _1487 = _1446;
	                        _1487.y = p.flOpacityRng;
	                        _667 = _1487;
	                        if (p.nInstance != (-1))
	                        {
	                            vec3 _433 = _444;
	                            vec3 _432 = _443;
	                            vec3 _431 = p.vSmoothPositionWs;
	                            vec3 _430 = p.vFaceNormalWs;
	                            float _429 = p.flHitT;
	                            f16vec3 _353 = p.material.vNormalWs;
	                            float16_t _352 = p.material.flMetalness;
	                            f16vec3 _351 = p.material.vAlbedo;
	                            float16_t _350 = p.material.flRoughness;
	                            f16vec3 _349 = p.material.vEmissive;
	                            float16_t _348 = p.material.flReflectance;
	                            uint _347 = p.material.nMaterialTypeAndFlags;
	                            f16vec4 _346 = p.material.vMaterialBits;
	                            uint _1494 = uint(p.nInstance);
	                            uint _471 = g_instanceBuffer_1._member0[_1494].nMaterialFlags_nInstanceFlags;
	                            float _470 = g_instanceBuffer_1._member0[_1494].fEmissiveBoost;
	                            vec3 _469 = (_433 + (_432 * _429)) + (_430 * ((abs(_433) + vec3(abs(_429))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _468 = (_433 + (_432 * _429)) + ((-_430) * ((abs(_433) + vec3(abs(_429))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _467 = _430;
	                            int _466 = int(_471 & 65535u);
	                            vec3 _476 = vec3(0.0);
	                            vec3 _475 = vec3(0.0);
	                            float _474 = 0.0;
	                            float _473 = 0.0;
	                            vec3 _472 = vec3(0.0);
	                            f16vec3 _397 = _353;
	                            float16_t _396 = _352;
	                            f16vec3 _395 = _351;
	                            f16vec3 _393 = _349;
	                            float16_t _392 = _348;
	                            uint _391 = _347;
	                            f16vec4 _390 = _346;
	                            float16_t _394 = float16_t(max(float(_350), 0.07999999821186065673828125));
	                            vec3 _1542 = vec3(_353);
	                            vec3 _646 = vec3(0.0);
	                            vec3 _647 = vec3(0.0);
	                            float _1543 = _1542.z;
	                            if (_1543 >= 0.0)
	                            {
	                                _645 = 1.0;
	                            }
	                            else
	                            {
	                                _645 = -1.0;
	                            }
	                            float _1550 = (-1.0) / (_645 + _1543);
	                            float _1551 = _1542.x;
	                            float _1552 = _1542.y;
	                            float _1554 = (_1551 * _1552) * _1550;
	                            vec3 _1559 = _646;
	                            _1559.x = 1.0 + (((_645 * _1551) * _1551) * _1550);
	                            _1559.y = _645 * _1554;
	                            _1559.z = (-_645) * _1551;
	                            _646 = _1559;
	                            vec3 _1566 = _647;
	                            _1566.x = _1554;
	                            _1566.y = _645 + ((_1552 * _1552) * _1550);
	                            _1566.z = -_1552;
	                            _647 = _1566;
	                            _476 = _1559;
	                            _475 = _1566;
	                            vec3 _1578 = transpose(mat3(_1559, _1566, vec3(_397))) * (-_432);
	                            _472 = _1578;
	                            vec3 _1586 = vec3(mix(f16vec3(_392), _395, f16vec3(_396)));
	                            _474 = dot((_1586 + ((vec3(1.0) - _1586) * pow(max(0.0, 1.0 - _1578.z), 5.0))).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                            if ((_391 & 65535u) == 1u)
	                            {
	                                float _1605 = dot(vec3(_390.xyz).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                                _473 = _1605 / max(9.9999997473787516355514526367188e-05, _1605 + dot(vec3(_395).xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)));
	                            }
	                            f16vec3 _330 = _397;
	                            float16_t _329 = _396;
	                            f16vec3 _328 = _395;
	                            float16_t _327 = _394;
	                            f16vec3 _326 = _393;
	                            float16_t _325 = _392;
	                            uint _324 = _391;
	                            f16vec4 _323 = _390;
	                            vec3 _389 = _476;
	                            vec3 _388 = _475;
	                            float _387 = _474;
	                            float _386 = _473;
	                            vec3 _385 = _472;
	                            if ((_950 & 6u) != 0u)
	                            {
	                                if ((_950 & 2u) != 0u)
	                                {
	                                    _648 = (_466 & 256) != 0;
	                                }
	                                else
	                                {
	                                    _648 = false;
	                                }
	                                if (_648)
	                                {
	                                    _326 *= float16_t(_470);
	                                }
	                                else
	                                {
	                                    if ((_950 & 4u) != 0u)
	                                    {
	                                        _648 = (_466 & 512) != 0;
	                                    }
	                                    else
	                                    {
	                                        _648 = false;
	                                    }
	                                    if (_648)
	                                    {
	                                        _326 *= float16_t(_470);
	                                    }
	                                    else
	                                    {
	                                        _326 = f16vec3(vec3(0.0));
	                                    }
	                                }
	                            }
	                            if ((_950 & 1u) != 0u)
	                            {
	                                _648 = any(notEqual(_431, vec3(3.4028234663852885981170418348452e+38)));
	                            }
	                            else
	                            {
	                                _648 = false;
	                            }
	                            vec3 _1671 = _431 - _469;
	                            float _1672 = length(_1671);
	                            vec3 _479 = _469;
	                            float _478 = 0.0;
	                            vec3 _477 = vec4(_1671 / vec3(_1672), _1672).xyz;
	                            if (_648)
	                            {
	                                _644 = _1672;
	                            }
	                            else
	                            {
	                                _644 = 0.0;
	                            }
	                            p_1 = PayloadShadow_t(1.0);
	                            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _479, _478, _477, _644, 1);
	                            if (_648)
	                            {
	                                _644 = p_1.m_flVisibility;
	                            }
	                            else
	                            {
	                                _644 = 0.0;
	                            }
	                            if (_644 == 1.0)
	                            {
	                                _469 = _431;
	                                _467 = vec3(_353);
	                            }
	                            _442 = _469;
	                            _441 = _468;
	                            _440 = _467;
	                            _439 = _466;
	                            _307 = _330;
	                            _306 = _329;
	                            _305 = _328;
	                            _304 = _327;
	                            _303 = _326;
	                            _302 = _325;
	                            _301 = _324;
	                            _300 = _323;
	                            _366 = _389;
	                            _365 = _388;
	                            _364 = _387;
	                            _363 = _386;
	                            _362 = _385;
	                        }
	                        else
	                        {
	                            break;
	                        }
	                    }
	                }
	                vec3 _428 = _442;
	                vec3 _427 = _441;
	                vec3 _426 = _440;
	                f16vec3 _299 = _307;
	                float16_t _298 = _306;
	                f16vec3 _297 = _305;
	                float16_t _296 = _304;
	                float16_t _295 = _302;
	                uint _294 = _301;
	                f16vec4 _293 = _300;
	                vec3 _345 = _366;
	                vec3 _344 = _365;
	                vec3 _343 = _362;
	                vec3 _1735 = (_442 + _441) * 0.5;
	                bool _1736 = _662 != 0;
	                f16vec4 _481 = _300;
	                if ((_301 & 65535u) == 1u)
	                {
	                    _639 = any(greaterThan(vec3(_481.xyz), vec3(0.0)));
	                }
	                else
	                {
	                    _639 = false;
	                }
	                if (_639)
	                {
	                    _640 = true;
	                }
	                else
	                {
	                    f16vec4 _480 = _293;
	                    if ((_294 & 65535u) == 2u)
	                    {
	                        _638 = float(_480.x) > 0.0;
	                    }
	                    else
	                    {
	                        _638 = false;
	                    }
	                    _640 = _638;
	                }
	                vec2 _1774 = imageLoad(g_RandomSamples, ivec3(_416.xy, int(1u + ((2u * _415) + uint(_662))))).xy;
	                bool _641 = false;
	                vec3 _1787 = (_428 + _427) * 0.5;
	                uvec3 _1795 = min(uvec3(max(fma(_1787, _411, _412), vec3(0.0))), (_413 - uvec3(1u)));
	                uint _633 = 0u;
	                vec3 _634 = vec3(0.0);
	                for (;;)
	                {
	                    if (!(_633 < _414))
	                    {
	                        break;
	                    }
	                    uint _1811 = _414 * _413.x;
	                    uint _635 = subgroupOr(g_LightBins_1._member0[((((_1811 * _413.y) * _1795.z) + (_1811 * _1795.y)) + (_414 * _1795.x)) + _633]);
	                    vec3 _636 = _634;
	                    for (;;)
	                    {
	                        if (!(_635 != 0u))
	                        {
	                            break;
	                        }
	                        uint _1835 = _635;
	                        uint _1839 = uint(findLSB(_1835)) + (_633 * 32u);
	                        uint _1841 = _1835 & (_1835 - 1u);
	                        if ((uint(g_Lights_1._member0[_1839].m_nPathTraceFlags) & 1u) == 0u)
	                        {
	                            _635 = _1841;
	                            continue;
	                        }
	                        if ((g_Lights_1._member0[_1839].m_nPathTraceFlags & 8) != 0)
	                        {
	                            _641 = true;
	                            _635 = _1841;
	                            continue;
	                        }
	                        do
	                        {
	                            do
	                            {
	                                vec4 _1867 = g_Lights_1._member0[_1839].m_mToClipSpace * vec4(_1787.xyz, 1.0);
	                                vec3 _1871 = _1867.xyz / vec3(_1867.w);
	                                vec4 _1873;
	                                _1873.x = _1871.x;
	                                _1873.y = _1871.y;
	                                _1873.z = _1871.z;
	                                if (all(greaterThanEqual(_1873.xyz, vec3(-1.0, -1.0, 0.0))))
	                                {
	                                    _630 = all(lessThanEqual(_1873.xyz, vec3(1.0)));
	                                }
	                                else
	                                {
	                                    _630 = false;
	                                }
	                                if (!_630)
	                                {
	                                    _631 = false;
	                                    break;
	                                }
	                                if (!all(lessThanEqual(abs((g_Lights_1._member0[_1839].m_mBarnIlluminationFromWorld * vec4(_1787, 1.0)).xyz), vec3(1.0))))
	                                {
	                                    _631 = false;
	                                    break;
	                                }
	                                _631 = true;
	                                break;
	                            } while(false);
	                            if (!_631)
	                            {
	                                _632 = vec3(0.0);
	                                break;
	                            }
	                            vec4 _1910 = g_Lights_1._member0[_1839].m_mToClipSpace * vec4(_1787.xyz, 1.0);
	                            vec3 _1914 = _1910.xyz / vec3(_1910.w);
	                            vec4 _1916;
	                            _1916.x = _1914.x;
	                            _1916.y = _1914.y;
	                            _1916.z = _1914.z;
	                            if (_1736)
	                            {
	                                _629 = g_Lights_1._member0[_1839].m_vBounceColor.xyz;
	                            }
	                            else
	                            {
	                                _629 = g_Lights_1._member0[_1839].m_vColor.xyz;
	                            }
	                            if (true)
	                            {
	                                if (g_Lights_1._member0[_1839].m_nCookie >= 0)
	                                {
	                                    if (g_Lights_1._member0[_1839].m_bSphericalCookie != 0)
	                                    {
	                                        vec4 _1974 = vec4(-g_Lights_1._member0[_1839].m_vOrientation.xyz, g_Lights_1._member0[_1839].m_vOrientation.w);
	                                        vec4 _1976 = _1974.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                                        vec3 _1979 = _1976.xyz;
	                                        vec3 _1980 = vec4((-normalize(g_Lights_1._member0[_1839].m_vLightPosition.xyz - _1787)).xyz, 0.0).xyz;
	                                        vec4 _1987 = vec4((_1980 * _1976.w) + cross(_1980, _1979), -dot(_1980, _1979));
	                                        vec3 _1988 = _1987.xyz;
	                                        float _1989 = _1974.w;
	                                        vec3 _1991 = _1974.xyz;
	                                        float _1992 = _1987.w;
	                                        vec3 _2000 = vec4(((_1988 * _1989) + (_1991 * _1992)) + cross(_1991, _1988), _283).xyz;
	                                        vec2 _2009 = vec2(atan(_2000.y, -_2000.x) * 0.15915493667125701904296875, acos(_2000.z) * 0.3183098733425140380859375);
	                                        vec2 _2016 = (_2009.xy * g_Lights_1._member0[_1839].m_vCookieParameters.zw) + g_Lights_1._member0[_1839].m_vCookieParameters.xy;
	                                        vec2 _2018 = _2009;
	                                        _2018.x = _2016.x;
	                                        _2018.y = _2016.y;
	                                        _628 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_1839].m_nCookie], g_Sampler)), _2018, 0.0).xyz;
	                                    }
	                                    else
	                                    {
	                                        vec2 _1947 = fma(_1916.xyz.xy, vec2(0.5, -0.5), vec2(0.5));
	                                        vec2 _1954 = (_1947.xy * g_Lights_1._member0[_1839].m_vCookieParameters.zw) + g_Lights_1._member0[_1839].m_vCookieParameters.xy;
	                                        vec2 _1956 = _1947;
	                                        _1956.x = _1954.x;
	                                        _1956.y = _1954.y;
	                                        _628 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_1839].m_nCookie], g_CookieSampler)), _1956, 0.0).xyz;
	                                    }
	                                }
	                                else
	                                {
	                                    _628 = vec3(1.0);
	                                }
	                                _629 *= _628;
	                            }
	                            if (g_Lights_1._member0[_1839].m_nLuminaireType != 0)
	                            {
	                                _629 = (_629 * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].w) * 0.3183098733425140380859375;
	                            }
	                            else
	                            {
	                                if (!(g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0))
	                                {
	                                    vec3 _2045 = g_Lights_1._member0[_1839].m_vLightPosition.xyz - _1787;
	                                    _629 *= (vec3(g_Lights_1._member0[_1839].m_vLightPosition.w) / max(vec3(dot(_2045, _2045)), vec3(g_Lights_1._member0[_1839].m_vLightPosition.w)));
	                                }
	                            }
	                            if (g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.z > 0.0)
	                            {
	                                _625 = smoothstep(0.0, 1.0, _1916.xyz.z * g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.z);
	                            }
	                            else
	                            {
	                                _625 = 1.0;
	                            }
	                            if (g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.w > 0.0)
	                            {
	                                _625 *= smoothstep(0.0, 1.0, (1.0 - _1916.xyz.z) * g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.w);
	                            }
	                            if (!(g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0))
	                            {
	                                vec3 _2099 = g_Lights_1._member0[_1839].m_vLightPosition.xyz - _1787;
	                                float _2100 = length(_2099);
	                                vec3 _2102 = _2099 / vec3(_2100);
	                                float _2111 = _625 * smoothstep(0.0, 1.0, g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.x + (g_Lights_1._member0[_1839].m_vDistanceFade_vSkirt.y * _2100));
	                                if (g_Lights_1._member0[_1839].m_nLuminaireType != 2)
	                                {
	                                    _627 = g_Lights_1._member0[_1839].m_nLuminaireType != 1;
	                                }
	                                else
	                                {
	                                    _627 = false;
	                                }
	                                if (_627)
	                                {
	                                    float _2130 = 2.0 * g_Lights_1._member0[_1839].m_vOrientation.x;
	                                    float _2134 = 2.0 * g_Lights_1._member0[_1839].m_vOrientation.w;
	                                    vec3 _2148 = vec3((_2130 * g_Lights_1._member0[_1839].m_vOrientation.y) - (_2134 * g_Lights_1._member0[_1839].m_vOrientation.z), (1.0 - (_2130 * g_Lights_1._member0[_1839].m_vOrientation.x)) - ((2.0 * g_Lights_1._member0[_1839].m_vOrientation.z) * g_Lights_1._member0[_1839].m_vOrientation.z), ((2.0 * g_Lights_1._member0[_1839].m_vOrientation.y) * g_Lights_1._member0[_1839].m_vOrientation.z) + (_2134 * g_Lights_1._member0[_1839].m_vOrientation.x)) * g_Lights_1._member0[_1839].m_vAngleFade.z;
	                                    vec3 _2149 = _2102 - _2148;
	                                    vec3 _2150 = _2102 + _2148;
	                                    do
	                                    {
	                                        vec3 _2153 = _2150 - _2149;
	                                        float _2155 = dot(-_2149, _2153);
	                                        if (_2155 <= 0.0)
	                                        {
	                                            _623 = _2149;
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            float _2160 = dot(_2153, _2153);
	                                            if (_2155 > _2160)
	                                            {
	                                                _623 = _2150;
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                _623 = _2149 + (_2153 * (_2155 / _2160));
	                                                break;
	                                            }
	                                            break;
	                                        }
	                                        break;
	                                    } while(false);
	                                    if (any(notEqual(_623, vec3(0.0))))
	                                    {
	                                        _624 = normalize(_623);
	                                    }
	                                    else
	                                    {
	                                        _624 = _623;
	                                    }
	                                    float _2184 = 2.0 * g_Lights_1._member0[_1839].m_vOrientation.x;
	                                    float _2187 = 2.0 * g_Lights_1._member0[_1839].m_vOrientation.w;
	                                    _626 = _2111 * saturate(g_Lights_1._member0[_1839].m_vAngleFade.x + (g_Lights_1._member0[_1839].m_vAngleFade.y * dot(vec3((1.0 - ((2.0 * g_Lights_1._member0[_1839].m_vOrientation.y) * g_Lights_1._member0[_1839].m_vOrientation.y)) - ((2.0 * g_Lights_1._member0[_1839].m_vOrientation.z) * g_Lights_1._member0[_1839].m_vOrientation.z), (_2184 * g_Lights_1._member0[_1839].m_vOrientation.y) + (_2187 * g_Lights_1._member0[_1839].m_vOrientation.z), (_2184 * g_Lights_1._member0[_1839].m_vOrientation.z) - (_2187 * g_Lights_1._member0[_1839].m_vOrientation.y)), _624)));
	                                }
	                                else
	                                {
	                                    _626 = _2111;
	                                }
	                            }
	                            else
	                            {
	                                _626 = _625;
	                            }
	                            if (g_Lights_1._member0[_1839].m_nCookie == (-1))
	                            {
	                                do
	                                {
	                                    vec2 _2216 = abs(_1916.xyz.xy);
	                                    if (g_Lights_1._member0[_1839].m_vCookieParameters.z == 0.0)
	                                    {
	                                        _621 = smoothstep(1.0, g_Lights_1._member0[_1839].m_vCookieParameters.x, _2216.x) * smoothstep(1.0, g_Lights_1._member0[_1839].m_vCookieParameters.y, _2216.y);
	                                        break;
	                                    }
	                                    else
	                                    {
	                                        float _2221 = _2216.x;
	                                        float _2225 = _2216.y;
	                                        float _2232 = (-0.5) * g_Lights_1._member0[_1839].m_vCookieParameters.z;
	                                        float _2234 = (g_Lights_1._member0[_1839].m_vCookieParameters.x * g_Lights_1._member0[_1839].m_vCookieParameters.y) * pow(max(pow(g_Lights_1._member0[_1839].m_vCookieParameters.y * _2221, 2.0 / g_Lights_1._member0[_1839].m_vCookieParameters.z) + pow(g_Lights_1._member0[_1839].m_vCookieParameters.x * _2225, 2.0 / g_Lights_1._member0[_1839].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _2232);
	                                        float _2241 = pow(max(pow(_2221, 2.0 / g_Lights_1._member0[_1839].m_vCookieParameters.z) + pow(_2225, 2.0 / g_Lights_1._member0[_1839].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _2232);
	                                        if (_2234 < _2241)
	                                        {
	                                            _621 = smoothstep(_2241, _2234, 1.0);
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            if (_2241 > 1.0)
	                                            {
	                                                _622 = 1.0;
	                                            }
	                                            else
	                                            {
	                                                _622 = 0.0;
	                                            }
	                                            _621 = _622;
	                                            break;
	                                        }
	                                        break;
	                                    }
	                                    break;
	                                } while(false);
	                                _626 *= _621;
	                            }
	                            _632 = _629 * _626;
	                            break;
	                        } while(false);
	                        SPIRV_CROSS_BRANCH
	                        if (any(greaterThan(_632, vec3(0.0))))
	                        {
	                            _619 = false;
	                            do
	                            {
	                                switch (g_Lights_1._member0[_1839].m_nLuminaireType)
	                                {
	                                    case 0:
	                                    {
	                                        _637 = 1.0;
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0)
	                                            {
	                                                _594 = vec4(normalize(g_Lights_1._member0[_1839].m_vLightPosition.xyz), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2789 = g_Lights_1._member0[_1839].m_vLightPosition.xyz - _1787;
	                                                float _2790 = length(_2789);
	                                                _594 = vec4(_2789 / vec3(_2790), _2790);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _619 = true;
	                                        _620 = _594;
	                                        break;
	                                    }
	                                    case 1:
	                                    {
	                                        vec3 _2629 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].xyz - g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz;
	                                        vec3 _2633 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[2].xyz - g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz;
	                                        float _2634 = length(_2629);
	                                        float _2635 = length(_2633);
	                                        vec3 _2637 = _2629 / vec3(_2634);
	                                        vec3 _2639 = _2633 / vec3(_2635);
	                                        vec3 _2640 = cross(_2637, _2639);
	                                        vec3 _2641 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz - _1787;
	                                        float _2642 = dot(_2641, _2640);
	                                        if (_2642 > 0.0)
	                                        {
	                                            _596 = _2642 * (-1.0);
	                                            _597 = _2640 * (-1.0);
	                                        }
	                                        else
	                                        {
	                                            _596 = _2642;
	                                            _597 = _2640;
	                                        }
	                                        float _2651 = dot(_2641, _2637);
	                                        float _2652 = dot(_2641, _2639);
	                                        float _2653 = _2651 + _2634;
	                                        float _2654 = _2652 + _2635;
	                                        vec3 _2657 = vec3(_2651, _2652, _596);
	                                        vec3 _2658 = vec3(_2651, _2654, _596);
	                                        vec3 _2659 = vec3(_2653, _2652, _596);
	                                        vec3 _2660 = vec3(_2653, _2654, _596);
	                                        vec3 _2662 = normalize(cross(_2657, _2659));
	                                        vec3 _2664 = normalize(cross(_2659, _2660));
	                                        vec3 _2666 = normalize(cross(_2660, _2658));
	                                        vec3 _2668 = normalize(cross(_2658, _2657));
	                                        float _2685 = _2662.z;
	                                        float _2689 = (6.283185482025146484375 - acos(clamp(-dot(_2666, _2668), -1.0, 1.0))) - acos(clamp(-dot(_2668, _2662), -1.0, 1.0));
	                                        float _2691 = (acos(clamp(-dot(_2662, _2664), -1.0, 1.0)) + acos(clamp(-dot(_2664, _2666), -1.0, 1.0))) - _2689;
	                                        if (isnan(_2691))
	                                        {
	                                            _598 = 0.0;
	                                        }
	                                        else
	                                        {
	                                            _598 = _2691;
	                                        }
	                                        float _2699 = (_1774.x * _598) + _2689;
	                                        float _2704 = ((cos(_2699) * _2685) - _2666.z) / sin(_2699);
	                                        if (_2704 > 0.0)
	                                        {
	                                            _599 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _599 = -1.0;
	                                        }
	                                        float _2713 = _599;
	                                        float _2715 = clamp((1.0 / sqrt((_2704 * _2704) + (_2685 * _2685))) * _2713, -1.0, 1.0);
	                                        float _2723 = clamp((-(_2715 * _596)) / sqrt(1.0 - (_2715 * _2715)), _2651, _2653);
	                                        float _2726 = sqrt((_2723 * _2723) + (_596 * _596));
	                                        float _2727 = _2726 * _2726;
	                                        float _2730 = _2652 / sqrt(_2727 + (_2652 * _2652));
	                                        float _2737 = _2730 + (_1774.y * ((_2654 / sqrt(_2727 + (_2654 * _2654))) - _2730));
	                                        float _2738 = _2737 * _2737;
	                                        if (_2738 < 0.99999988079071044921875)
	                                        {
	                                            _599 = (_2737 * _2726) / sqrt(1.0 - _2738);
	                                        }
	                                        else
	                                        {
	                                            _599 = _2654;
	                                        }
	                                        vec3 _2755 = ((_1787 + (_2637 * _2723)) + (_2639 * _599)) + (_597 * _596);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0)
	                                            {
	                                                _595 = vec4(normalize(_2755), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2766 = _2755 - _1787;
	                                                float _2767 = length(_2766);
	                                                _595 = vec4(_2766 / vec3(_2767), _2767);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _637 = 1.0 / _598;
	                                        _619 = true;
	                                        _620 = _595;
	                                        break;
	                                    }
	                                    case 2:
	                                    {
	                                        do
	                                        {
	                                            vec2 _2537 = (_1774 * 2.0) - vec2(1.0);
	                                            if (all(equal(_2537, vec2(0.0))))
	                                            {
	                                                _603 = vec2(0.0);
	                                                break;
	                                            }
	                                            float _2542 = _2537.x;
	                                            float _2544 = _2537.y;
	                                            if (abs(_2542) > abs(_2544))
	                                            {
	                                                _604 = _2542;
	                                                _605 = 0.785398185253143310546875 * (_2544 / _2542);
	                                            }
	                                            else
	                                            {
	                                                _604 = _2544;
	                                                _605 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_2542 / _2544));
	                                            }
	                                            _603 = vec2(cos(_605), sin(_605)) * _604;
	                                            break;
	                                        } while(false);
	                                        vec3 _2578 = (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz + (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].xyz * _603.x)) + (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[2].xyz * _603.y);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0)
	                                            {
	                                                _602 = vec4(normalize(_2578), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2589 = _2578 - _1787;
	                                                float _2590 = length(_2589);
	                                                _602 = vec4(_2589 / vec3(_2590), _2590);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_602.w))
	                                        {
	                                            _600 = true;
	                                        }
	                                        else
	                                        {
	                                            _600 = isnan(_602.w);
	                                        }
	                                        if (!_600)
	                                        {
	                                            _601 = _602.w * _602.w;
	                                        }
	                                        else
	                                        {
	                                            _601 = 1.0;
	                                        }
	                                        _637 = _601 / (max(0.0, dot(g_Lights_1._member0[_1839].m_vLuminaireVectors.data[3].xyz, -_602.xyz)) * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].w);
	                                        _619 = true;
	                                        _620 = _602;
	                                        break;
	                                    }
	                                    case 3:
	                                    {
	                                        vec3 _2432 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz - _1787;
	                                        float _2433 = dot(_2432, _2432);
	                                        float _2434 = sqrt(_2433);
	                                        vec3 _2436 = _2432 / vec3(_2434);
	                                        float _2437 = _2436.z;
	                                        if (_2437 >= 0.0)
	                                        {
	                                            _607 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _607 = -1.0;
	                                        }
	                                        float _2444 = (-1.0) / (_607 + _2437);
	                                        float _2445 = _2436.x;
	                                        float _2446 = _2436.y;
	                                        float _2448 = (_2445 * _2446) * _2444;
	                                        vec3 _2453 = _608;
	                                        _2453.x = 1.0 + (((_607 * _2445) * _2445) * _2444);
	                                        _2453.y = _607 * _2448;
	                                        _2453.z = (-_607) * _2445;
	                                        _608 = _2453;
	                                        vec3 _2460 = _609;
	                                        _2460.x = _2448;
	                                        _2460.y = _607 + ((_2446 * _2446) * _2444);
	                                        _2460.z = -_2446;
	                                        _609 = _2460;
	                                        float _2468 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].x * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].x;
	                                        float _2472 = sqrt(max(0.0, 1.0 - (_2468 / _2433)));
	                                        float _2473 = _1774.x;
	                                        float _2476 = (1.0 - _2473) + (_2473 * _2472);
	                                        float _2480 = sqrt(max(0.0, 1.0 - (_2476 * _2476)));
	                                        float _2482 = _1774.y * 6.283185482025146484375;
	                                        float _2484 = _2434 * _2434;
	                                        float _2490 = (_2434 * _2476) - sqrt(max(0.0, _2468 - ((_2484 * _2480) * _2480)));
	                                        float _2496 = ((_2484 + _2468) - (_2490 * _2490)) / ((2.0 * _2434) * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].x);
	                                        float _2500 = sqrt(max(0.0, 1.0 - (_2496 * _2496)));
	                                        vec3 _2512 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz + ((mat3(-_2453, -_2460, -_2436) * vec3(cos(_2482) * _2500, sin(_2482) * _2500, _2496)) * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].x);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0)
	                                            {
	                                                _606 = vec4(normalize(_2512), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2523 = _2512 - _1787;
	                                                float _2524 = length(_2523);
	                                                _606 = vec4(_2523 / vec3(_2524), _2524);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _637 = 0.15915493667125701904296875 / (1.0 - _2472);
	                                        _619 = true;
	                                        _620 = _606;
	                                        break;
	                                    }
	                                    case 4:
	                                    case 5:
	                                    {
	                                        vec2 _616 = _1774;
	                                        if (_1774.x < g_Lights_1._member0[_1839].m_vLuminaireVectors.data[4].y)
	                                        {
	                                            vec2 _2323 = _616;
	                                            _2323.x = clamp(_2323.x / g_Lights_1._member0[_1839].m_vLuminaireVectors.data[4].y, 0.0, 0.99999988079071044921875);
	                                            _616 = _2323;
	                                            vec3 _2329 = normalize(g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz - g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].xyz);
	                                            if (_2323.x >= 0.5)
	                                            {
	                                                vec2 _2340 = _616;
	                                                _2340.x = clamp((2.0 * _2340.x) - 1.0, 0.0, 0.99999988079071044921875);
	                                                _616 = _2340;
	                                                _617 = -_2329;
	                                                _618 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].xyz;
	                                            }
	                                            else
	                                            {
	                                                vec2 _2335 = _616;
	                                                _2335.x = clamp(2.0 * _2335.x, 0.0, 0.99999988079071044921875);
	                                                _616 = _2335;
	                                                _617 = _2329;
	                                                _618 = g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz;
	                                            }
	                                            do
	                                            {
	                                                vec2 _2351 = (_616 * 2.0) - vec2(1.0);
	                                                if (all(equal(_2351, vec2(0.0))))
	                                                {
	                                                    _613 = vec2(0.0);
	                                                    break;
	                                                }
	                                                float _2356 = _2351.x;
	                                                float _2358 = _2351.y;
	                                                if (abs(_2356) > abs(_2358))
	                                                {
	                                                    _614 = _2356;
	                                                    _615 = 0.785398185253143310546875 * (_2358 / _2356);
	                                                }
	                                                else
	                                                {
	                                                    _614 = _2358;
	                                                    _615 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_2356 / _2358));
	                                                }
	                                                _613 = vec2(cos(_615), sin(_615)) * _614;
	                                                break;
	                                            } while(false);
	                                            _618 += ((g_Lights_1._member0[_1839].m_vLuminaireVectors.data[2].xyz * _613.x) + (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[3].xyz * _613.y));
	                                        }
	                                        else
	                                        {
	                                            vec2 _2302 = _616;
	                                            _2302.x = clamp((_2302.x - g_Lights_1._member0[_1839].m_vLuminaireVectors.data[4].y) / (1.0 - g_Lights_1._member0[_1839].m_vLuminaireVectors.data[4].y), 0.0, 0.99999988079071044921875);
	                                            _616 = _2302;
	                                            vec3 _2317 = (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[2].xyz * cos(_2302.x * 6.283185482025146484375)) + (g_Lights_1._member0[_1839].m_vLuminaireVectors.data[3].xyz * sin(_2302.x * 6.283185482025146484375));
	                                            _617 = normalize(_2317);
	                                            _618 = mix(g_Lights_1._member0[_1839].m_vLuminaireVectors.data[0].xyz, g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].xyz, vec3(_2302.y)) + _2317;
	                                        }
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_1839].m_vLightPosition.w == 0.0)
	                                            {
	                                                _612 = vec4(normalize(_618), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _2394 = _618 - _1787;
	                                                float _2395 = length(_2394);
	                                                _612 = vec4(_2394 / vec3(_2395), _2395);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_612.w))
	                                        {
	                                            _610 = true;
	                                        }
	                                        else
	                                        {
	                                            _610 = isnan(_612.w);
	                                        }
	                                        if (!_610)
	                                        {
	                                            _611 = _612.w * _612.w;
	                                        }
	                                        else
	                                        {
	                                            _611 = 1.0;
	                                        }
	                                        _637 = _611 / (max(0.0, dot(_617, -_612.xyz)) * g_Lights_1._member0[_1839].m_vLuminaireVectors.data[1].w);
	                                        _619 = true;
	                                        _620 = _612;
	                                        break;
	                                    }
	                                    default:
	                                    {
	                                        _637 = 0.0;
	                                        _619 = true;
	                                        _620 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	                                        break;
	                                    }
	                                }
	                                if (_619)
	                                {
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            bool _2807 = !(dot(_426, _620.xyz) > 0.0);
	                            vec3 _2809 = vec3(_299);
	                            vec3 _2814 = transpose(mat3(_345, _344, _2809)) * _620.xyz;
	                            float16_t _403 = _298;
	                            f16vec3 _402 = _297;
	                            float16_t _401 = _296;
	                            float16_t _400 = _295;
	                            uint _399 = _294;
	                            f16vec4 _398 = _293;
	                            vec3 _482 = _343;
	                            do
	                            {
	                                if (_2807)
	                                {
	                                    f16vec4 _483 = _398;
	                                    if ((_399 & 65535u) == 1u)
	                                    {
	                                        _589 = any(greaterThan(vec3(_483.xyz), vec3(0.0)));
	                                    }
	                                    else
	                                    {
	                                        _589 = false;
	                                    }
	                                    if (_589)
	                                    {
	                                        _593 = vec3(_398.xyz);
	                                    }
	                                    else
	                                    {
	                                        _593 = vec3(1.0);
	                                    }
	                                    _592 = _593 * 0.3183098733425140380859375;
	                                    break;
	                                }
	                                else
	                                {
	                                    vec3 _2834 = vec3(mix(f16vec3(_400), _402, f16vec3(_403)));
	                                    float _2836 = float(_401);
	                                    do
	                                    {
	                                        float _2839 = _2814.z;
	                                        vec3 _2841 = _2814 + _482;
	                                        if (_2839 <= 0.0)
	                                        {
	                                            _591 = true;
	                                        }
	                                        else
	                                        {
	                                            _591 = _482.z <= 0.0;
	                                        }
	                                        if (_591)
	                                        {
	                                            _590 = vec3(0.0);
	                                            break;
	                                        }
	                                        if (all(equal(_2841, vec3(0.0))))
	                                        {
	                                            _590 = vec3(0.0);
	                                            break;
	                                        }
	                                        vec3 _2854 = normalize(_2841);
	                                        float _2855 = _2854.z;
	                                        float _2863 = _2836 * _2836;
	                                        float _2864 = _2863 * _2863;
	                                        float _2868 = (((_2855 * _2864) - _2855) * _2855) + 1.0;
	                                        float _2872 = _2836 * _2836;
	                                        float _2873 = _2872 * _2872;
	                                        _590 = (_2834 + ((vec3(1.0) - _2834) * pow(max(0.0, 1.0 - dot(_2814, _2854)), 5.0))) * (((_2864 / max(9.9999999392252902907785028219223e-09, _2868 * _2868)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_2839 * sqrt(((_482.z - (_2873 * _482.z)) * _482.z) + _2873)) + (_482.z * sqrt(((_2839 - (_2873 * _2839)) * _2839) + _2873))))) * 0.3183098733425140380859375);
	                                        break;
	                                    } while(false);
	                                    _592 = ((vec3(_402) * (1.0 - float(_403))) * 0.3183098733425140380859375) + _590;
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            float _2925 = dot(_2809, _620.xyz);
	                            if (_2807)
	                            {
	                                _588 = -_2925;
	                            }
	                            else
	                            {
	                                _588 = _2925;
	                            }
	                            _636 += (((_632 / vec3(_637)) * (_592 * 3.1415927410125732421875)) * max(0.0, _588));
	                        }
	                        _635 = _1841;
	                        continue;
	                    }
	                    _633++;
	                    _634 = _636;
	                    continue;
	                }
	                if (_641)
	                {
	                    vec2 _579 = imageLoad(g_RandomSamples, ivec3(_416.xy, int(1u + (_415 + uint(_662))))).xy;
	                    vec3 _2949 = (_428 + _427) * 0.5;
	                    float _580 = 0.0;
	                    vec3 _488 = vec3(0.0);
	                    vec3 _487 = vec3(0.0);
	                    vec4 _486 = vec4(0.0);
	                    int _489 = -1;
	                    uvec3 _2957 = min(uvec3(max(fma(_2949, _411, _412), vec3(0.0))), (_413 - uvec3(1u)));
	                    float _581 = 0.0;
	                    uint _582 = 0u;
	                    for (;;)
	                    {
	                        if (!(_582 < _414))
	                        {
	                            break;
	                        }
	                        uint _2973 = _414 * _413.x;
	                        float _583 = _581;
	                        uint _584 = subgroupOr(g_LightBins_1._member0[((((_2973 * _413.y) * _2957.z) + (_2973 * _2957.y)) + (_414 * _2957.x)) + _582]);
	                        for (;;)
	                        {
	                            if (!(_584 != 0u))
	                            {
	                                break;
	                            }
	                            uint _2997 = _584;
	                            uint _3001 = uint(findLSB(_2997)) + (_582 * 32u);
	                            uint _3003 = _2997 & (_2997 - 1u);
	                            if ((uint(g_Lights_1._member0[_3001].m_nPathTraceFlags) & 1u) == 0u)
	                            {
	                                _584 = _3003;
	                                continue;
	                            }
	                            if (!((g_Lights_1._member0[_3001].m_nPathTraceFlags & 8) != 0))
	                            {
	                                _584 = _3003;
	                                continue;
	                            }
	                            do
	                            {
	                                do
	                                {
	                                    vec4 _3030 = g_Lights_1._member0[_3001].m_mToClipSpace * vec4(_2949.xyz, 1.0);
	                                    vec3 _3034 = _3030.xyz / vec3(_3030.w);
	                                    vec4 _3036;
	                                    _3036.x = _3034.x;
	                                    _3036.y = _3034.y;
	                                    _3036.z = _3034.z;
	                                    if (all(greaterThanEqual(_3036.xyz, vec3(-1.0, -1.0, 0.0))))
	                                    {
	                                        _576 = all(lessThanEqual(_3036.xyz, vec3(1.0)));
	                                    }
	                                    else
	                                    {
	                                        _576 = false;
	                                    }
	                                    if (!_576)
	                                    {
	                                        _577 = false;
	                                        break;
	                                    }
	                                    if (!all(lessThanEqual(abs((g_Lights_1._member0[_3001].m_mBarnIlluminationFromWorld * vec4(_2949, 1.0)).xyz), vec3(1.0))))
	                                    {
	                                        _577 = false;
	                                        break;
	                                    }
	                                    _577 = true;
	                                    break;
	                                } while(false);
	                                if (!_577)
	                                {
	                                    _578 = vec3(0.0);
	                                    break;
	                                }
	                                vec4 _3073 = g_Lights_1._member0[_3001].m_mToClipSpace * vec4(_2949.xyz, 1.0);
	                                vec3 _3077 = _3073.xyz / vec3(_3073.w);
	                                vec4 _3079;
	                                _3079.x = _3077.x;
	                                _3079.y = _3077.y;
	                                _3079.z = _3077.z;
	                                if (_1736)
	                                {
	                                    _575 = g_Lights_1._member0[_3001].m_vBounceColor.xyz;
	                                }
	                                else
	                                {
	                                    _575 = g_Lights_1._member0[_3001].m_vColor.xyz;
	                                }
	                                if (true)
	                                {
	                                    if (g_Lights_1._member0[_3001].m_nCookie >= 0)
	                                    {
	                                        if (g_Lights_1._member0[_3001].m_bSphericalCookie != 0)
	                                        {
	                                            vec4 _3137 = vec4(-g_Lights_1._member0[_3001].m_vOrientation.xyz, g_Lights_1._member0[_3001].m_vOrientation.w);
	                                            vec4 _3139 = _3137.xyzw * vec4(-1.0, -1.0, -1.0, 1.0);
	                                            vec3 _3142 = _3139.xyz;
	                                            vec3 _3143 = vec4((-normalize(g_Lights_1._member0[_3001].m_vLightPosition.xyz - _2949)).xyz, 0.0).xyz;
	                                            vec4 _3150 = vec4((_3143 * _3139.w) + cross(_3143, _3142), -dot(_3143, _3142));
	                                            vec3 _3151 = _3150.xyz;
	                                            float _3152 = _3137.w;
	                                            vec3 _3154 = _3137.xyz;
	                                            float _3155 = _3150.w;
	                                            vec3 _3163 = vec4(((_3151 * _3152) + (_3154 * _3155)) + cross(_3154, _3151), _283).xyz;
	                                            vec2 _3172 = vec2(atan(_3163.y, -_3163.x) * 0.15915493667125701904296875, acos(_3163.z) * 0.3183098733425140380859375);
	                                            vec2 _3179 = (_3172.xy * g_Lights_1._member0[_3001].m_vCookieParameters.zw) + g_Lights_1._member0[_3001].m_vCookieParameters.xy;
	                                            vec2 _3181 = _3172;
	                                            _3181.x = _3179.x;
	                                            _3181.y = _3179.y;
	                                            _574 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_3001].m_nCookie], g_Sampler)), _3181, 0.0).xyz;
	                                        }
	                                        else
	                                        {
	                                            vec2 _3110 = fma(_3079.xyz.xy, vec2(0.5, -0.5), vec2(0.5));
	                                            vec2 _3117 = (_3110.xy * g_Lights_1._member0[_3001].m_vCookieParameters.zw) + g_Lights_1._member0[_3001].m_vCookieParameters.xy;
	                                            vec2 _3119 = _3110;
	                                            _3119.x = _3117.x;
	                                            _3119.y = _3117.y;
	                                            _574 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[g_Lights_1._member0[_3001].m_nCookie], g_CookieSampler)), _3119, 0.0).xyz;
	                                        }
	                                    }
	                                    else
	                                    {
	                                        _574 = vec3(1.0);
	                                    }
	                                    _575 *= _574;
	                                }
	                                if (g_Lights_1._member0[_3001].m_nLuminaireType != 0)
	                                {
	                                    _575 = (_575 * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].w) * 0.3183098733425140380859375;
	                                }
	                                else
	                                {
	                                    if (!(g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0))
	                                    {
	                                        vec3 _3208 = g_Lights_1._member0[_3001].m_vLightPosition.xyz - _2949;
	                                        _575 *= (vec3(g_Lights_1._member0[_3001].m_vLightPosition.w) / max(vec3(dot(_3208, _3208)), vec3(g_Lights_1._member0[_3001].m_vLightPosition.w)));
	                                    }
	                                }
	                                if (g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.z > 0.0)
	                                {
	                                    _571 = smoothstep(0.0, 1.0, _3079.xyz.z * g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.z);
	                                }
	                                else
	                                {
	                                    _571 = 1.0;
	                                }
	                                if (g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.w > 0.0)
	                                {
	                                    _571 *= smoothstep(0.0, 1.0, (1.0 - _3079.xyz.z) * g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.w);
	                                }
	                                if (!(g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0))
	                                {
	                                    vec3 _3262 = g_Lights_1._member0[_3001].m_vLightPosition.xyz - _2949;
	                                    float _3263 = length(_3262);
	                                    vec3 _3265 = _3262 / vec3(_3263);
	                                    float _3274 = _571 * smoothstep(0.0, 1.0, g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.x + (g_Lights_1._member0[_3001].m_vDistanceFade_vSkirt.y * _3263));
	                                    if (g_Lights_1._member0[_3001].m_nLuminaireType != 2)
	                                    {
	                                        _573 = g_Lights_1._member0[_3001].m_nLuminaireType != 1;
	                                    }
	                                    else
	                                    {
	                                        _573 = false;
	                                    }
	                                    if (_573)
	                                    {
	                                        float _3293 = 2.0 * g_Lights_1._member0[_3001].m_vOrientation.x;
	                                        float _3297 = 2.0 * g_Lights_1._member0[_3001].m_vOrientation.w;
	                                        vec3 _3311 = vec3((_3293 * g_Lights_1._member0[_3001].m_vOrientation.y) - (_3297 * g_Lights_1._member0[_3001].m_vOrientation.z), (1.0 - (_3293 * g_Lights_1._member0[_3001].m_vOrientation.x)) - ((2.0 * g_Lights_1._member0[_3001].m_vOrientation.z) * g_Lights_1._member0[_3001].m_vOrientation.z), ((2.0 * g_Lights_1._member0[_3001].m_vOrientation.y) * g_Lights_1._member0[_3001].m_vOrientation.z) + (_3297 * g_Lights_1._member0[_3001].m_vOrientation.x)) * g_Lights_1._member0[_3001].m_vAngleFade.z;
	                                        vec3 _3312 = _3265 - _3311;
	                                        vec3 _3313 = _3265 + _3311;
	                                        do
	                                        {
	                                            vec3 _3316 = _3313 - _3312;
	                                            float _3318 = dot(-_3312, _3316);
	                                            if (_3318 <= 0.0)
	                                            {
	                                                _569 = _3312;
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                float _3323 = dot(_3316, _3316);
	                                                if (_3318 > _3323)
	                                                {
	                                                    _569 = _3313;
	                                                    break;
	                                                }
	                                                else
	                                                {
	                                                    _569 = _3312 + (_3316 * (_3318 / _3323));
	                                                    break;
	                                                }
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (any(notEqual(_569, vec3(0.0))))
	                                        {
	                                            _570 = normalize(_569);
	                                        }
	                                        else
	                                        {
	                                            _570 = _569;
	                                        }
	                                        float _3347 = 2.0 * g_Lights_1._member0[_3001].m_vOrientation.x;
	                                        float _3350 = 2.0 * g_Lights_1._member0[_3001].m_vOrientation.w;
	                                        _572 = _3274 * saturate(g_Lights_1._member0[_3001].m_vAngleFade.x + (g_Lights_1._member0[_3001].m_vAngleFade.y * dot(vec3((1.0 - ((2.0 * g_Lights_1._member0[_3001].m_vOrientation.y) * g_Lights_1._member0[_3001].m_vOrientation.y)) - ((2.0 * g_Lights_1._member0[_3001].m_vOrientation.z) * g_Lights_1._member0[_3001].m_vOrientation.z), (_3347 * g_Lights_1._member0[_3001].m_vOrientation.y) + (_3350 * g_Lights_1._member0[_3001].m_vOrientation.z), (_3347 * g_Lights_1._member0[_3001].m_vOrientation.z) - (_3350 * g_Lights_1._member0[_3001].m_vOrientation.y)), _570)));
	                                    }
	                                    else
	                                    {
	                                        _572 = _3274;
	                                    }
	                                }
	                                else
	                                {
	                                    _572 = _571;
	                                }
	                                if (g_Lights_1._member0[_3001].m_nCookie == (-1))
	                                {
	                                    do
	                                    {
	                                        vec2 _3379 = abs(_3079.xyz.xy);
	                                        if (g_Lights_1._member0[_3001].m_vCookieParameters.z == 0.0)
	                                        {
	                                            _567 = smoothstep(1.0, g_Lights_1._member0[_3001].m_vCookieParameters.x, _3379.x) * smoothstep(1.0, g_Lights_1._member0[_3001].m_vCookieParameters.y, _3379.y);
	                                            break;
	                                        }
	                                        else
	                                        {
	                                            float _3384 = _3379.x;
	                                            float _3388 = _3379.y;
	                                            float _3395 = (-0.5) * g_Lights_1._member0[_3001].m_vCookieParameters.z;
	                                            float _3397 = (g_Lights_1._member0[_3001].m_vCookieParameters.x * g_Lights_1._member0[_3001].m_vCookieParameters.y) * pow(max(pow(g_Lights_1._member0[_3001].m_vCookieParameters.y * _3384, 2.0 / g_Lights_1._member0[_3001].m_vCookieParameters.z) + pow(g_Lights_1._member0[_3001].m_vCookieParameters.x * _3388, 2.0 / g_Lights_1._member0[_3001].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _3395);
	                                            float _3404 = pow(max(pow(_3384, 2.0 / g_Lights_1._member0[_3001].m_vCookieParameters.z) + pow(_3388, 2.0 / g_Lights_1._member0[_3001].m_vCookieParameters.z), 1.1754943508222875079687365372222e-38), _3395);
	                                            if (_3397 < _3404)
	                                            {
	                                                _567 = smoothstep(_3404, _3397, 1.0);
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                if (_3404 > 1.0)
	                                                {
	                                                    _568 = 1.0;
	                                                }
	                                                else
	                                                {
	                                                    _568 = 0.0;
	                                                }
	                                                _567 = _568;
	                                                break;
	                                            }
	                                            break;
	                                        }
	                                        break;
	                                    } while(false);
	                                    _572 *= _567;
	                                }
	                                _578 = _575 * _572;
	                                break;
	                            } while(false);
	                            float _3427 = dot(_578.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	                            if (_3427 == 0.0)
	                            {
	                                _584 = _3003;
	                                continue;
	                            }
	                            _565 = false;
	                            do
	                            {
	                                switch (g_Lights_1._member0[_3001].m_nLuminaireType)
	                                {
	                                    case 0:
	                                    {
	                                        _585 = 1.0;
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0)
	                                            {
	                                                _540 = vec4(normalize(g_Lights_1._member0[_3001].m_vLightPosition.xyz), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3953 = g_Lights_1._member0[_3001].m_vLightPosition.xyz - _2949;
	                                                float _3954 = length(_3953);
	                                                _540 = vec4(_3953 / vec3(_3954), _3954);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _565 = true;
	                                        _566 = _540;
	                                        break;
	                                    }
	                                    case 1:
	                                    {
	                                        vec3 _3793 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].xyz - g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz;
	                                        vec3 _3797 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[2].xyz - g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz;
	                                        float _3798 = length(_3793);
	                                        float _3799 = length(_3797);
	                                        vec3 _3801 = _3793 / vec3(_3798);
	                                        vec3 _3803 = _3797 / vec3(_3799);
	                                        vec3 _3804 = cross(_3801, _3803);
	                                        vec3 _3805 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz - _2949;
	                                        float _3806 = dot(_3805, _3804);
	                                        if (_3806 > 0.0)
	                                        {
	                                            _542 = _3806 * (-1.0);
	                                            _543 = _3804 * (-1.0);
	                                        }
	                                        else
	                                        {
	                                            _542 = _3806;
	                                            _543 = _3804;
	                                        }
	                                        float _3815 = dot(_3805, _3801);
	                                        float _3816 = dot(_3805, _3803);
	                                        float _3817 = _3815 + _3798;
	                                        float _3818 = _3816 + _3799;
	                                        vec3 _3821 = vec3(_3815, _3816, _542);
	                                        vec3 _3822 = vec3(_3815, _3818, _542);
	                                        vec3 _3823 = vec3(_3817, _3816, _542);
	                                        vec3 _3824 = vec3(_3817, _3818, _542);
	                                        vec3 _3826 = normalize(cross(_3821, _3823));
	                                        vec3 _3828 = normalize(cross(_3823, _3824));
	                                        vec3 _3830 = normalize(cross(_3824, _3822));
	                                        vec3 _3832 = normalize(cross(_3822, _3821));
	                                        float _3849 = _3826.z;
	                                        float _3853 = (6.283185482025146484375 - acos(clamp(-dot(_3830, _3832), -1.0, 1.0))) - acos(clamp(-dot(_3832, _3826), -1.0, 1.0));
	                                        float _3855 = (acos(clamp(-dot(_3826, _3828), -1.0, 1.0)) + acos(clamp(-dot(_3828, _3830), -1.0, 1.0))) - _3853;
	                                        if (isnan(_3855))
	                                        {
	                                            _544 = 0.0;
	                                        }
	                                        else
	                                        {
	                                            _544 = _3855;
	                                        }
	                                        float _3863 = (_1774.x * _544) + _3853;
	                                        float _3868 = ((cos(_3863) * _3849) - _3830.z) / sin(_3863);
	                                        if (_3868 > 0.0)
	                                        {
	                                            _545 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _545 = -1.0;
	                                        }
	                                        float _3877 = _545;
	                                        float _3879 = clamp((1.0 / sqrt((_3868 * _3868) + (_3849 * _3849))) * _3877, -1.0, 1.0);
	                                        float _3887 = clamp((-(_3879 * _542)) / sqrt(1.0 - (_3879 * _3879)), _3815, _3817);
	                                        float _3890 = sqrt((_3887 * _3887) + (_542 * _542));
	                                        float _3891 = _3890 * _3890;
	                                        float _3894 = _3816 / sqrt(_3891 + (_3816 * _3816));
	                                        float _3901 = _3894 + (_1774.y * ((_3818 / sqrt(_3891 + (_3818 * _3818))) - _3894));
	                                        float _3902 = _3901 * _3901;
	                                        if (_3902 < 0.99999988079071044921875)
	                                        {
	                                            _545 = (_3901 * _3890) / sqrt(1.0 - _3902);
	                                        }
	                                        else
	                                        {
	                                            _545 = _3818;
	                                        }
	                                        vec3 _3919 = ((_2949 + (_3801 * _3887)) + (_3803 * _545)) + (_543 * _542);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0)
	                                            {
	                                                _541 = vec4(normalize(_3919), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3930 = _3919 - _2949;
	                                                float _3931 = length(_3930);
	                                                _541 = vec4(_3930 / vec3(_3931), _3931);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _585 = 1.0 / _544;
	                                        _565 = true;
	                                        _566 = _541;
	                                        break;
	                                    }
	                                    case 2:
	                                    {
	                                        do
	                                        {
	                                            vec2 _3701 = (_1774 * 2.0) - vec2(1.0);
	                                            if (all(equal(_3701, vec2(0.0))))
	                                            {
	                                                _549 = vec2(0.0);
	                                                break;
	                                            }
	                                            float _3706 = _3701.x;
	                                            float _3708 = _3701.y;
	                                            if (abs(_3706) > abs(_3708))
	                                            {
	                                                _550 = _3706;
	                                                _551 = 0.785398185253143310546875 * (_3708 / _3706);
	                                            }
	                                            else
	                                            {
	                                                _550 = _3708;
	                                                _551 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_3706 / _3708));
	                                            }
	                                            _549 = vec2(cos(_551), sin(_551)) * _550;
	                                            break;
	                                        } while(false);
	                                        vec3 _3742 = (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz + (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].xyz * _549.x)) + (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[2].xyz * _549.y);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0)
	                                            {
	                                                _548 = vec4(normalize(_3742), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3753 = _3742 - _2949;
	                                                float _3754 = length(_3753);
	                                                _548 = vec4(_3753 / vec3(_3754), _3754);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_548.w))
	                                        {
	                                            _546 = true;
	                                        }
	                                        else
	                                        {
	                                            _546 = isnan(_548.w);
	                                        }
	                                        if (!_546)
	                                        {
	                                            _547 = _548.w * _548.w;
	                                        }
	                                        else
	                                        {
	                                            _547 = 1.0;
	                                        }
	                                        _585 = _547 / (max(0.0, dot(g_Lights_1._member0[_3001].m_vLuminaireVectors.data[3].xyz, -_548.xyz)) * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].w);
	                                        _565 = true;
	                                        _566 = _548;
	                                        break;
	                                    }
	                                    case 3:
	                                    {
	                                        vec3 _3596 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz - _2949;
	                                        float _3597 = dot(_3596, _3596);
	                                        float _3598 = sqrt(_3597);
	                                        vec3 _3600 = _3596 / vec3(_3598);
	                                        float _3601 = _3600.z;
	                                        if (_3601 >= 0.0)
	                                        {
	                                            _553 = 1.0;
	                                        }
	                                        else
	                                        {
	                                            _553 = -1.0;
	                                        }
	                                        float _3608 = (-1.0) / (_553 + _3601);
	                                        float _3609 = _3600.x;
	                                        float _3610 = _3600.y;
	                                        float _3612 = (_3609 * _3610) * _3608;
	                                        vec3 _3617 = _554;
	                                        _3617.x = 1.0 + (((_553 * _3609) * _3609) * _3608);
	                                        _3617.y = _553 * _3612;
	                                        _3617.z = (-_553) * _3609;
	                                        _554 = _3617;
	                                        vec3 _3624 = _555;
	                                        _3624.x = _3612;
	                                        _3624.y = _553 + ((_3610 * _3610) * _3608);
	                                        _3624.z = -_3610;
	                                        _555 = _3624;
	                                        float _3632 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].x * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].x;
	                                        float _3636 = sqrt(max(0.0, 1.0 - (_3632 / _3597)));
	                                        float _3637 = _1774.x;
	                                        float _3640 = (1.0 - _3637) + (_3637 * _3636);
	                                        float _3644 = sqrt(max(0.0, 1.0 - (_3640 * _3640)));
	                                        float _3646 = _1774.y * 6.283185482025146484375;
	                                        float _3648 = _3598 * _3598;
	                                        float _3654 = (_3598 * _3640) - sqrt(max(0.0, _3632 - ((_3648 * _3644) * _3644)));
	                                        float _3660 = ((_3648 + _3632) - (_3654 * _3654)) / ((2.0 * _3598) * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].x);
	                                        float _3664 = sqrt(max(0.0, 1.0 - (_3660 * _3660)));
	                                        vec3 _3676 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz + ((mat3(-_3617, -_3624, -_3600) * vec3(cos(_3646) * _3664, sin(_3646) * _3664, _3660)) * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].x);
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0)
	                                            {
	                                                _552 = vec4(normalize(_3676), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3687 = _3676 - _2949;
	                                                float _3688 = length(_3687);
	                                                _552 = vec4(_3687 / vec3(_3688), _3688);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        _585 = 0.15915493667125701904296875 / (1.0 - _3636);
	                                        _565 = true;
	                                        _566 = _552;
	                                        break;
	                                    }
	                                    case 4:
	                                    case 5:
	                                    {
	                                        vec2 _562 = _1774;
	                                        if (_1774.x < g_Lights_1._member0[_3001].m_vLuminaireVectors.data[4].y)
	                                        {
	                                            vec2 _3487 = _562;
	                                            _3487.x = clamp(_3487.x / g_Lights_1._member0[_3001].m_vLuminaireVectors.data[4].y, 0.0, 0.99999988079071044921875);
	                                            _562 = _3487;
	                                            vec3 _3493 = normalize(g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz - g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].xyz);
	                                            if (_3487.x >= 0.5)
	                                            {
	                                                vec2 _3504 = _562;
	                                                _3504.x = clamp((2.0 * _3504.x) - 1.0, 0.0, 0.99999988079071044921875);
	                                                _562 = _3504;
	                                                _563 = -_3493;
	                                                _564 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].xyz;
	                                            }
	                                            else
	                                            {
	                                                vec2 _3499 = _562;
	                                                _3499.x = clamp(2.0 * _3499.x, 0.0, 0.99999988079071044921875);
	                                                _562 = _3499;
	                                                _563 = _3493;
	                                                _564 = g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz;
	                                            }
	                                            do
	                                            {
	                                                vec2 _3515 = (_562 * 2.0) - vec2(1.0);
	                                                if (all(equal(_3515, vec2(0.0))))
	                                                {
	                                                    _559 = vec2(0.0);
	                                                    break;
	                                                }
	                                                float _3520 = _3515.x;
	                                                float _3522 = _3515.y;
	                                                if (abs(_3520) > abs(_3522))
	                                                {
	                                                    _560 = _3520;
	                                                    _561 = 0.785398185253143310546875 * (_3522 / _3520);
	                                                }
	                                                else
	                                                {
	                                                    _560 = _3522;
	                                                    _561 = 1.57079637050628662109375 - (0.785398185253143310546875 * (_3520 / _3522));
	                                                }
	                                                _559 = vec2(cos(_561), sin(_561)) * _560;
	                                                break;
	                                            } while(false);
	                                            _564 += ((g_Lights_1._member0[_3001].m_vLuminaireVectors.data[2].xyz * _559.x) + (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[3].xyz * _559.y));
	                                        }
	                                        else
	                                        {
	                                            vec2 _3466 = _562;
	                                            _3466.x = clamp((_3466.x - g_Lights_1._member0[_3001].m_vLuminaireVectors.data[4].y) / (1.0 - g_Lights_1._member0[_3001].m_vLuminaireVectors.data[4].y), 0.0, 0.99999988079071044921875);
	                                            _562 = _3466;
	                                            vec3 _3481 = (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[2].xyz * cos(_3466.x * 6.283185482025146484375)) + (g_Lights_1._member0[_3001].m_vLuminaireVectors.data[3].xyz * sin(_3466.x * 6.283185482025146484375));
	                                            _563 = normalize(_3481);
	                                            _564 = mix(g_Lights_1._member0[_3001].m_vLuminaireVectors.data[0].xyz, g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].xyz, vec3(_3466.y)) + _3481;
	                                        }
	                                        do
	                                        {
	                                            if (g_Lights_1._member0[_3001].m_vLightPosition.w == 0.0)
	                                            {
	                                                _558 = vec4(normalize(_564), uintBitsToFloat(0x7f800000u /* inf */));
	                                                break;
	                                            }
	                                            else
	                                            {
	                                                vec3 _3558 = _564 - _2949;
	                                                float _3559 = length(_3558);
	                                                _558 = vec4(_3558 / vec3(_3559), _3559);
	                                                break;
	                                            }
	                                            break;
	                                        } while(false);
	                                        if (isinf(_558.w))
	                                        {
	                                            _556 = true;
	                                        }
	                                        else
	                                        {
	                                            _556 = isnan(_558.w);
	                                        }
	                                        if (!_556)
	                                        {
	                                            _557 = _558.w * _558.w;
	                                        }
	                                        else
	                                        {
	                                            _557 = 1.0;
	                                        }
	                                        _585 = _557 / (max(0.0, dot(_563, -_558.xyz)) * g_Lights_1._member0[_3001].m_vLuminaireVectors.data[1].w);
	                                        _565 = true;
	                                        _566 = _558;
	                                        break;
	                                    }
	                                    default:
	                                    {
	                                        _585 = 0.0;
	                                        _565 = true;
	                                        _566 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	                                        break;
	                                    }
	                                }
	                                if (_565)
	                                {
	                                    break;
	                                }
	                                break;
	                            } while(false);
	                            float _3974 = dot(vec3(_299), _566.xyz);
	                            if ((!(dot(_426, _566.xyz) > 0.0)) && _640)
	                            {
	                                _539 = -_3974;
	                            }
	                            else
	                            {
	                                _539 = _3974;
	                            }
	                            float _3981 = (_3427 / _585) * max(0.0, _539);
	                            float _586 = _579.x;
	                            do
	                            {
	                                float _3986 = _580;
	                                float _3987 = _3986 + _3981;
	                                _580 = _3987;
	                                if (_3987 == 0.0)
	                                {
	                                    _537 = false;
	                                    break;
	                                }
	                                float _3992 = _3981 / _580;
	                                do
	                                {
	                                    if (_3992 <= 0.0)
	                                    {
	                                        _538 = false;
	                                        break;
	                                    }
	                                    if (_3992 >= 1.0)
	                                    {
	                                        _538 = true;
	                                        break;
	                                    }
	                                    if (_586 < _3992)
	                                    {
	                                        _586 = min(_586 / _3992, 0.99999988079071044921875);
	                                        _538 = true;
	                                        break;
	                                    }
	                                    _586 = min((_586 - _3992) / (1.0 - _3992), 0.99999988079071044921875);
	                                    _538 = false;
	                                    break;
	                                } while(false);
	                                _537 = _538;
	                                break;
	                            } while(false);
	                            vec2 _4017 = _579;
	                            _4017.x = _586;
	                            _579 = _4017;
	                            if (_537)
	                            {
	                                _489 = int(_3001);
	                                _488 = _578 / vec3(_585);
	                                _486 = _566;
	                                _583 = _3981;
	                            }
	                            _584 = _3003;
	                            continue;
	                        }
	                        _581 = _583;
	                        _582++;
	                        continue;
	                    }
	                    if (_489 != (-1))
	                    {
	                        vec3 _4037 = _488;
	                        vec3 _4038 = _4037 * (_580 / _581);
	                        bool _4047 = !(dot(_426, _486.xyz) > 0.0);
	                        vec3 _4050 = vec3(_299);
	                        vec3 _4055 = transpose(mat3(_345, _344, _4050)) * _486.xyz;
	                        float16_t _410 = _298;
	                        f16vec3 _409 = _297;
	                        float16_t _408 = _296;
	                        float16_t _407 = _295;
	                        uint _406 = _294;
	                        f16vec4 _405 = _293;
	                        vec3 _485 = _343;
	                        do
	                        {
	                            if (_4047)
	                            {
	                                f16vec4 _490 = _405;
	                                if ((_406 & 65535u) == 1u)
	                                {
	                                    _532 = any(greaterThan(vec3(_490.xyz), vec3(0.0)));
	                                }
	                                else
	                                {
	                                    _532 = false;
	                                }
	                                if (_532)
	                                {
	                                    _536 = vec3(_405.xyz);
	                                }
	                                else
	                                {
	                                    _536 = vec3(1.0);
	                                }
	                                _535 = _536 * 0.3183098733425140380859375;
	                                break;
	                            }
	                            else
	                            {
	                                vec3 _4074 = vec3(mix(f16vec3(_407), _409, f16vec3(_410)));
	                                float _4076 = float(_408);
	                                do
	                                {
	                                    float _4079 = _4055.z;
	                                    vec3 _4081 = _4055 + _485;
	                                    if (_4079 <= 0.0)
	                                    {
	                                        _534 = true;
	                                    }
	                                    else
	                                    {
	                                        _534 = _485.z <= 0.0;
	                                    }
	                                    if (_534)
	                                    {
	                                        _533 = vec3(0.0);
	                                        break;
	                                    }
	                                    if (all(equal(_4081, vec3(0.0))))
	                                    {
	                                        _533 = vec3(0.0);
	                                        break;
	                                    }
	                                    vec3 _4094 = normalize(_4081);
	                                    float _4095 = _4094.z;
	                                    float _4103 = _4076 * _4076;
	                                    float _4104 = _4103 * _4103;
	                                    float _4108 = (((_4095 * _4104) - _4095) * _4095) + 1.0;
	                                    float _4112 = _4076 * _4076;
	                                    float _4113 = _4112 * _4112;
	                                    _533 = (_4074 + ((vec3(1.0) - _4074) * pow(max(0.0, 1.0 - dot(_4055, _4094)), 5.0))) * (((_4104 / max(9.9999999392252902907785028219223e-09, _4108 * _4108)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_4079 * sqrt(((_485.z - (_4113 * _485.z)) * _485.z) + _4113)) + (_485.z * sqrt(((_4079 - (_4113 * _4079)) * _4079) + _4113))))) * 0.3183098733425140380859375);
	                                    break;
	                                } while(false);
	                                _535 = ((vec3(_409) * (1.0 - float(_410))) * 0.3183098733425140380859375) + _533;
	                                break;
	                            }
	                            break;
	                        } while(false);
	                        float _4167 = dot(_4050, _486.xyz);
	                        if (_4047)
	                        {
	                            _531 = -_4167;
	                        }
	                        else
	                        {
	                            _531 = _4167;
	                        }
	                        _488 = (_4038 * (_535 * 3.1415927410125732421875)) * max(0.0, _531);
	                        if (_4047)
	                        {
	                            f16vec4 _484 = _293;
	                            if ((_294 & 65535u) == 2u)
	                            {
	                                _530 = float(_484.x) > 0.0;
	                            }
	                            else
	                            {
	                                _530 = false;
	                            }
	                            _587 = _530;
	                        }
	                        else
	                        {
	                            _587 = false;
	                        }
	                        if (_587)
	                        {
	                            f16vec4 _404 = _293;
	                            uint _4198 = uint(_293.w);
	                            float _4203 = pow(saturate(-dot(normalize(_426 + _4050), _486.xyz)), 2.0);
	                            f16vec3 _4204 = f16vec3(vec3(0.0));
	                            if (isinf(_486.w))
	                            {
	                                _526 = true;
	                            }
	                            else
	                            {
	                                _526 = isnan(_486.w);
	                            }
	                            if (!_526)
	                            {
	                                _527 = _486.w;
	                            }
	                            else
	                            {
	                                _527 = 1000.0;
	                            }
	                            vec3 _494 = _428 + (_486.xyz * _527);
	                            float _493 = 0.0;
	                            vec3 _492 = -_486.xyz;
	                            if (_4203 > 0.0)
	                            {
	                                _528 = _527;
	                            }
	                            else
	                            {
	                                _528 = 0.0;
	                            }
	                            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _495, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_4204, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _4204, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                            traceRayEXT(g_AccelStruct, 16u, 1u, 0u, 2u, 0u, _494, _493, _492, _528, 0);
	                            if (p.nInstance != (-1))
	                            {
	                                f16vec4 _491 = p.material.vMaterialBits;
	                                if ((p.material.nMaterialTypeAndFlags & 65535u) == 2u)
	                                {
	                                    _525 = float(_491.x) > 0.0;
	                                }
	                                else
	                                {
	                                    _525 = false;
	                                }
	                                if (!_525)
	                                {
	                                    _528 = 0.0;
	                                }
	                                else
	                                {
	                                    _528 = _4203;
	                                }
	                                _529 = _527 - p.flHitT;
	                            }
	                            else
	                            {
	                                _528 = _4203;
	                                _529 = _527;
	                            }
	                            float _4269 = _529 * float(_404.x);
	                            _487 = (_4038 * vec3(_297)) * ((exp2(SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_4198].m_vTransmissiveLogColor.xyz * (1.0 + (_4269 * SubsurfaceProfilesConstantBuffer_t.g_SubsurfaceProfile.data[_4198].m_fTransmissiveSaturation))) * exp(-_4269)) * _528);
	                        }
	                    }
	                    vec4 _643 = _486;
	                    if (_489 != (-1))
	                    {
	                        bool _4297 = any(notEqual(_488, vec3(0.0)));
	                        if (isinf(_643.w))
	                        {
	                            _523 = true;
	                        }
	                        else
	                        {
	                            _523 = isnan(_643.w);
	                        }
	                        if (!_523)
	                        {
	                            _524 = _643.w;
	                        }
	                        else
	                        {
	                            _524 = 56755.83984375;
	                        }
	                        vec4 _4314 = _643;
	                        _4314.w = _524;
	                        _643 = _4314;
	                        do
	                        {
	                            float _4323 = dot(_4314.xyz, g_Lights_1._member0[_489].m_vNearPlane.xyz);
	                            if (_4323 == 0.0)
	                            {
	                                _522 = 0.0;
	                                break;
	                            }
	                            _522 = (g_Lights_1._member0[_489].m_vNearPlane.w - dot(_1735, g_Lights_1._member0[_489].m_vNearPlane.xyz)) * (1.0 / _4323);
	                            break;
	                        } while(false);
	                        if (_522 > 0.0)
	                        {
	                            vec4 _4335 = _643;
	                            _4335.w = min(_4335.w, _522);
	                            _643 = _4335;
	                        }
	                        if (dot(_643.xyz, _426.xyz) < 0.0)
	                        {
	                            _642 = _441;
	                        }
	                        else
	                        {
	                            _642 = _442;
	                        }
	                        vec4 _4348 = _643;
	                        vec3 _4350 = _642 - _1735;
	                        _4348.w = _4348.w + dot(_4348.xyz, _4350);
	                        vec3 _4360 = normalize((_4348.xyz * _4348.w) + _4350);
	                        vec4 _4362 = _4348;
	                        _4362.x = _4360.x;
	                        _4362.y = _4360.y;
	                        _4362.z = _4360.z;
	                        _643 = _4362;
	                        do
	                        {
	                            int _4373 = int(g_SceneGlobalInfo._member0[0].m_nSceneGlobalInfoFlags);
	                            if ((_4373 & 1) != 0)
	                            {
	                                _521 = 32u;
	                                break;
	                            }
	                            if ((_4373 & 2) != 0)
	                            {
	                                _521 = 16u;
	                                break;
	                            }
	                            _521 = 0u;
	                            break;
	                        } while(false);
	                        vec3 _498 = _642;
	                        float _497 = 0.0;
	                        vec3 _496 = _4362.xyz;
	                        if (_4297)
	                        {
	                            _520 = _4362.w;
	                        }
	                        else
	                        {
	                            _520 = 0.0;
	                        }
	                        p_1 = PayloadShadow_t(1.0);
	                        traceRayEXT(g_AccelStruct, _521, 2u, 1u, 2u, 1u, _498, _497, _496, _520, 1);
	                        if (_4297)
	                        {
	                            _520 = p_1.m_flVisibility;
	                        }
	                        else
	                        {
	                            _520 = 0.0;
	                        }
	                        _642 = (_634 + _487) + (_488 * _520);
	                    }
	                    else
	                    {
	                        _642 = _634;
	                    }
	                }
	                else
	                {
	                    _642 = _634;
	                }
	                _448 = _442;
	                _447 = _441;
	                _446 = _440;
	                _445 = _439;
	                _314 = _307;
	                _313 = _306;
	                _312 = _305;
	                _311 = _304;
	                _310 = _302;
	                _309 = _301;
	                _308 = _300;
	                _371 = _366;
	                _370 = _365;
	                _369 = _364;
	                _368 = _363;
	                _367 = _362;
	                vec3 _4431 = vec3(_305);
	                float _4437 = min(0.89999997615814208984375, max(_4431.x, max(_4431.y, _4431.z)));
	                float _668 = _667.x;
	                do
	                {
	                    if (_4437 <= 0.0)
	                    {
	                        _519 = false;
	                        break;
	                    }
	                    if (_4437 >= 1.0)
	                    {
	                        _519 = true;
	                        break;
	                    }
	                    if (_668 < _4437)
	                    {
	                        _668 = min(_668 / _4437, 0.99999988079071044921875);
	                        _519 = true;
	                        break;
	                    }
	                    _668 = min((_668 - _4437) / (1.0 - _4437), 0.99999988079071044921875);
	                    _519 = false;
	                    break;
	                } while(false);
	                vec2 _4462 = _667;
	                _4462.x = _668;
	                _667 = _4462;
	                if (_519)
	                {
	                    float _425 = _368;
	                    do
	                    {
	                        _669 = 1.0;
	                        do
	                        {
	                            if (_425 <= 0.0)
	                            {
	                                _518 = false;
	                                break;
	                            }
	                            if (_425 >= 1.0)
	                            {
	                                _518 = true;
	                                break;
	                            }
	                            if (_667.x < _425)
	                            {
	                                vec2 _4485 = _667;
	                                _4485.x = min(_4485.x / _425, 0.99999988079071044921875);
	                                _667 = _4485;
	                                _518 = true;
	                                break;
	                            }
	                            vec2 _4490 = _667;
	                            _4490.x = min((_4490.x - _425) / (1.0 - _425), 0.99999988079071044921875);
	                            _667 = _4490;
	                            _518 = false;
	                            break;
	                        } while(false);
	                        if (_518)
	                        {
	                            _669 = _425;
	                            _517 = true;
	                            break;
	                        }
	                        else
	                        {
	                            _669 = 1.0 - _425;
	                            _517 = false;
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    if (_517)
	                    {
	                        _448 = _447;
	                    }
	                    f16vec3 _342 = _314;
	                    float16_t _341 = _313;
	                    f16vec3 _340 = _312;
	                    float16_t _339 = _311;
	                    float16_t _338 = _310;
	                    uint _337 = _309;
	                    f16vec4 _336 = _308;
	                    vec3 _424 = _371;
	                    vec3 _423 = _370;
	                    float _422 = _369;
	                    vec3 _421 = _367;
	                    do
	                    {
	                        vec2 _515 = _667;
	                        if (_517)
	                        {
	                            float _4601 = sqrt(_515.y);
	                            float _4603 = 6.283185482025146484375 * _515.x;
	                            vec3 _4611 = vec3(cos(_4603) * _4601, sin(_4603) * _4601, sqrt(max(0.0, 1.0 - _515.y)));
	                            _4611.z = -_4611.z;
	                            _514 = _4611;
	                            break;
	                        }
	                        else
	                        {
	                            float _516 = _515.x;
	                            do
	                            {
	                                if (_422 <= 0.0)
	                                {
	                                    _513 = false;
	                                    break;
	                                }
	                                if (_422 >= 1.0)
	                                {
	                                    _513 = true;
	                                    break;
	                                }
	                                if (_516 < _422)
	                                {
	                                    _516 = min(_516 / _422, 0.99999988079071044921875);
	                                    _513 = true;
	                                    break;
	                                }
	                                _516 = min((_516 - _422) / (1.0 - _422), 0.99999988079071044921875);
	                                _513 = false;
	                                break;
	                            } while(false);
	                            vec2 _4549 = _515;
	                            _4549.x = _516;
	                            _515 = _4549;
	                            if (_513)
	                            {
	                                float _4554 = float(_339);
	                                float _4562 = ((_4554 * _4554) * sqrt(_515.x)) / sqrt(1.0 - _515.x);
	                                float _4565 = 1.0 / (1.0 + (_4562 * _4562));
	                                float _4568 = sqrt(max(0.0, 1.0 - _4565));
	                                float _4571 = 6.283185482025146484375 * _515.y;
	                                vec3 _4576 = vec3(cos(_4571) * _4568, sin(_4571) * _4568, sqrt(_4565));
	                                if (dot(_421, _4576) > 0.0)
	                                {
	                                    _512 = _4576;
	                                }
	                                else
	                                {
	                                    _512 = -_4576;
	                                }
	                                _514 = -reflect(_421, _512);
	                                break;
	                            }
	                            float _4588 = sqrt(_515.y);
	                            float _4590 = 6.283185482025146484375 * _515.x;
	                            _514 = vec3(cos(_4590) * _4588, sin(_4590) * _4588, sqrt(max(0.0, 1.0 - _515.y)));
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    _661 = _514;
	                    vec3 _4618 = normalize(_514 + _421);
	                    float _4619 = _4618.z;
	                    if (_517)
	                    {
	                        _510 = _514.z * (-0.3183098733425140380859375);
	                    }
	                    else
	                    {
	                        if (_422 > 0.0)
	                        {
	                            float _4632 = float(_339);
	                            float _4633 = _4632 * _4632;
	                            float _4634 = _4633 * _4633;
	                            float _4638 = (((_4619 * _4634) - _4619) * _4619) + 1.0;
	                            _509 = 1.0 - _422;
	                            _510 = _422 * (((_4634 / max(9.9999999392252902907785028219223e-09, _4638 * _4638)) * _4619) / (12.56637096405029296875 * max(0.0, dot(_421, _4618))));
	                        }
	                        else
	                        {
	                            _509 = 1.0;
	                            _510 = 0.0;
	                        }
	                        _510 += (_509 * (_514.z * 0.3183098733425140380859375));
	                    }
	                    if (_510 == 0.0)
	                    {
	                        _511 = true;
	                    }
	                    else
	                    {
	                        _511 = isnan(_510);
	                    }
	                    if (_511)
	                    {
	                        _509 = 3.4028234663852885981170418348452e+38;
	                    }
	                    else
	                    {
	                        _509 = _510;
	                    }
	                    float _670 = _509;
	                    do
	                    {
	                        if (_517)
	                        {
	                            f16vec4 _499 = _336;
	                            if ((_337 & 65535u) == 1u)
	                            {
	                                _504 = any(greaterThan(vec3(_499.xyz), vec3(0.0)));
	                            }
	                            else
	                            {
	                                _504 = false;
	                            }
	                            if (_504)
	                            {
	                                _508 = vec3(_336.xyz);
	                            }
	                            else
	                            {
	                                _508 = vec3(1.0);
	                            }
	                            _507 = _508 * 0.3183098733425140380859375;
	                            break;
	                        }
	                        else
	                        {
	                            vec3 _4679 = vec3(mix(f16vec3(_338), _340, f16vec3(_341)));
	                            float _4681 = float(_339);
	                            do
	                            {
	                                vec3 _4686 = _661 + _421;
	                                if (_661.z <= 0.0)
	                                {
	                                    _506 = true;
	                                }
	                                else
	                                {
	                                    _506 = _421.z <= 0.0;
	                                }
	                                if (_506)
	                                {
	                                    _505 = vec3(0.0);
	                                    break;
	                                }
	                                if (all(equal(_4686, vec3(0.0))))
	                                {
	                                    _505 = vec3(0.0);
	                                    break;
	                                }
	                                vec3 _4699 = normalize(_4686);
	                                float _4700 = _4699.z;
	                                float _4708 = _4681 * _4681;
	                                float _4709 = _4708 * _4708;
	                                float _4713 = (((_4700 * _4709) - _4700) * _4700) + 1.0;
	                                float _4717 = _4681 * _4681;
	                                float _4718 = _4717 * _4717;
	                                _505 = (_4679 + ((vec3(1.0) - _4679) * pow(max(0.0, 1.0 - dot(_661, _4699)), 5.0))) * (((_4709 / max(9.9999999392252902907785028219223e-09, _4713 * _4713)) * (0.5 / max(9.9999997473787516355514526367188e-06, (_661.z * sqrt(((_421.z - (_4718 * _421.z)) * _421.z) + _4718)) + (_421.z * sqrt(((_661.z - (_4718 * _661.z)) * _661.z) + _4718))))) * 0.3183098733425140380859375);
	                                break;
	                            } while(false);
	                            _507 = ((vec3(_340) * (1.0 - float(_341))) * 0.3183098733425140380859375) + _505;
	                            break;
	                        }
	                        break;
	                    } while(false);
	                    vec3 _4768 = _661;
	                    vec3 _4774 = mat3(_424, _423, vec3(_342)) * _4768;
	                    _661 = _4774;
	                    float _4777 = dot(vec3(_314), _4774);
	                    if (_517)
	                    {
	                        _503 = -_4777;
	                    }
	                    else
	                    {
	                        _503 = _4777;
	                    }
	                    do
	                    {
	                        if ((_445 & 2048) != 0)
	                        {
	                            _502 = true;
	                            break;
	                        }
	                        _502 = (dot(_446, _661) > 0.0) != _517;
	                        break;
	                    } while(false);
	                    if (_502)
	                    {
	                        _671 = (_665 * (_507 * max(0.0, _503))) / vec3((_4437 * _669) * _670);
	                    }
	                    else
	                    {
	                        _671 = vec3(0.0);
	                    }
	                    _663 = _671;
	                }
	                else
	                {
	                    _663 = vec3(0.0);
	                }
	                _662++;
	                _664 = (_664 + ((_642 * _665) * _666)) + ((vec3(_303) * _665) * _666);
	                continue;
	            }
	            vIrradiance = (_664 * max(0.0, dot(_942, _940))) * 0.3183098733425140380859375;
	        }
	        else
	        {
	            vIrradiance = vec3(0.0);
	        }
	        vec4 _500 = g_Samples._member0[nSampleIndex].vIrradiance_flSampleCount;
	        vec3 _4823 = abs(vIrradiance);
	        float _4828 = max(_4823.x, max(_4823.y, _4823.z));
	        float _4832 = clamp(_4828, -100.0, 100.0);
	        vec3 _501;
	        if (_4832 == 0.0)
	        {
	            _501 = vec3(0.0);
	        }
	        else
	        {
	            _501 = clamp(vIrradiance / vec3(_4828), vec3(-1.0), vec3(1.0)) * _4832;
	        }
	        vec4 _4839 = _500;
	        vec3 _4845 = mix(_4839.xyz, _501, vec3(1.0 / (1.0 + _4839.w)));
	        vec4 _4847 = _4839;
	        _4847.x = _4845.x;
	        _4847.y = _4845.y;
	        _4847.z = _4845.z;
	        _4847.w = _4847.w + 1.0;
	        _500 = _4847;
	        g_Samples._member0[nSampleIndex].vIrradiance_flSampleCount = _4847;
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
