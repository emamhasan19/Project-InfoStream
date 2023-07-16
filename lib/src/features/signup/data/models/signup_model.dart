import 'package:info_stream/src/features/signup/domain/entities/signup_entity.dart';

class SignUpModel extends SignUpEntity {
  String? id;
  DateTime? date;
  String? v;

  SignUpModel({
    required String name,
    required String email,
    required String password,
    required String avatar,
    this.id,
    this.date,
    this.v,
  }) : super(name: name, email: email, password: password, avatar: avatar);

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        name: json['name'],
        email: json['email'],
        password: json['password'],
        avatar: json['avatar'],
        id: json['_id'],
        date: json['date'] != null ? DateTime.parse(json['date']) : null,
        v: json['__v'].toString(),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'avatar': avatar,
        '_id': id,
        'date': date?.toIso8601String(),
        '__v': v,
      };
}
