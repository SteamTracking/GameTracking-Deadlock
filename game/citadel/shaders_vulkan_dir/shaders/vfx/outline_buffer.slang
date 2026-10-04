//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "A shader for filling the render target used for outlining entities in citadel";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Forward();
	Default();
}

FEATURES
{
	Feature( F_WRITE_MASK, 0..1, "Write mask" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices : BLENDINDICES0  < Semantic( BlendIndices ); >;                          
	uint4  nPackedFrame  : NORMAL0        < Semantic( CompressedTangentFrame ); >;                
	float4 vNormalOs     : NORMAL0        < Semantic( Normal ); >;                                
	float3 vPositionOs   : POSITION0      < Semantic( PosXyz ); >;                                 // S_WRITE_MASK=0, D_CS_VERTEX_ANIMATION=0
	float2 nInstanceIdx  : TEXCOORD13     < Semantic( InstanceTransformUv ); >;                    // S_WRITE_MASK=1, D_COMPUTE_BOUNDS=1
};

VS
{
	StaticCombo( S_WRITE_MASK, F_WRITE_MASK );
	StaticCombo( S_SUBGROUP_WAVE_OPS, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_COMPUTE_BOUNDS, 0..1 );
	DynamicComboRule( Requires( D_COMPUTE_BOUNDS, S_WRITE_MASK ) );
	
	StructuredBuffer g_BoundingRects < Attribute("BoundingRects"); >;
	RWStructuredBuffer g_BoundingRects < Attribute("BoundingRects"); >;
	StructuredBuffer g_GlowList < Attribute("GlowList"); >;
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	#if (S_WRITE_MASK == 1)
		RWStructuredBuffer g_BoundingRects < Attribute("BoundingRects"); >;
	#endif
	
	// Variant parameters
	StructuredBuffer g_BoundingRects < Attribute("BoundingRects"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1025
	{
	    float2 _m0;
	    int _m1;
	    int _m2;
	};
	
	struct _682
	{
	    float4 _m0[126];
	};
	
	ByteAddressBuffer g_GlowList : register(t35, space0);
	ByteAddressBuffer g_BoundingRects : register(t34, space0);
	cbuffer PerViewConstantBufferCitadel_t : register(b3, space0)
	{
	    _682 PerViewConstantBufferCitadel_t_1_m0 : packoffset(c174);
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
	static float output_1;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    uint gl_InstanceIndex : SV_InstanceID;
	};
	
	struct PS_INPUT
	{
	    nointerpolation uint output_0 : TEXCOORD0;
	    float output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    uint _24589 = uint(gl_InstanceIndex - gl_BaseInstanceARB);
	    uint _16180 = uint(int(g_GlowList.Load(_24589 * 16 + 8)));
	    uint _8834 = _16180 - 2u;
	    float2 _5759 = float2(int2(g_BoundingRects.Load2(_8834 * 8 + 0))) * 1.52587890625e-05f;
	    float _18989 = (vPositionOs.y - (-1.0f)) * 0.5f;
	    float _7581 = _5759.x;
	    float _15610 = _5759.y;
	    float4 _22247;
	    if (_7581 < _15610)
	    {
	        float4 _9338 = float4(-1.0f, -1.0f, 0.5f, 1.0f);
	        _9338.x = (((vPositionOs.x - (-1.0f)) * 0.5f) * (asfloat(g_GlowList.Load2(_24589 * 16 + 0)).y - asfloat(g_GlowList.Load2(_24589 * 16 + 0)).x)) + asfloat(g_GlowList.Load2(_24589 * 16 + 0)).x;
	        _9338.y = (_18989 * (_15610 - _7581)) + _7581;
	        _22247 = _9338;
	    }
	    else
	    {
	        _22247 = float4(-1.0f, -1.0f, 0.5f, 1.0f);
	    }
	    output_0 = _16180;
	    output_1 = _18989 - PerViewConstantBufferCitadel_t_1_m0._m0[_8834].x;
	    float4 _20857 = _22247;
	    _20857.y = -_22247.y;
	    gl_Position = _20857;
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
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}

PS
{
	StaticCombo( S_WRITE_MASK, F_WRITE_MASK );
	DynamicCombo( D_DEPTH_TEST, 0..1 );
	DynamicComboRule( Requires( D_DEPTH_TEST, S_WRITE_MASK ) );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tGlowIndex < Attribute("GlowIndexTexture"); SrgbRead(false); >;
	
	// Bottom
	float g_flBottomAlpha < Default(0.2); UiType(Slider); UiGroup("Bottom"); >;
	float g_flBottomScreenBrightness < Default(0.5); UiType(Slider); UiGroup("Bottom"); >;
	float4 g_vBottomOverrideColor < Default3(1, 1, 1); UiType(Color); UiGroup("Bottom"); Expression(SrgbGammaToLinear(this)); >;
	
	// Top
	float g_flTopAlpha < UiType(Slider); UiGroup("Top"); >;
	float g_flTopScreenBrightness < Default(0.5); UiType(Slider); UiGroup("Top"); >;
	float4 g_vTopOverrideColor < Default3(1, 1, 1); UiType(Color); UiGroup("Top"); Expression(SrgbGammaToLinear(this)); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 2 (name: g_vBottomOverrideColor) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _814
	{
	    vec4 _m0[129];
	};
	
	vec4 _3;
	
	struct _392
	{
	    float _m0;
	    _814 _m1;
	};
	
	layout(set = 1) uniform _392 PerViewConstantBufferCitadel_t;
	
	struct _1286
	{
	    float g_flBottomAlpha;
	    float g_flBottomScreenBrightness;
	    vec4 g_vBottomOverrideColor;
	    float g_flTopAlpha;
	    float g_flTopScreenBrightness;
	    vec4 g_vTopOverrideColor;
	};
	
	layout(set = 1) uniform _1286 _Globals_;
	
	layout(set = 1, binding = 33) uniform texture2D g_tGlowIndex;
	
	layout(location = 0) flat in uint input_0;
	layout(location = 1) in float input_1;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    vec4 _3300 = texelFetch(g_tGlowIndex, ivec3(ivec2(gl_FragCoord.xy * PerViewConstantBufferCitadel_t._m0), 0).xy, 0);
	    float _20331 = _3300.x;
	    if (_20331 == 0.0)
	    {
	        discard;
	    }
	    if (input_0 != uint(_20331 * 255.0))
	    {
	        discard;
	    }
	    bool _4001 = input_1 > 0.0;
	    float _12885;
	    if (_4001)
	    {
	        _12885 = _Globals_.g_flTopAlpha;
	    }
	    else
	    {
	        _12885 = _Globals_.g_flBottomAlpha;
	    }
	    vec4 _12886;
	    if (_4001)
	    {
	        _12886 = _Globals_.g_vTopOverrideColor;
	    }
	    else
	    {
	        _12886 = _Globals_.g_vBottomOverrideColor;
	    }
	    float _21785;
	    if (_4001)
	    {
	        _21785 = _Globals_.g_flTopScreenBrightness;
	    }
	    else
	    {
	        _21785 = _Globals_.g_flBottomScreenBrightness;
	    }
	    vec4 _10845;
	    _10845.x = PerViewConstantBufferCitadel_t._m1._m0[input_0].x;
	    _10845.y = PerViewConstantBufferCitadel_t._m1._m0[input_0].y;
	    _10845.z = PerViewConstantBufferCitadel_t._m1._m0[input_0].z;
	    vec3 _7733 = mix(_10845.xyz, _12886.xyz, vec3(_12886.w));
	    vec4 _17842;
	    _17842.x = _7733.x;
	    _17842.y = _7733.y;
	    _17842.z = _7733.z;
	    output_0 = vec4(_17842.xyz * _12885, _21785);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
}
