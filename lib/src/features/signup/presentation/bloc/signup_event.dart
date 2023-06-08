import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

class SignUpEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

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
  @override
  List<Object?> get props => [name, email, password, image];
}
