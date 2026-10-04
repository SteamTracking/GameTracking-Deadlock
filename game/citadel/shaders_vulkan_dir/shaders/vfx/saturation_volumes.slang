//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Saturation Volumes";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
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
	DynamicCombo( D_SATURATION_MODE, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	float4x4 g_mHighPrecisionWorldFromProjNoJitter < Attribute("HighPrecisionWorldFromProjNoJitter"); >;
	Texture2D g_tGBufferDepth < Attribute("GBufferDepth"); SrgbRead(false); >;
	RWTexture2D<float4> g_tGlowIndex < Attribute("GlowIndexTexture"); >;
	RWTexture2D<float4> g_tHDRColor < Attribute("HDRColor"); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3509 (name: SaturationVolumes_t), member index 6 (name: _m6) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	#extension GL_EXT_shader_image_load_formatted : require
	layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;
	
	struct _1067
	{
	    vec3 _m0;
	    float _m1;
	    float _m2;
	    float _m3;
	};
	
	struct _1587
	{
	    _1067 _m0[4];
	};
	
	struct _1205
	{
	    vec3 _m0;
	    vec3 _m1;
	    float _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	    float _m6;
	};
	
	struct _1485
	{
	    _1205 _m0[4];
	};
	
	struct _1176
	{
	    vec3 _m0;
	    float _m1;
	    vec3 _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	};
	
	struct _2161
	{
	    _1176 _m0[4];
	};
	
	vec4 _3;
	
	struct _1097
	{
	    float _m0;
	    vec3 _m1;
	    vec3 _m2;
	};
	
	layout(set = 0) uniform _1097 PerViewConstantBuffer_t;
	
	struct _1668
	{
	    vec4 g_vPixelToProj;
	    mat4 g_mHighPrecisionWorldFromProj;
	    mat4 g_mHighPrecisionWorldFromProjNoJitter;
	};
	
	layout(set = 0) uniform _1668 _Globals_;
	
	struct _503
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    vec3 _m3;
	    float _m4;
	    vec3 _m5;
	    _1587 _m6;
	    _1485 _m7;
	    _2161 _m8;
	};
	
	layout(set = 0) uniform _503 SaturationVolumes_t;
	
	layout(set = 0, binding = 158) uniform image2D _5852;
	layout(set = 0, binding = 56) uniform texture2D g_tGBufferDepth;
	layout(set = 0, binding = 159) uniform writeonly image2D _3990;
	
	void main()
	{
	    ivec2 _20736 = ivec2(gl_GlobalInvocationID.xy);
	    vec4 _23585 = imageLoad(_5852, _20736);
	    float _5746 = PerViewConstantBuffer_t._m0 / texelFetch(g_tGBufferDepth, ivec2(gl_GlobalInvocationID.xy), 0).x;
	    vec4 _11894 = vec4((vec2(_20736) * _Globals_.g_vPixelToProj.xy) + _Globals_.g_vPixelToProj.zw, 1.0, 1.0);
	    vec4 _14015 = _11894 * _Globals_.g_mHighPrecisionWorldFromProj;
	    vec3 _10521 = _14015.xyz / vec3(_14015.w);
	    vec4 _22905;
	    _22905.x = _10521.x;
	    _22905.y = _10521.y;
	    _22905.z = _10521.z;
	    vec4 _14016 = _11894 * _Globals_.g_mHighPrecisionWorldFromProjNoJitter;
	    vec3 _10522 = _14016.xyz / vec3(_14016.w);
	    vec4 _22906;
	    _22906.x = _10522.x;
	    _22906.y = _10522.y;
	    _22906.z = _10522.z;
	    vec3 _5579 = ((_22905.xyz / vec3(dot(PerViewConstantBuffer_t._m2, _22905.xyz))).xyz * _5746) + PerViewConstantBuffer_t._m1.xyz;
	    vec3 _4939 = ((_22906.xyz / vec3(dot(PerViewConstantBuffer_t._m2, _22906.xyz))).xyz * _5746) + PerViewConstantBuffer_t._m1.xyz;
	    float _13155;
	    _13155 = 0.0;
	    float _22823;
	    uint _23030;
	    uint _24653;
	    uint _16208 = 0u;
	    for (;;)
	    {
	        _23030 = min(4u, SaturationVolumes_t._m0);
	        if (!(_16208 < _23030))
	        {
	            break;
	        }
	        float _15727;
	        do
	        {
	            vec3 _24377 = (_5579.xyz - SaturationVolumes_t._m6._m0[_16208]._m0.xyz).xyz;
	            float _18218 = dot(_24377, _24377);
	            if (_18218 >= SaturationVolumes_t._m6._m0[_16208]._m1)
	            {
	                _15727 = 0.0;
	                break;
	            }
	            _15727 = saturate(1.0 - ((sqrt(_18218) - SaturationVolumes_t._m6._m0[_16208]._m3) / SaturationVolumes_t._m6._m0[_16208]._m2));
	            break;
	        } while(false);
	        _22823 = max(_15727, _13155);
	        _24653 = _16208 + 1u;
	        _13155 = _22823;
	        _16208 = _24653;
	        continue;
	    }
	    float _13156;
	    _13156 = _13155;
	    float _22824;
	    uint _23031;
	    uint _24654;
	    uint _16209 = 0u;
	    for (;;)
	    {
	        _23031 = min(4u, SaturationVolumes_t._m1);
	        if (!(_16209 < _23031))
	        {
	            break;
	        }
	        float _15728;
	        do
	        {
	            vec3 _24378 = (_5579.xyz - SaturationVolumes_t._m7._m0[_16209]._m0.xyz).xyz;
	            float _18219 = dot(_24378, _24378);
	            if (_18219 >= SaturationVolumes_t._m7._m0[_16209]._m2)
	            {
	                _15728 = 0.0;
	                break;
	            }
	            float _12038 = sqrt(_18219);
	            _15728 = saturate(1.0 - ((_12038 - SaturationVolumes_t._m7._m0[_16209]._m5) / SaturationVolumes_t._m7._m0[_16209]._m6)) * saturate((dot((_24378 / vec3(_12038)).xyz, SaturationVolumes_t._m7._m0[_16209]._m1.xyz) - SaturationVolumes_t._m7._m0[_16209]._m4) / max(0.00999999977648258209228515625, SaturationVolumes_t._m7._m0[_16209]._m3 - SaturationVolumes_t._m7._m0[_16209]._m4));
	            break;
	        } while(false);
	        _22824 = max(_15728, _13156);
	        _24654 = _16209 + 1u;
	        _13156 = _22824;
	        _16209 = _24654;
	        continue;
	    }
	    float _13157;
	    _13157 = _13156;
	    float _22825;
	    uint _23032;
	    uint _24655;
	    uint _16210 = 0u;
	    for (;;)
	    {
	        _23032 = min(4u, SaturationVolumes_t._m2);
	        if (!(_16210 < _23032))
	        {
	            break;
	        }
	        float _15729;
	        do
	        {
	            vec3 _19589 = (_5579.xyz - SaturationVolumes_t._m8._m0[_16210]._m0.xyz).xyz;
	            float _8209 = length(_19589 - (SaturationVolumes_t._m8._m0[_16210]._m2.xyz * saturate(dot(_19589, SaturationVolumes_t._m8._m0[_16210]._m2.xyz) * SaturationVolumes_t._m8._m0[_16210]._m5)));
	            if (_8209 >= SaturationVolumes_t._m8._m0[_16210]._m1)
	            {
	                _15729 = 0.0;
	                break;
	            }
	            _15729 = saturate(1.0 - ((_8209 - SaturationVolumes_t._m8._m0[_16210]._m4) / SaturationVolumes_t._m8._m0[_16210]._m3));
	            break;
	        } while(false);
	        _22825 = max(_15729, _13157);
	        _24655 = _16210 + 1u;
	        _13157 = _22825;
	        _16210 = _24655;
	        continue;
	    }
	    float _13158;
	    _13158 = 0.0;
	    float _22826;
	    uint _24656;
	    uint _16211 = 0u;
	    for (;;)
	    {
	        if (!(_16211 < _23030))
	        {
	            break;
	        }
	        float _15730;
	        do
	        {
	            vec3 _24379 = (_4939.xyz - SaturationVolumes_t._m6._m0[_16211]._m0.xyz).xyz;
	            float _18220 = dot(_24379, _24379);
	            if (_18220 >= SaturationVolumes_t._m6._m0[_16211]._m1)
	            {
	                _15730 = 0.0;
	                break;
	            }
	            _15730 = saturate(1.0 - ((sqrt(_18220) - SaturationVolumes_t._m6._m0[_16211]._m3) / SaturationVolumes_t._m6._m0[_16211]._m2));
	            break;
	        } while(false);
	        _22826 = max(_15730, _13158);
	        _24656 = _16211 + 1u;
	        _13158 = _22826;
	        _16211 = _24656;
	        continue;
	    }
	    float _13159;
	    _13159 = _13158;
	    float _22827;
	    uint _24657;
	    uint _16212 = 0u;
	    for (;;)
	    {
	        if (!(_16212 < _23031))
	        {
	            break;
	        }
	        float _15731;
	        do
	        {
	            vec3 _24380 = (_4939.xyz - SaturationVolumes_t._m7._m0[_16212]._m0.xyz).xyz;
	            float _18221 = dot(_24380, _24380);
	            if (_18221 >= SaturationVolumes_t._m7._m0[_16212]._m2)
	            {
	                _15731 = 0.0;
	                break;
	            }
	            float _12044 = sqrt(_18221);
	            _15731 = saturate(1.0 - ((_12044 - SaturationVolumes_t._m7._m0[_16212]._m5) / SaturationVolumes_t._m7._m0[_16212]._m6)) * saturate((dot((_24380 / vec3(_12044)).xyz, SaturationVolumes_t._m7._m0[_16212]._m1.xyz) - SaturationVolumes_t._m7._m0[_16212]._m4) / max(0.00999999977648258209228515625, SaturationVolumes_t._m7._m0[_16212]._m3 - SaturationVolumes_t._m7._m0[_16212]._m4));
	            break;
	        } while(false);
	        _22827 = max(_15731, _13159);
	        _24657 = _16212 + 1u;
	        _13159 = _22827;
	        _16212 = _24657;
	        continue;
	    }
	    float _13160;
	    _13160 = _13159;
	    float _22828;
	    uint _24658;
	    uint _16213 = 0u;
	    for (;;)
	    {
	        if (!(_16213 < _23032))
	        {
	            break;
	        }
	        float _15732;
	        do
	        {
	            vec3 _19590 = (_4939.xyz - SaturationVolumes_t._m8._m0[_16213]._m0.xyz).xyz;
	            float _8210 = length(_19590 - (SaturationVolumes_t._m8._m0[_16213]._m2.xyz * saturate(dot(_19590, SaturationVolumes_t._m8._m0[_16213]._m2.xyz) * SaturationVolumes_t._m8._m0[_16213]._m5)));
	            if (_8210 >= SaturationVolumes_t._m8._m0[_16213]._m1)
	            {
	                _15732 = 0.0;
	                break;
	            }
	            _15732 = saturate(1.0 - ((_8210 - SaturationVolumes_t._m8._m0[_16213]._m4) / SaturationVolumes_t._m8._m0[_16213]._m3));
	            break;
	        } while(false);
	        _22828 = max(_15732, _13160);
	        _24658 = _16213 + 1u;
	        _13160 = _22828;
	        _16213 = _24658;
	        continue;
	    }
	    vec3 _18358 = _23585.xyz;
	    vec3 _25191 = mix((mix(_18358, vec3(dot(_23585.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125))), vec3(SaturationVolumes_t._m4)) * SaturationVolumes_t._m3.xyz).xyz, (_18358 * SaturationVolumes_t._m5.xyz).xyz, vec3(_13157));
	    vec4 _17842 = _23585;
	    _17842.x = _25191.x;
	    _17842.y = _25191.y;
	    _17842.z = _25191.z;
	    imageStore(_5852, ivec2(gl_GlobalInvocationID.xy), _17842);
	    imageStore(_3990, ivec2(gl_GlobalInvocationID.xy), vec4((_13160 > 0.5) ? 0.0039215688593685626983642578125 : 0.0));
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
