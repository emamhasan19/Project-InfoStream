import 'package:info_stream/src/features/navigation_drawer/domain/entities/drawer_entities.dart';

class DrawerModel extends DrawerEntity {
  DrawerModel({
    required String id,
    required String name,
    required String email,
    required String avatar,
  }) : super(id: id, name: name, email: email, avatar: avatar);

  factory DrawerModel.fromJson(Map<String, dynamic> json) => DrawerModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
      };
}
