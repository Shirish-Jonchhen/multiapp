import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../../domain/entities/device_info_entity.dart';
import '../../domain/repository/device_info_repository.dart';
import '../datasource/device_info_datasource.dart';

@LazySingleton(as: DeviceInfoRepository)
class DeviceInfoRepositoryImpl implements DeviceInfoRepository {
  final DeviceInfoDatasource datasource;
  DeviceInfoRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, DeviceInfoEntity>> getDeviceInfo() async {
    try {
      final data = await datasource.getDeviceInfo();
      final entity = DeviceInfoEntity(
        batteryLevel: data['batteryLevel'] as int? ?? -1,
        deviceModel: data['deviceModel'] as String? ?? 'Unknown',
        isCharging: data['isCharging'] as bool? ?? false,
        systemTime: DateTime.tryParse(data['systemTime']?.toString() ?? '') ??
            DateTime.now(),
      );
      return Right(entity);
    } catch (e) {
      return Left(Failure.unknown(message: e.toString()));
    }
  }
}
