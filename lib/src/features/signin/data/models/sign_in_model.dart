import 'package:info_stream/src/features/signin/domain/entities/sign_in_entity.dart';

class SignInModel extends SignInEntity {
  SignInModel({
    required super.success,
    required super.token,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        success: json["success"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
      };
}
