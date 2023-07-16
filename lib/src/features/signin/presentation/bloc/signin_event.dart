part of 'signin_bloc.dart';

abstract class SignInEvent {
  const SignInEvent();
}

class EmailChangeEvent extends SignInEvent {
  const EmailChangeEvent({required this.email});

  final String email;
}

class PasswordChangeEvent extends SignInEvent {
  const PasswordChangeEvent({required this.password});

  final String password;
}

class RememberMeEvent extends SignInEvent {
  const RememberMeEvent({required this.isRememberMe});

  final bool isRememberMe;
}

class SignInSubmitEvent extends SignInEvent {}
