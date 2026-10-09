//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Environment Blend Shader.";
	DevShader = false;
	Version = 9;
	
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
	Feature( F_LAYER_COUNT, 0..1 (0="2 Layers", 1="3 Layers"), "Blend" );
	Feature( F_LAYER1_BIPLANAR, 0..1, "Bi-Planar" );
	Feature( F_LAYER2_BIPLANAR, 0..1, "Bi-Planar" );
	Feature( F_LAYER3_BIPLANAR, 0..1, "Bi-Planar" );
	Feature( F_UV_OVERLAY, 0..1, "Overlay" );
	Feature( F_WORLD_OVERLAY, 0..2 (0="Off", 1="1 World Overlay", 2="2 World Overlays"), "Overlay" );
	Feature( F_WORLD_OVERLAY_USE_OBJECT_SPACE, 0..1, "Overlay" );
	FeatureRule( Requires( F_LAYER3_BIPLANAR, F_LAYER_COUNT==1 ), "Layer3 must be enabled." );
	FeatureRule( Requires( F_WORLD_OVERLAY_USE_OBJECT_SPACE, F_WORLD_OVERLAY ), "Requires World Overlay" );
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
	float3 vPositionOs                : POSITION0      < Semantic( PosXyz ); >;                    // D_CS_VERTEX_ANIMATION=0, D_BAKED_LIGHTING_FROM_LIGHTMAP=1, S_WORLD_OVERLAY_USE_OBJECT_SPACE=1
	float4 vTangentUOs_flTangentVSign : TANGENT0       < Semantic( TangentU_SignV ); >;           
	float2 vTexCoord                  : TEXCOORD0      < Semantic( LowPrecisionUv ); >;           
	float2 vLightmapUV                : TEXCOORD3      < Semantic( LightmapUV ); >;                // D_BAKED_LIGHTING_FROM_LIGHTMAP=1
	float2 vTexCoord2                 : TEXCOORD1      < Semantic( LowPrecisionUv1 ); >;          
	float4 vColorBlendValues          : TEXCOORD4      < Semantic( VertexPaintBlendParams ); >;   
	float2 nInstanceIdx               : TEXCOORD13     < Semantic( InstanceTransformUv ); >;      
};

VS
{
	StaticCombo( S_WORLD_OVERLAY_USE_OBJECT_SPACE, F_WORLD_OVERLAY_USE_OBJECT_SPACE );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
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
	
	layout(location = 8) in uint nInstanceIdx;
	layout(location = 7) in uvec4 vBlendIndices;
	layout(location = 6) in vec4 vBlendColorTint;
	layout(location = 3) in vec3 vNormalOs;
	layout(location = 4) in vec4 vTangentUOs_flTangentVSign;
	layout(location = 0) in vec3 vPositionOs;
	layout(location = 5) in vec3 vColorBlendValues;
	layout(location = 1) in vec2 vTexCoord;
	layout(location = 2) in vec2 vTexCoord2;
	layout(location = 0) out vec3 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec3 output_2;
	layout(location = 3) out vec4 output_3;
	layout(location = 4) out vec4 output_4;
	layout(location = 5) out vec2 output_5;
	
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
	    vec4 _13745 = vec4(vTexCoord, vTexCoord2);
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
	    output_5 = vColorBlendValues.xy;
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
	BoolAttribute(VertexPaintUI2Layer, (F_LAYER_COUNT==0) ? 1 : 0);
	BoolAttribute(VertexPaintUI3Layer, (F_LAYER_COUNT==1) ? 1 : 0);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, true);
	BoolAttribute(PerVertexLighting, true);
	
}

