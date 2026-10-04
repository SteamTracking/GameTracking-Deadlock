//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Generic parallax shader using layers";
	DevShader = false;
	Version = 1;
	
	// Platform: VULKAN_SM_60
	// Programs: ps, rtx, vs
}

MODES
{
	Depth("depth_only_bindless.vfx");
	FrontDepth("depth_only_bindless.vfx");
	Raytrace();
	Deferred();
	ToolsWireframe(S_MODE_TOOLS_WIREFRAME);
	ToolsVis(S_MODE_TOOLS_VIS);
}

FEATURES
{
	Feature( F_WORLD_OVERLAY, 0..1, "Overlay" );
	Feature( F_OVERRIDE_BLOOM_AMOUNT, 0..1, "Rendering" );
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
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1, D_BAKED_LIGHTING_FROM_VERTEX_STREAM=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float2 vTexcoord3                 : TEXCOORD1      < Semantic( LowPrecisionUv1 ); >;          
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
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
	
	layout(location = 7) in uint nInstanceIdx;
	layout(location = 6) in uvec4 vBlendIndices;
	layout(location = 5) in vec4 vBlendColorTint;
	layout(location = 3) in vec3 vNormalOs;
	layout(location = 4) in vec4 vTangentUOs_flTangentVSign;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 1) in vec2 vTexCoord;
	layout(location = 2) in vec2 vTexcoord3;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
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
	    vec3 _10377 = _22017 - PerViewConstantBuffer_t._m3.xyz;
	    vec4 _22101 = vec4(0.0, 0.0, 0.0, 1.0);
	    _22101.x = _10377.x;
	    _22101.y = _10377.y;
	    _22101.z = _10377.z;
	    vec4 _18256 = (vec4(_22017.xyz, 1.0) + (PerViewConstantBuffer_t._m2 * 1.0)).xyzw * PerViewConstantBuffer_t._m0;
	    vec4 _13745 = vec4(vTexCoord, vTexcoord3);
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
	    output_2 = _22101;
	    output_3 = _23714;
	    output_4 = vec4(normalize(vTangentUOs_flTangentVSign.xyz * _13976), vTangentUOs_flTangentVSign.w);
	    _18256.y = -_18256.y;
	    gl_Position = _18256;
	    gl_ClipDistance[0] = dot(vec4(_22017.xyz, 1.0), PerViewConstantBuffer_t._m1.xyzw);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
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
	BoolAttribute(WriteDepthBeforeAlphaBlending, true);
	
}

PS
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_WORLD_OVERLAY, F_WORLD_OVERLAY );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	DynamicCombo( D_OPAQUE_FADE, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicCombo( D_SATURATION_VOLUMES, 0..1 );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_OPAQUE_FADE ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS, D_SATURATION_VOLUMES ) );
	
	RenderState(CullMode, (exists(shadervar_wireframebackfaces) && shadervar_wireframebackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(shadervar_wireframedepthenable) ? shadervar_wireframedepthenable : true);
	RenderState(DepthFunc, Equal);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	bool g_bIsDeprecated < Attribute("bIsDeprecated"); UiType(CheckBox); >;
	bool g_bOverrideBloomAmount < UiType(CheckBox); Expression(F_OVERRIDE_BLOOM_AMOUNT ? 1 : 0); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mAlbedoColorCorrect < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor))); >;
	float4x4 g_mAlbedoColorCorrect2 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness2,TextureAverageColor(g_tColor2))); >;
	float4x4 g_mAlbedoColorCorrect3 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness3,TextureAverageColor(g_tColor3))); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor2 < Channel(RGB, Blur5(TextureColor2), Srgb); Channel(A, Box(TextureSelfIllumMask2), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor3 < Channel(RGB, Box(TextureColor3), Srgb); Channel(A, Box(TextureLayer3SelfIllumMask), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColorWorldOverlay < Channel(RGB, ArtistDefined(TextureColorWorldOverlay), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tMask < Channel(R, Box(TextureMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tMask2 < Channel(R, Blur5(TextureMask2), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness2 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal2, TextureRoughness2), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tReflectionOcclusionMask < Channel(R, Blur5(TextureReflectionOcclusionMask), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	
	// Layer 1
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "Layer 1/10", Default4(0.5, 0.5, 0.5, 0));
	float g_flWorldOverlayStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/World Overlay/10"); >;
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 1/11"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/16"); >;
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "Layer 1/20", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "Layer 1/30", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMask1, Linear, 8, "", "_mask", "Layer 1/40", Default4(1, 0, 0, 0));
	
	// Layer 2
	CreateInputTexture2D(TextureColor2, Srgb, 8, "", "_color", "Layer 2/10", Default4(1, 1, 1, 0));
	float3 g_vAlbedoContrastSaturationBrightness2 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 2/11"); >;
	float g_fVertexColorStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/16"); >;
	CreateInputTexture2D(TextureNormal2, Linear, 8, "NormalizeNormals", "_normal", "Layer 2/20", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness2, Linear, 8, "Inverse", "_rough", "Layer 2/30", Default4(0.5, 0.5, 0.5, 0));
	float g_bLayer2ShadingBlendStrength < Default(1); UiType(Slider); UiGroup("Layer 2/31"); >;
	CreateInputTexture2D(TextureMask2, Linear, 8, "", "_mask", "Layer 2/40", Default4(1, 1, 1, 0));
	float g_flLayer2Offset < Range(0, 1000); UiType(Slider); UiGroup("Layer 2/41"); Expression(this/1024); >;
	float g_flParallaxViewAngleLimit2 < Default(0.5); UiType(Slider); UiGroup("Layer 2/42"); >;
	CreateInputTexture2D(TextureSelfIllumMask2, Linear, 8, "", "_mask", "Layer 2/50", Default4(0, 0, 0, 0));
	float3 g_vEmissiveTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("Layer 2/51"); Expression(pow(2,g_flEmissiveLevel2)*SrgbGammaToLinear(this)); >;
	float g_flEmissiveLevel2 < Range(0, 8); UiType(Slider); UiGroup("Layer 2/52"); >;
	CreateInputTexture2D(TextureReflectionOcclusionMask, Linear, 8, "", "_mask", "Layer 2/60", Default4(0, 0, 0, 0));
	bool g_bLayer2UseSecondaryUV < UiType(CheckBox); UiGroup("Layer 2/60"); >;
	float g_flReflectionOcclusionOffset < Range(0, 1000); UiType(Slider); UiGroup("Layer 2/61"); Expression(this/1024); >;
	float g_flReflectionOcclusionViewAngleLimit < Default(0.5); UiType(Slider); UiGroup("Layer 2/62"); >;
	bool g_bReflectionOcclusionUseSecondaryUV < UiType(CheckBox); UiGroup("Layer 2/63"); >;
	
	// Layer 3
	CreateInputTexture2D(TextureColor3, Srgb, 8, "", "_color", "Layer 3/10", Default4(1, 1, 1, 0));
	float3 g_vAlbedoContrastSaturationBrightness3 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 3/11"); >;
	float g_fVertexColorStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/16"); >;
	CreateInputTexture2D(TextureLayer3SelfIllumMask, Linear, 8, "", "_mask", "Layer 3/50", Default4(0, 0, 0, 0));
	float3 g_vEmissiveTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("Layer 3/51"); Expression(pow(2,g_flEmissiveLevel3)*SrgbGammaToLinear(this)); >;
	float g_flEmissiveLevel3 < Range(0, 8); UiType(Slider); UiGroup("Layer 3/52"); >;
	float g_flLayer3Offset < Range(0, 1000); UiType(Slider); UiGroup("Layer 3/60"); Expression(this/1024); >;
	float g_flParallaxViewAngleLimit3 < Default(0.5); UiType(Slider); UiGroup("Layer 3/61"); >;
	bool g_bLayer3UseSecondaryUV < UiType(CheckBox); UiGroup("Layer 3/70"); >;
	
	// World Overlay
	float g_flWorldOverlayTiling < Default(512); Range(1, 4096); UiType(Slider); UiGroup("World Overlay/Transform"); Expression(1/this); >;
	CreateInputTexture2D(TextureColorWorldOverlay, Linear, 8, "", "_color", "World Overlay/10", Default4(0.5, 0.5, 0.5, 0));
	float g_flWorldOverlayDarknessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("World Overlay/20"); >;
	float g_flWorldOverlayBrightnessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("World Overlay/30"); >;
	
	// UI_GROUP_SELF_ILLUM
	float g_flOverrideBloomAmount1 < Default(1); Range(0, 20); UiType(Slider); UiGroup("UI_GROUP_SELF_ILLUM"); UiVisibility(F_OVERRIDE_BLOOM_AMOUNT ? 1 : 0); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 5 (name: g_mAlbedoColorCorrect) cannot be expressed with either HLSL packing layout or packoffset.
	//
	// Re-attempting reflection with the GLSL backend.
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, GLSL reflection with SPIRV-Cross by KhronosGroup
	
	#version 460
	#extension GL_EXT_samplerless_texture_functions : require
	
	vec4 _3;
	
	struct _2551
	{
	    uint g_sAniso;
	    uint g_tColor;
	    uint g_tMask;
	    uint g_tNormalRoughness;
	    float g_fVertexColorStrength1;
	    mat4 g_mAlbedoColorCorrect;
	    uint g_tColor2;
	    uint g_tMask2;
	    uint g_tNormalRoughness2;
	    vec3 g_vEmissiveTint2;
	    float g_flEmissiveLevel2;
	    float g_flLayer2Offset;
	    float g_flParallaxViewAngleLimit2;
	    int g_bLayer2UseSecondaryUV;
	    float g_bLayer2ShadingBlendStrength;
	    float g_fVertexColorStrength2;
	    mat4 g_mAlbedoColorCorrect2;
	    uint g_tReflectionOcclusionMask;
	    float g_flReflectionOcclusionOffset;
	    float g_flReflectionOcclusionViewAngleLimit;
	    int g_bReflectionOcclusionUseSecondaryUV;
	    uint g_tColor3;
	    vec3 g_vEmissiveTint3;
	    float g_flEmissiveLevel3;
	    float g_flLayer3Offset;
	    float g_flParallaxViewAngleLimit3;
	    int g_bLayer3UseSecondaryUV;
	    float g_fVertexColorStrength3;
	    mat4 g_mAlbedoColorCorrect3;
	    int g_bOverrideBloomAmount;
	    float g_flOverrideBloomAmount1;
	};
	
	layout(set = 1) uniform _2551 _Globals_;
	
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
	layout(location = 2) in vec4 input_2;
	layout(location = 3) in vec4 input_3;
	layout(location = 4) in vec4 input_4;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    vec3 _8106 = dFdxFine(input_2.xyz);
	    vec3 _15910 = dFdyFine(input_2.xyz);
	    float _12157 = 1.0 / length(input_0);
	    vec3 _11587 = input_0 * _12157;
	    vec3 _7640 = input_4.xyz * _12157;
	    vec3 _11327 = (cross(input_0, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))) * _12157;
	    vec3 _18354 = -normalize(input_2.xyz);
	    float _18343 = 1.0 / dot(_18354, input_0);
	    float _10825 = _Globals_.g_flLayer2Offset * _18343;
	    float _10826 = _Globals_.g_flLayer3Offset * _18343;
	    float _11234 = _Globals_.g_flReflectionOcclusionOffset * _18343;
	    vec2 _14518 = dFdxFine(input_1.zw);
	    vec2 _13915 = dFdyFine(input_1.zw);
	    float _17522 = _13915.y;
	    float _15279 = dot(_14518, vec2(_17522, -_13915.x));
	    float _17298 = (_15279 < 0.0) ? (-1.0) : 1.0;
	    vec2 _24530 = vec2(_17522, -_14518.y) * _17298;
	    vec3 _7463 = ((_8106 - (_11587 * dot(_8106, _11587))) * _24530.x) + ((_15910 - (_11587 * dot(_15910, _11587))) * _24530.y);
	    vec3 _9082;
	    if (abs(_15279) > 0.0)
	    {
	        _9082 = normalize(_7463);
	    }
	    else
	    {
	        _9082 = _7463;
	    }
	    vec2 _13992 = vec2(dot(_18354, _7640), dot(_18354, _11327));
	    vec2 _7627 = vec2(dot(_18354, _9082), dot(_18354, cross(_11587, _9082) * (_17298 * float((dot(_15910, cross(_11587, _8106)) < 0.0) ? (-1) : 1))));
	    vec2 _24537 = vec2(_Globals_.g_flParallaxViewAngleLimit2);
	    vec2 _16694 = vec2(-_Globals_.g_flParallaxViewAngleLimit2);
	    vec2 _24538 = vec2(_Globals_.g_flParallaxViewAngleLimit3);
	    vec2 _19719 = min(_13992, _24538);
	    vec2 _16695 = vec2(-_Globals_.g_flParallaxViewAngleLimit3);
	    vec2 _22947 = vec2(-_Globals_.g_flReflectionOcclusionViewAngleLimit);
	    vec2 _9716;
	    vec2 _24878;
	    if (_Globals_.g_bLayer2UseSecondaryUV != 0)
	    {
	        vec2 _15161 = max(min(_7627, _24537), _16694);
	        _9716 = input_1.zw - (_15161 * _10825);
	        _24878 = _15161;
	    }
	    else
	    {
	        _9716 = input_1.xy - (max(min(_13992, _24537), _16694) * _10825);
	        _24878 = _7627;
	    }
	    vec2 _9717;
	    vec2 _24879;
	    if (_Globals_.g_bLayer3UseSecondaryUV != 0)
	    {
	        vec2 _15162 = max(min(_24878, _24538), _16695);
	        _9717 = input_1.zw - (_15162 * _10826);
	        _24879 = _15162;
	    }
	    else
	    {
	        _9717 = input_1.xy - (max(_19719, _16695) * _10826);
	        _24879 = _24878;
	    }
	    vec2 _21709;
	    if (_Globals_.g_bReflectionOcclusionUseSecondaryUV != 0)
	    {
	        _21709 = input_1.zw - (max(min(_24879, vec2(_Globals_.g_flReflectionOcclusionViewAngleLimit)), _22947) * _11234);
	    }
	    else
	    {
	        _21709 = input_1.xy - (max(_19719, _22947) * _11234);
	    }
	    vec4 _18045 = vec4(texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy).xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect;
	    vec4 _22900;
	    _22900.x = _18045.x;
	    _22900.y = _18045.y;
	    _22900.z = _18045.z;
	    vec3 _23588 = mix(_22900.xyz, _22900.xyz * input_3.xyz, vec3(_Globals_.g_fVertexColorStrength1));
	    vec4 _17842;
	    _17842.x = _23588.x;
	    _17842.y = _23588.y;
	    _17842.z = _23588.z;
	    vec4 _19415 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor2], g_bindless_Sampler[_Globals_.g_sAniso]), _9716.xy);
	    vec4 _18046 = vec4(_19415.xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect2;
	    vec4 _22901;
	    _22901.x = _18046.x;
	    _22901.y = _18046.y;
	    _22901.z = _18046.z;
	    vec3 _23589 = mix(_22901.xyz, _22901.xyz * input_3.xyz, vec3(_Globals_.g_fVertexColorStrength2));
	    vec4 _17843;
	    _17843.x = _23589.x;
	    _17843.y = _23589.y;
	    _17843.z = _23589.z;
	    vec4 _19416 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor3], g_bindless_Sampler[_Globals_.g_sAniso]), _9717.xy);
	    vec4 _18047 = vec4(_19416.xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect3;
	    vec4 _22902;
	    _22902.x = _18047.x;
	    _22902.y = _18047.y;
	    _22902.z = _18047.z;
	    vec3 _23590 = mix(_22902.xyz, _22902.xyz * input_3.xyz, vec3(_Globals_.g_fVertexColorStrength3));
	    vec4 _17844;
	    _17844.x = _23590.x;
	    _17844.y = _23590.y;
	    _17844.z = _23590.z;
	    vec4 _19068 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tMask], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy);
	    float _17476 = _19068.x;
	    vec4 _19334 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tMask2], g_bindless_Sampler[_Globals_.g_sAniso]), _9716.xy);
	    float _15396 = _19334.x;
	    float _21836 = 1.0 - _17476;
	    float _21974 = 1.0 - _15396;
	    float _14732 = ((_Globals_.g_flEmissiveLevel2 * _19415.w) * _21836) * dot(_Globals_.g_vEmissiveTint2.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    float _16370 = ((_Globals_.g_flEmissiveLevel3 * _19416.w) * _21974) * dot(_Globals_.g_vEmissiveTint3.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    vec3 _15916 = mix(mix(_17844.xyz, _17843.xyz, vec3(_15396)), _17842.xyz, vec3(_17476)).xyz;
	    float _15610 = _21836 * _21974;
	    vec3 _7625 = mix(_15916, _Globals_.g_vEmissiveTint2.xyz * _15916, vec3((1.0 - _15610) * saturate(_14732))).xyz;
	    float _12100 = mix(_21836 * _14732, _16370, _15610);
	    vec4 _19417 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness], g_bindless_Sampler[_Globals_.g_sAniso]), input_1.xy);
	    vec4 _14794 = _19417.xyzw;
	    vec4 _19418 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness2], g_bindless_Sampler[_Globals_.g_sAniso]), _9716.xy);
	    vec4 _14795 = _19418.xyzw;
	    float _24071 = step(texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tReflectionOcclusionMask], g_bindless_Sampler[_Globals_.g_sAniso]), _21709.xy).x, 0.5);
	    float _20381 = _19417.z;
	    _14794.z = mix(mix(1.0, _20381, _24071), _20381, _Globals_.g_bLayer2ShadingBlendStrength);
	    _14795.z = mix(1.0, _19418.z, _24071);
	    vec4 _10910 = mix(_14794, _14795, vec4(_21836 * _Globals_.g_bLayer2ShadingBlendStrength));
	    float _21486 = _10910.x;
	    float _18662 = _10910.y;
	    float _16783 = (_21486 + _18662) - 1.00392162799835205078125;
	    float _11176 = _21486 - _18662;
	    vec3 _13706 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	    vec3 _9822 = abs(_13706);
	    vec2 _16475 = (-vec2(_13706.x, (-1.0) * _13706.y)) / vec2(max(_9822.z, 0.0078125 * max(_9822.x, _9822.y)));
	    float _20826;
	    if (_Globals_.g_bOverrideBloomAmount != 0)
	    {
	        _20826 = saturate((_Globals_.g_flOverrideBloomAmount1 * _12100) * 0.0500000007450580596923828125);
	    }
	    else
	    {
	        _20826 = 0.0;
	    }
	    float _16190 = saturate(_12100 * 0.100000001490116119384765625);
	    float _19133;
	    if (_16190 != 0.0)
	    {
	        _19133 = _16190 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m1)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19133 = _16190;
	    }
	    output_0 = vec4((normalize(_11587 - ((_7640 * _16475.x) + (_11327 * _16475.y))).xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4(mix(_7625, _Globals_.g_vEmissiveTint3.xyz * _7625, vec3(_15610 * saturate(_16370))), 0.12549020349979400634765625);
	    output_2 = vec4(_10910.z, _20826, _19133, 0.0);
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor);
	BoolAttribute(SupportsLightmapping, true);
	BoolAttribute(SupportsMappingDimensions, true);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(PerVertexLighting, true);
	
}

