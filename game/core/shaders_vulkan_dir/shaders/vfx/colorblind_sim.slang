//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Simulate common color blindness types";
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
	float4 vCBWeights  : COLOR0     < Semantic( ColorBlindWeights ); >;                           
	float4 vPositionPs : POSITION0  < Semantic( position ); >;                                    
};

VS
{
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 gl_Position;
	static float2 vPositionPs;
	static float4 vCBWeights;
	static float2 output_0;
	static float4 output_1;
	
	struct VS_INPUT
	{
	    float2 vPositionPs : TEXCOORD0;
	    float4 vCBWeights : TEXCOORD1;
	};
	
	struct PS_INPUT
	{
	    float2 output_0 : TEXCOORD0;
	    float4 output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _22344 = float4(vPositionPs, 0.0f, 1.0f);
	    _22344.y = -vPositionPs.y;
	    gl_Position = _22344;
	    output_0 = float2((vPositionPs.x * 0.5f) + 0.5f, (vPositionPs.y * (-0.5f)) + 0.5f);
	    output_1 = vCBWeights;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionPs = stage_input.vPositionPs;
	    vCBWeights = stage_input.vCBWeights;
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
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	Texture2D<float4> g_tColorBuffer : register(t30, space1);
	SamplerState Filter_MinMagMipPoint : register(s14, space1);
	
	static float4 input_1;
	static float2 input_0;
	static float4 output_0;
	
	struct PS_INPUT
	{
	    float2 input_0 : TEXCOORD0;
	    float4 input_1 : TEXCOORD1;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	};
	
	void MainPs_inner()
	{
	    float _4545 = (input_1.x + input_1.y) + input_1.z;
	    if ((_4545 - 9.9999997473787516355514526367188e-05f) < 0.0f)
	    {
	        discard;
	    }
	    float4 _3870 = input_1 / (input_1.w + _4545).xxxx;
	    float4 _3300 = g_tColorBuffer.SampleLevel(Filter_MinMagMipPoint, input_0.xy, 0.0f);
	    float3 _13860 = mul(mul(float3x3(float3(0.40020000934600830078125f, 0.70759999752044677734375f, -0.080799996852874755859375f), float3(-0.2263000011444091796875f, 1.16530001163482666015625f, 0.04569999873638153076171875f), float3(0.0f, 0.0f, 0.918200016021728515625f)), float3x3(float3(0.41245639324188232421875f, 0.3575761020183563232421875f, 0.180437505245208740234375f), float3(0.21267290413379669189453125f, 0.715152204036712646484375f, 0.072175003588199615478515625f), float3(0.01933390088379383087158203125f, 0.119191996753215789794921875f, 0.950304090976715087890625f))), _3300.xyz);
	    float _7353 = _13860.y;
	    float _6498 = _13860.z;
	    float _22516 = _13860.x;
	    output_0 = float4(mul(float3x3(float3(5.4722118377685546875f, -4.64196014404296875f, 0.16963708400726318359375f), float3(-1.12524187564849853515625f, 2.293170928955078125f, -0.16789519786834716796875f), float3(0.02980164997279644012451171875f, -0.19318072497844696044921875f, 1.1636478900909423828125f)), ((((_13860 * _3870.w) + (float3((1.0511829853057861328125f * _7353) - (0.051160991191864013671875f * _6498), _7353, _6498) * _3870.x)) + (float3(_22516, (0.9513092041015625f * _22516) + (0.04866991937160491943359375f * _6498), _6498) * _3870.y)) + (float3(_22516, _7353, ((-0.867447316646575927734375f) * _22516) + (1.867270946502685546875f * _7353)) * _3870.z)).xyz), _3300.w);
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    input_1 = stage_input.input_1;
	    input_0 = stage_input.input_0;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
