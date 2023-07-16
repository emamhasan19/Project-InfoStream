import 'package:equatable/equatable.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';

enum ProfileStatus { initial, loading, success, failure }

class ProfileState extends Equatable {
  const ProfileState({
    this.status = ProfileStatus.initial,
    this.user,
    this.errorMessage = '',
  });

  final ProfileStatus status;
  final ProfileEntity? user;
  final String errorMessage;

  ProfileState copyWith({
    ProfileStatus? status,
    ProfileEntity? user,
    String? errorMessage,
  }) {
    return ProfileState(
      status: status ?? this.status,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, user, errorMessage];
}
