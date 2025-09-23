import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/Quran/MostRecentSlider.dart';
import 'package:islami/UI/home/Quran/Sura.dart';
import 'package:islami/UI/home/Quran/SuraRow.dart';

class QuranScreen extends StatefulWidget {

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  List<Chapter> filteredChapters = [];

  _QuranScreenState() {
    filteredChapters = chapters;
  }

  final List<Chapter> chapters = Chapter.getQuranChapters();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextField(
          onChanged: (text) {
            searchForChapter(text.toLowerCase());
          },
          decoration: InputDecoration(
              hintText: "Sura name",
              prefixIcon: ImageIcon(Svg(
                  AppIcons.ic_quran
              ), size: 24, color: Theme
                  .of(context)
                  .colorScheme
                  .primary,),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .primary,
                    width: 1,
                  )
              )
          ),
        ),
        MostRecentSlider(),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              return Column(
                children: [
                  SuraRow(chapter: filteredChapters[index]),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 1,
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 24),
              );
            },

            itemCount: filteredChapters.length,
          ),
        ),
      ],
    );
  }

  void searchForChapter(String text) {
    List<Chapter> filteredList = [];
    for (int i = 0; i < chapters.length; i++) {
      if (chapters[i].englishName.contains(text)
          || chapters[i].arabicName.contains(text)) {
        filteredList.add(chapters[i]);
      }
    }
    setState(() {
      filteredChapters = filteredList;
    });
  }
}
