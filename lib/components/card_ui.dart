import 'package:flutter/material.dart';

import '../constants.dart';

class CardUI extends StatelessWidget {
  final String content;

  final String title;

  const CardUI({
    Key key,
    this.title,
    this.content
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

return
            Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
                    )
                ),
                padding: EdgeInsets.all(8),
                width: size.width*0.9,
                child:  Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),

                ),

                padding: EdgeInsets.all(16),
//            color: kPrimaryColor.withOpacity(0.2),
                width: size.width*0.9,
                child:  Text(

                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,color: Colors.black),
                ),),
              SizedBox(height: 24),

            ]);






  }
}


class CardUI_Long extends StatelessWidget {
  final String content;

  final String title;

  const CardUI_Long({
    Key key,
    this.title,
    this.content
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return
      Column(children: [
        Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
//                  bottomLeft: Radius.circular(10),
//                  bottomRight: Radius.circular(10)
              )
          ),
          padding: EdgeInsets.all(8),
          width: size.width*0.9,
          child:  Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: kPrimaryColor.withOpacity(0.2),
            borderRadius: BorderRadius.only(
//                topLeft: Radius.circular(10),
//                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)
            ),

          ),

          padding: EdgeInsets.all(16),
//            color: kPrimaryColor.withOpacity(0.2),
          width: size.width*0.9,
          child:  Text(

            content,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 18,color: Colors.black),
          ),),
        SizedBox(height: 24),

      ]);






  }
}

