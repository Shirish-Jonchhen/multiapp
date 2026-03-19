import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

abstract class DeviceInfoDatasource {
  Future<Map<String, dynamic>> getDeviceInfo();
}

@LazySingleton(as: DeviceInfoDatasource)
class DeviceInfoDatasourceImpl implements DeviceInfoDatasource {
  static const _channel = MethodChannel('com.example.multiapp/device_info');

  @override
  Future<Map<String, dynamic>> getDeviceInfo() async {
    final result = await _channel.invokeMethod<Map>('getDeviceInfo');
    return Map<String, dynamic>.from(result ?? {});
  }
}
