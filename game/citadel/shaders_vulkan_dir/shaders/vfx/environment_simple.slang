//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Simple environment shader using vertex colors to drive PBR parameters.";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, rtx, vs
}

MODES
{
	Depth("depth_only_bindless.vfx");
	Deferred();
	Raytrace();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
}

FEATURES
{
	Feature( F_RENDER_BACKFACES, 0..1, "Rendering" );
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;             
	float4 vBlendColorTint            : COLOR0         < Semantic( VertexPaintTintColor ); >;     
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float4 vColorBlendValues          : TEXCOORD4      < Semantic( VertexPaintBlendParams ); >;   
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] StructuredBuffer g_instanceBuffer < Attribute("InstanceBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	[[layer_constant]] StructuredBuffer g_transformBuffer < Attribute("TransformBuffer"); >;
	float2 g_vTexCoord2ScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoord2UByModelScaleOrigin/2,g_nScaleTexCoord2VByModelScaleOrigin/2)); >;
	float4 g_vTexCoord2ScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoord2UByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoord2ScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoord2VByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==0) ? 1 : 0)); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// Texture Coordinates
	int g_nScaleTexCoordUByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/40"); >;
	int g_nScaleTexCoordVByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/50"); >;
	int g_nScaleTexCoordUByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/55"); >;
	int g_nScaleTexCoordVByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/56"); >;
	int g_nScaleTexCoord2UByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/60"); >;
	int g_nScaleTexCoord2VByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/70"); >;
	int g_nScaleTexCoord2UByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/75"); >;
	int g_nScaleTexCoord2VByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/76"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 5 (name: g_vTexCoord2ScaleByModelU) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	
	out float gl_ClipDistance[1];
	
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
	    mat3x4 _m0;
	};
	
	layout(set = 4, binding = 32, std430) readonly buffer g_instanceBuffer
	{
	    _1125 _m0[];
	} g_instanceBuffer_1;
	
	layout(set = 4, binding = 30, std430) readonly buffer g_transformBuffer
	{
	    _1119 _m0[];
	} g_transformBuffer_1;
	
	struct _1388
	{
	    mat4 _m0;
	    vec4 _m1;
	    vec4 _m2;
	    vec3 _m3;
	};
	
	layout(set = 0) uniform _1388 PerViewConstantBuffer_t;
	
	struct _1623
	{
	    int g_bTexCoordScaleByModel;
	    vec4 g_vTexCoordScaleByModelU;
	    vec4 g_vTexCoordScaleByModelV;
	    vec2 g_vTexCoordScaleByModelOrigin;
	    int g_bTexCoord2ScaleByModel;
	    vec4 g_vTexCoord2ScaleByModelU;
	    vec4 g_vTexCoord2ScaleByModelV;
	    vec2 g_vTexCoord2ScaleByModelOrigin;
	};
	
	layout(set = 0) uniform _1623 _Globals_;
	
	layout(location = 7) in uint nInstanceIdx;
	layout(location = 6) in uvec4 vBlendIndices;
	layout(location = 2) in vec4 vColorBlendValues;
	layout(location = 3) in vec4 vBlendColorTint;
	layout(location = 4) in vec3 vNormalOs;
	layout(location = 5) in vec4 vTangentUOs_flTangentVSign;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 1) in vec2 vTexCoord;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec4 output_3;
	layout(location = 4) out vec4 output_4;
	layout(location = 5) out vec4 output_5;
	
	void main()
	{
	    uint _21785;
	    if (((g_instanceBuffer_1._m0[nInstanceIdx]._m5 >> uint(16)) & 15u) == 1u)
	    {
	        _21785 = g_instanceBuffer_1._m0[nInstanceIdx]._m1 + (2u + vBlendIndices.x);
	    }
	    else
	    {
	        _21785 = g_instanceBuffer_1._m0[nInstanceIdx]._m1;
	    }
	    mat4x3 _10676 = transpose(g_transformBuffer_1._m0[_21785]._m0);
	    vec3 _7726 = _10676[0];
	    vec3 _16758 = _10676[1];
	    vec3 _16759 = _10676[2];
	    mat3 _13976 = transpose(mat3(_7726 * (1.0 / dot(_7726, _7726)), _16758 * (1.0 / dot(_16758, _16758)), _16759 * (1.0 / dot(_16759, _16759))));
	    vec4 _23812 = vec4(uvec4(g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 255u, (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 65280u) >> uint(8), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 16711680u) >> uint(16), (g_instanceBuffer_1._m0[nInstanceIdx]._m0 & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec3 _6253 = _23812.xyz;
	    vec3 _17828 = _6253 * vec3(0.077399380505084991455078125);
	    vec3 _7676 = pow((_6253 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _21354;
	    if (_23812.x <= 0.040449999272823333740234375)
	    {
	        _21354 = _17828.x;
	    }
	    else
	    {
	        _21354 = _7676.x;
	    }
	    float _21355;
	    if (_23812.y <= 0.040449999272823333740234375)
	    {
	        _21355 = _17828.y;
	    }
	    else
	    {
	        _21355 = _7676.y;
	    }
	    float _19167;
	    if (_23812.z <= 0.040449999272823333740234375)
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
	    vec4 _7680 = mix(vec4(1.0), _23812, vec4(vColorBlendValues.w));
	    vec3 _24030 = vBlendColorTint.xyz * vec3(0.077399380505084991455078125);
	    vec3 _7677 = pow((vBlendColorTint.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _21356;
	    if (vBlendColorTint.x <= 0.040449999272823333740234375)
	    {
	        _21356 = _24030.x;
	    }
	    else
	    {
	        _21356 = _7677.x;
	    }
	    float _21357;
	    if (vBlendColorTint.y <= 0.040449999272823333740234375)
	    {
	        _21357 = _24030.y;
	    }
	    else
	    {
	        _21357 = _7677.y;
	    }
	    float _19494;
	    if (vBlendColorTint.z <= 0.040449999272823333740234375)
	    {
	        _19494 = _24030.z;
	    }
	    else
	    {
	        _19494 = _7677.z;
	    }
	    vec3 _14119 = _7680.xyz * mix(vec3(1.0), vec3(_21356, _21357, _19494), vec3(vBlendColorTint.w));
	    vec4 _23714 = _7680;
	    _23714.x = _14119.x;
	    _23714.y = _14119.y;
	    _23714.z = _14119.z;
	    vec3 _22017 = vec4(vPositionOs.xyz, 1.0) * g_transformBuffer_1._m0[_21785]._m0;
	    vec4 _18256 = (vec4(_22017.xyz, 1.0) + (PerViewConstantBuffer_t._m2 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    vec4 _13745 = vec4(vTexCoord.xyxy);
	    bool _14874 = _Globals_.g_bTexCoordScaleByModel != 0;
	    bool _12885;
	    if (_14874)
	    {
	        _12885 = true;
	    }
	    else
	    {
	        _12885 = _Globals_.g_bTexCoord2ScaleByModel != 0;
	    }
	    vec4 _22247;
	    if (_12885)
	    {
	        bvec4 _9579 = greaterThanEqual(_13745.xyzw, vec4(0.0));
	        float _25108 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].x, g_transformBuffer_1._m0[_21785]._m0[1].x, g_transformBuffer_1._m0[_21785]._m0[2].x));
	        float _25109 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].y, g_transformBuffer_1._m0[_21785]._m0[1].y, g_transformBuffer_1._m0[_21785]._m0[2].y));
	        float _18672 = length(vec3(g_transformBuffer_1._m0[_21785]._m0[0].z, g_transformBuffer_1._m0[_21785]._m0[1].z, g_transformBuffer_1._m0[_21785]._m0[2].z));
	        vec4 _21709;
	        if (_14874)
	        {
	            vec4 _10934 = vec4(_25108, _25109, _18672, 1.0);
	            vec4 _22475;
	            if (_9579.x)
	            {
	                vec4 _10180 = _13745;
	                _10180.x = ((vTexCoord.x - _Globals_.g_vTexCoordScaleByModelOrigin.x) * dot(_10934, _Globals_.g_vTexCoordScaleByModelU.xyzw)) + _Globals_.g_vTexCoordScaleByModelOrigin.x;
	                _22475 = _10180;
	            }
	            else
	            {
	                _22475 = _13745;
	            }
	            vec4 _12501;
	            if (_9579.y)
	            {
	                vec4 _10181 = _22475;
	                _10181.y = ((_22475.y - _Globals_.g_vTexCoordScaleByModelOrigin.y) * dot(_10934, _Globals_.g_vTexCoordScaleByModelV.xyzw)) + _Globals_.g_vTexCoordScaleByModelOrigin.y;
	                _12501 = _10181;
	            }
	            else
	            {
	                _12501 = _22475;
	            }
	            _21709 = _12501;
	        }
	        else
	        {
	            _21709 = _13745;
	        }
	        vec4 _12503;
	        if (_Globals_.g_bTexCoord2ScaleByModel != 0)
	        {
	            vec4 _10935 = vec4(_25108, _25109, _18672, 1.0);
	            vec4 _22476;
	            if (_9579.z)
	            {
	                vec4 _10182 = _21709;
	                _10182.z = ((_21709.z - _Globals_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_10935, _Globals_.g_vTexCoord2ScaleByModelU.xyzw)) + _Globals_.g_vTexCoord2ScaleByModelOrigin.x;
	                _22476 = _10182;
	            }
	            else
	            {
	                _22476 = _21709;
	            }
	            vec4 _12502;
	            if (_9579.w)
	            {
	                vec4 _10183 = _22476;
	                _10183.w = ((_22476.w - _Globals_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_10935, _Globals_.g_vTexCoord2ScaleByModelV.xyzw)) + _Globals_.g_vTexCoord2ScaleByModelOrigin.y;
	                _12502 = _10183;
	            }
	            else
	            {
	                _12502 = _22476;
	            }
	            _12503 = _12502;
	        }
	        else
	        {
	            _12503 = _21709;
	        }
	        _22247 = _12503;
	    }
	    else
	    {
	        _22247 = _13745;
	    }
	    output_0 = normalize(vNormalOs * _13976);
	    output_1 = _22247;
	    output_2 = _22017 - PerViewConstantBuffer_t._m3.xyz;
	    output_3 = _23714;
	    output_4 = vec4(normalize(vTangentUOs_flTangentVSign.xyz * _13976), vTangentUOs_flTangentVSign.w);
	    output_5 = vec4(vColorBlendValues.xyz, vColorBlendValues.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(vec4(_22017.xyz, 1.0), PerViewConstantBuffer_t._m1.xyzw);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(TexCoordScaleByModelU, g_nScaleTexCoordUByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelV, g_nScaleTexCoordVByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelUOrigin, g_nScaleTexCoordUByModelScaleOrigin);
	IntAttribute(TexCoordScaleByModelVOrigin, g_nScaleTexCoordVByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelU, g_nScaleTexCoord2UByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelV, g_nScaleTexCoord2VByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelUOrigin, g_nScaleTexCoord2UByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelVOrigin, g_nScaleTexCoord2VByModelScaleOrigin);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, F_RENDER_BACKFACES ? 0 : 1);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(VertexPaintUI4Layer, true);
	BoolAttribute(VertexPaintUIPickColorAlpha, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, Equal);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureTintMask), Linear); OutputFormat(BC7); SrgbRead(true); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureTintMask, Linear, 8, "", "_mask", "Color", Default4(1, 1, 1, 0));
	
	#if (S_MODE_TOOLS_VIS == 1)
		RenderState(CullMode, F_RENDER_BACKFACES ? None : Back);
	#endif
	#if (S_MODE_TOOLS_WIREFRAME == 1)
		RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : Back);
	#endif
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	cbuffer PerViewConstantBufferCitadel_t : register(b4, space1)
	{
	    uint PerViewConstantBufferCitadel_t_1_m0 : packoffset(c1);
	    int2 PerViewConstantBufferCitadel_t_1_m1 : packoffset(c6);
	};
	
	cbuffer _Globals_ : register(b0, space1)
	{
	    uint _Globals_1_g_sAniso : packoffset(c0);
	    uint _Globals_1_g_tColor : packoffset(c12.y);
	};
	
	Texture2D<float4> g_bindless_Texture2D_float4[65536] : register(t46, space4);
	SamplerState g_bindless_Sampler[2048] : register(s29, space4);
	
	static float4 gl_FragCoord;
	static float3 input_0;
	static float4 input_1;
	static float4 input_3;
	static float4 input_5;
	static float4 output_0;
	static float4 output_1;
	static float4 output_2;
	static float2 output_3;
	
	struct PS_INPUT
	{
	    float3 input_0 : TEXCOORD0;
	    float4 input_1 : TEXCOORD1;
	    float4 input_3 : TEXCOORD3;
	    float4 input_5 : TEXCOORD5;
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
	    float4 _19680 = g_bindless_Texture2D_float4[_Globals_1_g_tColor].Sample(g_bindless_Sampler[_Globals_1_g_sAniso], input_1.xy);
	    float3 _13737 = _19680.xyz;
	    float _18612 = saturate(input_5.z * 0.100000001490116119384765625f);
	    float _19133;
	    if (_18612 != 0.0f)
	    {
	        _19133 = _18612 + ((g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t_1_m0].Load(int3(int3(int2(uint2(gl_FragCoord.xy).xy & uint2(PerViewConstantBufferCitadel_t_1_m1)), 0).xy, 0)).xyz * 0.0039215688593685626983642578125f) - 0.00196078442968428134918212890625f.xxx).z;
	    }
	    else
	    {
	        _19133 = _18612;
	    }
	    output_0 = float4((input_0.xyz * 0.5f) + 0.5f.xxx, 0.0f);
	    output_1 = float4(lerp(_13737, _13737 * input_3.xyz, _19680.w.xxx), 0.12549020349979400634765625f);
	    output_2 = float4(input_5.x, 0.0f, _19133, input_5.y);
	    output_3 = 0.0f.xx;
	}
	
	PS_OUTPUT MainPs(PS_INPUT stage_input)
	{
	    gl_FragCoord = stage_input.gl_FragCoord;
	    gl_FragCoord.w = 1.0 / gl_FragCoord.w;
	    input_0 = stage_input.input_0;
	    input_1 = stage_input.input_1;
	    input_3 = stage_input.input_3;
	    input_5 = stage_input.input_5;
	    MainPs_inner();
	    PS_OUTPUT stage_output;
	    stage_output.output_0 = output_0;
	    stage_output.output_1 = output_1;
	    stage_output.output_2 = output_2;
	    stage_output.output_3 = output_3;
	    return stage_output;
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsLightmapping, true);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(renderbackfaces, F_RENDER_BACKFACES ? 1 : 0);
	
}

