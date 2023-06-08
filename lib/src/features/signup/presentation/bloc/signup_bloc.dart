import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  FutureOr<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<SignUpState> emit,
  ) async {
    emit(state.copyWith(status: SignUpStatus.loading));

    if (event.name.isNotEmpty &&
        event.email.isNotEmpty &&
        event.password.isNotEmpty) {
      emit(state.copyWith(
        status: SignUpStatus.success,
        name: event.name,
        email: event.email,
        password: event.password,
      ));
    } else {
      emit(state.copyWith(status: SignUpStatus.failure));
    }

    return null;
  }
}
