import 'package:equatable/equatable.dart';
import 'package:info_stream/src/features/navigation_drawer/domain/entities/drawer_entities.dart';

enum DrawerStatus { initial, success, failure }

class DrawerState extends Equatable {
  const DrawerState({
    this.status = DrawerStatus.initial,
    this.errorMessage = '',
    this.drawerData,
  });

  final DrawerStatus status;
  final String errorMessage;
  final DrawerEntity? drawerData;

  DrawerState copyWith({
    DrawerStatus? status,
    String? errorMessage,
    DrawerEntity? drawerData,
  }) {
    return DrawerState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      drawerData: drawerData ?? this.drawerData,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        errorMessage,
      ];
}
