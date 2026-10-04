//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Deferred fogging + final composition";
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
	DynamicCombo( D_VOLUMETRIC_FOG, 0..1 );
	DynamicCombo( D_CUBEMAP_FOG, 0..1 );
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	Texture2D g_tBlueNoise < Attribute("BlueNoise"); SrgbRead(false); >;
	TextureCube g_tFogCubeTexture < Attribute("CubemapFogTexture"); SrgbRead(true); >;
	Texture3D g_tFogVolume < Attribute("FogVolume"); SrgbRead(false); >;
	Texture2D g_tGBufferDepth < Attribute("SceneDepth"); SrgbRead(false); >;
	RWTexture2D<float4> g_tIntermediateRT < Attribute("GBufferLight"); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	static float4 _3;
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    float2 PerViewConstantBuffer_t_1_m0 : packoffset(c20);
	    float2 PerViewConstantBuffer_t_1_m1 : packoffset(c20.z);
	    float PerViewConstantBuffer_t_1_m2 : packoffset(c23.z);
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	    float3 PerViewConstantBuffer_t_1_m4 : packoffset(c28);
	};
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    float4 _Globals_1_g_vPixelToProj : packoffset(c0);
	    column_major float4x4 _Globals_1_g_mHighPrecisionWorldFromProj : packoffset(c1);
	};
	
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space0)
	{
	    float4 PerViewConstantBufferCitadel_t_1_m0 : packoffset(c13);
	    float4 PerViewConstantBufferCitadel_t_1_m1 : packoffset(c14);
	    float4 PerViewConstantBufferCitadel_t_1_m2 : packoffset(c15);
	    float4 PerViewConstantBufferCitadel_t_1_m3 : packoffset(c16);
	    float4 PerViewConstantBufferCitadel_t_1_m4 : packoffset(c17);
	};
	
	Texture2D<float4> g_tGBufferDepth : register(t59, space0);
	RWTexture2D<float4> _4309 : register(u158, space0);
	
	static uint3 gl_GlobalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
	};
	
	void MainCs_inner()
	{
	    do
	    {
	        uint2 _11066 = uint2(PerViewConstantBuffer_t_1_m1.xy);
	        if (any(bool2(gl_GlobalInvocationID.xy.x > _11066.x, gl_GlobalInvocationID.xy.y > _11066.y)))
	        {
	            break;
	        }
	        int2 _9477 = int2(gl_GlobalInvocationID.xy) + int2(PerViewConstantBuffer_t_1_m0.xy);
	        float4 _21502 = g_tGBufferDepth.Load(int3(int3(_9477.xy, 0).xy, 0));
	        float _18947 = _21502.x;
	        if (_18947 <= 1.0000000116860974230803549289703e-07f)
	        {
	            break;
	        }
	        float4 _14015 = mul(_Globals_1_g_mHighPrecisionWorldFromProj, float4((float2(_9477) * _Globals_1_g_vPixelToProj.xy) + _Globals_1_g_vPixelToProj.zw, 1.0f, 1.0f));
	        float3 _10521 = _14015.xyz / _14015.w.xxx;
	        float4 _22905;
	        _22905.x = _10521.x;
	        _22905.y = _10521.y;
	        _22905.z = _10521.z;
	        float3 _18925 = ((_22905.xyz / dot(PerViewConstantBuffer_t_1_m4, _22905.xyz).xxx).xyz * (PerViewConstantBuffer_t_1_m2 / _18947)) + PerViewConstantBuffer_t_1_m3.xyz;
	        float4 _24697 = _4309[_9477];
	        float3 _24455 = _24697.xyz;
	        float3 _19302;
	        do
	        {
	            float2 _17534 = _18925.xy - PerViewConstantBufferCitadel_t_1_m4.xy;
	            bool _12885;
	            if (dot(_17534, _17534) > PerViewConstantBufferCitadel_t_1_m3.x)
	            {
	                _12885 = _18925.z < PerViewConstantBufferCitadel_t_1_m3.y;
	            }
	            else
	            {
	                _12885 = false;
	            }
	            [branch]
	            if (_12885)
	            {
	                float2 _9342 = clamp(PerViewConstantBufferCitadel_t_1_m0.xy + (PerViewConstantBufferCitadel_t_1_m0.zw * float2(length(_17534), _18925.z)), 0.0f.xx, 1.0f.xx);
	                float _12872 = (pow(_9342.x, PerViewConstantBufferCitadel_t_1_m1.x) * pow(_9342.y, PerViewConstantBufferCitadel_t_1_m1.y)) * PerViewConstantBufferCitadel_t_1_m2.w;
	                _19302 = (_24455 * (1.0f - _12872).xxx) + (float4(PerViewConstantBufferCitadel_t_1_m2.xyz, _12872).xyz * _12872);
	                break;
	            }
	            _19302 = _24455;
	            break;
	        } while(false);
	        _4309[uint2(_9477)] = float4(_19302, _24697.w);
	        break;
	    } while(false);
	}
	
	[numthreads(8, 8, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
