//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "XeGTAO";
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
	DynamicCombo( D_PASS, 0..3 );
	DynamicCombo( D_QUALITY, 0..3 );
	DynamicCombo( D_BENT_NORMALS, 0..1 );
	DynamicCombo( D_USE_HEIGHT_GBUFFER, 0, Sys( 0 ) );
	DynamicComboRule( Requires( D_QUALITY, D_PASS==1 ) );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	RWTexture2D<float4> g_outFinalAOTerm < Attribute("OutputAO"); >;
	RWTexture2D<float4> g_outWorkingAOTerm < Attribute("WorkingAO"); >;
	RWTexture2D<float4> g_outWorkingDepthMIP0 < Attribute("DepthMip0"); >;
	RWTexture2D<float4> g_outWorkingDepthMIP1 < Attribute("DepthMip1"); >;
	RWTexture2D<float4> g_outWorkingDepthMIP2 < Attribute("DepthMip2"); >;
	RWTexture2D<float4> g_outWorkingDepthMIP3 < Attribute("DepthMip3"); >;
	RWTexture2D<float4> g_outWorkingDepthMIP4 < Attribute("DepthMip4"); >;
	RWTexture2D<float4> g_outWorkingEdges < Attribute("WorkingEdges"); >;
	Texture2D g_srcHilbertLUT < Attribute("HilbertLUT"); SrgbRead(false); >;
	Texture2D g_srcRawDepth < Attribute("InputDepth"); SrgbRead(false); >;
	Texture2D g_srcWorkingAOTerm < Attribute("WorkingAO"); SrgbRead(false); >;
	Texture2D g_srcWorkingDepth < Attribute("WorkingDepth"); SrgbRead(false); >;
	Texture2D g_srcWorkingEdges < Attribute("WorkingEdges"); SrgbRead(false); >;
	Texture2D g_tGBufferTarget0 < Attribute("GBufferTarget0"); SrgbRead(false); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 3726 (name: GTAOConstantBuffer_t), member index 0 (name: _m0) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#if defined(GL_EXT_control_flow_attributes)
	#extension GL_EXT_control_flow_attributes : require
	#define SPIRV_CROSS_FLATTEN [[flatten]]
	#define SPIRV_CROSS_BRANCH [[dont_flatten]]
	#define SPIRV_CROSS_UNROLL [[unroll]]
	#define SPIRV_CROSS_LOOP [[dont_unroll]]
	#else
	#define SPIRV_CROSS_FLATTEN
	#define SPIRV_CROSS_BRANCH
	#define SPIRV_CROSS_UNROLL
	#define SPIRV_CROSS_LOOP
	#endif
	layout(local_size_x = 8, local_size_y = 8, local_size_z = 1) in;
	
	struct _1032
	{
	    vec2 _m0;
	    float _m1;
	    float _m2;
	};
	
	struct _14
	{
	    _1032 _m0;
	};
	
	layout(set = 0) uniform _14 GTAOConstantBuffer_t;
	
	struct _1064
	{
	    float _m0;
	    float _m1;
	    vec3 _m2;
	};
	
	layout(set = 0) uniform _1064 PerViewConstantBuffer_t;
	
	layout(set = 0, binding = 22) uniform sampler AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint;
	layout(set = 0, binding = 60) uniform texture2D g_srcRawDepth;
	layout(set = 0, binding = 158) uniform writeonly image2D _4551;
	layout(set = 0, binding = 159) uniform writeonly image2D _4552;
	layout(set = 0, binding = 160) uniform writeonly image2D _4553;
	layout(set = 0, binding = 161) uniform writeonly image2D _4554;
	layout(set = 0, binding = 162) uniform writeonly image2D _4555;
	
	shared float _5894[8][8];
	
	void main()
	{
	    uvec2 _14796 = gl_GlobalInvocationID.xy * uvec2(2u);
	    vec4 _7120 = (textureGatherOffset(sampler2D(g_srcRawDepth, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipPoint), vec2(_14796) * GTAOConstantBuffer_t._m0._m0, ivec2(1)) * vec4(PerViewConstantBuffer_t._m0)) + vec4(PerViewConstantBuffer_t._m1);
	    float _25043 = clamp(abs(PerViewConstantBuffer_t._m2.x / ((PerViewConstantBuffer_t._m2.y * _7120.w) + PerViewConstantBuffer_t._m2.z)), 0.0, 65504.0);
	    float _11893 = clamp(abs(PerViewConstantBuffer_t._m2.x / ((PerViewConstantBuffer_t._m2.y * _7120.z) + PerViewConstantBuffer_t._m2.z)), 0.0, 65504.0);
	    float _11532 = clamp(abs(PerViewConstantBuffer_t._m2.x / ((PerViewConstantBuffer_t._m2.y * _7120.x) + PerViewConstantBuffer_t._m2.z)), 0.0, 65504.0);
	    float _24886 = clamp(abs(PerViewConstantBuffer_t._m2.x / ((PerViewConstantBuffer_t._m2.y * _7120.y) + PerViewConstantBuffer_t._m2.z)), 0.0, 65504.0);
	    imageStore(_4551, ivec2(_14796), vec4(_25043));
	    imageStore(_4551, ivec2(_14796 + uvec2(1u, 0u)), vec4(_11893));
	    imageStore(_4551, ivec2(_14796 + uvec2(0u, 1u)), vec4(_11532));
	    imageStore(_4551, ivec2(_14796 + uvec2(1u)), vec4(_24886));
	    float _12887 = max(max(_25043, _11893), max(_11532, _24886));
	    float _14613 = (-1.48800384998321533203125) / GTAOConstantBuffer_t._m0._m1;
	    float _15749 = (((GTAOConstantBuffer_t._m0._m1 * 1.092750072479248046875) * (1.0 - GTAOConstantBuffer_t._m0._m2)) / (GTAOConstantBuffer_t._m0._m1 * 0.67204129695892333984375)) + 1.0;
	    float _21055 = saturate(((_12887 - _25043) * _14613) + _15749);
	    float _21056 = saturate(((_12887 - _11893) * _14613) + _15749);
	    float _21057 = saturate(((_12887 - _11532) * _14613) + _15749);
	    float _21325 = saturate(((_12887 - _24886) * _14613) + _15749);
	    float _16652 = ((((_21055 * _25043) + (_21056 * _11893)) + (_21057 * _11532)) + (_21325 * _24886)) / (((_21055 + _21056) + _21057) + _21325);
	    imageStore(_4552, ivec2(gl_GlobalInvocationID.xy), vec4(_16652));
	    _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = _16652;
	    barrier();
	    SPIRV_CROSS_BRANCH
	    if (all(equal((gl_LocalInvocationID.xy % uvec2(2u)), uvec2(0u))))
	    {
	        uint _22788 = gl_LocalInvocationID.x + 1u;
	        uint _13648 = gl_LocalInvocationID.y + 1u;
	        float _21908 = max(max(_5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y], _5894[_22788][gl_LocalInvocationID.y]), max(_5894[gl_LocalInvocationID.x][_13648], _5894[_22788][_13648]));
	        float _21058 = saturate(((_21908 - _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21059 = saturate(((_21908 - _5894[_22788][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21060 = saturate(((_21908 - _5894[gl_LocalInvocationID.x][_13648]) * _14613) + _15749);
	        float _21326 = saturate(((_21908 - _5894[_22788][_13648]) * _14613) + _15749);
	        float _22733 = ((((_21058 * _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) + (_21059 * _5894[_22788][gl_LocalInvocationID.y])) + (_21060 * _5894[gl_LocalInvocationID.x][_13648])) + (_21326 * _5894[_22788][_13648])) / (((_21058 + _21059) + _21060) + _21326);
	        imageStore(_4553, ivec2(gl_GlobalInvocationID.xy / uvec2(2u)), vec4(_22733));
	        _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = _22733;
	    }
	    barrier();
	    SPIRV_CROSS_BRANCH
	    if (all(equal((gl_LocalInvocationID.xy % uvec2(4u)), uvec2(0u))))
	    {
	        uint _22789 = gl_LocalInvocationID.x + 2u;
	        uint _13649 = gl_LocalInvocationID.y + 2u;
	        float _21909 = max(max(_5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y], _5894[_22789][gl_LocalInvocationID.y]), max(_5894[gl_LocalInvocationID.x][_13649], _5894[_22789][_13649]));
	        float _21061 = saturate(((_21909 - _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21062 = saturate(((_21909 - _5894[_22789][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21063 = saturate(((_21909 - _5894[gl_LocalInvocationID.x][_13649]) * _14613) + _15749);
	        float _21327 = saturate(((_21909 - _5894[_22789][_13649]) * _14613) + _15749);
	        float _22734 = ((((_21061 * _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) + (_21062 * _5894[_22789][gl_LocalInvocationID.y])) + (_21063 * _5894[gl_LocalInvocationID.x][_13649])) + (_21327 * _5894[_22789][_13649])) / (((_21061 + _21062) + _21063) + _21327);
	        imageStore(_4554, ivec2(gl_GlobalInvocationID.xy / uvec2(4u)), vec4(_22734));
	        _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y] = _22734;
	    }
	    barrier();
	    SPIRV_CROSS_BRANCH
	    if (all(equal((gl_LocalInvocationID.xy % uvec2(8u)), uvec2(0u))))
	    {
	        uint _22790 = gl_LocalInvocationID.x + 4u;
	        uint _13650 = gl_LocalInvocationID.y + 4u;
	        float _21910 = max(max(_5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y], _5894[_22790][gl_LocalInvocationID.y]), max(_5894[gl_LocalInvocationID.x][_13650], _5894[_22790][_13650]));
	        float _21064 = saturate(((_21910 - _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21065 = saturate(((_21910 - _5894[_22790][gl_LocalInvocationID.y]) * _14613) + _15749);
	        float _21066 = saturate(((_21910 - _5894[gl_LocalInvocationID.x][_13650]) * _14613) + _15749);
	        float _21328 = saturate(((_21910 - _5894[_22790][_13650]) * _14613) + _15749);
	        imageStore(_4555, ivec2(gl_GlobalInvocationID.xy / uvec2(8u)), vec4(((((_21064 * _5894[gl_LocalInvocationID.x][gl_LocalInvocationID.y]) + (_21065 * _5894[_22790][gl_LocalInvocationID.y])) + (_21066 * _5894[gl_LocalInvocationID.x][_13650])) + (_21328 * _5894[_22790][_13650])) / (((_21064 + _21065) + _21066) + _21328)));
	    }
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
