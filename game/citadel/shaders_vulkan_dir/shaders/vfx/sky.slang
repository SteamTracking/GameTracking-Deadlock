//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Used to draw the skybox";
	DevShader = false;
	Version = 2;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Default();
}

FEATURES
{
	Feature( F_TEXTURE_FORMAT2, 0..6 (0="BC6H (HDR compressed - recommended)", 1="Dxt1 (LDR)", 2="HDR (float16)", 3="RGB (8-bit uncompressed)", 4="YCoCg (dxt compressed)", 5="RGBM (dxt compressed)", 6="RGBM (8-bit uncompressed)"), "Format" );
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
	
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_matSkyWsToOs < Attribute("SkyWsToOs"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer _Globals_ : register(b0, space0)
	{
	    column_major float4x4 _Globals_1_g_matSkyWsToOs : packoffset(c0);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float3 PerViewConstantBuffer_t_1_m1 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static float4 vPositionOs;
	static float3 output_0;
	static float3 output_1;
	
	struct VS_INPUT
	{
	    float4 vPositionOs : TEXCOORD0;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float3 output_1 : TEXCOORD1;
	    float4 gl_Position : SV_Position;
	};
	
	void MainVs_inner()
	{
	    float4 _17971 = mul(PerViewConstantBuffer_t_1_m0, float4(vPositionOs.xyz, 0.0f).xyzw);
	    output_0 = normalize(mul(float4(vPositionOs.xyz, 0.0f), _Globals_1_g_matSkyWsToOs).xyz);
	    output_1 = PerViewConstantBuffer_t_1_m1.xyz + (vPositionOs.xyz * 500000.0f);
	    _17971.y = -_17971.y;
	    gl_Position = _17971;
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionOs = stage_input.vPositionOs;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}

PS
{
	StaticCombo( S_TEXTURE_FORMAT, F_TEXTURE_FORMAT2 );
	DynamicCombo( D_RENDER_TO_CUBE_MAP, 0..1 );
	
	bool g_bOverrideSkyAlpha < UiType(CheckBox); >;
	float g_flOverrideAlphaValue < UiType(Slider); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tBlueNoise < Attribute("BlueNoise"); SrgbRead(false); >;
	Texture3D g_tFogVolume < Attribute("FogVolume"); SrgbRead(false); >;
	TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Linear); OutputFormat(RGBA16161616F); SrgbRead(false); >;
	TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Linear); OutputFormat(BC6H); SrgbRead(false); >;
	TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Srgb); OutputFormat(RGBA8888); SrgbRead(true); >;
	TextureCube g_tSkyTexture < Channel(RGBA, RGBM(SkyTexture), Srgb); OutputFormat(RGBA8888); SrgbRead(true); >;
	TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	TextureCube g_tSkyTexture < Channel(RGBA, Box(SkyTexture), Srgb); OutputFormat(DXT5); SrgbRead(true); >;
	TextureCube g_tSkyTexture < Channel(RGBA, RGBM(SkyTexture), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	float3 g_vTint < Default3(1, 1, 1); Attribute("SkyTint"); UiType(VectorText); >;
	
	// Texture
	CreateInputTexture2D(SkyTexture, Linear, 8, "ConvertToYCoCg", "", "Texture", Default4(0, 0, 0, 1));
	CreateInputTexture2D(SkyTexture, Srgb, 8, "", "", "Texture", Default4(1, 1, 1, 0));
	float g_flBrightnessExposureBias < Range(-5, 5); UiType(Slider); UiGroup("Texture"); Expression(pow(2,this)); >;
	float g_flRenderOnlyExposureBias < Range(-5, 5); UiType(Slider); UiGroup("Texture"); Expression(pow(2,this)); >;
	
	#if (S_TEXTURE_FORMAT == 0)
		TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Linear); OutputFormat(BC6H); SrgbRead(false); >;
	#endif
	#if (S_TEXTURE_FORMAT == 1)
		TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	#endif
	#if (S_TEXTURE_FORMAT == 2)
		TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Linear); OutputFormat(RGBA16161616F); SrgbRead(false); >;
	#endif
	#if (S_TEXTURE_FORMAT == 3)
		TextureCube g_tSkyTexture < Channel(RGB, Box(SkyTexture), Srgb); OutputFormat(RGBA8888); SrgbRead(true); >;
	#endif
	#if (S_TEXTURE_FORMAT == 4)
		TextureCube g_tSkyTexture < Channel(RGBA, Box(SkyTexture), Srgb); OutputFormat(DXT5); SrgbRead(true); >;
	#endif
	#if (S_TEXTURE_FORMAT == 5)
		TextureCube g_tSkyTexture < Channel(RGBA, RGBM(SkyTexture), Srgb); OutputFormat(BC7); SrgbRead(true); >;
	#endif
	#if (S_TEXTURE_FORMAT == 6)
		TextureCube g_tSkyTexture < Channel(RGBA, RGBM(SkyTexture), Srgb); OutputFormat(RGBA8888); SrgbRead(true); >;
	#endif
	
	// Variant parameters
	CreateInputTexture2D(SkyTexture, Linear, 8, "ConvertToYCoCg", "", "Texture", Default4(0, 0, 0, 1));
	CreateInputTexture2D(SkyTexture, Srgb, 8, "", "", "Texture", Default4(1, 1, 1, 0));
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 2 (name: g_vTint) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	struct _1854
	{
	    float _m0;
	    float _m1;
	    float _m2;
	    float _m3;
	    float _m4;
	    float _m5;
	    mat4 _m6;
	};
	
	vec4 _3;
	
	struct _1114
	{
	    float g_flBrightnessExposureBias;
	    float g_flRenderOnlyExposureBias;
	    vec3 g_vTint;
	    int g_bOverrideSkyAlpha;
	    float g_flOverrideAlphaValue;
	};
	
	layout(set = 1) uniform _1114 _Globals_;
	
	struct _2406
	{
	    uint _m0;
	    vec4 _m1;
	    _1854 _m2;
	};
	
	layout(set = 1) uniform _2406 PerViewConstantBufferCitadel_t;
	
	struct _1017
	{
	    vec4 _m0;
	};
	
	layout(set = 3) uniform _1017 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 1, binding = 56) uniform textureCube g_tSkyTexture;
	layout(set = 1, binding = 27) uniform sampler DefaultSamplerState_0;
	layout(set = 1, binding = 30) uniform texture2D g_tBlueNoise;
	layout(set = 1, binding = 23) uniform sampler g_sPoint;
	layout(set = 1, binding = 55) uniform texture3D g_tFogVolume;
	layout(set = 1, binding = 26) uniform sampler AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_AllowGlobalMipBiasOverride_0_Filter_MinMagMipLinear;
	
	layout(location = 0) in vec3 input_0;
	layout(location = 1) in vec3 input_1;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    vec4 _3300 = texture(samplerCube(g_tSkyTexture, DefaultSamplerState_0), normalize(input_0.xyz).xyz);
	    vec3 _18758 = max((((_3300.xyz * _Globals_.g_flBrightnessExposureBias) * _Globals_.g_flRenderOnlyExposureBias) * _Globals_.g_vTint.xyz) * PerViewConstantBufferCitadel_t._m1.xyz, vec3(0.0));
	    vec3 _19321;
	    do
	    {
	        if (PerViewConstantBufferCitadel_t._m0 != 0u)
	        {
	            vec4 _18372 = vec4(input_1.xyz + fma(textureLod(sampler2D(g_tBlueNoise, g_sPoint), fma(gl_FragCoord.xy, PerViewLightingConstantBufferGpu_t._m0.zz, PerViewLightingConstantBufferGpu_t._m0.xy).xy, 0.0).xyz, vec3(PerViewConstantBufferCitadel_t._m2._m0), vec3(PerViewConstantBufferCitadel_t._m2._m1)), 1.0) * PerViewConstantBufferCitadel_t._m2._m6;
	            float _20176 = _18372.w;
	            vec2 _10521 = _18372.xy / vec2(_20176);
	            vec4 _22905;
	            _22905.x = _10521.x;
	            _22905.y = _10521.y;
	            float _21043 = (_20176 * PerViewConstantBufferCitadel_t._m2._m3) + PerViewConstantBufferCitadel_t._m2._m2;
	            vec3 _17137 = vec3((_22905.xy * 0.5) + vec2(0.5), _21043);
	            _17137.z = log2((saturate(_21043) * PerViewConstantBufferCitadel_t._m2._m4) + 1.0) * PerViewConstantBufferCitadel_t._m2._m5;
	            vec4 _12684 = textureLod(sampler3D(g_tFogVolume, AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_AllowGlobalMipBiasOverride_0_Filter_MinMagMipLinear), _17137, 0.0);
	            vec4 _11665 = vec4(_12684.xyz * 1.0, _12684.w);
	            _19321 = (_18758 * _11665.www) + _11665.xyz;
	            break;
	        }
	        _19321 = _18758;
	        break;
	    } while(false);
	    float _19133;
	    if (_Globals_.g_bOverrideSkyAlpha != 0)
	    {
	        _19133 = _Globals_.g_flOverrideAlphaValue;
	    }
	    else
	    {
	        _19133 = 1.0;
	    }
	    output_0 = vec4(_19321, _19133);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(sky, true);
	TextureAttribute(SkyTexture, g_tSkyTexture);
	FloatAttribute(SkyBrightnessExposureBias, g_flBrightnessExposureBias);
	
	#if (S_TEXTURE_FORMAT == 0)
		IntAttribute(SkyTextureFormat, 0);
	#endif
	#if (S_TEXTURE_FORMAT == 1)
		IntAttribute(SkyTextureFormat, 1);
	#endif
	#if (S_TEXTURE_FORMAT == 2)
		IntAttribute(SkyTextureFormat, 2);
	#endif
	#if (S_TEXTURE_FORMAT == 3)
		IntAttribute(SkyTextureFormat, 3);
	#endif
	#if (S_TEXTURE_FORMAT == 4)
		IntAttribute(SkyTextureFormat, 4);
	#endif
	#if (S_TEXTURE_FORMAT == 5)
		IntAttribute(SkyTextureFormat, 5);
	#endif
	#if (S_TEXTURE_FORMAT == 6)
		IntAttribute(SkyTextureFormat, 6);
	#endif
}
