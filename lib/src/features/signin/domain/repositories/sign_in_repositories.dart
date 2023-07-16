import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/signin/domain/entities/sign_in_entity.dart';

abstract class SignInRepository {
  Future<Either<String, SignInEntity>> signIn({
    required Map<String, dynamic> requestBody,
  });
}
