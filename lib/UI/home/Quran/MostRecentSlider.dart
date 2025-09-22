import 'package:flutter/material.dart';
import 'package:islami/UI/common/MostRecentProvider.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/providers/RecentProvider.dart';
import 'package:provider/provider.dart';

class MostRecentSlider extends StatefulWidget {
  @override
  State<MostRecentSlider> createState() => _MostRecentSliderState();
}

class _MostRecentSliderState extends State<MostRecentSlider> {
  // List<Chapter> visitedChapters = [] ;

  @override
  void initState() {
    // called before build
    // TODO: implement initState
  }

  @override
  Widget build(BuildContext context) {
    RecentProvider provider = Provider.of<RecentProvider>(context);
    var savedChapterIndices = MostRecentProvider.getInstace()
        .getMostRecentChapters();
    var visitedChapters = provider.getMostRecentChapters();
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text("Most Recent", style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 8),
        Container(
          height: 200,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(12),
                height: 150,
                width: MediaQuery.of(context).size.width * 0.7,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Expanded(
                          child: Image.asset(
                            AppImages.img_most_recent,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                      ],
                    ),

                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          visitedChapters[index].englishName,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.black),
                        ),
                        Text(
                          visitedChapters[index].arabicName,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(color: AppColors.black),
                        ),
                        Text(
                          "${visitedChapters[index].versesNumber} Verses",
                          style: Theme.of(context).textTheme.titleSmall
                              ?.copyWith(color: AppColors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            itemCount: visitedChapters.length,
            separatorBuilder: (context, index) => SizedBox(width: 24),
          ),
        ),
      ],
    );
  }
}
