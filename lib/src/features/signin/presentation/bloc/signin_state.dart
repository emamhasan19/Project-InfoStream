part of 'signin_bloc.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
    this.email = '',
    this.password = '',
    this.isRememberMe = false,
    this.errorMessage = '',
  });

  final SignInStatus status;
  final String email;
  final String password;
  final bool isRememberMe;
  final String errorMessage;

  SignInState copyWith({
    SignInStatus? status,
    String? email,
    String? password,
    bool? isRememberMe,
    String? errorMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isRememberMe: isRememberMe ?? this.isRememberMe,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        email,
        password,
        isRememberMe,
        errorMessage,
      ];
}
