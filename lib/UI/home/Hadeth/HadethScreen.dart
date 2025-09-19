import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/UI/home/Hadeth/Hadeeth.dart';
import 'package:islami/UI/home/Hadeth/HadeethCarouselView.dart';

class HadethScreen extends StatefulWidget {
  @override
  State<HadethScreen> createState() => _HadethScreenState();
}

class _HadethScreenState extends State<HadethScreen> {
  final CarouselController controller = CarouselController(initialItem: 1);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (allHadeeth.isEmpty) {
      loadHadethFile();
    }
    return Container(
      child: allHadeeth.isEmpty
          ? Center(child: CircularProgressIndicator())
          : CarouselView.weighted(
              controller: controller,
              itemSnapping: true,
              flexWeights: const <int>[1, 8, 1],
              children: allHadeeth.map((hadeeth) {
                return HadeethCarouselView(hadeeth);
              }).toList(),
            ),
    );
  }

  List<String> hadeethTitles = [];
  List<String> hadeethBodies = [];
  List<Hadeeth> allHadeeth = [];

  void loadHadethFile() async {
    for (int i = 0; i < 50; i++) {
      String content = await rootBundle.loadString(
        "assets/files/Hadeeth/h${i + 1}.txt",
      );

      List<String> lines = content.trim().split('\n');
      String title = lines.first.trim();
      String body = lines.skip(1).join("\n").trim();

      allHadeeth.add(Hadeeth(title, body));
    }
    setState(() {});
  }
}
