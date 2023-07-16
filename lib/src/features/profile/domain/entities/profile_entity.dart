class ProfileEntity {
  final String id;
  final ProfileDetailEntity user;
  final String handle;
  final String company;
  final String status;
  final List<String> skills;
  final List<dynamic> experience;
  final List<dynamic> education;
  final String date;
  final int v;

  ProfileEntity({
    required this.id,
    required this.user,
    required this.handle,
    required this.company,
    required this.status,
    required this.skills,
    required this.experience,
    required this.education,
    required this.date,
    required this.v,
  });
}

class ProfileDetailEntity {
  final String id;
  final String name;
  final String avatar;

  ProfileDetailEntity({
    required this.id,
    required this.name,
    required this.avatar,
  });
}
