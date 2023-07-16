import 'package:dio/dio.dart';
import 'package:info_stream/src/core/network/api_end_points.dart';
import 'package:info_stream/src/core/network/rest_client.dart';
import 'package:info_stream/src/core/services/local_storage/cache_service.dart';
import 'package:info_stream/src/features/profile/data/datasource/profile_remote_data_source.dart';

class ProfileDataSourceImp implements ProfileDataSource {
  final RestClient restClient;

  ProfileDataSourceImp({required this.restClient});

  @override
  Future<Response> getUserProfile() async {
    String? token = await CacheService.instance.retrieveBearerToken();

    final response = await restClient.get(
      APIType.PROTECTED,
      ApiEndPoints.getCurrentUsersProfile,
    );

    return response;
  }
}
