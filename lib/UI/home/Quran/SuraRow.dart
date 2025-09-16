import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/Quran/Sura.dart';
import 'package:islami/UI/routes.dart';

class SuraRow extends StatelessWidget {
  Chapter chapter;

  SuraRow({required this.chapter});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.SuraDetails.route,
          arguments: chapter,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    image: DecorationImage(image: Svg(AppIcons.sura_number)),
                  ),
                  child: Center(child: Text("${chapter.chapterIndex}.")),
                ),
                SizedBox(width: 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chapter.englishName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "${chapter.versesNumber} Verses",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
              ],
            ),

            Text(
              chapter.arabicName,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