RTX
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_VIS, S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor), Srgb); Channel(A, Box(TextureTintMask), Linear); OutputFormat(BC7); SrgbRead(true); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// Color
	CreateInputTexture2D(TextureColor, Srgb, 8, "", "_color", "Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureTintMask, Linear, 8, "", "_mask", "Color", Default4(1, 1, 1, 0));
	
	// Texture Coordinates
	int g_nScaleTexCoordUByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/40"); >;
	int g_nScaleTexCoordVByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/50"); >;
	int g_nScaleTexCoordUByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/55"); >;
	int g_nScaleTexCoordVByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/56"); >;
	int g_nScaleTexCoord2UByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/60"); >;
	int g_nScaleTexCoord2VByModelScaleAxis < Range4(0, 0, 0, 0, 3, 3, 3, 3); UiOptions("0=None,1=X,2=Y,3=Z"); UiType(Enum); UiGroup("Texture Coordinates/Scale/70"); >;
	int g_nScaleTexCoord2UByModelScaleOrigin < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Left,1=Center,2=Right"); UiType(Enum); UiGroup("Texture Coordinates/Scale/75"); >;
	int g_nScaleTexCoord2VByModelScaleOrigin < Default(2); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Top,1=Center,2=Bottom"); UiType(Enum); UiGroup("Texture Coordinates/Scale/76"); >;
	
	
	// Variant parameters
	
	// SPIR-V reflection failed for backend HLSL:
	// Unsupported builtin in HLSL: 5326
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_shader_explicit_arithmetic_types_int16 : require
	#extension GL_EXT_shader_16bit_storage : require
	#if defined(GL_AMD_gpu_shader_half_float)
	#extension GL_AMD_gpu_shader_half_float : require
	#elif defined(GL_EXT_shader_explicit_arithmetic_types_float16)
	#extension GL_EXT_shader_explicit_arithmetic_types_float16 : require
	#else
	#error No extension available for FP16.
	#endif
	#extension GL_EXT_ray_tracing : require
	#extension GL_EXT_nonuniform_qualifier : require
	
	struct PackedRtxInstanceData_t_natural
	{
	    uint nSrgbColor;
	    uint nTriangleGeometry;
	    uint nMaterialData;
	    uint nMaterialFlags_nInstanceFlags;
	    float fEmissiveBoost;
	    uint nInstanceFlags;
	    uint _pad1;
	    uint _pad2;
	};
	
	struct VS_INPUT
	{
	    vec3 vPositionOs;
	    vec2 vTexCoord;
	    vec4 vColorBlendValues;
	    vec4 vBlendColorTint;
	    vec3 vNormalOs;
	    vec4 vTangentUOs_flTangentVSign;
	    uvec4 vBlendIndices;
	    uint nInstanceIdx;
	};
	
	struct _Array_natural_vector_int_4_8
	{
	    ivec4 data[8];
	};
	
	struct GeometryInfo_t_natural
	{
	    ivec4 m_nVertexAndIndexBuffers;
	    ivec4 m_nBufferBindOffsetBytes;
	    ivec4 m_nBufferStrideInBytes;
	    ivec4 m_vNormalFieldInfo;
	    ivec4 m_vTangentFieldInfo;
	    _Array_natural_vector_int_4_8 m_vTexCoordFieldInfo;
	    _Array_natural_vector_int_4_8 m_vColorFieldInfo;
	};
	
	struct BuiltInTriangleIntersectionAttributes
	{
	    vec2 barycentrics;
	};
	
	struct MaterialDataMinimal_t
	{
	    f16vec3 vNormalWs;
	    float16_t flMetalness;
	    f16vec3 vAlbedo;
	    float16_t flRoughness;
	    f16vec3 vEmissive;
	    float16_t flReflectance;
	    uint nMaterialTypeAndFlags;
	    f16vec4 vMaterialBits;
	};
	
	struct Payload_t
	{
	    vec3 vSmoothPositionWs;
	    vec3 vFaceNormalWs;
	    vec3 vInterpolatedNormalWs;
	    float flHitT;
	    float flOpacityRng;
	    int nInstance;
	    bool bFlippedNormal;
	    MaterialDataMinimal_t material;
	};
	
	struct PayloadShadow_t
	{
	    float m_flVisibility;
	};
	
	layout(set = 3, binding = 35, std430) readonly buffer StructuredBuffer
	{
	    PackedRtxInstanceData_t_natural _member0[];
	} g_instanceBuffer;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData
	{
	    uint _member0[];
	} g_MaterialData_1;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_2
	{
	    int _member0[];
	} g_MaterialData_3;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_4
	{
	    float _member0[];
	} g_MaterialData_5;
	
	layout(set = 3, binding = 31, std430) readonly buffer g_Geometries
	{
	    GeometryInfo_t_natural _member0[];
	} g_Geometries_1;
	
	layout(set = 3, binding = 33, std430) readonly buffer g_Indices
	{
	    uint _member0[];
	} g_Indices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices
	{
	    float _member0[];
	} g_Vertices_1[];
	
	layout(set = 3, binding = 32, std430) readonly buffer g_Vertices_2
	{
	    uint _member0[];
	} g_Vertices_3[];
	
	struct SLANG_ParameterGroup_PerViewConstantBuffer_t_natural
	{
	    mat4 g_matWorldToProjection;
	    mat4 g_matProjectionToWorld;
	    mat4 g_matWorldToView;
	    mat4 g_matViewToProjection;
	    vec4 g_vInvProjLowerRight2x2;
	    vec4 g_vClipPlane0;
	    float g_flToneMapScalarLinear;
	    float g_flInvToneMapScalarLinear;
	    float g_flRealTime;
	    float g_flGameTime;
	    vec2 g_vViewportToGBufferRatio;
	    float g_fInvViewportZRange;
	    float g_fMinViewportZScaled;
	    vec2 g_vViewportOffset;
	    vec2 g_vViewportSize;
	    vec2 g_vInvViewportSize;
	    vec2 g_vRenderTargetSize;
	    vec4 g_vInvGBufferSize;
	    float g_flViewportMinZ;
	    float g_flViewportMaxZ;
	    float g_flNearPlane;
	    float g_flFarPlane;
	    vec4 g_vWorldToCameraOffset;
	    vec4 g_vCameraAngles;
	    vec3 g_vCameraPositionWs;
	    float _PerViewPad0;
	    vec3 g_vCameraUpDirWs;
	    float _PerViewPad1;
	    vec3 g_vCameraDirWs;
	    float g_flInvMSAASampleCount;
	    vec3 g_vDepthPsToVsConversion;
	    int g_nMSAASampleCount;
	    vec2 g_vMorphTextureAtlasSize;
	    uint g_tCompositeMorphAtlasTextureIndex;
	    float _PerViewPad4;
	    vec3 g_vFogColor;
	    float g_flNegFogStartOverFogRange;
	    float g_flInvFogRange;
	    float g_flFogMaxDensity;
	    float g_flFogExponent;
	    float g_flFogBlendToBackground;
	    vec4 g_vFrameBufferCopyInvSizeAndUvScale;
	    vec4 g_vPrevWorldToCameraOffset;
	    mat4 g_matPrevWorldToProjection;
	    vec4 g_vWireframeColor;
	};
	
	layout(set = 5) uniform SLANG_ParameterGroup_PerViewConstantBuffer_t_natural PerViewConstantBuffer_t;
	
	hitAttributeEXT BuiltInTriangleIntersectionAttributes attrs;
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	layout(location = 0) rayPayloadInEXT Payload_t payload;
	
	void main()
	{
	    uint _538 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    uint _592 = g_MaterialData_1._member0[_538 / 4u];
	    bool _591 = g_MaterialData_3._member0[(_538 + 48u) / 4u] != 0;
	    vec4 _590 = vec4(g_MaterialData_5._member0[(_538 + 64u) / 4u], g_MaterialData_5._member0[(_538 + 68u) / 4u], g_MaterialData_5._member0[(_538 + 72u) / 4u], g_MaterialData_5._member0[(_538 + 76u) / 4u]);
	    vec4 _589 = vec4(g_MaterialData_5._member0[(_538 + 80u) / 4u], g_MaterialData_5._member0[(_538 + 84u) / 4u], g_MaterialData_5._member0[(_538 + 88u) / 4u], g_MaterialData_5._member0[(_538 + 92u) / 4u]);
	    vec2 _588 = vec2(g_MaterialData_5._member0[(_538 + 96u) / 4u], g_MaterialData_5._member0[(_538 + 100u) / 4u]);
	    bool _587 = g_MaterialData_3._member0[(_538 + 120u) / 4u] != 0;
	    vec4 _586 = vec4(g_MaterialData_5._member0[(_538 + 128u) / 4u], g_MaterialData_5._member0[(_538 + 132u) / 4u], g_MaterialData_5._member0[(_538 + 136u) / 4u], g_MaterialData_5._member0[(_538 + 140u) / 4u]);
	    vec4 _585 = vec4(g_MaterialData_5._member0[(_538 + 144u) / 4u], g_MaterialData_5._member0[(_538 + 148u) / 4u], g_MaterialData_5._member0[(_538 + 152u) / 4u], g_MaterialData_5._member0[(_538 + 156u) / 4u]);
	    vec2 _584 = vec2(g_MaterialData_5._member0[(_538 + 160u) / 4u], g_MaterialData_5._member0[(_538 + 164u) / 4u]);
	    uint _583 = g_MaterialData_1._member0[(_538 + 320u) / 4u];
	    uvec3 _677;
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _838 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _677 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_838 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_838 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_838 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _817 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _818 = _817 & 4294967292u;
	            uint _54 = _818 / 4u;
	            uint _57 = (_818 + 4u) / 4u;
	            uint _822 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_54] & 4294901760u) >> uint(16);
	            uint _823 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 65535u;
	            uvec3 _678;
	            if (_817 == _818)
	            {
	                _678 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_54] & 65535u, _822, _823);
	            }
	            else
	            {
	                _678 = uvec3(_822, _823, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 4294901760u) >> uint(16));
	            }
	            _677 = _678;
	            break;
	        }
	        break;
	    } while(false);
	    uint _70 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _859 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _677) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    vec3 _679[3];
	    uint _861 = _859.x;
	    _679[0] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_861 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_861 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_861 + 8u) / 4u]);
	    uint _866 = _859.y;
	    _679[1] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_866 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_866 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_866 + 8u) / 4u]);
	    uint _871 = _859.z;
	    _679[2] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_871 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_871 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_871 + 8u) / 4u]);
	    int _680 = 0;
	    VS_INPUT _685[3];
	    for (;;)
	    {
	        if (!(_680 < 3))
	        {
	            break;
	        }
	        _685[_680].vPositionOs = _679[_680];
	        _680++;
	        continue;
	    }
	    vec2 _681[3];
	    _681[0] = vec2(0.0);
	    _681[1] = vec2(0.0);
	    _681[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	    {
	        ivec4 _676 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _99 = uint(_676[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	        uint _913 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	        ivec4 _674 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _675 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _929 = (uvec3(uint(_674[_913])) * _677) + uvec3(uint(_675[_913]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	        {
	            uint _1043 = _929.x;
	            _681[0] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1043 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1043 + 4u) / 4u]);
	            uint _1046 = _929.y;
	            _681[1] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1046 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1046 + 4u) / 4u]);
	            uint _1049 = _929.z;
	            _681[2] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1049 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1049 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	            {
	                uint _111 = _929.x / 4u;
	                _681[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_111], g_Vertices_3[nonuniformEXT(_99)]._member0[_111] >> uint(16)) & uvec2(65535u))));
	                uint _114 = _929.y / 4u;
	                _681[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_114], g_Vertices_3[nonuniformEXT(_99)]._member0[_114] >> uint(16)) & uvec2(65535u))));
	                uint _117 = _929.z / 4u;
	                _681[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_117], g_Vertices_3[nonuniformEXT(_99)]._member0[_117] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                {
	                    uint _101 = _929.x / 4u;
	                    uint _942 = g_Vertices_3[nonuniformEXT(_99)]._member0[_101] & 65535u;
	                    int _673;
	                    if (_942 > 32767u)
	                    {
	                        _673 = int(4294901760u | _942);
	                    }
	                    else
	                    {
	                        _673 = int(_942);
	                    }
	                    uint _955 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_101] & 4294901760u) >> uint(16);
	                    int _672;
	                    if (_955 > 32767u)
	                    {
	                        _672 = int(4294901760u | _955);
	                    }
	                    else
	                    {
	                        _672 = int(_955);
	                    }
	                    _681[0] = vec2(max(float(_673) * 3.0518509447574615478515625e-05, -1.0), max(float(_672) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _104 = _929.y / 4u;
	                    uint _969 = g_Vertices_3[nonuniformEXT(_99)]._member0[_104] & 65535u;
	                    int _671;
	                    if (_969 > 32767u)
	                    {
	                        _671 = int(4294901760u | _969);
	                    }
	                    else
	                    {
	                        _671 = int(_969);
	                    }
	                    uint _982 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_104] & 4294901760u) >> uint(16);
	                    int _670;
	                    if (_982 > 32767u)
	                    {
	                        _670 = int(4294901760u | _982);
	                    }
	                    else
	                    {
	                        _670 = int(_982);
	                    }
	                    _681[1] = vec2(max(float(_671) * 3.0518509447574615478515625e-05, -1.0), max(float(_670) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _107 = _929.z / 4u;
	                    uint _996 = g_Vertices_3[nonuniformEXT(_99)]._member0[_107] & 65535u;
	                    int _669;
	                    if (_996 > 32767u)
	                    {
	                        _669 = int(4294901760u | _996);
	                    }
	                    else
	                    {
	                        _669 = int(_996);
	                    }
	                    uint _1009 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_107] & 4294901760u) >> uint(16);
	                    int _668;
	                    if (_1009 > 32767u)
	                    {
	                        _668 = int(4294901760u | _1009);
	                    }
	                    else
	                    {
	                        _668 = int(_1009);
	                    }
	                    _681[2] = vec2(max(float(_669) * 3.0518509447574615478515625e-05, -1.0), max(float(_668) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _680 = 0;
	    for (;;)
	    {
	        if (!(_680 < 3))
	        {
	            break;
	        }
	        _685[_680].vTexCoord = _681[_680];
	        _680++;
	        continue;
	    }
	    vec3 _682[3];
	    vec4 _683[3];
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	        {
	            ivec4 _654 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _139 = uint(_654[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	            uint _1093 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	            ivec4 _652 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _653 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _1109 = (uvec3(uint(_652[_1093])) * _677) + uvec3(uint(_653[_1093]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	            {
	                uint _1610 = _1109.x;
	                _682[0] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1610 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1610 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1610 + 8u) / 4u]);
	                uint _1615 = _1109.y;
	                _682[1] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1615 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1615 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1615 + 8u) / 4u]);
	                uint _1620 = _1109.z;
	                _682[2] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1620 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1620 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1620 + 8u) / 4u]);
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	                {
	                    uint _1364 = _1109.x;
	                    uvec2 _1366 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1364 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1364 + 4u) / 4u]);
	                    uint _1367 = _1109.y;
	                    uvec2 _537 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1367 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1367 + 4u) / 4u]);
	                    uint _1370 = _1109.z;
	                    uvec2 _536 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1370 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1370 + 4u) / 4u]);
	                    uint _1376 = _1366.x;
	                    uint _1384 = _1366.y;
	                    vec2 _1394 = ((vec2(float(_1376 & 65535u), float((_1376 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1395 = _1394.x;
	                    float _1400 = (1.0 - abs(_1395)) - abs(_1394.y);
	                    vec3 _1401 = vec3(_1395, _1394.y, _1400);
	                    float _1403 = saturate(-_1400);
	                    vec2 _1409 = _1394 + mix(vec2(_1403), vec2(-_1403), greaterThanEqual(_1394, vec2(0.0)));
	                    _1401.x = _1409.x;
	                    _1401.y = _1409.y;
	                    vec3 _656 = normalize(_1401);
	                    vec2 _1416 = ((vec2(float((_1384 >> uint(1)) & 32767u), float((_1384 >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1417 = _1416.x;
	                    float _1422 = (1.0 - abs(_1417)) - abs(_1416.y);
	                    vec3 _1423 = vec3(_1417, _1416.y, _1422);
	                    float _1425 = saturate(-_1422);
	                    vec2 _1431 = _1416 + mix(vec2(_1425), vec2(-_1425), greaterThanEqual(_1416, vec2(0.0)));
	                    _1423.x = _1431.x;
	                    _1423.y = _1431.y;
	                    vec3 _655 = normalize(_1423);
	                    float _642;
	                    if ((_1384 & 1u) != 0u)
	                    {
	                        _642 = 1.0;
	                    }
	                    else
	                    {
	                        _642 = -1.0;
	                    }
	                    _682[0] = _656;
	                    _683[0].w = _642;
	                    _683[0].x = _655.x;
	                    _683[0].y = _655.y;
	                    _683[0].z = _655.z;
	                    vec2 _1473 = ((vec2(float(_537.x & 65535u), float((_537.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1474 = _1473.x;
	                    float _1479 = (1.0 - abs(_1474)) - abs(_1473.y);
	                    vec3 _1480 = vec3(_1474, _1473.y, _1479);
	                    float _1482 = saturate(-_1479);
	                    vec2 _1488 = _1473 + mix(vec2(_1482), vec2(-_1482), greaterThanEqual(_1473, vec2(0.0)));
	                    _1480.x = _1488.x;
	                    _1480.y = _1488.y;
	                    vec3 _658 = normalize(_1480);
	                    vec2 _1495 = ((vec2(float((_537.y >> uint(1)) & 32767u), float((_537.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1496 = _1495.x;
	                    float _1501 = (1.0 - abs(_1496)) - abs(_1495.y);
	                    vec3 _1502 = vec3(_1496, _1495.y, _1501);
	                    float _1504 = saturate(-_1501);
	                    vec2 _1510 = _1495 + mix(vec2(_1504), vec2(-_1504), greaterThanEqual(_1495, vec2(0.0)));
	                    _1502.x = _1510.x;
	                    _1502.y = _1510.y;
	                    vec3 _657 = normalize(_1502);
	                    float _641;
	                    if ((_537.y & 1u) != 0u)
	                    {
	                        _641 = 1.0;
	                    }
	                    else
	                    {
	                        _641 = -1.0;
	                    }
	                    _682[1] = _658;
	                    _683[1].w = _641;
	                    _683[1].x = _657.x;
	                    _683[1].y = _657.y;
	                    _683[1].z = _657.z;
	                    vec2 _1552 = ((vec2(float(_536.x & 65535u), float((_536.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1553 = _1552.x;
	                    float _1558 = (1.0 - abs(_1553)) - abs(_1552.y);
	                    vec3 _1559 = vec3(_1553, _1552.y, _1558);
	                    float _1561 = saturate(-_1558);
	                    vec2 _1567 = _1552 + mix(vec2(_1561), vec2(-_1561), greaterThanEqual(_1552, vec2(0.0)));
	                    _1559.x = _1567.x;
	                    _1559.y = _1567.y;
	                    vec3 _660 = normalize(_1559);
	                    vec2 _1574 = ((vec2(float((_536.y >> uint(1)) & 32767u), float((_536.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1575 = _1574.x;
	                    float _1580 = (1.0 - abs(_1575)) - abs(_1574.y);
	                    vec3 _1581 = vec3(_1575, _1574.y, _1580);
	                    float _1583 = saturate(-_1580);
	                    vec2 _1589 = _1574 + mix(vec2(_1583), vec2(-_1583), greaterThanEqual(_1574, vec2(0.0)));
	                    _1581.x = _1589.x;
	                    _1581.y = _1589.y;
	                    vec3 _659 = normalize(_1581);
	                    float _640;
	                    if ((_536.y & 1u) != 0u)
	                    {
	                        _640 = 1.0;
	                    }
	                    else
	                    {
	                        _640 = -1.0;
	                    }
	                    _682[2] = _660;
	                    _683[2].w = _640;
	                    _683[2].x = _659.x;
	                    _683[2].y = _659.y;
	                    _683[2].z = _659.z;
	                    break;
	                }
	                else
	                {
	                    uint _141 = _1109.x / 4u;
	                    vec4 _662 = _683[0];
	                    float _1131 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1134 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1138 = (1.0 - abs(_1131)) - abs(_1134);
	                    vec3 _1139 = vec3(_1131, _1134, _1138);
	                    float _1141 = saturate(-_1138);
	                    vec2 _1142 = vec2(_1131, _1134);
	                    vec2 _1148 = _1142 + mix(vec2(_1141), vec2(-_1141), greaterThanEqual(_1142, vec2(0.0)));
	                    _1139.x = _1148.x;
	                    _1139.y = _1148.y;
	                    vec3 _1153 = normalize(_1139);
	                    vec3 _661 = _1153;
	                    float _1154 = _1153.z;
	                    float _649;
	                    if (_1154 >= 0.0)
	                    {
	                        _649 = 1.0;
	                    }
	                    else
	                    {
	                        _649 = -1.0;
	                    }
	                    float _1161 = (-1.0) / (_649 + _1154);
	                    float _1162 = _1153.x;
	                    vec3 _650;
	                    vec3 _1170 = _650;
	                    _1170.x = 1.0 + (((_649 * _1162) * _1162) * _1161);
	                    _1170.y = _649 * ((_1162 * _1153.y) * _1161);
	                    _1170.z = (-_649) * _1162;
	                    _650 = _1170;
	                    float _1178 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1184 = (_1170 * cos(_1178)) + (cross(_1153, _1170) * sin(_1178));
	                    vec4 _1186 = _662;
	                    _1186.x = _1184.x;
	                    _1186.y = _1184.y;
	                    _1186.z = _1184.z;
	                    _662 = _1186;
	                    float _651;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] & 1u) == 0u)
	                    {
	                        _651 = -1.0;
	                    }
	                    else
	                    {
	                        _651 = 1.0;
	                    }
	                    vec4 _1197 = _662;
	                    _1197.w = _651;
	                    _662 = _1197;
	                    _682[0] = _661;
	                    _683[0] = _1197;
	                    uint _144 = _1109.y / 4u;
	                    vec4 _664 = _683[1];
	                    float _1213 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1216 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1220 = (1.0 - abs(_1213)) - abs(_1216);
	                    vec3 _1221 = vec3(_1213, _1216, _1220);
	                    float _1223 = saturate(-_1220);
	                    vec2 _1224 = vec2(_1213, _1216);
	                    vec2 _1230 = _1224 + mix(vec2(_1223), vec2(-_1223), greaterThanEqual(_1224, vec2(0.0)));
	                    _1221.x = _1230.x;
	                    _1221.y = _1230.y;
	                    vec3 _1235 = normalize(_1221);
	                    vec3 _663 = _1235;
	                    float _1236 = _1235.z;
	                    float _646;
	                    if (_1236 >= 0.0)
	                    {
	                        _646 = 1.0;
	                    }
	                    else
	                    {
	                        _646 = -1.0;
	                    }
	                    float _1243 = (-1.0) / (_646 + _1236);
	                    float _1244 = _1235.x;
	                    vec3 _647;
	                    vec3 _1252 = _647;
	                    _1252.x = 1.0 + (((_646 * _1244) * _1244) * _1243);
	                    _1252.y = _646 * ((_1244 * _1235.y) * _1243);
	                    _1252.z = (-_646) * _1244;
	                    _647 = _1252;
	                    float _1260 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1266 = (_1252 * cos(_1260)) + (cross(_1235, _1252) * sin(_1260));
	                    vec4 _1268 = _664;
	                    _1268.x = _1266.x;
	                    _1268.y = _1266.y;
	                    _1268.z = _1266.z;
	                    _664 = _1268;
	                    float _648;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] & 1u) == 0u)
	                    {
	                        _648 = -1.0;
	                    }
	                    else
	                    {
	                        _648 = 1.0;
	                    }
	                    vec4 _1279 = _664;
	                    _1279.w = _648;
	                    _664 = _1279;
	                    _682[1] = _663;
	                    _683[1] = _1279;
	                    uint _147 = _1109.z / 4u;
	                    vec4 _666 = _683[2];
	                    float _1295 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1298 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1302 = (1.0 - abs(_1295)) - abs(_1298);
	                    vec3 _1303 = vec3(_1295, _1298, _1302);
	                    float _1305 = saturate(-_1302);
	                    vec2 _1306 = vec2(_1295, _1298);
	                    vec2 _1312 = _1306 + mix(vec2(_1305), vec2(-_1305), greaterThanEqual(_1306, vec2(0.0)));
	                    _1303.x = _1312.x;
	                    _1303.y = _1312.y;
	                    vec3 _1317 = normalize(_1303);
	                    vec3 _665 = _1317;
	                    float _1318 = _1317.z;
	                    float _643;
	                    if (_1318 >= 0.0)
	                    {
	                        _643 = 1.0;
	                    }
	                    else
	                    {
	                        _643 = -1.0;
	                    }
	                    float _1325 = (-1.0) / (_643 + _1318);
	                    float _1326 = _1317.x;
	                    vec3 _644;
	                    vec3 _1334 = _644;
	                    _1334.x = 1.0 + (((_643 * _1326) * _1326) * _1325);
	                    _1334.y = _643 * ((_1326 * _1317.y) * _1325);
	                    _1334.z = (-_643) * _1326;
	                    _644 = _1334;
	                    float _1342 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1348 = (_1334 * cos(_1342)) + (cross(_1317, _1334) * sin(_1342));
	                    vec4 _1350 = _666;
	                    _1350.x = _1348.x;
	                    _1350.y = _1348.y;
	                    _1350.z = _1348.z;
	                    _666 = _1350;
	                    float _645;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] & 1u) == 0u)
	                    {
	                        _645 = -1.0;
	                    }
	                    else
	                    {
	                        _645 = 1.0;
	                    }
	                    vec4 _1361 = _666;
	                    _1361.w = _645;
	                    _666 = _1361;
	                    _682[2] = _665;
	                    _683[2] = _1361;
	                    break;
	                }
	                break;
	            }
	        }
	        else
	        {
	            _682[0] = vec3(0.0);
	            _682[1] = vec3(0.0);
	            _682[2] = vec3(0.0);
	        }
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.y != 0)
	        {
	            ivec4 _667 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _197 = uint(_667[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z]);
	            uint _1639 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z);
	            ivec4 _638 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _639 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _1655 = (uvec3(uint(_638[_1639])) * _677) + uvec3(uint(_639[_1639]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.x));
	            uint _1657 = _1655.x;
	            _683[0] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1657 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1657 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1657 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1657 + 12u) / 4u]);
	            uint _1663 = _1655.y;
	            _683[1] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1663 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1663 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1663 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1663 + 12u) / 4u]);
	            uint _1669 = _1655.z;
	            _683[2] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1669 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1669 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1669 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1669 + 12u) / 4u]);
	        }
	        else
	        {
	            _683[0] = vec4(0.0);
	            _683[1] = vec4(0.0);
	            _683[2] = vec4(0.0);
	        }
	        break;
	    } while(false);
	    _680 = 0;
	    for (;;)
	    {
	        if (!(_680 < 3))
	        {
	            break;
	        }
	        _685[_680].vNormalOs = _682[_680];
	        _685[_680].vTangentUOs_flTangentVSign = _683[_680];
	        _680++;
	        continue;
	    }
	    vec4 _684[3];
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y != 0)
	    {
	        ivec4 _637 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _235 = uint(_637[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z]);
	        uint _1716 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z);
	        ivec4 _635 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _636 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _1732 = (uvec3(uint(_635[_1716])) * _677) + uvec3(uint(_636[_1716]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y == 2)
	        {
	            uint _1774 = _1732.x;
	            _684[0] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_1774 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1774 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1774 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1774 + 12u) / 4u]);
	            uint _1780 = _1732.y;
	            _684[1] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_1780 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1780 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1780 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1780 + 12u) / 4u]);
	            uint _1786 = _1732.z;
	            _684[2] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_1786 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1786 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1786 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_1786 + 12u) / 4u]);
	        }
	        else
	        {
	            uint _237 = _1732.x / 4u;
	            _684[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _240 = _1732.y / 4u;
	            _684[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _243 = _1732.z / 4u;
	            _684[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        }
	    }
	    else
	    {
	        _684[0] = vec4(0.0);
	        _684[1] = vec4(0.0);
	        _684[2] = vec4(0.0);
	    }
	    _680 = 0;
	    for (;;)
	    {
	        if (!(_680 < 3))
	        {
	            break;
	        }
	        _685[_680].vBlendColorTint = _684[_680];
	        _680++;
	        continue;
	    }
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].y != 0)
	    {
	        ivec4 _634 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _283 = uint(_634[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].z]);
	        uint _1828 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].z);
	        ivec4 _632 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _633 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _1844 = (uvec3(uint(_632[_1828])) * _677) + uvec3(uint(_633[_1828]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].y == 2)
	        {
	            uint _1886 = _1844.x;
	            _684[0] = vec4(g_Vertices_1[nonuniformEXT(_283)]._member0[_1886 / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1886 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1886 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1886 + 12u) / 4u]);
	            uint _1892 = _1844.y;
	            _684[1] = vec4(g_Vertices_1[nonuniformEXT(_283)]._member0[_1892 / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1892 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1892 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1892 + 12u) / 4u]);
	            uint _1898 = _1844.z;
	            _684[2] = vec4(g_Vertices_1[nonuniformEXT(_283)]._member0[_1898 / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1898 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1898 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_283)]._member0[(_1898 + 12u) / 4u]);
	        }
	        else
	        {
	            uint _285 = _1844.x / 4u;
	            _684[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_283)]._member0[_285] & 255u, (g_Vertices_3[nonuniformEXT(_283)]._member0[_285] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_283)]._member0[_285] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_283)]._member0[_285] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _288 = _1844.y / 4u;
	            _684[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_283)]._member0[_288] & 255u, (g_Vertices_3[nonuniformEXT(_283)]._member0[_288] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_283)]._member0[_288] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_283)]._member0[_288] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _291 = _1844.z / 4u;
	            _684[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_283)]._member0[_291] & 255u, (g_Vertices_3[nonuniformEXT(_283)]._member0[_291] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_283)]._member0[_291] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_283)]._member0[_291] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        }
	    }
	    else
	    {
	        _684[0] = vec4(0.0);
	        _684[1] = vec4(0.0);
	        _684[2] = vec4(0.0);
	    }
	    _680 = 0;
	    for (;;)
	    {
	        if (!(_680 < 3))
	        {
	            break;
	        }
	        _685[_680].vColorBlendValues = _684[_680].xyzw;
	        _680++;
	        continue;
	    }
	    vec3 _567 = _685[0].vPositionOs;
	    vec2 _566 = _685[0].vTexCoord;
	    vec4 _565 = _685[0].vColorBlendValues;
	    vec4 _564 = _685[0].vBlendColorTint;
	    vec3 _563 = _685[0].vNormalOs;
	    vec3 _572 = vec3(0.0);
	    vec4 _571 = vec4(0.0);
	    vec3 _570 = vec3(0.0);
	    vec4 _569 = vec4(0.0);
	    mat3x4 _1931 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _1933 = transpose(gl_WorldToObjectEXT);
	    mat3 _631;
	    mat3 _1936 = _631;
	    _1936[0] = _1933[0].xyz;
	    _1936[1] = _1933[1].xyz;
	    _1936[2] = _1933[2].xyz;
	    _631 = _1936;
	    vec4 _1958 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _630 = _1958;
	    vec3 _1959 = _1958.xyz;
	    vec3 _1960 = _1959 * vec3(0.077399380505084991455078125);
	    vec3 _1963 = pow((_1959 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _627;
	    if (_1958.x <= 0.040449999272823333740234375)
	    {
	        _627 = _1960.x;
	    }
	    else
	    {
	        _627 = _1963.x;
	    }
	    float _628;
	    if (_1958.y <= 0.040449999272823333740234375)
	    {
	        _628 = _1960.y;
	    }
	    else
	    {
	        _628 = _1963.y;
	    }
	    float _629;
	    if (_1958.z <= 0.040449999272823333740234375)
	    {
	        _629 = _1960.z;
	    }
	    else
	    {
	        _629 = _1963.z;
	    }
	    vec3 _1988 = vec3(_627, _628, _629);
	    vec4 _1990 = _630;
	    _1990.x = _1988.x;
	    _1990.y = _1988.y;
	    _1990.z = _1988.z;
	    _630 = _1990;
	    vec4 _1997 = _569;
	    vec4 _1998 = _1997;
	    _1998.x = _1990.x;
	    vec4 _2000 = _1997;
	    _2000.y = _1990.y;
	    vec4 _2002 = _1997;
	    _2002.z = _1990.z;
	    vec4 _2004 = _1997;
	    _2004.w = _1990.w;
	    vec4 _2008 = mix(vec4(1.0), _1990, vec4(_565.w));
	    vec4 _2010 = _1997;
	    _2010.x = _2008.x;
	    _2010.y = _2008.y;
	    _2010.z = _2008.z;
	    _2010.w = _2008.w;
	    _569 = _2010;
	    vec3 _2020 = _564.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2023 = pow((_564.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _624;
	    if (_564.x <= 0.040449999272823333740234375)
	    {
	        _624 = _2020.x;
	    }
	    else
	    {
	        _624 = _2023.x;
	    }
	    float _625;
	    if (_564.y <= 0.040449999272823333740234375)
	    {
	        _625 = _2020.y;
	    }
	    else
	    {
	        _625 = _2023.y;
	    }
	    float _626;
	    if (_564.z <= 0.040449999272823333740234375)
	    {
	        _626 = _2020.z;
	    }
	    else
	    {
	        _626 = _2023.z;
	    }
	    vec3 _2052 = _2010.xyz * mix(vec3(1.0), vec3(_624, _625, _626), vec3(_564.w));
	    vec4 _2054 = _569;
	    _2054.x = _2052.x;
	    _2054.y = _2052.y;
	    _2054.z = _2052.z;
	    _569 = _2054;
	    vec4 _568 = vec4(_565.xyz, _565.w);
	    vec3 _2065 = normalize(_563 * transpose(_1936));
	    vec3 _2067 = _572;
	    _2067.x = _2065.x;
	    _2067.y = _2065.y;
	    _2067.z = _2065.z;
	    _572 = _2067;
	    vec3 _2079 = (vec4(_567.xyz, 1.0) * _1931) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2081 = _570;
	    _2081.x = _2079.x;
	    _2081.y = _2079.y;
	    _2081.z = _2079.z;
	    _570 = _2081;
	    vec4 _2089 = _571;
	    _2089.x = _566.x;
	    _2089.y = _566.y;
	    vec4 _2094 = _2089;
	    _2094.z = _2089.x;
	    _2094.w = _2089.y;
	    _571 = _2094;
	    vec4 _622 = _2094;
	    bool _623;
	    if (_591)
	    {
	        _623 = true;
	    }
	    else
	    {
	        _623 = _587;
	    }
	    if (_623)
	    {
	        vec4 _2105 = _622;
	        bvec4 _2107 = greaterThanEqual(_2105.xyzw, vec4(0.0));
	        vec4 _2108 = _1931[0];
	        vec4 _2110 = _1931[1];
	        vec4 _2112 = _1931[2];
	        float _2115 = length(vec3(_2108.x, _2110.x, _2112.x));
	        float _2120 = length(vec3(_2108.y, _2110.y, _2112.y));
	        float _2125 = length(vec3(_2108.z, _2110.z, _2112.z));
	        if (_591)
	        {
	            vec4 _2129 = vec4(_2115, _2120, _2125, 1.0);
	            if (_2107.x)
	            {
	                vec4 _2141 = _622;
	                _2141.x = ((_2141.x - _588.x) * dot(_2129, _590.xyzw)) + _588.x;
	                _622 = _2141;
	            }
	            if (_2107.y)
	            {
	                vec4 _2152 = _622;
	                _2152.y = ((_2152.y - _588.y) * dot(_2129, _589.xyzw)) + _588.y;
	                _622 = _2152;
	            }
	        }
	        if (_587)
	        {
	            vec4 _2161 = vec4(_2115, _2120, _2125, 1.0);
	            if (_2107.z)
	            {
	                vec4 _2173 = _622;
	                _2173.z = ((_2173.z - _584.x) * dot(_2161, _586.xyzw)) + _584.x;
	                _622 = _2173;
	            }
	            if (_2107.w)
	            {
	                vec4 _2184 = _622;
	                _2184.w = ((_2184.w - _584.y) * dot(_2161, _585.xyzw)) + _584.y;
	                _622 = _2184;
	            }
	        }
	    }
	    _571 = _622;
	    vec3 _535 = _572;
	    vec4 _534 = _622;
	    vec3 _533 = _570;
	    vec4 _532 = _569;
	    vec4 _531 = _568;
	    vec3 _562 = _685[1].vPositionOs;
	    vec2 _561 = _685[1].vTexCoord;
	    vec4 _560 = _685[1].vColorBlendValues;
	    vec4 _559 = _685[1].vBlendColorTint;
	    vec3 _558 = _685[1].vNormalOs;
	    vec3 _577 = vec3(0.0);
	    vec4 _576 = vec4(0.0);
	    vec3 _575 = vec3(0.0);
	    vec4 _574 = vec4(0.0);
	    mat3x4 _2203 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _2205 = transpose(gl_WorldToObjectEXT);
	    mat3 _621;
	    mat3 _2208 = _621;
	    _2208[0] = _2205[0].xyz;
	    _2208[1] = _2205[1].xyz;
	    _2208[2] = _2205[2].xyz;
	    _621 = _2208;
	    vec4 _2230 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _620 = _2230;
	    vec3 _2231 = _2230.xyz;
	    vec3 _2232 = _2231 * vec3(0.077399380505084991455078125);
	    vec3 _2235 = pow((_2231 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _617;
	    if (_2230.x <= 0.040449999272823333740234375)
	    {
	        _617 = _2232.x;
	    }
	    else
	    {
	        _617 = _2235.x;
	    }
	    float _618;
	    if (_2230.y <= 0.040449999272823333740234375)
	    {
	        _618 = _2232.y;
	    }
	    else
	    {
	        _618 = _2235.y;
	    }
	    float _619;
	    if (_2230.z <= 0.040449999272823333740234375)
	    {
	        _619 = _2232.z;
	    }
	    else
	    {
	        _619 = _2235.z;
	    }
	    vec3 _2260 = vec3(_617, _618, _619);
	    vec4 _2262 = _620;
	    _2262.x = _2260.x;
	    _2262.y = _2260.y;
	    _2262.z = _2260.z;
	    _620 = _2262;
	    vec4 _2269 = _574;
	    vec4 _2270 = _2269;
	    _2270.x = _2262.x;
	    vec4 _2272 = _2269;
	    _2272.y = _2262.y;
	    vec4 _2274 = _2269;
	    _2274.z = _2262.z;
	    vec4 _2276 = _2269;
	    _2276.w = _2262.w;
	    vec4 _2280 = mix(vec4(1.0), _2262, vec4(_560.w));
	    vec4 _2282 = _2269;
	    _2282.x = _2280.x;
	    _2282.y = _2280.y;
	    _2282.z = _2280.z;
	    _2282.w = _2280.w;
	    _574 = _2282;
	    vec3 _2292 = _559.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2295 = pow((_559.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _614;
	    if (_559.x <= 0.040449999272823333740234375)
	    {
	        _614 = _2292.x;
	    }
	    else
	    {
	        _614 = _2295.x;
	    }
	    float _615;
	    if (_559.y <= 0.040449999272823333740234375)
	    {
	        _615 = _2292.y;
	    }
	    else
	    {
	        _615 = _2295.y;
	    }
	    float _616;
	    if (_559.z <= 0.040449999272823333740234375)
	    {
	        _616 = _2292.z;
	    }
	    else
	    {
	        _616 = _2295.z;
	    }
	    vec3 _2324 = _2282.xyz * mix(vec3(1.0), vec3(_614, _615, _616), vec3(_559.w));
	    vec4 _2326 = _574;
	    _2326.x = _2324.x;
	    _2326.y = _2324.y;
	    _2326.z = _2324.z;
	    _574 = _2326;
	    vec4 _573 = vec4(_560.xyz, _560.w);
	    vec3 _2337 = normalize(_558 * transpose(_2208));
	    vec3 _2339 = _577;
	    _2339.x = _2337.x;
	    _2339.y = _2337.y;
	    _2339.z = _2337.z;
	    _577 = _2339;
	    vec3 _2351 = (vec4(_562.xyz, 1.0) * _2203) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2353 = _575;
	    _2353.x = _2351.x;
	    _2353.y = _2351.y;
	    _2353.z = _2351.z;
	    _575 = _2353;
	    vec4 _2361 = _576;
	    _2361.x = _561.x;
	    _2361.y = _561.y;
	    vec4 _2366 = _2361;
	    _2366.z = _2361.x;
	    _2366.w = _2361.y;
	    _576 = _2366;
	    vec4 _612 = _2366;
	    bool _613;
	    if (_591)
	    {
	        _613 = true;
	    }
	    else
	    {
	        _613 = _587;
	    }
	    if (_613)
	    {
	        vec4 _2377 = _612;
	        bvec4 _2379 = greaterThanEqual(_2377.xyzw, vec4(0.0));
	        vec4 _2380 = _2203[0];
	        vec4 _2382 = _2203[1];
	        vec4 _2384 = _2203[2];
	        float _2387 = length(vec3(_2380.x, _2382.x, _2384.x));
	        float _2392 = length(vec3(_2380.y, _2382.y, _2384.y));
	        float _2397 = length(vec3(_2380.z, _2382.z, _2384.z));
	        if (_591)
	        {
	            vec4 _2401 = vec4(_2387, _2392, _2397, 1.0);
	            if (_2379.x)
	            {
	                vec4 _2413 = _612;
	                _2413.x = ((_2413.x - _588.x) * dot(_2401, _590.xyzw)) + _588.x;
	                _612 = _2413;
	            }
	            if (_2379.y)
	            {
	                vec4 _2424 = _612;
	                _2424.y = ((_2424.y - _588.y) * dot(_2401, _589.xyzw)) + _588.y;
	                _612 = _2424;
	            }
	        }
	        if (_587)
	        {
	            vec4 _2433 = vec4(_2387, _2392, _2397, 1.0);
	            if (_2379.z)
	            {
	                vec4 _2445 = _612;
	                _2445.z = ((_2445.z - _584.x) * dot(_2433, _586.xyzw)) + _584.x;
	                _612 = _2445;
	            }
	            if (_2379.w)
	            {
	                vec4 _2456 = _612;
	                _2456.w = ((_2456.w - _584.y) * dot(_2433, _585.xyzw)) + _584.y;
	                _612 = _2456;
	            }
	        }
	    }
	    _576 = _612;
	    vec3 _530 = _577;
	    vec4 _529 = _612;
	    vec3 _528 = _575;
	    vec4 _527 = _574;
	    vec4 _526 = _573;
	    vec3 _557 = _685[2].vPositionOs;
	    vec2 _556 = _685[2].vTexCoord;
	    vec4 _555 = _685[2].vColorBlendValues;
	    vec4 _554 = _685[2].vBlendColorTint;
	    vec3 _553 = _685[2].vNormalOs;
	    vec3 _582 = vec3(0.0);
	    vec4 _581 = vec4(0.0);
	    vec3 _580 = vec3(0.0);
	    vec4 _579 = vec4(0.0);
	    mat3x4 _2475 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _2477 = transpose(gl_WorldToObjectEXT);
	    mat3 _611;
	    mat3 _2480 = _611;
	    _2480[0] = _2477[0].xyz;
	    _2480[1] = _2477[1].xyz;
	    _2480[2] = _2477[2].xyz;
	    _611 = _2480;
	    vec4 _2502 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _610 = _2502;
	    vec3 _2503 = _2502.xyz;
	    vec3 _2504 = _2503 * vec3(0.077399380505084991455078125);
	    vec3 _2507 = pow((_2503 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _607;
	    if (_2502.x <= 0.040449999272823333740234375)
	    {
	        _607 = _2504.x;
	    }
	    else
	    {
	        _607 = _2507.x;
	    }
	    float _608;
	    if (_2502.y <= 0.040449999272823333740234375)
	    {
	        _608 = _2504.y;
	    }
	    else
	    {
	        _608 = _2507.y;
	    }
	    float _609;
	    if (_2502.z <= 0.040449999272823333740234375)
	    {
	        _609 = _2504.z;
	    }
	    else
	    {
	        _609 = _2507.z;
	    }
	    vec3 _2532 = vec3(_607, _608, _609);
	    vec4 _2534 = _610;
	    _2534.x = _2532.x;
	    _2534.y = _2532.y;
	    _2534.z = _2532.z;
	    _610 = _2534;
	    vec4 _2541 = _579;
	    vec4 _2542 = _2541;
	    _2542.x = _2534.x;
	    vec4 _2544 = _2541;
	    _2544.y = _2534.y;
	    vec4 _2546 = _2541;
	    _2546.z = _2534.z;
	    vec4 _2548 = _2541;
	    _2548.w = _2534.w;
	    vec4 _2552 = mix(vec4(1.0), _2534, vec4(_555.w));
	    vec4 _2554 = _2541;
	    _2554.x = _2552.x;
	    _2554.y = _2552.y;
	    _2554.z = _2552.z;
	    _2554.w = _2552.w;
	    _579 = _2554;
	    vec3 _2564 = _554.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2567 = pow((_554.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _604;
	    if (_554.x <= 0.040449999272823333740234375)
	    {
	        _604 = _2564.x;
	    }
	    else
	    {
	        _604 = _2567.x;
	    }
	    float _605;
	    if (_554.y <= 0.040449999272823333740234375)
	    {
	        _605 = _2564.y;
	    }
	    else
	    {
	        _605 = _2567.y;
	    }
	    float _606;
	    if (_554.z <= 0.040449999272823333740234375)
	    {
	        _606 = _2564.z;
	    }
	    else
	    {
	        _606 = _2567.z;
	    }
	    vec3 _2596 = _2554.xyz * mix(vec3(1.0), vec3(_604, _605, _606), vec3(_554.w));
	    vec4 _2598 = _579;
	    _2598.x = _2596.x;
	    _2598.y = _2596.y;
	    _2598.z = _2596.z;
	    _579 = _2598;
	    vec4 _578 = vec4(_555.xyz, _555.w);
	    vec3 _2609 = normalize(_553 * transpose(_2480));
	    vec3 _2611 = _582;
	    _2611.x = _2609.x;
	    _2611.y = _2609.y;
	    _2611.z = _2609.z;
	    _582 = _2611;
	    vec3 _2623 = (vec4(_557.xyz, 1.0) * _2475) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2625 = _580;
	    _2625.x = _2623.x;
	    _2625.y = _2623.y;
	    _2625.z = _2623.z;
	    _580 = _2625;
	    vec4 _2633 = _581;
	    _2633.x = _556.x;
	    _2633.y = _556.y;
	    vec4 _2638 = _2633;
	    _2638.z = _2633.x;
	    _2638.w = _2633.y;
	    _581 = _2638;
	    vec4 _602 = _2638;
	    bool _603;
	    if (_591)
	    {
	        _603 = true;
	    }
	    else
	    {
	        _603 = _587;
	    }
	    if (_603)
	    {
	        vec4 _2649 = _602;
	        bvec4 _2651 = greaterThanEqual(_2649.xyzw, vec4(0.0));
	        vec4 _2652 = _2475[0];
	        vec4 _2654 = _2475[1];
	        vec4 _2656 = _2475[2];
	        float _2659 = length(vec3(_2652.x, _2654.x, _2656.x));
	        float _2664 = length(vec3(_2652.y, _2654.y, _2656.y));
	        float _2669 = length(vec3(_2652.z, _2654.z, _2656.z));
	        if (_591)
	        {
	            vec4 _2673 = vec4(_2659, _2664, _2669, 1.0);
	            if (_2651.x)
	            {
	                vec4 _2685 = _602;
	                _2685.x = ((_2685.x - _588.x) * dot(_2673, _590.xyzw)) + _588.x;
	                _602 = _2685;
	            }
	            if (_2651.y)
	            {
	                vec4 _2696 = _602;
	                _2696.y = ((_2696.y - _588.y) * dot(_2673, _589.xyzw)) + _588.y;
	                _602 = _2696;
	            }
	        }
	        if (_587)
	        {
	            vec4 _2705 = vec4(_2659, _2664, _2669, 1.0);
	            if (_2651.z)
	            {
	                vec4 _2717 = _602;
	                _2717.z = ((_2717.z - _584.x) * dot(_2705, _586.xyzw)) + _584.x;
	                _602 = _2717;
	            }
	            if (_2651.w)
	            {
	                vec4 _2728 = _602;
	                _2728.w = ((_2728.w - _584.y) * dot(_2705, _585.xyzw)) + _584.y;
	                _602 = _2728;
	            }
	        }
	    }
	    _581 = _602;
	    vec3 _525 = _582;
	    vec3 _524 = _580;
	    vec4 _542 = ((_534 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_529 * attrs.barycentrics.x)) + (_602 * attrs.barycentrics.y);
	    vec4 _541 = ((_532 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_527 * attrs.barycentrics.x)) + (_579 * attrs.barycentrics.y);
	    vec4 _540 = ((_531 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_526 * attrs.barycentrics.x)) + (_578 * attrs.barycentrics.y);
	    vec3 _539 = normalize(cross(_528 - _533, _580 - _533));
	    vec3 _601 = (((_535 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_530 * attrs.barycentrics.x)) + (_582 * attrs.barycentrics.y)).xyz;
	    vec4 _2804 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_583], g_bindless_Sampler[_592])), _542.xy, 0.0);
	    vec3 _2805 = _2804.xyz;
	    vec3 _552 = mix(_2805, _2805 * _541.xyz, vec3(_2804.w));
	    float _551 = _540.y;
	    float _550 = 0.039999999105930328369140625;
	    vec2 _549 = vec2(_540.x);
	    vec3 _548 = vec3(0.0);
	    float _547 = _540.z;
	    vec3 _546 = _601;
	    vec3 _545 = _601;
	    vec3 _544 = _539;
	    bool _543 = false;
	    vec3 _599[3] = vec3[](_533.xyz, _528.xyz, _524.xyz);
	    vec3 _600[3] = vec3[](_535, _530, _525);
	    vec3 _2838 = ((_599[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_599[1] * attrs.barycentrics.x)) + (_599[2] * attrs.barycentrics.y);
	    vec3 _593[3];
	    _593[0] = _2838 - (_600[0] * dot(_2838 - _599[0], _600[0]));
	    _593[1] = _2838 - (_600[1] * dot(_2838 - _599[1], _600[1]));
	    _593[2] = _2838 - (_600[2] * dot(_2838 - _599[2], _600[2]));
	    vec3 _2878 = ((_593[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_593[1] * attrs.barycentrics.x)) + (_593[2] * attrs.barycentrics.y);
	    vec3 _594[3];
	    _594[0] = cross(_599[0] - _599[1], _539);
	    _594[1] = cross(_599[1] - _599[2], _539);
	    _594[2] = cross(_599[2] - _599[0], _539);
	    float _595 = dot(_2878 - _2838, _539);
	    vec3 _596 = _2878;
	    int _597 = 0;
	    for (;;)
	    {
	        bool _2894_ladder_break = false;
	        do
	        {
	            if (!(_597 < 3))
	            {
	                _2894_ladder_break = true;
	                break;
	            }
	            if (_595 > 0.00999999977648258209228515625)
	            {
	                _2894_ladder_break = true;
	                break;
	            }
	            if (dot(_594[_597], _594[_597]) == 0.0)
	            {
	                break;
	            }
	            _594[_597] = normalize(_594[_597]);
	            int _598 = 0;
	            for (;;)
	            {
	                if (!(_598 < 3))
	                {
	                    break;
	                }
	                vec3 _2932 = _600[_598] - (_594[_597] * dot(_594[_597], _600[_598]));
	                _593[_598] = _2838 - (_2932 * dot(_2838 - _599[_598], _2932));
	                _598++;
	                continue;
	            }
	            vec3 _2956 = ((_593[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_593[1] * attrs.barycentrics.x)) + (_593[2] * attrs.barycentrics.y);
	            _595 = dot(_2956 - _2838, _539);
	            _596 = _2956;
	            break;
	        } while(false);
	        if (_2894_ladder_break)
	        {
	            break;
	        }
	        _597++;
	        continue;
	    }
	    if (!(_595 > 0.00999999977648258209228515625))
	    {
	        _596 = vec3(3.4028234663852885981170418348452e+38);
	    }
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _544;
	    payload.vInterpolatedNormalWs = _545;
	    payload.vSmoothPositionWs = _596;
	    payload.bFlippedNormal = _543;
	    f16vec3 _2987 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_2987, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _2987, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_546);
	    payload.material.vAlbedo = f16vec3(_552);
	    f16vec3 _2996 = f16vec3(_548);
	    payload.material.vEmissive = _2996;
	    payload.material.vEmissive = _2996 + f16vec3(_552 * _547);
	    payload.material.flReflectance = float16_t(_550);
	    payload.material.flMetalness = float16_t(_551);
	    payload.material.flRoughness = float16_t(_549.x);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	IntAttribute(RayTypeCount, 2);
	IntAttribute(TexCoordScaleByModelU, g_nScaleTexCoordUByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelV, g_nScaleTexCoordVByModelScaleAxis-1);
	IntAttribute(TexCoordScaleByModelUOrigin, g_nScaleTexCoordUByModelScaleOrigin);
	IntAttribute(TexCoordScaleByModelVOrigin, g_nScaleTexCoordVByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelU, g_nScaleTexCoord2UByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelV, g_nScaleTexCoord2VByModelScaleAxis-1);
	IntAttribute(TexCoord2ScaleByModelUOrigin, g_nScaleTexCoord2UByModelScaleOrigin);
	IntAttribute(TexCoord2ScaleByModelVOrigin, g_nScaleTexCoord2VByModelScaleOrigin);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, F_RENDER_BACKFACES ? 0 : 1);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(VertexPaintUI4Layer, true);
	BoolAttribute(VertexPaintUIPickColorAlpha, true);
	
}
