import 'package:flutter/material.dart';

class SuraItem extends StatelessWidget {
  String verse;

  int index;

  SuraItem({required this.verse, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      alignment: Alignment.center,

      child: Text(
        "$verse ${index}",
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          color: Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
