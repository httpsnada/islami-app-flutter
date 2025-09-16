import 'package:flutter/material.dart';
import 'package:islami/UI/home/Quran/Sura.dart';
import 'package:islami/UI/home/Quran/SuraRow.dart';

class QuranScreen extends StatelessWidget {
  final List<Chapter> chapters = Chapter.getQuranChapters();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return SuraRow(chapter: chapters[index]);
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 24),
              );
            },

            itemCount: 114,
          ),
        ),
      ],
    );
  }
}
