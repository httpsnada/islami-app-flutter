import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/UI/SuraDetails/SuraItem.dart';
import 'package:islami/UI/common/CustomScaffold.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/Quran/Sura.dart';
import 'package:islami/UI/providers/RecentProvider.dart';
import 'package:provider/provider.dart';

class SuraDetails extends StatefulWidget {
  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var chapter = ModalRoute.of(context)!.settings.arguments as Chapter;
    saveChapterToMostRecent(chapter);
    if (verses.isEmpty) {
      loadVerses(chapter.chapterIndex);
    }

    // TODO: implement build
    return CustomScaffold(
      child: Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(title: Text(chapter.englishName)),
        body: CustomScaffold(
          bg: AppImages.bottom,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Text(
                  chapter.arabicName,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return SuraItem(verse: verses[index], index: index + 1);
                    },
                    separatorBuilder: (context, index) => Container(height: 1),
                    itemCount: verses.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveChapterToMostRecent(Chapter chapter) {
    //MostRecentProvider.getInstace().saveChapter(chapter.chapterIndex);

    RecentProvider provider = Provider.of<RecentProvider>(
        context, listen: false);
    provider.saveChapter(chapter);
  }

  loadVerses(int chapterIndex) async {
    //load file
    String content = await rootBundle.loadString(
      "assets/files/Soras/${chapterIndex}.txt",
    );
    List<String> lines = content.trim().split("\n");
    setState(() {
      verses = lines;
    });
  }
}
