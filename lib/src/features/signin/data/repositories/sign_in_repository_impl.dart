import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:info_stream/src/core/logger.dart';
import 'package:info_stream/src/features/signin/data/data_sources/sign_in_remote_data_source.dart';
import 'package:info_stream/src/features/signin/data/models/sign_in_model.dart';
import 'package:info_stream/src/features/signin/domain/entities/sign_in_entity.dart';
import 'package:info_stream/src/features/signin/domain/repositories/sign_in_repositories.dart';

class SignInRepositoryImp implements SignInRepository {
  const SignInRepositoryImp({required this.signInRemoteDataSource});

  final SignInRemoteDataSource signInRemoteDataSource;

  @override
  Future<Either<String, SignInEntity>> signIn({
    required Map<String, dynamic> requestBody,
  }) async {
    try {
      final Response response =
          await signInRemoteDataSource.signIn(requestBody: requestBody);
      final data = response.data;
      SignInEntity model = SignInModel.fromJson(data);

      return Right(model);
    } catch (e, stackTrace) {
      Log.info(e.toString());
      Log.info(stackTrace.toString());
      return Left(e.toString());
    }
  }
}
