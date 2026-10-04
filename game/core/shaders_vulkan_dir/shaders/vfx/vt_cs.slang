//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Virtual Texture Manager Shader";
	DevShader = true;
	Version = 0;
	
	// Platform: VULKAN_SM_60
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
	DynamicCombo( D_VARIANT, 0..6 );
	
	RWStructuredBuffer g_compactTexUsageBuf < Attribute("CompactTexUsageBuffer"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	int g_nPageTablePatchCount < Attribute("PageTablePatchCount"); UiType(Slider); >;
	int g_nTextureInfoPatchCount < Attribute("TextureInfoPatchCount"); UiType(Slider); >;
	RWBuffer<float4> g_outputPageTable < Attribute("VirtualPageTableBuffer"); >;
	RWByteAddressBuffer g_outputTexInfoBuffer < Attribute("VirtualTexInfoBuffer"); >;
	Buffer g_pageTablePatchBuffer < Attribute("VTPageTablePatchBuffer"); SrgbRead(false); >;
	RWTexture2D<float4>[] g_tTileAtlas < Attribute("PhysicalPageCache"); >;
	Buffer g_texInfoPatchBuffer < Attribute("VTTexInfoPatchBuffer"); SrgbRead(false); >;
	RWStructuredBuffer g_texUsageBuf < Attribute("TexUsageBuffer"); >;
	Buffer g_tileAtlasUpdateQueue < Attribute("VTTileAtlasUpdateQueue"); SrgbRead(false); >;
	RWStructuredBuffer g_vtAuxBuf < Attribute("VirtualTextureAuxBuffer"); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	RWTexture2DArray<uint4> _5248 : register(u158, space0);
	
	static uint3 gl_GlobalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_GlobalInvocationID : SV_DispatchThreadID;
	};
	
	void MainCs_inner()
	{
	    _5248[gl_GlobalInvocationID.xyz] = uint4(0u, 0u, 0u, 0u);
	}
	
	[numthreads(8, 8, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_GlobalInvocationID = stage_input.gl_GlobalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	
}
