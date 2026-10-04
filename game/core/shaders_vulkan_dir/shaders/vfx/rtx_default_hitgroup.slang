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
	Feature( F_TRANSLUCENT, 0..1, "Translucent" );
}

COMMON
{
	#include "system.fxc"
}

RTX
{
	StaticCombo( S_TRANSLUCENT, F_TRANSLUCENT );
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL: 5326
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
	#extension GL_EXT_shader_16bit_storage : require
	#if defined(GL_AMD_gpu_shader_half_float)
	#extension GL_AMD_gpu_shader_half_float : require
	#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
	#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
	#else
	#error No extension available for FP16.
	#endif
	#extension GL_EXT_ray_tracing : require
	#extension GL_EXT_nonuniform_qualifier : require
	
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
	
	struct _Array_natural_vector_int_4_8
	{
	    ivec4 data[8];
	};
	
	struct GeometryInfo_t_natural
	{
	    ivec4 m_nVertexAndIndexBuffers;
	    ivec4 m_nBufferBindOffsetBytes;
	    ivec4 m_nBufferStrideInBytes;
	    ivec4 m_vNormalFieldInfo;
	    ivec4 m_vTangentFieldInfo;
	    _Array_natural_vector_int_4_8 m_vTexCoordFieldInfo;
	    _Array_natural_vector_int_4_8 m_vColorFieldInfo;
	};
	
	struct BuiltInTriangleIntersectionAttributes
	{
	    vec2 barycentrics;
	};
	
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
	
	uint _331;
	
	struct PayloadShadow_t
	{
	    float m_flVisibility;
	};
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData
	{
	    float _member0[];
	} g_MaterialData_1;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_2
	{
	    int _member0[];
	} g_MaterialData_3;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_Geometries
	{
	    GeometryInfo_t_natural _member0[];
	} g_Geometries_1;
	
	layout(set = 3, binding = 33, std430) readonly buffer g_Indices
	{
	    uint _member0[];
	} g_Indices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices
	{
	    float _member0[];
	} g_Vertices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices_2
	{
	    uint _member0[];
	} g_Vertices_3[];
	
	hitAttributeEXT BuiltInTriangleIntersectionAttributes attrs;
	layout(location = 0) rayPayloadInEXT Payload_t payload;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D[65536];
	layout(set = 3, binding = 14) uniform sampler g_Sampler;
	
	void main()
	{
	    uint _350 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    vec3 _353 = vec3(g_MaterialData_1._member0[_350 / 4u], g_MaterialData_1._member0[(_350 + 4u) / 4u], g_MaterialData_1._member0[(_350 + 8u) / 4u]);
	    int _352 = g_MaterialData_3._member0[(_350 + 16u) / 4u];
	    int _351 = g_MaterialData_3._member0[(_350 + 24u) / 4u];
	    uvec3 _385;
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _458 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _385 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_458 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_458 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_458 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _437 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _438 = _437 & 4294967292u;
	            uint _56 = _438 / 4u;
	            uint _59 = (_438 + 4u) / 4u;
	            uint _442 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_56] & 4294901760u) >> uint(16);
	            uint _443 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_59] & 65535u;
	            uvec3 _386;
	            if (_437 == _438)
	            {
	                _386 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_56] & 65535u, _442, _443);
	            }
	            else
	            {
	                _386 = uvec3(_442, _443, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_59] & 4294901760u) >> uint(16));
	            }
	            _385 = _386;
	            break;
	        }
	        break;
	    } while(false);
	    uint _72 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _479 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _385) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    uint _480 = _479.x;
	    vec3 _349 = vec3(g_Vertices_1[nonuniformEXT(_72)]._member0[_480 / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_480 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_480 + 8u) / 4u]);
	    uint _484 = _479.y;
	    vec3 _348 = vec3(g_Vertices_1[nonuniformEXT(_72)]._member0[_484 / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_484 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_484 + 8u) / 4u]);
	    uint _488 = _479.z;
	    vec3 _347 = vec3(g_Vertices_1[nonuniformEXT(_72)]._member0[_488 / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_488 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_72)]._member0[(_488 + 8u) / 4u]);
	    vec3 _344;
	    vec3 _345;
	    vec3 _346;
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	    {
	        ivec4 _378 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _101 = uint(_378[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	        uint _507 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	        ivec4 _376 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _377 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _523 = (uvec3(uint(_376[_507])) * _385) + uvec3(uint(_377[_507]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	        {
	            uint _738 = _523.x;
	            _346 = vec3(g_Vertices_1[nonuniformEXT(_101)]._member0[_738 / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_738 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_738 + 8u) / 4u]);
	            uint _742 = _523.y;
	            _345 = vec3(g_Vertices_1[nonuniformEXT(_101)]._member0[_742 / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_742 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_742 + 8u) / 4u]);
	            uint _746 = _523.z;
	            _344 = vec3(g_Vertices_1[nonuniformEXT(_101)]._member0[_746 / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_746 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_101)]._member0[(_746 + 8u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	            {
	                uint _631 = _523.x;
	                uvec2 _633 = uvec2(g_Vertices_3[nonuniformEXT(_101)]._member0[_631 / 4u], _331);
	                uint _634 = _523.y;
	                uvec2 _337 = uvec2(g_Vertices_3[nonuniformEXT(_101)]._member0[_634 / 4u], g_Vertices_3[nonuniformEXT(_101)]._member0[(_634 + 4u) / 4u]);
	                uint _637 = _523.z;
	                uvec2 _336 = uvec2(g_Vertices_3[nonuniformEXT(_101)]._member0[_637 / 4u], g_Vertices_3[nonuniformEXT(_101)]._member0[(_637 + 4u) / 4u]);
	                uint _640 = _633.x;
	                vec2 _649 = ((vec2(float(_640 & 65535u), float((_640 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                float _650 = _649.x;
	                float _655 = (1.0 - abs(_650)) - abs(_649.y);
	                vec3 _656 = vec3(_650, _649.y, _655);
	                float _658 = saturate(-_655);
	                vec2 _664 = _649 + mix(vec2(_658), vec2(-_658), greaterThanEqual(_649, vec2(0.0)));
	                _656.x = _664.x;
	                _656.y = _664.y;
	                vec3 _379 = normalize(_656);
	                _346 = _379;
	                vec2 _682 = ((vec2(float(_337.x & 65535u), float((_337.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                float _683 = _682.x;
	                float _688 = (1.0 - abs(_683)) - abs(_682.y);
	                vec3 _689 = vec3(_683, _682.y, _688);
	                float _691 = saturate(-_688);
	                vec2 _697 = _682 + mix(vec2(_691), vec2(-_691), greaterThanEqual(_682, vec2(0.0)));
	                _689.x = _697.x;
	                _689.y = _697.y;
	                vec3 _380 = normalize(_689);
	                _345 = _380;
	                vec2 _715 = ((vec2(float(_336.x & 65535u), float((_336.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                float _716 = _715.x;
	                float _721 = (1.0 - abs(_716)) - abs(_715.y);
	                vec3 _722 = vec3(_716, _715.y, _721);
	                float _724 = saturate(-_721);
	                vec2 _730 = _715 + mix(vec2(_724), vec2(-_724), greaterThanEqual(_715, vec2(0.0)));
	                _722.x = _730.x;
	                _722.y = _730.y;
	                vec3 _381 = normalize(_722);
	                _344 = _381;
	            }
	            else
	            {
	                uint _103 = _523.x / 4u;
	                float _539 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_103] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _542 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_103] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _546 = (1.0 - abs(_539)) - abs(_542);
	                vec3 _547 = vec3(_539, _542, _546);
	                float _549 = saturate(-_546);
	                vec2 _550 = vec2(_539, _542);
	                vec2 _556 = _550 + mix(vec2(_549), vec2(-_549), greaterThanEqual(_550, vec2(0.0)));
	                _547.x = _556.x;
	                _547.y = _556.y;
	                vec3 _382 = normalize(_547);
	                _346 = _382;
	                uint _106 = _523.y / 4u;
	                float _572 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_106] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _575 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_106] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _579 = (1.0 - abs(_572)) - abs(_575);
	                vec3 _580 = vec3(_572, _575, _579);
	                float _582 = saturate(-_579);
	                vec2 _583 = vec2(_572, _575);
	                vec2 _589 = _583 + mix(vec2(_582), vec2(-_582), greaterThanEqual(_583, vec2(0.0)));
	                _580.x = _589.x;
	                _580.y = _589.y;
	                vec3 _383 = normalize(_580);
	                _345 = _383;
	                uint _109 = _523.z / 4u;
	                float _605 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_109] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _608 = (float((g_Vertices_3[nonuniformEXT(_101)]._member0[_109] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                float _612 = (1.0 - abs(_605)) - abs(_608);
	                vec3 _613 = vec3(_605, _608, _612);
	                float _615 = saturate(-_612);
	                vec2 _616 = vec2(_605, _608);
	                vec2 _622 = _616 + mix(vec2(_615), vec2(-_615), greaterThanEqual(_616, vec2(0.0)));
	                _613.x = _622.x;
	                _613.y = _622.y;
	                vec3 _384 = normalize(_613);
	                _344 = _384;
	            }
	        }
	    }
	    else
	    {
	        _346 = vec3(0.0);
	        _345 = vec3(0.0);
	        _344 = vec3(0.0);
	    }
	    vec2 _343 = vec2(0.0);
	    vec2 _342 = vec2(0.0);
	    vec2 _341 = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	    {
	        ivec4 _375 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _158 = uint(_375[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	        uint _766 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	        ivec4 _373 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _374 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _782 = (uvec3(uint(_373[_766])) * _385) + uvec3(uint(_374[_766]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	        {
	            uint _896 = _782.x;
	            _343 = vec2(g_Vertices_1[nonuniformEXT(_158)]._member0[_896 / 4u], g_Vertices_1[nonuniformEXT(_158)]._member0[(_896 + 4u) / 4u]);
	            uint _899 = _782.y;
	            _342 = vec2(g_Vertices_1[nonuniformEXT(_158)]._member0[_899 / 4u], g_Vertices_1[nonuniformEXT(_158)]._member0[(_899 + 4u) / 4u]);
	            uint _902 = _782.z;
	            _341 = vec2(g_Vertices_1[nonuniformEXT(_158)]._member0[_902 / 4u], g_Vertices_1[nonuniformEXT(_158)]._member0[(_902 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	            {
	                uint _170 = _782.x / 4u;
	                _343 = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_158)]._member0[_170], g_Vertices_3[nonuniformEXT(_158)]._member0[_170] >> uint(16)) & uvec2(65535u))));
	                uint _173 = _782.y / 4u;
	                _342 = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_158)]._member0[_173], g_Vertices_3[nonuniformEXT(_158)]._member0[_173] >> uint(16)) & uvec2(65535u))));
	                uint _176 = _782.z / 4u;
	                _341 = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_158)]._member0[_176], g_Vertices_3[nonuniformEXT(_158)]._member0[_176] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                {
	                    uint _160 = _782.x / 4u;
	                    uint _795 = g_Vertices_3[nonuniformEXT(_158)]._member0[_160] & 65535u;
	                    int _372;
	                    if (_795 > 32767u)
	                    {
	                        _372 = int(4294901760u | _795);
	                    }
	                    else
	                    {
	                        _372 = int(_795);
	                    }
	                    uint _808 = (g_Vertices_3[nonuniformEXT(_158)]._member0[_160] & 4294901760u) >> uint(16);
	                    int _371;
	                    if (_808 > 32767u)
	                    {
	                        _371 = int(4294901760u | _808);
	                    }
	                    else
	                    {
	                        _371 = int(_808);
	                    }
	                    _343 = vec2(max(float(_372) * 3.0518509447574615478515625e-05, -1.0), max(float(_371) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _163 = _782.y / 4u;
	                    uint _822 = g_Vertices_3[nonuniformEXT(_158)]._member0[_163] & 65535u;
	                    int _370;
	                    if (_822 > 32767u)
	                    {
	                        _370 = int(4294901760u | _822);
	                    }
	                    else
	                    {
	                        _370 = int(_822);
	                    }
	                    uint _835 = (g_Vertices_3[nonuniformEXT(_158)]._member0[_163] & 4294901760u) >> uint(16);
	                    int _369;
	                    if (_835 > 32767u)
	                    {
	                        _369 = int(4294901760u | _835);
	                    }
	                    else
	                    {
	                        _369 = int(_835);
	                    }
	                    _342 = vec2(max(float(_370) * 3.0518509447574615478515625e-05, -1.0), max(float(_369) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _166 = _782.z / 4u;
	                    uint _849 = g_Vertices_3[nonuniformEXT(_158)]._member0[_166] & 65535u;
	                    int _368;
	                    if (_849 > 32767u)
	                    {
	                        _368 = int(4294901760u | _849);
	                    }
	                    else
	                    {
	                        _368 = int(_849);
	                    }
	                    uint _862 = (g_Vertices_3[nonuniformEXT(_158)]._member0[_166] & 4294901760u) >> uint(16);
	                    int _367;
	                    if (_862 > 32767u)
	                    {
	                        _367 = int(4294901760u | _862);
	                    }
	                    else
	                    {
	                        _367 = int(_862);
	                    }
	                    _341 = vec2(max(float(_368) * 3.0518509447574615478515625e-05, -1.0), max(float(_367) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    vec4 _932 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _366 = _932;
	    vec3 _933 = _932.xyz;
	    vec3 _934 = _933 * vec3(0.077399380505084991455078125);
	    vec3 _937 = pow((_933 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _363;
	    if (_932.x <= 0.040449999272823333740234375)
	    {
	        _363 = _934.x;
	    }
	    else
	    {
	        _363 = _937.x;
	    }
	    float _364;
	    if (_932.y <= 0.040449999272823333740234375)
	    {
	        _364 = _934.y;
	    }
	    else
	    {
	        _364 = _937.y;
	    }
	    float _365;
	    if (_932.z <= 0.040449999272823333740234375)
	    {
	        _365 = _934.z;
	    }
	    else
	    {
	        _365 = _937.z;
	    }
	    vec3 _962 = vec3(_363, _364, _365);
	    vec4 _964 = _366;
	    _964.x = _962.x;
	    _964.y = _962.y;
	    _964.z = _962.z;
	    _366 = _964;
	    f16vec3 _971 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_971, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _971, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.flHitT = gl_RayTmaxEXT;
	    vec3 _340 = _346;
	    vec3 _339 = _345;
	    vec3 _338 = _344;
	    vec3 _362;
	    do
	    {
	        vec3 _995 = ((_340 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_339 * attrs.barycentrics.x)) + (_338 * attrs.barycentrics.y);
	        if (all(equal(_995, vec3(0.0))))
	        {
	            _362 = vec3(0.0);
	            break;
	        }
	        mat3x4 _1001 = transpose(gl_WorldToObjectEXT);
	        mat3 _361;
	        mat3 _1004 = _361;
	        _1004[0] = _1001[0].xyz;
	        _1004[1] = _1001[1].xyz;
	        _1004[2] = _1001[2].xyz;
	        _361 = _1004;
	        _362 = normalize(_1004 * _995);
	        break;
	    } while(false);
	    f16vec3 _1015 = f16vec3(_362);
	    payload.material.vNormalWs = _1015;
	    payload.vInterpolatedNormalWs = vec3(_1015);
	    mat3x4 _1026 = transpose(gl_WorldToObjectEXT);
	    mat3 _360;
	    mat3 _1029 = _360;
	    _1029[0] = _1026[0].xyz;
	    _1029[1] = _1026[1].xyz;
	    _1029[2] = _1026[2].xyz;
	    _360 = _1029;
	    payload.vFaceNormalWs = normalize(_1029 * cross(_348 - _349, _347 - _349));
	    if ((_351 & 1) != 0)
	    {
	        if (gl_HitKindEXT == 255u)
	        {
	            payload.vFaceNormalWs = -payload.vFaceNormalWs;
	            payload.vInterpolatedNormalWs = -payload.vInterpolatedNormalWs;
	            payload.material.vNormalWs = -payload.material.vNormalWs;
	            payload.bFlippedNormal = true;
	        }
	    }
	    vec3 _1067 = normalize(cross(_348 - _349, _347 - _349));
	    vec3 _387[3] = vec3[](_349, _348, _347);
	    vec3 _388[3] = vec3[](_346, _345, _344);
	    vec3 _1083 = ((_387[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_387[1] * attrs.barycentrics.x)) + (_387[2] * attrs.barycentrics.y);
	    vec3 _354[3];
	    _354[0] = _1083 - (_388[0] * dot(_1083 - _387[0], _388[0]));
	    _354[1] = _1083 - (_388[1] * dot(_1083 - _387[1], _388[1]));
	    _354[2] = _1083 - (_388[2] * dot(_1083 - _387[2], _388[2]));
	    vec3 _1123 = ((_354[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_354[1] * attrs.barycentrics.x)) + (_354[2] * attrs.barycentrics.y);
	    vec3 _355[3];
	    _355[0] = cross(_387[0] - _387[1], _1067);
	    _355[1] = cross(_387[1] - _387[2], _1067);
	    _355[2] = cross(_387[2] - _387[0], _1067);
	    float _356 = dot(_1123 - _1083, _1067);
	    vec3 _357 = _1123;
	    int _358 = 0;
	    for (;;)
	    {
	        bool _1139_ladder_break = false;
	        do
	        {
	            if (!(_358 < 3))
	            {
	                _1139_ladder_break = true;
	                break;
	            }
	            if (_356 > 0.00999999977648258209228515625)
	            {
	                _1139_ladder_break = true;
	                break;
	            }
	            if (dot(_355[_358], _355[_358]) == 0.0)
	            {
	                break;
	            }
	            _355[_358] = normalize(_355[_358]);
	            int _359 = 0;
	            for (;;)
	            {
	                if (!(_359 < 3))
	                {
	                    break;
	                }
	                vec3 _1177 = _388[_359] - (_355[_358] * dot(_355[_358], _388[_359]));
	                _354[_359] = _1083 - (_1177 * dot(_1083 - _387[_359], _1177));
	                _359++;
	                continue;
	            }
	            vec3 _1201 = ((_354[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_354[1] * attrs.barycentrics.x)) + (_354[2] * attrs.barycentrics.y);
	            _356 = dot(_1201 - _1083, _1067);
	            _357 = _1201;
	            break;
	        } while(false);
	        if (_1139_ladder_break)
	        {
	            break;
	        }
	        _358++;
	        continue;
	    }
	    if (!(_356 > 0.00999999977648258209228515625))
	    {
	        _357 = vec3(3.4028234663852885981170418348452e+38);
	    }
	    payload.vSmoothPositionWs = _357;
	    if (any(notEqual(_357, vec3(3.4028234663852885981170418348452e+38))))
	    {
	        payload.vSmoothPositionWs = gl_ObjectToWorldEXT * vec4(payload.vSmoothPositionWs.xyz, 1.0);
	    }
	    payload.material.vAlbedo = f16vec3(_353);
	    if (_352 >= 0)
	    {
	        payload.material.vAlbedo = f16vec3(textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D[uint(_352)], g_Sampler)), ((_343 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_342 * attrs.barycentrics.x)) + (_341 * attrs.barycentrics.y), 0.0).xyz);
	    }
	    payload.material.vAlbedo *= f16vec3(_964.xyz);
	    payload.nInstance = int(uint(gl_InstanceID));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
