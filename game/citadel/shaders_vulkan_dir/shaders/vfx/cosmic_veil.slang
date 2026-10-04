//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Cosmic Veil shader.";
	DevShader = false;
	Version = 14;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, vs
}

MODES
{
	Depth(S_MODE_DEPTH);
	FrontDepth(S_MODE_FRONT_DEPTH);
	Forward();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
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
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;             
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;    // D_COMPRESSED_NORMALS_AND_TANGENTS=1
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                   
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, D_COMPRESSED_NORMALS_AND_TANGENTS ) );
	
	float g_flOoTintDrivenTextureVariations < UiType(Slider); Expression(1/g_nTintDrivenTextureVariations); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
	// Textures
	int g_nTintDrivenTextureVariations < Default(1); Range(1, 32); UiType(Slider); UiGroup("Textures"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1125
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    uint _m5;
	    uint _m6;
	    float _m7;
	};
	
	struct _1119
	{
	    row_major float3x4 _m0;
	};
	
	ByteAddressBuffer g_instanceBuffer : register(t32, space4);
	ByteAddressBuffer g_transformBuffer : register(t30, space4);
	cbuffer _Globals_ : register(b0, space0)
	{
	    uint _Globals_1_g_nTintDrivenTextureVariations : packoffset(c12.y);
	    float _Globals_1_g_flOoTintDrivenTextureVariations : packoffset(c12.z);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static float3 vPositionOs;
	static float2 vTexCoord;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static uint4 vBlendIndices;
	static uint nInstanceIdx;
	static float3 output_0;
	static float4 output_1;
	static float3 output_2;
	static float4 output_3;
	static float4 output_4;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	    float3 vNormalOs : TEXCOORD2;
	    float4 vTangentUOs_flTangentVSign : TEXCOORD3;
	    uint4 vBlendIndices : TEXCOORD4;
	    uint nInstanceIdx : TEXCOORD5;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float4 output_1 : TEXCOORD1;
	    float3 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    float2 _19276 = vTexCoord;
	    uint _21785;
	    if (((g_instanceBuffer.Load(nInstanceIdx * 32 + 20) >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4) + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4);
	    }
	    float3x4 _24688 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
	    float4x3 _10676 = transpose(_24688);
	    float3 _7726 = _10676[0];
	    float3 _16758 = _10676[1];
	    float3 _16759 = _10676[2];
	    float3x3 _13976 = transpose(float3x3(_7726 * (1.0f / dot(_7726, _7726)), _16758 * (1.0f / dot(_16758, _16758)), _16759 * (1.0f / dot(_16759, _16759))));
	    float4 _23812 = float4(uint4(g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 255u, (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 65280u) >> uint(8), (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 16711680u) >> uint(16), (g_instanceBuffer.Load(nInstanceIdx * 32 + 0) & 4278190080u) >> uint(24))) * 0.0039215688593685626983642578125f.xxxx;
	    float3 _6253 = _23812.xyz;
	    float3 _17828 = _6253 * 0.077399380505084991455078125f.xxx;
	    float3 _7676 = pow((_6253 * 0.947867333889007568359375f.xxx) + 0.052132703363895416259765625f.xxx, 2.400000095367431640625f.xxx);
	    float _21354;
	    if (_23812.x <= 0.040449999272823333740234375f)
	    {
	        _21354 = _17828.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (_23812.y <= 0.040449999272823333740234375f)
	    {
	        _21355 = _17828.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19167;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _19167 = _17828.z;
	    }
	    else
	    {
	        _19167 = _7676.z;
	    }
	    _23812.x = _21354;
	    _23812.y = _21355;
	    _23812.z = _19167;
	    float2 _10020;
	    float4 _22452;
	    if (_Globals_1_g_nTintDrivenTextureVariations > 1u)
	    {
	        float _10857;
	        if (_21354 <= 0.003130800090730190277099609375f)
	        {
	            _10857 = (_23812.xyz * 12.9200000762939453125f).x;
	        }
	        else
	        {
	            _10857 = ((pow(_23812.xyz, 0.4166666567325592041015625f.xxx) * 1.05499994754791259765625f) - 0.054999999701976776123046875f.xxx).x;
	        }
	        float2 _15797 = _19276;
	        _15797.x = _Globals_1_g_flOoTintDrivenTextureVariations * (_19276.x + float(uint(_10857 * 255.0f) % _Globals_1_g_nTintDrivenTextureVariations));
	        float4 _16626 = _23812;
	        _16626.x = _21355;
	        _10020 = _15797;
	        _22452 = _16626;
	    }
	    else
	    {
	        _10020 = _19276;
	        _22452 = _23812;
	    }
	    float3 _19671 = mul(_24688, float4(vPositionOs.xyz, 1.0f));
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_19671.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_13976, vNormalOs.xyz));
	    output_1 = _10020.xyxy;
	    output_2 = _19671 - PerViewConstantBuffer_t_1_m3.xyz;
	    output_3 = _22452;
	    output_4 = float4(normalize(mul(_13976, vTangentUOs_flTangentVSign.xyz)), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_19671.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    vPositionOs = stage_input.vPositionOs;
	    vTexCoord = stage_input.vTexCoord;
	    vNormalOs = stage_input.vNormalOs;
	    vTangentUOs_flTangentVSign = stage_input.vTangentUOs_flTangentVSign;
	    vBlendIndices = stage_input.vBlendIndices;
	    nInstanceIdx = stage_input.nInstanceIdx;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    stage_output.output_4 = output_4;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(AllowBackfaceCulling, false);
	BoolAttribute(SupportsAggregateInstancing, false);
	BoolAttribute(UseShadowFastPath, true);
	
}

