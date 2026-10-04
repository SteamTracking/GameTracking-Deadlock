//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Wireframe for tools";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Default();
	ToolsUtil();
	VrForward();
	ToolsVis();
}

FEATURES
{
	Feature( F_ALPHA_TEST, 0..1, "" );
	Feature( F_NO_ZTEST, 0..1, "" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vColor      : COLOR0     < Semantic( Color ); >;                                       
	float3 vPositionOs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	StaticCombo( S_REVERSE_DEPTH_BUFFER, 0..1 );
	DynamicCombo( D_DEPTH_BIAS, 0..1 );
	
	float3 g_vGridAxis0 < Attribute("g_vGridAxis0"); UiType(VectorText); >;
	float3 g_vGridAxis1 < Attribute("g_vGridAxis1"); UiType(VectorText); >;
	float3 g_vGridAxis2 < Attribute("g_vGridAxis2"); UiType(VectorText); >;
	float3 g_vGridMax < Attribute("g_vGridMax"); UiType(VectorText); >;
	float3 g_vGridMin < Attribute("g_vGridMin"); UiType(VectorText); >;
	
	// Depth Bias Amount
	float g_DepthBiasAmount < Default(0.005); UiType(Slider); UiGroup("Depth Bias Amount"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 1 (name: g_vGridAxis1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	struct _1295
	{
	    vec3 g_vGridAxis0;
	    vec3 g_vGridAxis1;
	    vec3 g_vGridAxis2;
	    vec3 g_vGridMin;
	    vec3 g_vGridMax;
	};
	
	layout(set = 0) uniform _1295 _Globals_;
	
	struct _1224
	{
	    mat4 _m0;
	    vec4 _m1;
	};
	
	layout(set = 0) uniform _1224 PerViewConstantBuffer_t;
	
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 1) in vec4 vColor;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	
	void main()
	{
	    float _16863 = mix(_Globals_.g_vGridMin.x, _Globals_.g_vGridMax.x, vPositionOs.x);
	    float _22467 = mix(_Globals_.g_vGridMin.y, _Globals_.g_vGridMax.y, vPositionOs.y);
	    vec4 _18068 = (vec4((((_Globals_.g_vGridAxis0 * _16863) + (_Globals_.g_vGridAxis1 * _22467)).xyz + _Globals_.g_vGridAxis2).xyz, 1.0) + (PerViewConstantBuffer_t._m1 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    output_0 = vec3(_16863, _22467, 0.0);
	    output_1 = vColor;
	    _18068.y = -_18068.y;
	    gl_Position = _18068;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_ALPHA_TEST, F_ALPHA_TEST );
	StaticCombo( S_NO_ZTEST, F_NO_ZTEST );
	StaticCombo( S_REVERSE_DEPTH_BUFFER, 0..1 );
	DynamicCombo( D_TRANSLUCENT, 0..1 );
	DynamicCombo( D_SHOW_FRACTIONAL_GRID, 0..1 );
	
	float g_fGridSpacing < Attribute("g_fGridSpacing"); UiType(Slider); >;
	float g_fInvGridSpacing < Attribute("g_fInvGridSpacing"); UiType(Slider); >;
	int g_n1024InchMask < Attribute("g_n1024InchMask"); UiType(Slider); >;
	int g_n64InchMask < Attribute("g_n64InchMask"); UiType(Slider); >;
	float4 g_v1024InchHighlightColor < Attribute("g_v1024InchHighlightColor"); UiType(VectorText); >;
	float4 g_v64InchHighlightColor < Attribute("g_v64InchHighlightColor"); UiType(VectorText); >;
	float4 g_vFractionalGridColor < Attribute("g_vFractionalGridColor"); UiType(VectorText); >;
	float3 g_vGridAxis0 < Attribute("g_vGridAxis0"); UiType(VectorText); >;
	float3 g_vGridAxis1 < Attribute("g_vGridAxis1"); UiType(VectorText); >;
	float3 g_vGridAxis2 < Attribute("g_vGridAxis2"); UiType(VectorText); >;
	float4 g_vOriginColor < Attribute("g_vOriginColor"); UiType(VectorText); >;
	float4 g_vSmallGridColor < Attribute("g_vSmallGridColor"); UiType(VectorText); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 1 (name: g_vGridAxis1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	vec4 _3;
	
	struct _1318
	{
	    mat4 _m0;
	    vec2 _m1;
	    vec2 _m2;
	    vec3 _m3;
	};
	
	layout(set = 1) uniform _1318 PerViewConstantBuffer_t;
	
	struct _1980
	{
	    vec3 g_vGridAxis0;
	    vec3 g_vGridAxis1;
	    vec3 g_vGridAxis2;
	    float g_fGridSpacing;
	    float g_fInvGridSpacing;
	    vec4 g_vSmallGridColor;
	    vec4 g_v64InchHighlightColor;
	    vec4 g_v1024InchHighlightColor;
	    vec4 g_vOriginColor;
	    int g_n64InchMask;
	    int g_n1024InchMask;
	};
	
	layout(set = 1) uniform _1980 _Globals_;
	
	layout(location = 0) in vec3 input_0;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    vec2 _22106 = fwidth(input_0.xy);
	    vec2 _17305 = (((gl_FragCoord.xy - PerViewConstantBuffer_t._m1) * PerViewConstantBuffer_t._m2) * vec2(2.0, -2.0)) + vec2(-1.0, 1.0);
	    vec2 _18599 = vec2(1.0) - saturate((_22106 - vec2(12.0)) * vec2(0.083333335816860198974609375));
	    vec4 _13136;
	    float _16305;
	    int _17133;
	    _13136 = vec4(0.0);
	    _16305 = 0.0;
	    _17133 = 0;
	    float _5490;
	    vec4 _13137;
	    float _16306;
	    int _17134;
	    float _17017 = -0.25;
	    for (;;)
	    {
	        if (!(_17017 <= 0.25))
	        {
	            break;
	        }
	        _13137 = _13136;
	        _16306 = _16305;
	        _17134 = _17133;
	        int _3633;
	        float _5489;
	        float _23914;
	        vec4 _14211;
	        float _17018 = -0.25;
	        for (;;)
	        {
	            if (!(_17018 <= 0.25))
	            {
	                break;
	            }
	            _3633 = _17134 + 1;
	            vec3 _7727 = cross(_Globals_.g_vGridAxis0, _Globals_.g_vGridAxis1);
	            vec4 _18372 = vec4(_17305 + (PerViewConstantBuffer_t._m2 * vec2(_17018, _17017)), 1.0, 1.0) * PerViewConstantBuffer_t._m0;
	            vec3 _10521 = _18372.xyz / vec3(_18372.w);
	            vec4 _22905;
	            _22905.x = _10521.x;
	            _22905.y = _10521.y;
	            _22905.z = _10521.z;
	            vec3 _24006 = normalize(_22905.xyz - PerViewConstantBuffer_t._m3.xyz);
	            vec3 _9746 = (PerViewConstantBuffer_t._m3.xyz + (_24006 * (dot(_Globals_.g_vGridAxis2 - PerViewConstantBuffer_t._m3.xyz, _7727) / dot(_24006, _7727)))) - _Globals_.g_vGridAxis2;
	            vec2 _3719 = (vec2(dot(_Globals_.g_vGridAxis0, _9746), dot(_Globals_.g_vGridAxis1, _9746)) * _Globals_.g_fInvGridSpacing).xy;
	            vec2 _15975 = round(_3719);
	            vec2 _4840 = vec2(1.0) - saturate(abs(_3719 - _15975) / (_22106 * (0.699999988079071044921875 * _Globals_.g_fInvGridSpacing)));
	            float _13224 = _4840.x;
	            float _7629 = _4840.y;
	            _23914 = _16306 + max(_13224, _7629);
	            if (_13224 > _7629)
	            {
	                int _6461 = int(_15975.x * _Globals_.g_fGridSpacing);
	                vec4 _21710;
	                if ((_6461 & _Globals_.g_n64InchMask) == 0)
	                {
	                    _21710 = mix(_Globals_.g_vSmallGridColor, _Globals_.g_v64InchHighlightColor, vec4(_18599.x));
	                }
	                else
	                {
	                    _21710 = _Globals_.g_vSmallGridColor;
	                }
	                vec4 _7079;
	                if ((_6461 & _Globals_.g_n1024InchMask) == 0)
	                {
	                    _7079 = _Globals_.g_v1024InchHighlightColor;
	                }
	                else
	                {
	                    _7079 = _21710;
	                }
	                vec4 _14210;
	                if (_6461 == 0)
	                {
	                    _14210 = _Globals_.g_vOriginColor;
	                }
	                else
	                {
	                    _14210 = _7079;
	                }
	                _14211 = _13137 + _14210;
	            }
	            else
	            {
	                int _6460 = int(_15975.y * _Globals_.g_fGridSpacing);
	                vec4 _21709;
	                if ((_6460 & _Globals_.g_n64InchMask) == 0)
	                {
	                    _21709 = mix(_Globals_.g_vSmallGridColor, _Globals_.g_v64InchHighlightColor, vec4(_18599.y));
	                }
	                else
	                {
	                    _21709 = _Globals_.g_vSmallGridColor;
	                }
	                vec4 _7078;
	                if ((_6460 & _Globals_.g_n1024InchMask) == 0)
	                {
	                    _7078 = _Globals_.g_v1024InchHighlightColor;
	                }
	                else
	                {
	                    _7078 = _21709;
	                }
	                vec4 _14209;
	                if (_6460 == 0)
	                {
	                    _14209 = _Globals_.g_vOriginColor;
	                }
	                else
	                {
	                    _14209 = _7078;
	                }
	                _14211 = _13137 + _14209;
	            }
	            _5489 = _17018 + 0.25;
	            _13137 = _14211;
	            _16306 = _23914;
	            _17134 = _3633;
	            _17018 = _5489;
	            continue;
	        }
	        _5490 = _17017 + 0.25;
	        _13136 = _13137;
	        _16305 = _16306;
	        _17133 = _17134;
	        _17017 = _5490;
	        continue;
	    }
	    float _16034 = 1.0 / float(_17133);
	    vec4 _5645 = _13136 * _16034;
	    _5645.w = _5645.w * (_16305 * _16034);
	    output_0 = _5645;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
