// MGetKV3ClassDefaults = {
//	"_class": "fogparams_t",
//	"dirPrimary":
//	[
//		1.000000,
//		0.000000,
//		0.000000
//	],
//	"colorPrimary":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"colorSecondary":
//	[
//		0,
//		0,
//		0,
//		0
//	],
//	"start": 0.000000,
//	"end": 0.000000,
//	"farz": 0.000000,
//	"maxdensity": 0.000000,
//	"exponent": 0.000000,
//	"HDRColorScale": 0.000000,
//	"duration": 0.000000,
//	"blendtobackground": 0.000000,
//	"scattering": 0.000000,
//	"locallightscale": 1.000000,
//	"enable": false,
//	"blend": false
//}
// MHasKV3TransferPolymorphicClassname
class fogparams_t
{
	Vector dirPrimary;
	Color colorPrimary;
	Color colorSecondary;
	// MNotSaved
	Color colorPrimaryLerpTo;
	// MNotSaved
	Color colorSecondaryLerpTo;
	float32 start;
	float32 end;
	float32 farz;
	float32 maxdensity;
	float32 exponent;
	float32 HDRColorScale;
	// MNotSaved
	float32 skyboxFogFactor;
	// MNotSaved
	float32 skyboxFogFactorLerpTo;
	// MNotSaved
	float32 startLerpTo;
	// MNotSaved
	float32 endLerpTo;
	// MNotSaved
	float32 maxdensityLerpTo;
	// MNotSaved
	GameTime_t lerptime;
	float32 duration;
	float32 blendtobackground;
	float32 scattering;
	float32 locallightscale;
	bool enable;
	bool blend;
	// MNotSaved
	bool m_bPadding2;
	// MNotSaved
	bool m_bPadding;
};
