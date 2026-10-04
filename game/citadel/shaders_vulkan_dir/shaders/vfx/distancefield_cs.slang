//=================================================================================================
// Reconstructed with Source 2 Viewer - https://valveresourceformat.github.io
//=================================================================================================
HEADER
{
	Description = "Distance Field";
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
	DynamicCombo( D_DISTANCE_FIELD_MODE, 0..9 );
	DynamicCombo( D_DOWN_SAMPLED_OCCLUSION, 0..1 );
	DynamicCombo( D_AREA_LIGHTS, 0..1 );
	DynamicComboRule( Requires( D_AREA_LIGHTS, D_DISTANCE_FIELD_MODE==5 ) );
	
	[[layer_constant]] StructuredBuffer g_BarnLights < Attribute("BarnLights"); >;
	[[layer_constant]] StructuredBuffer g_CullBits < Attribute("CullBits"); >;
	StructuredBuffer g_farFieldInstances < Attribute("FarFieldInstances"); >;
	[[layer_constant]] ExternalDescriptorSet g_globalLateBoundBindlessSet < Source(ExternalDescSet); Attribute("g_globalLateBoundBindlessSet"); >;
	StructuredBuffer g_instances < Attribute("Instances"); >;
	[[layer_constant]] ExternalDescriptorSet g_lightBinnerGpuSet < Source(ExternalDescSet); Attribute("g_lightBinnerGpuSet"); >;
	float4x4 g_mHighPrecisionWorldFromProj < Attribute("HighPrecisionWorldFromProj"); >;
	StructuredBuffer g_models < Attribute("Models"); >;
	int g_nOutputSlice < Attribute("OutputSlice"); UiType(Slider); >;
	Texture3D g_tAtlas < Attribute("Atlas"); SrgbRead(false); >;
	Texture2DArray g_tBlurInput < Attribute("BlurInput"); SrgbRead(false); >;
	RWTexture2D<float4> g_tDownSampleOutput < Attribute("DownSampleOutput"); >;
	Texture2D g_tDownSampledNormalsAndDepth < Attribute("DownSampledNormalsAndDepth"); SrgbRead(false); >;
	Texture3D g_tFarFieldAtlas0 < Attribute("FarFieldAtlasSample0"); SrgbRead(false); >;
	Texture3D g_tFarFieldAtlas1 < Attribute("FarFieldAtlasSample1"); SrgbRead(false); >;
	Texture2D g_tGBufferDepth < Attribute("GBufferDepth"); SrgbRead(false); >;
	Texture2D g_tGBufferNormals < Attribute("GBufferNormals"); SrgbRead(false); >;
	Texture3D g_tLightCookieTexture < Attribute("LightCookieTexture"); SrgbRead(true); >;
	RWTexture2D<float4>[] g_tOcclusionOutput < Attribute("OcclusionOutput"); >;
	Texture2DArray g_tUpSampleOcclusion < Attribute("Occlusion"); SrgbRead(false); >;
	RWTexture2D<float4>[] g_tUpSampleOutput < Attribute("Output"); >;
	Texture2D g_tVeilFrontDepth < Attribute("VeilFrontDepth"); SrgbRead(false); >;
	RWTexture2D<float4>[] g_tVisualizeOutput < Attribute("VisualizeOutput"); >;
	StructuredBuffer g_tlas < Attribute("TLAS"); >;
	RWTexture2D<float4>[] g_uBlurOutput < Attribute("BlurOutput"); >;
	RWTexture3D<float4> g_uFarFieldAtlas0 < Attribute("FarFieldAtlas0"); >;
	RWTexture3D<float4> g_uFarFieldAtlas1 < Attribute("FarFieldAtlas1"); >;
	float4 g_vPixelToProj < Attribute("PixelToProj"); UiType(VectorText); >;
	
	
	// Variant parameters
	
	// Source 2 Viewer - https://valveresourceformat.github.io
	// SPIR-V source, HLSL reflection with SPIRV-Cross by KhronosGroup
	
	struct _1095
	{
	    float3 _m0;
	    uint _m1;
	    float3 _m2;
	    uint _m3;
	};
	
	struct _1218
	{
	    column_major float4x3 _m0;
	    int _m1;
	    float _m2;
	    float2 _m3;
	};
	
	struct _1468
	{
	    float3 _m0;
	    uint _m1;
	    float3 _m2;
	    uint _m3;
	    float3 _m4;
	    uint _m5;
	    float _m6;
	    float _m7;
	    int _m8;
	    int _m9;
	    int _m10;
	    uint _m11;
	};
	
	static float3 _4;
	static bool _5;
	static float4 _6;
	
	cbuffer PerViewConstantBuffer_t : register(b1, space0)
	{
	    column_major float4x4 PerViewConstantBuffer_t_1_m0 : packoffset(c4);
	    float2 PerViewConstantBuffer_t_1_m1 : packoffset(c20.z);
	    float2 PerViewConstantBuffer_t_1_m2 : packoffset(c21);
	    float3 PerViewConstantBuffer_t_1_m3 : packoffset(c26);
	};
	
	cbuffer Visualize_DistanceField_t : register(b7, space0)
	{
	    float Visualize_DistanceField_t_1_m0 : packoffset(c0);
	};
	
	ByteAddressBuffer g_tlas : register(t59, space0);
	ByteAddressBuffer g_instances : register(t58, space0);
	ByteAddressBuffer g_models : register(t57, space0);
	Texture3D<float4> g_tAtlas : register(t56, space0);
	SamplerState AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear : register(s21, space0);
	RWTexture2DArray<float4> _5153 : register(u160, space0);
	
	static uint3 gl_WorkGroupID;
	static uint3 gl_LocalInvocationID;
	struct SPIRV_Cross_Input
	{
	    uint3 gl_WorkGroupID : SV_GroupID;
	    uint3 gl_LocalInvocationID : SV_GroupThreadID;
	};
	
	void MainCs_inner()
	{
	    do
	    {
	        uint _16337 = (gl_WorkGroupID.x * 8u) + gl_LocalInvocationID.x;
	        uint _24071 = (gl_WorkGroupID.y * 8u) + gl_LocalInvocationID.y;
	        uint2 _13756 = uint2(_16337, _24071);
	        bool _12885;
	        if (_16337 >= uint(PerViewConstantBuffer_t_1_m1.x))
	        {
	            _12885 = true;
	        }
	        else
	        {
	            _12885 = _24071 >= uint(PerViewConstantBuffer_t_1_m1.y);
	        }
	        if (_12885)
	        {
	            break;
	        }
	        float _16672 = 2.0f * (tan(Visualize_DistanceField_t_1_m0 * 0.5f) / float(uint(PerViewConstantBuffer_t_1_m1.y)));
	        float2 _6838 = (float2(_13756) + 0.5f.xx) * PerViewConstantBuffer_t_1_m2;
	        float4 _10557 = mul(PerViewConstantBuffer_t_1_m0, float4((_6838.x * 2.0f) - 1.0f, 1.0f - (_6838.y * 2.0f), 0.5f, 1.0f));
	        float3 _10521 = _10557.xyz / _10557.w.xxx;
	        float4 _22905;
	        _22905.x = _10521.x;
	        _22905.y = _10521.y;
	        _22905.z = _10521.z;
	        float3 _10507 = normalize(_22905.xyz - PerViewConstantBuffer_t_1_m3);
	        float3 _8772 = 1.0f.xxx / _10507;
	        float3 _17117;
	        float3 _17133;
	        _17117 = _4;
	        _17133 = _4;
	        uint _22875;
	        uint _23511;
	        uint _24537;
	        uint _10701[32];
	        int _10883;
	        float _13143;
	        float3 _13144;
	        float3 _14899;
	        int _14929;
	        bool _16310;
	        float3 _17122;
	        float3 _17123;
	        uint _13136 = 0u;
	        float _16305 = 3.4028234663852885981170418348452e+38f;
	        int _17017 = -1;
	        uint _17114 = 0u;
	        uint _17115 = 0u;
	        bool _17116;
	        [loop]
	        for (;;)
	        {
	            if (!(_17115 < 128u))
	            {
	                _13144 = _17117;
	                _14899 = _17133;
	                _10883 = _17017;
	                break;
	            }
	            uint _13766 = g_tlas.Load(_17114 * 32 + 12) & 255u;
	            uint _16589;
	            if ((g_tlas.Load(_17114 * 32 + 12) >> uint(31)) > 0u)
	            {
	                bool _13137;
	                float _16306;
	                float3 _17118;
	                float3 _17119;
	                int _17134;
	                _13137 = _17116;
	                _16306 = _16305;
	                _17118 = _17117;
	                _17119 = _17133;
	                _17134 = _17017;
	                uint _8896;
	                bool _13141;
	                float3 _14891;
	                float _16309;
	                float3 _17121;
	                int _18360;
	                uint _17018 = 0u;
	                for (;;)
	                {
	                    if (!(_17018 < _13766))
	                    {
	                        break;
	                    }
	                    uint _14203 = g_tlas.Load(_17114 * 32 + 28) + _17018;
	                    float4x3 _8526 = asfloat(uint4x3(g_instances.Load(_14203 * 64 + 0), g_instances.Load(_14203 * 64 + 16), g_instances.Load(_14203 * 64 + 32), g_instances.Load(_14203 * 64 + 4), g_instances.Load(_14203 * 64 + 20), g_instances.Load(_14203 * 64 + 36), g_instances.Load(_14203 * 64 + 8), g_instances.Load(_14203 * 64 + 24), g_instances.Load(_14203 * 64 + 40), g_instances.Load(_14203 * 64 + 12), g_instances.Load(_14203 * 64 + 28), g_instances.Load(_14203 * 64 + 44)));
	                    float3 _12382 = mul(float4(PerViewConstantBuffer_t_1_m3, 1.0f), _8526).xyz;
	                    float3 _21499 = mul(float4(_10507, 0.0f), _8526).xyz;
	                    float3 _14975 = 1.0f.xxx / _21499;
	                    float3 _16228 = asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 16)) - asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 0));
	                    float _15688 = float(g_models.Load(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 12));
	                    float3 _24227 = ((_16228.x / _15688) * 0.5f).xxx;
	                    float2 _11556;
	                    bool _16054;
	                    do
	                    {
	                        float3 _22595 = _14975 * ((asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 0)) + _24227) - _12382);
	                        float3 _17510 = _14975 * ((asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 16)) - _24227) - _12382);
	                        float3 _7416 = min(_17510, _22595);
	                        float3 _13038 = max(_17510, _22595);
	                        float2 _11254 = max(_7416.xx, _7416.yz);
	                        float2 _16934 = min(_13038.xx, _13038.yz);
	                        float _22687 = max(max(_11254.x, _11254.y), 0.0f);
	                        float _14019 = min(min(_16934.x, _16934.y), _16305);
	                        if (_22687 > _14019)
	                        {
	                            _11556 = 3.4028234663852885981170418348452e+38f.xx;
	                            _16054 = false;
	                            break;
	                        }
	                        else
	                        {
	                            _11556 = float2(_22687, _14019);
	                            _16054 = true;
	                            break;
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    if (_16054)
	                    {
	                        bool _13140;
	                        float _16308;
	                        int _16480;
	                        float3 _17120;
	                        float3 _17191;
	                        if (_11556.x < _16306)
	                        {
	                            float _17157 = asfloat(g_models.Load(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 52)) * asfloat(g_instances.Load(_14203 * 64 + 52));
	                            float3 _18722 = float3(_15688 * 0.0009765625f, float(g_models.Load(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 28)) * 0.0009765625f, float(g_models.Load(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 44)) * 0.015625f);
	                            bool _12886;
	                            float _13138;
	                            do
	                            {
	                                uint _23989;
	                                float _24611;
	                                bool _16343;
	                                bool _16863;
	                                float _13156 = _11556.x;
	                                uint _16209 = 0u;
	                                [loop]
	                                for (;;)
	                                {
	                                    if (!(_16209 < 32u))
	                                    {
	                                        _13138 = 3.4028234663852885981170418348452e+38f;
	                                        _16343 = _13137;
	                                        _16863 = false;
	                                        break;
	                                    }
	                                    float _18457 = (((g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_12382 + (_21499 * _13156)) - asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 0))) / _16228) * _18722) + asfloat(g_models.Load3(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 32)), 0.0f).x * 2.0f) - 1.0f) * asfloat(g_models.Load(int(g_instances.Load(_14203 * 64 + 48)) * 72 + 48))) * asfloat(g_instances.Load(_14203 * 64 + 52));
	                                    float _12279 = max(_17157, _16672 * _13156);
	                                    if (_18457 < _12279)
	                                    {
	                                        _13138 = _13156 - _12279;
	                                        _16343 = true;
	                                        _16863 = true;
	                                        break;
	                                    }
	                                    _24611 = _13156 + _18457;
	                                    if (_24611 > _11556.y)
	                                    {
	                                        _13138 = 3.4028234663852885981170418348452e+38f;
	                                        _16343 = false;
	                                        _16863 = true;
	                                        break;
	                                    }
	                                    _23989 = _16209 + 1u;
	                                    _13156 = _24611;
	                                    _16209 = _23989;
	                                    continue;
	                                }
	                                if (_16863)
	                                {
	                                    _12886 = _16343;
	                                    break;
	                                }
	                                _12886 = false;
	                                break;
	                            } while(false);
	                            float _13139;
	                            float3 _16307;
	                            int _16479;
	                            float3 _17190;
	                            if (_12886)
	                            {
	                                bool _20847 = _13138 < _16306;
	                                float3 _23149;
	                                if (_20847)
	                                {
	                                    _23149 = _12382 + (_21499 * _13138);
	                                }
	                                else
	                                {
	                                    _23149 = _17118;
	                                }
	                                bool3 _9204 = _20847.xxx;
	                                _13139 = _20847 ? _13138 : _16306;
	                                _16307 = _23149;
	                                _17190 = float3(_9204.x ? _21499.x : _17119.x, _9204.y ? _21499.y : _17119.y, _9204.z ? _21499.z : _17119.z);
	                                _16479 = _20847 ? int(g_instances.Load(_14203 * 64 + 48)) : _17134;
	                            }
	                            else
	                            {
	                                _13139 = _16306;
	                                _16307 = _17118;
	                                _17190 = _17119;
	                                _16479 = _17134;
	                            }
	                            _13140 = _12886;
	                            _16308 = _13139;
	                            _17120 = _16307;
	                            _17191 = _17190;
	                            _16480 = _16479;
	                        }
	                        else
	                        {
	                            _13140 = _13137;
	                            _16308 = _16306;
	                            _17120 = _17118;
	                            _17191 = _17119;
	                            _16480 = _17134;
	                        }
	                        _13141 = _13140;
	                        _16309 = _16308;
	                        _17121 = _17120;
	                        _14891 = _17191;
	                        _18360 = _16480;
	                    }
	                    else
	                    {
	                        _13141 = _13137;
	                        _16309 = _16306;
	                        _17121 = _17118;
	                        _14891 = _17119;
	                        _18360 = _17134;
	                    }
	                    _8896 = _17018 + 1u;
	                    _13137 = _13141;
	                    _16306 = _16309;
	                    _17118 = _17121;
	                    _17119 = _14891;
	                    _17134 = _18360;
	                    _17018 = _8896;
	                    continue;
	                }
	                _13143 = _16306;
	                _16310 = _13137;
	                _17122 = _17118;
	                _17123 = _17119;
	                _14929 = _17134;
	                _16589 = _13136;
	            }
	            else
	            {
	                uint _13155;
	                _13155 = _13136;
	                uint _8087;
	                uint _14382;
	                uint _16208 = 0u;
	                for (;;)
	                {
	                    if (!(_16208 < _13766))
	                    {
	                        break;
	                    }
	                    uint _14202 = g_tlas.Load(_17114 * 32 + 28) + _16208;
	                    bool _11267;
	                    do
	                    {
	                        float3 _22594 = _8772 * (asfloat(g_tlas.Load3(_14202 * 32 + 0)) - PerViewConstantBuffer_t_1_m3);
	                        float3 _17509 = _8772 * (asfloat(g_tlas.Load3(_14202 * 32 + 16)) - PerViewConstantBuffer_t_1_m3);
	                        float3 _7415 = min(_17509, _22594);
	                        float3 _13037 = max(_17509, _22594);
	                        float2 _11253 = max(_7415.xx, _7415.yz);
	                        float2 _16933 = min(_13037.xx, _13037.yz);
	                        if (max(max(_11253.x, _11253.y), 0.0f) > min(min(_16933.x, _16933.y), _16305))
	                        {
	                            _11267 = false;
	                            break;
	                        }
	                        else
	                        {
	                            _11267 = true;
	                            break;
	                        }
	                        break; // unreachable workaround
	                    } while(false);
	                    if (_11267)
	                    {
	                        _10701[min(_13155, 31u)] = _14202;
	                        _14382 = _13155 + 1u;
	                    }
	                    else
	                    {
	                        _14382 = _13155;
	                    }
	                    _8087 = _16208 + 1u;
	                    _13155 = _14382;
	                    _16208 = _8087;
	                    continue;
	                }
	                _13143 = _16305;
	                _16310 = _17116;
	                _17122 = _17117;
	                _17123 = _17133;
	                _14929 = _17017;
	                _16589 = _13155;
	            }
	            _24537 = _16589 - 1u;
	            if (_24537 >= 32u)
	            {
	                _13144 = _17122;
	                _14899 = _17123;
	                _10883 = _14929;
	                break;
	            }
	            _22875 = _10701[_24537];
	            _23511 = _17115 + 1u;
	            _13136 = _24537;
	            _16305 = _13143;
	            _17114 = _22875;
	            _17115 = _23511;
	            _17116 = _16310;
	            _17117 = _17122;
	            _17133 = _17123;
	            _17017 = _14929;
	            continue;
	        }
	        if (_10883 != (-1))
	        {
	            float3 _6341 = asfloat(g_models.Load3(_10883 * 72 + 16)) - asfloat(g_models.Load3(_10883 * 72 + 0));
	            float _15689 = float(g_models.Load(_10883 * 72 + 12));
	            float3 _16124 = float3(_15689 * 0.0009765625f, float(g_models.Load(_10883 * 72 + 28)) * 0.0009765625f, float(g_models.Load(_10883 * 72 + 44)) * 0.015625f);
	            float _7677 = (_6341.x / _15689) * 0.5f;
	            float3 _17805 = float3(_7677, 0.0f, 0.0f);
	            float3 _22308 = float3(0.0f, _7677, 0.0f);
	            float3 _22309 = float3(0.0f, 0.0f, _7677);
	            float3 _11594 = float3(asfloat(g_models.Load(_10883 * 72 + 48)) * (2.0f * (g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 + _17805) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x - g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 - _17805) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x)), asfloat(g_models.Load(_10883 * 72 + 48)) * (2.0f * (g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 + _22308) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x - g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 - _22308) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x)), asfloat(g_models.Load(_10883 * 72 + 48)) * (2.0f * (g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 + _22309) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x - g_tAtlas.SampleLevel(AddressU_Clamp_AddressV_Clamp_AddressW_Clamp_Filter_MinMagMipLinear, ((((_13144 - _22309) - asfloat(g_models.Load3(_10883 * 72 + 0))) / _6341) * _16124) + asfloat(g_models.Load3(_10883 * 72 + 32)), 0.0f).x)));
	            float _19750 = length(_11594);
	            float3 _10121;
	            if (_19750 > 0.0f)
	            {
	                _10121 = _11594 / _19750.xxx;
	            }
	            else
	            {
	                _10121 = 0.0f.xxx;
	            }
	            _5153[uint3(_13756, 0u)] = saturate(abs(dot(_10121, normalize(-_14899)))).xxxx;
	        }
	        else
	        {
	            _5153[uint3(_13756, 0u)] = 0.0f.xxxx;
	        }
	        break;
	    } while(false);
	}
	
	[numthreads(8, 8, 1)]
	void MainCs(SPIRV_Cross_Input stage_input)
	{
	    gl_WorkGroupID = stage_input.gl_WorkGroupID;
	    gl_LocalInvocationID = stage_input.gl_LocalInvocationID;
	    MainCs_inner();
	}
	
	// ---------  SPIRV -> HLSL end  --------- 
	
	
	
	BoolAttribute(environmentmapped, true);
	BoolAttribute(environmentmappeddynamic, true);
	
}
