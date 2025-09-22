import 'dart:math';

import 'package:flutter/material.dart';
import 'package:islami/UI/design.dart';


class SebhaScreen extends StatefulWidget {
  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  List<String> tasbeeh = [
    "سُبْحَانَ اللَّهِ",
    "الْحَمْدُ للّهِ",
    "لَا إِلَهَ إِلَّا اللَّهُ",
    "الْلَّهُ أَكْبَرُ"
  ];

  int counter = 30;

  int currentTasbeehIndex = 0;
  double rotationAngle = 0.0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Column(
        children: [
          Text(
            "سَبِّحِ اسْمَ رَبِّكَ الأعلى ", textDirection: TextDirection.rtl,
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(
                fontSize: 36
            ),),
          SizedBox(height: 12,),
          Image(image: AssetImage(AppImages.sebha_head), height: 86,),
          GestureDetector(
              onTap: onSebhaTap,
              child: SizedBox(
                width: 380, height: 380,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(angle: rotationAngle,
                      child: Image.asset(AppImages.sebha_body,
                        width: 380, height: 380,),),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(tasbeeh[currentTasbeehIndex], style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                            fontSize: 36
                        ),),
                        SizedBox(height: 30,),
                        Text("$counter", style: Theme
                            .of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(
                            fontSize: 36
                        ),)
                      ],
                    ),

                  ],
                ),

              )
          )
        ],
      ),
    );
  }

  void onSebhaTap() {
    setState(() {
      if (counter > 1) {
        counter--;
      } else {
        counter = 30;
        currentTasbeehIndex =
            (currentTasbeehIndex + 1) % tasbeeh.length;
      }

      rotationAngle += pi / 20;
    });
  }

}

// Transform.rotate(
// angle: rotationAngle,
// child: Container(
// width: 380, height: 380,
// decoration: BoxDecoration(
// image: DecorationImage(image: AssetImage(AppImages.sebha_body)),
// ),
//
// ),
// ),

