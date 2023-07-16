
part of 'signup_bloc.dart';

enum SignUpStatus { initial, success, failure, loading }

class SignUpState extends Equatable {
  const SignUpState({
    this.status = SignUpStatus.initial,
    this.name = '',
    this.email ='',
    this.password = '',
    this.image,
    this.errorMessage = '',
  });

  final SignUpStatus status;
  final String name;
  final String email;
  final String password;
  final String? image;
  final String errorMessage;

  SignUpState copyWith({
    SignUpStatus? status,
    String? name,
    String? email,
    String? password,
    String? image,
    String? errorMessage,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        name,
        email,
        password,
        image,
        errorMessage,
      ];
}
