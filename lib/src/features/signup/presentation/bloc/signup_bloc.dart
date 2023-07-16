import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/features/signup/domain/use_cases/signup_use_case.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({required this.signUpUseCase}) : super(const SignUpState()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<ImageChangeEvent>(_onImageChangeEvent);
    on<NameChangeEvent>(_onNameChangeEvent);
    on<EmailChangeEvent>(_onEmailChangeEvent);
    on<PasswordChangeEvent>(_onPasswordChangeEvent);
  }

  final SignUpUseCase signUpUseCase;

  FutureOr<void> _onImageChangeEvent(
    ImageChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(image: event.image));
  }

  FutureOr<void> _onNameChangeEvent(
    NameChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(name: event.name));
  }

  FutureOr<void> _onEmailChangeEvent(
    EmailChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  FutureOr<void> _onPasswordChangeEvent(
    PasswordChangeEvent event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(password: event.password));
  }

  FutureOr<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    Map<String, dynamic> requestBody = {
      "name": state.name,
      "email": state.email,
      "password": state.password,
      "password2": state.password,
    };

    try {
      final response = await signUpUseCase.call(requestBody: requestBody);

      // print(state.email);

      response.fold(
        (l) {
          emit(
            state.copyWith(
              status: SignUpStatus.failure,
              errorMessage: l,
            ),
          );
        },
        (r) async {
          /// save token in local storage
          // await CacheService.instance.storeBearerToken(r.token);
          emit(
            state.copyWith(
              status: SignUpStatus.success,
            ),
          );
        },
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
