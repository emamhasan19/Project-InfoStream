import 'package:dio/dio.dart';

abstract class SignInRemoteDataSource {
  Future<Response> signIn({required Map<String, dynamic> requestBody});
}
