part of 'signin_bloc.dart';

enum SignInStatus { initial, success, failure, loading }

class SignInState extends Equatable {
  const SignInState({
    this.status = SignInStatus.initial,
    this.errorMessage = '',
  });

  final SignInStatus status;
  final String errorMessage;

  SignInState copyWith({
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
