//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Environment Layer Shader.";
	DevShader = false;
	Version = 3;
	
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
}

COMMON
{
	#include "system.fxc"
}

struct VS_INPUT
{
	float4 vBlendIndices              : BLENDINDICES0  < Semantic( BlendIndices ); >;             
	float4 vBlendColorTint            : COLOR0         < Semantic( VertexPaintTintColor ); >;     
	float4 vPerVertexLighting         : COLOR1         < Semantic( PerVertexLighting ); >;         // D_BAKED_LIGHTING_FROM_VERTEX_STREAM=1
	uint4  nPackedFrame               : NORMAL0        < Semantic( CompressedTangentFrame ); >;   
	float4 vNormalOs                  : NORMAL0        < Semantic( Normal ); >;                   
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
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
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	
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
	
	layout(location = 6) in uint nInstanceIdx;
	layout(location = 5) in uvec4 vBlendIndices;
	layout(location = 2) in vec4 vBlendColorTint;
	layout(location = 3) in vec3 vNormalOs;
	layout(location = 4) in vec4 vTangentUOs_flTangentVSign;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 1) in vec2 vTexCoord;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec4 output_3;
	layout(location = 4) out vec4 output_4;
	
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
	    float _19302;
	    if (_23812.z <= 0.040449999272823333740234375)
	    {
	        _19302 = _17828.z;
	    }
	    else
	    {
	        _19302 = _7676.z;
	    }
	    vec4 _21206 = vec4(_21354, _21355, _19302, _23812.w);
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
	    vec3 _14119 = _21206.xyz * mix(vec3(1.0), vec3(_21356, _21357, _19494), vec3(vBlendColorTint.w));
	    vec4 _23714 = _21206;
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
	BoolAttribute(AllowBackfaceCulling, true);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(PerVertexLighting, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	RenderState(CullMode, (exists(shadervar_wireframebackfaces) && shadervar_wireframebackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(shadervar_wireframedepthenable) ? shadervar_wireframedepthenable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mAlbedoColorCorrect1 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor1))); >;
	float4x4 g_mTextureColorTint1 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
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
	bool g_bMaskColorTint1 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	bool g_bMaskVertexColorTint1 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float g_fLayerNormalStrength1 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / Normal"); >;
	float g_fLayerSelfIllumScale1 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / SelfIllum"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float g_flOverrideBloomAmount1 < Range(0, 20); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / SelfIllum"); >;
	int g_nTextureColorTintMode1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float3 g_vColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Roughness"); >;
	float3 g_vLayerSelfIllumTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 1 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Tint Mask"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 7 (name: g_mTextureColorTint1) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _768
	{
	    uint g_sAniso;
	    uint g_tColor1;
	    uint g_tNormalRoughness1;
	    uint g_tPacked1;
	    int g_bMaskColorTint1;
	    int g_bMaskVertexColorTint1;
	    float g_fVertexColorStrength1;
	    mat4 g_mTextureColorTint1;
	    mat4 g_mAlbedoColorCorrect1;
	    float g_fLayerNormalStrength1;
	    float g_fLayerSelfIllumScale1;
	    vec3 g_vLayerSelfIllumTint1;
	    vec2 g_vLayerRoughnessContrastBrightness1;
	    vec2 g_vLayerTintMaskContrastBrightness1;
	    vec2 g_vLayerMetalnessContrastBrightness1;
	    float g_flOverrideBloomAmount1;
	};
	
	layout(set = 1) uniform _768 _Globals_;
	
	struct _1011
	{
	    uint _m0;
	    ivec2 _m1;
	};
	
	layout(set = 1) uniform _1011 PerViewConstantBufferCitadel_t;
	
	layout(set = 4, binding = 46) uniform texture2D g_bindless_Texture2D_float4[65536];
	layout(set = 4, binding = 29) uniform sampler g_bindless_Sampler[2048];
	
	layout(location = 0) in vec3 input_0;
	layout(location = 1) in vec4 input_1;
	layout(location = 3) in vec4 input_3;
	layout(location = 4) in vec4 input_4;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    vec4 _19372 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness1], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy);
	    float _8915 = _19372.x;
	    float _14881 = _19372.y;
	    float _16783 = (_8915 + _14881) - 1.00392162799835205078125;
	    float _11176 = _8915 - _14881;
	    vec3 _15728 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	    vec3 _14344 = _15728;
	    _14344.y = -_15728.y;
	    vec2 _10984 = _14344.xy * _Globals_.g_fLayerNormalStrength1;
	    vec4 _19068 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor1], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy);
	    vec4 _19373 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tPacked1], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy);
	    float _19764 = saturate((((_19068.w - 0.5) + _Globals_.g_vLayerTintMaskContrastBrightness1.y) * _Globals_.g_vLayerTintMaskContrastBrightness1.x) + 0.5);
	    vec3 _13630 = (vec4(_19068.xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect1).xyz;
	    vec3 _15450 = mix(_13630, (vec4(_13630, 1.0) * _Globals_.g_mTextureColorTint1).xyz, vec3((_Globals_.g_bMaskColorTint1 != 0) ? _19764 : 1.0));
	    vec3 _13298 = mix(_15450, _15450 * input_3.xyz, vec3(((_Globals_.g_bMaskVertexColorTint1 != 0) ? _19764 : 1.0) * _Globals_.g_fVertexColorStrength1));
	    float _16651 = _19373.x * _Globals_.g_fLayerSelfIllumScale1;
	    float _18612 = saturate(_16651 * 0.100000001490116119384765625);
	    float _19133;
	    if (_18612 != 0.0)
	    {
	        _19133 = _18612 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m1)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19133 = _18612;
	    }
	    output_0 = vec4((normalize((((input_4.xyz * _10984.x).xyz + ((cross(input_0.xyz, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))).xyz * _10984.y)).xyz + (input_0.xyz * _15728.z)).xyz).xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4(((_13298 * 0.100000001490116119384765625) + ((_13298 * _16651) * _Globals_.g_vLayerSelfIllumTint1)) / vec3(0.100000001490116119384765625 + _16651), 0.12549020349979400634765625);
	    output_2 = vec4(saturate((((_19372.z - 0.5) + _Globals_.g_vLayerRoughnessContrastBrightness1.y) * _Globals_.g_vLayerRoughnessContrastBrightness1.x) + 0.5), _Globals_.g_flOverrideBloomAmount1, _19133, saturate((((_19373.y - 0.5) + _Globals_.g_vLayerMetalnessContrastBrightness1.y) * _Globals_.g_vLayerMetalnessContrastBrightness1.x) + 0.5));
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor1);
	BoolAttribute(SupportsLightmapping, true);
	BoolAttribute(SupportsMappingDimensions, true);
	IntAttribute(MaterialLayerCount, 1);
	StringAttribute(MaterialLayerRefType, environment_texture_set);
	StringAttribute(MaterialLayerRefFileEnding, _ts);
	StringAttribute(MaterialLayerType, environment_layer);
	
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
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	float4x4 g_mAlbedoColorCorrect1 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor1))); >;
	float4x4 g_mTextureColorTint1 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
	Texture2D g_tColor1 < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureTintMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tNormalRoughness1 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tPacked1 < Channel(R, Box(TextureSelfIllum1), Linear); Channel(G, Box(TextureMetalness1), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// ENVIRONMENT_LAYER 1
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 1 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness1, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 1 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 1 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 1 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum1, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 1 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask1, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 1 / Tint Mask", Default4(1, 1, 1, 0));
	bool g_bMaskColorTint1 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	bool g_bMaskVertexColorTint1 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float g_fLayerNormalStrength1 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / Normal"); >;
	float g_fLayerSelfIllumScale1 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / SelfIllum"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	int g_nTextureColorTintMode1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float3 g_vColorTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 1 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Roughness"); >;
	float3 g_vLayerSelfIllumTint1 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 1 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness1 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 1 / Tint Mask"); >;
	
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
	    uint _548 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    uint _614 = g_MaterialData_1._member0[_548 / 4u];
	    bool _613 = g_MaterialData_3._member0[(_548 + 48u) / 4u] != 0;
	    vec4 _612 = vec4(g_MaterialData_5._member0[(_548 + 64u) / 4u], g_MaterialData_5._member0[(_548 + 68u) / 4u], g_MaterialData_5._member0[(_548 + 72u) / 4u], g_MaterialData_5._member0[(_548 + 76u) / 4u]);
	    vec4 _611 = vec4(g_MaterialData_5._member0[(_548 + 80u) / 4u], g_MaterialData_5._member0[(_548 + 84u) / 4u], g_MaterialData_5._member0[(_548 + 88u) / 4u], g_MaterialData_5._member0[(_548 + 92u) / 4u]);
	    vec2 _610 = vec2(g_MaterialData_5._member0[(_548 + 96u) / 4u], g_MaterialData_5._member0[(_548 + 100u) / 4u]);
	    bool _609 = g_MaterialData_3._member0[(_548 + 120u) / 4u] != 0;
	    vec4 _608 = vec4(g_MaterialData_5._member0[(_548 + 128u) / 4u], g_MaterialData_5._member0[(_548 + 132u) / 4u], g_MaterialData_5._member0[(_548 + 136u) / 4u], g_MaterialData_5._member0[(_548 + 140u) / 4u]);
	    vec4 _607 = vec4(g_MaterialData_5._member0[(_548 + 144u) / 4u], g_MaterialData_5._member0[(_548 + 148u) / 4u], g_MaterialData_5._member0[(_548 + 152u) / 4u], g_MaterialData_5._member0[(_548 + 156u) / 4u]);
	    vec2 _606 = vec2(g_MaterialData_5._member0[(_548 + 160u) / 4u], g_MaterialData_5._member0[(_548 + 164u) / 4u]);
	    uint _605 = g_MaterialData_1._member0[(_548 + 320u) / 4u];
	    uint _604 = g_MaterialData_1._member0[(_548 + 324u) / 4u];
	    uint _603 = g_MaterialData_1._member0[(_548 + 328u) / 4u];
	    bool _602 = g_MaterialData_3._member0[(_548 + 368u) / 4u] != 0;
	    bool _601 = g_MaterialData_3._member0[(_548 + 372u) / 4u] != 0;
	    float _600 = g_MaterialData_5._member0[(_548 + 376u) / 4u];
	    mat4 _599 = mat4(vec4(g_MaterialData_5._member0[(_548 + 384u) / 4u], g_MaterialData_5._member0[(_548 + 400u) / 4u], g_MaterialData_5._member0[(_548 + 416u) / 4u], g_MaterialData_5._member0[(_548 + 432u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 388u) / 4u], g_MaterialData_5._member0[(_548 + 404u) / 4u], g_MaterialData_5._member0[(_548 + 420u) / 4u], g_MaterialData_5._member0[(_548 + 436u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 392u) / 4u], g_MaterialData_5._member0[(_548 + 408u) / 4u], g_MaterialData_5._member0[(_548 + 424u) / 4u], g_MaterialData_5._member0[(_548 + 440u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 396u) / 4u], g_MaterialData_5._member0[(_548 + 412u) / 4u], g_MaterialData_5._member0[(_548 + 428u) / 4u], g_MaterialData_5._member0[(_548 + 444u) / 4u]));
	    mat4 _598 = mat4(vec4(g_MaterialData_5._member0[(_548 + 448u) / 4u], g_MaterialData_5._member0[(_548 + 464u) / 4u], g_MaterialData_5._member0[(_548 + 480u) / 4u], g_MaterialData_5._member0[(_548 + 496u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 452u) / 4u], g_MaterialData_5._member0[(_548 + 468u) / 4u], g_MaterialData_5._member0[(_548 + 484u) / 4u], g_MaterialData_5._member0[(_548 + 500u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 456u) / 4u], g_MaterialData_5._member0[(_548 + 472u) / 4u], g_MaterialData_5._member0[(_548 + 488u) / 4u], g_MaterialData_5._member0[(_548 + 504u) / 4u]), vec4(g_MaterialData_5._member0[(_548 + 460u) / 4u], g_MaterialData_5._member0[(_548 + 476u) / 4u], g_MaterialData_5._member0[(_548 + 492u) / 4u], g_MaterialData_5._member0[(_548 + 508u) / 4u]));
	    float _597 = g_MaterialData_5._member0[(_548 + 512u) / 4u];
	    float _596 = g_MaterialData_5._member0[(_548 + 516u) / 4u];
	    vec3 _595 = vec3(g_MaterialData_5._member0[(_548 + 528u) / 4u], g_MaterialData_5._member0[(_548 + 532u) / 4u], g_MaterialData_5._member0[(_548 + 536u) / 4u]);
	    vec2 _594 = vec2(g_MaterialData_5._member0[(_548 + 544u) / 4u], g_MaterialData_5._member0[(_548 + 548u) / 4u]);
	    vec2 _593 = vec2(g_MaterialData_5._member0[(_548 + 552u) / 4u], g_MaterialData_5._member0[(_548 + 556u) / 4u]);
	    vec2 _592 = vec2(g_MaterialData_5._member0[(_548 + 560u) / 4u], g_MaterialData_5._member0[(_548 + 564u) / 4u]);
	    uvec3 _704;
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _1073 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _704 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_1073 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_1073 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_1073 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _1052 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _1053 = _1052 & 4294967292u;
	            uint _54 = _1053 / 4u;
	            uint _57 = (_1053 + 4u) / 4u;
	            uint _1057 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_54] & 4294901760u) >> uint(16);
	            uint _1058 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 65535u;
	            uvec3 _705;
	            if (_1052 == _1053)
	            {
	                _705 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_54] & 65535u, _1057, _1058);
	            }
	            else
	            {
	                _705 = uvec3(_1057, _1058, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 4294901760u) >> uint(16));
	            }
	            _704 = _705;
	            break;
	        }
	        break;
	    } while(false);
	    uint _70 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _1094 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _704) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    vec3 _706[3];
	    uint _1096 = _1094.x;
	    _706[0] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_1096 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1096 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1096 + 8u) / 4u]);
	    uint _1101 = _1094.y;
	    _706[1] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_1101 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1101 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1101 + 8u) / 4u]);
	    uint _1106 = _1094.z;
	    _706[2] = vec3(g_Vertices_1[nonuniformEXT(_70)]._member0[_1106 / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1106 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_70)]._member0[(_1106 + 8u) / 4u]);
	    int _707 = 0;
	    VS_INPUT _712[3];
	    for (;;)
	    {
	        if (!(_707 < 3))
	        {
	            break;
	        }
	        _712[_707].vPositionOs = _706[_707];
	        _707++;
	        continue;
	    }
	    vec2 _708[3];
	    _708[0] = vec2(0.0);
	    _708[1] = vec2(0.0);
	    _708[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	    {
	        ivec4 _703 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _99 = uint(_703[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	        uint _1148 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	        ivec4 _701 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _702 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _1164 = (uvec3(uint(_701[_1148])) * _704) + uvec3(uint(_702[_1148]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	        {
	            uint _1278 = _1164.x;
	            _708[0] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1278 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1278 + 4u) / 4u]);
	            uint _1281 = _1164.y;
	            _708[1] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1281 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1281 + 4u) / 4u]);
	            uint _1284 = _1164.z;
	            _708[2] = vec2(g_Vertices_1[nonuniformEXT(_99)]._member0[_1284 / 4u], g_Vertices_1[nonuniformEXT(_99)]._member0[(_1284 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	            {
	                uint _111 = _1164.x / 4u;
	                _708[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_111], g_Vertices_3[nonuniformEXT(_99)]._member0[_111] >> uint(16)) & uvec2(65535u))));
	                uint _114 = _1164.y / 4u;
	                _708[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_114], g_Vertices_3[nonuniformEXT(_99)]._member0[_114] >> uint(16)) & uvec2(65535u))));
	                uint _117 = _1164.z / 4u;
	                _708[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_99)]._member0[_117], g_Vertices_3[nonuniformEXT(_99)]._member0[_117] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                {
	                    uint _101 = _1164.x / 4u;
	                    uint _1177 = g_Vertices_3[nonuniformEXT(_99)]._member0[_101] & 65535u;
	                    int _700;
	                    if (_1177 > 32767u)
	                    {
	                        _700 = int(4294901760u | _1177);
	                    }
	                    else
	                    {
	                        _700 = int(_1177);
	                    }
	                    uint _1190 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_101] & 4294901760u) >> uint(16);
	                    int _699;
	                    if (_1190 > 32767u)
	                    {
	                        _699 = int(4294901760u | _1190);
	                    }
	                    else
	                    {
	                        _699 = int(_1190);
	                    }
	                    _708[0] = vec2(max(float(_700) * 3.0518509447574615478515625e-05, -1.0), max(float(_699) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _104 = _1164.y / 4u;
	                    uint _1204 = g_Vertices_3[nonuniformEXT(_99)]._member0[_104] & 65535u;
	                    int _698;
	                    if (_1204 > 32767u)
	                    {
	                        _698 = int(4294901760u | _1204);
	                    }
	                    else
	                    {
	                        _698 = int(_1204);
	                    }
	                    uint _1217 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_104] & 4294901760u) >> uint(16);
	                    int _697;
	                    if (_1217 > 32767u)
	                    {
	                        _697 = int(4294901760u | _1217);
	                    }
	                    else
	                    {
	                        _697 = int(_1217);
	                    }
	                    _708[1] = vec2(max(float(_698) * 3.0518509447574615478515625e-05, -1.0), max(float(_697) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _107 = _1164.z / 4u;
	                    uint _1231 = g_Vertices_3[nonuniformEXT(_99)]._member0[_107] & 65535u;
	                    int _696;
	                    if (_1231 > 32767u)
	                    {
	                        _696 = int(4294901760u | _1231);
	                    }
	                    else
	                    {
	                        _696 = int(_1231);
	                    }
	                    uint _1244 = (g_Vertices_3[nonuniformEXT(_99)]._member0[_107] & 4294901760u) >> uint(16);
	                    int _695;
	                    if (_1244 > 32767u)
	                    {
	                        _695 = int(4294901760u | _1244);
	                    }
	                    else
	                    {
	                        _695 = int(_1244);
	                    }
	                    _708[2] = vec2(max(float(_696) * 3.0518509447574615478515625e-05, -1.0), max(float(_695) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _707 = 0;
	    for (;;)
	    {
	        if (!(_707 < 3))
	        {
	            break;
	        }
	        _712[_707].vTexCoord = _708[_707];
	        _707++;
	        continue;
	    }
	    vec3 _709[3];
	    vec4 _710[3];
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	        {
	            ivec4 _681 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _139 = uint(_681[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	            uint _1328 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	            ivec4 _679 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _680 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _1344 = (uvec3(uint(_679[_1328])) * _704) + uvec3(uint(_680[_1328]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	            {
	                uint _1845 = _1344.x;
	                _709[0] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1845 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1845 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1845 + 8u) / 4u]);
	                uint _1850 = _1344.y;
	                _709[1] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1850 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1850 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1850 + 8u) / 4u]);
	                uint _1855 = _1344.z;
	                _709[2] = vec3(g_Vertices_1[nonuniformEXT(_139)]._member0[_1855 / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1855 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_139)]._member0[(_1855 + 8u) / 4u]);
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	                {
	                    uint _1599 = _1344.x;
	                    uvec2 _1601 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1599 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1599 + 4u) / 4u]);
	                    uint _1602 = _1344.y;
	                    uvec2 _547 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1602 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1602 + 4u) / 4u]);
	                    uint _1605 = _1344.z;
	                    uvec2 _546 = uvec2(g_Vertices_3[nonuniformEXT(_139)]._member0[_1605 / 4u], g_Vertices_3[nonuniformEXT(_139)]._member0[(_1605 + 4u) / 4u]);
	                    uint _1611 = _1601.x;
	                    uint _1619 = _1601.y;
	                    vec2 _1629 = ((vec2(float(_1611 & 65535u), float((_1611 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1630 = _1629.x;
	                    float _1635 = (1.0 - abs(_1630)) - abs(_1629.y);
	                    vec3 _1636 = vec3(_1630, _1629.y, _1635);
	                    float _1638 = saturate(-_1635);
	                    vec2 _1644 = _1629 + mix(vec2(_1638), vec2(-_1638), greaterThanEqual(_1629, vec2(0.0)));
	                    _1636.x = _1644.x;
	                    _1636.y = _1644.y;
	                    vec3 _683 = normalize(_1636);
	                    vec2 _1651 = ((vec2(float((_1619 >> uint(1)) & 32767u), float((_1619 >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1652 = _1651.x;
	                    float _1657 = (1.0 - abs(_1652)) - abs(_1651.y);
	                    vec3 _1658 = vec3(_1652, _1651.y, _1657);
	                    float _1660 = saturate(-_1657);
	                    vec2 _1666 = _1651 + mix(vec2(_1660), vec2(-_1660), greaterThanEqual(_1651, vec2(0.0)));
	                    _1658.x = _1666.x;
	                    _1658.y = _1666.y;
	                    vec3 _682 = normalize(_1658);
	                    float _669;
	                    if ((_1619 & 1u) != 0u)
	                    {
	                        _669 = 1.0;
	                    }
	                    else
	                    {
	                        _669 = -1.0;
	                    }
	                    _709[0] = _683;
	                    _710[0].w = _669;
	                    _710[0].x = _682.x;
	                    _710[0].y = _682.y;
	                    _710[0].z = _682.z;
	                    vec2 _1708 = ((vec2(float(_547.x & 65535u), float((_547.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1709 = _1708.x;
	                    float _1714 = (1.0 - abs(_1709)) - abs(_1708.y);
	                    vec3 _1715 = vec3(_1709, _1708.y, _1714);
	                    float _1717 = saturate(-_1714);
	                    vec2 _1723 = _1708 + mix(vec2(_1717), vec2(-_1717), greaterThanEqual(_1708, vec2(0.0)));
	                    _1715.x = _1723.x;
	                    _1715.y = _1723.y;
	                    vec3 _685 = normalize(_1715);
	                    vec2 _1730 = ((vec2(float((_547.y >> uint(1)) & 32767u), float((_547.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1731 = _1730.x;
	                    float _1736 = (1.0 - abs(_1731)) - abs(_1730.y);
	                    vec3 _1737 = vec3(_1731, _1730.y, _1736);
	                    float _1739 = saturate(-_1736);
	                    vec2 _1745 = _1730 + mix(vec2(_1739), vec2(-_1739), greaterThanEqual(_1730, vec2(0.0)));
	                    _1737.x = _1745.x;
	                    _1737.y = _1745.y;
	                    vec3 _684 = normalize(_1737);
	                    float _668;
	                    if ((_547.y & 1u) != 0u)
	                    {
	                        _668 = 1.0;
	                    }
	                    else
	                    {
	                        _668 = -1.0;
	                    }
	                    _709[1] = _685;
	                    _710[1].w = _668;
	                    _710[1].x = _684.x;
	                    _710[1].y = _684.y;
	                    _710[1].z = _684.z;
	                    vec2 _1787 = ((vec2(float(_546.x & 65535u), float((_546.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _1788 = _1787.x;
	                    float _1793 = (1.0 - abs(_1788)) - abs(_1787.y);
	                    vec3 _1794 = vec3(_1788, _1787.y, _1793);
	                    float _1796 = saturate(-_1793);
	                    vec2 _1802 = _1787 + mix(vec2(_1796), vec2(-_1796), greaterThanEqual(_1787, vec2(0.0)));
	                    _1794.x = _1802.x;
	                    _1794.y = _1802.y;
	                    vec3 _687 = normalize(_1794);
	                    vec2 _1809 = ((vec2(float((_546.y >> uint(1)) & 32767u), float((_546.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _1810 = _1809.x;
	                    float _1815 = (1.0 - abs(_1810)) - abs(_1809.y);
	                    vec3 _1816 = vec3(_1810, _1809.y, _1815);
	                    float _1818 = saturate(-_1815);
	                    vec2 _1824 = _1809 + mix(vec2(_1818), vec2(-_1818), greaterThanEqual(_1809, vec2(0.0)));
	                    _1816.x = _1824.x;
	                    _1816.y = _1824.y;
	                    vec3 _686 = normalize(_1816);
	                    float _667;
	                    if ((_546.y & 1u) != 0u)
	                    {
	                        _667 = 1.0;
	                    }
	                    else
	                    {
	                        _667 = -1.0;
	                    }
	                    _709[2] = _687;
	                    _710[2].w = _667;
	                    _710[2].x = _686.x;
	                    _710[2].y = _686.y;
	                    _710[2].z = _686.z;
	                    break;
	                }
	                else
	                {
	                    uint _141 = _1344.x / 4u;
	                    vec4 _689 = _710[0];
	                    float _1366 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1369 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1373 = (1.0 - abs(_1366)) - abs(_1369);
	                    vec3 _1374 = vec3(_1366, _1369, _1373);
	                    float _1376 = saturate(-_1373);
	                    vec2 _1377 = vec2(_1366, _1369);
	                    vec2 _1383 = _1377 + mix(vec2(_1376), vec2(-_1376), greaterThanEqual(_1377, vec2(0.0)));
	                    _1374.x = _1383.x;
	                    _1374.y = _1383.y;
	                    vec3 _1388 = normalize(_1374);
	                    vec3 _688 = _1388;
	                    float _1389 = _1388.z;
	                    float _676;
	                    if (_1389 >= 0.0)
	                    {
	                        _676 = 1.0;
	                    }
	                    else
	                    {
	                        _676 = -1.0;
	                    }
	                    float _1396 = (-1.0) / (_676 + _1389);
	                    float _1397 = _1388.x;
	                    vec3 _677;
	                    vec3 _1405 = _677;
	                    _1405.x = 1.0 + (((_676 * _1397) * _1397) * _1396);
	                    _1405.y = _676 * ((_1397 * _1388.y) * _1396);
	                    _1405.z = (-_676) * _1397;
	                    _677 = _1405;
	                    float _1413 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1419 = (_1405 * cos(_1413)) + (cross(_1388, _1405) * sin(_1413));
	                    vec4 _1421 = _689;
	                    _1421.x = _1419.x;
	                    _1421.y = _1419.y;
	                    _1421.z = _1419.z;
	                    _689 = _1421;
	                    float _678;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_141] & 1u) == 0u)
	                    {
	                        _678 = -1.0;
	                    }
	                    else
	                    {
	                        _678 = 1.0;
	                    }
	                    vec4 _1432 = _689;
	                    _1432.w = _678;
	                    _689 = _1432;
	                    _709[0] = _688;
	                    _710[0] = _1432;
	                    uint _144 = _1344.y / 4u;
	                    vec4 _691 = _710[1];
	                    float _1448 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1451 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1455 = (1.0 - abs(_1448)) - abs(_1451);
	                    vec3 _1456 = vec3(_1448, _1451, _1455);
	                    float _1458 = saturate(-_1455);
	                    vec2 _1459 = vec2(_1448, _1451);
	                    vec2 _1465 = _1459 + mix(vec2(_1458), vec2(-_1458), greaterThanEqual(_1459, vec2(0.0)));
	                    _1456.x = _1465.x;
	                    _1456.y = _1465.y;
	                    vec3 _1470 = normalize(_1456);
	                    vec3 _690 = _1470;
	                    float _1471 = _1470.z;
	                    float _673;
	                    if (_1471 >= 0.0)
	                    {
	                        _673 = 1.0;
	                    }
	                    else
	                    {
	                        _673 = -1.0;
	                    }
	                    float _1478 = (-1.0) / (_673 + _1471);
	                    float _1479 = _1470.x;
	                    vec3 _674;
	                    vec3 _1487 = _674;
	                    _1487.x = 1.0 + (((_673 * _1479) * _1479) * _1478);
	                    _1487.y = _673 * ((_1479 * _1470.y) * _1478);
	                    _1487.z = (-_673) * _1479;
	                    _674 = _1487;
	                    float _1495 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1501 = (_1487 * cos(_1495)) + (cross(_1470, _1487) * sin(_1495));
	                    vec4 _1503 = _691;
	                    _1503.x = _1501.x;
	                    _1503.y = _1501.y;
	                    _1503.z = _1501.z;
	                    _691 = _1503;
	                    float _675;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_144] & 1u) == 0u)
	                    {
	                        _675 = -1.0;
	                    }
	                    else
	                    {
	                        _675 = 1.0;
	                    }
	                    vec4 _1514 = _691;
	                    _1514.w = _675;
	                    _691 = _1514;
	                    _709[1] = _690;
	                    _710[1] = _1514;
	                    uint _147 = _1344.z / 4u;
	                    vec4 _693 = _710[2];
	                    float _1530 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1533 = (float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _1537 = (1.0 - abs(_1530)) - abs(_1533);
	                    vec3 _1538 = vec3(_1530, _1533, _1537);
	                    float _1540 = saturate(-_1537);
	                    vec2 _1541 = vec2(_1530, _1533);
	                    vec2 _1547 = _1541 + mix(vec2(_1540), vec2(-_1540), greaterThanEqual(_1541, vec2(0.0)));
	                    _1538.x = _1547.x;
	                    _1538.y = _1547.y;
	                    vec3 _1552 = normalize(_1538);
	                    vec3 _692 = _1552;
	                    float _1553 = _1552.z;
	                    float _670;
	                    if (_1553 >= 0.0)
	                    {
	                        _670 = 1.0;
	                    }
	                    else
	                    {
	                        _670 = -1.0;
	                    }
	                    float _1560 = (-1.0) / (_670 + _1553);
	                    float _1561 = _1552.x;
	                    vec3 _671;
	                    vec3 _1569 = _671;
	                    _1569.x = 1.0 + (((_670 * _1561) * _1561) * _1560);
	                    _1569.y = _670 * ((_1561 * _1552.y) * _1560);
	                    _1569.z = (-_670) * _1561;
	                    _671 = _1569;
	                    float _1577 = float((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _1583 = (_1569 * cos(_1577)) + (cross(_1552, _1569) * sin(_1577));
	                    vec4 _1585 = _693;
	                    _1585.x = _1583.x;
	                    _1585.y = _1583.y;
	                    _1585.z = _1583.z;
	                    _693 = _1585;
	                    float _672;
	                    if ((g_Vertices_3[nonuniformEXT(_139)]._member0[_147] & 1u) == 0u)
	                    {
	                        _672 = -1.0;
	                    }
	                    else
	                    {
	                        _672 = 1.0;
	                    }
	                    vec4 _1596 = _693;
	                    _1596.w = _672;
	                    _693 = _1596;
	                    _709[2] = _692;
	                    _710[2] = _1596;
	                    break;
	                }
	                break;
	            }
	        }
	        else
	        {
	            _709[0] = vec3(0.0);
	            _709[1] = vec3(0.0);
	            _709[2] = vec3(0.0);
	        }
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.y != 0)
	        {
	            ivec4 _694 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _197 = uint(_694[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z]);
	            uint _1874 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z);
	            ivec4 _665 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _666 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _1890 = (uvec3(uint(_665[_1874])) * _704) + uvec3(uint(_666[_1874]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.x));
	            uint _1892 = _1890.x;
	            _710[0] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1892 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1892 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1892 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1892 + 12u) / 4u]);
	            uint _1898 = _1890.y;
	            _710[1] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1898 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1898 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1898 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1898 + 12u) / 4u]);
	            uint _1904 = _1890.z;
	            _710[2] = vec4(g_Vertices_1[nonuniformEXT(_197)]._member0[_1904 / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1904 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1904 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_197)]._member0[(_1904 + 12u) / 4u]);
	        }
	        else
	        {
	            _710[0] = vec4(0.0);
	            _710[1] = vec4(0.0);
	            _710[2] = vec4(0.0);
	        }
	        break;
	    } while(false);
	    _707 = 0;
	    for (;;)
	    {
	        if (!(_707 < 3))
	        {
	            break;
	        }
	        _712[_707].vNormalOs = _709[_707];
	        _712[_707].vTangentUOs_flTangentVSign = _710[_707];
	        _707++;
	        continue;
	    }
	    vec4 _711[3];
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y != 0)
	    {
	        ivec4 _664 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _235 = uint(_664[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z]);
	        uint _1951 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z);
	        ivec4 _662 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _663 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _1967 = (uvec3(uint(_662[_1951])) * _704) + uvec3(uint(_663[_1951]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y == 2)
	        {
	            uint _2009 = _1967.x;
	            _711[0] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_2009 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2009 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2009 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2009 + 12u) / 4u]);
	            uint _2015 = _1967.y;
	            _711[1] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_2015 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2015 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2015 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2015 + 12u) / 4u]);
	            uint _2021 = _1967.z;
	            _711[2] = vec4(g_Vertices_1[nonuniformEXT(_235)]._member0[_2021 / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2021 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2021 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_235)]._member0[(_2021 + 12u) / 4u]);
	        }
	        else
	        {
	            uint _237 = _1967.x / 4u;
	            _711[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_237] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _240 = _1967.y / 4u;
	            _711[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_240] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _243 = _1967.z / 4u;
	            _711[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 255u, (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_235)]._member0[_243] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        }
	    }
	    else
	    {
	        _711[0] = vec4(0.0);
	        _711[1] = vec4(0.0);
	        _711[2] = vec4(0.0);
	    }
	    _707 = 0;
	    for (;;)
	    {
	        if (!(_707 < 3))
	        {
	            break;
	        }
	        _712[_707].vBlendColorTint = _711[_707];
	        _707++;
	        continue;
	    }
	    vec3 _576 = _712[0].vPositionOs;
	    vec2 _575 = _712[0].vTexCoord;
	    vec4 _574 = _712[0].vBlendColorTint;
	    vec3 _573 = _712[0].vNormalOs;
	    vec4 _572 = _712[0].vTangentUOs_flTangentVSign;
	    vec3 _581 = vec3(0.0);
	    vec4 _580 = vec4(0.0);
	    vec3 _579 = vec3(0.0);
	    vec4 _578 = vec4(0.0);
	    vec4 _577 = vec4(0.0);
	    mat3x4 _2053 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _2055 = transpose(gl_WorldToObjectEXT);
	    mat3 _660;
	    mat3 _2058 = _660;
	    _2058[0] = _2055[0].xyz;
	    _2058[1] = _2055[1].xyz;
	    _2058[2] = _2055[2].xyz;
	    _660 = _2058;
	    mat3 _2066 = transpose(_2058);
	    vec4 _2080 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _659 = _2080;
	    vec3 _2081 = _2080.xyz;
	    vec3 _2082 = _2081 * vec3(0.077399380505084991455078125);
	    vec3 _2085 = pow((_2081 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _656;
	    if (_2080.x <= 0.040449999272823333740234375)
	    {
	        _656 = _2082.x;
	    }
	    else
	    {
	        _656 = _2085.x;
	    }
	    float _657;
	    if (_2080.y <= 0.040449999272823333740234375)
	    {
	        _657 = _2082.y;
	    }
	    else
	    {
	        _657 = _2085.y;
	    }
	    float _658;
	    if (_2080.z <= 0.040449999272823333740234375)
	    {
	        _658 = _2082.z;
	    }
	    else
	    {
	        _658 = _2085.z;
	    }
	    vec3 _2110 = vec3(_656, _657, _658);
	    vec4 _2112 = _659;
	    _2112.x = _2110.x;
	    _2112.y = _2110.y;
	    _2112.z = _2110.z;
	    _659 = _2112;
	    vec4 _2119 = _578;
	    _2119.x = _2112.x;
	    _2119.y = _2112.y;
	    _2119.z = _2112.z;
	    _2119.w = _2112.w;
	    _578 = _2119;
	    vec3 _2130 = _574.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2133 = pow((_574.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _653;
	    if (_574.x <= 0.040449999272823333740234375)
	    {
	        _653 = _2130.x;
	    }
	    else
	    {
	        _653 = _2133.x;
	    }
	    float _654;
	    if (_574.y <= 0.040449999272823333740234375)
	    {
	        _654 = _2130.y;
	    }
	    else
	    {
	        _654 = _2133.y;
	    }
	    float _655;
	    if (_574.z <= 0.040449999272823333740234375)
	    {
	        _655 = _2130.z;
	    }
	    else
	    {
	        _655 = _2133.z;
	    }
	    vec3 _2162 = _2119.xyz * mix(vec3(1.0), vec3(_653, _654, _655), vec3(_574.w));
	    vec4 _2164 = _578;
	    _2164.x = _2162.x;
	    _2164.y = _2162.y;
	    _2164.z = _2162.z;
	    _578 = _2164;
	    vec4 _661;
	    vec4 _2173 = _661;
	    _2173.x = _572.x;
	    _2173.y = _572.y;
	    _2173.z = _572.z;
	    _2173.w = _572.w;
	    _661 = _2173;
	    vec3 _2183 = normalize(_573 * _2066);
	    vec3 _2186 = normalize(_2173.xyz * _2066);
	    vec4 _2188 = _577;
	    _2188.x = _2186.x;
	    _2188.y = _2186.y;
	    _2188.z = _2186.z;
	    _2188.w = _2173.w;
	    _577 = _2188;
	    vec3 _2197 = _581;
	    _2197.x = _2183.x;
	    _2197.y = _2183.y;
	    _2197.z = _2183.z;
	    _581 = _2197;
	    vec3 _2209 = (vec4(_576.xyz, 1.0) * _2053) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2211 = _579;
	    _2211.x = _2209.x;
	    _2211.y = _2209.y;
	    _2211.z = _2209.z;
	    _579 = _2211;
	    vec4 _2219 = _580;
	    _2219.x = _575.x;
	    _2219.y = _575.y;
	    vec4 _2224 = _2219;
	    _2224.z = _2219.x;
	    _2224.w = _2219.y;
	    _580 = _2224;
	    vec4 _651 = _2224;
	    bool _652;
	    if (_613)
	    {
	        _652 = true;
	    }
	    else
	    {
	        _652 = _609;
	    }
	    if (_652)
	    {
	        vec4 _2235 = _651;
	        bvec4 _2237 = greaterThanEqual(_2235.xyzw, vec4(0.0));
	        vec4 _2238 = _2053[0];
	        vec4 _2240 = _2053[1];
	        vec4 _2242 = _2053[2];
	        float _2245 = length(vec3(_2238.x, _2240.x, _2242.x));
	        float _2250 = length(vec3(_2238.y, _2240.y, _2242.y));
	        float _2255 = length(vec3(_2238.z, _2240.z, _2242.z));
	        if (_613)
	        {
	            vec4 _2259 = vec4(_2245, _2250, _2255, 1.0);
	            if (_2237.x)
	            {
	                vec4 _2271 = _651;
	                _2271.x = ((_2271.x - _610.x) * dot(_2259, _612.xyzw)) + _610.x;
	                _651 = _2271;
	            }
	            if (_2237.y)
	            {
	                vec4 _2282 = _651;
	                _2282.y = ((_2282.y - _610.y) * dot(_2259, _611.xyzw)) + _610.y;
	                _651 = _2282;
	            }
	        }
	        if (_609)
	        {
	            vec4 _2291 = vec4(_2245, _2250, _2255, 1.0);
	            if (_2237.z)
	            {
	                vec4 _2303 = _651;
	                _2303.z = ((_2303.z - _606.x) * dot(_2291, _608.xyzw)) + _606.x;
	                _651 = _2303;
	            }
	            if (_2237.w)
	            {
	                vec4 _2314 = _651;
	                _2314.w = ((_2314.w - _606.y) * dot(_2291, _607.xyzw)) + _606.y;
	                _651 = _2314;
	            }
	        }
	    }
	    _580 = _651;
	    vec3 _545 = _581;
	    vec4 _544 = _651;
	    vec3 _543 = _579;
	    vec4 _542 = _578;
	    vec4 _541 = _577;
	    vec3 _571 = _712[1].vPositionOs;
	    vec2 _570 = _712[1].vTexCoord;
	    vec4 _569 = _712[1].vBlendColorTint;
	    vec3 _568 = _712[1].vNormalOs;
	    vec4 _567 = _712[1].vTangentUOs_flTangentVSign;
	    vec3 _586 = vec3(0.0);
	    vec4 _585 = vec4(0.0);
	    vec3 _584 = vec3(0.0);
	    vec4 _583 = vec4(0.0);
	    vec4 _582 = vec4(0.0);
	    mat3x4 _2333 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _2335 = transpose(gl_WorldToObjectEXT);
	    mat3 _649;
	    mat3 _2338 = _649;
	    _2338[0] = _2335[0].xyz;
	    _2338[1] = _2335[1].xyz;
	    _2338[2] = _2335[2].xyz;
	    _649 = _2338;
	    mat3 _2346 = transpose(_2338);
	    vec4 _2360 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _648 = _2360;
	    vec3 _2361 = _2360.xyz;
	    vec3 _2362 = _2361 * vec3(0.077399380505084991455078125);
	    vec3 _2365 = pow((_2361 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _645;
	    if (_2360.x <= 0.040449999272823333740234375)
	    {
	        _645 = _2362.x;
	    }
	    else
	    {
	        _645 = _2365.x;
	    }
	    float _646;
	    if (_2360.y <= 0.040449999272823333740234375)
	    {
	        _646 = _2362.y;
	    }
	    else
	    {
	        _646 = _2365.y;
	    }
	    float _647;
	    if (_2360.z <= 0.040449999272823333740234375)
	    {
	        _647 = _2362.z;
	    }
	    else
	    {
	        _647 = _2365.z;
	    }
	    vec3 _2390 = vec3(_645, _646, _647);
	    vec4 _2392 = _648;
	    _2392.x = _2390.x;
	    _2392.y = _2390.y;
	    _2392.z = _2390.z;
	    _648 = _2392;
	    vec4 _2399 = _583;
	    _2399.x = _2392.x;
	    _2399.y = _2392.y;
	    _2399.z = _2392.z;
	    _2399.w = _2392.w;
	    _583 = _2399;
	    vec3 _2410 = _569.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2413 = pow((_569.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _642;
	    if (_569.x <= 0.040449999272823333740234375)
	    {
	        _642 = _2410.x;
	    }
	    else
	    {
	        _642 = _2413.x;
	    }
	    float _643;
	    if (_569.y <= 0.040449999272823333740234375)
	    {
	        _643 = _2410.y;
	    }
	    else
	    {
	        _643 = _2413.y;
	    }
	    float _644;
	    if (_569.z <= 0.040449999272823333740234375)
	    {
	        _644 = _2410.z;
	    }
	    else
	    {
	        _644 = _2413.z;
	    }
	    vec3 _2442 = _2399.xyz * mix(vec3(1.0), vec3(_642, _643, _644), vec3(_569.w));
	    vec4 _2444 = _583;
	    _2444.x = _2442.x;
	    _2444.y = _2442.y;
	    _2444.z = _2442.z;
	    _583 = _2444;
	    vec4 _650;
	    vec4 _2453 = _650;
	    _2453.x = _567.x;
	    _2453.y = _567.y;
	    _2453.z = _567.z;
	    _2453.w = _567.w;
	    _650 = _2453;
	    vec3 _2463 = normalize(_568 * _2346);
	    vec3 _2466 = normalize(_2453.xyz * _2346);
	    vec4 _2468 = _582;
	    _2468.x = _2466.x;
	    _2468.y = _2466.y;
	    _2468.z = _2466.z;
	    _2468.w = _2453.w;
	    _582 = _2468;
	    vec3 _2477 = _586;
	    _2477.x = _2463.x;
	    _2477.y = _2463.y;
	    _2477.z = _2463.z;
	    _586 = _2477;
	    vec3 _2489 = (vec4(_571.xyz, 1.0) * _2333) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2491 = _584;
	    _2491.x = _2489.x;
	    _2491.y = _2489.y;
	    _2491.z = _2489.z;
	    _584 = _2491;
	    vec4 _2499 = _585;
	    _2499.x = _570.x;
	    _2499.y = _570.y;
	    vec4 _2504 = _2499;
	    _2504.z = _2499.x;
	    _2504.w = _2499.y;
	    _585 = _2504;
	    vec4 _640 = _2504;
	    bool _641;
	    if (_613)
	    {
	        _641 = true;
	    }
	    else
	    {
	        _641 = _609;
	    }
	    if (_641)
	    {
	        vec4 _2515 = _640;
	        bvec4 _2517 = greaterThanEqual(_2515.xyzw, vec4(0.0));
	        vec4 _2518 = _2333[0];
	        vec4 _2520 = _2333[1];
	        vec4 _2522 = _2333[2];
	        float _2525 = length(vec3(_2518.x, _2520.x, _2522.x));
	        float _2530 = length(vec3(_2518.y, _2520.y, _2522.y));
	        float _2535 = length(vec3(_2518.z, _2520.z, _2522.z));
	        if (_613)
	        {
	            vec4 _2539 = vec4(_2525, _2530, _2535, 1.0);
	            if (_2517.x)
	            {
	                vec4 _2551 = _640;
	                _2551.x = ((_2551.x - _610.x) * dot(_2539, _612.xyzw)) + _610.x;
	                _640 = _2551;
	            }
	            if (_2517.y)
	            {
	                vec4 _2562 = _640;
	                _2562.y = ((_2562.y - _610.y) * dot(_2539, _611.xyzw)) + _610.y;
	                _640 = _2562;
	            }
	        }
	        if (_609)
	        {
	            vec4 _2571 = vec4(_2525, _2530, _2535, 1.0);
	            if (_2517.z)
	            {
	                vec4 _2583 = _640;
	                _2583.z = ((_2583.z - _606.x) * dot(_2571, _608.xyzw)) + _606.x;
	                _640 = _2583;
	            }
	            if (_2517.w)
	            {
	                vec4 _2594 = _640;
	                _2594.w = ((_2594.w - _606.y) * dot(_2571, _607.xyzw)) + _606.y;
	                _640 = _2594;
	            }
	        }
	    }
	    _585 = _640;
	    vec3 _540 = _586;
	    vec4 _539 = _640;
	    vec3 _538 = _584;
	    vec4 _537 = _583;
	    vec4 _536 = _582;
	    vec3 _566 = _712[2].vPositionOs;
	    vec2 _565 = _712[2].vTexCoord;
	    vec4 _564 = _712[2].vBlendColorTint;
	    vec3 _563 = _712[2].vNormalOs;
	    vec4 _562 = _712[2].vTangentUOs_flTangentVSign;
	    vec3 _591 = vec3(0.0);
	    vec4 _590 = vec4(0.0);
	    vec3 _589 = vec3(0.0);
	    vec4 _588 = vec4(0.0);
	    vec4 _587 = vec4(0.0);
	    mat3x4 _2613 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _2615 = transpose(gl_WorldToObjectEXT);
	    mat3 _638;
	    mat3 _2618 = _638;
	    _2618[0] = _2615[0].xyz;
	    _2618[1] = _2615[1].xyz;
	    _2618[2] = _2615[2].xyz;
	    _638 = _2618;
	    mat3 _2626 = transpose(_2618);
	    vec4 _2640 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _637 = _2640;
	    vec3 _2641 = _2640.xyz;
	    vec3 _2642 = _2641 * vec3(0.077399380505084991455078125);
	    vec3 _2645 = pow((_2641 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _634;
	    if (_2640.x <= 0.040449999272823333740234375)
	    {
	        _634 = _2642.x;
	    }
	    else
	    {
	        _634 = _2645.x;
	    }
	    float _635;
	    if (_2640.y <= 0.040449999272823333740234375)
	    {
	        _635 = _2642.y;
	    }
	    else
	    {
	        _635 = _2645.y;
	    }
	    float _636;
	    if (_2640.z <= 0.040449999272823333740234375)
	    {
	        _636 = _2642.z;
	    }
	    else
	    {
	        _636 = _2645.z;
	    }
	    vec3 _2670 = vec3(_634, _635, _636);
	    vec4 _2672 = _637;
	    _2672.x = _2670.x;
	    _2672.y = _2670.y;
	    _2672.z = _2670.z;
	    _637 = _2672;
	    vec4 _2679 = _588;
	    _2679.x = _2672.x;
	    _2679.y = _2672.y;
	    _2679.z = _2672.z;
	    _2679.w = _2672.w;
	    _588 = _2679;
	    vec3 _2690 = _564.xyz * vec3(0.077399380505084991455078125);
	    vec3 _2693 = pow((_564.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _631;
	    if (_564.x <= 0.040449999272823333740234375)
	    {
	        _631 = _2690.x;
	    }
	    else
	    {
	        _631 = _2693.x;
	    }
	    float _632;
	    if (_564.y <= 0.040449999272823333740234375)
	    {
	        _632 = _2690.y;
	    }
	    else
	    {
	        _632 = _2693.y;
	    }
	    float _633;
	    if (_564.z <= 0.040449999272823333740234375)
	    {
	        _633 = _2690.z;
	    }
	    else
	    {
	        _633 = _2693.z;
	    }
	    vec3 _2722 = _2679.xyz * mix(vec3(1.0), vec3(_631, _632, _633), vec3(_564.w));
	    vec4 _2724 = _588;
	    _2724.x = _2722.x;
	    _2724.y = _2722.y;
	    _2724.z = _2722.z;
	    _588 = _2724;
	    vec4 _639;
	    vec4 _2733 = _639;
	    _2733.x = _562.x;
	    _2733.y = _562.y;
	    _2733.z = _562.z;
	    _2733.w = _562.w;
	    _639 = _2733;
	    vec3 _2743 = normalize(_563 * _2626);
	    vec3 _2746 = normalize(_2733.xyz * _2626);
	    vec4 _2748 = _587;
	    _2748.x = _2746.x;
	    _2748.y = _2746.y;
	    _2748.z = _2746.z;
	    _2748.w = _2733.w;
	    _587 = _2748;
	    vec3 _2757 = _591;
	    _2757.x = _2743.x;
	    _2757.y = _2743.y;
	    _2757.z = _2743.z;
	    _591 = _2757;
	    vec3 _2769 = (vec4(_566.xyz, 1.0) * _2613) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _2771 = _589;
	    _2771.x = _2769.x;
	    _2771.y = _2769.y;
	    _2771.z = _2769.z;
	    _589 = _2771;
	    vec4 _2779 = _590;
	    _2779.x = _565.x;
	    _2779.y = _565.y;
	    vec4 _2784 = _2779;
	    _2784.z = _2779.x;
	    _2784.w = _2779.y;
	    _590 = _2784;
	    vec4 _629 = _2784;
	    bool _630;
	    if (_613)
	    {
	        _630 = true;
	    }
	    else
	    {
	        _630 = _609;
	    }
	    if (_630)
	    {
	        vec4 _2795 = _629;
	        bvec4 _2797 = greaterThanEqual(_2795.xyzw, vec4(0.0));
	        vec4 _2798 = _2613[0];
	        vec4 _2800 = _2613[1];
	        vec4 _2802 = _2613[2];
	        float _2805 = length(vec3(_2798.x, _2800.x, _2802.x));
	        float _2810 = length(vec3(_2798.y, _2800.y, _2802.y));
	        float _2815 = length(vec3(_2798.z, _2800.z, _2802.z));
	        if (_613)
	        {
	            vec4 _2819 = vec4(_2805, _2810, _2815, 1.0);
	            if (_2797.x)
	            {
	                vec4 _2831 = _629;
	                _2831.x = ((_2831.x - _610.x) * dot(_2819, _612.xyzw)) + _610.x;
	                _629 = _2831;
	            }
	            if (_2797.y)
	            {
	                vec4 _2842 = _629;
	                _2842.y = ((_2842.y - _610.y) * dot(_2819, _611.xyzw)) + _610.y;
	                _629 = _2842;
	            }
	        }
	        if (_609)
	        {
	            vec4 _2851 = vec4(_2805, _2810, _2815, 1.0);
	            if (_2797.z)
	            {
	                vec4 _2863 = _629;
	                _2863.z = ((_2863.z - _606.x) * dot(_2851, _608.xyzw)) + _606.x;
	                _629 = _2863;
	            }
	            if (_2797.w)
	            {
	                vec4 _2874 = _629;
	                _2874.w = ((_2874.w - _606.y) * dot(_2851, _607.xyzw)) + _606.y;
	                _629 = _2874;
	            }
	        }
	    }
	    _590 = _629;
	    vec3 _535 = _591;
	    vec3 _534 = _589;
	    vec3 _2905 = ((_545 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_540 * attrs.barycentrics.x)) + (_591 * attrs.barycentrics.y);
	    vec4 _2936 = ((_541 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_536 * attrs.barycentrics.x)) + (_587 * attrs.barycentrics.y);
	    vec4 _551 = ((_544 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_539 * attrs.barycentrics.x)) + (_629 * attrs.barycentrics.y);
	    vec4 _550 = ((_542 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_537 * attrs.barycentrics.x)) + (_588 * attrs.barycentrics.y);
	    vec3 _549 = normalize(cross(_538 - _543, _589 - _543));
	    vec3 _625 = _2905.xyz;
	    vec3 _626 = _2936.xyz;
	    float _624;
	    if (_2936.w > 0.0)
	    {
	        _624 = 1.0;
	    }
	    else
	    {
	        _624 = -1.0;
	    }
	    vec4 _2956 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_604], g_bindless_Sampler[_614])), _551.xy, 0.0);
	    vec2 _627;
	    vec2 _2959 = _627;
	    _2959.x = _2956.x;
	    _2959.y = _2956.y;
	    _627 = _2959;
	    float _2966 = (_2959.x + _2959.y) - 1.00392162799835205078125;
	    float _2967 = _2959.x - _2959.y;
	    vec3 _2974 = normalize(vec3(vec2(_2966, _2967), (1.0 - abs(_2966)) - abs(_2967)));
	    _2974.y = -_2974.y;
	    vec2 _2980 = _2974.xy * _597;
	    vec3 _2982 = _2974;
	    _2982.x = _2980.x;
	    _2982.y = _2980.y;
	    vec3 _2988 = _626.xyz * _2982.x;
	    vec3 _623;
	    vec3 _2990 = _623;
	    _2990.x = _2988.x;
	    _2990.y = _2988.y;
	    _2990.z = _2988.z;
	    vec3 _3000 = _2990.xyz + ((cross(_2905.xyz, _626.xyz) * _624).xyz * _2982.y);
	    vec3 _3002 = _2990;
	    _3002.x = _3000.x;
	    _3002.y = _3000.y;
	    _3002.z = _3000.z;
	    vec3 _3011 = _3002.xyz + (_625.xyz * _2982.z);
	    vec3 _3013 = _3002;
	    _3013.x = _3011.x;
	    _3013.y = _3011.y;
	    _3013.z = _3011.z;
	    _623 = _3013;
	    vec4 _3022 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_605], g_bindless_Sampler[_614])), _551.xy, 0.0);
	    vec4 _3026 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_603], g_bindless_Sampler[_614])), _551.xy, 0.0);
	    float _3044 = saturate((((_3022.w - 0.5) + _593.y) * _593.x) + 0.5);
	    vec3 _3057 = (vec4(_3022.xyz, 1.0) * _598).xyz;
	    float _628;
	    if (_602)
	    {
	        _628 = _3044;
	    }
	    else
	    {
	        _628 = 1.0;
	    }
	    float _3066 = _628;
	    vec3 _3068 = mix(_3057, (vec4(_3057, 1.0) * _599).xyz, vec3(_3066));
	    if (_601)
	    {
	        _628 = _3044;
	    }
	    else
	    {
	        _628 = 1.0;
	    }
	    vec3 _3080 = mix(_3068, _3068 * _550.xyz, vec3(_628 * _600));
	    float _3082 = _3026.x * _596;
	    vec3 _561 = ((_3080 * 0.100000001490116119384765625) + ((_3080 * _3082) * _595)) / vec3(0.100000001490116119384765625 + _3082);
	    float _560 = saturate((((_3026.y - 0.5) + _592.y) * _592.x) + 0.5);
	    float _559 = 0.039999999105930328369140625;
	    vec2 _558 = vec2(saturate((((_2956.z - 0.5) + _594.y) * _594.x) + 0.5));
	    vec3 _557 = vec3(0.0);
	    float _556 = _3082;
	    vec3 _555 = normalize(_3013.xyz);
	    vec3 _554 = _625;
	    vec3 _553 = _549;
	    bool _552 = false;
	    vec3 _621[3] = vec3[](_543.xyz, _538.xyz, _534.xyz);
	    vec3 _622[3] = vec3[](_545, _540, _535);
	    vec3 _3118 = ((_621[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_621[1] * attrs.barycentrics.x)) + (_621[2] * attrs.barycentrics.y);
	    vec3 _615[3];
	    _615[0] = _3118 - (_622[0] * dot(_3118 - _621[0], _622[0]));
	    _615[1] = _3118 - (_622[1] * dot(_3118 - _621[1], _622[1]));
	    _615[2] = _3118 - (_622[2] * dot(_3118 - _621[2], _622[2]));
	    vec3 _3158 = ((_615[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_615[1] * attrs.barycentrics.x)) + (_615[2] * attrs.barycentrics.y);
	    vec3 _616[3];
	    _616[0] = cross(_621[0] - _621[1], _549);
	    _616[1] = cross(_621[1] - _621[2], _549);
	    _616[2] = cross(_621[2] - _621[0], _549);
	    float _617 = dot(_3158 - _3118, _549);
	    vec3 _618 = _3158;
	    int _619 = 0;
	    for (;;)
	    {
	        bool _3174_ladder_break = false;
	        do
	        {
	            if (!(_619 < 3))
	            {
	                _3174_ladder_break = true;
	                break;
	            }
	            if (_617 > 0.00999999977648258209228515625)
	            {
	                _3174_ladder_break = true;
	                break;
	            }
	            if (dot(_616[_619], _616[_619]) == 0.0)
	            {
	                break;
	            }
	            _616[_619] = normalize(_616[_619]);
	            int _620 = 0;
	            for (;;)
	            {
	                if (!(_620 < 3))
	                {
	                    break;
	                }
	                vec3 _3212 = _622[_620] - (_616[_619] * dot(_616[_619], _622[_620]));
	                _615[_620] = _3118 - (_3212 * dot(_3118 - _621[_620], _3212));
	                _620++;
	                continue;
	            }
	            vec3 _3236 = ((_615[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_615[1] * attrs.barycentrics.x)) + (_615[2] * attrs.barycentrics.y);
	            _617 = dot(_3236 - _3118, _549);
	            _618 = _3236;
	            break;
	        } while(false);
	        if (_3174_ladder_break)
	        {
	            break;
	        }
	        _619++;
	        continue;
	    }
	    if (!(_617 > 0.00999999977648258209228515625))
	    {
	        _618 = vec3(3.4028234663852885981170418348452e+38);
	    }
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _553;
	    payload.vInterpolatedNormalWs = _554;
	    payload.vSmoothPositionWs = _618;
	    payload.bFlippedNormal = _552;
	    f16vec3 _3267 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_3267, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _3267, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_555);
	    payload.material.vAlbedo = f16vec3(_561);
	    f16vec3 _3276 = f16vec3(_557);
	    payload.material.vEmissive = _3276;
	    payload.material.vEmissive = _3276 + f16vec3(_561 * _556);
	    payload.material.flReflectance = float16_t(_559);
	    payload.material.flMetalness = float16_t(_560);
	    payload.material.flRoughness = float16_t(_558.x);
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
	BoolAttribute(AllowBackfaceCulling, true);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(PerVertexLighting, true);
	
}
