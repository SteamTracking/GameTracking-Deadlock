// MGetKV3ClassDefaults = {
//	"m_pMotor": null,
//	"m_navTypes":
//	[
//	]
//}
class CAI_MotorServices::MotorRegistration_t
{
	std::unique_ptr< IAI_Motor > m_pMotor;
	CUtlVector< NavType_t > m_navTypes;
};
