import 'package:flutter/material.dart';
import 'package:islami/UI/design.dart';
import 'package:islami/UI/home/Hadeth/Hadeeth.dart';

class HadeethCarouselView extends StatelessWidget {
  Hadeeth hadeeth;

  HadeethCarouselView(this.hadeeth);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        image: DecorationImage(
          image: AssetImage(AppImages.hadeeth_card_bg),
          //  fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Text(
            hadeeth.title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: AppColors.black),
          ),

          SizedBox(height: 20),

          Expanded(
            child: SingleChildScrollView(
              child: Text(
                hadeeth.body,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium?.copyWith(color: AppColors.black),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