PS
{
	StaticCombo( S_MODE_DEPTH, 0..1 );
	StaticCombo( S_MODE_FRONT_DEPTH, 0..1 );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_FRONT_DEPTH, S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow1( S_MODE_DEPTH, S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_DISCARD_IN_FRONT_OF_REFRACTIVE, 0..1 );
	DynamicCombo( D_SATURATION_VOLUMES, 0..1 );
	DynamicCombo( D_COSMIC_VEIL_FRONT_DEPTH, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_DISCARD_IN_FRONT_OF_REFRACTIVE ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_SATURATION_VOLUMES ) );
	DynamicComboRule( Requires( D_COSMIC_VEIL_FRONT_DEPTH, S_MODE_DEPTH, S_MODE_FRONT_DEPTH ) );
	
	RenderState(CullMode, (1 && !g_bDoubleSidedVeil) ? Back : None);
	RenderState(DepthEnable, exists(shadervar_wireframedepthenable) ? shadervar_wireframedepthenable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tFrameBufferCopyTexture < Attribute("FrameBufferCopyTexture"); SrgbRead(false); >;
	Texture2D g_tMasks < Channel(R, Box(TextureRefractMask), Linear); Channel(G, Box(TextureHueShiftMask), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tWarpMask < Channel(R, Box(TextureWarpMask), Linear); Channel(G, Box(TextureRevealMask), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	
	// Textures
	CreateInputTexture2D(TextureHueShiftMask, Linear, 8, "", "_mask", "Textures", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureRefractMask, Linear, 8, "", "_mask", "Textures", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureRevealMask, Linear, 8, "Inverse", "_mask", "Textures", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureWarpMask, Linear, 8, "", "_mask", "Textures", Default4(0.5, 0.5, 0.5, 0));
	float g_flRevealMax < Default(1); UiType(Slider); UiGroup("Textures"); >;
	float2 g_vWarpMaskBrightnessAmounts < Default2(1, 1); UiType(VectorText); UiGroup("Textures"); >;
	
	// Refract
	bool g_bDoubleSidedVeil < UiType(CheckBox); UiGroup("Refract"); >;
	float2 g_vHueShiftAmounts < Default2(-0.1, 0.1); Range2(-0.5, -0.5, 0.5, 0.5); UiType(VectorText); UiGroup("Refract/Visible"); UiVisibility(!g_bDoubleSidedVeil); >;
	float2 g_vRefractBlurAmounts < Default2(0.005, 0.005); Range2(0, 0, 0.1, 0.1); UiType(VectorText); UiGroup("Refract/Visible"); UiVisibility(!g_bDoubleSidedVeil); >;
	float2 g_vRefractBlurAmountsVeiled < Default2(0.005, 0.005); Range2(0, 0, 0.1, 0.1); UiType(VectorText); UiGroup("Refract/Veiled"); >;
	float2 g_vRefractBrightnessAmounts < Default2(1, 0.2); UiType(VectorText); UiGroup("Refract/Visible"); UiVisibility(!g_bDoubleSidedVeil); >;
	float2 g_vRefractBrightnessAmountsVeiled < Default2(1, 0.2); UiType(VectorText); UiGroup("Refract/Veiled"); >;
	float2 g_vRefractNoiseAmounts < Default2(0.5, 0.5); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Refract/Visible"); UiVisibility(!g_bDoubleSidedVeil); >;
	float2 g_vRefractNoiseAmountsVeiled < Default2(0.5, 0.5); Range2(0, 0, 8, 8); UiType(VectorText); UiGroup("Refract/Veiled"); >;
	
	// Fog
	float g_flCubemapFogStrength < Default(1); UiType(Slider); UiGroup("Fog"); >;
	float g_flGradientFogStrength < Default(1); UiType(Slider); UiGroup("Fog"); >;
	float g_flVolumeFogStrength < Default(1); UiType(Slider); UiGroup("Fog"); >;
	
	// Smoke
	float g_flSmokeRateVariance < Default(-0.8); Range(-1, 1); UiType(Slider); UiGroup("Smoke"); >;
	float g_flSmokeSpeed < Default(1); Range(0, 4); UiType(Slider); UiGroup("Smoke"); >;
	float g_flSmokeStepRotation < Default(0.01); Range(-0.02, 0.02); UiType(Slider); UiGroup("Smoke"); >;
	float g_flSmokeStepSize < Default(0.005); Range(0.001, 0.02); UiType(Slider); UiGroup("Smoke"); >;
	float2 g_vSmokeSpatialFrequencies < Default2(12, 17); Range2(1, 1, 25, 25); UiType(VectorText); UiGroup("Smoke"); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 20 (name: g_vSmokeSpatialFrequencies) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
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
	
	float _4;
	vec4 _5;
	
	struct _1523
	{
	    float _m0;
	    vec2 _m1;
	    vec2 _m2;
	    vec2 _m3;
	    vec4 _m4;
	    vec3 _m5;
	    vec4 _m6;
	};
	
	layout(set = 1) uniform _1523 PerViewConstantBuffer_t;
	
	struct _566
	{
	    uint g_sAnisoClamp;
	    uint g_sTrilinearWrap_NoGlobalMipBias;
	    uint g_sPointClamp;
	    uint g_sPointWrap;
	    uint g_sFogVolume;
	    uint g_tFrameBufferCopyTexture;
	    uint g_tMasks;
	    uint g_tWarpMask;
	    vec2 g_vRefractBlurAmounts;
	    vec2 g_vRefractNoiseAmounts;
	    vec2 g_vRefractBrightnessAmounts;
	    vec2 g_vRefractBlurAmountsVeiled;
	    vec2 g_vRefractNoiseAmountsVeiled;
	    vec2 g_vRefractBrightnessAmountsVeiled;
	    vec2 g_vHueShiftAmounts;
	    int g_bDoubleSidedVeil;
	    float g_flSmokeSpeed;
	    float g_flSmokeRateVariance;
	    float g_flSmokeStepSize;
	    float g_flSmokeStepRotation;
	    vec2 g_vSmokeSpatialFrequencies;
	    float g_flRevealMax;
	    vec2 g_vWarpMaskBrightnessAmounts;
	    float g_flGradientFogStrength;
	    float g_flCubemapFogStrength;
	    float g_flVolumeFogStrength;
	};
	
	layout(set = 1) uniform _566 _Globals_;
	
	struct _1906
	{
	    uint _m0;
	    uint _m1;
	    uint _m2;
	    uint _m3;
	    uint _m4;
	    ivec2 _m5;
	    vec4 _m6;
	    vec4 _m7;
	    vec4 _m8;
	    vec4 _m9;
	    vec4 _m10;
	    vec4 _m11;
	    vec4 _m12;
	    mat4 _m13;
	    vec4 _m14;
	    vec4 _m15;
	    _1854 _m16;
	};
	
	layout(set = 1) uniform _1906 PerViewConstantBufferCitadel_t;
	
	struct _1017
	{
	    vec4 _m0;
	};
	
	layout(set = 3) uniform _1017 PerViewLightingConstantBufferGpu_t;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	layout(set = 4, binding = 46) uniform textureCube g_bindless_TextureCube_float4[65536];
	layout(set = 4, binding = 46) uniform texture3D g_bindless_Texture3D_float4[65536];
	
	layout(location = 2) in vec3 input_2;
	layout(location = 1) in vec4 input_1;
	layout(location = 3) in vec4 input_3;
	layout(location = 0) out vec4 output_0;
	
	void main()
	{
	    vec3 _5578 = input_2 + PerViewConstantBuffer_t._m5.xyz;
	    bool _21709;
	    if (gl_FrontFacing)
	    {
	        _21709 = true;
	    }
	    else
	    {
	        _21709 = _Globals_.g_bDoubleSidedVeil != 0;
	    }
	    vec4 _19372 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tWarpMask], g_bindless_Sampler[_Globals_.g_sAnisoClamp]), input_1.xy);
	    float _4155 = _19372.x;
	    if ((input_3.w * _Globals_.g_flRevealMax) < _19372.y)
	    {
	        discard;
	    }
	    vec2 _21710;
	    if (_4155 > 0.0)
	    {
	        float _20154 = 0.5 * _Globals_.g_flSmokeRateVariance;
	        float _18208 = (0.5 + _20154) * _Globals_.g_flSmokeSpeed;
	        float _7242 = (0.5 - _20154) * _Globals_.g_flSmokeSpeed;
	        vec2 _15118 = vec2(_Globals_.g_flSmokeStepRotation, _Globals_.g_flSmokeStepRotation + 1.57079637050628662109375);
	        vec4 _19492 = (_15118 - (floor(_15118 * 0.15915493667125701904296875) * 6.283185482025146484375)).xxyy * 0.636619746685028076171875;
	        vec4 _9954 = saturate(((vec4(1.0, 3.0, 1.0, 3.0) - _19492) * (_19492 + vec4(-1.0, -3.0, -1.0, -3.0))) + vec4(1.0));
	        vec2 _11598 = _9954.xz - _9954.yw;
	        vec2 _13155;
	        _13155 = (input_1.xy * 2.0) - vec2(1.0);
	        vec2 _15833;
	        int _18440;
	        int _16208 = 0;
	        for (;;)
	        {
	            if (!(_16208 < 25))
	            {
	                break;
	            }
	            vec2 _8916 = vec2((_Globals_.g_vSmokeSpatialFrequencies.y * _13155.y) + (PerViewConstantBuffer_t._m0 * _18208), _4);
	            vec4 _19493 = (_8916 - (floor(_8916 * 0.15915493667125701904296875) * 6.283185482025146484375)).xxyy * 0.636619746685028076171875;
	            vec4 _9955 = saturate(((vec4(1.0, 3.0, 1.0, 3.0) - _19493) * (_19493 + vec4(-1.0, -3.0, -1.0, -3.0))) + vec4(1.0));
	            float _16644 = (_Globals_.g_vSmokeSpatialFrequencies.x * _13155.x) + (PerViewConstantBuffer_t._m0 * _7242);
	            vec2 _24761 = vec2(_16644, _16644 + 1.57079637050628662109375);
	            vec4 _19494 = (_24761 - (floor(_24761 * 0.15915493667125701904296875) * 6.283185482025146484375)).xxyy * 0.636619746685028076171875;
	            vec4 _9956 = saturate(((vec4(1.0, 3.0, 1.0, 3.0) - _19494) * (_19494 + vec4(-1.0, -3.0, -1.0, -3.0))) + vec4(1.0));
	            vec2 _22471 = _13155 + (vec2((_9955.xz - _9955.yw).x, (_9956.xz - _9956.yw).y) * _Globals_.g_flSmokeStepSize);
	            float _11140 = _11598.y;
	            float _19666 = _22471.x;
	            float _15532 = _11598.x;
	            float _23842 = _22471.y;
	            _15833 = vec2((_11140 * _19666) - (_15532 * _23842), (_15532 * _19666) + (_11140 * _23842));
	            _18440 = _16208 + 1;
	            _13155 = _15833;
	            _16208 = _18440;
	            continue;
	        }
	        _21710 = mix(input_1.xy, (_13155 * 0.5) + vec2(0.5), vec2(_4155));
	    }
	    else
	    {
	        _21710 = input_1.xy;
	    }
	    vec4 _3300 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tMasks], g_bindless_Sampler[_Globals_.g_sAnisoClamp]), _21710.xy);
	    float _3818 = _3300.x;
	    vec4 _19373 = texture(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (gl_FragCoord.xy * PerViewConstantBuffer_t._m4.xy).xy);
	    float _16038 = _19373.x;
	    if (!((0.01600000075995922088623046875 - (abs(gl_FragCoord.z - _16038) / max(gl_FragCoord.z, _16038))) > 0.0))
	    {
	        discard;
	    }
	    float _9982;
	    float _22532;
	    if (_21709)
	    {
	        _9982 = mix(_Globals_.g_vRefractNoiseAmountsVeiled.x, _Globals_.g_vRefractNoiseAmountsVeiled.y, _3818);
	        _22532 = mix(_Globals_.g_vRefractBlurAmountsVeiled.x, _Globals_.g_vRefractBlurAmountsVeiled.y, _3818);
	    }
	    else
	    {
	        _9982 = mix(_Globals_.g_vRefractNoiseAmounts.x, _Globals_.g_vRefractNoiseAmounts.y, _3818);
	        _22532 = mix(_Globals_.g_vRefractBlurAmounts.x, _Globals_.g_vRefractBlurAmounts.y, _3818);
	    }
	    vec2 _22263;
	    vec2 _21981 = (gl_FragCoord.xy - PerViewConstantBuffer_t._m2.xy).xy * PerViewConstantBuffer_t._m3.xy;
	    vec2 _20121 = (_21981.xy + ((((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m1], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m5)), 0).xy, 0).xyz * 2.0) - vec3(1.0)).xy * _22532) * _9982)).xy;
	    vec4 _9680;
	    do
	    {
	        vec2 _22914 = saturate(_20121);
	        _22263 = PerViewConstantBuffer_t._m1.xy;
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * _22263).xy, 0.0).x == 0.0)
	        {
	            _9680 = vec4(0.0);
	            break;
	        }
	        _9680 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_22914 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12176;
	    do
	    {
	        vec2 _11492 = saturate(_20121 + (vec2(-0.087600000202655792236328125, 0.970300018787384033203125) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11492 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12176 = vec4(0.0);
	            break;
	        }
	        _12176 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11492 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12177;
	    do
	    {
	        vec2 _11493 = saturate(_20121 + (vec2(0.480199992656707763671875, 0.565100014209747314453125) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11493 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12177 = vec4(0.0);
	            break;
	        }
	        _12177 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11493 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12178;
	    do
	    {
	        vec2 _11494 = saturate(_20121 + (vec2(0.18510000407695770263671875, 0.15800000727176666259765625) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11494 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12178 = vec4(0.0);
	            break;
	        }
	        _12178 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11494 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12179;
	    do
	    {
	        vec2 _11495 = saturate(_20121 + (vec2(-0.2615999877452850341796875, -0.06170000135898590087890625) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11495 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12179 = vec4(0.0);
	            break;
	        }
	        _12179 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11495 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12180;
	    do
	    {
	        vec2 _11496 = saturate(_20121 + (vec2(-0.547699987888336181640625, -0.6603000164031982421875) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11496 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12180 = vec4(0.0);
	            break;
	        }
	        _12180 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11496 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12181;
	    do
	    {
	        vec2 _11497 = saturate(_20121 + (vec2(-0.5325000286102294921875, 0.0710999965667724609375) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11497 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12181 = vec4(0.0);
	            break;
	        }
	        _12181 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11497 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _12182;
	    do
	    {
	        vec2 _11498 = saturate(_20121 + (vec2(-0.075099997222423553466796875, -0.895399987697601318359375) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11498 * _22263).xy, 0.0).x == 0.0)
	        {
	            _12182 = vec4(0.0);
	            break;
	        }
	        _12182 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11498 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _11017;
	    do
	    {
	        vec2 _11499 = saturate(_20121 + (vec2(0.638400018215179443359375, -0.4054000079631805419921875) * _22532));
	        if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11499 * _22263).xy, 0.0).x == 0.0)
	        {
	            _11017 = vec4(0.0);
	            break;
	        }
	        _11017 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11499 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	        break;
	    } while(false);
	    vec4 _8709 = (((((((_9680 + _12176) + _12177) + _12178) + _12179) + _12180) + _12181) + _12182) + _11017;
	    float _10412 = _8709.w;
	    vec4 _22821;
	    if (_10412 > 0.0)
	    {
	        vec3 _8908 = _8709.xyz / vec3(_10412);
	        vec4 _22905;
	        _22905.x = _8908.x;
	        _22905.y = _8908.y;
	        _22905.z = _8908.z;
	        _22821 = _22905;
	    }
	    else
	    {
	        vec4 _12501;
	        do
	        {
	            vec2 _11500 = saturate(_21981.xy);
	            if (textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m4], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11500 * _22263).xy, 0.0).x == 0.0)
	            {
	                _12501 = vec4(0.0);
	                break;
	            }
	            _12501 = vec4(textureLod(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tFrameBufferCopyTexture], g_bindless_Sampler[_Globals_.g_sPointClamp]), (_11500 * PerViewConstantBuffer_t._m6.zw).xy, 0.0).xyz, 1.0);
	            break;
	        } while(false);
	        _22821 = _12501;
	    }
	    vec3 _12885;
	    if (_21709)
	    {
	        _12885 = vec3(dot(_22821.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125)));
	    }
	    else
	    {
	        float _19434 = max(_22821.x, max(_22821.y, _22821.z));
	        vec3 _23794;
	        if (_19434 > 0.0)
	        {
	            vec3 _13119 = _22821.xyz / vec3(_19434);
	            float _9762 = _13119.x;
	            float _10734 = _13119.y;
	            float _21520 = _13119.z;
	            float _16611 = max(_9762, max(_10734, _21520));
	            float _12972 = _16611 - min(_9762, min(_10734, _21520));
	            vec3 _6553 = vec3(0.0);
	            _6553.z = _16611;
	            vec3 _21711;
	            if (_12972 != 0.0)
	            {
	                float _20364 = _12972 / _16611;
	                vec3 _18850 = (_6553.zzz - _13119.xyz) / vec3(_12972);
	                vec3 _18380 = _18850.xyz - _18850.zxy;
	                vec2 _10889 = _18380.xy + vec2(2.0, 4.0);
	                vec3 _20309;
	                if (_9762 >= _16611)
	                {
	                    _20309 = vec3(_18380.z, _20364, _16611);
	                }
	                else
	                {
	                    vec3 _12502;
	                    if (_10734 >= _16611)
	                    {
	                        _12502 = vec3(_10889.x, _20364, _16611);
	                    }
	                    else
	                    {
	                        _12502 = vec3(_10889.y, _20364, _16611);
	                    }
	                    _20309 = _12502;
	                }
	                vec3 _11027 = _20309;
	                _11027.x = fract(_20309.x * 0.16666667163372039794921875);
	                _21711 = _11027;
	            }
	            else
	            {
	                _21711 = _6553;
	            }
	            vec3 _11960;
	            if (_21711.y != 0.0)
	            {
	                float _13753 = (_21711.x + ((_3300.y * (_Globals_.g_vHueShiftAmounts.y - _Globals_.g_vHueShiftAmounts.x)) + _Globals_.g_vHueShiftAmounts.x)) * 6.0;
	                float _13270 = floor(_13753);
	                float _19977 = _21711.z * (1.0 - _21711.y);
	                float _17993 = _13753 - _13270;
	                float _10560 = _21711.z * (1.0 - (_21711.y * _17993));
	                float _23319 = _21711.z * (1.0 - (_21711.y * (1.0 - _17993)));
	                vec3 _12507;
	                if (_13270 == 0.0)
	                {
	                    _12507 = vec3(_21711.z, _23319, _19977);
	                }
	                else
	                {
	                    vec3 _12506;
	                    if (_13270 == 1.0)
	                    {
	                        _12506 = vec3(_10560, _21711.z, _19977);
	                    }
	                    else
	                    {
	                        vec3 _12505;
	                        if (_13270 == 2.0)
	                        {
	                            _12505 = vec3(_19977, _21711.z, _23319);
	                        }
	                        else
	                        {
	                            vec3 _12504;
	                            if (_13270 == 3.0)
	                            {
	                                _12504 = vec3(_19977, _10560, _21711.z);
	                            }
	                            else
	                            {
	                                vec3 _12503;
	                                if (_13270 == 4.0)
	                                {
	                                    _12503 = vec3(_23319, _19977, _21711.z);
	                                }
	                                else
	                                {
	                                    _12503 = vec3(_21711.z, _19977, _10560);
	                                }
	                                _12504 = _12503;
	                            }
	                            _12505 = _12504;
	                        }
	                        _12506 = _12505;
	                    }
	                    _12507 = _12506;
	                }
	                _11960 = _12507;
	            }
	            else
	            {
	                _11960 = _21711.zzz;
	            }
	            _23794 = _11960 * _19434;
	        }
	        else
	        {
	            _23794 = _22821.xyz;
	        }
	        _12885 = mix(_22821.xyz, _23794, vec3(mix(0.699999988079071044921875, 1.0, _3818)));
	    }
	    vec2 _19321;
	    if (_21709)
	    {
	        _19321 = _Globals_.g_vRefractBrightnessAmountsVeiled;
	    }
	    else
	    {
	        _19321 = _Globals_.g_vRefractBrightnessAmounts;
	    }
	    vec3 _10329 = _12885 * (mix(_19321.x, _19321.y, _3818) * mix(_Globals_.g_vWarpMaskBrightnessAmounts.x, _Globals_.g_vWarpMaskBrightnessAmounts.y, _4155));
	    vec3 _21712;
	    do
	    {
	        vec2 _17534 = _5578.xy - PerViewConstantBufferCitadel_t._m10.xy;
	        bool _12886;
	        if (dot(_17534, _17534) > PerViewConstantBufferCitadel_t._m9.x)
	        {
	            _12886 = _5578.z < PerViewConstantBufferCitadel_t._m9.y;
	        }
	        else
	        {
	            _12886 = false;
	        }
	        SPIRV_CROSS_BRANCH
	        if (_12886)
	        {
	            vec2 _9342 = saturate(PerViewConstantBufferCitadel_t._m6.xy + (PerViewConstantBufferCitadel_t._m6.zw * vec2(length(_17534), _5578.z)));
	            float _6976 = ((pow(_9342.x, PerViewConstantBufferCitadel_t._m7.x) * pow(_9342.y, PerViewConstantBufferCitadel_t._m7.y)) * PerViewConstantBufferCitadel_t._m8.w) * _Globals_.g_flGradientFogStrength;
	            _21712 = (_10329 * vec3(1.0 - _6976)) + (vec4(PerViewConstantBufferCitadel_t._m8.xyz, _6976).xyz * _6976);
	            break;
	        }
	        _21712 = _10329;
	        break;
	    } while(false);
	    vec3 _21713;
	    do
	    {
	        bool _12887;
	        if (dot(input_2, input_2) > PerViewConstantBufferCitadel_t._m14.x)
	        {
	            _12887 = true;
	        }
	        else
	        {
	            _12887 = _5578.z > PerViewConstantBufferCitadel_t._m14.y;
	        }
	        if (_12887)
	        {
	            float _6587 = max(pow(max(0.0, (length(input_2) * PerViewConstantBufferCitadel_t._m11.y) + PerViewConstantBufferCitadel_t._m11.x), PerViewConstantBufferCitadel_t._m11.w), pow(max(0.0, (_5578.z * PerViewConstantBufferCitadel_t._m12.y) + PerViewConstantBufferCitadel_t._m12.x), PerViewConstantBufferCitadel_t._m12.z));
	            vec3 _13070 = textureLod(samplerCube(g_bindless_TextureCube_float4[PerViewConstantBufferCitadel_t._m3], g_bindless_Sampler[_Globals_.g_sTrilinearWrap_NoGlobalMipBias]), normalize((PerViewConstantBufferCitadel_t._m13 * vec4(input_2, 0.0)).xyz).xyz, PerViewConstantBufferCitadel_t._m12.w * saturate(1.0 - (_6587 * PerViewConstantBufferCitadel_t._m11.z))).xyz * PerViewConstantBufferCitadel_t._m15.xyz;
	            vec4 _23714;
	            _23714.x = _13070.x;
	            _23714.y = _13070.y;
	            _23714.z = _13070.z;
	            float _16973 = saturate(_6587) * _Globals_.g_flCubemapFogStrength;
	            _21713 = (_21712 * vec3(1.0 - _16973)) + (vec4(_23714.xyz, _16973).xyz * _16973);
	            break;
	        }
	        _21713 = _21712;
	        break;
	    } while(false);
	    vec3 _19322;
	    do
	    {
	        bool _12888;
	        if (PerViewConstantBufferCitadel_t._m0 != 0u)
	        {
	            _12888 = _Globals_.g_flVolumeFogStrength > 0.0;
	        }
	        else
	        {
	            _12888 = false;
	        }
	        if (_12888)
	        {
	            vec4 _18372 = vec4(_5578.xyz + fma(textureLod(sampler2D(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m1], g_bindless_Sampler[_Globals_.g_sPointWrap]), fma(gl_FragCoord.xy, PerViewLightingConstantBufferGpu_t._m0.zz, PerViewLightingConstantBufferGpu_t._m0.xy).xy, 0.0).xyz, vec3(PerViewConstantBufferCitadel_t._m16._m0), vec3(PerViewConstantBufferCitadel_t._m16._m1)), 1.0) * PerViewConstantBufferCitadel_t._m16._m6;
	            float _20176 = _18372.w;
	            vec2 _10521 = _18372.xy / vec2(_20176);
	            vec4 _22906;
	            _22906.x = _10521.x;
	            _22906.y = _10521.y;
	            float _21043 = (_20176 * PerViewConstantBufferCitadel_t._m16._m3) + PerViewConstantBufferCitadel_t._m16._m2;
	            vec3 _17137 = vec3((_22906.xy * 0.5) + vec2(0.5), _21043);
	            _17137.z = log2((saturate(_21043) * PerViewConstantBufferCitadel_t._m16._m4) + 1.0) * PerViewConstantBufferCitadel_t._m16._m5;
	            vec4 _12684 = textureLod(sampler3D(g_bindless_Texture3D_float4[PerViewConstantBufferCitadel_t._m2], g_bindless_Sampler[_Globals_.g_sFogVolume]), _17137, 0.0);
	            vec4 _14039 = vec4(_12684.xyz * _Globals_.g_flVolumeFogStrength, mix(1.0, _12684.w, _Globals_.g_flVolumeFogStrength));
	            _19322 = (_21713 * _14039.www) + _14039.xyz;
	            break;
	        }
	        _19322 = _21713;
	        break;
	    } while(false);
	    output_0 = vec4(_19322, 1.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tWarpMask);
	BoolAttribute(SupportsLightmapping, false);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(translucent, true);
	BoolAttribute(mapbuilder_donotcollapse, false);
	BoolAttribute(renderbackfaces, true);
	BoolAttribute(bWantsFBCopyTexture, true);
	BoolAttribute(CosmicVeil, true);
	BoolAttribute(DoNotCastShadows, true);
	
}
