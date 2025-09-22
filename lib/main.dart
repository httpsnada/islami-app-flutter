import 'package:flutter/material.dart';
import 'package:islami/UI/SuraDetails/SuraDetails.dart';
import 'package:islami/UI/common/MostRecentProvider.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/HomeScreen.dart';
import 'package:islami/UI/providers/RecentProvider.dart';
import 'package:islami/UI/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentProvider.init();
  runApp(ChangeNotifierProvider(
      create: (context) => RecentProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MostRecentProvider.getInstace();
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
