import 'package:dio/dio.dart';


abstract class SignUpRemoteDataSource {
  Future<Response> signUp({required Map<String, dynamic> requestBody});
}

