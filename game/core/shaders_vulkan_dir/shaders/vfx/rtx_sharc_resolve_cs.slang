//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "SHARC radiance cache resolve for rtx_pathtracer";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_60
	// Programs: cs
}

MODES
{
	Default();
}

FEATURES
{
}

COMMON
{
	#include "system.fxc"
}

CS
{
	
	RWStructuredBuffer g_SharcAccumulation < Attribute("SharcAccumulationBuffer"); >;
	RWStructuredBuffer g_SharcHashEntries < Attribute("SharcHashEntriesBuffer"); >;
	RWStructuredBuffer g_SharcResolved < Attribute("SharcResolvedBuffer"); >;
	float g_flSharcRadianceScale < Attribute("SharcRadianceScale"); UiType(Slider); >;
	int g_nSharcAccumulationFrameCount < Attribute("SharcAccumulationFrameCount"); UiType(Slider); >;
	int g_nSharcHashEntriesCount < Attribute("SharcHashEntriesCount"); UiType(Slider); >;
	int g_nSharcStaleFrameMax < Attribute("SharcStaleFrameMax"); UiType(Slider); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// Reading types other than 32-bit from ByteAddressBuffer not yet supported, unless SM 6.2 and native 16-bit types are enabled.
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
	#if defined(GL_ARB_gpu_shader_int64)
	#extension GL_ARB_gpu_shader_int64 : require
	#else
	#error No extension available for 64-bit integers.
	#endif
	layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;
	
	struct _1005
	{
	    uvec4 _m0;
	};
	
	struct _1038
	{
	    f16vec4 _m0;
	    uint _m1;
	    uint _m2;
	};
	
	struct _1023
	{
	    uint g_nSharcHashEntriesCount;
	    float g_flSharcRadianceScale;
	    uint g_nSharcAccumulationFrameCount;
	    uint g_nSharcStaleFrameMax;
	};
	
	layout(set = 0) uniform _1023 _Globals_;
	
	layout(set = 0, binding = 158, std430) buffer undetermined
	{
	    uint64_t _m0[];
	} undetermined_1;
	
	layout(set = 0, binding = 159, std430) buffer undetermined_2
	{
	    _1005 _m0[];
	} undetermined_3;
	
	layout(set = 0, binding = 160, std430) buffer undetermined_4
	{
	    _1038 _m0[];
	} undetermined_5;
	
	void main()
	{
	    uint _4860 = gl_GlobalInvocationID.x + (gl_GlobalInvocationID.y * 512u);
	    do
	    {
	        if (_4860 >= _Globals_.g_nSharcHashEntriesCount)
	        {
	            break;
	        }
	        uint64_t _15571 = undetermined_1._m0[_4860];
	        if (_15571 == 0ul)
	        {
	            break;
	        }
	        uvec4 _8600 = undetermined_3._m0[_4860]._m0;
	        f16vec4 _8524 = undetermined_5._m0[_4860]._m0;
	        uint _24371 = undetermined_5._m0[_4860]._m1;
	        uint _22627 = undetermined_5._m0[_4860]._m2;
	        vec3 _15551 = vec3(float(_8524.x), float(_8524.y), float(_8524.z));
	        float _13893 = float(_8524.w);
	        float _8594 = float(_8600.w);
	        uint _8387 = (_24371 & 65535u) + 1u;
	        uint _22587;
	        if (_8594 != 0.0)
	        {
	            _22587 = 0u;
	        }
	        else
	        {
	            _22587 = ((_24371 >> uint(16)) & 65535u) + 1u;
	        }
	        if (_22587 >= clamp(_Globals_.g_nSharcStaleFrameMax, 8u, 1024u))
	        {
	            undetermined_1._m0[_4860] = 0ul;
	            undetermined_3._m0[_4860]._m0 = uvec4(0u);
	            undetermined_5._m0[_4860]._m0 = f16vec4(float16_t(0.0));
	            undetermined_5._m0[_4860]._m1 = 0u;
	            undetermined_5._m0[_4860]._m2 = 0u;
	            break;
	        }
	        else
	        {
	            if (_8594 == 0.0)
	            {
	                undetermined_5._m0[_4860]._m1 = _24371 + 65537u;
	                break;
	            }
	        }
	        uint _13137;
	        uint _13960;
	        uint _16306;
	        float _17115;
	        vec3 _24234;
	        if (_13893 == 0.0)
	        {
	            uint _21405 = _4860 + 1u;
	            uint _20147 = min((_4860 + 9u), _Globals_.g_nSharcHashEntriesCount);
	            uint _23989;
	            uint _13136;
	            uint _16305;
	            vec3 _16479;
	            float _17114;
	            uint _17190;
	            uint _13039 = _21405;
	            for (;;)
	            {
	                if (!(_13039 < _20147))
	                {
	                    _13136 = _22587;
	                    _16305 = _22627;
	                    _17114 = _13893;
	                    _17190 = _8387;
	                    _16479 = _15551;
	                    break;
	                }
	                if (undetermined_1._m0[_13039] == _15571)
	                {
	                    _13136 = 0u;
	                    _16305 = undetermined_5._m0[_13039]._m2;
	                    _17114 = float(undetermined_5._m0[_13039]._m0.w);
	                    _17190 = (undetermined_5._m0[_13039]._m1 & 65535u) + 1u;
	                    _16479 = vec3(float(undetermined_5._m0[_13039]._m0.x), float(undetermined_5._m0[_13039]._m0.y), float(undetermined_5._m0[_13039]._m0.z));
	                    break;
	                }
	                _23989 = _13039 + 1u;
	                _13039 = _23989;
	                continue;
	            }
	            _13137 = _13136;
	            _16306 = _16305;
	            _17115 = _17114;
	            _13960 = _17190;
	            _24234 = _16479;
	        }
	        else
	        {
	            _13137 = _22587;
	            _16306 = _22627;
	            _17115 = _13893;
	            _13960 = _8387;
	            _24234 = _15551;
	        }
	        uint _24755 = clamp(_Globals_.g_nSharcAccumulationFrameCount, 1u, 1024u);
	        bool _6797 = _13960 > _24755;
	        float _24080;
	        if (_6797)
	        {
	            _24080 = _17115 * (float(_24755) / float(_13960));
	        }
	        else
	        {
	            _24080 = _17115;
	        }
	        float _13263 = _24080 + _8594;
	        float _8580 = 1.0 / _13263;
	        vec3 _8538 = (_24234 * (_24080 * _8580)) + ((vec3(_8600.xyz) * (1.0 / (_Globals_.g_flSharcRadianceScale * max(_8594, 9.9999999747524270787835121154785e-07)))) * (_8594 * _8580));
	        undetermined_5._m0[_4860]._m0 = f16vec4(float16_t(min(_8538.x, 65504.0)), float16_t(min(_8538.y, 65504.0)), float16_t(min(_8538.z, 65504.0)), float16_t(min(_13263, 65504.0)));
	        undetermined_5._m0[_4860]._m1 = (_6797 ? _24755 : _13960) | (_13137 << uint(16));
	        undetermined_5._m0[_4860]._m2 = _16306;
	        undetermined_3._m0[_4860]._m0 = uvec4(0u);
	        break;
	    } while(false);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
