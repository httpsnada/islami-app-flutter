import 'package:flutter/material.dart';
import 'package:islami/UI/SuraDetails/SuraDetails.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/HomeScreen.dart';
import 'package:islami/UI/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.SuraDetails.route: (context) => SuraDetails(),
      },
      initialRoute: AppRoutes.HomeScreen.route,
    );
  }
}
