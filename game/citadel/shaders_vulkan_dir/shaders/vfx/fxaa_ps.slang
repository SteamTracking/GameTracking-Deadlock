//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "FXAA Pixel Shader";
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

struct VS_INPUT
{
	float3 vPositionPs : POSITION0  < Semantic( PosXyz ); >;                                      
	float2 vTexCoord   : TEXCOORD0  < Semantic( LowPrecisionUv ); >;                              
};

VS
{
	
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 _2;
	
	cbuffer PerViewConstantBuffer_t : register(b0, space0)
	{
	    float2 PerViewConstantBuffer_t_1_m0 : packoffset(c21);
	};
	
	
	static float4 gl_Position;
	static float2 vPositionPs;
	static float2 vTexCoord;
	static float2 output_0;
	static float4 output_1;
	
	struct VS_INPUT
	{
	    float2 vPositionPs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float2 output_0 : TEXCOORD0;
	    float4 output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _14817 = float4(vPositionPs, 0.0f, 1.0f);
	    float4 _10845;
	    _10845.x = vTexCoord.x;
	    _10845.y = vTexCoord.y;
	    output_0 = vTexCoord;
	    output_1 = float4(vTexCoord, _10845.xy - (PerViewConstantBuffer_t_1_m0 * 0.75f));
	    _14817.y = -vPositionPs.y;
	    gl_Position = _14817;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionPs = stage_input.vPositionPs;
	    vTexCoord = stage_input.vTexCoord;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	
	Texture2D g_tColorBuffer < Attribute("ColorBuffer"); SrgbRead(false); >;
	float4 g_vInvTextureDim < Source(InvTextureDim); SourceArg(g_tColorBuffer) UiType(VectorText); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float _3;
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float4 _Globals_1_g_vInvTextureDim : packoffset(c0);
	};
	
	SamplerState Filter_Anisotropic : register(s14, space1);
	Texture2D<float4> g_tColorBuffer : register(t30, space1);
	
	static float4 gl_FragCoord;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float2 _19657 = gl_FragCoord.xy * _Globals_1_g_vInvTextureDim.xy;
	    float4 _6805;
	    do
	    {
	        float2 _17872 = _19657.xy;
	        float4 _14734 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(0, -1));
	        float4 _14735 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(-1, 0));
	        float4 _14736 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(0, 0));
	        float4 _14737 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(1, 0));
	        float4 _12167 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(0, 1));
	        float _21032 = (_14734.y * 1.9632108211517333984375f) + _14734.x;
	        float _21033 = (_14735.y * 1.9632108211517333984375f) + _14735.x;
	        float _6242 = _14736.x;
	        float _21034 = (_14736.y * 1.9632108211517333984375f) + _6242;
	        float _21035 = (_14737.y * 1.9632108211517333984375f) + _14737.x;
	        float _19329 = (_12167.y * 1.9632108211517333984375f) + _12167.x;
	        float _10499 = max(_21034, max(max(_21032, _21033), max(_19329, _21035)));
	        float _7752 = _14736.w;
	        float _16086 = _14734.w;
	        float _22794 = _14735.w;
	        float _18126 = _12167.w;
	        float _12317 = _14737.w;
	        float _21870 = max(_7752, max(max(_16086, _22794), max(_18126, _12317)));
	        float _23623 = _10499 - min(_21034, min(min(_21032, _21033), min(_19329, _21035)));
	        float _22657 = _21870 - min(_7752, min(min(_16086, _22794), min(_18126, _12317)));
	        bool _20074 = _22657 > _23623;
	        float _10963 = _20074 ? _7752 : _21034;
	        float _11726 = _20074 ? _18126 : _19329;
	        float _7701 = _20074 ? _12317 : _21035;
	        float _7702 = _20074 ? _22794 : _21033;
	        float _7703 = _20074 ? _16086 : _21032;
	        float _7017 = _20074 ? _22657 : _23623;
	        if (_7017 < max(0.0416666679084300994873046875f, (_20074 ? _21870 : _10499) * 0.125f))
	        {
	            _6805 = float4(float4(_6242, _14736.yz, _3).xyz, _7752);
	            break;
	        }
	        float _15194 = min(0.75f, max(0.0f, (abs(((((_7703 + _7702) + _7701) + _11726) * 0.25f) - _10963) / _7017) - 0.25f) * 1.33333337306976318359375f);
	        float4 _14738 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(-1, -1));
	        float4 _14739 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(1, -1));
	        float4 _14740 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(-1, 1));
	        float4 _22858 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17872, 0.0f, int2(1, 1));
	        float _13136;
	        float _14986;
	        float _15291;
	        float _16305;
	        if (_20074)
	        {
	            _13136 = _22858.w;
	            _16305 = _14740.w;
	            _14986 = _14739.w;
	            _15291 = _14738.w;
	        }
	        else
	        {
	            _13136 = (_22858.y * 1.9632108211517333984375f) + _22858.x;
	            _16305 = (_14740.y * 1.9632108211517333984375f) + _14740.x;
	            _14986 = (_14739.y * 1.9632108211517333984375f) + _14739.x;
	            _15291 = (_14738.y * 1.9632108211517333984375f) + _14738.x;
	        }
	        float _23880 = 0.25f * _15291;
	        float _9108 = 0.25f * _14986;
	        float _7613 = (-1.0f) * _10963;
	        float _14298 = 0.25f * _16305;
	        float _9110 = 0.25f * _13136;
	        bool _6649 = ((abs((_23880 + ((-0.5f) * _7702)) + _14298) + abs(((0.5f * _7703) + _7613) + (0.5f * _11726))) + abs((_9108 + ((-0.5f) * _7701)) + _9110)) >= ((abs((_23880 + ((-0.5f) * _7703)) + _9108) + abs(((0.5f * _7702) + _7613) + (0.5f * _7701))) + abs((_14298 + ((-0.5f) * _11726)) + _9110));
	        float _25013;
	        if (_6649)
	        {
	            _25013 = -_Globals_1_g_vInvTextureDim.y;
	        }
	        else
	        {
	            _25013 = -_Globals_1_g_vInvTextureDim.x;
	        }
	        bool _16913 = !_6649;
	        float _23323 = _16913 ? _7702 : _7703;
	        float _13718 = _16913 ? _7701 : _11726;
	        float _24881 = abs(_23323 - _10963);
	        float _8908 = abs(_13718 - _10963);
	        bool _7085 = !(_24881 >= _8908);
	        float _14307 = _7085 ? ((_13718 + _10963) * 0.5f) : ((_23323 + _10963) * 0.5f);
	        float _22475;
	        if (_7085)
	        {
	            _22475 = _25013 * (-1.0f);
	        }
	        else
	        {
	            _22475 = _25013;
	        }
	        float _18579 = _19657.x;
	        float _11017;
	        if (_6649)
	        {
	            _11017 = 0.0f;
	        }
	        else
	        {
	            _11017 = _22475 * 0.5f;
	        }
	        float _18987 = _19657.y;
	        float _10998;
	        if (_6649)
	        {
	            _10998 = _22475 * 0.5f;
	        }
	        else
	        {
	            _10998 = 0.0f;
	        }
	        float2 _8703 = float2(_18579 + _11017, _18987 + _10998);
	        float _16001 = (_7085 ? _8908 : _24881) * 0.25f;
	        float2 _11237;
	        if (_6649)
	        {
	            _11237 = float2(_Globals_1_g_vInvTextureDim.x, 0.0f);
	        }
	        else
	        {
	            _11237 = float2(0.0f, _Globals_1_g_vInvTextureDim.y);
	        }
	        float2 _13137;
	        float2 _17114;
	        _13137 = _8703 + _11237;
	        _17114 = _8703 + (_11237 * (-1.0f).xx);
	        int _8087;
	        bool _7251;
	        float2 _7426;
	        bool _12885;
	        float _13174;
	        float _13175;
	        float2 _14382;
	        float _16054;
	        float _16055;
	        bool _16306 = false;
	        int _17017 = 0;
	        bool _17115 = false;
	        float _17116 = _14307;
	        float _17133 = _14307;
	        for (;;)
	        {
	            if (!(_17017 < 16))
	            {
	                _13175 = _17133;
	                _16055 = _17116;
	                break;
	            }
	            if (_20074)
	            {
	                float _7425;
	                if (!_17115)
	                {
	                    _7425 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17114.xy, 0.0f).w;
	                }
	                else
	                {
	                    _7425 = _17133;
	                }
	                float _12502;
	                if (!_16306)
	                {
	                    _12502 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _13137.xy, 0.0f).w;
	                }
	                else
	                {
	                    _12502 = _17116;
	                }
	                _13174 = _12502;
	                _16054 = _7425;
	            }
	            else
	            {
	                float _7424;
	                if (!_17115)
	                {
	                    float4 _12168 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _17114.xy, 0.0f);
	                    _7424 = (_12168.y * 1.9632108211517333984375f) + _12168.x;
	                }
	                else
	                {
	                    _7424 = _17133;
	                }
	                float _12501;
	                if (!_16306)
	                {
	                    float4 _12169 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, _13137.xy, 0.0f);
	                    _12501 = (_12169.y * 1.9632108211517333984375f) + _12169.x;
	                }
	                else
	                {
	                    _12501 = _17116;
	                }
	                _13174 = _12501;
	                _16054 = _7424;
	            }
	            if (_17115)
	            {
	                _12885 = true;
	            }
	            else
	            {
	                _12885 = abs(_16054 - _14307) >= _16001;
	            }
	            if (_16306)
	            {
	                _7251 = true;
	            }
	            else
	            {
	                _7251 = abs(_13174 - _14307) >= _16001;
	            }
	            if (_12885 ? _7251 : false)
	            {
	                _13175 = _16054;
	                _16055 = _13174;
	                break;
	            }
	            if (!_12885)
	            {
	                _7426 = _17114 - _11237;
	            }
	            else
	            {
	                _7426 = _17114;
	            }
	            if (!_7251)
	            {
	                _14382 = _13137 + _11237;
	            }
	            else
	            {
	                _14382 = _13137;
	            }
	            _8087 = _17017 + 1;
	            _13137 = _14382;
	            _16306 = _7251;
	            _17114 = _7426;
	            _17115 = _12885;
	            _17116 = _13174;
	            _17133 = _16054;
	            _17017 = _8087;
	            continue;
	        }
	        float _12886;
	        if (_6649)
	        {
	            _12886 = _18579 - _17114.x;
	        }
	        else
	        {
	            _12886 = _18987 - _17114.y;
	        }
	        float _22245;
	        if (_6649)
	        {
	            _22245 = _13137.x - _18579;
	        }
	        else
	        {
	            _22245 = _13137.y - _18987;
	        }
	        bool _18600 = _12886 < _22245;
	        float _23478 = (0.5f + ((_18600 ? _12886 : _22245) * ((-1.0f) / (_22245 + _12886)))) * ((((_10963 - _14307) < 0.0f) == (((_18600 ? _13175 : _16055) - _14307) < 0.0f)) ? 0.0f : _22475);
	        float4 _22273 = g_tColorBuffer.SampleLevel(Filter_Anisotropic, float2(_18579 + (_6649 ? 0.0f : _23478), _18987 + (_6649 ? _23478 : 0.0f)).xy, 0.0f);
	        float4 _13695 = ((-_15194).xxxx * _22273) + ((((((((_14734 + _14735) + _14736) + _14737) + _12167) + (((_14738 + _14739) + _14740) + _22858)) * 0.111111111938953399658203125f.xxxx) * _15194.xxxx) + _22273);
	        _6805 = float4(_13695.xyz, _13695.w);
	        break;
	    } while(false);
	    output_0 = _6805;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
