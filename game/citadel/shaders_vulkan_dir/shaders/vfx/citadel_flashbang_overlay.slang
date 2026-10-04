//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Flashbang overlay effect";
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
	
	bool g_bRenderFlashbangFrame < Attribute("RenderFlashbangFrame"); UiType(CheckBox); >;
	float g_flFlashbangAlpha < Attribute("FlashbangAlpha"); UiType(Slider); >;
	Texture2D g_tFlashbangFrame < Attribute("FlashbangFrameTexture"); SrgbRead(false); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    float _Globals_1_g_flFlashbangAlpha : packoffset(c0);
	    int _Globals_1_g_bRenderFlashbangFrame : packoffset(c0.y);
	};
	
	Texture2D<float4> g_tFlashbangFrame : register(t30, space1);
	
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
	    float4 _6421 = float4(_Globals_1_g_flFlashbangAlpha, _Globals_1_g_flFlashbangAlpha, _Globals_1_g_flFlashbangAlpha, 1.0f);
	    float4 _6805;
	    if (_Globals_1_g_bRenderFlashbangFrame != 0)
	    {
	        float3 _13861 = _6421.xyz + ((g_tFlashbangFrame.Load(int3(int3(int2(gl_FragCoord.xy), 0).xy, 0)).xyz * 4.0f) * _Globals_1_g_flFlashbangAlpha);
	        float4 _20488 = _6421;
	        _20488.x = _13861.x;
	        _20488.y = _13861.y;
	        _20488.z = _13861.z;
	        float3 _11240 = clamp(_20488.xyz, 0.0f.xxx, 1.0f.xxx);
	        float4 _13514 = _20488;
	        _13514.x = _11240.x;
	        _13514.y = _11240.y;
	        _13514.z = _11240.z;
	        _6805 = _13514;
	    }
	    else
	    {
	        _6805 = _6421;
	    }
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
