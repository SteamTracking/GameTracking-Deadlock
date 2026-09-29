class CCitadel_Modifier_Drag : public CCitadel_Modifier_Link
{
	CHandle< C_BaseEntity > m_hDragSource;
	QAngle m_qCapturedBearing;
	Vector m_vCapturedOffset;
};
