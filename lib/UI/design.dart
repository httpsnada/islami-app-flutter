import 'package:flutter/material.dart';

class AppColors {
  static const Color gold = Color(0xFFE2BE7F);
  static const Color white = Color(0xFFffffff);
  static const Color black = Color(0xFF202020);
}

class AppImages {
  static const String bg = "assets/images/home.jpg";
  static const String logo = "assets/images/Logo.png";
  static const String img_bottom_decoration =
      "assets/images/img_bottom_decoration.png";
  static const String img_left_corner = "assets/images/img_left_corner.png";
  static const String img_right_corner = "assets/images/img_right_corner.png";
  static const String bottom = "assets/images/bottom.png";
  static const String hadeeth_card_bg = "assets/images/hadeeth_card_bg.png";
  static const String sebha_head = "assets/images/sebha_head.png";
  static const String sebha_body = "assets/images/sebha_body.png";
  static const String sebha = "assets/images/sebha.png";
  static const String sebha_bg = "assets/images/sebha_bg.png";
 // static const String sebha_head = "assets/images/sebha_head.png";
 // static const String sebha_body = "assets/images/sebha_body.png";
  static const String img_most_recent = "assets/images/img_most_recent.png";
  static const String onboarding00 = "assets/images/onboarding00.png";
  static const String onboarding01 = "assets/images/onboarding01.png";
  static const String onboarding02 = "assets/images/onboarding02.png";
  static const String onboarding03 = "assets/images/onboarding03.png";
  static const String onboarding04 = "assets/images/onboarding04.png";
}

class AppIcons {
  static const String ic_quran = "assets/icons/quran.svg";
  static const String ic_hadeth = "assets/icons/ic_hadeth.svg";
  static const String ic_sebha = "assets/icons/ic_sebha.svg";
  static const String ic_radio = "assets/icons/ic_radio.svg";
  static const String ic_time = "assets/icons/ic_time.svg";
  static const String sura_number = "assets/icons/sura_number.svg";
}

class AppTheme {
  static var darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(primary: AppColors.gold),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.gold,
      selectedItemColor: AppColors.white,
      selectedIconTheme: IconThemeData(color: AppColors.white, size: 28),
      unselectedItemColor: AppColors.black,
      // selectedIconTheme:  ,
      // unselectedIconTheme: ,
      // selectedLabelStyle:  ,
      // unselectedLabelStyle:  ,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: AppColors.gold),
    appBarTheme: AppBarTheme(
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      foregroundColor: AppColors.gold,
      titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      centerTitle: true,
    ),
    scaffoldBackgroundColor: Colors.transparent,
  );
}
