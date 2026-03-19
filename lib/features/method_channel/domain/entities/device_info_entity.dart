class DeviceInfoEntity {
  final int batteryLevel;
  final String deviceModel;
  final bool isCharging;
  final DateTime systemTime;

  const DeviceInfoEntity({
    required this.batteryLevel,
    required this.deviceModel,
    required this.isCharging,
    required this.systemTime,
  });
}
