import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/signup/domain/entities/signup_entity.dart';

abstract class SignUpRepository {
  Future<Either<String, SignUpEntity>> signUp({
    required Map<String, dynamic> requestBody,
  });
}
