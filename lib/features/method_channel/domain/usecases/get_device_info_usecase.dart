import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:multiapp/core/error/failures.dart';
import '../entities/device_info_entity.dart';
import '../repository/device_info_repository.dart';

@injectable
class GetDeviceInfoUseCase {
  final DeviceInfoRepository repository;
  GetDeviceInfoUseCase(this.repository);

  Future<Either<Failure, DeviceInfoEntity>> call() =>
      repository.getDeviceInfo();
}
