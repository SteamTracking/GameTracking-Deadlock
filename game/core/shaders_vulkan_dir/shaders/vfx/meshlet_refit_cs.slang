//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Meshlet Bounds Refit CS";
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
	StaticCombo( S_SUBGROUP_WAVE_OPS, 0..1 );
	
	ByteAddressBuffer g_IBPool < Attribute("IBPool"); >;
	RWStructuredBuffer g_MeshletBoundsCacheBufferRW < Attribute("MeshletCacheRW"); >;
	StructuredBuffer g_RefitRequests < Attribute("RefitRequests"); >;
	ByteAddressBuffer g_VBPool < Attribute("VBPool"); >;
	ByteAddressBuffer g_animatedVertexCache < Attribute("AnimatedVertexCache"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	int g_nNumMeshletsToRefit < Attribute("NumMeshletsToRefit"); UiType(Slider); >;
	int g_nNumRefitRequests < Attribute("NumRefitRequests"); UiType(Slider); >;
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	void MainCs_inner()
	{
	}
	
	[numthreads(32, 1, 1)]
	void MainCs()
	{
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(BindlessResources, true);
	
}
