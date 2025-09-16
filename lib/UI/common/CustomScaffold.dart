import 'package:flutter/material.dart';
import 'package:islami/UI/design.dart';

class CustomScaffold extends StatelessWidget {
  Widget child;
  String bg;

  CustomScaffold({required this.child, this.bg = AppImages.bg, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      constraints: BoxConstraints.expand(),

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bg), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withValues(alpha: 0.7), AppColors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: child,
      ),
    );
  }
}
