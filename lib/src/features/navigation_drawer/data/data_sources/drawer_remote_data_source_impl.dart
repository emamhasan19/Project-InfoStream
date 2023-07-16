// ignore_for_file: override_on_non_overriding_member

import 'package:dio/dio.dart';
import 'package:info_stream/src/core/network/api_end_points.dart';
import 'package:info_stream/src/core/network/rest_client.dart';
import 'package:info_stream/src/features/navigation_drawer/data/data_sources/drawer_remote_data_source.dart';

class DrawerRemoteDataSourcesImpl implements DrawerRemoteDataSource {
  final RestClient restClient;
  DrawerRemoteDataSourcesImpl({required this.restClient});

  @override
  Future<Response> fetchDrawerData() async {
    final response = await restClient.get(
      APIType.PROTECTED,
      ApiEndPoints.current,
    );

    return response;
  }
}
