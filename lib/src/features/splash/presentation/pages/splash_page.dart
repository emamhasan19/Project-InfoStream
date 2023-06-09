// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash/src/core/widgets/colors.dart';
import 'package:splash/src/core/widgets/custom_button.dart';
import 'package:splash/src/core/widgets/custom_text_style.dart';
import 'package:splash/src/core/widgets/logo.dart';
import 'package:splash/src/features/splash/data/models/splash_model.dart';
import 'package:splash/src/features/splash/presentation/pages/welcome_page.dart';

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
        backgroundColor: Palette.primaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Stack(
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
                        CustomTextStyle(
                          text: splashes[index].title,
                          size: 24,
                          color: Palette.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 16),
                        CustomTextStyle(
                          text: splashes[index].description,
                          color: Palette.secondaryColor,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            buttonTitle: "Continue",
                            buttonFunction: () {
                              if (_currentPageIndex < splashes.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const WelcomePage(),
                                  ),
                                );
                              }
                            },
                            textColor: Palette.primaryColor,
                            backgroundColor: Palette.secondaryColor,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Logo(logoSize: 18),
                    Visibility(
                      visible: _currentPageIndex < splashes.length - 1,
                      child: CustomButton(
                        outlined: true,
                        buttonTitle: "Skip",
                        buttonFunction: () {
                          _setSplashPageStatus();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WelcomePage(),
                            ),
                          );
                        },
                        textColor: Palette.secondaryColor,
                        borderColor: Palette.secondaryColor,
                      ),
                    ),
                  ],
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
                          ? Palette.secondaryColor
                          : Palette.secondaryColor.withOpacity(.2),
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
                          ? Palette.secondaryColor
                          : Palette.secondaryColor.withOpacity(.2),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
            color: Palette.secondaryColor,
          ),
        ),
      );
    }

    return indicators;
  }
}
