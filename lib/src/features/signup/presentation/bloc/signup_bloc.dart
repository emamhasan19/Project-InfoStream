import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_event.dart';
import 'package:splash/src/features/signup/presentation/bloc/signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  FutureOr<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) {
    emit(state.copyWith(
      name: event.name,
      email: event.email,
      password: event.password,
      image: event.image,
    ));

    return null;
  }
}
