import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/device_info_entity.dart';
part 'device_info_state.freezed.dart';

enum DeviceApiStatus { initial, loading, success, failure }

@freezed
class DeviceInfoState with _$DeviceInfoState {
  const DeviceInfoState._();

  const factory DeviceInfoState({
    @Default(DeviceApiStatus.initial) DeviceApiStatus deviceInfoStatus,
    DeviceInfoEntity? deviceInfo,
    String? errorMessage,
    @Default(false) bool showDataFetchedDialog,
  }) = _DeviceInfoState;

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
