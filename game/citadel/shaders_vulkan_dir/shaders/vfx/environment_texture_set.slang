//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Container for PBR environment textures";
	DevShader = false;
	Version = 4;
	
	// Platform: VULKAN_SM_50
	// Programs: ps, vs
}

MODES
{
	Depth("depth_only_bindless.vfx");
	Deferred();
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
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;              // D_CS_VERTEX_ANIMATION=0
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	
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
	cbuffer PerViewConstantBuffer_t : register(b0, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c0);
	    float4 PerViewConstantBuffer_t_1_m1 : packoffset(c17);
	    float4 PerViewConstantBuffer_t_1_m2 : packoffset(c24);
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	};
	
	
	static float4 gl_Position;
	static float gl_ClipDistance[1];
	static uint nInstanceIdx;
	static uint4 vBlendIndices;
	static float3 vNormalOs;
	static float4 vTangentUOs_flTangentVSign;
	static float3 vPositionOs;
	static float2 vTexCoord;
	static float3 output_0;
	static float4 output_1;
	static float4 output_2;
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
	    float4 output_2 : TEXCOORD2;
	    float4 output_3 : TEXCOORD3;
	    float4 output_4 : TEXCOORD4;
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
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375f)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    float3 _22017 = mul(_24688, float4(vPositionOs.xyz, 1.0f));
	    float3 _10377 = _22017 - PerViewConstantBuffer_t_1_m3.xyz;
	    float4 _22101 = 0.0f.xxxx;
	    _22101.x = _10377.x;
	    _22101.y = _10377.y;
	    _22101.z = _10377.z;
	    float4 _18256 = mul(PerViewConstantBuffer_t_1_m0, (float4(_22017.xyz, 1.0f) + (PerViewConstantBuffer_t_1_m2 * 1.0f)).xyzw);
	    output_0 = normalize(mul(_13976, vNormalOs));
	    output_1 = float4(vTexCoord.xyxy);
	    output_2 = _22101;
	    output_3 = float4(_21354, _21355, _19302, _23812.w);
	    output_4 = float4(normalize(mul(_13976, vTangentUOs_flTangentVSign.xyz)), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(float4(_22017.xyz, 1.0f), PerViewConstantBuffer_t_1_m1.xyzw);
	}
	
	PS_INPUT MainVs(VS_INPUT stage_input)
	{
	    nInstanceIdx = stage_input.nInstanceIdx;
	    vBlendIndices = stage_input.vBlendIndices;
	    vNormalOs = stage_input.vNormalOs;
	    vTangentUOs_flTangentVSign = stage_input.vTangentUOs_flTangentVSign;
	    vPositionOs = stage_input.vPositionOs;
	    vTexCoord = stage_input.vTexCoord;
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
	
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(DepthWriteEnable, false);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tBlueNoise < Attribute("BlueNoise"); SrgbRead(false); >;
	Texture2D g_tColor1 < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureTintMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tNormalRoughness1 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tPacked1 < Channel(R, Box(TextureSelfIllum1), Linear); Channel(G, Box(TextureMetalness1), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// ENVIRONMENT_LAYER 1
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 1 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness1, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 1 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 1 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 1 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum1, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 1 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask1, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 1 / Tint Mask", Default4(1, 1, 1, 0));
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space1)
	{
	    int2 PerViewConstantBufferCitadel_t_1_m0 : packoffset(c6);
	    int PerViewConstantBufferCitadel_t_1_m1 : packoffset(c39);
	};
	
	cbuffer PerViewConstantBuffer_t : register(b1, space1)
	{
	    float PerViewConstantBuffer_t_1_m0 : packoffset(c18.z);
	};
	
	Texture2D<float4> g_tNormalRoughness1 : register(t57, space1);
	SamplerState Filter_Anisotropic_MaxAniso_8 : register(s14, space1);
	Texture2D<float4> g_tColor1 : register(t56, space1);
	Texture2D<float4> g_tPacked1 : register(t58, space1);
	Texture2D<float4> g_tBlueNoise : register(t30, space1);
	
	static float4 gl_FragCoord;
	static float3 input_0;
	static float4 input_4;
	static float4 input_1;
	static float4 input_3;
	static float4 output_0;
	static float4 output_1;
	static float4 output_2;
	static float2 output_3;
	
	struct PS_INPUT
	{
	    float3 input_0 : TEXCOORD0;
	    float4 input_1 : TEXCOORD1;
	    float4 input_3 : TEXCOORD3;
	    float4 input_4 : TEXCOORD4;
	    float4 gl_FragCoord : SV_Position;
	};
	
	struct PS_OUTPUT
	{
	    float4 output_0 : SV_Target0;
	    float4 output_1 : SV_Target1;
	    float4 output_2 : SV_Target2;
	    float2 output_3 : SV_Target3;
	};
	
	void MainPs_inner()
	{
	    float4 _19372 = g_tNormalRoughness1.Sample(Filter_Anisotropic_MaxAniso_8, input_1.xy);
	    float _7623 = _19372.x;
	    float _7536 = _19372.y;
	    float _13567 = (_7623 + _7536) - 1.00392162799835205078125f;
	    float _11176 = _7623 - _7536;
	    float3 _15728 = normalize(float3(float2(_13567, _11176), (1.0f - abs(_13567)) - abs(_11176)));
	    float4 _18992 = g_tColor1.Sample(Filter_Anisotropic_MaxAniso_8, input_1.xy);
	    float4 _3300 = g_tPacked1.Sample(Filter_Anisotropic_MaxAniso_8, input_1.xy);
	    float _3977 = _3300.x;
	    float3 _4987 = _18992.xyz;
	    float3 _13298 = lerp(_4987, _4987 * input_3.xyz, _18992.w.xxx);
	    float3 _9982;
	    float _23995;
	    if (PerViewConstantBufferCitadel_t_1_m1 != 0)
	    {
	        bool _11159 = step(0.5f, frac(PerViewConstantBuffer_t_1_m0 * 0.5f)) != 0.0f;
	        bool3 _19120 = _11159.xxx;
	        _9982 = float3(_19120.x ? float3(1.0f, 0.0f, 0.0f).x : _13298.x, _19120.y ? float3(1.0f, 0.0f, 0.0f).y : _13298.y, _19120.z ? float3(1.0f, 0.0f, 0.0f).z : _13298.z);
	        _23995 = _11159 ? 1.0f : _3977;
	    }
	    else
	    {
	        _9982 = _13298;
	        _23995 = _3977;
	    }
	    float _18612 = saturate(_23995 * 0.100000001490116119384765625f);
	    float _19133;
	    if (_18612 != 0.0f)
	    {
	        _19133 = _18612 + ((g_tBlueNoise.Load(int3(int3(int2(uint2(gl_FragCoord.xy).xy & uint2(PerViewConstantBufferCitadel_t_1_m0)), 0).xy, 0)).xyz * 0.0039215688593685626983642578125f) - 0.00196078442968428134918212890625f.xxx).z;
	    }
	    else
	    {
	        _19133 = _18612;
	    }
	    output_0 = float4((normalize((((input_4.xyz * _15728.x).xyz + ((cross(input_0.xyz, input_4.xyz) * ((input_4.w > 0.0f) ? 1.0f : (-1.0f))).xyz * (-_15728.y))).xyz + (input_0.xyz * _15728.z)).xyz).xyz * 0.5f) + 0.5f.xxx, 0.0f);
	    output_1 = float4(_9982, 0.12549020349979400634765625f);
	    output_2 = float4(_19372.z, 0.0f, _19133, _3300.y);
	    output_3 = 0.0f.xx;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    input_0 = stage_input.input_0;
	    input_4 = stage_input.input_4;
	    input_1 = stage_input.input_1;
	    input_3 = stage_input.input_3;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor1);
	StringAttribute(MaterialLayerType, environment_texture_set);
	
}