RTX
{
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_WORLD_OVERLAY, F_WORLD_OVERLAY );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_WIREFRAME ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	float4x4 g_mAlbedoColorCorrect < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor))); >;
	float4x4 g_mAlbedoColorCorrect2 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness2,TextureAverageColor(g_tColor2))); >;
	float4x4 g_mAlbedoColorCorrect3 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness3,TextureAverageColor(g_tColor3))); >;
	Texture2D g_tColor < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor2 < Channel(RGB, Blur5(TextureColor2), Srgb); Channel(A, Box(TextureSelfIllumMask2), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor3 < Channel(RGB, Box(TextureColor3), Srgb); Channel(A, Box(TextureLayer3SelfIllumMask), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tMask < Channel(R, Box(TextureMask1), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tMask2 < Channel(R, Blur5(TextureMask2), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tNormalRoughness < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness2 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal2, TextureRoughness2), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tReflectionOcclusionMask < Channel(R, Blur5(TextureReflectionOcclusionMask), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float2 g_vTexCoord2ScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoord2UByModelScaleOrigin/2,g_nScaleTexCoord2VByModelScaleOrigin/2)); >;
	float4 g_vTexCoord2ScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoord2UByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoord2ScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoord2VByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==0) ? 1 : 0)); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	
	// Layer 1
	CreateInputTexture2D(TextureColor1, Srgb, 8, "", "_color", "Layer 1/10", Default4(0.5, 0.5, 0.5, 0));
	float3 g_vAlbedoContrastSaturationBrightness1 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 1/11"); >;
	float g_fVertexColorStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/16"); >;
	CreateInputTexture2D(TextureNormal1, Linear, 8, "NormalizeNormals", "_normal", "Layer 1/20", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness1, Linear, 8, "Inverse", "_rough", "Layer 1/30", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMask1, Linear, 8, "", "_mask", "Layer 1/40", Default4(1, 0, 0, 0));
	
	// Layer 2
	CreateInputTexture2D(TextureColor2, Srgb, 8, "", "_color", "Layer 2/10", Default4(1, 1, 1, 0));
	float3 g_vAlbedoContrastSaturationBrightness2 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 2/11"); >;
	float g_fVertexColorStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/16"); >;
	CreateInputTexture2D(TextureNormal2, Linear, 8, "NormalizeNormals", "_normal", "Layer 2/20", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness2, Linear, 8, "Inverse", "_rough", "Layer 2/30", Default4(0.5, 0.5, 0.5, 0));
	float g_bLayer2ShadingBlendStrength < Default(1); UiType(Slider); UiGroup("Layer 2/31"); >;
	CreateInputTexture2D(TextureMask2, Linear, 8, "", "_mask", "Layer 2/40", Default4(1, 1, 1, 0));
	float g_flParallaxViewAngleLimit2 < Default(0.5); UiType(Slider); UiGroup("Layer 2/42"); >;
	CreateInputTexture2D(TextureSelfIllumMask2, Linear, 8, "", "_mask", "Layer 2/50", Default4(0, 0, 0, 0));
	float3 g_vEmissiveTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("Layer 2/51"); Expression(pow(2,g_flEmissiveLevel2)*SrgbGammaToLinear(this)); >;
	float g_flEmissiveLevel2 < Range(0, 8); UiType(Slider); UiGroup("Layer 2/52"); >;
	CreateInputTexture2D(TextureReflectionOcclusionMask, Linear, 8, "", "_mask", "Layer 2/60", Default4(0, 0, 0, 0));
	bool g_bLayer2UseSecondaryUV < UiType(CheckBox); UiGroup("Layer 2/60"); >;
	float g_flReflectionOcclusionOffset < Range(0, 1000); UiType(Slider); UiGroup("Layer 2/61"); Expression(this/1024); >;
	float g_flReflectionOcclusionViewAngleLimit < Default(0.5); UiType(Slider); UiGroup("Layer 2/62"); >;
	bool g_bReflectionOcclusionUseSecondaryUV < UiType(CheckBox); UiGroup("Layer 2/63"); >;
	
	// Layer 3
	CreateInputTexture2D(TextureColor3, Srgb, 8, "", "_color", "Layer 3/10", Default4(1, 1, 1, 0));
	float3 g_vAlbedoContrastSaturationBrightness3 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("Layer 3/11"); >;
	float g_fVertexColorStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/16"); >;
	CreateInputTexture2D(TextureLayer3SelfIllumMask, Linear, 8, "", "_mask", "Layer 3/50", Default4(0, 0, 0, 0));
	float3 g_vEmissiveTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("Layer 3/51"); Expression(pow(2,g_flEmissiveLevel3)*SrgbGammaToLinear(this)); >;
	float g_flEmissiveLevel3 < Range(0, 8); UiType(Slider); UiGroup("Layer 3/52"); >;
	float g_flParallaxViewAngleLimit3 < Default(0.5); UiType(Slider); UiGroup("Layer 3/61"); >;
	bool g_bLayer3UseSecondaryUV < UiType(CheckBox); UiGroup("Layer 3/70"); >;
	
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
	
	struct _RTX_MATERIAL_DATA_
	{
	    uint g_sAniso;
	    uint g_sAnisoClamp;
	    uint g_sBilinearWrap;
	    uint g_sBilinearClamp;
	    uint g_sBilinearClamp_NoGlobalMipBias;
	    uint g_sTrilinearWrap;
	    uint g_sTrilinearWrap_NoGlobalMipBias;
	    uint g_sTrilinearClamp;
	    uint g_sPointClamp;
	    uint g_sPointWrap;
	    float _g_fl_AutoPad0_;
	    float _g_fl_AutoPad1_;
	    vec4 g_vPixelToProj;
	    mat4 g_mHighPrecisionWorldFromProj;
	    mat4 g_mHighPrecisionWorldFromProjNoJitter;
	    vec4 g_vInvCMTDims;
	    vec3 g_vJitterFrequenciesA1;
	    float _g_fl_AutoPad2_;
	    vec3 g_vJitterAmplitudesXA1;
	    float _g_fl_AutoPad3_;
	    vec3 g_vJitterAmplitudesYA1;
	    float _g_fl_AutoPad4_;
	    vec3 g_vJitterAmplitudesZA1;
	    float g_flJitterSpeedA1;
	    vec3 g_vJitterFrequenciesB1;
	    float _g_fl_AutoPad5_;
	    vec3 g_vJitterAmplitudesXB1;
	    float _g_fl_AutoPad6_;
	    vec3 g_vJitterAmplitudesYB1;
	    float _g_fl_AutoPad7_;
	    vec3 g_vJitterAmplitudesZB1;
	    float g_flJitterSpeedB1;
	    float g_flJitterQuantizeTime1;
	    float g_flJitterQuantizeDisplacement1;
	    float _g_fl_AutoPad8_;
	    float _g_fl_AutoPad9_;
	    vec3 g_vJitterExpression;
	    bool g_bUseSecondaryUvForJitterMask;
	    bool g_bSynchronizeJitter1;
	    uint g_tJitterMask;
	    int g_nScaleTexCoordUByModelScaleAxis;
	    int g_nScaleTexCoordVByModelScaleAxis;
	    bool g_bTexCoordScaleByModel;
	    int g_nScaleTexCoordUByModelScaleOrigin;
	    int g_nScaleTexCoordVByModelScaleOrigin;
	    float _g_fl_AutoPad10_;
	    vec4 g_vTexCoordScaleByModelU;
	    vec4 g_vTexCoordScaleByModelV;
	    vec2 g_vTexCoordScaleByModelOrigin;
	    int g_nScaleTexCoord2UByModelScaleAxis;
	    int g_nScaleTexCoord2VByModelScaleAxis;
	    int g_nScaleTexCoord2UByModelScaleOrigin;
	    int g_nScaleTexCoord2VByModelScaleOrigin;
	    bool g_bTexCoord2ScaleByModel;
	    float _g_fl_AutoPad11_;
	    vec4 g_vTexCoord2ScaleByModelU;
	    vec4 g_vTexCoord2ScaleByModelV;
	    vec2 g_vTexCoord2ScaleByModelOrigin;
	    uint g_tColor;
	    uint g_tMask;
	    uint g_tNormalRoughness;
	    float _g_fl_AutoPad12_;
	    float _g_fl_AutoPad13_;
	    float _g_fl_AutoPad14_;
	    vec3 g_vAlbedoContrastSaturationBrightness1;
	    float _g_fl_AutoPad15_;
	    vec3 g_vColorTint1;
	    int g_nTextureColorTintMode1;
	    bool g_bMaskColorTint1;
	    bool g_bMaskVertexColorTint1;
	    float g_fVertexColorStrength1;
	    float _g_fl_AutoPad16_;
	    mat4 g_mTextureColorTint;
	    mat4 g_mAlbedoColorCorrect;
	    uint g_tColor2;
	    uint g_tMask2;
	    uint g_tNormalRoughness2;
	    float _g_fl_AutoPad17_;
	    vec3 g_vEmissiveTint2;
	    float g_flEmissiveLevel2;
	    float g_flLayer2Offset;
	    float g_flParallaxViewAngleLimit2;
	    bool g_bLayer2UseSecondaryUV;
	    float g_bLayer2ShadingBlendStrength;
	    vec3 g_vAlbedoContrastSaturationBrightness2;
	    float _g_fl_AutoPad18_;
	    vec3 g_vColorTint2;
	    int g_nTextureColorTintMode2;
	    bool g_bMaskColorTint2;
	    bool g_bMaskVertexColorTint2;
	    float g_fVertexColorStrength2;
	    float _g_fl_AutoPad19_;
	    mat4 g_mTextureColorTint2;
	    mat4 g_mAlbedoColorCorrect2;
	    uint g_tReflectionOcclusionMask;
	    float g_flReflectionOcclusionOffset;
	    float g_flReflectionOcclusionViewAngleLimit;
	    bool g_bReflectionOcclusionUseSecondaryUV;
	    uint g_tColor3;
	    float _g_fl_AutoPad20_;
	    float _g_fl_AutoPad21_;
	    float _g_fl_AutoPad22_;
	    vec3 g_vEmissiveTint3;
	    float g_flEmissiveLevel3;
	    float g_flLayer3Offset;
	    float g_flParallaxViewAngleLimit3;
	    bool g_bLayer3UseSecondaryUV;
	    float _g_fl_AutoPad23_;
	    vec3 g_vAlbedoContrastSaturationBrightness3;
	    float _g_fl_AutoPad24_;
	    vec3 g_vColorTint3;
	    int g_nTextureColorTintMode3;
	    bool g_bMaskColorTint3;
	    bool g_bMaskVertexColorTint3;
	    float g_fVertexColorStrength3;
	    float _g_fl_AutoPad25_;
	    mat4 g_mTextureColorTint3;
	    mat4 g_mAlbedoColorCorrect3;
	    int g_nWorldOverlayTintMask1;
	    bool g_bWorldOverlayUseTintMask1;
	    bool g_bWorldOverlayTintMaskInvert1;
	    float g_flWorldOverlayStrength1;
	    uint g_tColorWorldOverlay;
	    float g_flWorldOverlayDarknessContrast;
	    float g_flWorldOverlayBrightnessContrast;
	    float g_flWorldOverlayTiling;
	    bool g_bOverrideBloomAmount;
	    float g_flOverrideBloomAmount1;
	    float _g_fl_AutoPad26_;
	    float _g_fl_AutoPad27_;
	};
	
	struct VS_INPUT
	{
	    vec3 vPositionOs;
	    vec2 vTexCoord;
	    vec2 vTexcoord3;
	    vec3 vNormalOs;
	    vec4 vTangentUOs_flTangentVSign;
	    vec4 vBlendColorTint;
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
	
	vec4 _829;
	
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
	    float _member0[];
	} g_MaterialData_3;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_4
	{
	    int _member0[];
	} g_MaterialData_5;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_6
	{
	    int _member0[];
	} g_MaterialData_7;
	
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
	    uint _852 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    _RTX_MATERIAL_DATA_ _2332 = _RTX_MATERIAL_DATA_(g_MaterialData_1._member0[_852 / 4u], g_MaterialData_1._member0[(_852 + 4u) / 4u], g_MaterialData_1._member0[(_852 + 8u) / 4u], g_MaterialData_1._member0[(_852 + 12u) / 4u], g_MaterialData_1._member0[(_852 + 16u) / 4u], g_MaterialData_1._member0[(_852 + 20u) / 4u], g_MaterialData_1._member0[(_852 + 24u) / 4u], g_MaterialData_1._member0[(_852 + 28u) / 4u], g_MaterialData_1._member0[(_852 + 32u) / 4u], g_MaterialData_1._member0[(_852 + 36u) / 4u], g_MaterialData_3._member0[(_852 + 40u) / 4u], g_MaterialData_3._member0[(_852 + 44u) / 4u], vec4(g_MaterialData_3._member0[(_852 + 48u) / 4u], g_MaterialData_3._member0[(_852 + 52u) / 4u], g_MaterialData_3._member0[(_852 + 56u) / 4u], g_MaterialData_3._member0[(_852 + 60u) / 4u]), mat4(vec4(g_MaterialData_3._member0[(_852 + 64u) / 4u], g_MaterialData_3._member0[(_852 + 80u) / 4u], g_MaterialData_3._member0[(_852 + 96u) / 4u], g_MaterialData_3._member0[(_852 + 112u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 68u) / 4u], g_MaterialData_3._member0[(_852 + 84u) / 4u], g_MaterialData_3._member0[(_852 + 100u) / 4u], g_MaterialData_3._member0[(_852 + 116u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 72u) / 4u], g_MaterialData_3._member0[(_852 + 88u) / 4u], g_MaterialData_3._member0[(_852 + 104u) / 4u], g_MaterialData_3._member0[(_852 + 120u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 76u) / 4u], g_MaterialData_3._member0[(_852 + 92u) / 4u], g_MaterialData_3._member0[(_852 + 108u) / 4u], g_MaterialData_3._member0[(_852 + 124u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_852 + 128u) / 4u], g_MaterialData_3._member0[(_852 + 144u) / 4u], g_MaterialData_3._member0[(_852 + 160u) / 4u], g_MaterialData_3._member0[(_852 + 176u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 132u) / 4u], g_MaterialData_3._member0[(_852 + 148u) / 4u], g_MaterialData_3._member0[(_852 + 164u) / 4u], g_MaterialData_3._member0[(_852 + 180u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 136u) / 4u], g_MaterialData_3._member0[(_852 + 152u) / 4u], g_MaterialData_3._member0[(_852 + 168u) / 4u], g_MaterialData_3._member0[(_852 + 184u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 140u) / 4u], g_MaterialData_3._member0[(_852 + 156u) / 4u], g_MaterialData_3._member0[(_852 + 172u) / 4u], g_MaterialData_3._member0[(_852 + 188u) / 4u])), vec4(g_MaterialData_3._member0[(_852 + 192u) / 4u], g_MaterialData_3._member0[(_852 + 196u) / 4u], g_MaterialData_3._member0[(_852 + 200u) / 4u], g_MaterialData_3._member0[(_852 + 204u) / 4u]), vec3(g_MaterialData_3._member0[(_852 + 208u) / 4u], g_MaterialData_3._member0[(_852 + 212u) / 4u], g_MaterialData_3._member0[(_852 + 216u) / 4u]), g_MaterialData_3._member0[(_852 + 220u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 224u) / 4u], g_MaterialData_3._member0[(_852 + 228u) / 4u], g_MaterialData_3._member0[(_852 + 232u) / 4u]), g_MaterialData_3._member0[(_852 + 236u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 240u) / 4u], g_MaterialData_3._member0[(_852 + 244u) / 4u], g_MaterialData_3._member0[(_852 + 248u) / 4u]), g_MaterialData_3._member0[(_852 + 252u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 256u) / 4u], g_MaterialData_3._member0[(_852 + 260u) / 4u], g_MaterialData_3._member0[(_852 + 264u) / 4u]), g_MaterialData_3._member0[(_852 + 268u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 272u) / 4u], g_MaterialData_3._member0[(_852 + 276u) / 4u], g_MaterialData_3._member0[(_852 + 280u) / 4u]), g_MaterialData_3._member0[(_852 + 284u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 288u) / 4u], g_MaterialData_3._member0[(_852 + 292u) / 4u], g_MaterialData_3._member0[(_852 + 296u) / 4u]), g_MaterialData_3._member0[(_852 + 300u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 304u) / 4u], g_MaterialData_3._member0[(_852 + 308u) / 4u], g_MaterialData_3._member0[(_852 + 312u) / 4u]), g_MaterialData_3._member0[(_852 + 316u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 320u) / 4u], g_MaterialData_3._member0[(_852 + 324u) / 4u], g_MaterialData_3._member0[(_852 + 328u) / 4u]), g_MaterialData_3._member0[(_852 + 332u) / 4u], g_MaterialData_3._member0[(_852 + 336u) / 4u], g_MaterialData_3._member0[(_852 + 340u) / 4u], g_MaterialData_3._member0[(_852 + 344u) / 4u], g_MaterialData_3._member0[(_852 + 348u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 352u) / 4u], g_MaterialData_3._member0[(_852 + 356u) / 4u], g_MaterialData_3._member0[(_852 + 360u) / 4u]), g_MaterialData_5._member0[(_852 + 364u) / 4u] != 0, g_MaterialData_5._member0[(_852 + 368u) / 4u] != 0, g_MaterialData_1._member0[(_852 + 372u) / 4u], g_MaterialData_7._member0[(_852 + 376u) / 4u], g_MaterialData_7._member0[(_852 + 380u) / 4u], g_MaterialData_5._member0[(_852 + 384u) / 4u] != 0, g_MaterialData_7._member0[(_852 + 388u) / 4u], g_MaterialData_7._member0[(_852 + 392u) / 4u], g_MaterialData_3._member0[(_852 + 396u) / 4u], vec4(g_MaterialData_3._member0[(_852 + 400u) / 4u], g_MaterialData_3._member0[(_852 + 404u) / 4u], g_MaterialData_3._member0[(_852 + 408u) / 4u], g_MaterialData_3._member0[(_852 + 412u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 416u) / 4u], g_MaterialData_3._member0[(_852 + 420u) / 4u], g_MaterialData_3._member0[(_852 + 424u) / 4u], g_MaterialData_3._member0[(_852 + 428u) / 4u]), vec2(g_MaterialData_3._member0[(_852 + 432u) / 4u], g_MaterialData_3._member0[(_852 + 436u) / 4u]), g_MaterialData_7._member0[(_852 + 440u) / 4u], g_MaterialData_7._member0[(_852 + 444u) / 4u], g_MaterialData_7._member0[(_852 + 448u) / 4u], g_MaterialData_7._member0[(_852 + 452u) / 4u], g_MaterialData_5._member0[(_852 + 456u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 460u) / 4u], vec4(g_MaterialData_3._member0[(_852 + 464u) / 4u], g_MaterialData_3._member0[(_852 + 468u) / 4u], g_MaterialData_3._member0[(_852 + 472u) / 4u], g_MaterialData_3._member0[(_852 + 476u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 480u) / 4u], g_MaterialData_3._member0[(_852 + 484u) / 4u], g_MaterialData_3._member0[(_852 + 488u) / 4u], g_MaterialData_3._member0[(_852 + 492u) / 4u]), vec2(g_MaterialData_3._member0[(_852 + 496u) / 4u], g_MaterialData_3._member0[(_852 + 500u) / 4u]), g_MaterialData_1._member0[(_852 + 504u) / 4u], g_MaterialData_1._member0[(_852 + 508u) / 4u], g_MaterialData_1._member0[(_852 + 512u) / 4u], g_MaterialData_3._member0[(_852 + 516u) / 4u], g_MaterialData_3._member0[(_852 + 520u) / 4u], g_MaterialData_3._member0[(_852 + 524u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 528u) / 4u], g_MaterialData_3._member0[(_852 + 532u) / 4u], g_MaterialData_3._member0[(_852 + 536u) / 4u]), g_MaterialData_3._member0[(_852 + 540u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 544u) / 4u], g_MaterialData_3._member0[(_852 + 548u) / 4u], g_MaterialData_3._member0[(_852 + 552u) / 4u]), g_MaterialData_7._member0[(_852 + 556u) / 4u], g_MaterialData_5._member0[(_852 + 560u) / 4u] != 0, g_MaterialData_5._member0[(_852 + 564u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 568u) / 4u], g_MaterialData_3._member0[(_852 + 572u) / 4u], mat4(vec4(g_MaterialData_3._member0[(_852 + 576u) / 4u], g_MaterialData_3._member0[(_852 + 592u) / 4u], g_MaterialData_3._member0[(_852 + 608u) / 4u], g_MaterialData_3._member0[(_852 + 624u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 580u) / 4u], g_MaterialData_3._member0[(_852 + 596u) / 4u], g_MaterialData_3._member0[(_852 + 612u) / 4u], g_MaterialData_3._member0[(_852 + 628u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 584u) / 4u], g_MaterialData_3._member0[(_852 + 600u) / 4u], g_MaterialData_3._member0[(_852 + 616u) / 4u], g_MaterialData_3._member0[(_852 + 632u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 588u) / 4u], g_MaterialData_3._member0[(_852 + 604u) / 4u], g_MaterialData_3._member0[(_852 + 620u) / 4u], g_MaterialData_3._member0[(_852 + 636u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_852 + 640u) / 4u], g_MaterialData_3._member0[(_852 + 656u) / 4u], g_MaterialData_3._member0[(_852 + 672u) / 4u], g_MaterialData_3._member0[(_852 + 688u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 644u) / 4u], g_MaterialData_3._member0[(_852 + 660u) / 4u], g_MaterialData_3._member0[(_852 + 676u) / 4u], g_MaterialData_3._member0[(_852 + 692u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 648u) / 4u], g_MaterialData_3._member0[(_852 + 664u) / 4u], g_MaterialData_3._member0[(_852 + 680u) / 4u], g_MaterialData_3._member0[(_852 + 696u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 652u) / 4u], g_MaterialData_3._member0[(_852 + 668u) / 4u], g_MaterialData_3._member0[(_852 + 684u) / 4u], g_MaterialData_3._member0[(_852 + 700u) / 4u])), g_MaterialData_1._member0[(_852 + 704u) / 4u], g_MaterialData_1._member0[(_852 + 708u) / 4u], g_MaterialData_1._member0[(_852 + 712u) / 4u], g_MaterialData_3._member0[(_852 + 716u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 720u) / 4u], g_MaterialData_3._member0[(_852 + 724u) / 4u], g_MaterialData_3._member0[(_852 + 728u) / 4u]), g_MaterialData_3._member0[(_852 + 732u) / 4u], g_MaterialData_3._member0[(_852 + 736u) / 4u], g_MaterialData_3._member0[(_852 + 740u) / 4u], g_MaterialData_5._member0[(_852 + 744u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 748u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 752u) / 4u], g_MaterialData_3._member0[(_852 + 756u) / 4u], g_MaterialData_3._member0[(_852 + 760u) / 4u]), g_MaterialData_3._member0[(_852 + 764u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 768u) / 4u], g_MaterialData_3._member0[(_852 + 772u) / 4u], g_MaterialData_3._member0[(_852 + 776u) / 4u]), g_MaterialData_7._member0[(_852 + 780u) / 4u], g_MaterialData_5._member0[(_852 + 784u) / 4u] != 0, g_MaterialData_5._member0[(_852 + 788u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 792u) / 4u], g_MaterialData_3._member0[(_852 + 796u) / 4u], mat4(vec4(g_MaterialData_3._member0[(_852 + 800u) / 4u], g_MaterialData_3._member0[(_852 + 816u) / 4u], g_MaterialData_3._member0[(_852 + 832u) / 4u], g_MaterialData_3._member0[(_852 + 848u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 804u) / 4u], g_MaterialData_3._member0[(_852 + 820u) / 4u], g_MaterialData_3._member0[(_852 + 836u) / 4u], g_MaterialData_3._member0[(_852 + 852u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 808u) / 4u], g_MaterialData_3._member0[(_852 + 824u) / 4u], g_MaterialData_3._member0[(_852 + 840u) / 4u], g_MaterialData_3._member0[(_852 + 856u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 812u) / 4u], g_MaterialData_3._member0[(_852 + 828u) / 4u], g_MaterialData_3._member0[(_852 + 844u) / 4u], g_MaterialData_3._member0[(_852 + 860u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_852 + 864u) / 4u], g_MaterialData_3._member0[(_852 + 880u) / 4u], g_MaterialData_3._member0[(_852 + 896u) / 4u], g_MaterialData_3._member0[(_852 + 912u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 868u) / 4u], g_MaterialData_3._member0[(_852 + 884u) / 4u], g_MaterialData_3._member0[(_852 + 900u) / 4u], g_MaterialData_3._member0[(_852 + 916u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 872u) / 4u], g_MaterialData_3._member0[(_852 + 888u) / 4u], g_MaterialData_3._member0[(_852 + 904u) / 4u], g_MaterialData_3._member0[(_852 + 920u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 876u) / 4u], g_MaterialData_3._member0[(_852 + 892u) / 4u], g_MaterialData_3._member0[(_852 + 908u) / 4u], g_MaterialData_3._member0[(_852 + 924u) / 4u])), g_MaterialData_1._member0[(_852 + 928u) / 4u], g_MaterialData_3._member0[(_852 + 932u) / 4u], g_MaterialData_3._member0[(_852 + 936u) / 4u], g_MaterialData_5._member0[(_852 + 940u) / 4u] != 0, g_MaterialData_1._member0[(_852 + 944u) / 4u], g_MaterialData_3._member0[(_852 + 948u) / 4u], g_MaterialData_3._member0[(_852 + 952u) / 4u], g_MaterialData_3._member0[(_852 + 956u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 960u) / 4u], g_MaterialData_3._member0[(_852 + 964u) / 4u], g_MaterialData_3._member0[(_852 + 968u) / 4u]), g_MaterialData_3._member0[(_852 + 972u) / 4u], g_MaterialData_3._member0[(_852 + 976u) / 4u], g_MaterialData_3._member0[(_852 + 980u) / 4u], g_MaterialData_5._member0[(_852 + 984u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 988u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 992u) / 4u], g_MaterialData_3._member0[(_852 + 996u) / 4u], g_MaterialData_3._member0[(_852 + 1000u) / 4u]), g_MaterialData_3._member0[(_852 + 1004u) / 4u], vec3(g_MaterialData_3._member0[(_852 + 1008u) / 4u], g_MaterialData_3._member0[(_852 + 1012u) / 4u], g_MaterialData_3._member0[(_852 + 1016u) / 4u]), g_MaterialData_7._member0[(_852 + 1020u) / 4u], g_MaterialData_5._member0[(_852 + 1024u) / 4u] != 0, g_MaterialData_5._member0[(_852 + 1028u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 1032u) / 4u], g_MaterialData_3._member0[(_852 + 1036u) / 4u], mat4(vec4(g_MaterialData_3._member0[(_852 + 1040u) / 4u], g_MaterialData_3._member0[(_852 + 1056u) / 4u], g_MaterialData_3._member0[(_852 + 1072u) / 4u], g_MaterialData_3._member0[(_852 + 1088u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1044u) / 4u], g_MaterialData_3._member0[(_852 + 1060u) / 4u], g_MaterialData_3._member0[(_852 + 1076u) / 4u], g_MaterialData_3._member0[(_852 + 1092u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1048u) / 4u], g_MaterialData_3._member0[(_852 + 1064u) / 4u], g_MaterialData_3._member0[(_852 + 1080u) / 4u], g_MaterialData_3._member0[(_852 + 1096u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1052u) / 4u], g_MaterialData_3._member0[(_852 + 1068u) / 4u], g_MaterialData_3._member0[(_852 + 1084u) / 4u], g_MaterialData_3._member0[(_852 + 1100u) / 4u])), mat4(vec4(g_MaterialData_3._member0[(_852 + 1104u) / 4u], g_MaterialData_3._member0[(_852 + 1120u) / 4u], g_MaterialData_3._member0[(_852 + 1136u) / 4u], g_MaterialData_3._member0[(_852 + 1152u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1108u) / 4u], g_MaterialData_3._member0[(_852 + 1124u) / 4u], g_MaterialData_3._member0[(_852 + 1140u) / 4u], g_MaterialData_3._member0[(_852 + 1156u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1112u) / 4u], g_MaterialData_3._member0[(_852 + 1128u) / 4u], g_MaterialData_3._member0[(_852 + 1144u) / 4u], g_MaterialData_3._member0[(_852 + 1160u) / 4u]), vec4(g_MaterialData_3._member0[(_852 + 1116u) / 4u], g_MaterialData_3._member0[(_852 + 1132u) / 4u], g_MaterialData_3._member0[(_852 + 1148u) / 4u], g_MaterialData_3._member0[(_852 + 1164u) / 4u])), g_MaterialData_7._member0[(_852 + 1168u) / 4u], g_MaterialData_5._member0[(_852 + 1172u) / 4u] != 0, g_MaterialData_5._member0[(_852 + 1176u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 1180u) / 4u], g_MaterialData_1._member0[(_852 + 1184u) / 4u], g_MaterialData_3._member0[(_852 + 1188u) / 4u], g_MaterialData_3._member0[(_852 + 1192u) / 4u], g_MaterialData_3._member0[(_852 + 1196u) / 4u], g_MaterialData_5._member0[(_852 + 1200u) / 4u] != 0, g_MaterialData_3._member0[(_852 + 1204u) / 4u], g_MaterialData_3._member0[(_852 + 1208u) / 4u], g_MaterialData_3._member0[(_852 + 1212u) / 4u]);
	    _RTX_MATERIAL_DATA_ _g_rtx_material_data_ = _2332;
	    uvec3 _1019;
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _2374 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _1019 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_2374 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_2374 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_2374 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _2353 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _2354 = _2353 & 4294967292u;
	            uint _57 = _2354 / 4u;
	            uint _60 = (_2354 + 4u) / 4u;
	            uint _2358 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 4294901760u) >> uint(16);
	            uint _2359 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_60] & 65535u;
	            uvec3 _1020;
	            if (_2353 == _2354)
	            {
	                _1020 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 65535u, _2358, _2359);
	            }
	            else
	            {
	                _1020 = uvec3(_2358, _2359, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_60] & 4294901760u) >> uint(16));
	            }
	            _1019 = _1020;
	            break;
	        }
	        break;
	    } while(false);
	    uint _73 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _2395 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _1019) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    vec3 _1021[3];
	    uint _2397 = _2395.x;
	    _1021[0] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_2397 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2397 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2397 + 8u) / 4u]);
	    uint _2402 = _2395.y;
	    _1021[1] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_2402 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2402 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2402 + 8u) / 4u]);
	    uint _2407 = _2395.z;
	    _1021[2] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_2407 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2407 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_2407 + 8u) / 4u]);
	    int _1022 = 0;
	    VS_INPUT _1027[3];
	    for (;;)
	    {
	        if (!(_1022 < 3))
	        {
	            break;
	        }
	        _1027[_1022].vPositionOs = _1021[_1022];
	        _1022++;
	        continue;
	    }
	    vec2 _1023[3];
	    _1023[0] = vec2(0.0);
	    _1023[1] = vec2(0.0);
	    _1023[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	    {
	        ivec4 _1018 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _102 = uint(_1018[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	        uint _2449 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	        ivec4 _1016 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1017 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _2465 = (uvec3(uint(_1016[_2449])) * _1019) + uvec3(uint(_1017[_2449]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	        {
	            uint _2579 = _2465.x;
	            _1023[0] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_2579 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_2579 + 4u) / 4u]);
	            uint _2582 = _2465.y;
	            _1023[1] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_2582 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_2582 + 4u) / 4u]);
	            uint _2585 = _2465.z;
	            _1023[2] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_2585 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_2585 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	            {
	                uint _114 = _2465.x / 4u;
	                _1023[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_114], g_Vertices_3[nonuniformEXT(_102)]._member0[_114] >> uint(16)) & uvec2(65535u))));
	                uint _117 = _2465.y / 4u;
	                _1023[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_117], g_Vertices_3[nonuniformEXT(_102)]._member0[_117] >> uint(16)) & uvec2(65535u))));
	                uint _120 = _2465.z / 4u;
	                _1023[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_120], g_Vertices_3[nonuniformEXT(_102)]._member0[_120] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                {
	                    uint _104 = _2465.x / 4u;
	                    uint _2478 = g_Vertices_3[nonuniformEXT(_102)]._member0[_104] & 65535u;
	                    int _1015;
	                    if (_2478 > 32767u)
	                    {
	                        _1015 = int(4294901760u | _2478);
	                    }
	                    else
	                    {
	                        _1015 = int(_2478);
	                    }
	                    uint _2491 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_104] & 4294901760u) >> uint(16);
	                    int _1014;
	                    if (_2491 > 32767u)
	                    {
	                        _1014 = int(4294901760u | _2491);
	                    }
	                    else
	                    {
	                        _1014 = int(_2491);
	                    }
	                    _1023[0] = vec2(max(float(_1015) * 3.0518509447574615478515625e-05, -1.0), max(float(_1014) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _107 = _2465.y / 4u;
	                    uint _2505 = g_Vertices_3[nonuniformEXT(_102)]._member0[_107] & 65535u;
	                    int _1013;
	                    if (_2505 > 32767u)
	                    {
	                        _1013 = int(4294901760u | _2505);
	                    }
	                    else
	                    {
	                        _1013 = int(_2505);
	                    }
	                    uint _2518 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_107] & 4294901760u) >> uint(16);
	                    int _1012;
	                    if (_2518 > 32767u)
	                    {
	                        _1012 = int(4294901760u | _2518);
	                    }
	                    else
	                    {
	                        _1012 = int(_2518);
	                    }
	                    _1023[1] = vec2(max(float(_1013) * 3.0518509447574615478515625e-05, -1.0), max(float(_1012) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _110 = _2465.z / 4u;
	                    uint _2532 = g_Vertices_3[nonuniformEXT(_102)]._member0[_110] & 65535u;
	                    int _1011;
	                    if (_2532 > 32767u)
	                    {
	                        _1011 = int(4294901760u | _2532);
	                    }
	                    else
	                    {
	                        _1011 = int(_2532);
	                    }
	                    uint _2545 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_110] & 4294901760u) >> uint(16);
	                    int _1010;
	                    if (_2545 > 32767u)
	                    {
	                        _1010 = int(4294901760u | _2545);
	                    }
	                    else
	                    {
	                        _1010 = int(_2545);
	                    }
	                    _1023[2] = vec2(max(float(_1011) * 3.0518509447574615478515625e-05, -1.0), max(float(_1010) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _1022 = 0;
	    for (;;)
	    {
	        if (!(_1022 < 3))
	        {
	            break;
	        }
	        _1027[_1022].vTexCoord = _1023[_1022];
	        _1022++;
	        continue;
	    }
	    _1023[0] = vec2(0.0);
	    _1023[1] = vec2(0.0);
	    _1023[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y != 0)
	    {
	        ivec4 _1009 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _142 = uint(_1009[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].z]);
	        uint _2624 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].z);
	        ivec4 _1007 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1008 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _2640 = (uvec3(uint(_1007[_2624])) * _1019) + uvec3(uint(_1008[_2624]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 16)
	        {
	            uint _2754 = _2640.x;
	            _1023[0] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_2754 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_2754 + 4u) / 4u]);
	            uint _2757 = _2640.y;
	            _1023[1] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_2757 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_2757 + 4u) / 4u]);
	            uint _2760 = _2640.z;
	            _1023[2] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_2760 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_2760 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 34)
	            {
	                uint _154 = _2640.x / 4u;
	                _1023[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_154], g_Vertices_3[nonuniformEXT(_142)]._member0[_154] >> uint(16)) & uvec2(65535u))));
	                uint _157 = _2640.y / 4u;
	                _1023[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_157], g_Vertices_3[nonuniformEXT(_142)]._member0[_157] >> uint(16)) & uvec2(65535u))));
	                uint _160 = _2640.z / 4u;
	                _1023[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_160], g_Vertices_3[nonuniformEXT(_142)]._member0[_160] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 37)
	                {
	                    uint _144 = _2640.x / 4u;
	                    uint _2653 = g_Vertices_3[nonuniformEXT(_142)]._member0[_144] & 65535u;
	                    int _1006;
	                    if (_2653 > 32767u)
	                    {
	                        _1006 = int(4294901760u | _2653);
	                    }
	                    else
	                    {
	                        _1006 = int(_2653);
	                    }
	                    uint _2666 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_144] & 4294901760u) >> uint(16);
	                    int _1005;
	                    if (_2666 > 32767u)
	                    {
	                        _1005 = int(4294901760u | _2666);
	                    }
	                    else
	                    {
	                        _1005 = int(_2666);
	                    }
	                    _1023[0] = vec2(max(float(_1006) * 3.0518509447574615478515625e-05, -1.0), max(float(_1005) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _147 = _2640.y / 4u;
	                    uint _2680 = g_Vertices_3[nonuniformEXT(_142)]._member0[_147] & 65535u;
	                    int _1004;
	                    if (_2680 > 32767u)
	                    {
	                        _1004 = int(4294901760u | _2680);
	                    }
	                    else
	                    {
	                        _1004 = int(_2680);
	                    }
	                    uint _2693 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_147] & 4294901760u) >> uint(16);
	                    int _1003;
	                    if (_2693 > 32767u)
	                    {
	                        _1003 = int(4294901760u | _2693);
	                    }
	                    else
	                    {
	                        _1003 = int(_2693);
	                    }
	                    _1023[1] = vec2(max(float(_1004) * 3.0518509447574615478515625e-05, -1.0), max(float(_1003) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _150 = _2640.z / 4u;
	                    uint _2707 = g_Vertices_3[nonuniformEXT(_142)]._member0[_150] & 65535u;
	                    int _1002;
	                    if (_2707 > 32767u)
	                    {
	                        _1002 = int(4294901760u | _2707);
	                    }
	                    else
	                    {
	                        _1002 = int(_2707);
	                    }
	                    uint _2720 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_150] & 4294901760u) >> uint(16);
	                    int _1001;
	                    if (_2720 > 32767u)
	                    {
	                        _1001 = int(4294901760u | _2720);
	                    }
	                    else
	                    {
	                        _1001 = int(_2720);
	                    }
	                    _1023[2] = vec2(max(float(_1002) * 3.0518509447574615478515625e-05, -1.0), max(float(_1001) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _1022 = 0;
	    for (;;)
	    {
	        if (!(_1022 < 3))
	        {
	            break;
	        }
	        _1027[_1022].vTexcoord3 = _1023[_1022];
	        _1022++;
	        continue;
	    }
	    vec3 _1024[3];
	    vec4 _1025[3];
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	        {
	            ivec4 _987 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _182 = uint(_987[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	            uint _2804 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	            ivec4 _985 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _986 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _2820 = (uvec3(uint(_985[_2804])) * _1019) + uvec3(uint(_986[_2804]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	            {
	                uint _3321 = _2820.x;
	                _1024[0] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_3321 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3321 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3321 + 8u) / 4u]);
	                uint _3326 = _2820.y;
	                _1024[1] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_3326 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3326 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3326 + 8u) / 4u]);
	                uint _3331 = _2820.z;
	                _1024[2] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_3331 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3331 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_3331 + 8u) / 4u]);
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	                {
	                    uint _3075 = _2820.x;
	                    uvec2 _3077 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3075 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3075 + 4u) / 4u]);
	                    uint _3078 = _2820.y;
	                    uvec2 _847 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3078 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3078 + 4u) / 4u]);
	                    uint _3081 = _2820.z;
	                    uvec2 _846 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3081 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3081 + 4u) / 4u]);
	                    uint _3087 = _3077.x;
	                    uint _3095 = _3077.y;
	                    vec2 _3105 = ((vec2(float(_3087 & 65535u), float((_3087 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _3106 = _3105.x;
	                    float _3111 = (1.0 - abs(_3106)) - abs(_3105.y);
	                    vec3 _3112 = vec3(_3106, _3105.y, _3111);
	                    float _3114 = saturate(-_3111);
	                    vec2 _3120 = _3105 + mix(vec2(_3114), vec2(-_3114), greaterThanEqual(_3105, vec2(0.0)));
	                    _3112.x = _3120.x;
	                    _3112.y = _3120.y;
	                    vec3 _989 = normalize(_3112);
	                    vec2 _3127 = ((vec2(float((_3095 >> uint(1)) & 32767u), float((_3095 >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _3128 = _3127.x;
	                    float _3133 = (1.0 - abs(_3128)) - abs(_3127.y);
	                    vec3 _3134 = vec3(_3128, _3127.y, _3133);
	                    float _3136 = saturate(-_3133);
	                    vec2 _3142 = _3127 + mix(vec2(_3136), vec2(-_3136), greaterThanEqual(_3127, vec2(0.0)));
	                    _3134.x = _3142.x;
	                    _3134.y = _3142.y;
	                    vec3 _988 = normalize(_3134);
	                    float _975;
	                    if ((_3095 & 1u) != 0u)
	                    {
	                        _975 = 1.0;
	                    }
	                    else
	                    {
	                        _975 = -1.0;
	                    }
	                    _1024[0] = _989;
	                    _1025[0].w = _975;
	                    _1025[0].x = _988.x;
	                    _1025[0].y = _988.y;
	                    _1025[0].z = _988.z;
	                    vec2 _3184 = ((vec2(float(_847.x & 65535u), float((_847.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _3185 = _3184.x;
	                    float _3190 = (1.0 - abs(_3185)) - abs(_3184.y);
	                    vec3 _3191 = vec3(_3185, _3184.y, _3190);
	                    float _3193 = saturate(-_3190);
	                    vec2 _3199 = _3184 + mix(vec2(_3193), vec2(-_3193), greaterThanEqual(_3184, vec2(0.0)));
	                    _3191.x = _3199.x;
	                    _3191.y = _3199.y;
	                    vec3 _991 = normalize(_3191);
	                    vec2 _3206 = ((vec2(float((_847.y >> uint(1)) & 32767u), float((_847.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _3207 = _3206.x;
	                    float _3212 = (1.0 - abs(_3207)) - abs(_3206.y);
	                    vec3 _3213 = vec3(_3207, _3206.y, _3212);
	                    float _3215 = saturate(-_3212);
	                    vec2 _3221 = _3206 + mix(vec2(_3215), vec2(-_3215), greaterThanEqual(_3206, vec2(0.0)));
	                    _3213.x = _3221.x;
	                    _3213.y = _3221.y;
	                    vec3 _990 = normalize(_3213);
	                    float _974;
	                    if ((_847.y & 1u) != 0u)
	                    {
	                        _974 = 1.0;
	                    }
	                    else
	                    {
	                        _974 = -1.0;
	                    }
	                    _1024[1] = _991;
	                    _1025[1].w = _974;
	                    _1025[1].x = _990.x;
	                    _1025[1].y = _990.y;
	                    _1025[1].z = _990.z;
	                    vec2 _3263 = ((vec2(float(_846.x & 65535u), float((_846.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _3264 = _3263.x;
	                    float _3269 = (1.0 - abs(_3264)) - abs(_3263.y);
	                    vec3 _3270 = vec3(_3264, _3263.y, _3269);
	                    float _3272 = saturate(-_3269);
	                    vec2 _3278 = _3263 + mix(vec2(_3272), vec2(-_3272), greaterThanEqual(_3263, vec2(0.0)));
	                    _3270.x = _3278.x;
	                    _3270.y = _3278.y;
	                    vec3 _993 = normalize(_3270);
	                    vec2 _3285 = ((vec2(float((_846.y >> uint(1)) & 32767u), float((_846.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _3286 = _3285.x;
	                    float _3291 = (1.0 - abs(_3286)) - abs(_3285.y);
	                    vec3 _3292 = vec3(_3286, _3285.y, _3291);
	                    float _3294 = saturate(-_3291);
	                    vec2 _3300 = _3285 + mix(vec2(_3294), vec2(-_3294), greaterThanEqual(_3285, vec2(0.0)));
	                    _3292.x = _3300.x;
	                    _3292.y = _3300.y;
	                    vec3 _992 = normalize(_3292);
	                    float _973;
	                    if ((_846.y & 1u) != 0u)
	                    {
	                        _973 = 1.0;
	                    }
	                    else
	                    {
	                        _973 = -1.0;
	                    }
	                    _1024[2] = _993;
	                    _1025[2].w = _973;
	                    _1025[2].x = _992.x;
	                    _1025[2].y = _992.y;
	                    _1025[2].z = _992.z;
	                    break;
	                }
	                else
	                {
	                    uint _184 = _2820.x / 4u;
	                    vec4 _995 = _1025[0];
	                    float _2842 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _2845 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _2849 = (1.0 - abs(_2842)) - abs(_2845);
	                    vec3 _2850 = vec3(_2842, _2845, _2849);
	                    float _2852 = saturate(-_2849);
	                    vec2 _2853 = vec2(_2842, _2845);
	                    vec2 _2859 = _2853 + mix(vec2(_2852), vec2(-_2852), greaterThanEqual(_2853, vec2(0.0)));
	                    _2850.x = _2859.x;
	                    _2850.y = _2859.y;
	                    vec3 _2864 = normalize(_2850);
	                    vec3 _994 = _2864;
	                    float _2865 = _2864.z;
	                    float _982;
	                    if (_2865 >= 0.0)
	                    {
	                        _982 = 1.0;
	                    }
	                    else
	                    {
	                        _982 = -1.0;
	                    }
	                    float _2872 = (-1.0) / (_982 + _2865);
	                    float _2873 = _2864.x;
	                    vec3 _983;
	                    vec3 _2881 = _983;
	                    _2881.x = 1.0 + (((_982 * _2873) * _2873) * _2872);
	                    _2881.y = _982 * ((_2873 * _2864.y) * _2872);
	                    _2881.z = (-_982) * _2873;
	                    _983 = _2881;
	                    float _2889 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _2895 = (_2881 * cos(_2889)) + (cross(_2864, _2881) * sin(_2889));
	                    vec4 _2897 = _995;
	                    _2897.x = _2895.x;
	                    _2897.y = _2895.y;
	                    _2897.z = _2895.z;
	                    _995 = _2897;
	                    float _984;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] & 1u) == 0u)
	                    {
	                        _984 = -1.0;
	                    }
	                    else
	                    {
	                        _984 = 1.0;
	                    }
	                    vec4 _2908 = _995;
	                    _2908.w = _984;
	                    _995 = _2908;
	                    _1024[0] = _994;
	                    _1025[0] = _2908;
	                    uint _187 = _2820.y / 4u;
	                    vec4 _997 = _1025[1];
	                    float _2924 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _2927 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _2931 = (1.0 - abs(_2924)) - abs(_2927);
	                    vec3 _2932 = vec3(_2924, _2927, _2931);
	                    float _2934 = saturate(-_2931);
	                    vec2 _2935 = vec2(_2924, _2927);
	                    vec2 _2941 = _2935 + mix(vec2(_2934), vec2(-_2934), greaterThanEqual(_2935, vec2(0.0)));
	                    _2932.x = _2941.x;
	                    _2932.y = _2941.y;
	                    vec3 _2946 = normalize(_2932);
	                    vec3 _996 = _2946;
	                    float _2947 = _2946.z;
	                    float _979;
	                    if (_2947 >= 0.0)
	                    {
	                        _979 = 1.0;
	                    }
	                    else
	                    {
	                        _979 = -1.0;
	                    }
	                    float _2954 = (-1.0) / (_979 + _2947);
	                    float _2955 = _2946.x;
	                    vec3 _980;
	                    vec3 _2963 = _980;
	                    _2963.x = 1.0 + (((_979 * _2955) * _2955) * _2954);
	                    _2963.y = _979 * ((_2955 * _2946.y) * _2954);
	                    _2963.z = (-_979) * _2955;
	                    _980 = _2963;
	                    float _2971 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _2977 = (_2963 * cos(_2971)) + (cross(_2946, _2963) * sin(_2971));
	                    vec4 _2979 = _997;
	                    _2979.x = _2977.x;
	                    _2979.y = _2977.y;
	                    _2979.z = _2977.z;
	                    _997 = _2979;
	                    float _981;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] & 1u) == 0u)
	                    {
	                        _981 = -1.0;
	                    }
	                    else
	                    {
	                        _981 = 1.0;
	                    }
	                    vec4 _2990 = _997;
	                    _2990.w = _981;
	                    _997 = _2990;
	                    _1024[1] = _996;
	                    _1025[1] = _2990;
	                    uint _190 = _2820.z / 4u;
	                    vec4 _999 = _1025[2];
	                    float _3006 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3009 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3013 = (1.0 - abs(_3006)) - abs(_3009);
	                    vec3 _3014 = vec3(_3006, _3009, _3013);
	                    float _3016 = saturate(-_3013);
	                    vec2 _3017 = vec2(_3006, _3009);
	                    vec2 _3023 = _3017 + mix(vec2(_3016), vec2(-_3016), greaterThanEqual(_3017, vec2(0.0)));
	                    _3014.x = _3023.x;
	                    _3014.y = _3023.y;
	                    vec3 _3028 = normalize(_3014);
	                    vec3 _998 = _3028;
	                    float _3029 = _3028.z;
	                    float _976;
	                    if (_3029 >= 0.0)
	                    {
	                        _976 = 1.0;
	                    }
	                    else
	                    {
	                        _976 = -1.0;
	                    }
	                    float _3036 = (-1.0) / (_976 + _3029);
	                    float _3037 = _3028.x;
	                    vec3 _977;
	                    vec3 _3045 = _977;
	                    _3045.x = 1.0 + (((_976 * _3037) * _3037) * _3036);
	                    _3045.y = _976 * ((_3037 * _3028.y) * _3036);
	                    _3045.z = (-_976) * _3037;
	                    _977 = _3045;
	                    float _3053 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _3059 = (_3045 * cos(_3053)) + (cross(_3028, _3045) * sin(_3053));
	                    vec4 _3061 = _999;
	                    _3061.x = _3059.x;
	                    _3061.y = _3059.y;
	                    _3061.z = _3059.z;
	                    _999 = _3061;
	                    float _978;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] & 1u) == 0u)
	                    {
	                        _978 = -1.0;
	                    }
	                    else
	                    {
	                        _978 = 1.0;
	                    }
	                    vec4 _3072 = _999;
	                    _3072.w = _978;
	                    _999 = _3072;
	                    _1024[2] = _998;
	                    _1025[2] = _3072;
	                    break;
	                }
	                break;
	            }
	        }
	        else
	        {
	            _1024[0] = vec3(0.0);
	            _1024[1] = vec3(0.0);
	            _1024[2] = vec3(0.0);
	        }
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.y != 0)
	        {
	            ivec4 _1000 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _240 = uint(_1000[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z]);
	            uint _3350 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z);
	            ivec4 _971 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _972 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _3366 = (uvec3(uint(_971[_3350])) * _1019) + uvec3(uint(_972[_3350]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.x));
	            uint _3368 = _3366.x;
	            _1025[0] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_3368 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3368 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3368 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3368 + 12u) / 4u]);
	            uint _3374 = _3366.y;
	            _1025[1] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_3374 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3374 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3374 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3374 + 12u) / 4u]);
	            uint _3380 = _3366.z;
	            _1025[2] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_3380 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3380 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3380 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_3380 + 12u) / 4u]);
	        }
	        else
	        {
	            _1025[0] = vec4(0.0);
	            _1025[1] = vec4(0.0);
	            _1025[2] = vec4(0.0);
	        }
	        break;
	    } while(false);
	    _1022 = 0;
	    for (;;)
	    {
	        if (!(_1022 < 3))
	        {
	            break;
	        }
	        _1027[_1022].vNormalOs = _1024[_1022];
	        _1027[_1022].vTangentUOs_flTangentVSign = _1025[_1022];
	        _1022++;
	        continue;
	    }
	    vec4 _1026[3];
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y != 0)
	    {
	        ivec4 _970 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _278 = uint(_970[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z]);
	        uint _3427 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z);
	        ivec4 _968 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _969 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _3443 = (uvec3(uint(_968[_3427])) * _1019) + uvec3(uint(_969[_3427]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y == 2)
	        {
	            uint _3485 = _3443.x;
	            _1026[0] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_3485 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3485 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3485 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3485 + 12u) / 4u]);
	            uint _3491 = _3443.y;
	            _1026[1] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_3491 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3491 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3491 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3491 + 12u) / 4u]);
	            uint _3497 = _3443.z;
	            _1026[2] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_3497 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3497 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3497 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_3497 + 12u) / 4u]);
	        }
	        else
	        {
	            uint _280 = _3443.x / 4u;
	            _1026[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _283 = _3443.y / 4u;
	            _1026[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _286 = _3443.z / 4u;
	            _1026[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        }
	    }
	    else
	    {
	        _1026[0] = vec4(0.0);
	        _1026[1] = vec4(0.0);
	        _1026[2] = vec4(0.0);
	    }
	    _1022 = 0;
	    for (;;)
	    {
	        if (!(_1022 < 3))
	        {
	            break;
	        }
	        _1027[_1022].vBlendColorTint = _1026[_1022];
	        _1022++;
	        continue;
	    }
	    vec3 _883 = _1027[0].vPositionOs;
	    vec2 _882 = _1027[0].vTexCoord;
	    vec2 _881 = _1027[0].vTexcoord3;
	    vec3 _880 = _1027[0].vNormalOs;
	    vec4 _879 = _1027[0].vTangentUOs_flTangentVSign;
	    vec4 _878 = _1027[0].vBlendColorTint;
	    vec3 _888 = vec3(0.0);
	    vec4 _887 = vec4(0.0);
	    vec4 _886 = vec4(0.0);
	    vec4 _885 = vec4(0.0);
	    vec4 _884 = vec4(0.0);
	    mat3x4 _3530 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _3532 = transpose(gl_WorldToObjectEXT);
	    mat3 _966;
	    mat3 _3535 = _966;
	    _3535[0] = _3532[0].xyz;
	    _3535[1] = _3532[1].xyz;
	    _3535[2] = _3532[2].xyz;
	    _966 = _3535;
	    mat3 _3543 = transpose(_3535);
	    vec4 _3557 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _965 = _3557;
	    vec3 _3558 = _3557.xyz;
	    vec3 _3559 = _3558 * vec3(0.077399380505084991455078125);
	    vec3 _3562 = pow((_3558 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _962;
	    if (_3557.x <= 0.040449999272823333740234375)
	    {
	        _962 = _3559.x;
	    }
	    else
	    {
	        _962 = _3562.x;
	    }
	    float _963;
	    if (_3557.y <= 0.040449999272823333740234375)
	    {
	        _963 = _3559.y;
	    }
	    else
	    {
	        _963 = _3562.y;
	    }
	    float _964;
	    if (_3557.z <= 0.040449999272823333740234375)
	    {
	        _964 = _3559.z;
	    }
	    else
	    {
	        _964 = _3562.z;
	    }
	    vec3 _3587 = vec3(_962, _963, _964);
	    vec4 _3589 = _965;
	    _3589.x = _3587.x;
	    _3589.y = _3587.y;
	    _3589.z = _3587.z;
	    _965 = _3589;
	    vec4 _3596 = _885;
	    _3596.x = _3589.x;
	    _3596.y = _3589.y;
	    _3596.z = _3589.z;
	    _3596.w = _3589.w;
	    _885 = _3596;
	    vec3 _3607 = _878.xyz * vec3(0.077399380505084991455078125);
	    vec3 _3610 = pow((_878.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _959;
	    if (_878.x <= 0.040449999272823333740234375)
	    {
	        _959 = _3607.x;
	    }
	    else
	    {
	        _959 = _3610.x;
	    }
	    float _960;
	    if (_878.y <= 0.040449999272823333740234375)
	    {
	        _960 = _3607.y;
	    }
	    else
	    {
	        _960 = _3610.y;
	    }
	    float _961;
	    if (_878.z <= 0.040449999272823333740234375)
	    {
	        _961 = _3607.z;
	    }
	    else
	    {
	        _961 = _3610.z;
	    }
	    vec3 _3639 = _3596.xyz * mix(vec3(1.0), vec3(_959, _960, _961), vec3(_878.w));
	    vec4 _3641 = _885;
	    _3641.x = _3639.x;
	    _3641.y = _3639.y;
	    _3641.z = _3639.z;
	    _885 = _3641;
	    vec4 _3647 = _886;
	    _3647.w = 1.0;
	    vec4 _967;
	    vec4 _3652 = _967;
	    _3652.x = _879.x;
	    _3652.y = _879.y;
	    _3652.z = _879.z;
	    _3652.w = _879.w;
	    _967 = _3652;
	    vec3 _3662 = normalize(_880 * _3543);
	    vec3 _3665 = normalize(_3652.xyz * _3543);
	    vec4 _3667 = _884;
	    _3667.x = _3665.x;
	    _3667.y = _3665.y;
	    _3667.z = _3665.z;
	    _3667.w = _3652.w;
	    _884 = _3667;
	    vec3 _3676 = _888;
	    _3676.x = _3662.x;
	    _3676.y = _3662.y;
	    _3676.z = _3662.z;
	    _888 = _3676;
	    vec3 _3688 = (vec4(_883.xyz, 1.0) * _3530) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    _3647.x = _3688.x;
	    _3647.y = _3688.y;
	    _3647.z = _3688.z;
	    _886 = _3647;
	    vec4 _3697 = _887;
	    _3697.x = _882.x;
	    _3697.y = _882.y;
	    _3697.z = _881.x;
	    _3697.w = _881.y;
	    _887 = _3697;
	    vec4 _957 = _3697;
	    bool _958;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _958 = true;
	    }
	    else
	    {
	        _958 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_958)
	    {
	        vec4 _3716 = _957;
	        bvec4 _3718 = greaterThanEqual(_3716.xyzw, vec4(0.0));
	        vec4 _3719 = _3530[0];
	        vec4 _3721 = _3530[1];
	        vec4 _3723 = _3530[2];
	        float _3726 = length(vec3(_3719.x, _3721.x, _3723.x));
	        float _3731 = length(vec3(_3719.y, _3721.y, _3723.y));
	        float _3736 = length(vec3(_3719.z, _3721.z, _3723.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _3741 = vec4(_3726, _3731, _3736, 1.0);
	            if (_3718.x)
	            {
	                vec4 _3755 = _957;
	                _3755.x = ((_3755.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_3741, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _957 = _3755;
	            }
	            if (_3718.y)
	            {
	                vec4 _3767 = _957;
	                _3767.y = ((_3767.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_3741, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _957 = _3767;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _3777 = vec4(_3726, _3731, _3736, 1.0);
	            if (_3718.z)
	            {
	                vec4 _3791 = _957;
	                _3791.z = ((_3791.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_3777, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _957 = _3791;
	            }
	            if (_3718.w)
	            {
	                vec4 _3803 = _957;
	                _3803.w = ((_3803.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_3777, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _957 = _3803;
	            }
	        }
	    }
	    _887 = _957;
	    vec3 _845 = _888;
	    vec4 _844 = _957;
	    vec4 _843 = _886;
	    vec4 _842 = _885;
	    vec4 _841 = _884;
	    vec3 _877 = _1027[1].vPositionOs;
	    vec2 _876 = _1027[1].vTexCoord;
	    vec2 _875 = _1027[1].vTexcoord3;
	    vec3 _874 = _1027[1].vNormalOs;
	    vec4 _873 = _1027[1].vTangentUOs_flTangentVSign;
	    vec4 _872 = _1027[1].vBlendColorTint;
	    vec3 _893 = vec3(0.0);
	    vec4 _892 = vec4(0.0);
	    vec4 _891 = vec4(0.0);
	    vec4 _890 = vec4(0.0);
	    vec4 _889 = vec4(0.0);
	    mat3x4 _3823 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _3825 = transpose(gl_WorldToObjectEXT);
	    mat3 _955;
	    mat3 _3828 = _955;
	    _3828[0] = _3825[0].xyz;
	    _3828[1] = _3825[1].xyz;
	    _3828[2] = _3825[2].xyz;
	    _955 = _3828;
	    mat3 _3836 = transpose(_3828);
	    vec4 _3850 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _954 = _3850;
	    vec3 _3851 = _3850.xyz;
	    vec3 _3852 = _3851 * vec3(0.077399380505084991455078125);
	    vec3 _3855 = pow((_3851 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _951;
	    if (_3850.x <= 0.040449999272823333740234375)
	    {
	        _951 = _3852.x;
	    }
	    else
	    {
	        _951 = _3855.x;
	    }
	    float _952;
	    if (_3850.y <= 0.040449999272823333740234375)
	    {
	        _952 = _3852.y;
	    }
	    else
	    {
	        _952 = _3855.y;
	    }
	    float _953;
	    if (_3850.z <= 0.040449999272823333740234375)
	    {
	        _953 = _3852.z;
	    }
	    else
	    {
	        _953 = _3855.z;
	    }
	    vec3 _3880 = vec3(_951, _952, _953);
	    vec4 _3882 = _954;
	    _3882.x = _3880.x;
	    _3882.y = _3880.y;
	    _3882.z = _3880.z;
	    _954 = _3882;
	    vec4 _3889 = _890;
	    _3889.x = _3882.x;
	    _3889.y = _3882.y;
	    _3889.z = _3882.z;
	    _3889.w = _3882.w;
	    _890 = _3889;
	    vec3 _3900 = _872.xyz * vec3(0.077399380505084991455078125);
	    vec3 _3903 = pow((_872.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _948;
	    if (_872.x <= 0.040449999272823333740234375)
	    {
	        _948 = _3900.x;
	    }
	    else
	    {
	        _948 = _3903.x;
	    }
	    float _949;
	    if (_872.y <= 0.040449999272823333740234375)
	    {
	        _949 = _3900.y;
	    }
	    else
	    {
	        _949 = _3903.y;
	    }
	    float _950;
	    if (_872.z <= 0.040449999272823333740234375)
	    {
	        _950 = _3900.z;
	    }
	    else
	    {
	        _950 = _3903.z;
	    }
	    vec3 _3932 = _3889.xyz * mix(vec3(1.0), vec3(_948, _949, _950), vec3(_872.w));
	    vec4 _3934 = _890;
	    _3934.x = _3932.x;
	    _3934.y = _3932.y;
	    _3934.z = _3932.z;
	    _890 = _3934;
	    vec4 _3940 = _891;
	    _3940.w = 1.0;
	    vec4 _956;
	    vec4 _3945 = _956;
	    _3945.x = _873.x;
	    _3945.y = _873.y;
	    _3945.z = _873.z;
	    _3945.w = _873.w;
	    _956 = _3945;
	    vec3 _3955 = normalize(_874 * _3836);
	    vec3 _3958 = normalize(_3945.xyz * _3836);
	    vec4 _3960 = _889;
	    _3960.x = _3958.x;
	    _3960.y = _3958.y;
	    _3960.z = _3958.z;
	    _3960.w = _3945.w;
	    _889 = _3960;
	    vec3 _3969 = _893;
	    _3969.x = _3955.x;
	    _3969.y = _3955.y;
	    _3969.z = _3955.z;
	    _893 = _3969;
	    vec3 _3981 = (vec4(_877.xyz, 1.0) * _3823) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    _3940.x = _3981.x;
	    _3940.y = _3981.y;
	    _3940.z = _3981.z;
	    _891 = _3940;
	    vec4 _3990 = _892;
	    _3990.x = _876.x;
	    _3990.y = _876.y;
	    _3990.z = _875.x;
	    _3990.w = _875.y;
	    _892 = _3990;
	    vec4 _946 = _3990;
	    bool _947;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _947 = true;
	    }
	    else
	    {
	        _947 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_947)
	    {
	        vec4 _4009 = _946;
	        bvec4 _4011 = greaterThanEqual(_4009.xyzw, vec4(0.0));
	        vec4 _4012 = _3823[0];
	        vec4 _4014 = _3823[1];
	        vec4 _4016 = _3823[2];
	        float _4019 = length(vec3(_4012.x, _4014.x, _4016.x));
	        float _4024 = length(vec3(_4012.y, _4014.y, _4016.y));
	        float _4029 = length(vec3(_4012.z, _4014.z, _4016.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _4034 = vec4(_4019, _4024, _4029, 1.0);
	            if (_4011.x)
	            {
	                vec4 _4048 = _946;
	                _4048.x = ((_4048.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_4034, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _946 = _4048;
	            }
	            if (_4011.y)
	            {
	                vec4 _4060 = _946;
	                _4060.y = ((_4060.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_4034, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _946 = _4060;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _4070 = vec4(_4019, _4024, _4029, 1.0);
	            if (_4011.z)
	            {
	                vec4 _4084 = _946;
	                _4084.z = ((_4084.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_4070, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _946 = _4084;
	            }
	            if (_4011.w)
	            {
	                vec4 _4096 = _946;
	                _4096.w = ((_4096.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_4070, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _946 = _4096;
	            }
	        }
	    }
	    _892 = _946;
	    vec3 _840 = _893;
	    vec4 _839 = _946;
	    vec4 _838 = _891;
	    vec4 _837 = _890;
	    vec4 _836 = _889;
	    vec3 _871 = _1027[2].vPositionOs;
	    vec2 _870 = _1027[2].vTexCoord;
	    vec2 _869 = _1027[2].vTexcoord3;
	    vec3 _868 = _1027[2].vNormalOs;
	    vec4 _867 = _1027[2].vTangentUOs_flTangentVSign;
	    vec4 _866 = _1027[2].vBlendColorTint;
	    vec3 _898 = vec3(0.0);
	    vec4 _897 = vec4(0.0);
	    vec4 _896 = vec4(0.0);
	    vec4 _895 = vec4(0.0);
	    vec4 _894 = vec4(0.0);
	    mat3x4 _4116 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _4118 = transpose(gl_WorldToObjectEXT);
	    mat3 _944;
	    mat3 _4121 = _944;
	    _4121[0] = _4118[0].xyz;
	    _4121[1] = _4118[1].xyz;
	    _4121[2] = _4118[2].xyz;
	    _944 = _4121;
	    mat3 _4129 = transpose(_4121);
	    vec4 _4143 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _943 = _4143;
	    vec3 _4144 = _4143.xyz;
	    vec3 _4145 = _4144 * vec3(0.077399380505084991455078125);
	    vec3 _4148 = pow((_4144 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _940;
	    if (_4143.x <= 0.040449999272823333740234375)
	    {
	        _940 = _4145.x;
	    }
	    else
	    {
	        _940 = _4148.x;
	    }
	    float _941;
	    if (_4143.y <= 0.040449999272823333740234375)
	    {
	        _941 = _4145.y;
	    }
	    else
	    {
	        _941 = _4148.y;
	    }
	    float _942;
	    if (_4143.z <= 0.040449999272823333740234375)
	    {
	        _942 = _4145.z;
	    }
	    else
	    {
	        _942 = _4148.z;
	    }
	    vec3 _4173 = vec3(_940, _941, _942);
	    vec4 _4175 = _943;
	    _4175.x = _4173.x;
	    _4175.y = _4173.y;
	    _4175.z = _4173.z;
	    _943 = _4175;
	    vec4 _4182 = _895;
	    _4182.x = _4175.x;
	    _4182.y = _4175.y;
	    _4182.z = _4175.z;
	    _4182.w = _4175.w;
	    _895 = _4182;
	    vec3 _4193 = _866.xyz * vec3(0.077399380505084991455078125);
	    vec3 _4196 = pow((_866.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _937;
	    if (_866.x <= 0.040449999272823333740234375)
	    {
	        _937 = _4193.x;
	    }
	    else
	    {
	        _937 = _4196.x;
	    }
	    float _938;
	    if (_866.y <= 0.040449999272823333740234375)
	    {
	        _938 = _4193.y;
	    }
	    else
	    {
	        _938 = _4196.y;
	    }
	    float _939;
	    if (_866.z <= 0.040449999272823333740234375)
	    {
	        _939 = _4193.z;
	    }
	    else
	    {
	        _939 = _4196.z;
	    }
	    vec3 _4225 = _4182.xyz * mix(vec3(1.0), vec3(_937, _938, _939), vec3(_866.w));
	    vec4 _4227 = _895;
	    _4227.x = _4225.x;
	    _4227.y = _4225.y;
	    _4227.z = _4225.z;
	    _895 = _4227;
	    vec4 _4233 = _896;
	    _4233.w = 1.0;
	    vec4 _945;
	    vec4 _4238 = _945;
	    _4238.x = _867.x;
	    _4238.y = _867.y;
	    _4238.z = _867.z;
	    _4238.w = _867.w;
	    _945 = _4238;
	    vec3 _4248 = normalize(_868 * _4129);
	    vec3 _4251 = normalize(_4238.xyz * _4129);
	    vec4 _4253 = _894;
	    _4253.x = _4251.x;
	    _4253.y = _4251.y;
	    _4253.z = _4251.z;
	    _4253.w = _4238.w;
	    _894 = _4253;
	    vec3 _4262 = _898;
	    _4262.x = _4248.x;
	    _4262.y = _4248.y;
	    _4262.z = _4248.z;
	    _898 = _4262;
	    vec3 _4274 = (vec4(_871.xyz, 1.0) * _4116) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    _4233.x = _4274.x;
	    _4233.y = _4274.y;
	    _4233.z = _4274.z;
	    _896 = _4233;
	    vec4 _4283 = _897;
	    _4283.x = _870.x;
	    _4283.y = _870.y;
	    _4283.z = _869.x;
	    _4283.w = _869.y;
	    _897 = _4283;
	    vec4 _935 = _4283;
	    bool _936;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _936 = true;
	    }
	    else
	    {
	        _936 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_936)
	    {
	        vec4 _4302 = _935;
	        bvec4 _4304 = greaterThanEqual(_4302.xyzw, vec4(0.0));
	        vec4 _4305 = _4116[0];
	        vec4 _4307 = _4116[1];
	        vec4 _4309 = _4116[2];
	        float _4312 = length(vec3(_4305.x, _4307.x, _4309.x));
	        float _4317 = length(vec3(_4305.y, _4307.y, _4309.y));
	        float _4322 = length(vec3(_4305.z, _4307.z, _4309.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _4327 = vec4(_4312, _4317, _4322, 1.0);
	            if (_4304.x)
	            {
	                vec4 _4341 = _935;
	                _4341.x = ((_4341.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_4327, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _935 = _4341;
	            }
	            if (_4304.y)
	            {
	                vec4 _4353 = _935;
	                _4353.y = ((_4353.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_4327, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _935 = _4353;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _4363 = vec4(_4312, _4317, _4322, 1.0);
	            if (_4304.z)
	            {
	                vec4 _4377 = _935;
	                _4377.z = ((_4377.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_4363, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _935 = _4377;
	            }
	            if (_4304.w)
	            {
	                vec4 _4389 = _935;
	                _4389.w = ((_4389.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_4363, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _935 = _4389;
	            }
	        }
	    }
	    _897 = _935;
	    vec3 _835 = _898;
	    vec4 _834 = _896;
	    vec3 _4420 = ((_845 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_840 * attrs.barycentrics.x)) + (_898 * attrs.barycentrics.y);
	    vec4 _4463 = ((_841 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_836 * attrs.barycentrics.x)) + (_894 * attrs.barycentrics.y);
	    vec4 _855 = ((_844 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_839 * attrs.barycentrics.x)) + (_935 * attrs.barycentrics.y);
	    vec4 _854 = ((_842 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_837 * attrs.barycentrics.x)) + (_895 * attrs.barycentrics.y);
	    vec3 _853 = normalize(cross(_838.xyz - _843.xyz, _896.xyz - _843.xyz));
	    vec3 _914 = vec3(0.0);
	    vec3 _913 = vec3(0.0);
	    float _930;
	    if (_4463.w > 0.0)
	    {
	        _930 = 1.0;
	    }
	    else
	    {
	        _930 = -1.0;
	    }
	    vec3 _4470 = _4463.xyz;
	    float _4475 = 1.0 / length(_4420);
	    vec3 _915 = _4420 * _4475;
	    vec3 _849 = _4470 * _4475;
	    vec3 _848 = (cross(_4420, _4470) * _930) * _4475;
	    if (false)
	    {
	        _915 *= (-1.0);
	    }
	    vec3 _912 = _914 - (_915 * dot(_914, _915));
	    vec3 _911 = _913 - (_915 * dot(_913, _915));
	    int _931;
	    if (dot(_913, cross(_915, _914)) < 0.0)
	    {
	        _931 = -1;
	    }
	    else
	    {
	        _931 = 1;
	    }
	    vec3 _920 = _915;
	    vec3 _919 = _912;
	    vec3 _918 = _911;
	    float _917 = float(_931);
	    vec3 _851 = _849;
	    vec3 _850 = _848;
	    _RTX_MATERIAL_DATA_ _4506 = _g_rtx_material_data_;
	    _4506.g_flLayer2Offset = 0.0;
	    _4506.g_flLayer3Offset = 0.0;
	    _g_rtx_material_data_ = _4506;
	    vec3 _4510 = -normalize((((_843 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_838 * attrs.barycentrics.x)) + (_896 * attrs.barycentrics.y)).xyz);
	    float _4514 = _4506.g_flReflectionOcclusionOffset * (1.0 / dot(_4510, _4420));
	    float _929;
	    if (false)
	    {
	        _929 = -1.0;
	    }
	    else
	    {
	        _929 = 1.0;
	    }
	    vec2 _4521 = vec2(0.0, -0.0) * _929;
	    vec3 _916 = (_919 * _4521.x) + (_918 * _4521.y);
	    float _4529 = abs(0.0);
	    if (_4529 > 0.0)
	    {
	        _916 = normalize(_916);
	    }
	    vec2 _910;
	    vec2 _4543 = _910;
	    _4543.x = dot(_4510, _849);
	    _4543.y = dot(_4510, _848);
	    _910 = _4543;
	    vec2 _909;
	    vec2 _4548 = _909;
	    _4548.x = dot(_4510, _916);
	    _4548.y = dot(_4510, cross(_920, _916) * (_929 * _917));
	    _909 = _4548;
	    vec2 _932;
	    if (_g_rtx_material_data_.g_bLayer2UseSecondaryUV)
	    {
	        _909 = max(min(_909, vec2(_g_rtx_material_data_.g_flParallaxViewAngleLimit2)), vec2(-_g_rtx_material_data_.g_flParallaxViewAngleLimit2));
	        _932 = _855.zw;
	    }
	    else
	    {
	        _932 = _855.xy;
	    }
	    vec2 _933;
	    if (_g_rtx_material_data_.g_bLayer3UseSecondaryUV)
	    {
	        _909 = max(min(_909, vec2(_g_rtx_material_data_.g_flParallaxViewAngleLimit3)), vec2(-_g_rtx_material_data_.g_flParallaxViewAngleLimit3));
	        _933 = _855.zw;
	    }
	    else
	    {
	        _933 = _855.xy;
	    }
	    vec2 _934;
	    if (_g_rtx_material_data_.g_bReflectionOcclusionUseSecondaryUV)
	    {
	        vec2 _4595 = _909;
	        vec2 _4603 = max(min(_4595, vec2(_g_rtx_material_data_.g_flReflectionOcclusionViewAngleLimit)), vec2(-_g_rtx_material_data_.g_flReflectionOcclusionViewAngleLimit));
	        _909 = _4603;
	        _934 = _855.zw - (_4603 * _4514);
	    }
	    else
	    {
	        _934 = _855.xy - (max(min(_4543, vec2(_g_rtx_material_data_.g_flParallaxViewAngleLimit3)), vec2(-_g_rtx_material_data_.g_flReflectionOcclusionViewAngleLimit)) * _4514);
	    }
	    vec3 _4616 = (vec4(textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _855.xy, 0.0).xyz, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect).xyz;
	    vec4 _4618;
	    _4618.x = _4616.x;
	    _4618.y = _4616.y;
	    _4618.z = _4616.z;
	    vec3 _4630 = mix(_4618.xyz, _4618.xyz * _854.xyz, vec3(_g_rtx_material_data_.g_fVertexColorStrength1));
	    vec4 _4632;
	    _4632.x = _4630.x;
	    _4632.y = _4630.y;
	    _4632.z = _4630.z;
	    vec4 _4642 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _932.xy, 0.0);
	    vec4 _4643 = _4642.xyzw;
	    vec3 _4648 = (vec4(_4642.xyz, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect2).xyz;
	    _4643.x = _4648.x;
	    _4643.y = _4648.y;
	    _4643.z = _4648.z;
	    vec3 _4660 = mix(_4643.xyz, _4643.xyz * _854.xyz, vec3(_g_rtx_material_data_.g_fVertexColorStrength2));
	    vec4 _4662 = _4643;
	    _4662.x = _4660.x;
	    _4662.y = _4660.y;
	    _4662.z = _4660.z;
	    vec4 _4672 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor3], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _933.xy, 0.0);
	    vec4 _4673 = _4672.xyzw;
	    vec3 _4678 = (vec4(_4672.xyz, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect3).xyz;
	    _4673.x = _4678.x;
	    _4673.y = _4678.y;
	    _4673.z = _4678.z;
	    vec3 _4690 = mix(_4673.xyz, _4673.xyz * _854.xyz, vec3(_g_rtx_material_data_.g_fVertexColorStrength3));
	    vec4 _4692 = _4673;
	    _4692.x = _4690.x;
	    _4692.y = _4690.y;
	    _4692.z = _4690.z;
	    vec4 _4700 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tMask], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _855.xy, 0.0);
	    float _4701 = _4700.x;
	    vec4 _4705 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tMask2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _932.xy, 0.0);
	    float _4706 = _4705.x;
	    float _4714 = 1.0 - _4701;
	    float _4715 = 1.0 - _4706;
	    float _4723 = ((_g_rtx_material_data_.g_flEmissiveLevel2 * _4662.w) * _4714) * dot(_g_rtx_material_data_.g_vEmissiveTint2.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    float _4731 = ((_g_rtx_material_data_.g_flEmissiveLevel3 * _4692.w) * _4715) * dot(_g_rtx_material_data_.g_vEmissiveTint3.xyz, vec3(0.2125000059604644775390625, 0.7153999805450439453125, 0.07209999859333038330078125));
	    vec3 _4732 = mix(mix(_4692.xyz, _4662.xyz, vec3(_4706)), _4632.xyz, vec3(_4701)).xyz;
	    float _4736 = _4714 * _4715;
	    vec3 _4742 = mix(_4732, _g_rtx_material_data_.g_vEmissiveTint2.xyz * _4732, vec3((1.0 - _4736) * saturate(_4723))).xyz;
	    vec4 _4757 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughness], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _855.xy, 0.0).xyzw;
	    vec4 _4762 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughness2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _932.xy, 0.0).xyzw;
	    float _4770 = step(textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tReflectionOcclusionMask], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _934.xy, 0.0).x, 0.5);
	    _4757.z = mix(mix(1.0, _4757.z, _4770), _4757.z, _g_rtx_material_data_.g_bLayer2ShadingBlendStrength);
	    _4762.z = mix(1.0, _4762.z, _4770);
	    vec4 _4783 = mix(_4757, _4762, vec4(_4714 * _g_rtx_material_data_.g_bLayer2ShadingBlendStrength));
	    float _4787 = _4783.x;
	    float _4788 = _4783.y;
	    float _4790 = (_4787 + _4788) - 1.00392162799835205078125;
	    float _4791 = _4787 - _4788;
	    vec3 _4798 = normalize(vec3(vec2(_4790, _4791), (1.0 - abs(_4790)) - abs(_4791)));
	    vec3 _4799 = abs(_4798);
	    vec2 _4812 = (-vec2(_4798.x, (-1.0) * _4798.y)) / vec2(max(_4799.z, 0.0078125 * max(_4799.x, _4799.y)));
	    float _907 = 0.0;
	    float _906 = 0.039999999105930328369140625;
	    vec3 _904 = vec3(0.0);
	    vec3 _902 = normalize(_920 - ((_851 * _4812.x) + (_850 * _4812.y)));
	    vec3 _901 = _920;
	    bool _899 = false;
	    vec3 _900 = _853;
	    vec3 _908 = mix(_4742, _g_rtx_material_data_.g_vEmissiveTint3.xyz * _4742, vec3(_4736 * saturate(_4731)));
	    vec2 _905 = _4783.zz;
	    float _903 = mix(_4714 * _4723, _4731, _4715 * _4714);
	    vec3 _865 = _908;
	    float _864 = _907;
	    float _863 = _906;
	    vec2 _862 = _905;
	    vec3 _861 = _904;
	    float _860 = _903;
	    vec3 _859 = _902;
	    vec3 _858 = _901;
	    vec3 _857 = _900;
	    bool _856 = _899;
	    vec3 _927[3] = vec3[](_843.xyz, _838.xyz, _834.xyz);
	    vec3 _928[3] = vec3[](_845, _840, _835);
	    vec3 _4857 = ((_927[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_927[1] * attrs.barycentrics.x)) + (_927[2] * attrs.barycentrics.y);
	    vec3 _921[3];
	    _921[0] = _4857 - (_928[0] * dot(_4857 - _927[0], _928[0]));
	    _921[1] = _4857 - (_928[1] * dot(_4857 - _927[1], _928[1]));
	    _921[2] = _4857 - (_928[2] * dot(_4857 - _927[2], _928[2]));
	    vec3 _4897 = ((_921[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_921[1] * attrs.barycentrics.x)) + (_921[2] * attrs.barycentrics.y);
	    vec3 _922[3];
	    _922[0] = cross(_927[0] - _927[1], _900);
	    _922[1] = cross(_927[1] - _927[2], _900);
	    _922[2] = cross(_927[2] - _927[0], _900);
	    float _923 = dot(_4897 - _4857, _900);
	    vec3 _924 = _4897;
	    int _925 = 0;
	    for (;;)
	    {
	        bool _4913_ladder_break = false;
	        do
	        {
	            if (!(_925 < 3))
	            {
	                _4913_ladder_break = true;
	                break;
	            }
	            if (_923 > 0.00999999977648258209228515625)
	            {
	                _4913_ladder_break = true;
	                break;
	            }
	            if (dot(_922[_925], _922[_925]) == 0.0)
	            {
	                break;
	            }
	            _922[_925] = normalize(_922[_925]);
	            int _926 = 0;
	            for (;;)
	            {
	                if (!(_926 < 3))
	                {
	                    break;
	                }
	                vec3 _4951 = _928[_926] - (_922[_925] * dot(_922[_925], _928[_926]));
	                _921[_926] = _4857 - (_4951 * dot(_4857 - _927[_926], _4951));
	                _926++;
	                continue;
	            }
	            vec3 _4975 = ((_921[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_921[1] * attrs.barycentrics.x)) + (_921[2] * attrs.barycentrics.y);
	            _923 = dot(_4975 - _4857, _900);
	            _924 = _4975;
	            break;
	        } while(false);
	        if (_4913_ladder_break)
	        {
	            break;
	        }
	        _925++;
	        continue;
	    }
	    if (!(_923 > 0.00999999977648258209228515625))
	    {
	        _924 = vec3(3.4028234663852885981170418348452e+38);
	    }
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _857;
	    payload.vInterpolatedNormalWs = _858;
	    payload.vSmoothPositionWs = _924;
	    payload.bFlippedNormal = _856;
	    f16vec3 _5006 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_5006, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _5006, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_859);
	    payload.material.vAlbedo = f16vec3(_865);
	    f16vec3 _5015 = f16vec3(_861);
	    payload.material.vEmissive = _5015;
	    payload.material.vEmissive = _5015 + f16vec3(_865 * _860);
	    payload.material.flReflectance = float16_t(_863);
	    payload.material.flMetalness = float16_t(_864);
	    payload.material.flRoughness = float16_t(_862.x);
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
	BoolAttribute(WriteDepthBeforeAlphaBlending, true);
	
}
