import 'package:dartz/dartz.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/entities/drawer_entities.dart';

abstract class DrawerRepository {
  Future<Either<String, DrawerEntity>> fetchDrawerData();
}
