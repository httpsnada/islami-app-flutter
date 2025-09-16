import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islami/UI/common/CustomScaffold.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/Hadeth/HadethScreen.dart';
import 'package:islami/UI/home/Quran/QuranScreen.dart';
import 'package:islami/UI/home/Radio/RadioScreen.dart';
import 'package:islami/UI/home/Sebha/SebhaScreen.dart';
import 'package:islami/UI/home/Times/TimesScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTapIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CustomScaffold(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedTapIndex,
          onTap: (index) {
            setState(() {
              selectedTapIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppIcons.ic_quran, width: 24, height: 24),
              label: "Quran",
            ),

            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppIcons.ic_hadeth, width: 24, height: 24),
              label: "Hadeth",
            ),

            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppIcons.ic_sebha, width: 24, height: 24),
              label: "Sebha",
            ),

            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppIcons.ic_radio, width: 24, height: 24),
              label: "Radio",
            ),

            BottomNavigationBarItem(
              backgroundColor: AppColors.gold,
              icon: SvgPicture.asset(AppIcons.ic_time, width: 24, height: 24),
              label: "Time",
            ),
          ],
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(AppImages.logo, fit: BoxFit.cover, width: 299),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: tabs[selectedTapIndex],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  var tabs = [
    QuranScreen(),
    HadethScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimesScreen(),
  ];
}
