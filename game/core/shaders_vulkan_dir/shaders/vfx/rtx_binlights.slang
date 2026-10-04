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
	#extension GL_EXT_ray_tracing : require
	
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
	
	vec4 _88;
	
	layout(set = 3, binding = 37, std430) readonly buffer StructuredBuffer
	{
	    layout(row_major) SceneGlobalInfoGPU_t_natural _member0[];
	} g_SceneGlobalInfo;
	
	layout(set = 3, binding = 36, std430) readonly buffer g_Lights
	{
	    layout(row_major) PathTraceBarnLightGPU_t_natural _member0[];
	} g_Lights_1;
	
	layout(set = 6, binding = 158, std430) buffer RWStructuredBuffer
	{
	    uint _member0[];
	} g_LightBins;
	
	void main()
	{
	    uint _295 = uint(max(1, ((g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.w + 31) / 32)));
	    uvec3 _296 = uvec3(g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.xyz);
	    uint _300 = gl_LaunchIDEXT.z / _295;
	    uint nMask = gl_LaunchIDEXT.z - (_300 * _295);
	    uint _303 = _295 * _296.x;
	    vec3 vCellMin = vec3(uvec3(gl_LaunchIDEXT.xy, _300)) / vec3(g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.xyz);
	    vec3 _334 = mix(g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz, g_SceneGlobalInfo._member0[0].m_vLocalLightMaxBounds.xyz, vCellMin);
	    vec3 _335 = mix(g_SceneGlobalInfo._member0[0].m_vLocalLightMinBounds.xyz, g_SceneGlobalInfo._member0[0].m_vLocalLightMaxBounds.xyz, vCellMin + (vec3(1.0) / vec3(g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.xyz)));
	    int nStartLight = int(nMask) * 32;
	    int _341 = min((nStartLight + 32), g_SceneGlobalInfo._member0[0].m_vLightBinCellCount_nLightCount.w);
	    int i = nStartLight;
	    int nBits = 0;
	    float _162;
	    vec4 _163;
	    vec4 _164;
	    bool _165;
	    vec3 _166;
	    float _167;
	    vec3 _168;
	    float _169;
	    vec3 _170;
	    float _171;
	    vec3 _172;
	    float _173;
	    vec3 _174;
	    float _175;
	    vec3 _176;
	    float _177;
	    vec3 _178;
	    float _179;
	    vec3 _180;
	    float _181;
	    float _182;
	    vec4 _183;
	    vec4 _184;
	    bool _185;
	    vec3 _186;
	    float _187;
	    vec3 _188;
	    float _189;
	    vec3 _190;
	    float _191;
	    vec3 _192;
	    float _193;
	    vec3 _194;
	    float _195;
	    vec3 _196;
	    float _197;
	    vec3 _198;
	    float _199;
	    vec3 _200;
	    float _201;
	    float _202;
	    vec4 _203;
	    vec4 _204;
	    bool _205;
	    vec3 _206;
	    float _207;
	    vec3 _208;
	    float _209;
	    vec3 _210;
	    float _211;
	    vec3 _212;
	    float _213;
	    vec3 _214;
	    float _215;
	    vec3 _216;
	    float _217;
	    vec3 _218;
	    float _219;
	    vec3 _220;
	    float _221;
	    float _222;
	    vec4 _223;
	    vec4 _224;
	    bool _225;
	    vec3 _226;
	    float _227;
	    vec3 _228;
	    float _229;
	    vec3 _230;
	    float _231;
	    vec3 _232;
	    float _233;
	    vec3 _234;
	    float _235;
	    vec3 _236;
	    float _237;
	    vec3 _238;
	    float _239;
	    vec3 _240;
	    float _241;
	    float _242;
	    vec4 _243;
	    vec4 _244;
	    bool _245;
	    vec3 _246;
	    float _247;
	    vec3 _248;
	    float _249;
	    vec3 _250;
	    float _251;
	    vec3 _252;
	    float _253;
	    vec3 _254;
	    float _255;
	    vec3 _256;
	    float _257;
	    vec3 _258;
	    float _259;
	    vec3 _260;
	    float _261;
	    float _262;
	    vec4 _263;
	    vec4 _264;
	    bool _265;
	    vec3 _266;
	    float _267;
	    vec3 _268;
	    float _269;
	    vec3 _270;
	    float _271;
	    vec3 _272;
	    float _273;
	    vec3 _274;
	    float _275;
	    vec3 _276;
	    float _277;
	    vec3 _278;
	    float _279;
	    vec3 _280;
	    float _281;
	    float _282;
	    bool _283;
	    for (;;)
	    {
	        bool _346_ladder_break = false;
	        do
	        {
	            if (!(i < _341))
	            {
	                _346_ladder_break = true;
	                break;
	            }
	            vec3 _113 = g_Lights_1._member0[i].m_vMinBounds.xyz;
	            vec3 _112 = g_Lights_1._member0[i].m_vMaxBounds.xyz;
	            vec3 _111 = _334;
	            vec3 _110 = _335;
	            do
	            {
	                bvec3 _366 = greaterThan(_113, _110);
	                bvec3 _369 = lessThan(_112, _111);
	                if (any(bvec3(_366.x || _369.x, _366.y || _369.y, _366.z || _369.z)))
	                {
	                    _283 = false;
	                    break;
	                }
	                _283 = true;
	                break;
	            } while(false);
	            if (!_283)
	            {
	                break;
	            }
	            do
	            {
	                if (g_Lights_1._member0[i].m_vLightPosition.w == 0.0)
	                {
	                    _282 = 3.4028234663852885981170418348452e+38;
	                    break;
	                }
	                if (g_Lights_1._member0[i].m_vDistanceFade_vSkirt.y == 0.0)
	                {
	                    _282 = 3.4028234663852885981170418348452e+38;
	                    break;
	                }
	                _282 = (-g_Lights_1._member0[i].m_vDistanceFade_vSkirt.x) / g_Lights_1._member0[i].m_vDistanceFade_vSkirt.y;
	                break;
	            } while(false);
	            if (_282 < 3.4028234663852885981170418348452e+38)
	            {
	                vec3 vDelta = g_Lights_1._member0[i].m_vLightPosition.xyz - clamp(g_Lights_1._member0[i].m_vLightPosition.xyz, _334, _335);
	                if (dot(vDelta, vDelta) > (_282 * _282))
	                {
	                    break;
	                }
	            }
	            vec4 _416 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(-1.0, -1.0, 0.0), 1.0);
	            vec3 _420 = _416.xyz / vec3(_416.w);
	            vec4 _422;
	            _422.x = _420.x;
	            _422.y = _420.y;
	            _422.z = _420.z;
	            vec3 _109 = _422.xyz;
	            vec4 _432 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(-1.0, 1.0, 0.0), 1.0);
	            vec3 _436 = _432.xyz / vec3(_432.w);
	            vec4 _438;
	            _438.x = _436.x;
	            _438.y = _436.y;
	            _438.z = _436.z;
	            vec3 _108 = _438.xyz;
	            vec4 _448 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(1.0, 1.0, 0.0), 1.0);
	            vec3 _452 = _448.xyz / vec3(_448.w);
	            vec4 _454;
	            _454.x = _452.x;
	            _454.y = _452.y;
	            _454.z = _452.z;
	            vec3 _107 = _454.xyz;
	            vec4 _464 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(1.0, -1.0, 0.0), 1.0);
	            vec3 _468 = _464.xyz / vec3(_464.w);
	            vec4 _470;
	            _470.x = _468.x;
	            _470.y = _468.y;
	            _470.z = _468.z;
	            vec3 _106 = _470.xyz;
	            vec4 _480 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(-1.0, -1.0, 1.0), 1.0);
	            vec3 _484 = _480.xyz / vec3(_480.w);
	            vec4 _486;
	            _486.x = _484.x;
	            _486.y = _484.y;
	            _486.z = _484.z;
	            vec3 _105 = _486.xyz;
	            vec4 _496 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(-1.0, 1.0, 1.0), 1.0);
	            vec3 _500 = _496.xyz / vec3(_496.w);
	            vec4 _502;
	            _502.x = _500.x;
	            _502.y = _500.y;
	            _502.z = _500.z;
	            vec3 _104 = _502.xyz;
	            vec4 _512 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(1.0), 1.0);
	            vec3 _516 = _512.xyz / vec3(_512.w);
	            vec4 _518;
	            _518.x = _516.x;
	            _518.y = _516.y;
	            _518.z = _516.z;
	            vec3 _103 = _518.xyz;
	            vec4 _528 = g_Lights_1._member0[i].m_mFromClipSpace * vec4(vec3(1.0, -1.0, 1.0), 1.0);
	            vec3 _532 = _528.xyz / vec3(_528.w);
	            vec4 _534;
	            _534.x = _532.x;
	            _534.y = _532.y;
	            _534.z = _532.z;
	            vec3 _102 = _534.xyz;
	            vec3 _543 = normalize(cross(_438.xyz - _422.xyz, _454.xyz - _422.xyz));
	            vec4 _545 = vec4(_543, dot(_543, _438.xyz));
	            vec3 _101 = _334;
	            vec3 _100 = _335;
	            if (false)
	            {
	                _281 = _100.x;
	            }
	            else
	            {
	                _281 = _101.x;
	            }
	            vec3 _554 = _280;
	            _554.x = _281;
	            _280 = _554;
	            if (false)
	            {
	                _281 = _100.y;
	            }
	            else
	            {
	                _281 = _101.y;
	            }
	            vec3 _564 = _280;
	            _564.y = _281;
	            _280 = _564;
	            if (false)
	            {
	                _281 = _100.z;
	            }
	            else
	            {
	                _281 = _101.z;
	            }
	            vec3 _574 = _280;
	            _574.z = _281;
	            _280 = _574;
	            if (true)
	            {
	                _279 = _100.x;
	            }
	            else
	            {
	                _279 = _101.x;
	            }
	            vec3 _584 = _278;
	            _584.x = _279;
	            _278 = _584;
	            if (false)
	            {
	                _279 = _100.y;
	            }
	            else
	            {
	                _279 = _101.y;
	            }
	            vec3 _594 = _278;
	            _594.y = _279;
	            _278 = _594;
	            if (false)
	            {
	                _279 = _100.z;
	            }
	            else
	            {
	                _279 = _101.z;
	            }
	            vec3 _604 = _278;
	            _604.z = _279;
	            _278 = _604;
	            if (false)
	            {
	                _277 = _100.x;
	            }
	            else
	            {
	                _277 = _101.x;
	            }
	            vec3 _614 = _276;
	            _614.x = _277;
	            _276 = _614;
	            if (true)
	            {
	                _277 = _100.y;
	            }
	            else
	            {
	                _277 = _101.y;
	            }
	            vec3 _624 = _276;
	            _624.y = _277;
	            _276 = _624;
	            if (false)
	            {
	                _277 = _100.z;
	            }
	            else
	            {
	                _277 = _101.z;
	            }
	            vec3 _634 = _276;
	            _634.z = _277;
	            _276 = _634;
	            if (true)
	            {
	                _275 = _100.x;
	            }
	            else
	            {
	                _275 = _101.x;
	            }
	            vec3 _644 = _274;
	            _644.x = _275;
	            _274 = _644;
	            if (true)
	            {
	                _275 = _100.y;
	            }
	            else
	            {
	                _275 = _101.y;
	            }
	            vec3 _654 = _274;
	            _654.y = _275;
	            _274 = _654;
	            if (false)
	            {
	                _275 = _100.z;
	            }
	            else
	            {
	                _275 = _101.z;
	            }
	            vec3 _664 = _274;
	            _664.z = _275;
	            _274 = _664;
	            if (false)
	            {
	                _273 = _100.x;
	            }
	            else
	            {
	                _273 = _101.x;
	            }
	            vec3 _674 = _272;
	            _674.x = _273;
	            _272 = _674;
	            if (false)
	            {
	                _273 = _100.y;
	            }
	            else
	            {
	                _273 = _101.y;
	            }
	            vec3 _684 = _272;
	            _684.y = _273;
	            _272 = _684;
	            if (true)
	            {
	                _273 = _100.z;
	            }
	            else
	            {
	                _273 = _101.z;
	            }
	            vec3 _694 = _272;
	            _694.z = _273;
	            _272 = _694;
	            if (true)
	            {
	                _271 = _100.x;
	            }
	            else
	            {
	                _271 = _101.x;
	            }
	            vec3 _704 = _270;
	            _704.x = _271;
	            _270 = _704;
	            if (false)
	            {
	                _271 = _100.y;
	            }
	            else
	            {
	                _271 = _101.y;
	            }
	            vec3 _714 = _270;
	            _714.y = _271;
	            _270 = _714;
	            if (true)
	            {
	                _271 = _100.z;
	            }
	            else
	            {
	                _271 = _101.z;
	            }
	            vec3 _724 = _270;
	            _724.z = _271;
	            _270 = _724;
	            if (false)
	            {
	                _269 = _100.x;
	            }
	            else
	            {
	                _269 = _101.x;
	            }
	            vec3 _734 = _268;
	            _734.x = _269;
	            _268 = _734;
	            if (true)
	            {
	                _269 = _100.y;
	            }
	            else
	            {
	                _269 = _101.y;
	            }
	            vec3 _744 = _268;
	            _744.y = _269;
	            _268 = _744;
	            if (true)
	            {
	                _269 = _100.z;
	            }
	            else
	            {
	                _269 = _101.z;
	            }
	            vec3 _754 = _268;
	            _754.z = _269;
	            _268 = _754;
	            if (true)
	            {
	                _267 = _100.x;
	            }
	            else
	            {
	                _267 = _101.x;
	            }
	            vec3 _764 = _266;
	            _764.x = _267;
	            _266 = _764;
	            if (true)
	            {
	                _267 = _100.y;
	            }
	            else
	            {
	                _267 = _101.y;
	            }
	            vec3 _774 = _266;
	            _774.y = _267;
	            _266 = _774;
	            if (true)
	            {
	                _267 = _100.z;
	            }
	            else
	            {
	                _267 = _101.z;
	            }
	            vec3 _784 = _266;
	            _784.z = _267;
	            _266 = _784;
	            vec3 _121 = _574;
	            vec3 _120 = _604;
	            vec3 _119 = _634;
	            vec3 _118 = _664;
	            vec3 _117 = _694;
	            vec3 _116 = _724;
	            vec3 _115 = _754;
	            vec3 _114 = _784;
	            do
	            {
	                vec3 _788 = _545.xyz;
	                float _791 = _545.w;
	                vec4 _793 = _263;
	                _793.x = dot(_788, _121) - _791;
	                _793.y = dot(_788, _120) - _791;
	                _793.z = dot(_788, _119) - _791;
	                _793.w = dot(_788, _118) - _791;
	                _263 = _793;
	                vec4 _810 = _264;
	                _810.x = dot(_788, _117) - _791;
	                _810.y = dot(_788, _116) - _791;
	                _810.z = dot(_788, _115) - _791;
	                _810.w = dot(_788, _114) - _791;
	                _264 = _810;
	                if (all(greaterThan(_793, vec4(0.0))))
	                {
	                    _265 = all(greaterThan(_264, vec4(0.0)));
	                }
	                else
	                {
	                    _265 = false;
	                }
	                if (_265)
	                {
	                    _262 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_263, vec4(0.0))))
	                {
	                    _265 = all(lessThan(_264, vec4(0.0)));
	                }
	                else
	                {
	                    _265 = false;
	                }
	                if (_265)
	                {
	                    _262 = -1.0;
	                    break;
	                }
	                _262 = 0.0;
	                break;
	            } while(false);
	            if (_262 < 0.0)
	            {
	                break;
	            }
	            vec3 _857 = normalize(cross(_103 - _105, _104 - _105));
	            vec4 _859 = vec4(_857, dot(_857, _103));
	            vec3 _99 = _334;
	            vec3 _98 = _335;
	            if (false)
	            {
	                _261 = _98.x;
	            }
	            else
	            {
	                _261 = _99.x;
	            }
	            vec3 _868 = _260;
	            _868.x = _261;
	            _260 = _868;
	            if (false)
	            {
	                _261 = _98.y;
	            }
	            else
	            {
	                _261 = _99.y;
	            }
	            vec3 _878 = _260;
	            _878.y = _261;
	            _260 = _878;
	            if (false)
	            {
	                _261 = _98.z;
	            }
	            else
	            {
	                _261 = _99.z;
	            }
	            vec3 _888 = _260;
	            _888.z = _261;
	            _260 = _888;
	            if (true)
	            {
	                _259 = _98.x;
	            }
	            else
	            {
	                _259 = _99.x;
	            }
	            vec3 _898 = _258;
	            _898.x = _259;
	            _258 = _898;
	            if (false)
	            {
	                _259 = _98.y;
	            }
	            else
	            {
	                _259 = _99.y;
	            }
	            vec3 _908 = _258;
	            _908.y = _259;
	            _258 = _908;
	            if (false)
	            {
	                _259 = _98.z;
	            }
	            else
	            {
	                _259 = _99.z;
	            }
	            vec3 _918 = _258;
	            _918.z = _259;
	            _258 = _918;
	            if (false)
	            {
	                _257 = _98.x;
	            }
	            else
	            {
	                _257 = _99.x;
	            }
	            vec3 _928 = _256;
	            _928.x = _257;
	            _256 = _928;
	            if (true)
	            {
	                _257 = _98.y;
	            }
	            else
	            {
	                _257 = _99.y;
	            }
	            vec3 _938 = _256;
	            _938.y = _257;
	            _256 = _938;
	            if (false)
	            {
	                _257 = _98.z;
	            }
	            else
	            {
	                _257 = _99.z;
	            }
	            vec3 _948 = _256;
	            _948.z = _257;
	            _256 = _948;
	            if (true)
	            {
	                _255 = _98.x;
	            }
	            else
	            {
	                _255 = _99.x;
	            }
	            vec3 _958 = _254;
	            _958.x = _255;
	            _254 = _958;
	            if (true)
	            {
	                _255 = _98.y;
	            }
	            else
	            {
	                _255 = _99.y;
	            }
	            vec3 _968 = _254;
	            _968.y = _255;
	            _254 = _968;
	            if (false)
	            {
	                _255 = _98.z;
	            }
	            else
	            {
	                _255 = _99.z;
	            }
	            vec3 _978 = _254;
	            _978.z = _255;
	            _254 = _978;
	            if (false)
	            {
	                _253 = _98.x;
	            }
	            else
	            {
	                _253 = _99.x;
	            }
	            vec3 _988 = _252;
	            _988.x = _253;
	            _252 = _988;
	            if (false)
	            {
	                _253 = _98.y;
	            }
	            else
	            {
	                _253 = _99.y;
	            }
	            vec3 _998 = _252;
	            _998.y = _253;
	            _252 = _998;
	            if (true)
	            {
	                _253 = _98.z;
	            }
	            else
	            {
	                _253 = _99.z;
	            }
	            vec3 _1008 = _252;
	            _1008.z = _253;
	            _252 = _1008;
	            if (true)
	            {
	                _251 = _98.x;
	            }
	            else
	            {
	                _251 = _99.x;
	            }
	            vec3 _1018 = _250;
	            _1018.x = _251;
	            _250 = _1018;
	            if (false)
	            {
	                _251 = _98.y;
	            }
	            else
	            {
	                _251 = _99.y;
	            }
	            vec3 _1028 = _250;
	            _1028.y = _251;
	            _250 = _1028;
	            if (true)
	            {
	                _251 = _98.z;
	            }
	            else
	            {
	                _251 = _99.z;
	            }
	            vec3 _1038 = _250;
	            _1038.z = _251;
	            _250 = _1038;
	            if (false)
	            {
	                _249 = _98.x;
	            }
	            else
	            {
	                _249 = _99.x;
	            }
	            vec3 _1048 = _248;
	            _1048.x = _249;
	            _248 = _1048;
	            if (true)
	            {
	                _249 = _98.y;
	            }
	            else
	            {
	                _249 = _99.y;
	            }
	            vec3 _1058 = _248;
	            _1058.y = _249;
	            _248 = _1058;
	            if (true)
	            {
	                _249 = _98.z;
	            }
	            else
	            {
	                _249 = _99.z;
	            }
	            vec3 _1068 = _248;
	            _1068.z = _249;
	            _248 = _1068;
	            if (true)
	            {
	                _247 = _98.x;
	            }
	            else
	            {
	                _247 = _99.x;
	            }
	            vec3 _1078 = _246;
	            _1078.x = _247;
	            _246 = _1078;
	            if (true)
	            {
	                _247 = _98.y;
	            }
	            else
	            {
	                _247 = _99.y;
	            }
	            vec3 _1088 = _246;
	            _1088.y = _247;
	            _246 = _1088;
	            if (true)
	            {
	                _247 = _98.z;
	            }
	            else
	            {
	                _247 = _99.z;
	            }
	            vec3 _1098 = _246;
	            _1098.z = _247;
	            _246 = _1098;
	            vec3 _129 = _888;
	            vec3 _128 = _918;
	            vec3 _127 = _948;
	            vec3 _126 = _978;
	            vec3 _125 = _1008;
	            vec3 _124 = _1038;
	            vec3 _123 = _1068;
	            vec3 _122 = _1098;
	            do
	            {
	                vec3 _1102 = _859.xyz;
	                float _1105 = _859.w;
	                vec4 _1107 = _243;
	                _1107.x = dot(_1102, _129) - _1105;
	                _1107.y = dot(_1102, _128) - _1105;
	                _1107.z = dot(_1102, _127) - _1105;
	                _1107.w = dot(_1102, _126) - _1105;
	                _243 = _1107;
	                vec4 _1124 = _244;
	                _1124.x = dot(_1102, _125) - _1105;
	                _1124.y = dot(_1102, _124) - _1105;
	                _1124.z = dot(_1102, _123) - _1105;
	                _1124.w = dot(_1102, _122) - _1105;
	                _244 = _1124;
	                if (all(greaterThan(_1107, vec4(0.0))))
	                {
	                    _245 = all(greaterThan(_244, vec4(0.0)));
	                }
	                else
	                {
	                    _245 = false;
	                }
	                if (_245)
	                {
	                    _242 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_243, vec4(0.0))))
	                {
	                    _245 = all(lessThan(_244, vec4(0.0)));
	                }
	                else
	                {
	                    _245 = false;
	                }
	                if (_245)
	                {
	                    _242 = -1.0;
	                    break;
	                }
	                _242 = 0.0;
	                break;
	            } while(false);
	            if (_242 < 0.0)
	            {
	                break;
	            }
	            vec3 _1171 = normalize(cross(_105 - _109, _104 - _109));
	            vec4 _1173 = vec4(_1171, dot(_1171, _105));
	            vec3 _97 = _334;
	            vec3 _96 = _335;
	            if (false)
	            {
	                _241 = _96.x;
	            }
	            else
	            {
	                _241 = _97.x;
	            }
	            vec3 _1182 = _240;
	            _1182.x = _241;
	            _240 = _1182;
	            if (false)
	            {
	                _241 = _96.y;
	            }
	            else
	            {
	                _241 = _97.y;
	            }
	            vec3 _1192 = _240;
	            _1192.y = _241;
	            _240 = _1192;
	            if (false)
	            {
	                _241 = _96.z;
	            }
	            else
	            {
	                _241 = _97.z;
	            }
	            vec3 _1202 = _240;
	            _1202.z = _241;
	            _240 = _1202;
	            if (true)
	            {
	                _239 = _96.x;
	            }
	            else
	            {
	                _239 = _97.x;
	            }
	            vec3 _1212 = _238;
	            _1212.x = _239;
	            _238 = _1212;
	            if (false)
	            {
	                _239 = _96.y;
	            }
	            else
	            {
	                _239 = _97.y;
	            }
	            vec3 _1222 = _238;
	            _1222.y = _239;
	            _238 = _1222;
	            if (false)
	            {
	                _239 = _96.z;
	            }
	            else
	            {
	                _239 = _97.z;
	            }
	            vec3 _1232 = _238;
	            _1232.z = _239;
	            _238 = _1232;
	            if (false)
	            {
	                _237 = _96.x;
	            }
	            else
	            {
	                _237 = _97.x;
	            }
	            vec3 _1242 = _236;
	            _1242.x = _237;
	            _236 = _1242;
	            if (true)
	            {
	                _237 = _96.y;
	            }
	            else
	            {
	                _237 = _97.y;
	            }
	            vec3 _1252 = _236;
	            _1252.y = _237;
	            _236 = _1252;
	            if (false)
	            {
	                _237 = _96.z;
	            }
	            else
	            {
	                _237 = _97.z;
	            }
	            vec3 _1262 = _236;
	            _1262.z = _237;
	            _236 = _1262;
	            if (true)
	            {
	                _235 = _96.x;
	            }
	            else
	            {
	                _235 = _97.x;
	            }
	            vec3 _1272 = _234;
	            _1272.x = _235;
	            _234 = _1272;
	            if (true)
	            {
	                _235 = _96.y;
	            }
	            else
	            {
	                _235 = _97.y;
	            }
	            vec3 _1282 = _234;
	            _1282.y = _235;
	            _234 = _1282;
	            if (false)
	            {
	                _235 = _96.z;
	            }
	            else
	            {
	                _235 = _97.z;
	            }
	            vec3 _1292 = _234;
	            _1292.z = _235;
	            _234 = _1292;
	            if (false)
	            {
	                _233 = _96.x;
	            }
	            else
	            {
	                _233 = _97.x;
	            }
	            vec3 _1302 = _232;
	            _1302.x = _233;
	            _232 = _1302;
	            if (false)
	            {
	                _233 = _96.y;
	            }
	            else
	            {
	                _233 = _97.y;
	            }
	            vec3 _1312 = _232;
	            _1312.y = _233;
	            _232 = _1312;
	            if (true)
	            {
	                _233 = _96.z;
	            }
	            else
	            {
	                _233 = _97.z;
	            }
	            vec3 _1322 = _232;
	            _1322.z = _233;
	            _232 = _1322;
	            if (true)
	            {
	                _231 = _96.x;
	            }
	            else
	            {
	                _231 = _97.x;
	            }
	            vec3 _1332 = _230;
	            _1332.x = _231;
	            _230 = _1332;
	            if (false)
	            {
	                _231 = _96.y;
	            }
	            else
	            {
	                _231 = _97.y;
	            }
	            vec3 _1342 = _230;
	            _1342.y = _231;
	            _230 = _1342;
	            if (true)
	            {
	                _231 = _96.z;
	            }
	            else
	            {
	                _231 = _97.z;
	            }
	            vec3 _1352 = _230;
	            _1352.z = _231;
	            _230 = _1352;
	            if (false)
	            {
	                _229 = _96.x;
	            }
	            else
	            {
	                _229 = _97.x;
	            }
	            vec3 _1362 = _228;
	            _1362.x = _229;
	            _228 = _1362;
	            if (true)
	            {
	                _229 = _96.y;
	            }
	            else
	            {
	                _229 = _97.y;
	            }
	            vec3 _1372 = _228;
	            _1372.y = _229;
	            _228 = _1372;
	            if (true)
	            {
	                _229 = _96.z;
	            }
	            else
	            {
	                _229 = _97.z;
	            }
	            vec3 _1382 = _228;
	            _1382.z = _229;
	            _228 = _1382;
	            if (true)
	            {
	                _227 = _96.x;
	            }
	            else
	            {
	                _227 = _97.x;
	            }
	            vec3 _1392 = _226;
	            _1392.x = _227;
	            _226 = _1392;
	            if (true)
	            {
	                _227 = _96.y;
	            }
	            else
	            {
	                _227 = _97.y;
	            }
	            vec3 _1402 = _226;
	            _1402.y = _227;
	            _226 = _1402;
	            if (true)
	            {
	                _227 = _96.z;
	            }
	            else
	            {
	                _227 = _97.z;
	            }
	            vec3 _1412 = _226;
	            _1412.z = _227;
	            _226 = _1412;
	            vec3 _137 = _1202;
	            vec3 _136 = _1232;
	            vec3 _135 = _1262;
	            vec3 _134 = _1292;
	            vec3 _133 = _1322;
	            vec3 _132 = _1352;
	            vec3 _131 = _1382;
	            vec3 _130 = _1412;
	            do
	            {
	                vec3 _1416 = _1173.xyz;
	                float _1419 = _1173.w;
	                vec4 _1421 = _223;
	                _1421.x = dot(_1416, _137) - _1419;
	                _1421.y = dot(_1416, _136) - _1419;
	                _1421.z = dot(_1416, _135) - _1419;
	                _1421.w = dot(_1416, _134) - _1419;
	                _223 = _1421;
	                vec4 _1438 = _224;
	                _1438.x = dot(_1416, _133) - _1419;
	                _1438.y = dot(_1416, _132) - _1419;
	                _1438.z = dot(_1416, _131) - _1419;
	                _1438.w = dot(_1416, _130) - _1419;
	                _224 = _1438;
	                if (all(greaterThan(_1421, vec4(0.0))))
	                {
	                    _225 = all(greaterThan(_224, vec4(0.0)));
	                }
	                else
	                {
	                    _225 = false;
	                }
	                if (_225)
	                {
	                    _222 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_223, vec4(0.0))))
	                {
	                    _225 = all(lessThan(_224, vec4(0.0)));
	                }
	                else
	                {
	                    _225 = false;
	                }
	                if (_225)
	                {
	                    _222 = -1.0;
	                    break;
	                }
	                _222 = 0.0;
	                break;
	            } while(false);
	            if (_222 < 0.0)
	            {
	                break;
	            }
	            vec3 _1485 = normalize(cross(_104 - _108, _103 - _108));
	            vec4 _1487 = vec4(_1485, dot(_1485, _104));
	            vec3 _95 = _334;
	            vec3 _94 = _335;
	            if (false)
	            {
	                _221 = _94.x;
	            }
	            else
	            {
	                _221 = _95.x;
	            }
	            vec3 _1496 = _220;
	            _1496.x = _221;
	            _220 = _1496;
	            if (false)
	            {
	                _221 = _94.y;
	            }
	            else
	            {
	                _221 = _95.y;
	            }
	            vec3 _1506 = _220;
	            _1506.y = _221;
	            _220 = _1506;
	            if (false)
	            {
	                _221 = _94.z;
	            }
	            else
	            {
	                _221 = _95.z;
	            }
	            vec3 _1516 = _220;
	            _1516.z = _221;
	            _220 = _1516;
	            if (true)
	            {
	                _219 = _94.x;
	            }
	            else
	            {
	                _219 = _95.x;
	            }
	            vec3 _1526 = _218;
	            _1526.x = _219;
	            _218 = _1526;
	            if (false)
	            {
	                _219 = _94.y;
	            }
	            else
	            {
	                _219 = _95.y;
	            }
	            vec3 _1536 = _218;
	            _1536.y = _219;
	            _218 = _1536;
	            if (false)
	            {
	                _219 = _94.z;
	            }
	            else
	            {
	                _219 = _95.z;
	            }
	            vec3 _1546 = _218;
	            _1546.z = _219;
	            _218 = _1546;
	            if (false)
	            {
	                _217 = _94.x;
	            }
	            else
	            {
	                _217 = _95.x;
	            }
	            vec3 _1556 = _216;
	            _1556.x = _217;
	            _216 = _1556;
	            if (true)
	            {
	                _217 = _94.y;
	            }
	            else
	            {
	                _217 = _95.y;
	            }
	            vec3 _1566 = _216;
	            _1566.y = _217;
	            _216 = _1566;
	            if (false)
	            {
	                _217 = _94.z;
	            }
	            else
	            {
	                _217 = _95.z;
	            }
	            vec3 _1576 = _216;
	            _1576.z = _217;
	            _216 = _1576;
	            if (true)
	            {
	                _215 = _94.x;
	            }
	            else
	            {
	                _215 = _95.x;
	            }
	            vec3 _1586 = _214;
	            _1586.x = _215;
	            _214 = _1586;
	            if (true)
	            {
	                _215 = _94.y;
	            }
	            else
	            {
	                _215 = _95.y;
	            }
	            vec3 _1596 = _214;
	            _1596.y = _215;
	            _214 = _1596;
	            if (false)
	            {
	                _215 = _94.z;
	            }
	            else
	            {
	                _215 = _95.z;
	            }
	            vec3 _1606 = _214;
	            _1606.z = _215;
	            _214 = _1606;
	            if (false)
	            {
	                _213 = _94.x;
	            }
	            else
	            {
	                _213 = _95.x;
	            }
	            vec3 _1616 = _212;
	            _1616.x = _213;
	            _212 = _1616;
	            if (false)
	            {
	                _213 = _94.y;
	            }
	            else
	            {
	                _213 = _95.y;
	            }
	            vec3 _1626 = _212;
	            _1626.y = _213;
	            _212 = _1626;
	            if (true)
	            {
	                _213 = _94.z;
	            }
	            else
	            {
	                _213 = _95.z;
	            }
	            vec3 _1636 = _212;
	            _1636.z = _213;
	            _212 = _1636;
	            if (true)
	            {
	                _211 = _94.x;
	            }
	            else
	            {
	                _211 = _95.x;
	            }
	            vec3 _1646 = _210;
	            _1646.x = _211;
	            _210 = _1646;
	            if (false)
	            {
	                _211 = _94.y;
	            }
	            else
	            {
	                _211 = _95.y;
	            }
	            vec3 _1656 = _210;
	            _1656.y = _211;
	            _210 = _1656;
	            if (true)
	            {
	                _211 = _94.z;
	            }
	            else
	            {
	                _211 = _95.z;
	            }
	            vec3 _1666 = _210;
	            _1666.z = _211;
	            _210 = _1666;
	            if (false)
	            {
	                _209 = _94.x;
	            }
	            else
	            {
	                _209 = _95.x;
	            }
	            vec3 _1676 = _208;
	            _1676.x = _209;
	            _208 = _1676;
	            if (true)
	            {
	                _209 = _94.y;
	            }
	            else
	            {
	                _209 = _95.y;
	            }
	            vec3 _1686 = _208;
	            _1686.y = _209;
	            _208 = _1686;
	            if (true)
	            {
	                _209 = _94.z;
	            }
	            else
	            {
	                _209 = _95.z;
	            }
	            vec3 _1696 = _208;
	            _1696.z = _209;
	            _208 = _1696;
	            if (true)
	            {
	                _207 = _94.x;
	            }
	            else
	            {
	                _207 = _95.x;
	            }
	            vec3 _1706 = _206;
	            _1706.x = _207;
	            _206 = _1706;
	            if (true)
	            {
	                _207 = _94.y;
	            }
	            else
	            {
	                _207 = _95.y;
	            }
	            vec3 _1716 = _206;
	            _1716.y = _207;
	            _206 = _1716;
	            if (true)
	            {
	                _207 = _94.z;
	            }
	            else
	            {
	                _207 = _95.z;
	            }
	            vec3 _1726 = _206;
	            _1726.z = _207;
	            _206 = _1726;
	            vec3 _145 = _1516;
	            vec3 _144 = _1546;
	            vec3 _143 = _1576;
	            vec3 _142 = _1606;
	            vec3 _141 = _1636;
	            vec3 _140 = _1666;
	            vec3 _139 = _1696;
	            vec3 _138 = _1726;
	            do
	            {
	                vec3 _1730 = _1487.xyz;
	                float _1733 = _1487.w;
	                vec4 _1735 = _203;
	                _1735.x = dot(_1730, _145) - _1733;
	                _1735.y = dot(_1730, _144) - _1733;
	                _1735.z = dot(_1730, _143) - _1733;
	                _1735.w = dot(_1730, _142) - _1733;
	                _203 = _1735;
	                vec4 _1752 = _204;
	                _1752.x = dot(_1730, _141) - _1733;
	                _1752.y = dot(_1730, _140) - _1733;
	                _1752.z = dot(_1730, _139) - _1733;
	                _1752.w = dot(_1730, _138) - _1733;
	                _204 = _1752;
	                if (all(greaterThan(_1735, vec4(0.0))))
	                {
	                    _205 = all(greaterThan(_204, vec4(0.0)));
	                }
	                else
	                {
	                    _205 = false;
	                }
	                if (_205)
	                {
	                    _202 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_203, vec4(0.0))))
	                {
	                    _205 = all(lessThan(_204, vec4(0.0)));
	                }
	                else
	                {
	                    _205 = false;
	                }
	                if (_205)
	                {
	                    _202 = -1.0;
	                    break;
	                }
	                _202 = 0.0;
	                break;
	            } while(false);
	            if (_202 < 0.0)
	            {
	                break;
	            }
	            vec3 _1799 = normalize(cross(_103 - _107, _102 - _107));
	            vec4 _1801 = vec4(_1799, dot(_1799, _103));
	            vec3 _93 = _334;
	            vec3 _92 = _335;
	            if (false)
	            {
	                _201 = _92.x;
	            }
	            else
	            {
	                _201 = _93.x;
	            }
	            vec3 _1810 = _200;
	            _1810.x = _201;
	            _200 = _1810;
	            if (false)
	            {
	                _201 = _92.y;
	            }
	            else
	            {
	                _201 = _93.y;
	            }
	            vec3 _1820 = _200;
	            _1820.y = _201;
	            _200 = _1820;
	            if (false)
	            {
	                _201 = _92.z;
	            }
	            else
	            {
	                _201 = _93.z;
	            }
	            vec3 _1830 = _200;
	            _1830.z = _201;
	            _200 = _1830;
	            if (true)
	            {
	                _199 = _92.x;
	            }
	            else
	            {
	                _199 = _93.x;
	            }
	            vec3 _1840 = _198;
	            _1840.x = _199;
	            _198 = _1840;
	            if (false)
	            {
	                _199 = _92.y;
	            }
	            else
	            {
	                _199 = _93.y;
	            }
	            vec3 _1850 = _198;
	            _1850.y = _199;
	            _198 = _1850;
	            if (false)
	            {
	                _199 = _92.z;
	            }
	            else
	            {
	                _199 = _93.z;
	            }
	            vec3 _1860 = _198;
	            _1860.z = _199;
	            _198 = _1860;
	            if (false)
	            {
	                _197 = _92.x;
	            }
	            else
	            {
	                _197 = _93.x;
	            }
	            vec3 _1870 = _196;
	            _1870.x = _197;
	            _196 = _1870;
	            if (true)
	            {
	                _197 = _92.y;
	            }
	            else
	            {
	                _197 = _93.y;
	            }
	            vec3 _1880 = _196;
	            _1880.y = _197;
	            _196 = _1880;
	            if (false)
	            {
	                _197 = _92.z;
	            }
	            else
	            {
	                _197 = _93.z;
	            }
	            vec3 _1890 = _196;
	            _1890.z = _197;
	            _196 = _1890;
	            if (true)
	            {
	                _195 = _92.x;
	            }
	            else
	            {
	                _195 = _93.x;
	            }
	            vec3 _1900 = _194;
	            _1900.x = _195;
	            _194 = _1900;
	            if (true)
	            {
	                _195 = _92.y;
	            }
	            else
	            {
	                _195 = _93.y;
	            }
	            vec3 _1910 = _194;
	            _1910.y = _195;
	            _194 = _1910;
	            if (false)
	            {
	                _195 = _92.z;
	            }
	            else
	            {
	                _195 = _93.z;
	            }
	            vec3 _1920 = _194;
	            _1920.z = _195;
	            _194 = _1920;
	            if (false)
	            {
	                _193 = _92.x;
	            }
	            else
	            {
	                _193 = _93.x;
	            }
	            vec3 _1930 = _192;
	            _1930.x = _193;
	            _192 = _1930;
	            if (false)
	            {
	                _193 = _92.y;
	            }
	            else
	            {
	                _193 = _93.y;
	            }
	            vec3 _1940 = _192;
	            _1940.y = _193;
	            _192 = _1940;
	            if (true)
	            {
	                _193 = _92.z;
	            }
	            else
	            {
	                _193 = _93.z;
	            }
	            vec3 _1950 = _192;
	            _1950.z = _193;
	            _192 = _1950;
	            if (true)
	            {
	                _191 = _92.x;
	            }
	            else
	            {
	                _191 = _93.x;
	            }
	            vec3 _1960 = _190;
	            _1960.x = _191;
	            _190 = _1960;
	            if (false)
	            {
	                _191 = _92.y;
	            }
	            else
	            {
	                _191 = _93.y;
	            }
	            vec3 _1970 = _190;
	            _1970.y = _191;
	            _190 = _1970;
	            if (true)
	            {
	                _191 = _92.z;
	            }
	            else
	            {
	                _191 = _93.z;
	            }
	            vec3 _1980 = _190;
	            _1980.z = _191;
	            _190 = _1980;
	            if (false)
	            {
	                _189 = _92.x;
	            }
	            else
	            {
	                _189 = _93.x;
	            }
	            vec3 _1990 = _188;
	            _1990.x = _189;
	            _188 = _1990;
	            if (true)
	            {
	                _189 = _92.y;
	            }
	            else
	            {
	                _189 = _93.y;
	            }
	            vec3 _2000 = _188;
	            _2000.y = _189;
	            _188 = _2000;
	            if (true)
	            {
	                _189 = _92.z;
	            }
	            else
	            {
	                _189 = _93.z;
	            }
	            vec3 _2010 = _188;
	            _2010.z = _189;
	            _188 = _2010;
	            if (true)
	            {
	                _187 = _92.x;
	            }
	            else
	            {
	                _187 = _93.x;
	            }
	            vec3 _2020 = _186;
	            _2020.x = _187;
	            _186 = _2020;
	            if (true)
	            {
	                _187 = _92.y;
	            }
	            else
	            {
	                _187 = _93.y;
	            }
	            vec3 _2030 = _186;
	            _2030.y = _187;
	            _186 = _2030;
	            if (true)
	            {
	                _187 = _92.z;
	            }
	            else
	            {
	                _187 = _93.z;
	            }
	            vec3 _2040 = _186;
	            _2040.z = _187;
	            _186 = _2040;
	            vec3 _153 = _1830;
	            vec3 _152 = _1860;
	            vec3 _151 = _1890;
	            vec3 _150 = _1920;
	            vec3 _149 = _1950;
	            vec3 _148 = _1980;
	            vec3 _147 = _2010;
	            vec3 _146 = _2040;
	            do
	            {
	                vec3 _2044 = _1801.xyz;
	                float _2047 = _1801.w;
	                vec4 _2049 = _183;
	                _2049.x = dot(_2044, _153) - _2047;
	                _2049.y = dot(_2044, _152) - _2047;
	                _2049.z = dot(_2044, _151) - _2047;
	                _2049.w = dot(_2044, _150) - _2047;
	                _183 = _2049;
	                vec4 _2066 = _184;
	                _2066.x = dot(_2044, _149) - _2047;
	                _2066.y = dot(_2044, _148) - _2047;
	                _2066.z = dot(_2044, _147) - _2047;
	                _2066.w = dot(_2044, _146) - _2047;
	                _184 = _2066;
	                if (all(greaterThan(_2049, vec4(0.0))))
	                {
	                    _185 = all(greaterThan(_184, vec4(0.0)));
	                }
	                else
	                {
	                    _185 = false;
	                }
	                if (_185)
	                {
	                    _182 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_183, vec4(0.0))))
	                {
	                    _185 = all(lessThan(_184, vec4(0.0)));
	                }
	                else
	                {
	                    _185 = false;
	                }
	                if (_185)
	                {
	                    _182 = -1.0;
	                    break;
	                }
	                _182 = 0.0;
	                break;
	            } while(false);
	            if (_182 < 0.0)
	            {
	                break;
	            }
	            vec3 _2113 = normalize(cross(_102 - _106, _105 - _106));
	            vec4 _2115 = vec4(_2113, dot(_2113, _102));
	            vec3 _91 = _334;
	            vec3 _90 = _335;
	            if (false)
	            {
	                _181 = _90.x;
	            }
	            else
	            {
	                _181 = _91.x;
	            }
	            vec3 _2124 = _180;
	            _2124.x = _181;
	            _180 = _2124;
	            if (false)
	            {
	                _181 = _90.y;
	            }
	            else
	            {
	                _181 = _91.y;
	            }
	            vec3 _2134 = _180;
	            _2134.y = _181;
	            _180 = _2134;
	            if (false)
	            {
	                _181 = _90.z;
	            }
	            else
	            {
	                _181 = _91.z;
	            }
	            vec3 _2144 = _180;
	            _2144.z = _181;
	            _180 = _2144;
	            if (true)
	            {
	                _179 = _90.x;
	            }
	            else
	            {
	                _179 = _91.x;
	            }
	            vec3 _2154 = _178;
	            _2154.x = _179;
	            _178 = _2154;
	            if (false)
	            {
	                _179 = _90.y;
	            }
	            else
	            {
	                _179 = _91.y;
	            }
	            vec3 _2164 = _178;
	            _2164.y = _179;
	            _178 = _2164;
	            if (false)
	            {
	                _179 = _90.z;
	            }
	            else
	            {
	                _179 = _91.z;
	            }
	            vec3 _2174 = _178;
	            _2174.z = _179;
	            _178 = _2174;
	            if (false)
	            {
	                _177 = _90.x;
	            }
	            else
	            {
	                _177 = _91.x;
	            }
	            vec3 _2184 = _176;
	            _2184.x = _177;
	            _176 = _2184;
	            if (true)
	            {
	                _177 = _90.y;
	            }
	            else
	            {
	                _177 = _91.y;
	            }
	            vec3 _2194 = _176;
	            _2194.y = _177;
	            _176 = _2194;
	            if (false)
	            {
	                _177 = _90.z;
	            }
	            else
	            {
	                _177 = _91.z;
	            }
	            vec3 _2204 = _176;
	            _2204.z = _177;
	            _176 = _2204;
	            if (true)
	            {
	                _175 = _90.x;
	            }
	            else
	            {
	                _175 = _91.x;
	            }
	            vec3 _2214 = _174;
	            _2214.x = _175;
	            _174 = _2214;
	            if (true)
	            {
	                _175 = _90.y;
	            }
	            else
	            {
	                _175 = _91.y;
	            }
	            vec3 _2224 = _174;
	            _2224.y = _175;
	            _174 = _2224;
	            if (false)
	            {
	                _175 = _90.z;
	            }
	            else
	            {
	                _175 = _91.z;
	            }
	            vec3 _2234 = _174;
	            _2234.z = _175;
	            _174 = _2234;
	            if (false)
	            {
	                _173 = _90.x;
	            }
	            else
	            {
	                _173 = _91.x;
	            }
	            vec3 _2244 = _172;
	            _2244.x = _173;
	            _172 = _2244;
	            if (false)
	            {
	                _173 = _90.y;
	            }
	            else
	            {
	                _173 = _91.y;
	            }
	            vec3 _2254 = _172;
	            _2254.y = _173;
	            _172 = _2254;
	            if (true)
	            {
	                _173 = _90.z;
	            }
	            else
	            {
	                _173 = _91.z;
	            }
	            vec3 _2264 = _172;
	            _2264.z = _173;
	            _172 = _2264;
	            if (true)
	            {
	                _171 = _90.x;
	            }
	            else
	            {
	                _171 = _91.x;
	            }
	            vec3 _2274 = _170;
	            _2274.x = _171;
	            _170 = _2274;
	            if (false)
	            {
	                _171 = _90.y;
	            }
	            else
	            {
	                _171 = _91.y;
	            }
	            vec3 _2284 = _170;
	            _2284.y = _171;
	            _170 = _2284;
	            if (true)
	            {
	                _171 = _90.z;
	            }
	            else
	            {
	                _171 = _91.z;
	            }
	            vec3 _2294 = _170;
	            _2294.z = _171;
	            _170 = _2294;
	            if (false)
	            {
	                _169 = _90.x;
	            }
	            else
	            {
	                _169 = _91.x;
	            }
	            vec3 _2304 = _168;
	            _2304.x = _169;
	            _168 = _2304;
	            if (true)
	            {
	                _169 = _90.y;
	            }
	            else
	            {
	                _169 = _91.y;
	            }
	            vec3 _2314 = _168;
	            _2314.y = _169;
	            _168 = _2314;
	            if (true)
	            {
	                _169 = _90.z;
	            }
	            else
	            {
	                _169 = _91.z;
	            }
	            vec3 _2324 = _168;
	            _2324.z = _169;
	            _168 = _2324;
	            if (true)
	            {
	                _167 = _90.x;
	            }
	            else
	            {
	                _167 = _91.x;
	            }
	            vec3 _2334 = _166;
	            _2334.x = _167;
	            _166 = _2334;
	            if (true)
	            {
	                _167 = _90.y;
	            }
	            else
	            {
	                _167 = _91.y;
	            }
	            vec3 _2344 = _166;
	            _2344.y = _167;
	            _166 = _2344;
	            if (true)
	            {
	                _167 = _90.z;
	            }
	            else
	            {
	                _167 = _91.z;
	            }
	            vec3 _2354 = _166;
	            _2354.z = _167;
	            _166 = _2354;
	            vec3 _161 = _2144;
	            vec3 _160 = _2174;
	            vec3 _159 = _2204;
	            vec3 _158 = _2234;
	            vec3 _157 = _2264;
	            vec3 _156 = _2294;
	            vec3 _155 = _2324;
	            vec3 _154 = _2354;
	            do
	            {
	                vec3 _2358 = _2115.xyz;
	                float _2361 = _2115.w;
	                vec4 _2363 = _163;
	                _2363.x = dot(_2358, _161) - _2361;
	                _2363.y = dot(_2358, _160) - _2361;
	                _2363.z = dot(_2358, _159) - _2361;
	                _2363.w = dot(_2358, _158) - _2361;
	                _163 = _2363;
	                vec4 _2380 = _164;
	                _2380.x = dot(_2358, _157) - _2361;
	                _2380.y = dot(_2358, _156) - _2361;
	                _2380.z = dot(_2358, _155) - _2361;
	                _2380.w = dot(_2358, _154) - _2361;
	                _164 = _2380;
	                if (all(greaterThan(_2363, vec4(0.0))))
	                {
	                    _165 = all(greaterThan(_164, vec4(0.0)));
	                }
	                else
	                {
	                    _165 = false;
	                }
	                if (_165)
	                {
	                    _162 = 1.0;
	                    break;
	                }
	                if (all(lessThan(_163, vec4(0.0))))
	                {
	                    _165 = all(lessThan(_164, vec4(0.0)));
	                }
	                else
	                {
	                    _165 = false;
	                }
	                if (_165)
	                {
	                    _162 = -1.0;
	                    break;
	                }
	                _162 = 0.0;
	                break;
	            } while(false);
	            if (_162 < 0.0)
	            {
	                break;
	            }
	            nBits |= int(1u << uint(i - nStartLight));
	            break;
	        } while(false);
	        if (_346_ladder_break)
	        {
	            break;
	        }
	        i++;
	        continue;
	    }
	    g_LightBins._member0[((((_303 * _296.y) * _300) + (_303 * gl_LaunchIDEXT.y)) + (_295 * gl_LaunchIDEXT.x)) + nMask] = uint(nBits);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
