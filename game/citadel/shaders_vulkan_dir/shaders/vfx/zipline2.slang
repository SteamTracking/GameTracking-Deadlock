//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Zipline shader (v2).";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
}

FEATURES
{
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float3 vPositionOs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	
	StructuredBuffer g_ZiplineAttachments < Attribute("g_ZiplineAttachments"); >;
	StructuredBuffer g_ZiplineSplineNodes < Attribute("g_ZiplineSplineNodes"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	int g_nZiplineAttachments < Attribute("g_nZiplineAttachments"); UiType(Slider); >;
	
	// Attachment
	bool g_bAttachmentTaper < Default(1); UiType(CheckBox); UiGroup("Attachment"); >;
	float g_flAttachmentTaperEndWidth < Default(100); Range(0, 100); UiType(Slider); UiGroup("Attachment"); >;
	float g_flAttachmentTaperStartWidth < Default(10); Range(0, 100); UiType(Slider); UiGroup("Attachment"); >;
	
	// Random Oscillation
	float g_flAmplitude < Default(10); Range(0, 30); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flAmplitudeBoosted < Default(20); Range(0, 30); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flAnimationSharpness < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flAnimationSharpnessBoosted < Default(0.5); Range(0.01, 0.99); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flLuminanceIfBloomEnabledBoosted < Default(1); Range(0, 16); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flLuminanceIfBloomEnabledHighlighted < Default(1); Range(0, 16); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flSpeed < Default(10); Range(0, 30); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flSpeedBoosted < Default(20); Range(0, 30); UiType(Slider); UiGroup("Random Oscillation"); >;
	float g_flWavelength < Default(20); Range(1, 200); UiType(Slider); UiGroup("Random Oscillation"); Expression(1/this); >;
	float g_flWavelengthBoosted < Default(10); Range(1, 200); UiType(Slider); UiGroup("Random Oscillation"); Expression(1/this); >;
	
	// Color
	float g_flBrightness < Default(0.5); Range(0, 4); UiType(Slider); UiGroup("Color"); >;
	float g_flBrightnessHighlighted < Default(0.5); Range(0, 20); UiType(Slider); UiGroup("Color"); >;
	
	// Traveling Wave
	float g_flTravelingWaveLeftAmplitude < Default(8); Range(0, 100); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveLeftFreq < Default(1); Range(0, 100); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveLeftSpeed < Default(0.2); Range(0, 10); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveSpeedMult < Default(1); Range(0, 10); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveUpAmplitude < Default(15); Range(0, 100); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveUpFreq < Default(0.5); Range(0, 100); UiType(Slider); UiGroup("Traveling Wave"); >;
	float g_flTravelingWaveUpSpeed < Default(0.1); Range(0, 10); UiType(Slider); UiGroup("Traveling Wave"); >;
	
	// Traveling Radius
	float3 g_flTravelingWaveRadiusAmplitude < Default3(1, 0.5, 0.15); Range3(0, 0, 0, 10, 10, 10); UiType(VectorText); UiGroup("Traveling Radius"); >;
	float3 g_flTravelingWaveRadiusFreq < Default3(0.3, 1, 3); Range3(0, 0, 0, 10, 10, 10); UiType(VectorText); UiGroup("Traveling Radius"); >;
	float3 g_flTravelingWaveRadiusSpeed < Default3(0.1, 0.3, 0.6); Range3(0, 0, 0, 10, 10, 10); UiType(VectorText); UiGroup("Traveling Radius"); >;
	float2 g_vRadiusRange < Default2(1, 1); Range2(0, 0, 200, 200); UiType(VectorText); UiGroup("Traveling Radius"); >;
	float2 g_vRadiusRangeBoosted < Default2(1, 2); Range2(0, 0, 200, 200); UiType(VectorText); UiGroup("Traveling Radius"); >;
	float2 g_vRadiusRangeHighlighted < Default2(1, 2); Range2(0, 0, 200, 200); UiType(VectorText); UiGroup("Traveling Radius"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 22 (name: g_flTravelingWaveRadiusAmplitude) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	out float gl_ClipDistance[1];
	
	struct _1247
	{
	    vec4 _m0[4];
	};
	
	struct _505
	{
	    _1247 _m0;
	    vec4 _m1;
	};
	
	layout(set = 0, binding = 30, std430) readonly buffer g_ZiplineSplineNodes
	{
	    _505 _m0[];
	} g_ZiplineSplineNodes_1;
	
	struct _1532
	{
	    float g_flWavelength;
	    float g_flWavelengthBoosted;
	    float g_flAmplitude;
	    float g_flAmplitudeBoosted;
	    float g_flSpeed;
	    float g_flSpeedBoosted;
	    float g_flAnimationSharpness;
	    float g_flAnimationSharpnessBoosted;
	    float g_flLuminanceIfBloomEnabledBoosted;
	    float g_flLuminanceIfBloomEnabledHighlighted;
	    float g_flBrightness;
	    float g_flBrightnessHighlighted;
	    float g_flTravelingWaveLeftAmplitude;
	    float g_flTravelingWaveUpAmplitude;
	    float g_flTravelingWaveLeftFreq;
	    float g_flTravelingWaveUpFreq;
	    float g_flTravelingWaveLeftSpeed;
	    float g_flTravelingWaveUpSpeed;
	    float g_flTravelingWaveSpeedMult;
	    int g_bAttachmentTaper;
	    float g_flAttachmentTaperStartWidth;
	    float g_flAttachmentTaperEndWidth;
	    vec3 g_flTravelingWaveRadiusAmplitude;
	    vec3 g_flTravelingWaveRadiusFreq;
	    vec3 g_flTravelingWaveRadiusSpeed;
	    vec2 g_vRadiusRange;
	    vec2 g_vRadiusRangeBoosted;
	    vec2 g_vRadiusRangeHighlighted;
	    uint g_nZiplineAttachments;
	};
	
	layout(set = 0) uniform _1532 _Globals_;
	
	layout(set = 0, binding = 31, std430) readonly buffer g_ZiplineAttachments
	{
	    vec4 _m0[];
	} g_ZiplineAttachments_1;
	
	struct _1445
	{
	    mat4 _m0;
	    vec4 _m1;
	    float _m2;
	    vec4 _m3;
	    vec3 _m4;
	};
	
	layout(set = 0) uniform _1445 PerViewConstantBuffer_t;
	
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec3 output_1;
	
	void main()
	{
	    uint _24589 = uint(gl_InstanceIndex - gl_BaseInstance);
	    int _4117 = int(g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[1].w);
	    vec4 _5949 = g_ZiplineSplineNodes_1._m0[_24589]._m1;
	    bool _5663 = (_4117 & 8) != 0;
	    bool _4881 = (_4117 & 32) != 0;
	    float _22781;
	    if ((_4117 & 1) != 0)
	    {
	        _22781 = 0.5 * (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].w + g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].w);
	    }
	    else
	    {
	        _22781 = 0.0;
	    }
	    vec4 _12886;
	    if ((_5663 ? true : _4881) ? ((_4117 & 16) != 0) : false)
	    {
	        float _20190 = ((0.4124000072479248046875 * _5949.x) + (0.3576000034809112548828125 * _5949.y)) + (0.1805000007152557373046875 * _5949.z);
	        float _20191 = ((0.2125999927520751953125 * _5949.x) + (0.715200006961822509765625 * _5949.y)) + (0.072200000286102294921875 * _5949.z);
	        float _12454 = ((0.01930000074207782745361328125 * _5949.x) + (0.119199998676776885986328125 * _5949.y)) + (0.950500011444091796875 * _5949.z);
	        vec3 _12885;
	        do
	        {
	            float _16830 = (_20190 + _20191) + _12454;
	            if (_16830 > 0.0)
	            {
	                _12885 = vec3(vec3(_20190, _20191, _12454).xy / vec2(_16830), _20191);
	                break;
	            }
	            _12885 = vec3(0.0);
	            break;
	        } while(false);
	        float _22302;
	        if (_5663)
	        {
	            _22302 = _Globals_.g_flLuminanceIfBloomEnabledBoosted;
	        }
	        else
	        {
	            _22302 = _Globals_.g_flLuminanceIfBloomEnabledHighlighted;
	        }
	        vec3 _10405 = _12885;
	        _10405.z = _22302;
	        vec3 _20309;
	        do
	        {
	            if (any(equal(_10405, vec3(0.0))))
	            {
	                _20309 = vec3(0.0);
	                break;
	            }
	            float _13858 = _22302 / _12885.y;
	            _20309 = vec3(_13858 * _12885.x, _22302, _13858 * ((1.0 - _12885.x) - _12885.y));
	            break;
	        } while(false);
	        vec4 _23303 = _5949;
	        _23303.x = ((3.240600109100341796875 * _20309.x) - (1.53719997406005859375 * _20309.y)) - (0.498600006103515625 * _20309.z);
	        _23303.y = (((-0.968900024890899658203125) * _20309.x) + (1.87580001354217529296875 * _20309.y)) + (0.0414999984204769134521484375 * _20309.z);
	        _23303.z = ((0.0557000003755092620849609375 * _20309.x) - (0.203999996185302734375 * _20309.y)) + (1.05700004100799560546875 * _20309.z);
	        _12886 = _23303;
	    }
	    else
	    {
	        _12886 = _5949;
	    }
	    float _20310;
	    if (_4881)
	    {
	        _20310 = _Globals_.g_flBrightnessHighlighted;
	    }
	    else
	    {
	        _20310 = _Globals_.g_flBrightness;
	    }
	    vec4 _9543 = _12886;
	    _9543.w = _12886.w * _20310;
	    float _13136;
	    vec3 _16324;
	    _13136 = 0.0;
	    _16324 = g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].xyz;
	    float _17391;
	    float _20901;
	    vec3 _22220;
	    float _17017 = 0.0625;
	    for (;;)
	    {
	        if (!(_17017 < vPositionOs.x))
	        {
	            break;
	        }
	        float _17519 = _17017 * _17017;
	        float _19645 = 1.0 - _17017;
	        float _10385 = _19645 * _19645;
	        _22220 = (((g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].xyz * (_19645 * _10385)) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[1].xyz * ((3.0 * _10385) * _17017))) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].xyz * ((3.0 * _19645) * _17519))) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].xyz * (_17519 * _17017));
	        _17391 = _13136 + length(_22220 - _16324);
	        _20901 = _17017 + 0.0625;
	        _13136 = _17391;
	        _16324 = _22220;
	        _17017 = _20901;
	        continue;
	    }
	    float _17518 = vPositionOs.x * vPositionOs.x;
	    float _19644 = 1.0 - vPositionOs.x;
	    float _10384 = _19644 * _19644;
	    float _7345 = 3.0 * _10384;
	    vec3 _22219 = (((g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].xyz * (_19644 * _10384)) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[1].xyz * (_7345 * vPositionOs.x))) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].xyz * ((3.0 * _19644) * _17518))) + (g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].xyz * (_17518 * vPositionOs.x));
	    float _3484 = g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].w + (_13136 + length(_22219 - _16324));
	    vec3 _24860 = normalize((((g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[1].xyz - g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].xyz) * _7345) + ((g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].xyz - g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[1].xyz) * ((6.0 * _19644) * vPositionOs.x))) + ((g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].xyz - g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].xyz) * (3.0 * _17518)));
	    vec3 _10746 = normalize(cross(mix(vec3(0.0, 0.0, 1.0), vec3(1.0, 0.0, 0.0), bvec3(abs(_24860.z) > 0.9900000095367431640625)), _24860));
	    vec3 _21827 = cross(_24860, _10746);
	    float _12887;
	    if (_5663)
	    {
	        _12887 = _Globals_.g_flWavelengthBoosted;
	    }
	    else
	    {
	        _12887 = _Globals_.g_flWavelength;
	    }
	    float _12888;
	    if (_5663)
	    {
	        _12888 = _Globals_.g_flAmplitudeBoosted;
	    }
	    else
	    {
	        _12888 = _Globals_.g_flAmplitude;
	    }
	    float _12889;
	    if (_5663)
	    {
	        _12889 = _Globals_.g_flSpeedBoosted;
	    }
	    else
	    {
	        _12889 = _Globals_.g_flSpeed;
	    }
	    float _12890;
	    if (_5663)
	    {
	        _12890 = _Globals_.g_flAnimationSharpnessBoosted;
	    }
	    else
	    {
	        _12890 = _Globals_.g_flAnimationSharpness;
	    }
	    vec2 _21709;
	    if (_5663)
	    {
	        _21709 = _Globals_.g_vRadiusRangeBoosted;
	    }
	    else
	    {
	        vec2 _12501;
	        if (_4881)
	        {
	            _12501 = _Globals_.g_vRadiusRangeHighlighted;
	        }
	        else
	        {
	            _12501 = _Globals_.g_vRadiusRange;
	        }
	        _21709 = _12501;
	    }
	    float _12891;
	    if (_Globals_.g_bAttachmentTaper != 0)
	    {
	        float _13155;
	        _13155 = 10000000000.0;
	        uint _4108;
	        float _18530;
	        uint _16208 = 0u;
	        for (;;)
	        {
	            if (!(_16208 < _Globals_.g_nZiplineAttachments))
	            {
	                break;
	            }
	            _18530 = min(_13155, length(g_ZiplineAttachments_1._m0[_16208].xyz - _22219) - g_ZiplineAttachments_1._m0[_16208].w);
	            _4108 = _16208 + 1u;
	            _13155 = _18530;
	            _16208 = _4108;
	            continue;
	        }
	        _12891 = (saturate((_13155 - _Globals_.g_flAttachmentTaperEndWidth) / (_Globals_.g_flAttachmentTaperStartWidth - _Globals_.g_flAttachmentTaperEndWidth)) * (-1.0)) + 1.0;
	    }
	    else
	    {
	        _12891 = 1.0;
	    }
	    float _23727;
	    if ((_4117 & 64) != 0)
	    {
	        vec3 _14660 = _22219 - g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[0].xyz;
	        vec3 _9139 = _22219 - g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].xyz;
	        _23727 = saturate((sqrt(min(dot(_14660, _14660), dot(_9139, _9139))) - 30.0) * 0.0333333350718021392822265625);
	    }
	    else
	    {
	        _23727 = 1.0;
	    }
	    float _12502;
	    if (vPositionOs.x < 0.5)
	    {
	        _12502 = mix(g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[2].w, _22781, saturate(vPositionOs.x * 8.0));
	    }
	    else
	    {
	        _12502 = mix(g_ZiplineSplineNodes_1._m0[_24589]._m0._m0[3].w, _22781, saturate(4.0 * (2.0 - (2.0 * vPositionOs.x))));
	    }
	    vec2 _13156;
	    _13156 = vec2(0.0);
	    vec2 _16191;
	    int _17947;
	    int _16209 = -1;
	    for (;;)
	    {
	        if (!(_16209 <= 1))
	        {
	            break;
	        }
	        _17947 = _16209 + 1;
	        vec3 _20544 = vec3(1.0, 0.0500000007450580596923828125, 0.00999999977648258209228515625);
	        vec3 _23546 = vec3(0.100000001490116119384765625, 0.5, 1.0);
	        float _19905 = (_3484 * _12887) * _20544[_17947];
	        float _4211 = floor(_19905) + float(_16209);
	        vec4 _21373 = abs((fract(vec4((0.5 * (_19905 - _4211)) + 0.25)) * 2.0) - vec4(1.0));
	        float _10837 = ((_12889 * PerViewConstantBuffer_t._m2) * (1.0 / (float(_17947 * 10) + 1.0))) + fract(sin(dot(vec2(_4211).xy, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875);
	        float _12998 = floor(_10837);
	        float _5799 = _10837 - _12998;
	        float _14346 = 1.0 / (1.0 - _12890);
	        bool _19488 = _5799 > 0.5;
	        float _9386;
	        if (_19488)
	        {
	            _9386 = 1.0 - _5799;
	        }
	        else
	        {
	            _9386 = _5799;
	        }
	        float _18766 = pow(0.5, 1.0 - _14346) * pow(_9386, _14346);
	        float _18229;
	        if (_19488)
	        {
	            _18229 = 1.0 - _18766;
	        }
	        else
	        {
	            _18229 = _18766;
	        }
	        _16191 = _13156 + (mix(((vec2(fract(sin(dot(vec2(_4211, _12998).xy, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875), fract(sin(dot(vec2(_4211, -_12998).xy, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875)) * 2.0) - vec2(1.0)) * _23546[_17947], ((vec2(fract(sin(dot(vec2(_4211, _12998 + 1.0).xy, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875), fract(sin(dot(vec2(_4211, (-1.0) - _12998).xy, vec2(12.98980045318603515625, 78.233001708984375))) * 43758.546875)) * 2.0) - vec2(1.0)) * _23546[_17947], vec2(_18229)) * ((_21373 * _21373) * (vec4(3.0) - (_21373 * 2.0))).x);
	        _13156 = _16191;
	        _16209 = _17947;
	        continue;
	    }
	    vec3 _4221 = _Globals_.g_flTravelingWaveRadiusFreq * 0.0030000000260770320892333984375;
	    vec4 _21368 = abs((fract(vec4((_4221.x * _3484) - (PerViewConstantBuffer_t._m2 * _Globals_.g_flTravelingWaveRadiusSpeed.x))) * 2.0) - vec4(1.0));
	    vec4 _21369 = abs((fract(vec4((_4221.y * _3484) - (PerViewConstantBuffer_t._m2 * _Globals_.g_flTravelingWaveRadiusSpeed.y))) * 2.0) - vec4(1.0));
	    vec4 _21370 = abs((fract(vec4((_4221.z * _3484) - (PerViewConstantBuffer_t._m2 * _Globals_.g_flTravelingWaveRadiusSpeed.z))) * 2.0) - vec4(1.0));
	    float _19746 = (_12502 * _12891) * _23727;
	    vec2 _3512 = (vPositionOs.yz * (mix(_21709.x, _21709.y, pow(saturate((((((_21368 * _21368) * (vec4(3.0) - (_21368 * 2.0))).x * _Globals_.g_flTravelingWaveRadiusAmplitude.x) + (((_21369 * _21369) * (vec4(3.0) - (_21369 * 2.0))).x * _Globals_.g_flTravelingWaveRadiusAmplitude.y)) + (((_21370 * _21370) * (vec4(3.0) - (_21370 * 2.0))).x * _Globals_.g_flTravelingWaveRadiusAmplitude.z)) / dot(_Globals_.g_flTravelingWaveRadiusAmplitude, vec3(1.0))) * _12891, 2.0)) * _12502)) + ((_13156 * _12888) * _19746).xy;
	    vec4 _21371 = abs((fract(vec4((_3484 * (0.0030000000260770320892333984375 * _Globals_.g_flTravelingWaveLeftFreq)) - ((PerViewConstantBuffer_t._m2 * _Globals_.g_flTravelingWaveLeftSpeed) * _Globals_.g_flTravelingWaveSpeedMult))) * 2.0) - vec4(1.0));
	    vec4 _21372 = abs((fract(vec4(((_3484 * (0.00150000001303851604461669921875 * _Globals_.g_flTravelingWaveUpFreq)) - ((PerViewConstantBuffer_t._m2 * _Globals_.g_flTravelingWaveUpSpeed) * _Globals_.g_flTravelingWaveSpeedMult)) + 0.25)) * 2.0) - vec4(1.0));
	    vec3 _5578 = (_22219 + ((_10746 * _3512.x) + (_21827 * _3512.y))) + (((_10746 * ((((_21371 * _21371) * (vec4(3.0) - (_21371 * 2.0))).x - 0.5) * _Globals_.g_flTravelingWaveLeftAmplitude)) + (_21827 * ((((_21372 * _21372) * (vec4(3.0) - (_21372 * 2.0))).x - 0.5) * _Globals_.g_flTravelingWaveUpAmplitude))) * _19746);
	    vec4 _18256 = (vec4(_5578.xyz, 1.0) + (PerViewConstantBuffer_t._m3 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = _9543;
	    output_1 = _5578 - PerViewConstantBuffer_t._m4.xyz;
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(vec4(_5578.xyz, 1.0), PerViewConstantBuffer_t._m1.xyzw);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	
	// Traveling Radius
	float2 g_vRadiusRange < Default2(1, 1); Range2(0, 0, 200, 200); UiType(VectorText); UiGroup("Traveling Radius"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space1)
	{
	    uint PerViewConstantBufferCitadel_t_1_m0 : packoffset(c4);
	    uint PerViewConstantBufferCitadel_t_1_m1 : packoffset(c4.y);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float4 PerViewConstantBuffer_t_1_m0 : packoffset(c16);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c22);
	};
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    uint _Globals_1_g_sPointClamp : packoffset(c2);
	    float2 _Globals_1_g_vRadiusRange : packoffset(c20);
	};
	
	Texture2D<float4> g_bindless_Texture2D_float4[65536] : register(t46, space4);
	SamplerState g_bindless_Sampler[2048] : register(s29, space4);
	
	static float4 gl_FragCoord;
	static bool gl_FrontFacing;
	static float4 input_0;
	static float4 output_0;
	static float4 output_1;
	
	struct PS_INPUT
	{
	    float4 input_0 : TEXCOORD0;
	    float4 gl_FragCoord : SV_Position;
	    bool gl_FrontFacing : SV_IsFrontFace;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	    float4 output_1 : SV_Target1;
	};
	
	void MainPs_inner()
	{
	    int3 _17020 = int3(uint3(uint2(gl_FragCoord.xy), 0u));
	    float4 _3300 = g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t_1_m0].Load(int3(_17020.xy, _17020.z));
	    float _17621 = _3300.x;
	    float _13466 = (-((_17621 * PerViewConstantBuffer_t_1_m0.x) + PerViewConstantBuffer_t_1_m0.y)) / ((_17621 * PerViewConstantBuffer_t_1_m0.z) + PerViewConstantBuffer_t_1_m0.w);
	    float _24582 = min(_13466, 1.0f / gl_FragCoord.w);
	    float _13413 = max(_Globals_1_g_vRadiusRange.x, _Globals_1_g_vRadiusRange.y);
	    float _7766 = input_0.w / _13413;
	    float2 _11084 = (gl_FragCoord.xy * PerViewConstantBuffer_t_1_m1.xy).xy;
	    float _8730;
	    if (gl_FragCoord.z > float((min16float)f16tof32(min16uint(uint((min16uint)f32tof16(min16float(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t_1_m1].Sample(g_bindless_Sampler[_Globals_1_g_sPointClamp], _11084).x))) & 4294967294u))))
	    {
	        float _15529 = _7766 * _24582;
	        float _12501;
	        if (gl_FrontFacing)
	        {
	            _12501 = -_15529;
	        }
	        else
	        {
	            _12501 = _15529;
	        }
	        _8730 = _12501;
	    }
	    else
	    {
	        if (_24582 >= _13466)
	        {
	            discard;
	        }
	        if (!gl_FrontFacing)
	        {
	            discard;
	        }
	        _8730 = _7766 * (2.0f * _13413);
	    }
	    float4 _14437 = float4(float3((min16float3)f16tof32(min16uint3(uint3((min16uint3)f32tof16(min16float3((input_0 * _8730).xyz * 2.0f)))))), 5.9604644775390625e-08f);
	    bool4 _21909 = (gl_FragCoord.z > float((min16float)f16tof32(min16uint(uint((min16uint)f32tof16(min16float(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t_1_m1].Sample(g_bindless_Sampler[_Globals_1_g_sPointClamp], _11084).x))) & 4294967294u)))).xxxx;
	    output_0 = float4(_21909.x ? 0.0f.xxxx.x : _14437.x, _21909.y ? 0.0f.xxxx.y : _14437.y, _21909.z ? 0.0f.xxxx.z : _14437.z, _21909.w ? 0.0f.xxxx.w : _14437.w);
	    output_1 = float4(_21909.x ? _14437.x : 0.0f.xxxx.x, _21909.y ? _14437.y : 0.0f.xxxx.y, _21909.z ? _14437.z : 0.0f.xxxx.z, _21909.w ? _14437.w : 0.0f.xxxx.w);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    gl_FrontFacing = stage_input.gl_FrontFacing;
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(translucent, true);
	BoolAttribute(NoZPrepass, true);
	Float3Attribute(OcclusionCullingBoundsExpand, max(g_vRadiusRange.x,g_vRadiusRange.y));
	
}
