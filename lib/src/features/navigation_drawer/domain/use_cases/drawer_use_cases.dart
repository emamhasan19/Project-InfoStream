import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/entities/drawer_entities.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/repositories/drawer_repository.dart';

class DrawerUseCase {
  final DrawerRepository drawerRepository;

  DrawerUseCase({required this.drawerRepository});

  Future<Either<String, DrawerEntity>> fetchDrawerData() async {
    return drawerRepository.fetchDrawerData();
  }
}
