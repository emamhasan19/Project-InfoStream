import 'package:image_picker/image_picker.dart';

class SignUpState {
  final String? name;
  final String? email;
  final String? password;
  final XFile? image;

  SignUpState({
    this.name,
    this.email,
    this.password,
    this.image,
  });

  SignUpState copyWith({
    String? name,
    String? email,
    String? password,
    XFile? image,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      image: image ?? this.image,
    );
  }
}
