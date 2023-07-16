import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/widgets/custom_snackbar.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_event.dart';
import 'package:info_stream/src/features/profile/presentation/bloc/profile_state.dart';
import 'package:info_stream/src/features/profile/presentation/widgets/category_item_card.dart';
import 'package:info_stream/src/features/profile/presentation/widgets/category_items_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state.status == ProfileStatus.failure) {
            CustomSnackBar(context, "Couldn't load data!");
          }
        },
        builder: (context, state) {
          if (state.status == ProfileStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          } else if (state.status == ProfileStatus.success) {
            return _buildProfileContent(state.user!);
          } else {
            return Container(); // Handle other states if needed
          }
        },
      ),
    );
  }

  Widget _buildProfileContent(ProfileEntity profile) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildProfileImageAndCover(),
          const SizedBox(height: 68.0),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    profile.user.name,
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                  Text(
                    'Handle: ${profile.handle}',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: AppColors.secondaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItemCard(
                category: 'Company',
                categoryName: profile.company,
                icon: Icons.home,
              ),
              const SizedBox(width: 10.0),
              CategoryItemCard(
                category: 'Status',
                categoryName: profile.status,
                icon: Icons.home_repair_service,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          CategoryItemsCard(
            profile: profile,
            categoryName: 'Skills',
            categoryItems: profile.skills,
            icon: Icons.military_tech,
          ),
          const SizedBox(height: 10.0),
          CategoryItemsCard(
            profile: profile,
            categoryName: 'Experience',
            categoryItems: profile.experience,
            icon: Icons.light_mode_sharp,
          ),
          const SizedBox(height: 10.0),
          CategoryItemsCard(
            profile: profile,
            categoryName: 'Education',
            categoryItems: profile.education,
            icon: Icons.menu_book_sharp,
          ),
        ],
      ),
    );
  }

  Stack _buildProfileImageAndCover() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: const DecorationImage(
              image: NetworkImage(
                  'https://www.postwrestling.com/wp-content/uploads/2022/05/cm-punk-678x381.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: FractionalTranslation(
            translation: const Offset(0.0, 0.5),
            child: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                  border: Border.all(
                    color: Colors.white,
                    width: 6.0,
                  ),
                  image: const DecorationImage(
                    image: NetworkImage(
                        'https://metro.co.uk/wp-content/uploads/2021/08/CM-Punk-AEW-debut-992c-e1685594763674.jpg?quality=90&strip=all&crop=118px%2C61px%2C1652px%2C854px&resize=1200%2C630'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 4,
                      right: 0,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Center(
                          child: IconButton(
                            icon: const Icon(
                              Icons.add_a_photo,
                              color: AppColors.primaryColor,
                              size: 14,
                            ),
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
