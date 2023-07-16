import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/features/profile/domain/use_cases/profile_use_case.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc({required this.profileUseCase}) : super(const ProfileState()) {
    on<FetchProfileEvent>(_onFetchProfileEvent);
  }

  final ProfileUseCase profileUseCase;

  Future<void> _onFetchProfileEvent(
    FetchProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(status: ProfileStatus.loading));

    try {
      final response = await profileUseCase.execute();
      response.fold(
        (l) => emit(
          state.copyWith(
            status: ProfileStatus.failure,
            errorMessage: l,
          ),
        ),
        (r) async {
          emit(
            state.copyWith(
              status: ProfileStatus.success,
              user: r,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProfileStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
