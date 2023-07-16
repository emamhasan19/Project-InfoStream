part of 'signup_bloc.dart';

class SignUpEvent {
  const SignUpEvent();
}

class ImageChangeEvent extends SignUpEvent {
  const ImageChangeEvent({required this.image});

  final String image;
}

class NameChangeEvent extends SignUpEvent {
  const NameChangeEvent({required this.name});

  final String name;
}

class EmailChangeEvent extends SignUpEvent {
  const EmailChangeEvent({required this.email});

  final String email;
}

class PasswordChangeEvent extends SignUpEvent {
  const PasswordChangeEvent({required this.password});

  final String password;
}

class SignUpSubmitted extends SignUpEvent {}
