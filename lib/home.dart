import
'package:flutter/material.dart';
import 'package:mahe_ramdaan_app/constants.dart';

import 'components/recomend_plants.dart';
import 'components/title_with_more_bbtn.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // It will provie us total height  and width of our screen
    Size size = MediaQuery.of(context).size;
    // it enable scrolling on small device
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
//          HeaderWithSearchBox(size: size),
          TitleWithMoreBtn(title: "Dua", press: () {}),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Mahe Ramdaan Ashrah dua", press: () {}),
//          FeaturedPlants(),
          RecomendsPlants(),
          TitleWithMoreBtn(title: "Durood Sharif", press: () {}),
          RecomendsPlants(),


        ],
      ),
    );
  }
}
