// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/widgets/custom_text_style.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_bloc.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_state.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
    // context.read<DrawerBloc>().add(FetchDrawerData());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrawerBloc, DrawerState>(
      builder: (context, state) {
        if (state.status == DrawerStatus.success) {
          final drawerData = state.drawerData;
          //print(state.drawerData);
          return Drawer(
            width: 250,
            child: ListView(
              children: [
                const SizedBox(
                  height: 32,
                ),
                const CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://metro.co.uk/wp-content/uploads/2021/08/CM-Punk-AEW-debut-992c-e1685594763674.jpg?quality=90&strip=all&crop=118px%2C61px%2C1652px%2C854px&resize=1200%2C630',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 80,
                  color: AppColors.primaryColor,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CustomTextStyle(
                          text: drawerData!.name,
                          size: 32,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        CustomTextStyle(
                          text: drawerData.email,
                          color: AppColors.secondaryColor,
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.insert_drive_file_outlined,
                    color: AppColors.primaryColor,
                  ),
                  title: CustomTextStyle(
                    text: 'User ID: ${drawerData.id}',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: AppColors.primaryColor,
                  ),
                  title: const CustomTextStyle(
                    text: 'My Profile',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: AppColors.primaryColor,
                  ),
                  title: const CustomTextStyle(
                    text: 'Logout',
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signIn);
                  },
                ),
              ],
            ),
          );
        } else if (state.status == DrawerStatus.failure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
