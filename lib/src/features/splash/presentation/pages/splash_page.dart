// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/features/signup/presentation/pages/signup.dart';
import 'package:splash/src/features/splash/data/models/splash_model.dart';
import 'package:splash/src/features/splash/widgets/logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  final List<SplashModel> splashes = SplashModel.fetchAllData();

  @override
  void initState() {
    super.initState();
    // _setSplashPageStatus();
  }

  Future<void> _setSplashPageStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setBool('showSplash', false);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: splashes.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Palette.primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        splashes[index].image,
                        height: 300,
                        width: 300,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        splashes[index].title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Palette.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          splashes[index].description,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Palette.whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _setSplashPageStatus();
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Palette.whiteColor,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Continue",
                                style: TextStyle(color: Palette.primaryColor),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 16,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: buildSlider(context),
              ),
            ),
            Positioned(
              bottom: 64,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      if (_currentPageIndex > 0) {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    color: _currentPageIndex > 0
                        ? Palette.whiteColor
                        : Palette.whiteColor.withOpacity(.2),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (_currentPageIndex < splashes.length - 1) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      }
                    },
                    color: _currentPageIndex < splashes.length - 1
                        ? Palette.whiteColor
                        : Palette.whiteColor.withOpacity(.2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSlider(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        Visibility(
          visible: _currentPageIndex < splashes.length - 1,
          child: ElevatedButton(
            onPressed: () {
              _setSplashPageStatus();

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUp(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Palette.whiteColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Skip",
                style: TextStyle(color: Palette.primaryColor),
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < splashes.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            _currentPageIndex == i ? Icons.circle : Icons.circle_outlined,
            size: 10,
            color: Palette.whiteColor,
          ),
        ),
      );
    }

    return indicators;
  }
}
