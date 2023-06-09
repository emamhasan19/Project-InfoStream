part of 'signin_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInSubmitEvent extends SignInEvent {
  const SignInSubmitEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
