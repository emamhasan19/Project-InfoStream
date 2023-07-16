import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/features/navigation_drawer/data/models/drawer_model.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_bloc.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/bloc/drawer_event.dart';
import 'package:info_stream/src/features/navigation_drawer/presentation/pages/drawer_page.dart';

class HomePage extends StatefulWidget {
  final String apiToken;
  const HomePage({Key? key, required this.apiToken}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DrawerModel? userData;
  int likeCount = 0;
  int commentCount = 0;
  int shareCount = 0;

  @override
  void initState() {
    super.initState();
    context.read<DrawerBloc>().add(FetchDrawerData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Home'),
          ],
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      drawer: const DrawerPage(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CardWithActions(
                // title: 'Card Title',
                likeCount: likeCount,
                commentCount: commentCount,
                shareCount: shareCount,
                onLikePressed: () {
                  setState(() {
                    likeCount++;
                  });
                },
                onCommentPressed: () {
                  setState(() {
                    commentCount++;
                  });
                },
                onSharePressed: () {
                  setState(() {
                    shareCount++;
                  });
                },
                imageUrl:
                    'https://external-preview.redd.it/MCa3nankg6CSKu1rbD5bBYij-SbwVHzsngYd7dGYiN8.jpg?auto=webp&s=4e508bf3139fab85b9fd62a6937e03990c8c998a',
              ),
              CardWithActions(
                // title: 'Card Title',
                likeCount: likeCount,
                commentCount: commentCount,
                shareCount: shareCount,
                onLikePressed: () {
                  setState(() {
                    likeCount++;
                  });
                },
                onCommentPressed: () {
                  setState(() {
                    commentCount++;
                  });
                },
                onSharePressed: () {
                  setState(() {
                    shareCount++;
                  });
                },
                imageUrl:
                    'https://cms.nhl.bamgrid.com/images/photos/288257682/1024x576/cut.jpg',
              ),
              CardWithActions(
                // title: 'Card Title',
                likeCount: likeCount,
                commentCount: commentCount,
                shareCount: shareCount,
                onLikePressed: () {
                  setState(() {
                    likeCount++;
                  });
                },
                onCommentPressed: () {
                  setState(() {
                    commentCount++;
                  });
                },
                onSharePressed: () {
                  setState(() {
                    shareCount++;
                  });
                },
                imageUrl:
                    'https://image-cdn.essentiallysports.com/wp-content/uploads/maxresdefault-7-15-3.jpg?width=600',
              ),
              CardWithActions(
                // title: 'Card Title',
                likeCount: likeCount,
                commentCount: commentCount,
                shareCount: shareCount,
                onLikePressed: () {
                  setState(() {
                    likeCount++;
                  });
                },
                onCommentPressed: () {
                  setState(() {
                    commentCount++;
                  });
                },
                onSharePressed: () {
                  setState(() {
                    shareCount++;
                  });
                },
                imageUrl:
                    'https://cdn.wrestletalk.com/wp-content/uploads/2022/02/cm-punk-october-10-a.jpg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class CardWithActions extends StatelessWidget {
//   final String title;
//   final String imageUrl;
//   final int likeCount;
//   final int commentCount;
//   final int shareCount;
//   final VoidCallback onLikePressed;
//   final VoidCallback onCommentPressed;
//   final VoidCallback onSharePressed;
//
//   const CardWithActions({
//     required this.title,
//     required this.imageUrl,
//     required this.likeCount,
//     required this.commentCount,
//     required this.shareCount,
//     required this.onLikePressed,
//     required this.onCommentPressed,
//     required this.onSharePressed,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         shape: RoundedRectangleBorder(
//           borderRadius:
//               BorderRadius.circular(10), // Set the desired border radius
//         ),
//         color: AppColors.secondaryColor,
//         elevation: 6,
//         child: Column(
//           children: [
//             ClipRRect(
//               borderRadius: const BorderRadius.only(
//                 topLeft: Radius.circular(10),
//                 topRight: Radius.circular(10),
//               ), // Set the desired border radius
//               child: Image.network(
//                 imageUrl,
//                 width: double.infinity,
//                 height: 180,
//                 fit: BoxFit.cover,
//               ),
//             ),
//             // const SizedBox(height: 20),
//             // Text(title),
//             // const SizedBox(height: 10),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   ActionButton(
//                     icon: Icons.thumb_up,
//                     // label: 'Like',
//                     count: likeCount,
//                     onPressed: onLikePressed,
//                     iconColor: AppColors.primaryColor,
//                   ),
//                   ActionButton(
//                     icon: Icons.comment,
//                     // label: 'Comment',
//                     count: commentCount,
//                     onPressed: onCommentPressed,
//                     iconColor: AppColors.primaryColor,
//                   ),
//                   ActionButton(
//                     icon: Icons.share,
//                     // label: 'Share',
//                     count: shareCount,
//                     onPressed: onSharePressed,
//                     iconColor: AppColors.primaryColor,
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CardWithActions extends StatelessWidget {
  // final String title;
  final String imageUrl;
  final int likeCount;
  final int commentCount;
  final int shareCount;
  final VoidCallback onLikePressed;
  final VoidCallback onCommentPressed;
  final VoidCallback onSharePressed;

  const CardWithActions({
    // required this.title,
    required this.imageUrl,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.onLikePressed,
    required this.onCommentPressed,
    required this.onSharePressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.network(
                imageUrl,
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   title,
                  //   style: const TextStyle(
                  //     fontSize: 18,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ActionButton(
                        icon: Icons.thumb_up,
                        // label: 'Like',
                        count: likeCount,
                        onPressed: onLikePressed,
                        iconColor: AppColors.primaryColor,
                      ),
                      ActionButton(
                        icon: Icons.comment,
                        // label: 'Comment',
                        count: commentCount,
                        onPressed: onCommentPressed,
                        iconColor: AppColors.primaryColor,
                      ),
                      ActionButton(
                        icon: Icons.share,
                        // label: 'Share',
                        count: shareCount,
                        onPressed: onSharePressed,
                        iconColor: AppColors.primaryColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  // final String label;
  final int count;
  final VoidCallback onPressed;
  final Color iconColor;

  const ActionButton({
    required this.icon,
    // required this.label,
    required this.count,
    required this.onPressed,
    required this.iconColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(height: 5),
          // Text(label),
          // const SizedBox(height: 2),
          Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
