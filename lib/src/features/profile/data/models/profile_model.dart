import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel({
    required String id,
    required ProfileDetailModel user,
    required String handle,
    required String company,
    required String status,
    required List<String> skills,
    required List<dynamic> experience,
    required List<dynamic> education,
    required String date,
    required int v,
  }) : super(
          id: id,
          user: user,
          handle: handle,
          company: company,
          status: status,
          skills: skills,
          experience: experience,
          education: education,
          date: date,
          v: v,
        );

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['_id'],
      user: ProfileDetailModel.fromJson(json['user']),
      handle: json['handle'],
      company: json['company'],
      status: json['status'],
      skills: List<String>.from(json['skills']),
      experience: List<dynamic>.from(json['experience']),
      education: List<dynamic>.from(json['education']),
      date: json['date'],
      v: json['__v'],
    );
  }
}

class ProfileDetailModel extends ProfileDetailEntity {
  ProfileDetailModel({
    required String id,
    required String name,
    required String avatar,
  }) : super(
          id: id,
          name: name,
          avatar: avatar,
        );

  factory ProfileDetailModel.fromJson(Map<String, dynamic> json) {
    return ProfileDetailModel(
      id: json['_id'],
      name: json['name'],
      avatar: json['avatar'],
    );
  }
}
