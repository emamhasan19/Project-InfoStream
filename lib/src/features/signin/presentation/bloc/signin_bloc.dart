// ignore_for_file: depend_on_referenced_packages
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:info_stream/src/core/services/local_storage/cache_service.dart';
import 'package:info_stream/src/features/signin/domain/use_cases/sign_in_use_case.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc({required this.signInUseCase}) : super(const SignInState()) {
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
    on<RememberMeEvent>(_onRememberMeEventEvent);
    on<SignInSubmitEvent>(_onSignInSubmitEvent);
  }

  final SignInUseCase signInUseCase;

  Future<void> _onEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(email: event.email));
  }

  Future<void> _onPasswordChangeEvent(
    PasswordChangeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  Future<void> _onRememberMeEventEvent(
    RememberMeEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(isRememberMe: event.isRememberMe));
  }

  Future<void> _onSignInSubmitEvent(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));

    await Future.delayed(const Duration(seconds: 2));
    try {
      Map<String, dynamic> requestBody = {
        "email": state.email,
        "password": state.password,
      };

      final response = await signInUseCase.call(requestBody: requestBody);
      response.fold(
        (l) => emit(
          state.copyWith(
            status: SignInStatus.failure,
            errorMessage: l,
          ),
        ),
        (r) async {
          /// save token in local storage
          CacheService.instance.storeBearerToken(r.token);
          emit(
            state.copyWith(
              status: SignInStatus.success,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SignInStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
