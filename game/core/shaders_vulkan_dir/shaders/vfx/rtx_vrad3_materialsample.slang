//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "General shaders for baking material data onto meshes in Hammer";
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
	
	struct MaterialSample_t_natural
	{
	    vec4 m_vPositionWs;
	    vec4 m_vNormalWs;
	    vec4 m_vTexelAxisUWs;
	    vec4 m_vTexelAxisVWs;
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
	    MaterialSample_t_natural _member0[];
	} g_Samples;
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 6, binding = 159, std430) buffer g_Results
	{
	    MaterialSample_t_natural _member0[];
	} g_Results_1;
	
	layout(push_constant, std430) uniform MaterialSamplePushConstants_t_natural
	{
	    int m_nSampleCount;
	    int m_nSamplesPerPoint;
	    uint m_nSeed;
	    int m_nTraceDirections;
	    float m_flMaxDistance;
	    float m_flMinDistance;
	    float m_flPad1;
	    float m_flPad2;
	} g_PushConstants;
	
	layout(location = 0) rayPayloadEXT Payload_t p;
	layout(set = 3, binding = 30) uniform accelerationStructureEXT g_AccelStruct;
	layout(location = 1) rayPayloadEXT PayloadShadow_t p_1;
	
	void main()
	{
	    do
	    {
	        uint nSampleIndex = gl_LaunchIDEXT.x + (gl_LaunchIDEXT.y * gl_LaunchSizeEXT.x);
	        if (nSampleIndex >= uint(g_PushConstants.m_nSampleCount))
	        {
	            break;
	        }
	        vec4 _216 = g_Samples._member0[nSampleIndex].m_vPositionWs;
	        vec4 _215 = g_Samples._member0[nSampleIndex].m_vNormalWs;
	        vec4 _214 = g_Samples._member0[nSampleIndex].m_vTexelAxisUWs;
	        vec4 _213 = g_Samples._member0[nSampleIndex].m_vTexelAxisVWs;
	        int _300 = max(g_PushConstants.m_nSamplesPerPoint, 1);
	        uint _304 = g_PushConstants.m_nSeed + (g_PushConstants.m_nSeed << uint(10));
	        uint _306 = _304 ^ (_304 >> uint(6));
	        uint _308 = _306 + (_306 << uint(3));
	        uint _310 = _308 ^ (_308 >> uint(11));
	        uint _313 = nSampleIndex ^ (_310 + (_310 << uint(15)));
	        uint _315 = _313 + (_313 << uint(10));
	        uint _317 = _315 ^ (_315 >> uint(6));
	        uint _319 = _317 + (_317 << uint(3));
	        uint _321 = _319 ^ (_319 >> uint(11));
	        uint _324 = max((_321 + (_321 << uint(15))), 1u);
	        uint _326 = _324 ^ (_324 << uint(13));
	        uint _328 = _326 ^ (_326 >> uint(17));
	        uint _330 = _328 ^ (_328 << uint(5));
	        uint _336 = _330 ^ (_330 << uint(13));
	        uint _338 = _336 ^ (_336 >> uint(17));
	        uint _340 = _338 ^ (_338 << uint(5));
	        uint nRngState = _340;
	        vec2 _345 = vec2(uintBitsToFloat(1065353216u | (_330 >> uint(9))) - 1.0, uintBitsToFloat(1065353216u | (_340 >> uint(9))) - 1.0);
	        int nSample = 0;
	        vec3 vAlbedoSum = vec3(0.0);
	        vec3 vEmissiveSum = vec3(0.0);
	        vec3 vNormalSum = vec3(0.0);
	        float flRoughnessSum = 0.0;
	        float flMetalnessSum = 0.0;
	        float flHitTSum = 0.0;
	        float flHitCount = 0.0;
	        vec2 vJitter;
	        bool bFrontFaceUnder;
	        bool bBackFaceAbove;
	        bool bUseAbove;
	        vec3 vHitNormalWs;
	        f16vec3 _147;
	        float16_t _148;
	        f16vec3 _149;
	        float16_t _150;
	        f16vec3 _151;
	        f16vec3 _152;
	        float16_t _153;
	        f16vec3 _154;
	        float16_t _155;
	        f16vec3 _156;
	        f16vec3 _157;
	        float16_t _158;
	        f16vec3 _159;
	        float16_t _160;
	        f16vec3 _161;
	        int _200;
	        float _201;
	        vec3 _202;
	        bool _205;
	        int _206;
	        float _207;
	        vec3 _208;
	        bool _209;
	        int _210;
	        float _211;
	        vec3 _212;
	        vec3 _217;
	        vec3 _218;
	        vec3 _229;
	        vec3 _240;
	        vec3 _251;
	        vec3 _262;
	        bool _263;
	        bool _264;
	        float _265;
	        bool _266;
	        float _267;
	        bool _268;
	        float _269;
	        for (;;)
	        {
	            bool _350_ladder_break = false;
	            do
	            {
	                if (!(nSample < _300))
	                {
	                    _350_ladder_break = true;
	                    break;
	                }
	                if (_300 > 1)
	                {
	                    vJitter = fract(_345 + (vec2(0.75487768650054931640625, 0.56984031200408935546875) * float(nSample))) - vec2(0.5);
	                }
	                else
	                {
	                    vJitter = vec2(0.0);
	                }
	                vec3 vOriginWs = (_216.xyz + (_214.xyz * vJitter.x)) + (_213.xyz * vJitter.y);
	                f16vec3 _379 = f16vec3(vec3(0.0));
	                f16vec3 _382 = f16vec3(vec3(0.0));
	                if ((g_PushConstants.m_nTraceDirections & 1) != 0)
	                {
	                    vec3 _394 = -_215.xyz;
	                    vec3 _228 = vOriginWs;
	                    vec3 _227 = _394;
	                    uint _395 = nRngState;
	                    uint _397 = _395 ^ (_395 << uint(13));
	                    uint _399 = _397 ^ (_397 >> uint(17));
	                    uint _401 = _399 ^ (_399 << uint(5));
	                    nRngState = _401;
	                    f16vec3 _406 = f16vec3(vec3(0.0));
	                    p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _229, 3.4028234663852885981170418348452e+38, uintBitsToFloat(1065353216u | (_401 >> uint(9))) - 1.0, -1, false, MaterialDataMinimal_t(_406, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _406, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                    traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, vOriginWs, g_PushConstants.m_flMinDistance, _394, g_PushConstants.m_flMaxDistance, 0);
	                    vec3 _226 = p.vSmoothPositionWs;
	                    vec3 _225 = p.vFaceNormalWs;
	                    vec3 _224 = p.vInterpolatedNormalWs;
	                    float _223 = p.flHitT;
	                    int _222 = p.nInstance;
	                    bool _221 = p.bFlippedNormal;
	                    f16vec3 _169 = p.material.vNormalWs;
	                    float16_t _168 = p.material.flMetalness;
	                    f16vec3 _167 = p.material.vAlbedo;
	                    float16_t _166 = p.material.flRoughness;
	                    f16vec3 _165 = p.material.vEmissive;
	                    float16_t _164 = p.material.flReflectance;
	                    uint _163 = p.material.nMaterialTypeAndFlags;
	                    f16vec4 _162 = p.material.vMaterialBits;
	                    if (p.nInstance != (-1))
	                    {
	                        vec3 _220 = _228;
	                        vec3 _219 = _227;
	                        do
	                        {
	                            vec3 _232 = _226;
	                            vec3 _231 = _225;
	                            float _230 = _223;
	                            f16vec3 _178 = _169;
	                            uint _236 = g_instanceBuffer._member0[uint(_222)].nMaterialFlags_nInstanceFlags;
	                            vec3 _235 = (_220 + (_219 * _230)) + (_231 * ((abs(_220) + vec3(abs(_230))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _234 = _231;
	                            int _233 = int(_236 & 65535u);
	                            if (false)
	                            {
	                                if (false)
	                                {
	                                    _268 = (_233 & 256) != 0;
	                                }
	                                else
	                                {
	                                    _268 = false;
	                                }
	                                if (_268)
	                                {
	                                }
	                                else
	                                {
	                                    if (false)
	                                    {
	                                        _268 = (_233 & 512) != 0;
	                                    }
	                                    else
	                                    {
	                                        _268 = false;
	                                    }
	                                }
	                            }
	                            if (false)
	                            {
	                                _268 = any(notEqual(_232, vec3(3.4028234663852885981170418348452e+38)));
	                            }
	                            else
	                            {
	                                _268 = false;
	                            }
	                            vec3 _509 = _232 - _235;
	                            float _510 = length(_509);
	                            vec3 _239 = _235;
	                            float _238 = 0.0;
	                            vec3 _237 = vec4(_509 / vec3(_510), _510).xyz;
	                            if (_268)
	                            {
	                                _267 = _510;
	                            }
	                            else
	                            {
	                                _267 = 0.0;
	                            }
	                            p_1 = PayloadShadow_t(1.0);
	                            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _239, _238, _237, _267, 1);
	                            if (_268)
	                            {
	                                _267 = p_1.m_flVisibility;
	                            }
	                            else
	                            {
	                                _267 = 0.0;
	                            }
	                            if (_267 == 1.0)
	                            {
	                                _235 = _232;
	                                _234 = vec3(_178);
	                            }
	                            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _240, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_169, _168, _167, _166, _165, _164, _163, _162));
	                            traceRayEXT(g_AccelStruct, 32u, 32u, 0u, 2u, 0u, _235 - ((_234 * 0.5) * 0.5), 0.0, _234, 0.5, 0);
	                            f16vec3 _177 = p.material.vNormalWs;
	                            float16_t _176 = p.material.flMetalness;
	                            f16vec3 _175 = p.material.vAlbedo;
	                            float16_t _174 = p.material.flRoughness;
	                            f16vec3 _173 = p.material.vEmissive;
	                            float16_t _172 = p.material.flReflectance;
	                            uint _171 = p.material.nMaterialTypeAndFlags;
	                            f16vec4 _170 = p.material.vMaterialBits;
	                            if (p.nInstance != (-1))
	                            {
	                                _169 = _177;
	                                _168 = _176;
	                                _167 = _175;
	                                _166 = _174;
	                                _165 = _173;
	                                _164 = _172;
	                                _163 = _171;
	                                _162 = _170;
	                                break;
	                            }
	                            else
	                            {
	                                break;
	                            }
	                            break;
	                        } while(false);
	                    }
	                    _212 = _224;
	                    _211 = _223;
	                    _210 = _222;
	                    _209 = _221;
	                    _161 = _169;
	                    _160 = _168;
	                    _159 = _167;
	                    _158 = _166;
	                    _157 = _165;
	                }
	                else
	                {
	                    _212 = _217;
	                    _211 = 3.4028234663852885981170418348452e+38;
	                    _210 = -1;
	                    _209 = false;
	                    _161 = _379;
	                    _160 = float16_t(0.0);
	                    _159 = f16vec3(vec3(1.0, 0.0, 1.0));
	                    _158 = float16_t(1.0);
	                    _157 = _379;
	                }
	                if ((g_PushConstants.m_nTraceDirections & 2) != 0)
	                {
	                    vec3 _250 = vOriginWs;
	                    vec3 _249 = _215.xyz;
	                    uint _600 = nRngState;
	                    uint _602 = _600 ^ (_600 << uint(13));
	                    uint _604 = _602 ^ (_602 >> uint(17));
	                    uint _606 = _604 ^ (_604 << uint(5));
	                    nRngState = _606;
	                    f16vec3 _611 = f16vec3(vec3(0.0));
	                    p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _251, 3.4028234663852885981170418348452e+38, uintBitsToFloat(1065353216u | (_606 >> uint(9))) - 1.0, -1, false, MaterialDataMinimal_t(_611, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _611, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0))));
	                    traceRayEXT(g_AccelStruct, 0u, 1u, 0u, 2u, 0u, vOriginWs, g_PushConstants.m_flMinDistance, _215.xyz, g_PushConstants.m_flMaxDistance, 0);
	                    vec3 _248 = p.vSmoothPositionWs;
	                    vec3 _247 = p.vFaceNormalWs;
	                    vec3 _246 = p.vInterpolatedNormalWs;
	                    float _245 = p.flHitT;
	                    int _244 = p.nInstance;
	                    bool _243 = p.bFlippedNormal;
	                    f16vec3 _186 = p.material.vNormalWs;
	                    float16_t _185 = p.material.flMetalness;
	                    f16vec3 _184 = p.material.vAlbedo;
	                    float16_t _183 = p.material.flRoughness;
	                    f16vec3 _182 = p.material.vEmissive;
	                    float16_t _181 = p.material.flReflectance;
	                    uint _180 = p.material.nMaterialTypeAndFlags;
	                    f16vec4 _179 = p.material.vMaterialBits;
	                    if (p.nInstance != (-1))
	                    {
	                        vec3 _242 = _250;
	                        vec3 _241 = _249;
	                        do
	                        {
	                            vec3 _254 = _248;
	                            vec3 _253 = _247;
	                            float _252 = _245;
	                            f16vec3 _195 = _186;
	                            uint _258 = g_instanceBuffer._member0[uint(_244)].nMaterialFlags_nInstanceFlags;
	                            vec3 _257 = (_242 + (_241 * _252)) + (_253 * ((abs(_242) + vec3(abs(_252))) * 9.9999997473787516355514526367188e-05));
	                            vec3 _256 = _253;
	                            int _255 = int(_258 & 65535u);
	                            if (false)
	                            {
	                                if (false)
	                                {
	                                    _266 = (_255 & 256) != 0;
	                                }
	                                else
	                                {
	                                    _266 = false;
	                                }
	                                if (_266)
	                                {
	                                }
	                                else
	                                {
	                                    if (false)
	                                    {
	                                        _266 = (_255 & 512) != 0;
	                                    }
	                                    else
	                                    {
	                                        _266 = false;
	                                    }
	                                }
	                            }
	                            if (false)
	                            {
	                                _266 = any(notEqual(_254, vec3(3.4028234663852885981170418348452e+38)));
	                            }
	                            else
	                            {
	                                _266 = false;
	                            }
	                            vec3 _714 = _254 - _257;
	                            float _715 = length(_714);
	                            vec3 _261 = _257;
	                            float _260 = 0.0;
	                            vec3 _259 = vec4(_714 / vec3(_715), _715).xyz;
	                            if (_266)
	                            {
	                                _265 = _715;
	                            }
	                            else
	                            {
	                                _265 = 0.0;
	                            }
	                            p_1 = PayloadShadow_t(1.0);
	                            traceRayEXT(g_AccelStruct, 0u, 255u, 1u, 2u, 1u, _261, _260, _259, _265, 1);
	                            if (_266)
	                            {
	                                _265 = p_1.m_flVisibility;
	                            }
	                            else
	                            {
	                                _265 = 0.0;
	                            }
	                            if (_265 == 1.0)
	                            {
	                                _257 = _254;
	                                _256 = vec3(_195);
	                            }
	                            p = Payload_t(vec3(3.4028234663852885981170418348452e+38), vec3(0.0), _262, 3.4028234663852885981170418348452e+38, 0.0, -1, false, MaterialDataMinimal_t(_186, _185, _184, _183, _182, _181, _180, _179));
	                            traceRayEXT(g_AccelStruct, 32u, 32u, 0u, 2u, 0u, _257 - ((_256 * 0.5) * 0.5), 0.0, _256, 0.5, 0);
	                            f16vec3 _194 = p.material.vNormalWs;
	                            float16_t _193 = p.material.flMetalness;
	                            f16vec3 _192 = p.material.vAlbedo;
	                            float16_t _191 = p.material.flRoughness;
	                            f16vec3 _190 = p.material.vEmissive;
	                            float16_t _189 = p.material.flReflectance;
	                            uint _188 = p.material.nMaterialTypeAndFlags;
	                            f16vec4 _187 = p.material.vMaterialBits;
	                            if (p.nInstance != (-1))
	                            {
	                                _186 = _194;
	                                _185 = _193;
	                                _184 = _192;
	                                _183 = _191;
	                                _182 = _190;
	                                _181 = _189;
	                                _180 = _188;
	                                _179 = _187;
	                                break;
	                            }
	                            else
	                            {
	                                break;
	                            }
	                            break;
	                        } while(false);
	                    }
	                    _208 = _246;
	                    _207 = _245;
	                    _206 = _244;
	                    _205 = _243;
	                    _156 = _186;
	                    _155 = _185;
	                    _154 = _184;
	                    _153 = _183;
	                    _152 = _182;
	                }
	                else
	                {
	                    _208 = _218;
	                    _207 = 3.4028234663852885981170418348452e+38;
	                    _206 = -1;
	                    _205 = false;
	                    _156 = _382;
	                    _155 = float16_t(0.0);
	                    _154 = f16vec3(vec3(1.0, 0.0, 1.0));
	                    _153 = float16_t(1.0);
	                    _152 = _382;
	                }
	                bool _798 = _210 != (-1);
	                if (_798)
	                {
	                    vec3 _204 = _212;
	                    if (_209)
	                    {
	                        _264 = true;
	                    }
	                    else
	                    {
	                        _264 = dot(_204, -_215.xyz) > 0.0;
	                    }
	                    bFrontFaceUnder = !_264;
	                }
	                else
	                {
	                    bFrontFaceUnder = false;
	                }
	                if (_206 != (-1))
	                {
	                    vec3 _203 = _208;
	                    if (_205)
	                    {
	                        _263 = true;
	                    }
	                    else
	                    {
	                        _263 = dot(_203, _215.xyz) > 0.0;
	                    }
	                    bBackFaceAbove = _263;
	                }
	                else
	                {
	                    bBackFaceAbove = false;
	                }
	                if (!_798)
	                {
	                    bUseAbove = true;
	                }
	                else
	                {
	                    if (bBackFaceAbove)
	                    {
	                        if (!bFrontFaceUnder)
	                        {
	                            bUseAbove = true;
	                        }
	                        else
	                        {
	                            bUseAbove = _207 < _211;
	                        }
	                    }
	                    else
	                    {
	                        bUseAbove = false;
	                    }
	                }
	                if (bUseAbove)
	                {
	                    _202 = _208;
	                    _201 = _207;
	                    _200 = _206;
	                    _151 = _156;
	                    _150 = _155;
	                    _149 = _154;
	                    _148 = _153;
	                    _147 = _152;
	                }
	                else
	                {
	                    _202 = _212;
	                    _201 = _211;
	                    _200 = _210;
	                    _151 = _161;
	                    _150 = _160;
	                    _149 = _159;
	                    _148 = _158;
	                    _147 = _157;
	                }
	                if (!(_200 != (-1)))
	                {
	                    vHitNormalWs = vNormalSum;
	                    break;
	                }
	                vec3 _879 = vec3(_151);
	                if (dot(_202, _215.xyz) < 0.0)
	                {
	                    vHitNormalWs = -_879;
	                }
	                else
	                {
	                    vHitNormalWs = _879;
	                }
	                if (bUseAbove)
	                {
	                    _269 = -_201;
	                }
	                else
	                {
	                    _269 = _201;
	                }
	                vAlbedoSum += vec3(_149);
	                vEmissiveSum += vec3(_147);
	                vHitNormalWs = vNormalSum + vHitNormalWs;
	                flRoughnessSum += float(_148);
	                flMetalnessSum += float(_150);
	                flHitTSum += _269;
	                flHitCount += 1.0;
	                break;
	            } while(false);
	            if (_350_ladder_break)
	            {
	                break;
	            }
	            nSample++;
	            vNormalSum = vHitNormalWs;
	            continue;
	        }
	        vec4 _199 = vec4(0.0);
	        vec4 _198 = vec4(0.0);
	        vec4 _197 = vec4(_215.xyz, 0.0);
	        vec4 _196 = vec4(0.0);
	        if (flHitCount > 0.0)
	        {
	            float flOoHitCount = 1.0 / flHitCount;
	            float _921 = length(vNormalSum);
	            _199 = vec4(vAlbedoSum * flOoHitCount, flHitCount / float(_300));
	            _198 = vec4(vEmissiveSum * flOoHitCount, flHitTSum * flOoHitCount);
	            if (_921 > 0.0)
	            {
	                vAlbedoSum = vNormalSum / vec3(_921);
	            }
	            else
	            {
	                vAlbedoSum = _215.xyz;
	            }
	            vec4 _941 = _197;
	            _941.x = vAlbedoSum.x;
	            _941.y = vAlbedoSum.y;
	            _941.z = vAlbedoSum.z;
	            _941.w = flRoughnessSum * flOoHitCount;
	            _197 = _941;
	            vec4 _952 = _196;
	            _952.x = flMetalnessSum * flOoHitCount;
	            _196 = _952;
	        }
	        g_Results_1._member0[nSampleIndex].m_vPositionWs = _199;
	        g_Results_1._member0[nSampleIndex].m_vNormalWs = _198;
	        g_Results_1._member0[nSampleIndex].m_vTexelAxisUWs = _197;
	        g_Results_1._member0[nSampleIndex].m_vTexelAxisVWs = _196;
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
