// import 'package:flutter/material.dart';
// import 'package:info_stream/src/core/colors.dart';
//
// class CategoryItemCard extends StatelessWidget {
//   final String categoryName;
//   final String category;
//
//   const CategoryItemCard(
//       {super.key, required this.categoryName, required this.category});
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         elevation: 4.0,
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor,
//                   borderRadius: BorderRadius.circular(
//                     8.0,
//                   ),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 6.0,
//                 ),
//                 child: Center(
//                   child: Text(
//                     category,
//                     style: const TextStyle(
//                       fontSize: 18.0,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 8.0),
//               Text(
//                 categoryName,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:info_stream/src/core/colors.dart';

class CategoryItemCard extends StatelessWidget {
  final String categoryName;
  final String category;
  final IconData icon;

  const CategoryItemCard(
      {super.key,
      required this.categoryName,
      required this.category,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 192,
      height: 110,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
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
                    category,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
              const Divider(
                thickness: 1,
                color: AppColors.primaryColor,
              ),
              // const SizedBox(height: 8.0),
              Text(
                categoryName,
                style: const TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
