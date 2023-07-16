import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:info_stream/src/core/logger.dart';
import 'package:info_stream/src/features/navigation_drawer/data/data_sources/drawer_remote_data_source.dart';
import 'package:info_stream/src/features/navigation_drawer/data/models/drawer_model.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/entities/drawer_entities.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/repositories/drawer_repository.dart';

class DrawerRepositoryImpl implements DrawerRepository {
  DrawerRepositoryImpl({required this.drawerRemoteDataSource});
  final DrawerRemoteDataSource drawerRemoteDataSource;

  @override
  Future<Either<String, DrawerEntity>> fetchDrawerData() async {
    try {
      final Response response = await drawerRemoteDataSource.fetchDrawerData();
      final data = response.data;
      DrawerEntity model = DrawerModel.fromJson(data);

      return Right(model);
    } catch (e, stackTrace) {
      Log.info(e.toString());
      Log.info(stackTrace.toString());
      return Left(e.toString());
    }
  }
}
