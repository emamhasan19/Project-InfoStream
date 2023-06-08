// ignore_for_file: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'signin_page_event.dart';
part 'signin_page_state.dart';

class SigninPageBloc extends Bloc<SigninPageEvent, SigninPageState> {
  SigninPageBloc() : super(const SigninPageState()) {
    on<SigninPageSubmitEvent>(_signinPageSubmitEvent);
  }
  void _signinPageSubmitEvent(
    SigninPageSubmitEvent event,
    Emitter<SigninPageState> emit,
  ) async {
    emit(state.copyWith(status: SigninPageStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if (event.email == "1" && event.password == "1") {
      emit(state.copyWith(status: SigninPageStatus.success));
    } else {
      emit(state.copyWith(status: SigninPageStatus.failure));
    }
  }
}
