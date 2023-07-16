import 'package:dio/dio.dart';
import 'package:info_stream/src/core/network/api_end_points.dart';
import 'package:info_stream/src/core/network/rest_client.dart';
import 'package:info_stream/src/features/signup/data/data_sources/signup_remote_data_source.dart';

class SignUpRemoteDataSourceImp implements SignUpRemoteDataSource {
  const SignUpRemoteDataSourceImp({required this.restClient});

  final RestClient restClient;

  @override
  Future<Response> signUp({required Map<String, dynamic> requestBody}) async {
    final response = await restClient.post(
      APIType.PUBLIC,
      ApiEndPoints.registration,
      requestBody,
    );

    return response;
  }
}
