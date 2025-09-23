import 'package:flutter/material.dart';
import 'package:islami/UI/Onboarding/CustomLayout.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageViewController;
  int _currentPageIndex = 0;

  final int _numPages = 5;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        PageView(
          controller: _pageViewController,
          onPageChanged: (index) {
            setState(() => _currentPageIndex = index);
          },
          children: <Widget>[
            CustomLayout(
              image: AppImages.onboarding00,
              mainText: "Welcome To Islmi App",
            ),
            CustomLayout(
              image: AppImages.onboarding01,
              mainText: "Welcome To Islami",
              subText: "We Are Very Excited To Have You In Our Community",
            ),
            CustomLayout(
              image: AppImages.onboarding02,
              mainText: "Reading the Quran",
              subText: "Read, and your Lord is the Most Generous",
            ),
            CustomLayout(
              image: AppImages.onboarding03,
              mainText: "Bearish",
              subText: "Praise the name of your Lord, the Most High",
            ),
            CustomLayout(
              image: AppImages.onboarding04,
              mainText: "Holy Quran Radio",
              subText:
                  "You can listen to the Holy Quran Radio through the application for free and easily",
            ),
          ],
        ),
        PageIndicator(
          currentPageIndex: _currentPageIndex,
          numPages: _numPages,
          onNext: () {
            if (_currentPageIndex == _numPages - 1) {
              Navigator.pushReplacementNamed(
                context,
                AppRoutes.HomeScreen.route,
              );
            } else {
              _pageViewController.nextPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
          onBack: () {
            if (_currentPageIndex > 0) {
              _pageViewController.previousPage(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ],
    );
  }
}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.currentPageIndex,
    required this.numPages,
    required this.onNext,
    required this.onBack,
  });

  final int currentPageIndex;
  final int numPages;
  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          // Back button
          TextButton(
            onPressed: currentPageIndex == 0 ? null : onBack,
            child: Text(
              "Back",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),

          // Dots
          Row(
            children: List.generate(numPages, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPageIndex == index
                      ? AppColors.gold
                      : const Color(0XFF707070),
                ),
              );
            }),
          ),

          // Next / Finish button
          TextButton(
            onPressed: onNext,
            child: Text(
              currentPageIndex == numPages - 1 ? "Finish" : "Next",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
