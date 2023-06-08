part of 'signin_page_bloc.dart';

abstract class SigninPageEvent extends Equatable {
  const SigninPageEvent();
}

class SigninPageSubmitEvent extends SigninPageEvent {
  const SigninPageSubmitEvent({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
