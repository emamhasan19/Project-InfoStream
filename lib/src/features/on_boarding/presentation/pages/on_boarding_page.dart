// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:info_stream/src/core/colors.dart';
import 'package:info_stream/src/core/routes/routes.dart';
import 'package:info_stream/src/core/services/local_storage/cache_service.dart';
import 'package:info_stream/src/core/widgets/custom_button.dart';
import 'package:info_stream/src/core/widgets/custom_text_style.dart';
import 'package:info_stream/src/core/widgets/logo.dart';
import 'package:info_stream/src/features/on_boarding/presentation/model/on_boarding_model.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPageIndex = 0;
  final List<OnBoardingModel> onBoardingModels = OnBoardingModel.fetchAllData();

  @override
  void initState() {
    super.initState();
    _setOnBoardingPageStatus();
  }

  Future<void> _setOnBoardingPageStatus() async {
    await CacheService.instance.setOnBoardingStatus(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: onBoardingModels.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPageIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: AppColors.primaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          onBoardingModels[index].image,
                          height: 300,
                          width: 300,
                        ),
                        const SizedBox(height: 16),
                        CustomTextStyle(
                          text: onBoardingModels[index].title,
                          size: 24,
                          color: AppColors.secondaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(height: 16),
                        CustomTextStyle(
                          text: onBoardingModels[index].description,
                          color: AppColors.secondaryColor,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            buttonTitle: "Continue",
                            buttonFunction: () {
                              if (_currentPageIndex <
                                  onBoardingModels.length - 1) {
                                _pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                );
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, Routes.welcome);
                              }
                            },
                            textColor: AppColors.primaryColor,
                            backgroundColor: AppColors.secondaryColor,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                // top: MediaQuery.of(context).padding.top + 16,
                top: 20,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Logo(logoSize: 18),
                    Visibility(
                      visible: _currentPageIndex < onBoardingModels.length - 1,
                      child: CustomButton(
                        outlined: true,
                        buttonTitle: "Skip",
                        height: 36,
                        buttonFunction: () {
                          _setOnBoardingPageStatus();
                          Navigator.pushReplacementNamed(
                              context, Routes.welcome);
                        },
                        textColor: AppColors.secondaryColor,
                        borderColor: AppColors.secondaryColor,
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
                          ? AppColors.secondaryColor
                          : AppColors.secondaryColor.withOpacity(.2),
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
                        if (_currentPageIndex < onBoardingModels.length - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                      color: _currentPageIndex < onBoardingModels.length - 1
                          ? AppColors.secondaryColor
                          : AppColors.secondaryColor.withOpacity(.2),
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

    for (int i = 0; i < onBoardingModels.length; i++) {
      indicators.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Icon(
            _currentPageIndex == i ? Icons.circle : Icons.circle_outlined,
            size: 10,
            color: AppColors.secondaryColor,
          ),
        ),
      );
    }

    return indicators;
  }
}
