import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<String, ProfileEntity>> fetchUserProfile();
}
