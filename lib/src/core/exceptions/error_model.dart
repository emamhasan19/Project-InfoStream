// To parse this JSON data, do
//
//     final errorModel = errorModelFromJson(jsonString);

import 'dart:convert';

ErrorResponseModel errorModelFromJson(String str) =>
    ErrorResponseModel.fromJson(json.decode(str));

class ErrorResponseModel {
  ErrorResponseModel({
    this.error,
  });

  ErrorModel? error;

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) =>
      ErrorResponseModel(
        error:
            json["error"] == null ? null : ErrorModel.fromJson(json["error"]),
      );
}

class ErrorModel {
  ErrorModel({
    this.message = "Something went wrong! Please try again later.",
    this.code = "500",
    this.stack,
  });

  String? message;
  String? code;
  String? stack;

  factory ErrorModel.fromJson(Map<String, dynamic> json) => ErrorModel(
        message: json["message"],
        code: json["code"],
        stack: json["stack"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "stack": stack,
      };
}
