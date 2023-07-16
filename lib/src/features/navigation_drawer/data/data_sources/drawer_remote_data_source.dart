import 'package:dio/dio.dart';

abstract class DrawerRemoteDataSource {
  Future<Response> fetchDrawerData();
}
