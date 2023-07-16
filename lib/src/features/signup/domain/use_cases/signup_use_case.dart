import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/signup/domain/entities/signup_entity.dart';
import 'package:info_stream/src/features/signup/domain/repositories/signup_repositories.dart';

class SignUpUseCase {
  const SignUpUseCase({required this.signUpRepository});

  final SignUpRepository signUpRepository;

  Future<Either<String, SignUpEntity>> call({
    required Map<String, dynamic> requestBody,
  }) async {
    return await signUpRepository.signUp(requestBody: requestBody);
  }
}
