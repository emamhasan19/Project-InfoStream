import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:info_stream/src/core/logger.dart';
import 'package:info_stream/src/features/profile/data/datasource/profile_remote_data_source.dart';
import 'package:info_stream/src/features/profile/data/models/profile_model.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';
import 'package:info_stream/src/features/profile/domain/repositories/profile_repositories.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDataSource profileDataSource;

  ProfileRepositoryImpl({required this.profileDataSource});

  @override
  Future<Either<String, ProfileEntity>> fetchUserProfile() async {
    try {
      final Response response = await profileDataSource.getUserProfile();
      final data = response.data;

      ProfileEntity profile = ProfileModel.fromJson(data);
      return right(profile);
    } catch (e, stackTrace) {
      Log.info(e.toString());
      Log.info(stackTrace.toString());
      return Left(e.toString());
    }
  }
}
