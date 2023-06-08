import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

enum SignUpStatus { initial, success, failure, loading }

class SignUpState extends Equatable {
  final SignUpStatus? status;
  final String? name;
  final String? email;
  final String? password;
  final XFile? image;

  const SignUpState({
    this.status = SignUpStatus.initial,
    this.name = '',
    this.email = '',
    this.password = '',
    this.image,
  });

  SignUpState copyWith({
    SignUpStatus? status,
    String? name,
    String? email,
    String? password,
    XFile? image,
  }) {
    return SignUpState(
      status: status ?? this.status,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
    );
  }

  @override
  List<Object?> get props => [status, name, email, password, image];
}
