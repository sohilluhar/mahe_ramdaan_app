import 'package:flutter/material.dart';
//import 'package:plant_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class RecomendsPlants extends StatelessWidget {
  const RecomendsPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          Card_UI(
            image: "assets/images/image_1.png",
            title: "ABCD",
            country: "XYZ",
            price: 123,
            press: () {
//              Navigator.push(
//                context,
//                MaterialPageRoute(
//                  builder: (context) => DetailsScreen(),
//                ),
//              );
            },
          ),

        ],
      ),
    );
  }
}

class Card_UI extends StatelessWidget {
  const Card_UI({
    Key key,
    this.image,
    this.title,
    this.country,
    this.price,
    this.press,
  }) : super(key: key);

  final String image, title, country;
  final int price;
  final Function press;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 2.5,
      ),
      width: size.width *0.9,
      child: Column(
        children: <Widget>[
//          Image.asset(image),
          GestureDetector(
            onTap: press,
            child: Container(
              padding: EdgeInsets.all(kDefaultPadding / 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                boxShadow: [
//                  BoxShadow(
//                    offset: Offset(0, 10),
//                    blurRadius: 50,
//                    color: kPrimaryColor.withOpacity(0.23),
//                  ),
                ],
              ),
              child:
              Column(
                  children: <Widget>[

              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(

                      children: [
                        TextSpan(
                            text: "$title\n".toUpperCase(),

                            style: Theme.of(context).textTheme.button),

                      ],
                    ),
                  ),
                  Spacer(),
//                  Text(
//                    '\$$price',
//                    style: Theme.of(context)
//                        .textTheme
//                        .button
//                        .copyWith(color: kPrimaryColor),
//                  ),
                ],
              ),
                    Row(
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "$title\n".toUpperCase(),

                                  style: Theme.of(context).textTheme.button),

                            ],
                          ),
                        ),
                        Spacer(),
//                  Text(
//                    '\$$price',
//                    style: Theme.of(context)
//                        .textTheme
//                        .button
//                        .copyWith(color: kPrimaryColor),
//                  ),
                      ],
                    ),
                  ]
            )),
          )
        ],
      ),
    );
  }
}
