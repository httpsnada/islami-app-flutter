import 'package:shared_preferences/shared_preferences.dart';

class MostRecentProvider {
  static const String _chapter_key = "most_recent_chapter";
  late SharedPreferences _sharedPreferences;

  MostRecentProvider._() //private constructor
  {}

  Future<void> _initSharedPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> init() async {
    if (_mostRecentProvider == null) {
      _mostRecentProvider = MostRecentProvider._();
      await _mostRecentProvider?._initSharedPreferences();
    }
  }

  static MostRecentProvider? _mostRecentProvider = null;

  static MostRecentProvider getInstace() {
    if (_mostRecentProvider == null) {
      throw Exception("MostRecentProvider is not initialized");
    }
    return _mostRecentProvider!;
  }

  Future<void> saveChapter(int index) async {
    // resort and remove duplicate chapters
    var storedList = (_sharedPreferences.getStringList(_chapter_key) ?? []);
    storedList.remove("$index");
    storedList.insert(0, "$index");
    await _sharedPreferences.setStringList(_chapter_key, storedList);
  }

  List<int> getMostRecentChapters() {
    return (_sharedPreferences.getStringList(_chapter_key) ?? [])
        .map((chapterIndex) => int.parse(chapterIndex))
        .toList();
  }
}
