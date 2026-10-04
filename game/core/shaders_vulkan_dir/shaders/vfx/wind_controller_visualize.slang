//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Wind Controller wireframe visualization";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
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

VS
{
	DynamicCombo( D_BLEND_WEIGHT_COUNT, 0..4 );
	DynamicComboRule( Allow0( D_BLEND_WEIGHT_COUNT ) );
	
	int g_nClipmap < Attribute("Clipmap"); UiType(Slider); >;
	int g_nSampleCount < Attribute("SampleCount"); UiType(Slider); >;
	Texture3D g_tWind < Attribute("Wind"); SrgbRead(false); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3246 (name: WindControllerConstantBuffer_t), member index 0 (name: _m0) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	struct _281
	{
	    vec4 _m0[4];
	};
	
	struct _1521
	{
	    _281 _m0;
	};
	
	struct _995
	{
	    int g_nClipmap;
	    int g_nSampleCount;
	};
	
	layout(set = 0) uniform _995 _Globals_;
	
	struct _1005
	{
	    _1521 _m0;
	    float _m1;
	};
	
	layout(set = 0) uniform _1005 WindControllerConstantBuffer_t;
	
	struct _1288
	{
	    mat4 _m0;
	    vec4 _m1;
	    vec3 _m2;
	};
	
	layout(set = 0) uniform _1288 PerViewConstantBuffer_t;
	
	layout(set = 0, binding = 30) uniform texture3D g_tWind;
	layout(set = 0, binding = 14) uniform sampler AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint;
	
	layout(location = 0) out vec2 output_0;
	layout(location = 1) out vec3 output_1;
	
	void main()
	{
	    uint _12652 = uint(gl_VertexIndex - gl_BaseVertex);
	    uint _21425 = _12652 / 2u;
	    uint _16090 = uint(_Globals_.g_nSampleCount);
	    float _20009 = float(_Globals_.g_nSampleCount);
	    vec2 _4498 = vec2((float(int(_21425 % _16090)) + 0.5) / _20009, (float(int(_21425 / _16090)) + 0.5) / _20009);
	    vec4 _3300 = textureLod(sampler3D(g_tWind, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint), vec3(_4498, 0.5), 0.0);
	    vec3 _24854 = vec3(mix(-WindControllerConstantBuffer_t._m0._m0._m0[_Globals_.g_nClipmap].xy, WindControllerConstantBuffer_t._m0._m0._m0[_Globals_.g_nClipmap].xy, _4498), 0.0);
	    bool _12885;
	    if (_Globals_.g_nClipmap > 0)
	    {
	        _12885 = all(lessThanEqual(abs(_24854.xy), WindControllerConstantBuffer_t._m0._m0._m0[_Globals_.g_nClipmap - 1].xy));
	    }
	    else
	    {
	        _12885 = false;
	    }
	    vec4 _18053;
	    if (_12885)
	    {
	        _18053 = vec4(uintBitsToFloat(0x7fc00000u /* nan */));
	    }
	    else
	    {
	        vec3 _19363;
	        if ((_12652 & 1u) != 0u)
	        {
	            vec2 _13062 = _24854.xy + ((((_3300.xy * 2.0) - vec2(1.0)) * (WindControllerConstantBuffer_t._m0._m0._m0[_Globals_.g_nClipmap].x * WindControllerConstantBuffer_t._m1)) * (2.0 + (_3300.z * 3.0)));
	            vec3 _20488 = _24854;
	            _20488.x = _13062.x;
	            _20488.y = _13062.y;
	            _19363 = _20488;
	        }
	        else
	        {
	            _19363 = _24854;
	        }
	        _18053 = (vec4(((_19363.xyz + PerViewConstantBuffer_t._m2.xyz) - vec3(0.0, 0.0, 1000.0)).xyz, 1.0) + (PerViewConstantBuffer_t._m1 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    }
	    float _21177 = saturate(_3300.z);
	    float _9436 = _21177 * _21177;
	    float _20291 = _9436 * _21177;
	    vec4 _14651 = vec4(1.0, _21177, _9436, _20291);
	    vec2 _10661 = vec2(_9436, _20291) * _9436;
	    output_0 = _4498;
	    output_1 = vec3(dot(_14651, vec4(0.135721385478973388671875, 4.6153926849365234375, -42.6603240966796875, 132.1310882568359375)) + dot(_10661, vec2(-152.9423980712890625, 59.286380767822265625)), dot(_14651, vec4(0.091402612626552581787109375, 2.1941883563995361328125, 4.842966556549072265625, -14.1850337982177734375)) + dot(_10661, vec2(4.277298450469970703125, 2.82956600189208984375)), dot(_14651, vec4(0.106673300266265869140625, 12.64194583892822265625, -60.5820465087890625, 110.36277008056640625)) + dot(_10661, vec2(-89.903106689453125, 27.3482494354248046875))) * vec3((_Globals_.g_nClipmap == 0) ? 1.0 : 0.449999988079071044921875, (_Globals_.g_nClipmap == 1) ? 1.0 : 0.449999988079071044921875, (_Globals_.g_nClipmap == 2) ? 1.0 : 0.449999988079071044921875);
	    vec4 _20857 = _18053;
	    _20857.y = -_18053.y;
	    gl_Position = _20857;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	
	RenderState(DepthEnable, exists(DepthEnable) ? DepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float3 input_1;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float3 input_1 : TEXCOORD1;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    output_0 = float4(input_1, 0.0f);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_1 = stage_input.input_1;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
