import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:info_stream/src/core/logger.dart';
import 'package:info_stream/src/features/signup/data/data_sources/signup_remote_data_source.dart';
import 'package:info_stream/src/features/signup/data/models/signup_model.dart';
import 'package:info_stream/src/features/signup/domain/entities/signup_entity.dart';
import 'package:info_stream/src/features/signup/domain/repositories/signup_repositories.dart';

class SignUpRepositoryImp implements SignUpRepository {
  const SignUpRepositoryImp({required this.signUpRemoteDataSource});

  final SignUpRemoteDataSource signUpRemoteDataSource;

  @override
  Future<Either<String, SignUpEntity>> signUp({
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final Response response =
      await signUpRemoteDataSource.signUp(requestBody: requestBody);
      final data = response.data;
      SignUpEntity model = SignUpModel.fromJson(data);
      return Right(model);
    } catch (e, stackTrace) {
      Log.info(e.toString());
      Log.info(stackTrace.toString());
      return Left(e.toString());
    }
  }
}
