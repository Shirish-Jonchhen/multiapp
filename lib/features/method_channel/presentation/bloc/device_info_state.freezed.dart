// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeviceInfoState {
  DeviceApiStatus get deviceInfoStatus => throw _privateConstructorUsedError;
  DeviceInfoEntity? get deviceInfo => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get showDataFetchedDialog => throw _privateConstructorUsedError;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeviceInfoStateCopyWith<DeviceInfoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoStateCopyWith<$Res> {
  factory $DeviceInfoStateCopyWith(
          DeviceInfoState value, $Res Function(DeviceInfoState) then) =
      _$DeviceInfoStateCopyWithImpl<$Res, DeviceInfoState>;
  @useResult
  $Res call(
      {DeviceApiStatus deviceInfoStatus,
      DeviceInfoEntity? deviceInfo,
      String? errorMessage,
      bool showDataFetchedDialog});
}

/// @nodoc
class _$DeviceInfoStateCopyWithImpl<$Res, $Val extends DeviceInfoState>
    implements $DeviceInfoStateCopyWith<$Res> {
  _$DeviceInfoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceInfoStatus = null,
    Object? deviceInfo = freezed,
    Object? errorMessage = freezed,
    Object? showDataFetchedDialog = null,
  }) {
    return _then(_value.copyWith(
      deviceInfoStatus: null == deviceInfoStatus
          ? _value.deviceInfoStatus
          : deviceInfoStatus // ignore: cast_nullable_to_non_nullable
              as DeviceApiStatus,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoEntity?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showDataFetchedDialog: null == showDataFetchedDialog
          ? _value.showDataFetchedDialog
          : showDataFetchedDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoStateImplCopyWith<$Res>
    implements $DeviceInfoStateCopyWith<$Res> {
  factory _$$DeviceInfoStateImplCopyWith(_$DeviceInfoStateImpl value,
          $Res Function(_$DeviceInfoStateImpl) then) =
      __$$DeviceInfoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DeviceApiStatus deviceInfoStatus,
      DeviceInfoEntity? deviceInfo,
      String? errorMessage,
      bool showDataFetchedDialog});
}

/// @nodoc
class __$$DeviceInfoStateImplCopyWithImpl<$Res>
    extends _$DeviceInfoStateCopyWithImpl<$Res, _$DeviceInfoStateImpl>
    implements _$$DeviceInfoStateImplCopyWith<$Res> {
  __$$DeviceInfoStateImplCopyWithImpl(
      _$DeviceInfoStateImpl _value, $Res Function(_$DeviceInfoStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deviceInfoStatus = null,
    Object? deviceInfo = freezed,
    Object? errorMessage = freezed,
    Object? showDataFetchedDialog = null,
  }) {
    return _then(_$DeviceInfoStateImpl(
      deviceInfoStatus: null == deviceInfoStatus
          ? _value.deviceInfoStatus
          : deviceInfoStatus // ignore: cast_nullable_to_non_nullable
              as DeviceApiStatus,
      deviceInfo: freezed == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoEntity?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      showDataFetchedDialog: null == showDataFetchedDialog
          ? _value.showDataFetchedDialog
          : showDataFetchedDialog // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DeviceInfoStateImpl extends _DeviceInfoState {
  const _$DeviceInfoStateImpl(
      {this.deviceInfoStatus = DeviceApiStatus.initial,
      this.deviceInfo,
      this.errorMessage,
      this.showDataFetchedDialog = false})
      : super._();

  @override
  @JsonKey()
  final DeviceApiStatus deviceInfoStatus;
  @override
  final DeviceInfoEntity? deviceInfo;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool showDataFetchedDialog;

  @override
  String toString() {
    return 'DeviceInfoState(deviceInfoStatus: $deviceInfoStatus, deviceInfo: $deviceInfo, errorMessage: $errorMessage, showDataFetchedDialog: $showDataFetchedDialog)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoStateImpl &&
            (identical(other.deviceInfoStatus, deviceInfoStatus) ||
                other.deviceInfoStatus == deviceInfoStatus) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.showDataFetchedDialog, showDataFetchedDialog) ||
                other.showDataFetchedDialog == showDataFetchedDialog));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deviceInfoStatus, deviceInfo,
      errorMessage, showDataFetchedDialog);

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoStateImplCopyWith<_$DeviceInfoStateImpl> get copyWith =>
      __$$DeviceInfoStateImplCopyWithImpl<_$DeviceInfoStateImpl>(
          this, _$identity);
}

abstract class _DeviceInfoState extends DeviceInfoState {
  const factory _DeviceInfoState(
      {final DeviceApiStatus deviceInfoStatus,
      final DeviceInfoEntity? deviceInfo,
      final String? errorMessage,
      final bool showDataFetchedDialog}) = _$DeviceInfoStateImpl;
  const _DeviceInfoState._() : super._();

  @override
  DeviceApiStatus get deviceInfoStatus;
  @override
  DeviceInfoEntity? get deviceInfo;
  @override
  String? get errorMessage;
  @override
  bool get showDataFetchedDialog;

  /// Create a copy of DeviceInfoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeviceInfoStateImplCopyWith<_$DeviceInfoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
