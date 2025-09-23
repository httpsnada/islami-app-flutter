import 'package:flutter/material.dart';
import 'package:islami/UI/design.dart';

class CustomLayout extends StatelessWidget {
  String image;

  String mainText;
  String subText;

  CustomLayout({
    required this.image,
    required this.mainText,
    this.subText = "",
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: AppColors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image.asset(AppImages.logo, fit: BoxFit.cover, width: 299),
          ),

          SizedBox(height: 16),

          Image.asset(image, fit: BoxFit.cover, width: 398),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  mainText,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12),
                Text(
                  subText,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
