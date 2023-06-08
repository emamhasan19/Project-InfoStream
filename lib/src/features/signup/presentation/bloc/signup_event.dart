import 'package:image_picker/image_picker.dart';

class SignUpEvent {}

class SignUpSubmitted extends SignUpEvent {
  final String name;
  final String email;
  final String password;
  final XFile image;

  SignUpSubmitted(
    this.name,
    this.email,
    this.password,
    this.image,
  );
}
