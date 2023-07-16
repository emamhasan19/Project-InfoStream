import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/features/profile/domain/entities/profile_entity.dart';

class CategoryItemsCard extends StatelessWidget {
  final ProfileEntity profile;
  final String categoryName;
  final List<dynamic> categoryItems;
  final IconData icon;
  const CategoryItemsCard(
      {super.key,
      required this.profile,
      required this.categoryName,
      required this.categoryItems,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon as IconData,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    categoryName,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors
                          .primaryColor, // Set text color to contrast with the background color
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: AppColors.primaryColor,
              ),
              Wrap(
                spacing: 8.0,
                children: categoryItems.isNotEmpty
                    ? categoryItems.map((skill) {
                        return Chip(
                          backgroundColor: AppColors.secondaryColor,
                          label: Text(
                            skill,
                            style:
                                const TextStyle(color: AppColors.primaryColor),
                          ),
                        );
                      }).toList()
                    : [
                        Text(
                          'No ${categoryName.toLowerCase()}s available to display.',
                          style: const TextStyle(fontSize: 14),
                        ),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
