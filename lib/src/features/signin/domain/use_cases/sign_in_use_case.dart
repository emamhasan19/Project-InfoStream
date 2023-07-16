import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/signin/domain/entities/sign_in_entity.dart';
import 'package:info_stream/src/features/signin/domain/repositories/sign_in_repositories.dart';

class SignInUseCase {
  const SignInUseCase({required this.signInRepository});

  final SignInRepository signInRepository;

  Future<Either<String, SignInEntity>> call({
    required Map<String, dynamic> requestBody,
  }) async {
    return await signInRepository.signIn(requestBody: requestBody);
  }
}
