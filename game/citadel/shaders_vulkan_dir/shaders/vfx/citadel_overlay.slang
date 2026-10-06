//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Overlay shader";
	DevShader = false;
	Version = 7;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, rtx, vs
}

MODES
{
	Forward();
	Deferred();
	RayTrace();
	ToolsVis(S_MODE_TOOLS_VIS);
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
}

FEATURES
{
	Feature( F_RENDER_ON_TRANSLUCENT, 0..1, "Render on Translucent" );
	Feature( F_DECAL_SPACE_NORMALS, 0..1, "Normals in object space" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;              // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vProjectionDir             : TEXCOORD5      < Semantic( OverlayProjectionDirection ); >;
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticCombo( S_RENDER_ON_TRANSLUCENT, F_RENDER_ON_TRANSLUCENT );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	
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
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static float3 vPositionOs;
	static float2 vTexCoord;
	static float4 vProjectionDir;
	static float3 output_0;
	static float2 output_1;
	static float3 output_2;
	static float4 output_3;
	static float4 output_4;
	static float4 output_5;
	
	struct VS_INPUT
	{
	    float3 vPositionOs : TEXCOORD0;
	    float2 vTexCoord : TEXCOORD1;
	    float3 vNormalOs : TEXCOORD2;
	    float4 vTangentUOs_flTangentVSign : TEXCOORD3;
	    float4 vProjectionDir : TEXCOORD4;
	    uint4 vBlendIndices : TEXCOORD5;
	    uint nInstanceIdx : TEXCOORD6;
	};
	
	struct PS_INPUT
	{
	    float3 output_0 : TEXCOORD0;
	    float2 output_1 : TEXCOORD1;
	    float3 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
	    float4 output_5 : TEXCOORD5;
	    float4 gl_Position : SV_Position;
	    float gl_ClipDistance0 : SV_ClipDistance0;
	};
	
	void MainVs_inner()
	{
	    uint _21785;
	    if (((g_instanceBuffer.Load(nInstanceIdx * 32 + 20) >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4) + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer.Load(nInstanceIdx * 32 + 4);
	    }
	    float3x4 _8525 = asfloat(uint3x4(g_transformBuffer.Load4(_21785 * 48 + 0), g_transformBuffer.Load4(_21785 * 48 + 16), g_transformBuffer.Load4(_21785 * 48 + 32)));
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
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    float3 _19937 = mul(_8525, float4(vPositionOs.xyz, 1.0f));
	    float4 _17895 = mul(PerViewConstantBuffer_t_1_m0, (float4(_19937.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_8525, float4(vNormalOs.xyz, 0.0f)));
	    output_1 = vTexCoord;
	    output_2 = _19937;
	    output_3 = float4(_21354, _21355, _19302, _23812.w);
	    output_4 = float4(normalize(mul(_8525, float4(vTangentUOs_flTangentVSign.xyz, 0.0f))), vTangentUOs_flTangentVSign.w);
	    output_5 = (vProjectionDir * 2.0f) - 1.0f.xxxx;
	    _17895.y = -_17895.y;
	    gl_Position = _17895;
	    gl_ClipDistance[0] = dot(float4(_19937.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    vNormalOs = stage_input.vNormalOs;
	    vTangentUOs_flTangentVSign = stage_input.vTangentUOs_flTangentVSign;
	    vPositionOs = stage_input.vPositionOs;
	    vTexCoord = stage_input.vTexCoord;
	    vProjectionDir = stage_input.vProjectionDir;
	    MainVs_inner();
	    PS_INPUT stage_output;
	    stage_output.gl_Position = gl_Position;
	    stage_output.gl_ClipDistance0.x = gl_ClipDistance[0];
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    stage_output.output_4 = output_4;
	    stage_output.output_5 = output_5;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticCombo( S_RENDER_ON_TRANSLUCENT, F_RENDER_ON_TRANSLUCENT );
	StaticCombo( S_DECAL_SPACE_NORMALS, F_DECAL_SPACE_NORMALS );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_OVERLAY_WRITE_DEPTH, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, D_OVERLAY_WRITE_DEPTH ) );
	
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tAmbientOcclusion < Channel(G, Box3(TextureAmbientOcclusion), Linear); OutputFormat(DXT1); SrgbRead(false); >;
	Texture2D g_tColor < Channel(RGB, AlphaWeighted(TextureColor, TextureTranslucency), Srgb); Channel(A, Box(TextureTranslucency), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal, TextureRoughness), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tSelfIllumTintMask < Channel(R, Box3(TextureSelfIllumMask), Linear); Channel(G, Box(TextureTintMask), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	
	// PBR
	CreateInputTexture2D(TextureAmbientOcclusion, Linear, 8, "", "_ao", "PBR,10 / Ambient Occlusion,40 / 10", Default4(1, 1, 1, 0));
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "PBR,10 / Albedo,10 / 10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureNormal, Linear, 8, "NormalizeNormals", "_normal", "PBR,10 / Normal and Roughness,20 / 10", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness, Linear, 8, "Inverse", "_rough", "PBR,10 / Normal and Roughness,20 / 10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllumMask, Linear, 8, "", "_mask", "PBR,10 / Self Illum Mask,40 / 10", Default4(0, 0, 0, 0));
	float3 g_vColorTint < Default3(1, 1, 1); UiType(Color); UiGroup("PBR,10 / Albedo,10 / 10"); >;
	float2 g_vAlbedoTexcoordUVOffset < UiType(VectorText); UiGroup("PBR,10 / Albedo,10 / 20"); >;
	float2 g_vAlbedoScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("PBR,10 / Albedo, 10 / 30"); >;
	CreateInputTexture2D(TextureTintMask, Linear, 8, "", "_mask", "PBR,10 / Albedo, 10 / 40", Default4(1, 1, 1, 0));
	float2 g_vNormalAndRoughnessTexcoordUVOffset < UiType(VectorText); UiGroup("PBR,10 / Normal and Roughness,20 / 40"); >;
	float2 g_vNormalAndRoughnessScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("PBR,10 / Normal and Roughness, 20 / 50"); >;
	
	// Translucency
	CreateInputTexture2D(TextureTranslucency, Linear, 8, "", "_trans", "Translucency,20 / Translucency,10 / 10", Default4(1, 1, 1, 0));
	float2 g_vColorTranslucencyInputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 20"); >;
	float2 g_vColorTranslucencyOutputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 21"); >;
	float2 g_vNormalTranslucencyInputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 30"); >;
	float2 g_vNormalTranslucencyOutputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 31"); >;
	float2 g_vRoughnessSelfIllumAoTranslucencyInputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 40"); >;
	float2 g_vRoughnessSelfIllumAoTranslucencyOutputRange < Default(0); UiType(VectorText); UiGroup("Translucency,20 / Translucency,10 / 41"); >;
	
	// Flags
	bool g_bForceApply < UiType(CheckBox); UiGroup("Flags"); >;
	
	// Self Illum
	float3 g_vSelfIllumTint < Default3(1, 1, 1); UiType(Color); UiGroup("Self Illum,30 / 20"); >;
	float g_flSelfIllumScale < Range(0, 10); UiType(Slider); UiGroup("Self Illum,30 / 40"); >;
	float g_flSelfIllumAlbedoFactor < Default(1); UiType(Slider); UiGroup("Self Illum,30 / 50"); >;
	float2 g_vSelfIllumTexcoordOffset < UiType(VectorText); UiGroup("Self Illum,30 / 60"); >;
	float2 g_vSelfIllumScrollSpeed < Range2(-10, -10, 10, 10); UiType(VectorText); UiGroup("Self Illum,30 / 70"); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 20 (name: g_vSelfIllumScrollSpeed) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _1496
	{
	    uint _m0;
	    uint _m1;
	    ivec2 _m2;
	    float _m3;
	    vec4 _m4;
	    vec4 _m5;
	    vec4 _m6;
	};
	
	layout(set = 1) uniform _1496 PerViewConstantBufferCitadel_t;
	
	struct _559
	{
	    uint g_sAniso;
	    uint g_sTrilinearWrap;
	    uint g_tColor;
	    uint g_tNormalRoughness;
	    uint g_tSelfIllumTintMask;
	    vec3 g_vColorTint;
	    vec2 g_vAlbedoTexcoordUVOffset;
	    vec2 g_vAlbedoScrollSpeed;
	    vec2 g_vColorTranslucencyInputRange;
	    vec2 g_vColorTranslucencyOutputRange;
	    vec2 g_vNormalTranslucencyInputRange;
	    vec2 g_vNormalTranslucencyOutputRange;
	    vec2 g_vRoughnessSelfIllumAoTranslucencyInputRange;
	    vec2 g_vRoughnessSelfIllumAoTranslucencyOutputRange;
	    vec2 g_vNormalAndRoughnessTexcoordUVOffset;
	    vec2 g_vNormalAndRoughnessScrollSpeed;
	    vec3 g_vSelfIllumTint;
	    float g_flSelfIllumScale;
	    float g_flSelfIllumAlbedoFactor;
	    vec2 g_vSelfIllumTexcoordOffset;
	    vec2 g_vSelfIllumScrollSpeed;
	    int g_bForceApply;
	};
	
	layout(set = 1) uniform _559 _Globals_;
	
	struct _985
	{
	    float _m0;
	};
	
	layout(set = 1) uniform _985 PerViewConstantBuffer_t;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 2) in vec3 input_2;
	layout(location = 0) in vec3 input_0;
	layout(location = 4) in vec4 input_4;
	layout(location = 1) in vec2 input_1;
	layout(location = 3) in vec4 input_3;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	
	void main()
	{
	    float _21709;
	    do
	    {
	        bool _12885;
	        if (PerViewConstantBufferCitadel_t._m4.w > 0.0)
	        {
	            _12885 = true;
	        }
	        else
	        {
	            _12885 = PerViewConstantBufferCitadel_t._m5.w > 0.0;
	        }
	        if (_12885)
	        {
	            vec3 _8407 = PerViewConstantBufferCitadel_t._m5.xyz - PerViewConstantBufferCitadel_t._m4.xyz;
	            float _15380 = saturate(dot(input_2.xyz - PerViewConstantBufferCitadel_t._m4.xyz, normalize(_8407)) / length(_8407));
	            float _8523 = mix(PerViewConstantBufferCitadel_t._m4.w, PerViewConstantBufferCitadel_t._m5.w, _15380);
	            float _19396 = length(input_2.xyz - mix(PerViewConstantBufferCitadel_t._m4.xyz, PerViewConstantBufferCitadel_t._m5.xyz, vec3(_15380)));
	            if (_19396 < _8523)
	            {
	                _21709 = mix(PerViewConstantBufferCitadel_t._m6.y, 1.0, pow((saturate((_19396 - _8523) / ((_8523 * PerViewConstantBufferCitadel_t._m6.x) - _8523)) * (-1.0)) + 1.0, 2.0));
	                break;
	            }
	        }
	        _21709 = 1.0;
	        break;
	    } while(false);
	    if (_21709 < fract(texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(gl_FragCoord.xy) & PerViewConstantBufferCitadel_t._m2, 0).xy, 0).x + PerViewConstantBufferCitadel_t._m3))
	    {
	        discard;
	    }
	    if (_Globals_.g_bForceApply == 0)
	    {
	        if ((uint(texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m1], ivec3(ivec2(gl_FragCoord.xy), 0).xy, 0).w * 255.0) & 1u) != 0u)
	        {
	            discard;
	        }
	    }
	    vec4 _19372 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), (input_1.xy + fract(_Globals_.g_vNormalAndRoughnessTexcoordUVOffset.xy + (_Globals_.g_vNormalAndRoughnessScrollSpeed.xy * PerViewConstantBuffer_t._m0))).xy);
	    float _16000 = _19372.x;
	    float _19720 = _19372.y;
	    float _16783 = (_16000 + _19720) - 1.00392162799835205078125;
	    float _11176 = _16000 - _19720;
	    vec3 _15728 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	    vec4 _21760 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), (input_1.xy + fract(_Globals_.g_vAlbedoTexcoordUVOffset.xy + (_Globals_.g_vAlbedoScrollSpeed.xy * PerViewConstantBuffer_t._m0))).xy);
	    vec4 _3300 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tSelfIllumTintMask], g_bindless_Sampler[_Globals_.g_sTrilinearWrap]), (input_1.xy + fract(_Globals_.g_vSelfIllumTexcoordOffset.xy + (_Globals_.g_vSelfIllumScrollSpeed.xy * PerViewConstantBuffer_t._m0))).xy);
	    float _4668 = _3300.x;
	    vec3 _21938 = _21760.xyz;
	    vec3 _13989 = mix(_21938, (_21938 * _Globals_.g_vColorTint.xyz) * input_3.xyz, vec3(_3300.y)).xyz;
	    float _4637 = input_3.w * _21760.w;
	    float _16190 = saturate((_4668 * _Globals_.g_flSelfIllumScale) * 0.100000001490116119384765625);
	    float _19475;
	    if (_16190 != 0.0)
	    {
	        _19475 = _16190 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m2)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19475 = _16190;
	    }
	    output_0 = vec4((normalize((((input_4.xyz * _15728.x).xyz + ((cross(input_0.xyz, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))).xyz * (-_15728.y))).xyz + (input_0.xyz * _15728.z)).xyz).xyz * 0.5) + vec3(0.5), (saturate((_4637 - _Globals_.g_vNormalTranslucencyInputRange.x) / (_Globals_.g_vNormalTranslucencyInputRange.y - _Globals_.g_vNormalTranslucencyInputRange.x)) * (_Globals_.g_vNormalTranslucencyOutputRange.y - _Globals_.g_vNormalTranslucencyOutputRange.x)) + _Globals_.g_vNormalTranslucencyOutputRange.x);
	    output_1 = vec4(mix(_13989, mix(_Globals_.g_vSelfIllumTint.xyz, _Globals_.g_vSelfIllumTint.xyz * _13989, vec3(_Globals_.g_flSelfIllumAlbedoFactor)).xyz, vec3(_4668 * saturate(_Globals_.g_flSelfIllumScale))), (saturate((_4637 - _Globals_.g_vColorTranslucencyInputRange.x) / (_Globals_.g_vColorTranslucencyInputRange.y - _Globals_.g_vColorTranslucencyInputRange.x)) * (_Globals_.g_vColorTranslucencyOutputRange.y - _Globals_.g_vColorTranslucencyOutputRange.x)) + _Globals_.g_vColorTranslucencyOutputRange.x);
	    output_2 = vec4(_19372.z, 0.0, _19475, (saturate((_4637 - _Globals_.g_vRoughnessSelfIllumAoTranslucencyInputRange.x) / (_Globals_.g_vRoughnessSelfIllumAoTranslucencyInputRange.y - _Globals_.g_vRoughnessSelfIllumAoTranslucencyInputRange.x)) * (_Globals_.g_vRoughnessSelfIllumAoTranslucencyOutputRange.y - _Globals_.g_vRoughnessSelfIllumAoTranslucencyOutputRange.x)) + _Globals_.g_vRoughnessSelfIllumAoTranslucencyOutputRange.x);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsLightmapping, F_RENDER_ON_TRANSLUCENT ? 1 : 0);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(translucent, F_RENDER_ON_TRANSLUCENT);
	BoolAttribute(overlay, true);
	BoolAttribute(overlay_deferred, true);
	
}

RTX
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticCombo( S_RENDER_ON_TRANSLUCENT, F_RENDER_ON_TRANSLUCENT );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow0( S_RENDER_ON_TRANSLUCENT ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_RENDER_ON_TRANSLUCENT, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	float4x4 g_mHighPrecisionWorldFromProjNoJitter < Attribute("HighPrecisionWorldFromProjNoJitter"); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported shader stage.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_ray_tracing : require
	
	void main()
	{
	    ignoreIntersectionEXT;
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	
}
