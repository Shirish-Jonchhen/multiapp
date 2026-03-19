import 'package:freezed_annotation/freezed_annotation.dart';
part 'nav_state.freezed.dart';

@freezed
class NavState with _$NavState {
  const factory NavState({
    @Default(0) int selectedIndex,
  }) = _NavState;
}
