import 'package:flutter/material.dart';
import 'package:islami/UI/common/MostRecentProvider.dart';
import 'package:islami/UI/home/Quran/Sura.dart';

class RecentProvider extends ChangeNotifier {
  late MostRecentProvider mostRecentProvider;

  late List<Chapter> _mostRecentChapters;

  List<Chapter> getMostRecentChapters() {
    return _mostRecentChapters;
  }

  RecentProvider() {
    mostRecentProvider = MostRecentProvider.getInstace();
    _mostRecentChapters = [];
    refreshMostRecentChapter();
  }

  void saveChapter(Chapter chapter) async {
    await mostRecentProvider.saveChapter(chapter.chapterIndex);
    refreshMostRecentChapter();
    notifyListeners();
  }

  void refreshMostRecentChapter() {
    _mostRecentChapters = [];
    var savedChapterIndices = mostRecentProvider.getMostRecentChapters();
    savedChapterIndices.forEach((chapterIndex) {
      var chapter = Chapter.chapters[chapterIndex - 1];
      _mostRecentChapters.add(chapter);
    });
  }
}
