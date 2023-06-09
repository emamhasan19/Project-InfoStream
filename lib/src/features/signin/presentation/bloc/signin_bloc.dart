// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<SignInSubmitEvent>(_signinSubmitEvent);
  }
  void _signinSubmitEvent(
    SignInSubmitEvent event,
    Emitter<SignInState> emit,
  ) async {
    emit(state.copyWith(status: SignInStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if (event.email == "1" && event.password == "1") {
      emit(state.copyWith(status: SignInStatus.success));
    } else {
      emit(state.copyWith(status: SignInStatus.failure));
    }
  }
}