PS
{
	StaticCombo( S_WORLD_OVERLAY_USE_OBJECT_SPACE, F_WORLD_OVERLAY_USE_OBJECT_SPACE );
	StaticCombo( S_UV_OVERLAY, F_UV_OVERLAY );
	StaticCombo( S_LAYER1_BIPLANAR, F_LAYER1_BIPLANAR );
	StaticCombo( S_LAYER2_BIPLANAR, F_LAYER2_BIPLANAR );
	StaticCombo( S_LAYER3_BIPLANAR, F_LAYER3_BIPLANAR );
	StaticCombo( S_WORLD_OVERLAY, F_WORLD_OVERLAY );
	StaticCombo( S_LAYER_COUNT, F_LAYER_COUNT );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_MODE_TOOLS_VIS, 0..1 );
	StaticComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, S_MODE_TOOLS_VIS ) );
	StaticComboRule( Requires( S_LAYER3_BIPLANAR, S_LAYER_COUNT==1 ) );
	StaticComboRule( Requires( S_WORLD_OVERLAY_USE_OBJECT_SPACE, S_WORLD_OVERLAY ) );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	
	RenderState(CullMode, (exists(ShaderVar_WireframeBackfaces) && ShaderVar_WireframeBackfaces) ? None : Back);
	RenderState(DepthBias, 768);
	RenderState(DepthBiasClamp, 0);
	RenderState(DepthEnable, exists(ShaderVar_WireframeDepthEnable) ? ShaderVar_WireframeDepthEnable : true);
	RenderState(DepthFunc, GreaterEqual);
	RenderState(FillMode, Wireframe);
	RenderState(SlopeScaleDepthBias, 0);
	bool g_bOverlayTintMaskInvert1 < UiType(CheckBox); Expression(g_nOverlayTintMask1==2); >;
	bool g_bOverlayTintMaskInvert2 < UiType(CheckBox); Expression(g_nOverlayTintMask2==2); >;
	bool g_bOverlayTintMaskInvert3 < UiType(CheckBox); Expression(g_nOverlayTintMask3==2); >;
	bool g_bOverlayUseTintMask1 < UiType(CheckBox); Expression(g_nOverlayTintMask1!=0); >;
	bool g_bOverlayUseTintMask2 < UiType(CheckBox); Expression(g_nOverlayTintMask2!=0); >;
	bool g_bOverlayUseTintMask3 < UiType(CheckBox); Expression(g_nOverlayTintMask3!=0); >;
	bool g_bWorldOverlayTintMaskInvert1 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask1==2); >;
	bool g_bWorldOverlayTintMaskInvert2 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask2==2); >;
	bool g_bWorldOverlayTintMaskInvert3 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask3==2); >;
	bool g_bWorldOverlayUseTintMask1 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask1!=0); >;
	bool g_bWorldOverlayUseTintMask2 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask2!=0); >;
	bool g_bWorldOverlayUseTintMask3 < UiType(CheckBox); Expression(g_nWorldOverlayTintMask3!=0); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mAlbedoColorCorrect1 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor1))); >;
	float4x4 g_mAlbedoColorCorrect2 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness2,TextureAverageColor(g_tColor2))); >;
	float4x4 g_mAlbedoColorCorrect3 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness3,TextureAverageColor(g_tColor3))); >;
	float4x4 g_mTextureColorTint1 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
	float4x4 g_mTextureColorTint2 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint2),.85,g_nTextureColorTintMode2)); >;
	float4x4 g_mTextureColorTint3 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint3),.85,g_nTextureColorTintMode3)); >;
	Texture2D g_tColor1 < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureTintMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor2 < Channel(RGB, Box(TextureColor2), Srgb); Channel(A, Box(TextureTintMask2), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor3 < Channel(RGB, Box(TextureColor3), Srgb); Channel(A, Box(TextureTintMask3), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColorOverlay < Channel(RGB, ArtistDefined(TextureColorOverlay), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tColorWorldOverlay < Channel(RGB, ArtistDefined(TextureColorWorldOverlay), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tColorWorldOverlay2 < Channel(RGB, ArtistDefined(TextureColorWorldOverlay2), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tNormalRoughness1 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness2 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal2, TextureRoughness2), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness3 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal3, TextureRoughness3), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughnessOverlay < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormalOverlay, TextureRoughnessOverlay), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tPacked1 < Channel(R, Box(TextureSelfIllum1), Linear); Channel(G, Box(TextureMetalness1), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tPacked2 < Channel(R, Box(TextureSelfIllum2), Linear); Channel(G, Box(TextureMetalness2), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tPacked3 < Channel(R, Box(TextureSelfIllum3), Linear); Channel(G, Box(TextureMetalness3), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tRevealMask2 < Channel(R, Box(TextureRevealMask2), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tRevealMask3 < Channel(R, Box(TextureRevealMask3), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tRevealOverlay < Channel(R, Box(TextureRevealOverlay), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float3 g_vFlatOverlayColor < Default2(1, 0); Attribute("FlatOverlayColor"); UiType(VectorText); >;
	float4 g_vRevealUvTransform2 < UiType(VectorText); Expression(v0 = g_vRevealScaleRotationTranslation2.x;
		v1 = g_vRevealScaleRotationTranslation2.y*3.1415927/180;
		v2 = g_vRevealScaleRotationTranslation2.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vRevealUvTransform3 < UiType(VectorText); Expression(v0 = g_vRevealScaleRotationTranslation3.x;
		v1 = g_vRevealScaleRotationTranslation3.y*3.1415927/180;
		v2 = g_vRevealScaleRotationTranslation3.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vShaderIDColor < Source(ShaderIDColor); UiType(VectorText); >;
	float4 g_vUvTransform1 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation1.x;
		v1 = g_vScaleRotationTranslation1.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation1.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransform2 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation2.x;
		v1 = g_vScaleRotationTranslation2.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation2.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransform3 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation3.x;
		v1 = g_vScaleRotationTranslation3.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation3.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransformOverlay < UiType(VectorText); Expression(v0 = g_vOverlayScaleRotationTranslation.x;
		v1 = g_vOverlayScaleRotationTranslation.y*3.1415927/180;
		v2 = g_vOverlayScaleRotationTranslation.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	
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
	
	// ENVIRONMENT_LAYER 2
	CreateInputTexture2D(TextureColor2, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 2 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness2, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 2 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal2, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 2 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness2, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 2 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum2, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 2 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask2, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 2 / Tint Mask", Default4(1, 1, 1, 0));
	bool g_bMaskColorTint2 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	bool g_bMaskVertexColorTint2 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float g_fLayerNormalStrength2 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / Normal"); >;
	float g_fLayerSelfIllumScale2 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / SelfIllum"); >;
	float g_fVertexColorStrength2 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float g_flOverrideBloomAmount2 < Range(0, 20); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / SelfIllum"); >;
	int g_nTextureColorTintMode2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness2 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float3 g_vColorTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Roughness"); >;
	float3 g_vLayerSelfIllumTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 2 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Tint Mask"); >;
	
	// ENVIRONMENT_LAYER 3
	CreateInputTexture2D(TextureColor3, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 3 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness3, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 3 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal3, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 3 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness3, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 3 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum3, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 3 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask3, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 3 / Tint Mask", Default4(1, 1, 1, 0));
	bool g_bMaskColorTint3 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	bool g_bMaskVertexColorTint3 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float g_fLayerNormalStrength3 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / Normal"); >;
	float g_fLayerSelfIllumScale3 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / SelfIllum"); >;
	float g_fVertexColorStrength3 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float g_flOverrideBloomAmount3 < Range(0, 20); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / SelfIllum"); >;
	int g_nTextureColorTintMode3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness3 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float3 g_vColorTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Roughness"); >;
	float3 g_vLayerSelfIllumTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 3 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Tint Mask"); >;
	
	// Uv Overlay
	CreateInputTexture2D(TextureColorOverlay, Linear, 8, "", "_color", "Uv Overlay/10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureNormalOverlay, Linear, 8, "NormalizeNormals", "_normal", "Uv Overlay/11", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughnessOverlay, Linear, 8, "Inverse", "_rough", "Uv Overlay/12", Default4(0.5, 0.5, 0.5, 0));
	bool g_bUseSecondaryUvForOverlay < Default(1); UiType(CheckBox); UiGroup("Uv Overlay/13"); >;
	float4 g_vOverlayScaleRotationTranslation < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Uv Overlay/14"); >;
	float g_flOverlayDarknessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("Uv Overlay/20"); >;
	float g_flOverlayBrightnessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("Uv Overlay/30"); >;
	
	// World Overlay
	float g_flWorldOverlayTiling < Default(512); Range(1, 4096); UiType(Slider); UiGroup("World Overlay/Transform"); Expression(1/this); >;
	float2 g_vWorldOverlayTiling < Default2(512, 512); Range2(1, 1, 4096, 4096); UiType(VectorText); UiGroup("World Overlay/Transform"); Expression(1/this); >;
	CreateInputTexture2D(TextureColorWorldOverlay, Linear, 8, "", "_color", "World Overlay/10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureColorWorldOverlay2, Linear, 8, "", "_color", "World Overlay/11", Default4(0.5, 0.5, 0.5, 0));
	float g_flWorldOverlayDarknessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("World Overlay/20"); >;
	float2 g_vWorldOverlayDarknessContrast < Default2(1, 1); Range2(0.2, 0.2, 2, 2); UiType(VectorText); UiGroup("World Overlay/20"); >;
	float g_flWorldOverlayBrightnessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("World Overlay/30"); >;
	float2 g_vWorldOverlayBrightnessContrast < Default2(1, 1); Range2(0.2, 0.2, 2, 2); UiType(VectorText); UiGroup("World Overlay/30"); >;
	
	// Layer 2
	bool g_bModelTint2 < Default(1); UiType(CheckBox); UiGroup("Layer 2/Color"); >;
	bool g_bRevealUseSecondaryUv2 < UiType(CheckBox); UiGroup("Layer 2/Reveal"); >;
	float g_flBiPlanarTiling2 < Default(196); Range(0, 512); UiType(Slider); UiGroup("Layer 2/UV"); Expression(1/this); >;
	float g_flBiPlanarTiling3 < Default(196); Range(0, 512); UiType(Slider); UiGroup("Layer 2/UV"); Expression(1/this); >;
	float4 g_vRevealScaleRotationTranslation2 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 2/Reveal"); >;
	float4 g_vScaleRotationTranslation2 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 2/UV"); >;
	CreateInputTexture2D(TextureRevealOverlay, Linear, 8, "", "_blend", "Layer 2/Uv Reveal Overlay/1", Default4(0, 0, 0, 0));
	bool g_bBorderEffects2 < UiType(CheckBox); UiGroup("Layer 2/Border Effects/1"); >;
	bool g_bRevealOverlayInvert2 < UiType(CheckBox); UiGroup("Layer 2/Uv Reveal Overlay/2"); >;
	float g_flRevealOverlayStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Reveal Overlay/3"); >;
	CreateInputTexture2D(TextureRevealMask2, Linear, 8, "", "_blend", "Layer 2/Reveal/10", Default4(0.5, 0.5, 0.5, 0));
	bool g_bAcceptStaticOverlays2 < Default(1); UiType(CheckBox); UiGroup("Layer 2/Static Overlay/10"); >;
	float g_flOverlayStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Overlay/10"); >;
	float g_flWorldOverlayStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/World Overlay/10"); >;
	float2 g_vBorderWidth2 < Default2(0.125, 0.125); Range2(0.01, 0.01, 0.5, 0.5); UiType(VectorText); UiGroup("Layer 2/Border Effects/10"); >;
	float2 g_vWorldOverlayStrengths2 < Default(1); UiType(VectorText); UiGroup("Layer 2/World Overlay/10"); >;
	bool g_bRevealInvert2 < UiType(CheckBox); UiGroup("Layer 2/Reveal/11"); >;
	float g_flOverlayNormalStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Overlay/11"); >;
	float g_flStaticOverlaysTintMaskInfluence2 < Range(-2, 2); UiType(Slider); UiGroup("Layer 2/Static Overlay/11"); >;
	float g_flOverlayRoughnessStrength2 < UiType(Slider); UiGroup("Layer 2/Uv Overlay/13"); >;
	float g_flRevealOffset2 < Range(-0.95, 0.95); UiType(Slider); UiGroup("Layer 2/Reveal/20"); >;
	int g_nOverlayTintMask2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 2/Uv Overlay/20"); >;
	int g_nWorldOverlayTintMask2 < Default(1); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 2/World Overlay/20"); >;
	float2 g_vBorderSoftness2 < Default2(0.5, 0.5); UiType(VectorText); UiGroup("Layer 2/Border Effects/20"); >;
	float g_flRevealSoftness2 < Default(0.125); Range(0, 0.5); UiType(Slider); UiGroup("Layer 2/Reveal/30"); >;
	float2 g_vBorderLayerAmount2 < Default2(1, 1); UiType(VectorText); UiGroup("Layer 2/Border Effects/40"); >;
	int g_nBorderBlendMode2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Mod2x,2=Blend"); UiType(Enum); UiGroup("Layer 2/Border Effects/50"); >;
	float4 g_vBorderTint2 < Default4(0.5, 0.5, 0.5, 1); UiType(Color); UiGroup("Layer 2/Border Effects/51"); Expression((g_nBorderBlendMode2==1) ? this : SrgbGammaToLinear(this)); >;
	float g_flBorderRoughnessStrength2 < UiType(Slider); UiGroup("Layer 2/Border Effects/60"); >;
	float g_flBorderRoughness2 < Default(0.5); UiType(Slider); UiGroup("Layer 2/Border Effects/61"); >;
	
	// Layer 3
	bool g_bModelTint3 < Default(1); UiType(CheckBox); UiGroup("Layer 3/Color"); >;
	bool g_bRevealUseSecondaryUv3 < UiType(CheckBox); UiGroup("Layer 3/Reveal"); >;
	float4 g_vRevealScaleRotationTranslation3 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 3/Reveal"); >;
	float4 g_vScaleRotationTranslation3 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 3/UV"); >;
	bool g_bBorderEffects3 < UiType(CheckBox); UiGroup("Layer 3/Border Effects/1"); >;
	CreateInputTexture2D(TextureRevealMask3, Linear, 8, "", "_blend", "Layer 3/Reveal/10", Default4(0.5, 0.5, 0.5, 0));
	bool g_bAcceptStaticOverlays3 < Default(1); UiType(CheckBox); UiGroup("Layer 3/Static Overlay/10"); >;
	float g_flOverlayStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/Uv Overlay/10"); >;
	float g_flWorldOverlayStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/World Overlay/10"); >;
	float2 g_vBorderWidth3 < Default2(0.125, 0.125); Range2(0.01, 0.01, 0.5, 0.5); UiType(VectorText); UiGroup("Layer 3/Border Effects/10"); >;
	float2 g_vWorldOverlayStrengths3 < Default(1); UiType(VectorText); UiGroup("Layer 3/World Overlay/10"); >;
	bool g_bRevealInvert3 < UiType(CheckBox); UiGroup("Layer 3/Reveal/11"); >;
	float g_flOverlayNormalStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/Uv Overlay/11"); >;
	float g_flStaticOverlaysTintMaskInfluence3 < Range(-2, 2); UiType(Slider); UiGroup("Layer 3/Static Overlay/11"); >;
	float g_flOverlayRoughnessStrength3 < UiType(Slider); UiGroup("Layer 3/Uv Overlay/13"); >;
	float g_flRevealOffset3 < Range(-0.95, 0.95); UiType(Slider); UiGroup("Layer 3/Reveal/20"); >;
	int g_nOverlayTintMask3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 3/Uv Overlay/20"); >;
	int g_nWorldOverlayTintMask3 < Default(1); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 3/World Overlay/20"); >;
	float2 g_vBorderSoftness3 < Default2(0.5, 0.5); UiType(VectorText); UiGroup("Layer 3/Border Effects/20"); >;
	float g_flRevealSoftness3 < Default(0.125); Range(0, 0.5); UiType(Slider); UiGroup("Layer 3/Reveal/30"); >;
	float3 g_vBorderLayerAmount3 < Default3(1, 1, 1); UiType(VectorText); UiGroup("Layer 3/Border Effects/40"); >;
	int g_nBorderBlendMode3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Mod2x,2=Blend"); UiType(Enum); UiGroup("Layer 3/Border Effects/50"); >;
	float4 g_vBorderTint3 < Default4(0.5, 0.5, 0.5, 1); UiType(Color); UiGroup("Layer 3/Border Effects/51"); Expression((g_nBorderBlendMode3==1) ? this : SrgbGammaToLinear(this)); >;
	float g_flBorderRoughnessStrength3 < UiType(Slider); UiGroup("Layer 3/Border Effects/60"); >;
	float g_flBorderRoughness3 < Default(0.5); UiType(Slider); UiGroup("Layer 3/Border Effects/61"); >;
	
	// Layer 1
	bool g_bModelTint1 < Default(1); UiType(CheckBox); UiGroup("Layer 1/Color"); >;
	float g_flBiPlanarTiling1 < Default(196); Range(0, 512); UiType(Slider); UiGroup("Layer 1/UV"); Expression(1/this); >;
	float4 g_vScaleRotationTranslation1 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 1/UV"); >;
	bool g_bAcceptStaticOverlays1 < Default(1); UiType(CheckBox); UiGroup("Layer 1/Static Overlay/10"); >;
	float g_flOverlayStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/Uv Overlay/10"); >;
	float g_flWorldOverlayStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/World Overlay/10"); >;
	float2 g_vWorldOverlayStrengths1 < Default(1); UiType(VectorText); UiGroup("Layer 1/World Overlay/10"); >;
	float g_flOverlayNormalStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/Uv Overlay/11"); >;
	float g_flStaticOverlaysTintMaskInfluence1 < Range(-2, 2); UiType(Slider); UiGroup("Layer 1/Static Overlay/11"); >;
	float g_flOverlayRoughnessStrength1 < UiType(Slider); UiGroup("Layer 1/Uv Overlay/13"); >;
	int g_nOverlayTintMask1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 1/Uv Overlay/20"); >;
	int g_nWorldOverlayTintMask1 < Default(1); Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 1/World Overlay/20"); >;
	
	// SPIR-V reflection failed for backend HLSL:
	// cbuffer ID 5618 (name: _Globals_), member index 7 (name: g_mTextureColorTint1) cannot be expressed with either HLSL packing layout or packoffset.
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
	#extension GL_EXT_samplerless_texture_functions : require
	
	struct _702
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
	    uint g_tColor2;
	    uint g_tNormalRoughness2;
	    uint g_tPacked2;
	    int g_bMaskColorTint2;
	    int g_bMaskVertexColorTint2;
	    float g_fVertexColorStrength2;
	    mat4 g_mTextureColorTint2;
	    mat4 g_mAlbedoColorCorrect2;
	    float g_fLayerNormalStrength2;
	    float g_fLayerSelfIllumScale2;
	    vec3 g_vLayerSelfIllumTint2;
	    vec2 g_vLayerRoughnessContrastBrightness2;
	    vec2 g_vLayerTintMaskContrastBrightness2;
	    vec2 g_vLayerMetalnessContrastBrightness2;
	    float g_flOverrideBloomAmount2;
	    uint g_tRevealMask2;
	    float g_flRevealOffset2;
	    float g_flRevealSoftness2;
	    int g_bRevealInvert2;
	    vec4 g_vRevealUvTransform2;
	    int g_bRevealUseSecondaryUv2;
	    int g_bBorderEffects2;
	    vec2 g_vBorderWidth2;
	    vec2 g_vBorderSoftness2;
	    vec2 g_vBorderLayerAmount2;
	    int g_nBorderBlendMode2;
	    vec4 g_vBorderTint2;
	    float g_flBorderRoughnessStrength2;
	    float g_flBorderRoughness2;
	    int g_bAcceptStaticOverlays1;
	    int g_bAcceptStaticOverlays2;
	    float g_flStaticOverlaysTintMaskInfluence1;
	    float g_flStaticOverlaysTintMaskInfluence2;
	    int g_bModelTint1;
	    int g_bModelTint2;
	    vec4 g_vUvTransform1;
	    vec4 g_vUvTransform2;
	};
	
	layout(set = 1) uniform _702 _Globals_;
	
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
	layout(location = 5) in vec2 input_5;
	layout(location = 0) out vec4 output_0;
	layout(location = 1) out vec4 output_1;
	layout(location = 2) out vec4 output_2;
	layout(location = 3) out vec2 output_3;
	
	void main()
	{
	    float _12157 = 1.0 / length(input_0);
	    vec3 _6367 = input_4.xyz * _12157;
	    vec3 _23716 = (cross(input_0, input_4.xyz) * ((input_4.w > 0.0) ? 1.0 : (-1.0))) * _12157;
	    vec3 _22622 = vec3(float(input_5.x < 1.0), input_5.x, 0.0).xyz;
	    vec3 _15090 = _22622 * vec3(greaterThan(_22622, vec3(9.9999997473787516355514526367188e-06)));
	    float _16877 = _15090.y;
	    vec4 _8288;
	    vec3 _13136;
	    vec4 _15993;
	    vec4 _16305;
	    SPIRV_CROSS_BRANCH
	    if (_15090.x > 0.0)
	    {
	        vec2 _15733 = input_1.xy + _Globals_.g_vUvTransform1.zw;
	        vec2 _11084 = vec2((_Globals_.g_vUvTransform1.y * _15733.x) - (_Globals_.g_vUvTransform1.x * _15733.y), dot(_Globals_.g_vUvTransform1.xy, _15733.xy)).xy;
	        vec4 _19415 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness1], g_bindless_Sampler[_Globals_.g_sAniso]), _11084);
	        float _9413 = _19415.x;
	        float _19725 = _19415.y;
	        float _16783 = (_9413 + _19725) - 1.00392162799835205078125;
	        float _11176 = _9413 - _19725;
	        vec3 _13706 = normalize(vec3(vec2(_16783, _11176), (1.0 - abs(_16783)) - abs(_11176)));
	        vec3 _9822 = abs(_13706);
	        vec2 _12143 = ((-vec2(_13706.x, (-1.0) * _13706.y)) / vec2(max(_9822.z, 0.0078125 * max(_9822.x, _9822.y)))) * _Globals_.g_fLayerNormalStrength1;
	        _13136 = (_6367 * _12143.x) + (_23716 * _12143.y);
	        _16305 = _19415.xyzw;
	        _15993 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tPacked1], g_bindless_Sampler[_Globals_.g_sAniso]), _11084).xyzw;
	        _8288 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor1], g_bindless_Sampler[_Globals_.g_sAniso]), _11084).xyzw;
	    }
	    else
	    {
	        _13136 = vec3(0.0);
	        _16305 = vec4(0.0);
	        _15993 = vec4(0.0);
	        _8288 = vec4(0.0);
	    }
	    bool _10861 = _16877 > 0.0;
	    vec3 _13137;
	    vec4 _13960;
	    float _16306;
	    vec4 _17114;
	    vec4 _23607;
	    SPIRV_CROSS_BRANCH
	    if (_10861)
	    {
	        vec2 _15734 = input_1.xy + _Globals_.g_vUvTransform2.zw;
	        vec2 _20579;
	        if (_Globals_.g_bRevealUseSecondaryUv2 != 0)
	        {
	            _20579 = input_1.zw;
	        }
	        else
	        {
	            _20579 = input_1.xy;
	        }
	        vec2 _20772 = _20579 + _Globals_.g_vRevealUvTransform2.zw;
	        vec2 _11085 = vec2((_Globals_.g_vUvTransform2.y * _15734.x) - (_Globals_.g_vUvTransform2.x * _15734.y), dot(_Globals_.g_vUvTransform2.xy, _15734.xy)).xy;
	        vec4 _19719 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tNormalRoughness2], g_bindless_Sampler[_Globals_.g_sAniso]), _11085);
	        float _9414 = _19719.x;
	        float _19726 = _19719.y;
	        float _16784 = (_9414 + _19726) - 1.00392162799835205078125;
	        float _11177 = _9414 - _19726;
	        vec3 _13707 = normalize(vec3(vec2(_16784, _11177), (1.0 - abs(_16784)) - abs(_11177)));
	        vec3 _9823 = abs(_13707);
	        vec2 _12144 = ((-vec2(_13707.x, (-1.0) * _13707.y)) / vec2(max(_9823.z, 0.0078125 * max(_9823.x, _9823.y)))) * _Globals_.g_fLayerNormalStrength2;
	        _13137 = (_6367 * _12144.x) + (_23716 * _12144.y);
	        _16306 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tRevealMask2], g_bindless_Sampler[_Globals_.g_sAniso]), vec2((_Globals_.g_vRevealUvTransform2.y * _20772.x) - (_Globals_.g_vRevealUvTransform2.x * _20772.y), dot(_Globals_.g_vRevealUvTransform2.xy, _20772.xy)).xy).x;
	        _17114 = _19719.xyzw;
	        _13960 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tPacked2], g_bindless_Sampler[_Globals_.g_sAniso]), _11085).xyzw;
	        _23607 = texture(sampler2D(g_bindless_Texture2D_float4[_Globals_.g_tColor2], g_bindless_Sampler[_Globals_.g_sAniso]), _11085).xyzw;
	    }
	    else
	    {
	        _13137 = vec3(0.0);
	        _16306 = 0.5;
	        _17114 = vec4(0.0);
	        _13960 = vec4(0.0);
	        _23607 = vec4(0.0);
	    }
	    float _19763 = saturate((((_16305.z - 0.5) + _Globals_.g_vLayerRoughnessContrastBrightness1.y) * _Globals_.g_vLayerRoughnessContrastBrightness1.x) + 0.5);
	    float _19764 = saturate((((_17114.z - 0.5) + _Globals_.g_vLayerRoughnessContrastBrightness2.y) * _Globals_.g_vLayerRoughnessContrastBrightness2.x) + 0.5);
	    float _19765 = saturate((((_8288.w - 0.5) + _Globals_.g_vLayerTintMaskContrastBrightness1.y) * _Globals_.g_vLayerTintMaskContrastBrightness1.x) + 0.5);
	    float _19766 = saturate((((_23607.w - 0.5) + _Globals_.g_vLayerTintMaskContrastBrightness2.y) * _Globals_.g_vLayerTintMaskContrastBrightness2.x) + 0.5);
	    float _19767 = saturate((((_15993.y - 0.5) + _Globals_.g_vLayerMetalnessContrastBrightness1.y) * _Globals_.g_vLayerMetalnessContrastBrightness1.x) + 0.5);
	    float _10825 = _15993.x * _Globals_.g_fLayerSelfIllumScale1;
	    float _10826 = _13960.x * _Globals_.g_fLayerSelfIllumScale2;
	    vec4 _18068 = vec4(_8288.xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect1;
	    vec4 _18334 = vec4(_23607.xyz, 1.0) * _Globals_.g_mAlbedoColorCorrect2;
	    vec3 _16504 = mix(_18068.xyz, (vec4(_18068.xyz, 1.0) * _Globals_.g_mTextureColorTint1).xyz, vec3((_Globals_.g_bMaskColorTint1 != 0) ? _19765 : 1.0));
	    vec3 _16505 = mix(_18334.xyz, (vec4(_18334.xyz, 1.0) * _Globals_.g_mTextureColorTint2).xyz, vec3((_Globals_.g_bMaskColorTint2 != 0) ? _19766 : 1.0));
	    vec3 _20966 = mix(_16504, _16504 * input_3.xyz, vec3((_Globals_.g_bModelTint1 != 0) ? (((_Globals_.g_bMaskVertexColorTint1 != 0) ? _19765 : 1.0) * _Globals_.g_fVertexColorStrength1) : 0.0));
	    vec3 _19124 = mix(_16505, _16505 * input_3.xyz, vec3((_Globals_.g_bModelTint2 != 0) ? (((_Globals_.g_bMaskVertexColorTint2 != 0) ? _19766 : 1.0) * _Globals_.g_fVertexColorStrength2) : 0.0));
	    vec3 _16651 = (_20966 * _10825) * _Globals_.g_vLayerSelfIllumTint1;
	    float _21709;
	    if (_Globals_.g_bRevealInvert2 != 0)
	    {
	        _21709 = 1.0 - _16306;
	    }
	    else
	    {
	        _21709 = _16306;
	    }
	    float _20091;
	    do
	    {
	        float _23252 = _Globals_.g_flRevealOffset2 * 0.5;
	        float _9723 = 0.5 + _23252;
	        if (_21709 < 0.5)
	        {
	            _20091 = saturate(_21709 * 2.0) * _9723;
	            break;
	        }
	        else
	        {
	            _20091 = (saturate((_21709 - 0.5) * 2.0) * (0.5 - _23252)) + _9723;
	            break;
	        }
	        break; // unreachable workaround
	    } while(false);
	    vec3 _6616;
	    float _13140;
	    float _13694;
	    vec3 _16308;
	    if (_Globals_.g_bBorderEffects2 != 0)
	    {
	        float _13139;
	        vec3 _16307;
	        vec3 _16479;
	        float _17190;
	        do
	        {
	            if (_16877 == 0.0)
	            {
	                _13139 = _19764;
	                _16307 = _19124;
	                _17190 = _19763;
	                _16479 = _20966;
	                break;
	            }
	            float _8689 = (saturate(clamp(_20091, 9.9999997473787516355514526367188e-05, 0.99989998340606689453125)) * ((1.0 - _Globals_.g_flRevealSoftness2) - _Globals_.g_flRevealSoftness2)) + _Globals_.g_flRevealSoftness2;
	            float _7455;
	            float _11924;
	            float _13138;
	            if (_16877 < _8689)
	            {
	                _13138 = _Globals_.g_vBorderSoftness2.x;
	                _11924 = max(9.9999997473787516355514526367188e-05, _8689 - _Globals_.g_vBorderWidth2.x);
	                _7455 = max(9.9999997473787516355514526367188e-05, _8689 - (0.5 * _Globals_.g_vBorderWidth2.x));
	            }
	            else
	            {
	                _13138 = _Globals_.g_vBorderSoftness2.y;
	                _11924 = min(0.99989998340606689453125, _8689 + _Globals_.g_vBorderWidth2.y);
	                _7455 = min(0.99989998340606689453125, _8689 + (0.5 * _Globals_.g_vBorderWidth2.y));
	            }
	            vec3 _12221 = vec3(_Globals_.g_vBorderLayerAmount2, 0.0) * smoothstep(mix(_7455, _11924, _13138), mix(_7455, _8689, _13138), _16877);
	            float _9851 = _12221.x;
	            float _24001 = _12221.y;
	            vec3 _13212;
	            vec3 _15670;
	            switch (_Globals_.g_nBorderBlendMode2)
	            {
	                case 0:
	                {
	                    _13212 = _19124 * mix(vec3(1.0), _Globals_.g_vBorderTint2.xyz, vec3(_24001 * _Globals_.g_vBorderTint2.w));
	                    _15670 = _20966 * mix(vec3(1.0), _Globals_.g_vBorderTint2.xyz, vec3(_9851 * _Globals_.g_vBorderTint2.w));
	                    break;
	                }
	                case 1:
	                {
	                    vec3 _9797 = _Globals_.g_vBorderTint2.xyz * 1.99215686321258544921875;
	                    _13212 = _19124 * mix(vec3(1.0), _9797, vec3(_24001 * _Globals_.g_vBorderTint2.w));
	                    _15670 = _20966 * mix(vec3(1.0), _9797, vec3(_9851 * _Globals_.g_vBorderTint2.w));
	                    break;
	                }
	                case 2:
	                {
	                    _13212 = mix(_19124, _Globals_.g_vBorderTint2.xyz, vec3(_24001 * _Globals_.g_vBorderTint2.w));
	                    _15670 = mix(_20966, _Globals_.g_vBorderTint2.xyz, vec3(_9851 * _Globals_.g_vBorderTint2.w));
	                    break;
	                }
	                default:
	                {
	                    _13212 = _19124;
	                    _15670 = _20966;
	                    break;
	                }
	            }
	            _13139 = mix(_19764, _Globals_.g_flBorderRoughness2, _Globals_.g_flBorderRoughnessStrength2 * _24001);
	            _16307 = _13212;
	            _17190 = mix(_19763, _Globals_.g_flBorderRoughness2, _Globals_.g_flBorderRoughnessStrength2 * _9851);
	            _16479 = _15670;
	            break;
	        } while(false);
	        _13140 = _13139;
	        _16308 = _16307;
	        _13694 = _17190;
	        _6616 = _16479;
	    }
	    else
	    {
	        _13140 = _19764;
	        _16308 = _19124;
	        _13694 = _19763;
	        _6616 = _20966;
	    }
	    float _12885;
	    if (_Globals_.g_bAcceptStaticOverlays1 != 0)
	    {
	        float _19161;
	        if (_Globals_.g_flStaticOverlaysTintMaskInfluence1 < 0.0)
	        {
	            _19161 = 1.0 - _19765;
	        }
	        else
	        {
	            _19161 = _19765;
	        }
	        _12885 = max(0.0, 1.0 - (abs(_Globals_.g_flStaticOverlaysTintMaskInfluence1) * _19161));
	    }
	    else
	    {
	        _12885 = 0.0;
	    }
	    float _13141;
	    vec3 _13407;
	    vec3 _14948;
	    vec3 _16309;
	    float _17115;
	    float _17116;
	    float _17117;
	    float _17118;
	    SPIRV_CROSS_BRANCH
	    if (_10861)
	    {
	        float _18229;
	        do
	        {
	            if (_16877 == 1.0)
	            {
	                _18229 = 1.0;
	                break;
	            }
	            _18229 = smoothstep(-_Globals_.g_flRevealSoftness2, _Globals_.g_flRevealSoftness2, _16877 - ((saturate(clamp(_20091, 9.9999997473787516355514526367188e-05, 0.99989998340606689453125)) * ((1.0 - _Globals_.g_flRevealSoftness2) - _Globals_.g_flRevealSoftness2)) + _Globals_.g_flRevealSoftness2));
	            break;
	        } while(false);
	        vec3 _17364 = vec3(_18229);
	        float _7934;
	        if (_Globals_.g_bAcceptStaticOverlays2 != 0)
	        {
	            float _19162;
	            if (_Globals_.g_flStaticOverlaysTintMaskInfluence2 < 0.0)
	            {
	                _19162 = 1.0 - _19766;
	            }
	            else
	            {
	                _19162 = _19766;
	            }
	            _7934 = max(0.0, 1.0 - (abs(_Globals_.g_flStaticOverlaysTintMaskInfluence2) * _19162));
	        }
	        else
	        {
	            _7934 = 0.0;
	        }
	        _13141 = mix(_Globals_.g_flOverrideBloomAmount1, _Globals_.g_flOverrideBloomAmount2, _18229);
	        _16309 = mix(_16651, (_19124 * _10826) * _Globals_.g_vLayerSelfIllumTint2, _17364);
	        _17115 = mix(_10825, _10826, _18229);
	        _17116 = mix(_12885, _7934, _18229);
	        _17117 = mix(_13694, _13140, _18229);
	        _17118 = mix(_19767, saturate((((_13960.y - 0.5) + _Globals_.g_vLayerMetalnessContrastBrightness2.y) * _Globals_.g_vLayerMetalnessContrastBrightness2.x) + 0.5), _18229);
	        _14948 = mix(_6616, _16308, _17364);
	        _13407 = mix(_13136, _13137, _17364);
	    }
	    else
	    {
	        _13141 = _Globals_.g_flOverrideBloomAmount1;
	        _16309 = _16651;
	        _17115 = _10825;
	        _17116 = _12885;
	        _17117 = _13694;
	        _17118 = _19767;
	        _14948 = _6616;
	        _13407 = _13136;
	    }
	    float _18612 = saturate(_17115 * 0.100000001490116119384765625);
	    float _19133;
	    if (_18612 != 0.0)
	    {
	        _19133 = _18612 + ((texelFetch(g_bindless_Texture2D_float4[PerViewConstantBufferCitadel_t._m0], ivec3(ivec2(uvec2(gl_FragCoord.xy).xy & uvec2(PerViewConstantBufferCitadel_t._m1)), 0).xy, 0).xyz * 0.0039215688593685626983642578125) - vec3(0.00196078442968428134918212890625)).z;
	    }
	    else
	    {
	        _19133 = _18612;
	    }
	    output_0 = vec4((normalize((input_0 * _12157) - _13407).xyz * 0.5) + vec3(0.5), 0.0);
	    output_1 = vec4(((_14948 * 0.100000001490116119384765625) + _16309) / vec3(0.100000001490116119384765625 + _17115), float(uint((_17116 > 0.5) ? 0 : 1) | 32u) * 0.0039215688593685626983642578125);
	    output_2 = vec4(_17117, _13141, _19133, _17118);
	    output_3 = vec2(0.0);
	}
	
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	TextureAttribute(RepresentativeTexture, g_tColor1);
	BoolAttribute(SupportsLightmapping, true);
	BoolAttribute(SupportsMappingDimensions, true);
	StringAttribute(MaterialLayerRefType, environment_layer);
	StringAttribute(MaterialLayerRefFileEnding, _layer);
	
	#if (S_LAYER_COUNT == 1)
		IntAttribute(MaterialLayerCount, 3);
	#endif
	#if (S_LAYER_COUNT == 0)
		IntAttribute(MaterialLayerCount, 2);
	#endif
}

