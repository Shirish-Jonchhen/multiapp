import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../domain/usecases/get_device_info_usecase.dart';
import 'device_info_state.dart';

@lazySingleton
class DeviceInfoCubit extends Cubit<DeviceInfoState> {
  final GetDeviceInfoUseCase getDeviceInfoUseCase;
  DeviceInfoCubit(this.getDeviceInfoUseCase) : super(const DeviceInfoState());

  Future<void> fetchDeviceInfo() async {
    emit(state.copyWith(deviceInfoStatus: DeviceApiStatus.loading));
    final result = await getDeviceInfoUseCase();
    result.fold(
      (failure) => emit(state.copyWith(
        deviceInfoStatus: DeviceApiStatus.failure,
        errorMessage: failure.message,
      )),
      (info) => emit(state.copyWith(
        deviceInfoStatus: DeviceApiStatus.success,
        deviceInfo: info,
        showDataFetchedDialog: true,
      )),
    );
  }

  void dismissDialog() =>
      emit(state.copyWith(showDataFetchedDialog: false));
}
