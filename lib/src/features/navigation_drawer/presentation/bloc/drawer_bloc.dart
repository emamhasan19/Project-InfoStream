// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/use_cases/drawer_use_cases.dart';

import 'drawer_event.dart';
import 'drawer_state.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final DrawerUseCase drawerUseCase;

  DrawerBloc({required this.drawerUseCase}) : super(const DrawerState()) {
    on<FetchDrawerData>(_onFetchDrawerData);
  }

  Future<void> _onFetchDrawerData(
    FetchDrawerData event,
    Emitter<DrawerState> emit,
  ) async {
    // emit(state.copyWith(status: DrawerStatus.initial));
    try {
      final response = await drawerUseCase.fetchDrawerData();

      response.fold(
        (l) => emit(
          state.copyWith(
            status: DrawerStatus.failure,
            errorMessage: l,
          ),
        ),
        (r) async {
          /// save token in local storage
          // await CacheService.instance.storeBearerToken(r.token);
          emit(
            state.copyWith(
              status: DrawerStatus.success,
              drawerData: r,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: DrawerStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