RTX
{
	StaticCombo( S_WORLD_OVERLAY_USE_OBJECT_SPACE, F_WORLD_OVERLAY_USE_OBJECT_SPACE );
	StaticCombo( S_MODE_TOOLS_WIREFRAME, 0..1 );
	StaticCombo( S_UV_OVERLAY, F_UV_OVERLAY );
	StaticCombo( S_LAYER1_BIPLANAR, F_LAYER1_BIPLANAR );
	StaticCombo( S_LAYER2_BIPLANAR, F_LAYER2_BIPLANAR );
	StaticCombo( S_LAYER3_BIPLANAR, F_LAYER3_BIPLANAR );
	StaticCombo( S_WORLD_OVERLAY, F_WORLD_OVERLAY );
	StaticCombo( S_LAYER_COUNT, F_LAYER_COUNT );
	StaticComboRule( Allow0( S_WORLD_OVERLAY, S_LAYER1_BIPLANAR, S_LAYER2_BIPLANAR, S_LAYER3_BIPLANAR ) );
	StaticComboRule( Allow0( S_UV_OVERLAY ) );
	StaticComboRule( Allow0( S_MODE_TOOLS_WIREFRAME ) );
	StaticComboRule( Requires( S_LAYER3_BIPLANAR, S_LAYER_COUNT==1 ) );
	StaticComboRule( Requires( S_WORLD_OVERLAY_USE_OBJECT_SPACE, S_WORLD_OVERLAY ) );
	DynamicCombo( D_COMPRESSED_NORMALS_AND_TANGENTS, 0..1 );
	DynamicCombo( D_CS_VERTEX_ANIMATION, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_LIGHTMAP, 0..1 );
	DynamicCombo( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, 0..1 );
	DynamicComboRule( Allow1( D_CS_VERTEX_ANIMATION, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow1( S_MODE_TOOLS_WIREFRAME, D_BAKED_LIGHTING_FROM_LIGHTMAP, D_BAKED_LIGHTING_FROM_VERTEX_STREAM ) );
	DynamicComboRule( Allow0( D_BAKED_LIGHTING_FROM_VERTEX_STREAM, D_BAKED_LIGHTING_FROM_LIGHTMAP ) );
	DynamicComboRule( Allow0( D_COMPRESSED_NORMALS_AND_TANGENTS, D_CS_VERTEX_ANIMATION ) );
	
	bool g_bOverlayTintMaskInvert1 < UiType(CheckBox); Expression(g_nOverlayTintMask1==2); >;
	bool g_bOverlayTintMaskInvert2 < UiType(CheckBox); Expression(g_nOverlayTintMask2==2); >;
	bool g_bOverlayTintMaskInvert3 < UiType(CheckBox); Expression(g_nOverlayTintMask3==2); >;
	bool g_bOverlayUseTintMask1 < UiType(CheckBox); Expression(g_nOverlayTintMask1!=0); >;
	bool g_bOverlayUseTintMask2 < UiType(CheckBox); Expression(g_nOverlayTintMask2!=0); >;
	bool g_bOverlayUseTintMask3 < UiType(CheckBox); Expression(g_nOverlayTintMask3!=0); >;
	bool g_bTexCoord2ScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoord2UByModelScaleAxis!=0 || g_nScaleTexCoord2VByModelScaleAxis!=0); >;
	bool g_bTexCoordScaleByModel < UiType(CheckBox); Expression(g_nScaleTexCoordUByModelScaleAxis!=0 || g_nScaleTexCoordVByModelScaleAxis!=0); >;
	bool g_bUvOverlay < UiType(CheckBox); Expression(F_UV_OVERLAY ? 1 : 0); >;
	float4x4 g_mAlbedoColorCorrect1 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness1,TextureAverageColor(g_tColor1))); >;
	float4x4 g_mAlbedoColorCorrect2 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness2,TextureAverageColor(g_tColor2))); >;
	float4x4 g_mAlbedoColorCorrect3 < Expression(MatrixColorCorrect2(g_vAlbedoContrastSaturationBrightness3,TextureAverageColor(g_tColor3))); >;
	float4x4 g_mTextureColorTint1 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint1),.85,g_nTextureColorTintMode1)); >;
	float4x4 g_mTextureColorTint2 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint2),.85,g_nTextureColorTintMode2)); >;
	float4x4 g_mTextureColorTint3 < Expression(MatrixColorTint3(SrgbGammaToLinear(g_vColorTint3),.85,g_nTextureColorTintMode3)); >;
	Texture2D g_tColor1 < Channel(RGB, Box(TextureColor1), Srgb); Channel(A, Box(TextureTintMask1), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor2 < Channel(RGB, Box(TextureColor2), Srgb); Channel(A, Box(TextureTintMask2), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColor3 < Channel(RGB, Box(TextureColor3), Srgb); Channel(A, Box(TextureTintMask3), Linear); OutputFormat(BC7); SrgbRead(true); >;
	Texture2D g_tColorOverlay < Channel(RGB, ArtistDefined(TextureColorOverlay), Srgb); OutputFormat(DXT1); SrgbRead(true); >;
	Texture2D g_tNormalRoughness1 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal1, TextureRoughness1), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness2 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal2, TextureRoughness2), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughness3 < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormal3, TextureRoughness3), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tNormalRoughnessOverlay < Channel(RGBA, HemiOctIsoRoughness_RG_B(TextureNormalOverlay, TextureRoughnessOverlay), Linear); OutputFormat(BC7); SrgbRead(false); >;
	Texture2D g_tPacked1 < Channel(R, Box(TextureSelfIllum1), Linear); Channel(G, Box(TextureMetalness1), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tPacked2 < Channel(R, Box(TextureSelfIllum2), Linear); Channel(G, Box(TextureMetalness2), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tPacked3 < Channel(R, Box(TextureSelfIllum3), Linear); Channel(G, Box(TextureMetalness3), Linear); OutputFormat(ATI2N); SrgbRead(false); >;
	Texture2D g_tRevealMask2 < Channel(R, Box(TextureRevealMask2), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tRevealMask3 < Channel(R, Box(TextureRevealMask3), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	Texture2D g_tRevealOverlay < Channel(R, Box(TextureRevealOverlay), Linear); OutputFormat(ATI1N); SrgbRead(false); >;
	float4 g_vRevealUvTransform2 < UiType(VectorText); Expression(v0 = g_vRevealScaleRotationTranslation2.x;
		v1 = g_vRevealScaleRotationTranslation2.y*3.1415927/180;
		v2 = g_vRevealScaleRotationTranslation2.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vRevealUvTransform3 < UiType(VectorText); Expression(v0 = g_vRevealScaleRotationTranslation3.x;
		v1 = g_vRevealScaleRotationTranslation3.y*3.1415927/180;
		v2 = g_vRevealScaleRotationTranslation3.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float2 g_vTexCoord2ScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoord2UByModelScaleOrigin/2,g_nScaleTexCoord2VByModelScaleOrigin/2)); >;
	float4 g_vTexCoord2ScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoord2UByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2UByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoord2ScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoord2VByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoord2VByModelScaleAxis==0) ? 1 : 0)); >;
	float2 g_vTexCoordScaleByModelOrigin < UiType(VectorText); Expression(float2(g_nScaleTexCoordUByModelScaleOrigin/2,1-g_nScaleTexCoordVByModelScaleOrigin/2)); >;
	float4 g_vTexCoordScaleByModelU < UiType(VectorText); Expression(float4((g_nScaleTexCoordUByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordUByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vTexCoordScaleByModelV < UiType(VectorText); Expression(float4((g_nScaleTexCoordVByModelScaleAxis==1) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==2) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==3) ? 1 : 0,(g_nScaleTexCoordVByModelScaleAxis==0) ? 1 : 0)); >;
	float4 g_vUvTransform1 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation1.x;
		v1 = g_vScaleRotationTranslation1.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation1.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransform2 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation2.x;
		v1 = g_vScaleRotationTranslation2.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation2.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransform3 < UiType(VectorText); Expression(v0 = g_vScaleRotationTranslation3.x;
		v1 = g_vScaleRotationTranslation3.y*3.1415927/180;
		v2 = g_vScaleRotationTranslation3.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	float4 g_vUvTransformOverlay < UiType(VectorText); Expression(v0 = g_vOverlayScaleRotationTranslation.x;
		v1 = g_vOverlayScaleRotationTranslation.y*3.1415927/180;
		v2 = g_vOverlayScaleRotationTranslation.zw/v0;
		float4(v0*sin(v1),v0*cos(v1),v2.x,v2.y)); >;
	
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
	
	// ENVIRONMENT_LAYER 2
	CreateInputTexture2D(TextureColor2, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 2 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness2, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 2 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal2, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 2 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness2, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 2 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum2, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 2 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask2, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 2 / Tint Mask", Default4(1, 1, 1, 0));
	bool g_bMaskColorTint2 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	bool g_bMaskVertexColorTint2 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float g_fLayerNormalStrength2 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / Normal"); >;
	float g_fLayerSelfIllumScale2 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / SelfIllum"); >;
	float g_fVertexColorStrength2 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	int g_nTextureColorTintMode2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness2 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float3 g_vColorTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 2 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Roughness"); >;
	float3 g_vLayerSelfIllumTint2 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 2 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness2 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 2 / Tint Mask"); >;
	
	// ENVIRONMENT_LAYER 3
	CreateInputTexture2D(TextureColor3, Srgb, 8, "", "_color", "ENVIRONMENT_LAYER 3 / Color", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureMetalness3, Linear, 8, "", "_metal", "ENVIRONMENT_LAYER 3 / Metalness", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureNormal3, Linear, 8, "NormalizeNormals", "_normal", "ENVIRONMENT_LAYER 3 / Normal", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughness3, Linear, 8, "Inverse", "_rough", "ENVIRONMENT_LAYER 3 / Roughness", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureSelfIllum3, Linear, 8, "", "_selfillum", "ENVIRONMENT_LAYER 3 / SelfIllum", Default4(0, 0, 0, 0));
	CreateInputTexture2D(TextureTintMask3, Linear, 8, "", "_mask", "ENVIRONMENT_LAYER 3 / Tint Mask", Default4(1, 1, 1, 0));
	bool g_bMaskColorTint3 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	bool g_bMaskVertexColorTint3 < Default(1); UiType(CheckBox); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float g_fLayerNormalStrength3 < Default(1); Range(0, 2); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / Normal"); >;
	float g_fLayerSelfIllumScale3 < Default(1); Range(0, 10); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / SelfIllum"); >;
	float g_fVertexColorStrength3 < Default(1); UiType(Slider); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	int g_nTextureColorTintMode3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Preserve Luminance,2=Mod2X"); UiType(Enum); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float3 g_vAlbedoContrastSaturationBrightness3 < Default3(1, 1, 1); Range3(0, 0, 0, 2, 2, 2); Attribute("TextureColor1"); UiType(ColorCorrection); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float3 g_vColorTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 3 / Color"); >;
	float2 g_vLayerMetalnessContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Metalness"); >;
	float2 g_vLayerRoughnessContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Roughness"); >;
	float3 g_vLayerSelfIllumTint3 < Default3(1, 1, 1); UiType(Color); UiGroup("ENVIRONMENT_LAYER 3 / SelfIllum"); >;
	float2 g_vLayerTintMaskContrastBrightness3 < Default(1); Range2(0, -0.5, 2, 0.5); UiType(VectorText); UiGroup("ENVIRONMENT_LAYER 3 / Tint Mask"); >;
	
	// Uv Overlay
	CreateInputTexture2D(TextureColorOverlay, Linear, 8, "", "_color", "Uv Overlay/10", Default4(0.5, 0.5, 0.5, 0));
	CreateInputTexture2D(TextureNormalOverlay, Linear, 8, "NormalizeNormals", "_normal", "Uv Overlay/11", Default4(0.5, 0.5, 1, 0));
	CreateInputTexture2D(TextureRoughnessOverlay, Linear, 8, "Inverse", "_rough", "Uv Overlay/12", Default4(0.5, 0.5, 0.5, 0));
	bool g_bUseSecondaryUvForOverlay < Default(1); UiType(CheckBox); UiGroup("Uv Overlay/13"); >;
	float4 g_vOverlayScaleRotationTranslation < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Uv Overlay/14"); >;
	float g_flOverlayDarknessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("Uv Overlay/20"); >;
	float g_flOverlayBrightnessContrast < Default(1); Range(0.2, 2); UiType(Slider); UiGroup("Uv Overlay/30"); >;
	
	// Layer 2
	bool g_bModelTint2 < Default(1); UiType(CheckBox); UiGroup("Layer 2/Color"); >;
	bool g_bRevealUseSecondaryUv2 < UiType(CheckBox); UiGroup("Layer 2/Reveal"); >;
	float4 g_vRevealScaleRotationTranslation2 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 2/Reveal"); >;
	float4 g_vScaleRotationTranslation2 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 2/UV"); >;
	CreateInputTexture2D(TextureRevealOverlay, Linear, 8, "", "_blend", "Layer 2/Uv Reveal Overlay/1", Default4(0, 0, 0, 0));
	bool g_bBorderEffects2 < UiType(CheckBox); UiGroup("Layer 2/Border Effects/1"); >;
	bool g_bRevealOverlayInvert2 < UiType(CheckBox); UiGroup("Layer 2/Uv Reveal Overlay/2"); >;
	float g_flRevealOverlayStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Reveal Overlay/3"); >;
	CreateInputTexture2D(TextureRevealMask2, Linear, 8, "", "_blend", "Layer 2/Reveal/10", Default4(0.5, 0.5, 0.5, 0));
	float g_flOverlayStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Overlay/10"); >;
	float2 g_vBorderWidth2 < Default2(0.125, 0.125); Range2(0.01, 0.01, 0.5, 0.5); UiType(VectorText); UiGroup("Layer 2/Border Effects/10"); >;
	bool g_bRevealInvert2 < UiType(CheckBox); UiGroup("Layer 2/Reveal/11"); >;
	float g_flOverlayNormalStrength2 < Default(1); UiType(Slider); UiGroup("Layer 2/Uv Overlay/11"); >;
	float g_flOverlayRoughnessStrength2 < UiType(Slider); UiGroup("Layer 2/Uv Overlay/13"); >;
	float g_flRevealOffset2 < Range(-0.95, 0.95); UiType(Slider); UiGroup("Layer 2/Reveal/20"); >;
	int g_nOverlayTintMask2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 2/Uv Overlay/20"); >;
	float2 g_vBorderSoftness2 < Default2(0.5, 0.5); UiType(VectorText); UiGroup("Layer 2/Border Effects/20"); >;
	float g_flRevealSoftness2 < Default(0.125); Range(0, 0.5); UiType(Slider); UiGroup("Layer 2/Reveal/30"); >;
	float2 g_vBorderLayerAmount2 < Default2(1, 1); UiType(VectorText); UiGroup("Layer 2/Border Effects/40"); >;
	int g_nBorderBlendMode2 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Mod2x,2=Blend"); UiType(Enum); UiGroup("Layer 2/Border Effects/50"); >;
	float4 g_vBorderTint2 < Default4(0.5, 0.5, 0.5, 1); UiType(Color); UiGroup("Layer 2/Border Effects/51"); Expression((g_nBorderBlendMode2==1) ? this : SrgbGammaToLinear(this)); >;
	float g_flBorderRoughnessStrength2 < UiType(Slider); UiGroup("Layer 2/Border Effects/60"); >;
	float g_flBorderRoughness2 < Default(0.5); UiType(Slider); UiGroup("Layer 2/Border Effects/61"); >;
	
	// Layer 3
	bool g_bModelTint3 < Default(1); UiType(CheckBox); UiGroup("Layer 3/Color"); >;
	bool g_bRevealUseSecondaryUv3 < UiType(CheckBox); UiGroup("Layer 3/Reveal"); >;
	float4 g_vRevealScaleRotationTranslation3 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 3/Reveal"); >;
	float4 g_vScaleRotationTranslation3 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 3/UV"); >;
	bool g_bBorderEffects3 < UiType(CheckBox); UiGroup("Layer 3/Border Effects/1"); >;
	CreateInputTexture2D(TextureRevealMask3, Linear, 8, "", "_blend", "Layer 3/Reveal/10", Default4(0.5, 0.5, 0.5, 0));
	float g_flOverlayStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/Uv Overlay/10"); >;
	float2 g_vBorderWidth3 < Default2(0.125, 0.125); Range2(0.01, 0.01, 0.5, 0.5); UiType(VectorText); UiGroup("Layer 3/Border Effects/10"); >;
	bool g_bRevealInvert3 < UiType(CheckBox); UiGroup("Layer 3/Reveal/11"); >;
	float g_flOverlayNormalStrength3 < Default(1); UiType(Slider); UiGroup("Layer 3/Uv Overlay/11"); >;
	float g_flOverlayRoughnessStrength3 < UiType(Slider); UiGroup("Layer 3/Uv Overlay/13"); >;
	float g_flRevealOffset3 < Range(-0.95, 0.95); UiType(Slider); UiGroup("Layer 3/Reveal/20"); >;
	int g_nOverlayTintMask3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 3/Uv Overlay/20"); >;
	float2 g_vBorderSoftness3 < Default2(0.5, 0.5); UiType(VectorText); UiGroup("Layer 3/Border Effects/20"); >;
	float g_flRevealSoftness3 < Default(0.125); Range(0, 0.5); UiType(Slider); UiGroup("Layer 3/Reveal/30"); >;
	float3 g_vBorderLayerAmount3 < Default3(1, 1, 1); UiType(VectorText); UiGroup("Layer 3/Border Effects/40"); >;
	int g_nBorderBlendMode3 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Multiply,1=Mod2x,2=Blend"); UiType(Enum); UiGroup("Layer 3/Border Effects/50"); >;
	float4 g_vBorderTint3 < Default4(0.5, 0.5, 0.5, 1); UiType(Color); UiGroup("Layer 3/Border Effects/51"); Expression((g_nBorderBlendMode3==1) ? this : SrgbGammaToLinear(this)); >;
	float g_flBorderRoughnessStrength3 < UiType(Slider); UiGroup("Layer 3/Border Effects/60"); >;
	float g_flBorderRoughness3 < Default(0.5); UiType(Slider); UiGroup("Layer 3/Border Effects/61"); >;
	
	// Layer 1
	bool g_bModelTint1 < Default(1); UiType(CheckBox); UiGroup("Layer 1/Color"); >;
	float4 g_vScaleRotationTranslation1 < Default(1); Range4(0.125, 0, -1, -1, 8, 360, 1, 1); UiType(VectorText); UiGroup("Layer 1/UV"); >;
	float g_flOverlayStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/Uv Overlay/10"); >;
	float g_flOverlayNormalStrength1 < Default(1); UiType(Slider); UiGroup("Layer 1/Uv Overlay/11"); >;
	float g_flOverlayRoughnessStrength1 < UiType(Slider); UiGroup("Layer 1/Uv Overlay/13"); >;
	int g_nOverlayTintMask1 < Range4(0, 0, 0, 0, 2, 2, 2, 2); UiOptions("0=Unmasked,1=Masked,2=Inverted"); UiType(Enum); UiGroup("Layer 1/Uv Overlay/20"); >;
	
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
	    int g_nScaleTexCoordUByModelScaleAxis;
	    int g_nScaleTexCoordVByModelScaleAxis;
	    bool g_bTexCoordScaleByModel;
	    int g_nScaleTexCoordUByModelScaleOrigin;
	    int g_nScaleTexCoordVByModelScaleOrigin;
	    float _g_fl_AutoPad0_;
	    vec4 g_vTexCoordScaleByModelU;
	    vec4 g_vTexCoordScaleByModelV;
	    vec2 g_vTexCoordScaleByModelOrigin;
	    int g_nScaleTexCoord2UByModelScaleAxis;
	    int g_nScaleTexCoord2VByModelScaleAxis;
	    int g_nScaleTexCoord2UByModelScaleOrigin;
	    int g_nScaleTexCoord2VByModelScaleOrigin;
	    bool g_bTexCoord2ScaleByModel;
	    float _g_fl_AutoPad1_;
	    vec4 g_vTexCoord2ScaleByModelU;
	    vec4 g_vTexCoord2ScaleByModelV;
	    vec2 g_vTexCoord2ScaleByModelOrigin;
	    float _g_fl_AutoPad2_;
	    float _g_fl_AutoPad3_;
	    vec4 g_vPixelToProj;
	    mat4 g_mHighPrecisionWorldFromProj;
	    mat4 g_mHighPrecisionWorldFromProjNoJitter;
	    uint g_tColor1;
	    uint g_tNormalRoughness1;
	    uint g_tPacked1;
	    float _g_fl_AutoPad4_;
	    vec3 g_vAlbedoContrastSaturationBrightness1;
	    float _g_fl_AutoPad5_;
	    vec3 g_vColorTint1;
	    int g_nTextureColorTintMode1;
	    bool g_bMaskColorTint1;
	    bool g_bMaskVertexColorTint1;
	    float g_fVertexColorStrength1;
	    float _g_fl_AutoPad6_;
	    mat4 g_mTextureColorTint1;
	    mat4 g_mAlbedoColorCorrect1;
	    float g_fLayerNormalStrength1;
	    float g_fLayerSelfIllumScale1;
	    float _g_fl_AutoPad7_;
	    float _g_fl_AutoPad8_;
	    vec3 g_vLayerSelfIllumTint1;
	    float _g_fl_AutoPad9_;
	    vec2 g_vLayerRoughnessContrastBrightness1;
	    vec2 g_vLayerTintMaskContrastBrightness1;
	    vec2 g_vLayerMetalnessContrastBrightness1;
	    float g_flOverrideBloomAmount1;
	    uint g_tColor2;
	    uint g_tNormalRoughness2;
	    uint g_tPacked2;
	    float _g_fl_AutoPad10_;
	    float _g_fl_AutoPad11_;
	    vec3 g_vAlbedoContrastSaturationBrightness2;
	    float _g_fl_AutoPad12_;
	    vec3 g_vColorTint2;
	    int g_nTextureColorTintMode2;
	    bool g_bMaskColorTint2;
	    bool g_bMaskVertexColorTint2;
	    float g_fVertexColorStrength2;
	    float _g_fl_AutoPad13_;
	    mat4 g_mTextureColorTint2;
	    mat4 g_mAlbedoColorCorrect2;
	    float g_fLayerNormalStrength2;
	    float g_fLayerSelfIllumScale2;
	    float _g_fl_AutoPad14_;
	    float _g_fl_AutoPad15_;
	    vec3 g_vLayerSelfIllumTint2;
	    float _g_fl_AutoPad16_;
	    vec2 g_vLayerRoughnessContrastBrightness2;
	    vec2 g_vLayerTintMaskContrastBrightness2;
	    vec2 g_vLayerMetalnessContrastBrightness2;
	    float g_flOverrideBloomAmount2;
	    uint g_tColor3;
	    uint g_tNormalRoughness3;
	    uint g_tPacked3;
	    float _g_fl_AutoPad17_;
	    float _g_fl_AutoPad18_;
	    vec3 g_vAlbedoContrastSaturationBrightness3;
	    float _g_fl_AutoPad19_;
	    vec3 g_vColorTint3;
	    int g_nTextureColorTintMode3;
	    bool g_bMaskColorTint3;
	    bool g_bMaskVertexColorTint3;
	    float g_fVertexColorStrength3;
	    float _g_fl_AutoPad20_;
	    mat4 g_mTextureColorTint3;
	    mat4 g_mAlbedoColorCorrect3;
	    float g_fLayerNormalStrength3;
	    float g_fLayerSelfIllumScale3;
	    float _g_fl_AutoPad21_;
	    float _g_fl_AutoPad22_;
	    vec3 g_vLayerSelfIllumTint3;
	    float _g_fl_AutoPad23_;
	    vec2 g_vLayerRoughnessContrastBrightness3;
	    vec2 g_vLayerTintMaskContrastBrightness3;
	    vec2 g_vLayerMetalnessContrastBrightness3;
	    float g_flOverrideBloomAmount3;
	    bool g_bUvOverlay;
	    uint g_tRevealMask2;
	    uint g_tRevealMask3;
	    float g_flRevealOffset2;
	    float g_flRevealOffset3;
	    float g_flRevealSoftness2;
	    float g_flRevealSoftness3;
	    bool g_bRevealInvert2;
	    bool g_bRevealInvert3;
	    vec4 g_vRevealScaleRotationTranslation1;
	    vec4 g_vRevealScaleRotationTranslation2;
	    vec4 g_vRevealScaleRotationTranslation3;
	    vec4 g_vRevealUvTransform1;
	    vec4 g_vRevealUvTransform2;
	    vec4 g_vRevealUvTransform3;
	    bool g_bRevealUseSecondaryUv1;
	    bool g_bRevealUseSecondaryUv2;
	    bool g_bRevealUseSecondaryUv3;
	    bool g_bBorderEffects2;
	    bool g_bBorderEffects3;
	    float _g_fl_AutoPad24_;
	    vec2 g_vBorderWidth2;
	    vec2 g_vBorderWidth3;
	    vec2 g_vBorderSoftness2;
	    vec2 g_vBorderSoftness3;
	    vec2 g_vBorderLayerAmount2;
	    vec3 g_vBorderLayerAmount3;
	    int g_nBorderBlendMode2;
	    int g_nBorderBlendMode3;
	    float _g_fl_AutoPad25_;
	    float _g_fl_AutoPad26_;
	    float _g_fl_AutoPad27_;
	    vec4 g_vBorderTint2;
	    vec4 g_vBorderTint3;
	    float g_flBorderRoughnessStrength2;
	    float g_flBorderRoughnessStrength3;
	    float g_flBorderRoughness2;
	    float g_flBorderRoughness3;
	    bool g_bAcceptStaticOverlays1;
	    bool g_bAcceptStaticOverlays2;
	    bool g_bAcceptStaticOverlays3;
	    float g_flStaticOverlaysTintMaskInfluence1;
	    float g_flStaticOverlaysTintMaskInfluence2;
	    float g_flStaticOverlaysTintMaskInfluence3;
	    bool g_bModelTint1;
	    bool g_bModelTint2;
	    bool g_bModelTint3;
	    float _g_fl_AutoPad28_;
	    float _g_fl_AutoPad29_;
	    float _g_fl_AutoPad30_;
	    vec4 g_vScaleRotationTranslation1;
	    vec4 g_vScaleRotationTranslation2;
	    vec4 g_vScaleRotationTranslation3;
	    vec4 g_vUvTransform1;
	    vec4 g_vUvTransform2;
	    vec4 g_vUvTransform3;
	    float g_flBiPlanarTiling1;
	    float g_flBiPlanarTiling2;
	    float g_flBiPlanarTiling3;
	    int g_nWorldOverlayTintMask1;
	    int g_nWorldOverlayTintMask2;
	    int g_nWorldOverlayTintMask3;
	    bool g_bWorldOverlayUseTintMask1;
	    bool g_bWorldOverlayUseTintMask2;
	    bool g_bWorldOverlayUseTintMask3;
	    bool g_bWorldOverlayTintMaskInvert1;
	    bool g_bWorldOverlayTintMaskInvert2;
	    bool g_bWorldOverlayTintMaskInvert3;
	    uint g_tColorWorldOverlay;
	    uint g_tColorWorldOverlay2;
	    int g_nOverlayTintMask1;
	    int g_nOverlayTintMask2;
	    int g_nOverlayTintMask3;
	    bool g_bOverlayUseTintMask1;
	    bool g_bOverlayUseTintMask2;
	    bool g_bOverlayUseTintMask3;
	    bool g_bOverlayTintMaskInvert1;
	    bool g_bOverlayTintMaskInvert2;
	    bool g_bOverlayTintMaskInvert3;
	    float g_flOverlayStrength1;
	    float g_flOverlayStrength2;
	    float g_flOverlayStrength3;
	    float g_flOverlayNormalStrength1;
	    float g_flOverlayNormalStrength2;
	    float g_flOverlayNormalStrength3;
	    float g_flOverlayRoughnessStrength1;
	    float g_flOverlayRoughnessStrength2;
	    float g_flOverlayRoughnessStrength3;
	    float g_flOverlayRevealStrength2;
	    float g_flOverlayRevealStrength3;
	    bool g_bUseSecondaryUvForOverlay;
	    float _g_fl_AutoPad31_;
	    vec4 g_vOverlayScaleRotationTranslation;
	    float g_flOverlayDarknessContrast;
	    float g_flOverlayBrightnessContrast;
	    bool g_bRevealOverlayInvert2;
	    float g_flRevealOverlayStrength2;
	    uint g_tColorOverlay;
	    uint g_tNormalRoughnessOverlay;
	    uint g_tRevealOverlay;
	    float _g_fl_AutoPad32_;
	    vec4 g_vUvTransformOverlay;
	    vec4 g_vUvTransformOverlayRevealA;
	    vec4 g_vUvTransformOverlayRevealB;
	};
	
	struct VS_INPUT
	{
	    vec3 vPositionOs;
	    vec2 vTexCoord;
	    vec2 vTexCoord2;
	    vec3 vNormalOs;
	    vec4 vTangentUOs_flTangentVSign;
	    vec3 vColorBlendValues;
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
	
	vec3 _1027;
	
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
	    int _member0[];
	} g_MaterialData_5;
	
	layout(set = 3, binding = 34, std430) readonly buffer g_MaterialData_6
	{
	    float _member0[];
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
	    uint _1052 = g_instanceBuffer._member0[uint(gl_InstanceID)].nMaterialData;
	    _RTX_MATERIAL_DATA_ _3139 = _RTX_MATERIAL_DATA_(g_MaterialData_1._member0[_1052 / 4u], g_MaterialData_1._member0[(_1052 + 4u) / 4u], g_MaterialData_1._member0[(_1052 + 8u) / 4u], g_MaterialData_1._member0[(_1052 + 12u) / 4u], g_MaterialData_1._member0[(_1052 + 16u) / 4u], g_MaterialData_1._member0[(_1052 + 20u) / 4u], g_MaterialData_1._member0[(_1052 + 24u) / 4u], g_MaterialData_1._member0[(_1052 + 28u) / 4u], g_MaterialData_1._member0[(_1052 + 32u) / 4u], g_MaterialData_1._member0[(_1052 + 36u) / 4u], g_MaterialData_3._member0[(_1052 + 40u) / 4u], g_MaterialData_3._member0[(_1052 + 44u) / 4u], g_MaterialData_5._member0[(_1052 + 48u) / 4u] != 0, g_MaterialData_3._member0[(_1052 + 52u) / 4u], g_MaterialData_3._member0[(_1052 + 56u) / 4u], g_MaterialData_7._member0[(_1052 + 60u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 64u) / 4u], g_MaterialData_7._member0[(_1052 + 68u) / 4u], g_MaterialData_7._member0[(_1052 + 72u) / 4u], g_MaterialData_7._member0[(_1052 + 76u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 80u) / 4u], g_MaterialData_7._member0[(_1052 + 84u) / 4u], g_MaterialData_7._member0[(_1052 + 88u) / 4u], g_MaterialData_7._member0[(_1052 + 92u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 96u) / 4u], g_MaterialData_7._member0[(_1052 + 100u) / 4u]), g_MaterialData_3._member0[(_1052 + 104u) / 4u], g_MaterialData_3._member0[(_1052 + 108u) / 4u], g_MaterialData_3._member0[(_1052 + 112u) / 4u], g_MaterialData_3._member0[(_1052 + 116u) / 4u], g_MaterialData_5._member0[(_1052 + 120u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 124u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 128u) / 4u], g_MaterialData_7._member0[(_1052 + 132u) / 4u], g_MaterialData_7._member0[(_1052 + 136u) / 4u], g_MaterialData_7._member0[(_1052 + 140u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 144u) / 4u], g_MaterialData_7._member0[(_1052 + 148u) / 4u], g_MaterialData_7._member0[(_1052 + 152u) / 4u], g_MaterialData_7._member0[(_1052 + 156u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 160u) / 4u], g_MaterialData_7._member0[(_1052 + 164u) / 4u]), g_MaterialData_7._member0[(_1052 + 168u) / 4u], g_MaterialData_7._member0[(_1052 + 172u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 176u) / 4u], g_MaterialData_7._member0[(_1052 + 180u) / 4u], g_MaterialData_7._member0[(_1052 + 184u) / 4u], g_MaterialData_7._member0[(_1052 + 188u) / 4u]), mat4(vec4(g_MaterialData_7._member0[(_1052 + 192u) / 4u], g_MaterialData_7._member0[(_1052 + 208u) / 4u], g_MaterialData_7._member0[(_1052 + 224u) / 4u], g_MaterialData_7._member0[(_1052 + 240u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 196u) / 4u], g_MaterialData_7._member0[(_1052 + 212u) / 4u], g_MaterialData_7._member0[(_1052 + 228u) / 4u], g_MaterialData_7._member0[(_1052 + 244u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 200u) / 4u], g_MaterialData_7._member0[(_1052 + 216u) / 4u], g_MaterialData_7._member0[(_1052 + 232u) / 4u], g_MaterialData_7._member0[(_1052 + 248u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 204u) / 4u], g_MaterialData_7._member0[(_1052 + 220u) / 4u], g_MaterialData_7._member0[(_1052 + 236u) / 4u], g_MaterialData_7._member0[(_1052 + 252u) / 4u])), mat4(vec4(g_MaterialData_7._member0[(_1052 + 256u) / 4u], g_MaterialData_7._member0[(_1052 + 272u) / 4u], g_MaterialData_7._member0[(_1052 + 288u) / 4u], g_MaterialData_7._member0[(_1052 + 304u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 260u) / 4u], g_MaterialData_7._member0[(_1052 + 276u) / 4u], g_MaterialData_7._member0[(_1052 + 292u) / 4u], g_MaterialData_7._member0[(_1052 + 308u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 264u) / 4u], g_MaterialData_7._member0[(_1052 + 280u) / 4u], g_MaterialData_7._member0[(_1052 + 296u) / 4u], g_MaterialData_7._member0[(_1052 + 312u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 268u) / 4u], g_MaterialData_7._member0[(_1052 + 284u) / 4u], g_MaterialData_7._member0[(_1052 + 300u) / 4u], g_MaterialData_7._member0[(_1052 + 316u) / 4u])), g_MaterialData_1._member0[(_1052 + 320u) / 4u], g_MaterialData_1._member0[(_1052 + 324u) / 4u], g_MaterialData_1._member0[(_1052 + 328u) / 4u], g_MaterialData_7._member0[(_1052 + 332u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 336u) / 4u], g_MaterialData_7._member0[(_1052 + 340u) / 4u], g_MaterialData_7._member0[(_1052 + 344u) / 4u]), g_MaterialData_7._member0[(_1052 + 348u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 352u) / 4u], g_MaterialData_7._member0[(_1052 + 356u) / 4u], g_MaterialData_7._member0[(_1052 + 360u) / 4u]), g_MaterialData_3._member0[(_1052 + 364u) / 4u], g_MaterialData_5._member0[(_1052 + 368u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 372u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 376u) / 4u], g_MaterialData_7._member0[(_1052 + 380u) / 4u], mat4(vec4(g_MaterialData_7._member0[(_1052 + 384u) / 4u], g_MaterialData_7._member0[(_1052 + 400u) / 4u], g_MaterialData_7._member0[(_1052 + 416u) / 4u], g_MaterialData_7._member0[(_1052 + 432u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 388u) / 4u], g_MaterialData_7._member0[(_1052 + 404u) / 4u], g_MaterialData_7._member0[(_1052 + 420u) / 4u], g_MaterialData_7._member0[(_1052 + 436u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 392u) / 4u], g_MaterialData_7._member0[(_1052 + 408u) / 4u], g_MaterialData_7._member0[(_1052 + 424u) / 4u], g_MaterialData_7._member0[(_1052 + 440u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 396u) / 4u], g_MaterialData_7._member0[(_1052 + 412u) / 4u], g_MaterialData_7._member0[(_1052 + 428u) / 4u], g_MaterialData_7._member0[(_1052 + 444u) / 4u])), mat4(vec4(g_MaterialData_7._member0[(_1052 + 448u) / 4u], g_MaterialData_7._member0[(_1052 + 464u) / 4u], g_MaterialData_7._member0[(_1052 + 480u) / 4u], g_MaterialData_7._member0[(_1052 + 496u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 452u) / 4u], g_MaterialData_7._member0[(_1052 + 468u) / 4u], g_MaterialData_7._member0[(_1052 + 484u) / 4u], g_MaterialData_7._member0[(_1052 + 500u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 456u) / 4u], g_MaterialData_7._member0[(_1052 + 472u) / 4u], g_MaterialData_7._member0[(_1052 + 488u) / 4u], g_MaterialData_7._member0[(_1052 + 504u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 460u) / 4u], g_MaterialData_7._member0[(_1052 + 476u) / 4u], g_MaterialData_7._member0[(_1052 + 492u) / 4u], g_MaterialData_7._member0[(_1052 + 508u) / 4u])), g_MaterialData_7._member0[(_1052 + 512u) / 4u], g_MaterialData_7._member0[(_1052 + 516u) / 4u], g_MaterialData_7._member0[(_1052 + 520u) / 4u], g_MaterialData_7._member0[(_1052 + 524u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 528u) / 4u], g_MaterialData_7._member0[(_1052 + 532u) / 4u], g_MaterialData_7._member0[(_1052 + 536u) / 4u]), g_MaterialData_7._member0[(_1052 + 540u) / 4u], vec2(g_MaterialData_7._member0[(_1052 + 544u) / 4u], g_MaterialData_7._member0[(_1052 + 548u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 552u) / 4u], g_MaterialData_7._member0[(_1052 + 556u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 560u) / 4u], g_MaterialData_7._member0[(_1052 + 564u) / 4u]), g_MaterialData_7._member0[(_1052 + 568u) / 4u], g_MaterialData_1._member0[(_1052 + 572u) / 4u], g_MaterialData_1._member0[(_1052 + 576u) / 4u], g_MaterialData_1._member0[(_1052 + 580u) / 4u], g_MaterialData_7._member0[(_1052 + 584u) / 4u], g_MaterialData_7._member0[(_1052 + 588u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 592u) / 4u], g_MaterialData_7._member0[(_1052 + 596u) / 4u], g_MaterialData_7._member0[(_1052 + 600u) / 4u]), g_MaterialData_7._member0[(_1052 + 604u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 608u) / 4u], g_MaterialData_7._member0[(_1052 + 612u) / 4u], g_MaterialData_7._member0[(_1052 + 616u) / 4u]), g_MaterialData_3._member0[(_1052 + 620u) / 4u], g_MaterialData_5._member0[(_1052 + 624u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 628u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 632u) / 4u], g_MaterialData_7._member0[(_1052 + 636u) / 4u], mat4(vec4(g_MaterialData_7._member0[(_1052 + 640u) / 4u], g_MaterialData_7._member0[(_1052 + 656u) / 4u], g_MaterialData_7._member0[(_1052 + 672u) / 4u], g_MaterialData_7._member0[(_1052 + 688u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 644u) / 4u], g_MaterialData_7._member0[(_1052 + 660u) / 4u], g_MaterialData_7._member0[(_1052 + 676u) / 4u], g_MaterialData_7._member0[(_1052 + 692u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 648u) / 4u], g_MaterialData_7._member0[(_1052 + 664u) / 4u], g_MaterialData_7._member0[(_1052 + 680u) / 4u], g_MaterialData_7._member0[(_1052 + 696u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 652u) / 4u], g_MaterialData_7._member0[(_1052 + 668u) / 4u], g_MaterialData_7._member0[(_1052 + 684u) / 4u], g_MaterialData_7._member0[(_1052 + 700u) / 4u])), mat4(vec4(g_MaterialData_7._member0[(_1052 + 704u) / 4u], g_MaterialData_7._member0[(_1052 + 720u) / 4u], g_MaterialData_7._member0[(_1052 + 736u) / 4u], g_MaterialData_7._member0[(_1052 + 752u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 708u) / 4u], g_MaterialData_7._member0[(_1052 + 724u) / 4u], g_MaterialData_7._member0[(_1052 + 740u) / 4u], g_MaterialData_7._member0[(_1052 + 756u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 712u) / 4u], g_MaterialData_7._member0[(_1052 + 728u) / 4u], g_MaterialData_7._member0[(_1052 + 744u) / 4u], g_MaterialData_7._member0[(_1052 + 760u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 716u) / 4u], g_MaterialData_7._member0[(_1052 + 732u) / 4u], g_MaterialData_7._member0[(_1052 + 748u) / 4u], g_MaterialData_7._member0[(_1052 + 764u) / 4u])), g_MaterialData_7._member0[(_1052 + 768u) / 4u], g_MaterialData_7._member0[(_1052 + 772u) / 4u], g_MaterialData_7._member0[(_1052 + 776u) / 4u], g_MaterialData_7._member0[(_1052 + 780u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 784u) / 4u], g_MaterialData_7._member0[(_1052 + 788u) / 4u], g_MaterialData_7._member0[(_1052 + 792u) / 4u]), g_MaterialData_7._member0[(_1052 + 796u) / 4u], vec2(g_MaterialData_7._member0[(_1052 + 800u) / 4u], g_MaterialData_7._member0[(_1052 + 804u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 808u) / 4u], g_MaterialData_7._member0[(_1052 + 812u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 816u) / 4u], g_MaterialData_7._member0[(_1052 + 820u) / 4u]), g_MaterialData_7._member0[(_1052 + 824u) / 4u], g_MaterialData_1._member0[(_1052 + 828u) / 4u], g_MaterialData_1._member0[(_1052 + 832u) / 4u], g_MaterialData_1._member0[(_1052 + 836u) / 4u], g_MaterialData_7._member0[(_1052 + 840u) / 4u], g_MaterialData_7._member0[(_1052 + 844u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 848u) / 4u], g_MaterialData_7._member0[(_1052 + 852u) / 4u], g_MaterialData_7._member0[(_1052 + 856u) / 4u]), g_MaterialData_7._member0[(_1052 + 860u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 864u) / 4u], g_MaterialData_7._member0[(_1052 + 868u) / 4u], g_MaterialData_7._member0[(_1052 + 872u) / 4u]), g_MaterialData_3._member0[(_1052 + 876u) / 4u], g_MaterialData_5._member0[(_1052 + 880u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 884u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 888u) / 4u], g_MaterialData_7._member0[(_1052 + 892u) / 4u], mat4(vec4(g_MaterialData_7._member0[(_1052 + 896u) / 4u], g_MaterialData_7._member0[(_1052 + 912u) / 4u], g_MaterialData_7._member0[(_1052 + 928u) / 4u], g_MaterialData_7._member0[(_1052 + 944u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 900u) / 4u], g_MaterialData_7._member0[(_1052 + 916u) / 4u], g_MaterialData_7._member0[(_1052 + 932u) / 4u], g_MaterialData_7._member0[(_1052 + 948u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 904u) / 4u], g_MaterialData_7._member0[(_1052 + 920u) / 4u], g_MaterialData_7._member0[(_1052 + 936u) / 4u], g_MaterialData_7._member0[(_1052 + 952u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 908u) / 4u], g_MaterialData_7._member0[(_1052 + 924u) / 4u], g_MaterialData_7._member0[(_1052 + 940u) / 4u], g_MaterialData_7._member0[(_1052 + 956u) / 4u])), mat4(vec4(g_MaterialData_7._member0[(_1052 + 960u) / 4u], g_MaterialData_7._member0[(_1052 + 976u) / 4u], g_MaterialData_7._member0[(_1052 + 992u) / 4u], g_MaterialData_7._member0[(_1052 + 1008u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 964u) / 4u], g_MaterialData_7._member0[(_1052 + 980u) / 4u], g_MaterialData_7._member0[(_1052 + 996u) / 4u], g_MaterialData_7._member0[(_1052 + 1012u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 968u) / 4u], g_MaterialData_7._member0[(_1052 + 984u) / 4u], g_MaterialData_7._member0[(_1052 + 1000u) / 4u], g_MaterialData_7._member0[(_1052 + 1016u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 972u) / 4u], g_MaterialData_7._member0[(_1052 + 988u) / 4u], g_MaterialData_7._member0[(_1052 + 1004u) / 4u], g_MaterialData_7._member0[(_1052 + 1020u) / 4u])), g_MaterialData_7._member0[(_1052 + 1024u) / 4u], g_MaterialData_7._member0[(_1052 + 1028u) / 4u], g_MaterialData_7._member0[(_1052 + 1032u) / 4u], g_MaterialData_7._member0[(_1052 + 1036u) / 4u], vec3(g_MaterialData_7._member0[(_1052 + 1040u) / 4u], g_MaterialData_7._member0[(_1052 + 1044u) / 4u], g_MaterialData_7._member0[(_1052 + 1048u) / 4u]), g_MaterialData_7._member0[(_1052 + 1052u) / 4u], vec2(g_MaterialData_7._member0[(_1052 + 1056u) / 4u], g_MaterialData_7._member0[(_1052 + 1060u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1064u) / 4u], g_MaterialData_7._member0[(_1052 + 1068u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1072u) / 4u], g_MaterialData_7._member0[(_1052 + 1076u) / 4u]), g_MaterialData_7._member0[(_1052 + 1080u) / 4u], g_MaterialData_5._member0[(_1052 + 1084u) / 4u] != 0, g_MaterialData_1._member0[(_1052 + 1088u) / 4u], g_MaterialData_1._member0[(_1052 + 1092u) / 4u], g_MaterialData_7._member0[(_1052 + 1096u) / 4u], g_MaterialData_7._member0[(_1052 + 1100u) / 4u], g_MaterialData_7._member0[(_1052 + 1104u) / 4u], g_MaterialData_7._member0[(_1052 + 1108u) / 4u], g_MaterialData_5._member0[(_1052 + 1112u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1116u) / 4u] != 0, vec4(g_MaterialData_7._member0[(_1052 + 1120u) / 4u], g_MaterialData_7._member0[(_1052 + 1124u) / 4u], g_MaterialData_7._member0[(_1052 + 1128u) / 4u], g_MaterialData_7._member0[(_1052 + 1132u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1136u) / 4u], g_MaterialData_7._member0[(_1052 + 1140u) / 4u], g_MaterialData_7._member0[(_1052 + 1144u) / 4u], g_MaterialData_7._member0[(_1052 + 1148u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1152u) / 4u], g_MaterialData_7._member0[(_1052 + 1156u) / 4u], g_MaterialData_7._member0[(_1052 + 1160u) / 4u], g_MaterialData_7._member0[(_1052 + 1164u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1168u) / 4u], g_MaterialData_7._member0[(_1052 + 1172u) / 4u], g_MaterialData_7._member0[(_1052 + 1176u) / 4u], g_MaterialData_7._member0[(_1052 + 1180u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1184u) / 4u], g_MaterialData_7._member0[(_1052 + 1188u) / 4u], g_MaterialData_7._member0[(_1052 + 1192u) / 4u], g_MaterialData_7._member0[(_1052 + 1196u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1200u) / 4u], g_MaterialData_7._member0[(_1052 + 1204u) / 4u], g_MaterialData_7._member0[(_1052 + 1208u) / 4u], g_MaterialData_7._member0[(_1052 + 1212u) / 4u]), g_MaterialData_5._member0[(_1052 + 1216u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1220u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1224u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1228u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1232u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1236u) / 4u], vec2(g_MaterialData_7._member0[(_1052 + 1240u) / 4u], g_MaterialData_7._member0[(_1052 + 1244u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1248u) / 4u], g_MaterialData_7._member0[(_1052 + 1252u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1256u) / 4u], g_MaterialData_7._member0[(_1052 + 1260u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1264u) / 4u], g_MaterialData_7._member0[(_1052 + 1268u) / 4u]), vec2(g_MaterialData_7._member0[(_1052 + 1272u) / 4u], g_MaterialData_7._member0[(_1052 + 1276u) / 4u]), vec3(g_MaterialData_7._member0[(_1052 + 1280u) / 4u], g_MaterialData_7._member0[(_1052 + 1284u) / 4u], g_MaterialData_7._member0[(_1052 + 1288u) / 4u]), g_MaterialData_3._member0[(_1052 + 1292u) / 4u], g_MaterialData_3._member0[(_1052 + 1296u) / 4u], g_MaterialData_7._member0[(_1052 + 1300u) / 4u], g_MaterialData_7._member0[(_1052 + 1304u) / 4u], g_MaterialData_7._member0[(_1052 + 1308u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 1312u) / 4u], g_MaterialData_7._member0[(_1052 + 1316u) / 4u], g_MaterialData_7._member0[(_1052 + 1320u) / 4u], g_MaterialData_7._member0[(_1052 + 1324u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1328u) / 4u], g_MaterialData_7._member0[(_1052 + 1332u) / 4u], g_MaterialData_7._member0[(_1052 + 1336u) / 4u], g_MaterialData_7._member0[(_1052 + 1340u) / 4u]), g_MaterialData_7._member0[(_1052 + 1344u) / 4u], g_MaterialData_7._member0[(_1052 + 1348u) / 4u], g_MaterialData_7._member0[(_1052 + 1352u) / 4u], g_MaterialData_7._member0[(_1052 + 1356u) / 4u], g_MaterialData_5._member0[(_1052 + 1360u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1364u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1368u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1372u) / 4u], g_MaterialData_7._member0[(_1052 + 1376u) / 4u], g_MaterialData_7._member0[(_1052 + 1380u) / 4u], g_MaterialData_5._member0[(_1052 + 1384u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1388u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1392u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1396u) / 4u], g_MaterialData_7._member0[(_1052 + 1400u) / 4u], g_MaterialData_7._member0[(_1052 + 1404u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 1408u) / 4u], g_MaterialData_7._member0[(_1052 + 1412u) / 4u], g_MaterialData_7._member0[(_1052 + 1416u) / 4u], g_MaterialData_7._member0[(_1052 + 1420u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1424u) / 4u], g_MaterialData_7._member0[(_1052 + 1428u) / 4u], g_MaterialData_7._member0[(_1052 + 1432u) / 4u], g_MaterialData_7._member0[(_1052 + 1436u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1440u) / 4u], g_MaterialData_7._member0[(_1052 + 1444u) / 4u], g_MaterialData_7._member0[(_1052 + 1448u) / 4u], g_MaterialData_7._member0[(_1052 + 1452u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1456u) / 4u], g_MaterialData_7._member0[(_1052 + 1460u) / 4u], g_MaterialData_7._member0[(_1052 + 1464u) / 4u], g_MaterialData_7._member0[(_1052 + 1468u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1472u) / 4u], g_MaterialData_7._member0[(_1052 + 1476u) / 4u], g_MaterialData_7._member0[(_1052 + 1480u) / 4u], g_MaterialData_7._member0[(_1052 + 1484u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1488u) / 4u], g_MaterialData_7._member0[(_1052 + 1492u) / 4u], g_MaterialData_7._member0[(_1052 + 1496u) / 4u], g_MaterialData_7._member0[(_1052 + 1500u) / 4u]), g_MaterialData_7._member0[(_1052 + 1504u) / 4u], g_MaterialData_7._member0[(_1052 + 1508u) / 4u], g_MaterialData_7._member0[(_1052 + 1512u) / 4u], g_MaterialData_3._member0[(_1052 + 1516u) / 4u], g_MaterialData_3._member0[(_1052 + 1520u) / 4u], g_MaterialData_3._member0[(_1052 + 1524u) / 4u], g_MaterialData_5._member0[(_1052 + 1528u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1532u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1536u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1540u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1544u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1548u) / 4u] != 0, g_MaterialData_1._member0[(_1052 + 1552u) / 4u], g_MaterialData_1._member0[(_1052 + 1556u) / 4u], g_MaterialData_3._member0[(_1052 + 1560u) / 4u], g_MaterialData_3._member0[(_1052 + 1564u) / 4u], g_MaterialData_3._member0[(_1052 + 1568u) / 4u], g_MaterialData_5._member0[(_1052 + 1572u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1576u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1580u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1584u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1588u) / 4u] != 0, g_MaterialData_5._member0[(_1052 + 1592u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1596u) / 4u], g_MaterialData_7._member0[(_1052 + 1600u) / 4u], g_MaterialData_7._member0[(_1052 + 1604u) / 4u], g_MaterialData_7._member0[(_1052 + 1608u) / 4u], g_MaterialData_7._member0[(_1052 + 1612u) / 4u], g_MaterialData_7._member0[(_1052 + 1616u) / 4u], g_MaterialData_7._member0[(_1052 + 1620u) / 4u], g_MaterialData_7._member0[(_1052 + 1624u) / 4u], g_MaterialData_7._member0[(_1052 + 1628u) / 4u], g_MaterialData_7._member0[(_1052 + 1632u) / 4u], g_MaterialData_7._member0[(_1052 + 1636u) / 4u], g_MaterialData_5._member0[(_1052 + 1640u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1644u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 1648u) / 4u], g_MaterialData_7._member0[(_1052 + 1652u) / 4u], g_MaterialData_7._member0[(_1052 + 1656u) / 4u], g_MaterialData_7._member0[(_1052 + 1660u) / 4u]), g_MaterialData_7._member0[(_1052 + 1664u) / 4u], g_MaterialData_7._member0[(_1052 + 1668u) / 4u], g_MaterialData_5._member0[(_1052 + 1672u) / 4u] != 0, g_MaterialData_7._member0[(_1052 + 1676u) / 4u], g_MaterialData_1._member0[(_1052 + 1680u) / 4u], g_MaterialData_1._member0[(_1052 + 1684u) / 4u], g_MaterialData_1._member0[(_1052 + 1688u) / 4u], g_MaterialData_7._member0[(_1052 + 1692u) / 4u], vec4(g_MaterialData_7._member0[(_1052 + 1696u) / 4u], g_MaterialData_7._member0[(_1052 + 1700u) / 4u], g_MaterialData_7._member0[(_1052 + 1704u) / 4u], g_MaterialData_7._member0[(_1052 + 1708u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1712u) / 4u], g_MaterialData_7._member0[(_1052 + 1716u) / 4u], g_MaterialData_7._member0[(_1052 + 1720u) / 4u], g_MaterialData_7._member0[(_1052 + 1724u) / 4u]), vec4(g_MaterialData_7._member0[(_1052 + 1728u) / 4u], g_MaterialData_7._member0[(_1052 + 1732u) / 4u], g_MaterialData_7._member0[(_1052 + 1736u) / 4u], g_MaterialData_7._member0[(_1052 + 1740u) / 4u]));
	    _RTX_MATERIAL_DATA_ _g_rtx_material_data_ = _3139;
	    uvec3 _1254;
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.w == 4)
	        {
	            uint _3181 = (12u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            _1254 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_3181 / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_3181 + 4u) / 4u], g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[(_3181 + 8u) / 4u]);
	            break;
	        }
	        else
	        {
	            uint _3160 = (6u * uint(gl_PrimitiveID)) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.w);
	            uint _3161 = _3160 & 4294967292u;
	            uint _57 = _3161 / 4u;
	            uint _60 = (_3161 + 4u) / 4u;
	            uint _3165 = (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 4294901760u) >> uint(16);
	            uint _3166 = g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_60] & 65535u;
	            uvec3 _1255;
	            if (_3160 == _3161)
	            {
	                _1255 = uvec3(g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_57] & 65535u, _3165, _3166);
	            }
	            else
	            {
	                _1255 = uvec3(_3165, _3166, (g_Indices_1[nonuniformEXT(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.w)]._member0[_60] & 4294901760u) >> uint(16));
	            }
	            _1254 = _1255;
	            break;
	        }
	        break;
	    } while(false);
	    uint _73 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers.x);
	    uvec3 _3202 = (uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes.x)) * _1254) + uvec3(uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes.x));
	    vec3 _1256[3];
	    uint _3204 = _3202.x;
	    _1256[0] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_3204 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3204 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3204 + 8u) / 4u]);
	    uint _3209 = _3202.y;
	    _1256[1] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_3209 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3209 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3209 + 8u) / 4u]);
	    uint _3214 = _3202.z;
	    _1256[2] = vec3(g_Vertices_1[nonuniformEXT(_73)]._member0[_3214 / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3214 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_73)]._member0[(_3214 + 8u) / 4u]);
	    int _1257 = 0;
	    VS_INPUT _1262[3];
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vPositionOs = _1256[_1257];
	        _1257++;
	        continue;
	    }
	    vec2 _1258[3];
	    _1258[0] = vec2(0.0);
	    _1258[1] = vec2(0.0);
	    _1258[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y != 0)
	    {
	        ivec4 _1253 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _102 = uint(_1253[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z]);
	        uint _3256 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].z);
	        ivec4 _1251 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1252 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _3272 = (uvec3(uint(_1251[_3256])) * _1254) + uvec3(uint(_1252[_3256]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 16)
	        {
	            uint _3386 = _3272.x;
	            _1258[0] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_3386 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_3386 + 4u) / 4u]);
	            uint _3389 = _3272.y;
	            _1258[1] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_3389 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_3389 + 4u) / 4u]);
	            uint _3392 = _3272.z;
	            _1258[2] = vec2(g_Vertices_1[nonuniformEXT(_102)]._member0[_3392 / 4u], g_Vertices_1[nonuniformEXT(_102)]._member0[(_3392 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 34)
	            {
	                uint _114 = _3272.x / 4u;
	                _1258[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_114], g_Vertices_3[nonuniformEXT(_102)]._member0[_114] >> uint(16)) & uvec2(65535u))));
	                uint _117 = _3272.y / 4u;
	                _1258[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_117], g_Vertices_3[nonuniformEXT(_102)]._member0[_117] >> uint(16)) & uvec2(65535u))));
	                uint _120 = _3272.z / 4u;
	                _1258[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_102)]._member0[_120], g_Vertices_3[nonuniformEXT(_102)]._member0[_120] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[0].y == 37)
	                {
	                    uint _104 = _3272.x / 4u;
	                    uint _3285 = g_Vertices_3[nonuniformEXT(_102)]._member0[_104] & 65535u;
	                    int _1250;
	                    if (_3285 > 32767u)
	                    {
	                        _1250 = int(4294901760u | _3285);
	                    }
	                    else
	                    {
	                        _1250 = int(_3285);
	                    }
	                    uint _3298 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_104] & 4294901760u) >> uint(16);
	                    int _1249;
	                    if (_3298 > 32767u)
	                    {
	                        _1249 = int(4294901760u | _3298);
	                    }
	                    else
	                    {
	                        _1249 = int(_3298);
	                    }
	                    _1258[0] = vec2(max(float(_1250) * 3.0518509447574615478515625e-05, -1.0), max(float(_1249) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _107 = _3272.y / 4u;
	                    uint _3312 = g_Vertices_3[nonuniformEXT(_102)]._member0[_107] & 65535u;
	                    int _1248;
	                    if (_3312 > 32767u)
	                    {
	                        _1248 = int(4294901760u | _3312);
	                    }
	                    else
	                    {
	                        _1248 = int(_3312);
	                    }
	                    uint _3325 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_107] & 4294901760u) >> uint(16);
	                    int _1247;
	                    if (_3325 > 32767u)
	                    {
	                        _1247 = int(4294901760u | _3325);
	                    }
	                    else
	                    {
	                        _1247 = int(_3325);
	                    }
	                    _1258[1] = vec2(max(float(_1248) * 3.0518509447574615478515625e-05, -1.0), max(float(_1247) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _110 = _3272.z / 4u;
	                    uint _3339 = g_Vertices_3[nonuniformEXT(_102)]._member0[_110] & 65535u;
	                    int _1246;
	                    if (_3339 > 32767u)
	                    {
	                        _1246 = int(4294901760u | _3339);
	                    }
	                    else
	                    {
	                        _1246 = int(_3339);
	                    }
	                    uint _3352 = (g_Vertices_3[nonuniformEXT(_102)]._member0[_110] & 4294901760u) >> uint(16);
	                    int _1245;
	                    if (_3352 > 32767u)
	                    {
	                        _1245 = int(4294901760u | _3352);
	                    }
	                    else
	                    {
	                        _1245 = int(_3352);
	                    }
	                    _1258[2] = vec2(max(float(_1246) * 3.0518509447574615478515625e-05, -1.0), max(float(_1245) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _1257 = 0;
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vTexCoord = _1258[_1257];
	        _1257++;
	        continue;
	    }
	    _1258[0] = vec2(0.0);
	    _1258[1] = vec2(0.0);
	    _1258[2] = vec2(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y != 0)
	    {
	        ivec4 _1244 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _142 = uint(_1244[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].z]);
	        uint _3431 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].z);
	        ivec4 _1242 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1243 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _3447 = (uvec3(uint(_1242[_3431])) * _1254) + uvec3(uint(_1243[_3431]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 16)
	        {
	            uint _3561 = _3447.x;
	            _1258[0] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_3561 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_3561 + 4u) / 4u]);
	            uint _3564 = _3447.y;
	            _1258[1] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_3564 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_3564 + 4u) / 4u]);
	            uint _3567 = _3447.z;
	            _1258[2] = vec2(g_Vertices_1[nonuniformEXT(_142)]._member0[_3567 / 4u], g_Vertices_1[nonuniformEXT(_142)]._member0[(_3567 + 4u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 34)
	            {
	                uint _154 = _3447.x / 4u;
	                _1258[0] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_154], g_Vertices_3[nonuniformEXT(_142)]._member0[_154] >> uint(16)) & uvec2(65535u))));
	                uint _157 = _3447.y / 4u;
	                _1258[1] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_157], g_Vertices_3[nonuniformEXT(_142)]._member0[_157] >> uint(16)) & uvec2(65535u))));
	                uint _160 = _3447.z / 4u;
	                _1258[2] = vec2(uint16BitsToFloat16(u16vec2(uvec2(g_Vertices_3[nonuniformEXT(_142)]._member0[_160], g_Vertices_3[nonuniformEXT(_142)]._member0[_160] >> uint(16)) & uvec2(65535u))));
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[1].y == 37)
	                {
	                    uint _144 = _3447.x / 4u;
	                    uint _3460 = g_Vertices_3[nonuniformEXT(_142)]._member0[_144] & 65535u;
	                    int _1241;
	                    if (_3460 > 32767u)
	                    {
	                        _1241 = int(4294901760u | _3460);
	                    }
	                    else
	                    {
	                        _1241 = int(_3460);
	                    }
	                    uint _3473 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_144] & 4294901760u) >> uint(16);
	                    int _1240;
	                    if (_3473 > 32767u)
	                    {
	                        _1240 = int(4294901760u | _3473);
	                    }
	                    else
	                    {
	                        _1240 = int(_3473);
	                    }
	                    _1258[0] = vec2(max(float(_1241) * 3.0518509447574615478515625e-05, -1.0), max(float(_1240) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _147 = _3447.y / 4u;
	                    uint _3487 = g_Vertices_3[nonuniformEXT(_142)]._member0[_147] & 65535u;
	                    int _1239;
	                    if (_3487 > 32767u)
	                    {
	                        _1239 = int(4294901760u | _3487);
	                    }
	                    else
	                    {
	                        _1239 = int(_3487);
	                    }
	                    uint _3500 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_147] & 4294901760u) >> uint(16);
	                    int _1238;
	                    if (_3500 > 32767u)
	                    {
	                        _1238 = int(4294901760u | _3500);
	                    }
	                    else
	                    {
	                        _1238 = int(_3500);
	                    }
	                    _1258[1] = vec2(max(float(_1239) * 3.0518509447574615478515625e-05, -1.0), max(float(_1238) * 3.0518509447574615478515625e-05, -1.0));
	                    uint _150 = _3447.z / 4u;
	                    uint _3514 = g_Vertices_3[nonuniformEXT(_142)]._member0[_150] & 65535u;
	                    int _1237;
	                    if (_3514 > 32767u)
	                    {
	                        _1237 = int(4294901760u | _3514);
	                    }
	                    else
	                    {
	                        _1237 = int(_3514);
	                    }
	                    uint _3527 = (g_Vertices_3[nonuniformEXT(_142)]._member0[_150] & 4294901760u) >> uint(16);
	                    int _1236;
	                    if (_3527 > 32767u)
	                    {
	                        _1236 = int(4294901760u | _3527);
	                    }
	                    else
	                    {
	                        _1236 = int(_3527);
	                    }
	                    _1258[2] = vec2(max(float(_1237) * 3.0518509447574615478515625e-05, -1.0), max(float(_1236) * 3.0518509447574615478515625e-05, -1.0));
	                }
	            }
	        }
	    }
	    _1257 = 0;
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vTexCoord2 = _1258[_1257];
	        _1257++;
	        continue;
	    }
	    vec3 _1259[3];
	    vec4 _1260[3];
	    do
	    {
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y != 0)
	        {
	            ivec4 _1222 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _182 = uint(_1222[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z]);
	            uint _3611 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.z);
	            ivec4 _1220 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _1221 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _3627 = (uvec3(uint(_1220[_3611])) * _1254) + uvec3(uint(_1221[_3611]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.x));
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 6)
	            {
	                uint _4128 = _3627.x;
	                _1259[0] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_4128 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4128 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4128 + 8u) / 4u]);
	                uint _4133 = _3627.y;
	                _1259[1] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_4133 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4133 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4133 + 8u) / 4u]);
	                uint _4138 = _3627.z;
	                _1259[2] = vec3(g_Vertices_1[nonuniformEXT(_182)]._member0[_4138 / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4138 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_182)]._member0[(_4138 + 8u) / 4u]);
	            }
	            else
	            {
	                if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vNormalFieldInfo.y == 17)
	                {
	                    uint _3882 = _3627.x;
	                    uvec2 _3884 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3882 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3882 + 4u) / 4u]);
	                    uint _3885 = _3627.y;
	                    uvec2 _1047 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3885 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3885 + 4u) / 4u]);
	                    uint _3888 = _3627.z;
	                    uvec2 _1046 = uvec2(g_Vertices_3[nonuniformEXT(_182)]._member0[_3888 / 4u], g_Vertices_3[nonuniformEXT(_182)]._member0[(_3888 + 4u) / 4u]);
	                    uint _3894 = _3884.x;
	                    uint _3902 = _3884.y;
	                    vec2 _3912 = ((vec2(float(_3894 & 65535u), float((_3894 >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _3913 = _3912.x;
	                    float _3918 = (1.0 - abs(_3913)) - abs(_3912.y);
	                    vec3 _3919 = vec3(_3913, _3912.y, _3918);
	                    float _3921 = saturate(-_3918);
	                    vec2 _3927 = _3912 + mix(vec2(_3921), vec2(-_3921), greaterThanEqual(_3912, vec2(0.0)));
	                    _3919.x = _3927.x;
	                    _3919.y = _3927.y;
	                    vec3 _1224 = normalize(_3919);
	                    vec2 _3934 = ((vec2(float((_3902 >> uint(1)) & 32767u), float((_3902 >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _3935 = _3934.x;
	                    float _3940 = (1.0 - abs(_3935)) - abs(_3934.y);
	                    vec3 _3941 = vec3(_3935, _3934.y, _3940);
	                    float _3943 = saturate(-_3940);
	                    vec2 _3949 = _3934 + mix(vec2(_3943), vec2(-_3943), greaterThanEqual(_3934, vec2(0.0)));
	                    _3941.x = _3949.x;
	                    _3941.y = _3949.y;
	                    vec3 _1223 = normalize(_3941);
	                    float _1210;
	                    if ((_3902 & 1u) != 0u)
	                    {
	                        _1210 = 1.0;
	                    }
	                    else
	                    {
	                        _1210 = -1.0;
	                    }
	                    _1259[0] = _1224;
	                    _1260[0].w = _1210;
	                    _1260[0].x = _1223.x;
	                    _1260[0].y = _1223.y;
	                    _1260[0].z = _1223.z;
	                    vec2 _3991 = ((vec2(float(_1047.x & 65535u), float((_1047.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _3992 = _3991.x;
	                    float _3997 = (1.0 - abs(_3992)) - abs(_3991.y);
	                    vec3 _3998 = vec3(_3992, _3991.y, _3997);
	                    float _4000 = saturate(-_3997);
	                    vec2 _4006 = _3991 + mix(vec2(_4000), vec2(-_4000), greaterThanEqual(_3991, vec2(0.0)));
	                    _3998.x = _4006.x;
	                    _3998.y = _4006.y;
	                    vec3 _1226 = normalize(_3998);
	                    vec2 _4013 = ((vec2(float((_1047.y >> uint(1)) & 32767u), float((_1047.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _4014 = _4013.x;
	                    float _4019 = (1.0 - abs(_4014)) - abs(_4013.y);
	                    vec3 _4020 = vec3(_4014, _4013.y, _4019);
	                    float _4022 = saturate(-_4019);
	                    vec2 _4028 = _4013 + mix(vec2(_4022), vec2(-_4022), greaterThanEqual(_4013, vec2(0.0)));
	                    _4020.x = _4028.x;
	                    _4020.y = _4028.y;
	                    vec3 _1225 = normalize(_4020);
	                    float _1209;
	                    if ((_1047.y & 1u) != 0u)
	                    {
	                        _1209 = 1.0;
	                    }
	                    else
	                    {
	                        _1209 = -1.0;
	                    }
	                    _1259[1] = _1226;
	                    _1260[1].w = _1209;
	                    _1260[1].x = _1225.x;
	                    _1260[1].y = _1225.y;
	                    _1260[1].z = _1225.z;
	                    vec2 _4070 = ((vec2(float(_1046.x & 65535u), float((_1046.x >> 16u) & 65535u)) * vec2(1.525902189314365386962890625e-05)) * 2.0) - vec2(1.0);
	                    float _4071 = _4070.x;
	                    float _4076 = (1.0 - abs(_4071)) - abs(_4070.y);
	                    vec3 _4077 = vec3(_4071, _4070.y, _4076);
	                    float _4079 = saturate(-_4076);
	                    vec2 _4085 = _4070 + mix(vec2(_4079), vec2(-_4079), greaterThanEqual(_4070, vec2(0.0)));
	                    _4077.x = _4085.x;
	                    _4077.y = _4085.y;
	                    vec3 _1228 = normalize(_4077);
	                    vec2 _4092 = ((vec2(float((_1046.y >> uint(1)) & 32767u), float((_1046.y >> 16u) & 32767u)) * vec2(3.0518509447574615478515625e-05)) * 2.0) - vec2(1.0);
	                    float _4093 = _4092.x;
	                    float _4098 = (1.0 - abs(_4093)) - abs(_4092.y);
	                    vec3 _4099 = vec3(_4093, _4092.y, _4098);
	                    float _4101 = saturate(-_4098);
	                    vec2 _4107 = _4092 + mix(vec2(_4101), vec2(-_4101), greaterThanEqual(_4092, vec2(0.0)));
	                    _4099.x = _4107.x;
	                    _4099.y = _4107.y;
	                    vec3 _1227 = normalize(_4099);
	                    float _1208;
	                    if ((_1046.y & 1u) != 0u)
	                    {
	                        _1208 = 1.0;
	                    }
	                    else
	                    {
	                        _1208 = -1.0;
	                    }
	                    _1259[2] = _1228;
	                    _1260[2].w = _1208;
	                    _1260[2].x = _1227.x;
	                    _1260[2].y = _1227.y;
	                    _1260[2].z = _1227.z;
	                    break;
	                }
	                else
	                {
	                    uint _184 = _3627.x / 4u;
	                    vec4 _1230 = _1260[0];
	                    float _3649 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3652 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3656 = (1.0 - abs(_3649)) - abs(_3652);
	                    vec3 _3657 = vec3(_3649, _3652, _3656);
	                    float _3659 = saturate(-_3656);
	                    vec2 _3660 = vec2(_3649, _3652);
	                    vec2 _3666 = _3660 + mix(vec2(_3659), vec2(-_3659), greaterThanEqual(_3660, vec2(0.0)));
	                    _3657.x = _3666.x;
	                    _3657.y = _3666.y;
	                    vec3 _3671 = normalize(_3657);
	                    vec3 _1229 = _3671;
	                    float _3672 = _3671.z;
	                    float _1217;
	                    if (_3672 >= 0.0)
	                    {
	                        _1217 = 1.0;
	                    }
	                    else
	                    {
	                        _1217 = -1.0;
	                    }
	                    float _3679 = (-1.0) / (_1217 + _3672);
	                    float _3680 = _3671.x;
	                    vec3 _1218;
	                    vec3 _3688 = _1218;
	                    _3688.x = 1.0 + (((_1217 * _3680) * _3680) * _3679);
	                    _3688.y = _1217 * ((_3680 * _3671.y) * _3679);
	                    _3688.z = (-_1217) * _3680;
	                    _1218 = _3688;
	                    float _3696 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _3702 = (_3688 * cos(_3696)) + (cross(_3671, _3688) * sin(_3696));
	                    vec4 _3704 = _1230;
	                    _3704.x = _3702.x;
	                    _3704.y = _3702.y;
	                    _3704.z = _3702.z;
	                    _1230 = _3704;
	                    float _1219;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_184] & 1u) == 0u)
	                    {
	                        _1219 = -1.0;
	                    }
	                    else
	                    {
	                        _1219 = 1.0;
	                    }
	                    vec4 _3715 = _1230;
	                    _3715.w = _1219;
	                    _1230 = _3715;
	                    _1259[0] = _1229;
	                    _1260[0] = _3715;
	                    uint _187 = _3627.y / 4u;
	                    vec4 _1232 = _1260[1];
	                    float _3731 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3734 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3738 = (1.0 - abs(_3731)) - abs(_3734);
	                    vec3 _3739 = vec3(_3731, _3734, _3738);
	                    float _3741 = saturate(-_3738);
	                    vec2 _3742 = vec2(_3731, _3734);
	                    vec2 _3748 = _3742 + mix(vec2(_3741), vec2(-_3741), greaterThanEqual(_3742, vec2(0.0)));
	                    _3739.x = _3748.x;
	                    _3739.y = _3748.y;
	                    vec3 _3753 = normalize(_3739);
	                    vec3 _1231 = _3753;
	                    float _3754 = _3753.z;
	                    float _1214;
	                    if (_3754 >= 0.0)
	                    {
	                        _1214 = 1.0;
	                    }
	                    else
	                    {
	                        _1214 = -1.0;
	                    }
	                    float _3761 = (-1.0) / (_1214 + _3754);
	                    float _3762 = _3753.x;
	                    vec3 _1215;
	                    vec3 _3770 = _1215;
	                    _3770.x = 1.0 + (((_1214 * _3762) * _3762) * _3761);
	                    _3770.y = _1214 * ((_3762 * _3753.y) * _3761);
	                    _3770.z = (-_1214) * _3762;
	                    _1215 = _3770;
	                    float _3778 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _3784 = (_3770 * cos(_3778)) + (cross(_3753, _3770) * sin(_3778));
	                    vec4 _3786 = _1232;
	                    _3786.x = _3784.x;
	                    _3786.y = _3784.y;
	                    _3786.z = _3784.z;
	                    _1232 = _3786;
	                    float _1216;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_187] & 1u) == 0u)
	                    {
	                        _1216 = -1.0;
	                    }
	                    else
	                    {
	                        _1216 = 1.0;
	                    }
	                    vec4 _3797 = _1232;
	                    _3797.w = _1216;
	                    _1232 = _3797;
	                    _1259[1] = _1231;
	                    _1260[1] = _3797;
	                    uint _190 = _3627.z / 4u;
	                    vec4 _1234 = _1260[2];
	                    float _3813 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> 12u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3816 = (float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> 22u) & 1023u) * 0.00195503421127796173095703125) - 1.0;
	                    float _3820 = (1.0 - abs(_3813)) - abs(_3816);
	                    vec3 _3821 = vec3(_3813, _3816, _3820);
	                    float _3823 = saturate(-_3820);
	                    vec2 _3824 = vec2(_3813, _3816);
	                    vec2 _3830 = _3824 + mix(vec2(_3823), vec2(-_3823), greaterThanEqual(_3824, vec2(0.0)));
	                    _3821.x = _3830.x;
	                    _3821.y = _3830.y;
	                    vec3 _3835 = normalize(_3821);
	                    vec3 _1233 = _3835;
	                    float _3836 = _3835.z;
	                    float _1211;
	                    if (_3836 >= 0.0)
	                    {
	                        _1211 = 1.0;
	                    }
	                    else
	                    {
	                        _1211 = -1.0;
	                    }
	                    float _3843 = (-1.0) / (_1211 + _3836);
	                    float _3844 = _3835.x;
	                    vec3 _1212;
	                    vec3 _3852 = _1212;
	                    _3852.x = 1.0 + (((_1211 * _3844) * _3844) * _3843);
	                    _3852.y = _1211 * ((_3844 * _3835.y) * _3843);
	                    _3852.z = (-_1211) * _3844;
	                    _1212 = _3852;
	                    float _3860 = float((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] >> uint(1)) & 2047u) * 0.003069460391998291015625;
	                    vec3 _3866 = (_3852 * cos(_3860)) + (cross(_3835, _3852) * sin(_3860));
	                    vec4 _3868 = _1234;
	                    _3868.x = _3866.x;
	                    _3868.y = _3866.y;
	                    _3868.z = _3866.z;
	                    _1234 = _3868;
	                    float _1213;
	                    if ((g_Vertices_3[nonuniformEXT(_182)]._member0[_190] & 1u) == 0u)
	                    {
	                        _1213 = -1.0;
	                    }
	                    else
	                    {
	                        _1213 = 1.0;
	                    }
	                    vec4 _3879 = _1234;
	                    _3879.w = _1213;
	                    _1234 = _3879;
	                    _1259[2] = _1233;
	                    _1260[2] = _3879;
	                    break;
	                }
	                break;
	            }
	        }
	        else
	        {
	            _1259[0] = vec3(0.0);
	            _1259[1] = vec3(0.0);
	            _1259[2] = vec3(0.0);
	        }
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.y != 0)
	        {
	            ivec4 _1235 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	            uint _240 = uint(_1235[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z]);
	            uint _4157 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.z);
	            ivec4 _1206 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	            ivec4 _1207 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	            uvec3 _4173 = (uvec3(uint(_1206[_4157])) * _1254) + uvec3(uint(_1207[_4157]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTangentFieldInfo.x));
	            uint _4175 = _4173.x;
	            _1260[0] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_4175 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4175 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4175 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4175 + 12u) / 4u]);
	            uint _4181 = _4173.y;
	            _1260[1] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_4181 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4181 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4181 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4181 + 12u) / 4u]);
	            uint _4187 = _4173.z;
	            _1260[2] = vec4(g_Vertices_1[nonuniformEXT(_240)]._member0[_4187 / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4187 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4187 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_240)]._member0[(_4187 + 12u) / 4u]);
	        }
	        else
	        {
	            _1260[0] = vec4(0.0);
	            _1260[1] = vec4(0.0);
	            _1260[2] = vec4(0.0);
	        }
	        break;
	    } while(false);
	    _1257 = 0;
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vNormalOs = _1259[_1257];
	        _1262[_1257].vTangentUOs_flTangentVSign = _1260[_1257];
	        _1257++;
	        continue;
	    }
	    vec4 _1261[3];
	    _1261[0] = vec4(0.0);
	    _1261[1] = vec4(0.0);
	    _1261[2] = vec4(0.0);
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].y != 0)
	    {
	        ivec4 _1205 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _278 = uint(_1205[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].z]);
	        uint _4231 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].z);
	        ivec4 _1203 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1204 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _4247 = (uvec3(uint(_1203[_4231])) * _1254) + uvec3(uint(_1204[_4231]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].y == 2)
	        {
	            uint _4288 = _4247.x;
	            _1261[0] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_4288 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4288 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4288 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4288 + 12u) / 4u]);
	            uint _4293 = _4247.y;
	            _1261[1] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_4293 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4293 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4293 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4293 + 12u) / 4u]);
	            uint _4298 = _4247.z;
	            _1261[2] = vec4(g_Vertices_1[nonuniformEXT(_278)]._member0[_4298 / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4298 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4298 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_278)]._member0[(_4298 + 12u) / 4u]);
	        }
	        else
	        {
	            if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vTexCoordFieldInfo.data[4].y == 28)
	            {
	                uint _280 = _4247.x / 4u;
	                _1261[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_280] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	                uint _283 = _4247.y / 4u;
	                _1261[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_283] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	                uint _286 = _4247.z / 4u;
	                _1261[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 255u, (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_278)]._member0[_286] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            }
	        }
	    }
	    _1257 = 0;
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vColorBlendValues = _1261[_1257].xyz;
	        _1257++;
	        continue;
	    }
	    if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y != 0)
	    {
	        ivec4 _1202 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nVertexAndIndexBuffers;
	        uint _326 = uint(_1202[g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z]);
	        uint _4343 = uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].z);
	        ivec4 _1200 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferStrideInBytes;
	        ivec4 _1201 = g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_nBufferBindOffsetBytes;
	        uvec3 _4359 = (uvec3(uint(_1200[_4343])) * _1254) + uvec3(uint(_1201[_4343]) + uint(g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].x));
	        if (g_Geometries_1._member0[uint(gl_InstanceCustomIndexEXT)].m_vColorFieldInfo.data[0].y == 2)
	        {
	            uint _4401 = _4359.x;
	            _1261[0] = vec4(g_Vertices_1[nonuniformEXT(_326)]._member0[_4401 / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4401 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4401 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4401 + 12u) / 4u]);
	            uint _4407 = _4359.y;
	            _1261[1] = vec4(g_Vertices_1[nonuniformEXT(_326)]._member0[_4407 / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4407 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4407 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4407 + 12u) / 4u]);
	            uint _4413 = _4359.z;
	            _1261[2] = vec4(g_Vertices_1[nonuniformEXT(_326)]._member0[_4413 / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4413 + 4u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4413 + 8u) / 4u], g_Vertices_1[nonuniformEXT(_326)]._member0[(_4413 + 12u) / 4u]);
	        }
	        else
	        {
	            uint _328 = _4359.x / 4u;
	            _1261[0] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_326)]._member0[_328] & 255u, (g_Vertices_3[nonuniformEXT(_326)]._member0[_328] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_326)]._member0[_328] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_326)]._member0[_328] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _331 = _4359.y / 4u;
	            _1261[1] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_326)]._member0[_331] & 255u, (g_Vertices_3[nonuniformEXT(_326)]._member0[_331] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_326)]._member0[_331] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_326)]._member0[_331] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	            uint _334 = _4359.z / 4u;
	            _1261[2] = vec4(uvec4(g_Vertices_3[nonuniformEXT(_326)]._member0[_334] & 255u, (g_Vertices_3[nonuniformEXT(_326)]._member0[_334] & 65280u) >> uint(8), (g_Vertices_3[nonuniformEXT(_326)]._member0[_334] & 16711680u) >> uint(16), (g_Vertices_3[nonuniformEXT(_326)]._member0[_334] & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	        }
	    }
	    else
	    {
	        _1261[0] = vec4(0.0);
	        _1261[1] = vec4(0.0);
	        _1261[2] = vec4(0.0);
	    }
	    _1257 = 0;
	    for (;;)
	    {
	        if (!(_1257 < 3))
	        {
	            break;
	        }
	        _1262[_1257].vBlendColorTint = _1261[_1257];
	        _1257++;
	        continue;
	    }
	    vec3 _1083 = _1262[0].vPositionOs;
	    vec2 _1082 = _1262[0].vTexCoord;
	    vec2 _1081 = _1262[0].vTexCoord2;
	    vec3 _1080 = _1262[0].vNormalOs;
	    vec4 _1079 = _1262[0].vTangentUOs_flTangentVSign;
	    vec3 _1078 = _1262[0].vColorBlendValues;
	    vec4 _1077 = _1262[0].vBlendColorTint;
	    vec3 _1089 = vec3(0.0);
	    vec4 _1088 = vec4(0.0);
	    vec3 _1087 = vec3(0.0);
	    vec4 _1086 = vec4(0.0);
	    vec4 _1085 = vec4(0.0);
	    mat3x4 _4447 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _4449 = transpose(gl_WorldToObjectEXT);
	    mat3 _1198;
	    mat3 _4452 = _1198;
	    _4452[0] = _4449[0].xyz;
	    _4452[1] = _4449[1].xyz;
	    _4452[2] = _4449[2].xyz;
	    _1198 = _4452;
	    mat3 _4460 = transpose(_4452);
	    vec4 _4474 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _1197 = _4474;
	    vec3 _4475 = _4474.xyz;
	    vec3 _4476 = _4475 * vec3(0.077399380505084991455078125);
	    vec3 _4479 = pow((_4475 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1194;
	    if (_4474.x <= 0.040449999272823333740234375)
	    {
	        _1194 = _4476.x;
	    }
	    else
	    {
	        _1194 = _4479.x;
	    }
	    float _1195;
	    if (_4474.y <= 0.040449999272823333740234375)
	    {
	        _1195 = _4476.y;
	    }
	    else
	    {
	        _1195 = _4479.y;
	    }
	    float _1196;
	    if (_4474.z <= 0.040449999272823333740234375)
	    {
	        _1196 = _4476.z;
	    }
	    else
	    {
	        _1196 = _4479.z;
	    }
	    vec3 _4504 = vec3(_1194, _1195, _1196);
	    vec4 _4506 = _1197;
	    _4506.x = _4504.x;
	    _4506.y = _4504.y;
	    _4506.z = _4504.z;
	    _1197 = _4506;
	    vec4 _4513 = _1086;
	    _4513.x = _4506.x;
	    _4513.y = _4506.y;
	    _4513.z = _4506.z;
	    _4513.w = _4506.w;
	    _1086 = _4513;
	    vec3 _4524 = _1077.xyz * vec3(0.077399380505084991455078125);
	    vec3 _4527 = pow((_1077.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1191;
	    if (_1077.x <= 0.040449999272823333740234375)
	    {
	        _1191 = _4524.x;
	    }
	    else
	    {
	        _1191 = _4527.x;
	    }
	    float _1192;
	    if (_1077.y <= 0.040449999272823333740234375)
	    {
	        _1192 = _4524.y;
	    }
	    else
	    {
	        _1192 = _4527.y;
	    }
	    float _1193;
	    if (_1077.z <= 0.040449999272823333740234375)
	    {
	        _1193 = _4524.z;
	    }
	    else
	    {
	        _1193 = _4527.z;
	    }
	    vec3 _4556 = _4513.xyz * mix(vec3(1.0), vec3(_1191, _1192, _1193), vec3(_1077.w));
	    vec4 _4558 = _1086;
	    _4558.x = _4556.x;
	    _4558.y = _4556.y;
	    _4558.z = _4556.z;
	    _1086 = _4558;
	    vec4 _1199;
	    vec4 _4567 = _1199;
	    _4567.x = _1079.x;
	    _4567.y = _1079.y;
	    _4567.z = _1079.z;
	    _4567.w = _1079.w;
	    _1199 = _4567;
	    vec3 _4577 = normalize(_1080 * _4460);
	    vec3 _4580 = normalize(_4567.xyz * _4460);
	    vec4 _4582 = _1085;
	    _4582.x = _4580.x;
	    _4582.y = _4580.y;
	    _4582.z = _4580.z;
	    _4582.w = _4567.w;
	    _1085 = _4582;
	    vec3 _4591 = _1089;
	    _4591.x = _4577.x;
	    _4591.y = _4577.y;
	    _4591.z = _4577.z;
	    _1089 = _4591;
	    vec2 _1084 = _1078.xy;
	    vec3 _4605 = (vec4(_1083.xyz, 1.0) * _4447) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _4607 = _1087;
	    _4607.x = _4605.x;
	    _4607.y = _4605.y;
	    _4607.z = _4605.z;
	    _1087 = _4607;
	    vec4 _4615 = _1088;
	    _4615.x = _1082.x;
	    _4615.y = _1082.y;
	    _4615.z = _1081.x;
	    _4615.w = _1081.y;
	    _1088 = _4615;
	    vec4 _1189 = _4615;
	    bool _1190;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _1190 = true;
	    }
	    else
	    {
	        _1190 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_1190)
	    {
	        vec4 _4634 = _1189;
	        bvec4 _4636 = greaterThanEqual(_4634.xyzw, vec4(0.0));
	        vec4 _4637 = _4447[0];
	        vec4 _4639 = _4447[1];
	        vec4 _4641 = _4447[2];
	        float _4644 = length(vec3(_4637.x, _4639.x, _4641.x));
	        float _4649 = length(vec3(_4637.y, _4639.y, _4641.y));
	        float _4654 = length(vec3(_4637.z, _4639.z, _4641.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _4659 = vec4(_4644, _4649, _4654, 1.0);
	            if (_4636.x)
	            {
	                vec4 _4673 = _1189;
	                _4673.x = ((_4673.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_4659, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _1189 = _4673;
	            }
	            if (_4636.y)
	            {
	                vec4 _4685 = _1189;
	                _4685.y = ((_4685.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_4659, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _1189 = _4685;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _4695 = vec4(_4644, _4649, _4654, 1.0);
	            if (_4636.z)
	            {
	                vec4 _4709 = _1189;
	                _4709.z = ((_4709.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_4695, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _1189 = _4709;
	            }
	            if (_4636.w)
	            {
	                vec4 _4721 = _1189;
	                _4721.w = ((_4721.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_4695, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _1189 = _4721;
	            }
	        }
	    }
	    _1088 = _1189;
	    vec3 _1045 = _1089;
	    vec4 _1044 = _1189;
	    vec3 _1043 = _1087;
	    vec4 _1042 = _1086;
	    vec4 _1041 = _1085;
	    vec2 _1040 = _1084;
	    vec3 _1076 = _1262[1].vPositionOs;
	    vec2 _1075 = _1262[1].vTexCoord;
	    vec2 _1074 = _1262[1].vTexCoord2;
	    vec3 _1073 = _1262[1].vNormalOs;
	    vec4 _1072 = _1262[1].vTangentUOs_flTangentVSign;
	    vec3 _1071 = _1262[1].vColorBlendValues;
	    vec4 _1070 = _1262[1].vBlendColorTint;
	    vec3 _1095 = vec3(0.0);
	    vec4 _1094 = vec4(0.0);
	    vec3 _1093 = vec3(0.0);
	    vec4 _1092 = vec4(0.0);
	    vec4 _1091 = vec4(0.0);
	    mat3x4 _4743 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _4745 = transpose(gl_WorldToObjectEXT);
	    mat3 _1187;
	    mat3 _4748 = _1187;
	    _4748[0] = _4745[0].xyz;
	    _4748[1] = _4745[1].xyz;
	    _4748[2] = _4745[2].xyz;
	    _1187 = _4748;
	    mat3 _4756 = transpose(_4748);
	    vec4 _4770 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _1186 = _4770;
	    vec3 _4771 = _4770.xyz;
	    vec3 _4772 = _4771 * vec3(0.077399380505084991455078125);
	    vec3 _4775 = pow((_4771 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1183;
	    if (_4770.x <= 0.040449999272823333740234375)
	    {
	        _1183 = _4772.x;
	    }
	    else
	    {
	        _1183 = _4775.x;
	    }
	    float _1184;
	    if (_4770.y <= 0.040449999272823333740234375)
	    {
	        _1184 = _4772.y;
	    }
	    else
	    {
	        _1184 = _4775.y;
	    }
	    float _1185;
	    if (_4770.z <= 0.040449999272823333740234375)
	    {
	        _1185 = _4772.z;
	    }
	    else
	    {
	        _1185 = _4775.z;
	    }
	    vec3 _4800 = vec3(_1183, _1184, _1185);
	    vec4 _4802 = _1186;
	    _4802.x = _4800.x;
	    _4802.y = _4800.y;
	    _4802.z = _4800.z;
	    _1186 = _4802;
	    vec4 _4809 = _1092;
	    _4809.x = _4802.x;
	    _4809.y = _4802.y;
	    _4809.z = _4802.z;
	    _4809.w = _4802.w;
	    _1092 = _4809;
	    vec3 _4820 = _1070.xyz * vec3(0.077399380505084991455078125);
	    vec3 _4823 = pow((_1070.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1180;
	    if (_1070.x <= 0.040449999272823333740234375)
	    {
	        _1180 = _4820.x;
	    }
	    else
	    {
	        _1180 = _4823.x;
	    }
	    float _1181;
	    if (_1070.y <= 0.040449999272823333740234375)
	    {
	        _1181 = _4820.y;
	    }
	    else
	    {
	        _1181 = _4823.y;
	    }
	    float _1182;
	    if (_1070.z <= 0.040449999272823333740234375)
	    {
	        _1182 = _4820.z;
	    }
	    else
	    {
	        _1182 = _4823.z;
	    }
	    vec3 _4852 = _4809.xyz * mix(vec3(1.0), vec3(_1180, _1181, _1182), vec3(_1070.w));
	    vec4 _4854 = _1092;
	    _4854.x = _4852.x;
	    _4854.y = _4852.y;
	    _4854.z = _4852.z;
	    _1092 = _4854;
	    vec4 _1188;
	    vec4 _4863 = _1188;
	    _4863.x = _1072.x;
	    _4863.y = _1072.y;
	    _4863.z = _1072.z;
	    _4863.w = _1072.w;
	    _1188 = _4863;
	    vec3 _4873 = normalize(_1073 * _4756);
	    vec3 _4876 = normalize(_4863.xyz * _4756);
	    vec4 _4878 = _1091;
	    _4878.x = _4876.x;
	    _4878.y = _4876.y;
	    _4878.z = _4876.z;
	    _4878.w = _4863.w;
	    _1091 = _4878;
	    vec3 _4887 = _1095;
	    _4887.x = _4873.x;
	    _4887.y = _4873.y;
	    _4887.z = _4873.z;
	    _1095 = _4887;
	    vec2 _1090 = _1071.xy;
	    vec3 _4901 = (vec4(_1076.xyz, 1.0) * _4743) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _4903 = _1093;
	    _4903.x = _4901.x;
	    _4903.y = _4901.y;
	    _4903.z = _4901.z;
	    _1093 = _4903;
	    vec4 _4911 = _1094;
	    _4911.x = _1075.x;
	    _4911.y = _1075.y;
	    _4911.z = _1074.x;
	    _4911.w = _1074.y;
	    _1094 = _4911;
	    vec4 _1178 = _4911;
	    bool _1179;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _1179 = true;
	    }
	    else
	    {
	        _1179 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_1179)
	    {
	        vec4 _4930 = _1178;
	        bvec4 _4932 = greaterThanEqual(_4930.xyzw, vec4(0.0));
	        vec4 _4933 = _4743[0];
	        vec4 _4935 = _4743[1];
	        vec4 _4937 = _4743[2];
	        float _4940 = length(vec3(_4933.x, _4935.x, _4937.x));
	        float _4945 = length(vec3(_4933.y, _4935.y, _4937.y));
	        float _4950 = length(vec3(_4933.z, _4935.z, _4937.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _4955 = vec4(_4940, _4945, _4950, 1.0);
	            if (_4932.x)
	            {
	                vec4 _4969 = _1178;
	                _4969.x = ((_4969.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_4955, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _1178 = _4969;
	            }
	            if (_4932.y)
	            {
	                vec4 _4981 = _1178;
	                _4981.y = ((_4981.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_4955, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _1178 = _4981;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _4991 = vec4(_4940, _4945, _4950, 1.0);
	            if (_4932.z)
	            {
	                vec4 _5005 = _1178;
	                _5005.z = ((_5005.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_4991, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _1178 = _5005;
	            }
	            if (_4932.w)
	            {
	                vec4 _5017 = _1178;
	                _5017.w = ((_5017.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_4991, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _1178 = _5017;
	            }
	        }
	    }
	    _1094 = _1178;
	    vec3 _1039 = _1095;
	    vec4 _1038 = _1178;
	    vec3 _1037 = _1093;
	    vec4 _1036 = _1092;
	    vec4 _1035 = _1091;
	    vec2 _1034 = _1090;
	    vec3 _1069 = _1262[2].vPositionOs;
	    vec2 _1068 = _1262[2].vTexCoord;
	    vec2 _1067 = _1262[2].vTexCoord2;
	    vec3 _1066 = _1262[2].vNormalOs;
	    vec4 _1065 = _1262[2].vTangentUOs_flTangentVSign;
	    vec3 _1064 = _1262[2].vColorBlendValues;
	    vec4 _1063 = _1262[2].vBlendColorTint;
	    vec3 _1101 = vec3(0.0);
	    vec4 _1100 = vec4(0.0);
	    vec3 _1099 = vec3(0.0);
	    vec4 _1098 = vec4(0.0);
	    vec4 _1097 = vec4(0.0);
	    mat3x4 _5039 = transpose(gl_ObjectToWorldEXT);
	    mat3x4 _5041 = transpose(gl_WorldToObjectEXT);
	    mat3 _1176;
	    mat3 _5044 = _1176;
	    _5044[0] = _5041[0].xyz;
	    _5044[1] = _5041[1].xyz;
	    _5044[2] = _5041[2].xyz;
	    _1176 = _5044;
	    mat3 _5052 = transpose(_5044);
	    vec4 _5066 = vec4(uvec4(g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 255u, (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 65280u) >> uint(8), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 16711680u) >> uint(16), (g_instanceBuffer._member0[uint(gl_InstanceID)].nSrgbColor & 4278190080u) >> uint(24))) * vec4(0.0039215688593685626983642578125);
	    vec4 _1175 = _5066;
	    vec3 _5067 = _5066.xyz;
	    vec3 _5068 = _5067 * vec3(0.077399380505084991455078125);
	    vec3 _5071 = pow((_5067 * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1172;
	    if (_5066.x <= 0.040449999272823333740234375)
	    {
	        _1172 = _5068.x;
	    }
	    else
	    {
	        _1172 = _5071.x;
	    }
	    float _1173;
	    if (_5066.y <= 0.040449999272823333740234375)
	    {
	        _1173 = _5068.y;
	    }
	    else
	    {
	        _1173 = _5071.y;
	    }
	    float _1174;
	    if (_5066.z <= 0.040449999272823333740234375)
	    {
	        _1174 = _5068.z;
	    }
	    else
	    {
	        _1174 = _5071.z;
	    }
	    vec3 _5096 = vec3(_1172, _1173, _1174);
	    vec4 _5098 = _1175;
	    _5098.x = _5096.x;
	    _5098.y = _5096.y;
	    _5098.z = _5096.z;
	    _1175 = _5098;
	    vec4 _5105 = _1098;
	    _5105.x = _5098.x;
	    _5105.y = _5098.y;
	    _5105.z = _5098.z;
	    _5105.w = _5098.w;
	    _1098 = _5105;
	    vec3 _5116 = _1063.xyz * vec3(0.077399380505084991455078125);
	    vec3 _5119 = pow((_1063.xyz * vec3(0.947867333889007568359375)) + vec3(0.052132703363895416259765625), vec3(2.400000095367431640625));
	    float _1169;
	    if (_1063.x <= 0.040449999272823333740234375)
	    {
	        _1169 = _5116.x;
	    }
	    else
	    {
	        _1169 = _5119.x;
	    }
	    float _1170;
	    if (_1063.y <= 0.040449999272823333740234375)
	    {
	        _1170 = _5116.y;
	    }
	    else
	    {
	        _1170 = _5119.y;
	    }
	    float _1171;
	    if (_1063.z <= 0.040449999272823333740234375)
	    {
	        _1171 = _5116.z;
	    }
	    else
	    {
	        _1171 = _5119.z;
	    }
	    vec3 _5148 = _5105.xyz * mix(vec3(1.0), vec3(_1169, _1170, _1171), vec3(_1063.w));
	    vec4 _5150 = _1098;
	    _5150.x = _5148.x;
	    _5150.y = _5148.y;
	    _5150.z = _5148.z;
	    _1098 = _5150;
	    vec4 _1177;
	    vec4 _5159 = _1177;
	    _5159.x = _1065.x;
	    _5159.y = _1065.y;
	    _5159.z = _1065.z;
	    _5159.w = _1065.w;
	    _1177 = _5159;
	    vec3 _5169 = normalize(_1066 * _5052);
	    vec3 _5172 = normalize(_5159.xyz * _5052);
	    vec4 _5174 = _1097;
	    _5174.x = _5172.x;
	    _5174.y = _5172.y;
	    _5174.z = _5172.z;
	    _5174.w = _5159.w;
	    _1097 = _5174;
	    vec3 _5183 = _1101;
	    _5183.x = _5169.x;
	    _5183.y = _5169.y;
	    _5183.z = _5169.z;
	    _1101 = _5183;
	    vec2 _1096 = _1064.xy;
	    vec3 _5197 = (vec4(_1069.xyz, 1.0) * _5039) - PerViewConstantBuffer_t.g_vCameraPositionWs.xyz;
	    vec3 _5199 = _1099;
	    _5199.x = _5197.x;
	    _5199.y = _5197.y;
	    _5199.z = _5197.z;
	    _1099 = _5199;
	    vec4 _5207 = _1100;
	    _5207.x = _1068.x;
	    _5207.y = _1068.y;
	    _5207.z = _1067.x;
	    _5207.w = _1067.y;
	    _1100 = _5207;
	    vec4 _1167 = _5207;
	    bool _1168;
	    if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	    {
	        _1168 = true;
	    }
	    else
	    {
	        _1168 = _g_rtx_material_data_.g_bTexCoord2ScaleByModel;
	    }
	    if (_1168)
	    {
	        vec4 _5226 = _1167;
	        bvec4 _5228 = greaterThanEqual(_5226.xyzw, vec4(0.0));
	        vec4 _5229 = _5039[0];
	        vec4 _5231 = _5039[1];
	        vec4 _5233 = _5039[2];
	        float _5236 = length(vec3(_5229.x, _5231.x, _5233.x));
	        float _5241 = length(vec3(_5229.y, _5231.y, _5233.y));
	        float _5246 = length(vec3(_5229.z, _5231.z, _5233.z));
	        if (_g_rtx_material_data_.g_bTexCoordScaleByModel)
	        {
	            vec4 _5251 = vec4(_5236, _5241, _5246, 1.0);
	            if (_5228.x)
	            {
	                vec4 _5265 = _1167;
	                _5265.x = ((_5265.x - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x) * dot(_5251, _g_rtx_material_data_.g_vTexCoordScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.x;
	                _1167 = _5265;
	            }
	            if (_5228.y)
	            {
	                vec4 _5277 = _1167;
	                _5277.y = ((_5277.y - _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y) * dot(_5251, _g_rtx_material_data_.g_vTexCoordScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoordScaleByModelOrigin.y;
	                _1167 = _5277;
	            }
	        }
	        if (_g_rtx_material_data_.g_bTexCoord2ScaleByModel)
	        {
	            vec4 _5287 = vec4(_5236, _5241, _5246, 1.0);
	            if (_5228.z)
	            {
	                vec4 _5301 = _1167;
	                _5301.z = ((_5301.z - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x) * dot(_5287, _g_rtx_material_data_.g_vTexCoord2ScaleByModelU.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.x;
	                _1167 = _5301;
	            }
	            if (_5228.w)
	            {
	                vec4 _5313 = _1167;
	                _5313.w = ((_5313.w - _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y) * dot(_5287, _g_rtx_material_data_.g_vTexCoord2ScaleByModelV.xyzw)) + _g_rtx_material_data_.g_vTexCoord2ScaleByModelOrigin.y;
	                _1167 = _5313;
	            }
	        }
	    }
	    _1100 = _1167;
	    vec3 _1033 = _1101;
	    vec3 _1032 = _1099;
	    vec3 _5347 = ((_1045 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1039 * attrs.barycentrics.x)) + (_1101 * attrs.barycentrics.y);
	    vec4 _5378 = ((_1041 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1035 * attrs.barycentrics.x)) + (_1097 * attrs.barycentrics.y);
	    vec4 _1114 = ((_1044 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1038 * attrs.barycentrics.x)) + (_1167 * attrs.barycentrics.y);
	    vec4 _1113 = ((_1042 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1036 * attrs.barycentrics.x)) + (_1098 * attrs.barycentrics.y);
	    vec2 _1112 = ((_1040 * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1034 * attrs.barycentrics.x)) + (_1096 * attrs.barycentrics.y);
	    vec3 _1111 = normalize(cross(_1037 - _1043, _1099 - _1043));
	    vec3 _1118 = vec3(0.0);
	    vec3 _1117 = vec3(0.0);
	    float _1146;
	    if (_5378.w > 0.0)
	    {
	        _1146 = 1.0;
	    }
	    else
	    {
	        _1146 = -1.0;
	    }
	    vec3 _5393 = _5378.xyz;
	    float _5398 = 1.0 / length(_5347);
	    vec3 _1119 = _5347 * _5398;
	    vec3 _1049 = _5393 * _5398;
	    vec3 _1048 = (cross(_5347, _5393) * _1146) * _5398;
	    if (false)
	    {
	        _1119 *= (-1.0);
	    }
	    vec3 _1116 = _1118 - (_1119 * dot(_1118, _1119));
	    vec3 _1115 = _1117 - (_1119 * dot(_1117, _1119));
	    int _1147;
	    if (dot(_1117, cross(_1119, _1118)) < 0.0)
	    {
	        _1147 = -1;
	    }
	    else
	    {
	        _1147 = 1;
	    }
	    vec3 _1124 = _1119;
	    vec3 _1123 = _1116;
	    vec3 _1122 = _1115;
	    float _1121 = float(_1147);
	    vec3 _1051 = _1049;
	    vec3 _1050 = _1048;
	    vec2 _5428 = _1112;
	    _5428.y = 0.0;
	    _1112 = _5428;
	    vec3 _1148;
	    vec3 _5431 = _1148;
	    _5431.z = _5428.y;
	    _1148 = _5431;
	    float _1149;
	    if (_5431.z < 1.0)
	    {
	        _1149 = _1112.x;
	    }
	    else
	    {
	        _1149 = 0.0;
	    }
	    vec3 _5441 = _1148;
	    _5441.y = _1149;
	    _1148 = _5441;
	    bool _1150;
	    if (_5441.z < 1.0)
	    {
	        _1150 = _1148.y < 1.0;
	    }
	    else
	    {
	        _1150 = false;
	    }
	    vec3 _5453 = _1148;
	    _5453.x = float(_1150);
	    vec3 _5459 = _5453.xyz * vec3(greaterThan(_5453.xyz, vec3(9.9999997473787516355514526367188e-06)));
	    vec3 _5461 = _5453;
	    _5461.x = _5459.x;
	    _5461.y = _5459.y;
	    _5461.z = _5459.z;
	    _1148 = _5461;
	    vec4 _1110 = vec4(0.0);
	    vec4 _1109 = vec4(0.0);
	    vec4 _1108 = vec4(0.0);
	    vec4 _1107 = vec4(0.0);
	    vec4 _1106 = vec4(0.0);
	    vec4 _1105 = vec4(0.0);
	    vec4 _1104 = vec4(0.0);
	    vec3 _1151;
	    SPIRV_CROSS_BRANCH
	    if (_5461.x > 0.0)
	    {
	        vec2 _1145;
	        if (false)
	        {
	            _1145 = _1114.zw;
	        }
	        else
	        {
	            _1145 = _1114.xy;
	        }
	        vec2 _5481 = _1145 + _g_rtx_material_data_.g_vUvTransform1.zw;
	        vec2 _5496 = vec2((_g_rtx_material_data_.g_vUvTransform1.y * _5481.x) - (_g_rtx_material_data_.g_vUvTransform1.x * _5481.y), dot(_g_rtx_material_data_.g_vUvTransform1.xy, _5481.xy)).xy;
	        _1110 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor1], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5496, 0.0).xyzw;
	        vec4 _5504 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughness1], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5496, 0.0).xyzw;
	        _1107 = _5504;
	        _1105 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tPacked1], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5496, 0.0).xyzw;
	        float _5510 = _5504.x;
	        float _5511 = _5504.y;
	        float _5513 = (_5510 + _5511) - 1.00392162799835205078125;
	        float _5514 = _5510 - _5511;
	        vec3 _5521 = normalize(vec3(vec2(_5513, _5514), (1.0 - abs(_5513)) - abs(_5514)));
	        vec3 _5522 = abs(_5521);
	        vec2 _5539 = ((-vec2(_5521.x, (-1.0) * _5521.y)) / vec2(max(_5522.z, 0.0078125 * max(_5522.x, _5522.y)))) * _g_rtx_material_data_.g_fLayerNormalStrength1;
	        _1151 = (_1051 * _5539.x) + (_1050 * _5539.y);
	    }
	    else
	    {
	        _1151 = vec3(0.0);
	    }
	    if (_g_rtx_material_data_.g_bUvOverlay)
	    {
	        vec2 _1144;
	        if (_g_rtx_material_data_.g_bUseSecondaryUvForOverlay)
	        {
	            _1144 = _1114.zw;
	        }
	        else
	        {
	            _1144 = _1114.xy;
	        }
	        vec2 _5560 = _1144 + _g_rtx_material_data_.g_vUvTransformOverlay.zw;
	        vec4 _5577 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tRevealOverlay], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), vec2((_g_rtx_material_data_.g_vUvTransformOverlay.y * _5560.x) - (_g_rtx_material_data_.g_vUvTransformOverlay.x * _5560.y), dot(_g_rtx_material_data_.g_vUvTransformOverlay.xy, _5560.xy)).xy, 0.0);
	        float _5578 = _5577.x;
	        if (_g_rtx_material_data_.g_bRevealOverlayInvert2)
	        {
	            _1149 = 1.0 - _5578;
	        }
	        else
	        {
	            _1149 = _5578;
	        }
	        vec3 _5584 = _1148;
	        _5584.y = saturate(_5584.y + (_1149 * _g_rtx_material_data_.g_flRevealOverlayStrength2));
	        _1148 = _5584;
	    }
	    vec3 _1152;
	    SPIRV_CROSS_BRANCH
	    if (_1148.y > 0.0)
	    {
	        vec2 _1143;
	        if (false)
	        {
	            _1143 = _1114.zw;
	        }
	        else
	        {
	            _1143 = _1114.xy;
	        }
	        vec2 _5609 = _1143 + _g_rtx_material_data_.g_vUvTransform2.zw;
	        vec2 _1142;
	        if (_g_rtx_material_data_.g_bRevealUseSecondaryUv2)
	        {
	            _1142 = _1114.zw;
	        }
	        else
	        {
	            _1142 = _1114.xy;
	        }
	        vec2 _5632 = _1142 + _g_rtx_material_data_.g_vRevealUvTransform2.zw;
	        vec2 _5647 = vec2((_g_rtx_material_data_.g_vUvTransform2.y * _5609.x) - (_g_rtx_material_data_.g_vUvTransform2.x * _5609.y), dot(_g_rtx_material_data_.g_vUvTransform2.xy, _5609.xy)).xy;
	        _1109 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColor2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5647, 0.0).xyzw;
	        vec4 _5654 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughness2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5647, 0.0);
	        _1106 = _5654.xyzw;
	        float _5656 = _5654.x;
	        float _5657 = _5654.y;
	        float _5659 = (_5656 + _5657) - 1.00392162799835205078125;
	        float _5660 = _5656 - _5657;
	        vec3 _5667 = normalize(vec3(vec2(_5659, _5660), (1.0 - abs(_5659)) - abs(_5660)));
	        vec3 _5668 = abs(_5667);
	        vec2 _5685 = ((-vec2(_5667.x, (-1.0) * _5667.y)) / vec2(max(_5668.z, 0.0078125 * max(_5668.x, _5668.y)))) * _g_rtx_material_data_.g_fLayerNormalStrength2;
	        _1104 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tPacked2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _5647, 0.0).xyzw;
	        _1149 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tRevealMask2], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), vec2((_g_rtx_material_data_.g_vRevealUvTransform2.y * _5632.x) - (_g_rtx_material_data_.g_vRevealUvTransform2.x * _5632.y), dot(_g_rtx_material_data_.g_vRevealUvTransform2.xy, _5632.xy)).xy, 0.0).x;
	        _1152 = (_1051 * _5685.x) + (_1050 * _5685.y);
	    }
	    else
	    {
	        _1149 = 0.5;
	        _1152 = vec3(0.0);
	    }
	    float _1155 = saturate((((_1107.z - 0.5) + _g_rtx_material_data_.g_vLayerRoughnessContrastBrightness1.y) * _g_rtx_material_data_.g_vLayerRoughnessContrastBrightness1.x) + 0.5);
	    float _1156 = saturate((((_1106.z - 0.5) + _g_rtx_material_data_.g_vLayerRoughnessContrastBrightness2.y) * _g_rtx_material_data_.g_vLayerRoughnessContrastBrightness2.x) + 0.5);
	    float _5747 = saturate((((_1110.w - 0.5) + _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness1.y) * _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness1.x) + 0.5);
	    float _5756 = saturate((((_1109.w - 0.5) + _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness2.y) * _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness2.x) + 0.5);
	    float _5765 = saturate((((_1108.w - 0.5) + _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness3.y) * _g_rtx_material_data_.g_vLayerTintMaskContrastBrightness3.x) + 0.5);
	    float _5774 = saturate((((_1105.y - 0.5) + _g_rtx_material_data_.g_vLayerMetalnessContrastBrightness1.y) * _g_rtx_material_data_.g_vLayerMetalnessContrastBrightness1.x) + 0.5);
	    float _5785 = _1105.x * _g_rtx_material_data_.g_fLayerSelfIllumScale1;
	    float _5787 = _1104.x * _g_rtx_material_data_.g_fLayerSelfIllumScale2;
	    vec3 _5791 = (vec4(_1110.xyz, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect1).xyz;
	    vec3 _1153 = _5791;
	    vec3 _5795 = (vec4(_1109.xyz, 1.0) * _g_rtx_material_data_.g_mAlbedoColorCorrect2).xyz;
	    vec3 _1154 = _5795;
	    float _1157;
	    if (_g_rtx_material_data_.g_bMaskColorTint1)
	    {
	        _1157 = _5747;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    _1153 = mix(_5791, (vec4(_5791.xyz, 1.0) * _g_rtx_material_data_.g_mTextureColorTint1).xyz, vec3(_1157));
	    if (_g_rtx_material_data_.g_bMaskColorTint2)
	    {
	        _1157 = _5756;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    _1154 = mix(_1154, (vec4(_5795.xyz, 1.0) * _g_rtx_material_data_.g_mTextureColorTint2).xyz, vec3(_1157));
	    if (_g_rtx_material_data_.g_bMaskColorTint3)
	    {
	        _1157 = _5765;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    if (_g_rtx_material_data_.g_bMaskVertexColorTint1)
	    {
	        _1157 = _5747;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    float _5834 = _1157;
	    if (_g_rtx_material_data_.g_bMaskVertexColorTint2)
	    {
	        _1157 = _5756;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    float _5842 = _1157;
	    if (_g_rtx_material_data_.g_bMaskVertexColorTint3)
	    {
	        _1157 = _5765;
	    }
	    else
	    {
	        _1157 = 1.0;
	    }
	    if (_g_rtx_material_data_.g_bModelTint1)
	    {
	        _1157 = _5834 * _g_rtx_material_data_.g_fVertexColorStrength1;
	    }
	    else
	    {
	        _1157 = 0.0;
	    }
	    float _1158;
	    if (_g_rtx_material_data_.g_bModelTint2)
	    {
	        _1158 = _5842 * _g_rtx_material_data_.g_fVertexColorStrength2;
	    }
	    else
	    {
	        _1158 = 0.0;
	    }
	    vec3 _5859 = _1153;
	    vec3 _5865 = mix(_5859, _5859 * _1113.xyz, vec3(_1157));
	    _1153 = _5865;
	    vec3 _5866 = _1154;
	    vec3 _5871 = mix(_5866, _5866 * _1113.xyz, vec3(_1158));
	    _1154 = _5871;
	    vec3 _5875 = (_5865 * _5785) * _g_rtx_material_data_.g_vLayerSelfIllumTint1;
	    if (_g_rtx_material_data_.g_bRevealInvert2)
	    {
	        _1149 = 1.0 - _1149;
	    }
	    float _1141;
	    do
	    {
	        float _5890 = _g_rtx_material_data_.g_flRevealOffset2 * 0.5;
	        float _5891 = 0.5 + _5890;
	        if (_1149 < 0.5)
	        {
	            _1141 = saturate(_1149 * 2.0) * _5891;
	            break;
	        }
	        else
	        {
	            _1141 = (saturate((_1149 - 0.5) * 2.0) * (0.5 - _5890)) + _5891;
	            break;
	        }
	        break;
	    } while(false);
	    if (_g_rtx_material_data_.g_bBorderEffects2)
	    {
	        do
	        {
	            if (_1148.y == 0.0)
	            {
	                break;
	            }
	            float _5932 = (saturate(clamp(_1141, 9.9999997473787516355514526367188e-05, 0.99989998340606689453125)) * ((1.0 - _g_rtx_material_data_.g_flRevealSoftness2) - _g_rtx_material_data_.g_flRevealSoftness2)) + _g_rtx_material_data_.g_flRevealSoftness2;
	            float _1138;
	            float _1139;
	            float _1140;
	            if (_1148.y < _5932)
	            {
	                _1138 = max(9.9999997473787516355514526367188e-05, _5932 - (0.5 * _g_rtx_material_data_.g_vBorderWidth2.x));
	                _1139 = max(9.9999997473787516355514526367188e-05, _5932 - _g_rtx_material_data_.g_vBorderWidth2.x);
	                _1140 = _g_rtx_material_data_.g_vBorderSoftness2.x;
	            }
	            else
	            {
	                _1138 = min(0.99989998340606689453125, _5932 + (0.5 * _g_rtx_material_data_.g_vBorderWidth2.y));
	                _1139 = min(0.99989998340606689453125, _5932 + _g_rtx_material_data_.g_vBorderWidth2.y);
	                _1140 = _g_rtx_material_data_.g_vBorderSoftness2.y;
	            }
	            vec3 _5957 = vec3(_g_rtx_material_data_.g_vBorderLayerAmount2, 0.0) * smoothstep(mix(_1138, _1139, _1140), mix(_1138, _5932, _1140), _1148.y);
	            float _5959 = _5957.x;
	            _1155 = mix(_1155, _g_rtx_material_data_.g_flBorderRoughness2, _g_rtx_material_data_.g_flBorderRoughnessStrength2 * _5959);
	            float _5963 = _5957.y;
	            _1156 = mix(_1156, _g_rtx_material_data_.g_flBorderRoughness2, _g_rtx_material_data_.g_flBorderRoughnessStrength2 * _5963);
	            switch (_g_rtx_material_data_.g_nBorderBlendMode2)
	            {
	                case 0:
	                {
	                    _1153 *= mix(vec3(1.0), _g_rtx_material_data_.g_vBorderTint2.xyz, vec3(_5959 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    _1154 *= mix(vec3(1.0), _g_rtx_material_data_.g_vBorderTint2.xyz, vec3(_5963 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    break;
	                }
	                case 1:
	                {
	                    vec3 _5982 = _g_rtx_material_data_.g_vBorderTint2.xyz * 1.99215686321258544921875;
	                    _1153 *= mix(vec3(1.0), _5982, vec3(_5959 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    _1154 *= mix(vec3(1.0), _5982, vec3(_5963 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    break;
	                }
	                case 2:
	                {
	                    _1153 = mix(_1153, _g_rtx_material_data_.g_vBorderTint2.xyz, vec3(_5959 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    _1154 = mix(_1154, _g_rtx_material_data_.g_vBorderTint2.xyz, vec3(_5963 * _g_rtx_material_data_.g_vBorderTint2.w));
	                    break;
	                }
	                default:
	                {
	                    break;
	                }
	            }
	            break;
	        } while(false);
	    }
	    float _1159;
	    float _1160;
	    float _1161;
	    if (_g_rtx_material_data_.g_bUvOverlay)
	    {
	        if (_g_rtx_material_data_.g_bOverlayTintMaskInvert1)
	        {
	            _1159 = 1.0 - _5747;
	        }
	        else
	        {
	            _1159 = _5747;
	        }
	        if (_g_rtx_material_data_.g_bOverlayTintMaskInvert2)
	        {
	            _1160 = 1.0 - _5756;
	        }
	        else
	        {
	            _1160 = _5756;
	        }
	        if (_g_rtx_material_data_.g_bOverlayTintMaskInvert3)
	        {
	            _1161 = 1.0 - _5765;
	        }
	        else
	        {
	            _1161 = _5765;
	        }
	        if (!_g_rtx_material_data_.g_bOverlayUseTintMask1)
	        {
	            _1159 = 1.0;
	        }
	        if (!_g_rtx_material_data_.g_bOverlayUseTintMask2)
	        {
	            _1160 = 1.0;
	        }
	        if (!_g_rtx_material_data_.g_bOverlayUseTintMask3)
	        {
	            _1161 = 1.0;
	        }
	        vec2 _1162;
	        if (_g_rtx_material_data_.g_bUseSecondaryUvForOverlay)
	        {
	            _1162 = _1114.zw;
	        }
	        else
	        {
	            _1162 = _1114.xy;
	        }
	        if (_g_rtx_material_data_.g_bUseSecondaryUvForOverlay)
	        {
	            _1150 = true;
	        }
	        else
	        {
	            _1150 = any(notEqual(_g_rtx_material_data_.g_vOverlayScaleRotationTranslation, vec4(1.0, 0.0, 0.0, 0.0)));
	        }
	        vec3 _1102;
	        vec3 _1103;
	        if (_1150)
	        {
	            vec2 _1137;
	            if (_g_rtx_material_data_.g_bUseSecondaryUvForOverlay)
	            {
	                _1137 = _1114.zw;
	            }
	            else
	            {
	                _1137 = _1114.xy;
	            }
	            vec2 _6075 = _1137 + _g_rtx_material_data_.g_vUvTransformOverlay.zw;
	            float _1136;
	            if (false)
	            {
	                _1136 = -1.0;
	            }
	            else
	            {
	                _1136 = 1.0;
	            }
	            vec2 _6091 = vec2(0.0, -0.0) * _1136;
	            vec3 _1120 = (_1123 * _6091.x) + (_1122 * _6091.y);
	            float _6099 = abs(0.0);
	            if (_6099 > 0.0)
	            {
	                _1120 = normalize(_1120);
	            }
	            _1162 = vec2((_g_rtx_material_data_.g_vUvTransformOverlay.y * _6075.x) - (_g_rtx_material_data_.g_vUvTransformOverlay.x * _6075.y), dot(_g_rtx_material_data_.g_vUvTransformOverlay.xy, _6075.xy));
	            _1103 = _1120;
	            _1102 = cross(_1124, _1120) * (_1136 * _1121);
	        }
	        else
	        {
	            _1103 = _1051;
	            _1102 = _1050;
	        }
	        vec4 _6122 = textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tNormalRoughnessOverlay], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _1162.xy, 0.0);
	        float _6123 = _6122.x;
	        float _6124 = _6122.y;
	        float _6126 = (_6123 + _6124) - 1.00392162799835205078125;
	        float _6127 = _6123 - _6124;
	        vec3 _6134 = normalize(vec3(vec2(_6126, _6127), (1.0 - abs(_6126)) - abs(_6127)));
	        vec3 _6135 = abs(_6134);
	        vec2 _6148 = (-vec2(_6134.x, (-1.0) * _6134.y)) / vec2(max(_6135.z, 0.0078125 * max(_6135.x, _6135.y)));
	        vec3 _6155 = (_1103 * _6148.x) + (_1102 * _6148.y);
	        vec3 _6159 = ((textureLod(nonuniformEXT(sampler2D(g_bindless_Texture2D_float4[_g_rtx_material_data_.g_tColorOverlay], g_bindless_Sampler[_g_rtx_material_data_.g_sAniso])), _1162.xy, 0.0).xyz * 2.0) - vec3(1.0)).xyz;
	        vec3 _6180 = max(vec3(0.0), (((vec3(1.0) - pow(vec3(1.0) - max(vec3(0.0), _6159), vec3(_g_rtx_material_data_.g_flOverlayBrightnessContrast))) * _g_rtx_material_data_.g_flOverlayBrightnessContrast).xyz + ((pow(vec3(1.0) + min(vec3(0.0), _6159), vec3(_g_rtx_material_data_.g_flOverlayDarknessContrast)) - vec3(1.0)) * _g_rtx_material_data_.g_flOverlayDarknessContrast).xyz) + vec3(1.0));
	        vec3 _6182;
	        _6182.x = _6180.x;
	        _6182.y = _6180.y;
	        _6182.z = _6180.z;
	        _1153 = mix(_1153, _1153 * _6182.xyz, vec3(_1159 * _g_rtx_material_data_.g_flOverlayStrength1));
	        _1154 = mix(_1154, _1154 * _6182.xyz, vec3(_1160 * _g_rtx_material_data_.g_flOverlayStrength2));
	        float _6215 = (2.0 * _6122.z) - 1.0;
	        _1155 = saturate(_1155 + ((_6215 * _g_rtx_material_data_.g_flOverlayRoughnessStrength1) * _1159));
	        _1156 = saturate(_1156 + ((_6215 * _g_rtx_material_data_.g_flOverlayRoughnessStrength2) * _1160));
	        _1151 += (_6155 * (_g_rtx_material_data_.g_flOverlayNormalStrength1 * _1159));
	        _1152 += (_6155 * (_g_rtx_material_data_.g_flOverlayNormalStrength2 * _1160));
	    }
	    if (_g_rtx_material_data_.g_bAcceptStaticOverlays1)
	    {
	        float _1135;
	        if (_g_rtx_material_data_.g_flStaticOverlaysTintMaskInfluence1 < 0.0)
	        {
	            _1135 = 1.0 - _5747;
	        }
	        else
	        {
	            _1135 = _5747;
	        }
	        _1159 = max(0.0, 1.0 - (abs(_g_rtx_material_data_.g_flStaticOverlaysTintMaskInfluence1) * _1135));
	    }
	    else
	    {
	        _1159 = 0.0;
	    }
	    float _1163;
	    vec3 _1164;
	    vec3 _1165;
	    vec3 _1166;
	    SPIRV_CROSS_BRANCH
	    if (_1148.y > 0.0)
	    {
	        float _1134;
	        do
	        {
	            if (_1148.y == 1.0)
	            {
	                _1134 = 1.0;
	                break;
	            }
	            _1134 = smoothstep(-_g_rtx_material_data_.g_flRevealSoftness2, _g_rtx_material_data_.g_flRevealSoftness2, _1148.y - ((saturate(clamp(_1141, 9.9999997473787516355514526367188e-05, 0.99989998340606689453125)) * ((1.0 - _g_rtx_material_data_.g_flRevealSoftness2) - _g_rtx_material_data_.g_flRevealSoftness2)) + _g_rtx_material_data_.g_flRevealSoftness2));
	            break;
	        } while(false);
	        vec3 _6275 = vec3(_1134);
	        if (_g_rtx_material_data_.g_bAcceptStaticOverlays2)
	        {
	            float _1133;
	            if (_g_rtx_material_data_.g_flStaticOverlaysTintMaskInfluence2 < 0.0)
	            {
	                _1133 = 1.0 - _5756;
	            }
	            else
	            {
	                _1133 = _5756;
	            }
	            _1160 = max(0.0, 1.0 - (abs(_g_rtx_material_data_.g_flStaticOverlaysTintMaskInfluence2) * _1133));
	        }
	        else
	        {
	            _1160 = 0.0;
	        }
	        float _6303 = _1160;
	        _1164 = mix(_1151, _1152, _6275);
	        _1165 = mix(_1153, _1154, _6275);
	        _1160 = mix(_5774, saturate((((_1104.y - 0.5) + _g_rtx_material_data_.g_vLayerMetalnessContrastBrightness2.y) * _g_rtx_material_data_.g_vLayerMetalnessContrastBrightness2.x) + 0.5), _1134);
	        _1161 = mix(_1155, _1156, _1134);
	        _1159 = mix(_1159, _6303, _1134);
	        _1163 = mix(_5785, _5787, _1134);
	        _1166 = mix(_5875, (_5871 * _5787) * _g_rtx_material_data_.g_vLayerSelfIllumTint2, _6275);
	    }
	    else
	    {
	        _1164 = _1151;
	        _1165 = _1153;
	        _1160 = _5774;
	        _1161 = _1155;
	        _1163 = _5785;
	        _1166 = _5875;
	    }
	    vec3 _1062 = ((_1165 * 0.100000001490116119384765625) + _1166) / vec3(0.100000001490116119384765625 + _1163);
	    float _1061 = _1160;
	    float _1060 = 0.039999999105930328369140625;
	    vec2 _1059 = vec2(_1161);
	    vec3 _1058 = vec3(0.0);
	    float _1057 = _1163;
	    vec3 _1056 = normalize(_1124 - _1164);
	    vec3 _1055 = _1124;
	    vec3 _1054 = _1111;
	    bool _1053 = false;
	    vec3 _1131[3] = vec3[](_1043.xyz, _1037.xyz, _1032.xyz);
	    vec3 _1132[3] = vec3[](_1045, _1039, _1033);
	    vec3 _6346 = ((_1131[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1131[1] * attrs.barycentrics.x)) + (_1131[2] * attrs.barycentrics.y);
	    vec3 _1125[3];
	    _1125[0] = _6346 - (_1132[0] * dot(_6346 - _1131[0], _1132[0]));
	    _1125[1] = _6346 - (_1132[1] * dot(_6346 - _1131[1], _1132[1]));
	    _1125[2] = _6346 - (_1132[2] * dot(_6346 - _1131[2], _1132[2]));
	    vec3 _6386 = ((_1125[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1125[1] * attrs.barycentrics.x)) + (_1125[2] * attrs.barycentrics.y);
	    vec3 _1126[3];
	    _1126[0] = cross(_1131[0] - _1131[1], _1111);
	    _1126[1] = cross(_1131[1] - _1131[2], _1111);
	    _1126[2] = cross(_1131[2] - _1131[0], _1111);
	    float _1127 = dot(_6386 - _6346, _1111);
	    vec3 _1128 = _6386;
	    int _1129 = 0;
	    for (;;)
	    {
	        bool _6402_ladder_break = false;
	        do
	        {
	            if (!(_1129 < 3))
	            {
	                _6402_ladder_break = true;
	                break;
	            }
	            if (_1127 > 0.00999999977648258209228515625)
	            {
	                _6402_ladder_break = true;
	                break;
	            }
	            if (dot(_1126[_1129], _1126[_1129]) == 0.0)
	            {
	                break;
	            }
	            _1126[_1129] = normalize(_1126[_1129]);
	            int _1130 = 0;
	            for (;;)
	            {
	                if (!(_1130 < 3))
	                {
	                    break;
	                }
	                vec3 _6440 = _1132[_1130] - (_1126[_1129] * dot(_1126[_1129], _1132[_1130]));
	                _1125[_1130] = _6346 - (_6440 * dot(_6346 - _1131[_1130], _6440));
	                _1130++;
	                continue;
	            }
	            vec3 _6464 = ((_1125[0] * ((1.0 - attrs.barycentrics.x) - attrs.barycentrics.y)) + (_1125[1] * attrs.barycentrics.x)) + (_1125[2] * attrs.barycentrics.y);
	            _1127 = dot(_6464 - _6346, _1111);
	            _1128 = _6464;
	            break;
	        } while(false);
	        if (_6402_ladder_break)
	        {
	            break;
	        }
	        _1129++;
	        continue;
	    }
	    if (!(_1127 > 0.00999999977648258209228515625))
	    {
	        _1128 = vec3(3.4028234663852885981170418348452e+38);
	    }
	    payload.nInstance = int(uint(gl_InstanceID));
	    payload.flHitT = gl_RayTmaxEXT;
	    payload.vFaceNormalWs = _1054;
	    payload.vInterpolatedNormalWs = _1055;
	    payload.vSmoothPositionWs = _1128;
	    payload.bFlippedNormal = _1053;
	    f16vec3 _6495 = f16vec3(vec3(0.0));
	    payload.material = MaterialDataMinimal_t(_6495, float16_t(0.0), f16vec3(vec3(1.0, 0.0, 1.0)), float16_t(1.0), _6495, float16_t(0.040008544921875), 0u, f16vec4(ivec4(0)));
	    payload.material.vNormalWs = f16vec3(_1056);
	    payload.material.vAlbedo = f16vec3(_1062);
	    f16vec3 _6504 = f16vec3(_1058);
	    payload.material.vEmissive = _6504;
	    payload.material.vEmissive = _6504 + f16vec3(_1062 * _1057);
	    payload.material.flReflectance = float16_t(_1060);
	    payload.material.flMetalness = float16_t(_1061);
	    payload.material.flRoughness = float16_t(_1059.x);
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
	BoolAttribute(VertexPaintUI2Layer, (F_LAYER_COUNT==0) ? 1 : 0);
	BoolAttribute(VertexPaintUI3Layer, (F_LAYER_COUNT==1) ? 1 : 0);
	BoolAttribute(VertexPaintUIPickColor, true);
	BoolAttribute(CanBatchWithDynamicShaderConstants, true);
	BoolAttribute(SupportsAggregateInstancing, true);
	BoolAttribute(AllowBackfaceCulling, true);
	BoolAttribute(PerVertexLighting, true);
	
}
