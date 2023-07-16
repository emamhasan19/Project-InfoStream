import 'package:dio/dio.dart';
import 'package:info_stream/src/core/network/api_end_points.dart';
import 'package:info_stream/src/core/network/rest_client.dart';
import 'package:info_stream/src/features/signin/data/data_sources/sign_in_remote_data_source.dart';

class SignInRemoteDataSourceImp implements SignInRemoteDataSource {
  const SignInRemoteDataSourceImp({required this.restClient});

  final RestClient restClient;

  @override
  Future<Response> signIn({required Map<String, dynamic> requestBody}) async {
    final response = await restClient.post(
      APIType.PUBLIC,
      ApiEndPoints.login,
      requestBody,
    );

    return response;
  }
}
