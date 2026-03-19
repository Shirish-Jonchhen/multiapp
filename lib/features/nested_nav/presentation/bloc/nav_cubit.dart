import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'nav_state.dart';

@injectable
class NavCubit extends Cubit<NavState> {
  NavCubit() : super(const NavState());
  void selectTab(int index) => emit(state.copyWith(selectedIndex: index));
}
