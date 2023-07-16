import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';
import 'package:info_stream/src/features/profile/domain/repositories/profile_repositories.dart';

class ProfileUseCase {
  final ProfileRepository profileRepository;

  ProfileUseCase({required this.profileRepository});

  Future<Either<String, ProfileEntity>> execute() async {
    return await profileRepository.fetchUserProfile();
  }
}
