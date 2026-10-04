//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Selection Outlines Postprocess";
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
	float3 vPositionSs : POSITION0  < Semantic( PosXyz ); >;                                      
};

VS
{
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float3 vPositionSs;
	
	struct VS_INPUT
	{
	    float3 vPositionSs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _22489 = float4(vPositionSs, 1.0f);
	    _22489.y = -vPositionSs.y;
	    gl_Position = _22489;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionSs = stage_input.vPositionSs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	DynamicCombo( D_PHASE, 0..5 );
	
	RenderState(StencilRef, 32);
	StructuredBuffer g_BoundingRects < Attribute("BoundingRects"); >;
	float g_fOutlineAlpha < Attribute("OutlineAlpha"); UiType(Slider); >;
	float g_fOutlineFadePow < Attribute("OutlineFadePow"); UiType(Slider); >;
	float g_fOutlineOffset < Attribute("OutlineOffset"); UiType(Slider); >;
	float g_fOutlineWidth < Attribute("OutlineWidth"); UiType(Slider); >;
	int g_nStepSize < Attribute("StepSize"); UiType(Slider); >;
	Texture2D g_tDepthTexture < Attribute("SceneDepth"); SrgbRead(false); >;
	Texture2D g_tGlowIndex < Attribute("GlowIndexTexture"); SrgbRead(false); >;
	Texture2D g_tGlowMask < Attribute("GlowMaskTexture"); SrgbRead(false); >;
	Texture2D g_tPrev < Attribute("Prev"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float2 PerViewConstantBuffer_t_1_m0 : packoffset(c20.z);
	    float2 PerViewConstantBuffer_t_1_m1 : packoffset(c21);
	};
	
	Texture2D<float4> g_tDepthTexture : register(t35, space1);
	Texture2D<float4> g_tGlowIndex : register(t36, space1);
	
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
	    do
	    {
	        int2 _19617 = int2(gl_FragCoord.xy);
	        int2 _12620 = int2(PerViewConstantBuffer_t_1_m0) - int2(1, 1);
	        float2 _4328 = gl_FragCoord.xy * PerViewConstantBuffer_t_1_m1.xy;
	        int2 _14107 = int3(_19617, 0).xy;
	        float4 _19089 = g_tDepthTexture.Load(int3(_14107, 0));
	        float _18959 = _19089.x;
	        float4 _22963 = g_tGlowIndex.Load(int3(_14107, 0));
	        float _20331 = _22963.x;
	        bool _12885;
	        if (_20331 == 0.0f)
	        {
	            _12885 = true;
	        }
	        else
	        {
	            _12885 = _20331 >= 0.509803950786590576171875f;
	        }
	        if (_12885)
	        {
	            output_0 = 0.0f.xxxx;
	            break;
	        }
	        int _13136;
	        _13136 = 0;
	        int _8896;
	        bool _10913;
	        int _17551;
	        int _9480 = -1;
	        bool _15051 = true;
	        bool _11153;
	        [unroll]
	        for (;;)
	        {
	            _11153 = _9480 <= 1;
	            if (!(_11153 ? _15051 : false))
	            {
	                break;
	            }
	            int _8087;
	            int _14382;
	            int _13155 = _13136;
	            int _16208 = -1;
	            [unroll]
	            for (;;)
	            {
	                bool _7956_ladder_break = false;
	                do
	                {
	                    if (!(_16208 <= 1))
	                    {
	                        _10913 = _15051;
	                        _17551 = _13155;
	                        _7956_ladder_break = true;
	                        break;
	                    }
	                    bool _12886;
	                    if (_16208 == 0)
	                    {
	                        _12886 = _9480 == 0;
	                    }
	                    else
	                    {
	                        _12886 = false;
	                    }
	                    if (_12886)
	                    {
	                        _14382 = _13155;
	                        break;
	                    }
	                    int2 _23711 = int3(clamp(_19617 + int2(_16208, _9480), int2(0, 0), _12620), 0).xy;
	                    float4 _19090 = g_tGlowIndex.Load(int3(_23711, 0));
	                    float _18960 = _19090.x;
	                    float4 _3300 = g_tDepthTexture.Load(int3(_23711, 0));
	                    float _19812 = _3300.x;
	                    int _12502;
	                    if (_18960 != _20331)
	                    {
	                        bool _12887;
	                        if (_18960 > 0.0f)
	                        {
	                            _12887 = _19812 >= _18959;
	                        }
	                        else
	                        {
	                            _12887 = false;
	                        }
	                        if (_12887)
	                        {
	                            _10913 = false;
	                            _17551 = 0;
	                            _7956_ladder_break = true;
	                            break;
	                        }
	                        bool _12888;
	                        if (_18960 < 0.509803950786590576171875f)
	                        {
	                            _12888 = true;
	                        }
	                        else
	                        {
	                            _12888 = _18959 >= _19812;
	                        }
	                        int _12501;
	                        if (_12888)
	                        {
	                            _12501 = _13155 + 1;
	                        }
	                        else
	                        {
	                            _12501 = _13155;
	                        }
	                        _12502 = _12501;
	                    }
	                    else
	                    {
	                        _12502 = _13155;
	                    }
	                    _14382 = _12502;
	                    break;
	                } while(false);
	                if (_7956_ladder_break)
	                {
	                    break;
	                }
	                _8087 = _16208 + 1;
	                _13155 = _14382;
	                _16208 = _8087;
	                continue;
	            }
	            _8896 = _9480 + 1;
	            _13136 = _17551;
	            _15051 = _10913;
	            _9480 = _8896;
	            continue;
	        }
	        float4 _6729;
	        if (_13136 >= 3)
	        {
	            float4 _23135 = 0.0f.xxxx;
	            _23135.x = _4328.x;
	            _23135.y = _4328.y;
	            _6729 = _23135;
	        }
	        else
	        {
	            _6729 = 0.0f.xxxx;
	        }
	        output_0 = _6729;
	        break;
	    } while(false);
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
