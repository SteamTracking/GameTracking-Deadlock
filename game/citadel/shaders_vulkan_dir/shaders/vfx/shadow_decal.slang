//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Splats Decal Shadows";
	DevShader = true;
	Version = 1;
	
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

struct VS_INPUT
{
	float3 vPositionOs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	
	StructuredBuffer g_ShadowDecalInfo < Attribute("g_ShadowDecalInfo"); >;
	int g_nStartDecal < Attribute("g_nStartDecal"); UiType(Slider); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1766
	{
	    float4 _m0;
	    float4 _m1;
	    column_major float4x4 _m2;
	    int _m3;
	    float _m4;
	    float _m5;
	    float _m6;
	    float4 _m7;
	};
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    int _Globals_1_g_nStartDecal : packoffset(c0);
	};
	
	ByteAddressBuffer g_ShadowDecalInfo : register(t30, space0);
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c24);
	};
	
	
	static float4 gl_Position;
	static int gl_InstanceIndex;
	static int gl_BaseInstanceARB;
	cbuffer SPIRV_Cross_VertexInfo
	{
	    int SPIRV_Cross_BaseVertex;
	    int SPIRV_Cross_BaseInstance;
	};
	
	static float3 vPositionOs;
	static uint output_0;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint gl_InstanceIndex : SV_InstanceID;
	};
	
	struct PS_INPUT
	{
	    nointerpolation uint output_0 : TEXCOORD0;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    uint _24513 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
	    uint _6225 = _24513 + uint(_Globals_1_g_nStartDecal);
	    float _7521 = vPositionOs.z + 0.5f;
	    float4 _21562 = mul(PerViewConstantBuffer_t_1_m0, (float4(float3(mad(vPositionOs.xy, asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).xy * lerp(asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).z, 1.0f, _7521), asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).xy), lerp(asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).z, asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).w, _7521)).xyz, 1.0f) + (PerViewConstantBuffer_t_1_m1 * 1.0f)).xyzw);
	    output_0 = _24513;
	    _21562.y = -_21562.y;
	    gl_Position = _21562;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    gl_InstanceIndex = int(stage_input.gl_InstanceIndex);
	    gl_BaseInstanceARB = SPIRV_Cross_BaseInstance;
	    vPositionOs = stage_input.vPositionOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	DynamicCombo( D_SELF_SHADOW, 0..4 );
	
	StructuredBuffer g_ShadowDecalInfo < Attribute("g_ShadowDecalInfo"); >;
	float g_flOoNumShadowMaps < Attribute("g_flOoNumShadowMaps"); UiType(Slider); >;
	int g_nStartDecal < Attribute("g_nStartDecal"); UiType(Slider); >;
	int g_nTemporalJitterIndex < Attribute("TemporalJitterIndex"); UiType(Slider); >;
	Texture2D g_tDecalShadowAtlas < Attribute("g_tDecalShadowAtlas"); SrgbRead(false); >;
	Texture2D g_tDecalShadowDepthAtlasNoCmp < Attribute("g_tDecalShadowDepthAtlasNoCmp"); SrgbRead(false); >;
	Texture2D g_tGBufferDepth < Attribute("SceneDepth"); SrgbRead(false); >;
	Texture2D g_tGBufferTarget0 < Attribute("GBufferTarget0"); SrgbRead(false); >;
	Texture2D g_tVeilFrontDepth < Attribute("VeilFrontDepth"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1766
	{
	    float4 _m0;
	    float4 _m1;
	    column_major float4x4 _m2;
	    int _m3;
	    float _m4;
	    float _m5;
	    float _m6;
	    float4 _m7;
	};
	
	static float4 _3;
	static float3 _4;
	
	static const float _3010[7] = { 0.11122000217437744140625f, 0.107798002660274505615234375f, 0.0981509983539581298828125f, 0.083953000605106353759765625f, 0.067457996308803558349609375f, 0.0509199984371662139892578125f, 0.0361079983413219451904296875f };
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    int _Globals_1_g_nStartDecal : packoffset(c0);
	    float _Globals_1_g_flOoNumShadowMaps : packoffset(c0.y);
	};
	
	ByteAddressBuffer g_ShadowDecalInfo : register(t30, space1);
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c4);
	    float2 PerViewConstantBuffer_t_1_m1 : packoffset(c21);
	};
	
	Texture2D<float4> g_tGBufferDepth : register(t32, space1);
	Texture2D<float4> g_tVeilFrontDepth : register(t33, space1);
	Texture2D<float4> g_tGBufferTarget0 : register(t31, space1);
	Texture2D<float4> g_tDecalShadowAtlas : register(t34, space1);
	SamplerState AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint : register(s18, space1);
	
	static float4 gl_FragCoord;
	static uint input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    nointerpolation uint input_0 : TEXCOORD0;
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    uint _6225 = input_0 + uint(_Globals_1_g_nStartDecal);
	    float4x4 _24370 = asfloat(uint4x4(g_ShadowDecalInfo.Load(_6225 * 128 + 32), g_ShadowDecalInfo.Load(_6225 * 128 + 48), g_ShadowDecalInfo.Load(_6225 * 128 + 64), g_ShadowDecalInfo.Load(_6225 * 128 + 80), g_ShadowDecalInfo.Load(_6225 * 128 + 36), g_ShadowDecalInfo.Load(_6225 * 128 + 52), g_ShadowDecalInfo.Load(_6225 * 128 + 68), g_ShadowDecalInfo.Load(_6225 * 128 + 84), g_ShadowDecalInfo.Load(_6225 * 128 + 40), g_ShadowDecalInfo.Load(_6225 * 128 + 56), g_ShadowDecalInfo.Load(_6225 * 128 + 72), g_ShadowDecalInfo.Load(_6225 * 128 + 88), g_ShadowDecalInfo.Load(_6225 * 128 + 44), g_ShadowDecalInfo.Load(_6225 * 128 + 60), g_ShadowDecalInfo.Load(_6225 * 128 + 76), g_ShadowDecalInfo.Load(_6225 * 128 + 92)));
	    int2 _11700 = int3(int2(gl_FragCoord.xy), 0).xy;
	    float4 _19089 = g_tGBufferDepth.Load(int3(_11700, 0));
	    float _18959 = _19089.x;
	    if (g_tVeilFrontDepth.Load(int3(_11700, 0)).x > _18959)
	    {
	        discard;
	    }
	    float2 _12497 = ((gl_FragCoord.xy * PerViewConstantBuffer_t_1_m1.xy) * 2.0f) - 1.0f.xx;
	    float4 _18334 = mul(PerViewConstantBuffer_t_1_m0, float4(float3(_12497.x, -_12497.y, _18959), 1.0f));
	    float3 _15614 = _18334.xyz / _18334.www;
	    float _12011 = _15614.x;
	    float4 _22905;
	    _22905.x = _12011;
	    float _21813 = _15614.y;
	    _22905.y = _21813;
	    float _21986 = _15614.z;
	    float _24542 = _21986 - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).z;
	    float _11446 = _24542 / (asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).w - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).z);
	    float2 _14628 = asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).xy * lerp(asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).z, 1.0f, saturate(_11446));
	    float _7034 = _14628.x;
	    float _15755 = (-0.5f) * _7034;
	    float _6933 = (0.5f * _7034) - _15755;
	    float3 _13230 = float3((((_12011 - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).x) - _15755) / _6933) + (-0.5f), (((_21813 - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).y) - _15755) / _6933) + (-0.5f), _11446 - 0.5f);
	    bool _12885;
	    if (any(bool3(_13230.x < (-0.5f).xxx.x, _13230.y < (-0.5f).xxx.y, _13230.z < (-0.5f).xxx.z)))
	    {
	        _12885 = true;
	    }
	    else
	    {
	        _12885 = any(bool3(_13230.x > 0.5f.xxx.x, _13230.y > 0.5f.xxx.y, _13230.z > 0.5f.xxx.z));
	    }
	    if (_12885)
	    {
	        discard;
	    }
	    if (!(g_tGBufferTarget0.Load(int3(_11700, 0)).w == 0.0f))
	    {
	        discard;
	    }
	    float2 _18437 = _22905.xy - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).xy;
	    float3 _22101;
	    _22101.x = _18437.x;
	    _22101.y = _18437.y;
	    float2 _21285 = _22101.xy * ((saturate(_24542 / (asfloat(g_ShadowDecalInfo.Load(_6225 * 128 + 100)) - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).z)) * (1.0f - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).w)) + asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 16)).w);
	    float3 _8673;
	    _8673.x = _21285.x;
	    _8673.y = _21285.y;
	    float2 _21124 = _13230.xy;
	    float _23794;
	    if (int(g_ShadowDecalInfo.Load(_6225 * 128 + 96)) >= 0)
	    {
	        float4 _16012 = mul(float4(float3(_8673.xy + asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 0)).xy, max(_21986, asfloat(g_ShadowDecalInfo.Load(_6225 * 128 + 100)))), 1.0f), _24370);
	        float3 _10521 = _16012.xyz / _16012.w.xxx;
	        float _9589 = _10521.x;
	        float4 _22906;
	        _22906.x = _9589;
	        float _21814 = _10521.y;
	        _22906.y = _21814;
	        _22906.z = _10521.z;
	        bool _12886;
	        if (any(bool3(_22906.xyz.x < float3(-1.0f, -1.0f, 0.0f).x, _22906.xyz.y < float3(-1.0f, -1.0f, 0.0f).y, _22906.xyz.z < float3(-1.0f, -1.0f, 0.0f).z)))
	        {
	            _12886 = true;
	        }
	        else
	        {
	            _12886 = any(bool3(_22906.xyz.x > 1.0f.xxx.x, _22906.xyz.y > 1.0f.xxx.y, _22906.xyz.z > 1.0f.xxx.z));
	        }
	        if (_12886)
	        {
	            discard;
	        }
	        float _15602 = 0.5f * _Globals_1_g_flOoNumShadowMaps;
	        float4 _5636 = float4(_15602 + (float(int(g_ShadowDecalInfo.Load(_6225 * 128 + 96))) * _Globals_1_g_flOoNumShadowMaps), 0.5f, _15602, -0.5f);
	        float _13136;
	        float _16324;
	        _13136 = 0.0f;
	        _16324 = 0.0f;
	        int _21567;
	        float _13137;
	        float _16325;
	        int _17017 = -2;
	        [unroll]
	        for (;;)
	        {
	            if (!(_17017 <= 2))
	            {
	                break;
	            }
	            _13137 = _13136;
	            _16325 = _16324;
	            float _8410;
	            int _11496;
	            float _17556;
	            int _17018 = -2;
	            for (;;)
	            {
	                if (!(_17018 <= 2))
	                {
	                    break;
	                }
	                float _19426 = _3010[abs(_17018)] * _3010[abs(_17017)];
	                _17556 = _16325 + (g_tDecalShadowAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagLinearMipPoint, mad(clamp(float2(_9589 + (float(_17018) * 0.0078125f), _21814 + (float(_17017) * 0.0078125f)), (-0.998046875f).xx, 0.998046875f.xx), _5636.zw, _5636.xy).xy, 0.0f).x * _19426);
	                _8410 = _13137 + _19426;
	                _11496 = _17018 + 1;
	                _13137 = _8410;
	                _16325 = _17556;
	                _17018 = _11496;
	                continue;
	            }
	            _21567 = _17017 + 1;
	            _13136 = _13137;
	            _16324 = _16325;
	            _17017 = _21567;
	            continue;
	        }
	        _23794 = _16324 / _13136;
	    }
	    else
	    {
	        _23794 = smoothstep(0.0f, 1.0f, saturate(((2.0f * sqrt(dot(_21124, _21124))) - 0.20000000298023223876953125f) * 2.1276595592498779296875f));
	    }
	    output_0 = lerp(1.0f, _23794, (asfloat(g_ShadowDecalInfo.Load(_6225 * 128 + 104)) * saturate((_21986 - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).x) / (asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).y - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).x))) * ((saturate((_21986 - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).z) / (asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).w - asfloat(g_ShadowDecalInfo.Load4(_6225 * 128 + 112)).z)) * (-1.0f)) + 1.0f)).xxxx;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(decal, true);
	
}
