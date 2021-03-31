import 'package:flutter/material.dart';

import '../NewPage.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
//              UserAccountsDrawerHeader(
//                accountEmail: Text('test@gmail.com'),
//                accountName: Text('Julian Currie'),
////                otherAccountsPictures: [Icon(Icons.home), Icon(Icons.ac_unit)],
//                currentAccountPicture: CircleAvatar(
//                  backgroundImage: NetworkImage(
//                      'https://i7.pngguru.com/preview/633/903/703/hey-you-pikachu-pokemon-go-ash-ketchum-pikachu.jpg'),
//                ),
//              ),
              DrawerHeader(
//                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                        image:NetworkImage(
                      'https://i7.pngguru.com/preview/633/903/703/hey-you-pikachu-pokemon-go-ash-ketchum-pikachu.jpg'),

//                        AssetImage("assets/gold.jpg"),
                        fit: BoxFit.cover)
                ), child: null,
              ),
              ListTile(
                title: Text('Page1'),
                leading: Icon(Icons.home),
                onTap: () =>Navigator.of(context).push(NewPage(0)),
              ),
              ListTile(
                title: Text('Page2'),
                leading: Icon(Icons.personal_video),
                onTap: () =>  Navigator.of(context).push(NewPage(1)),
              ),
              ListTile(
                title: Text('Page3'),
                leading: Icon(Icons.settings),
                onTap: () => Navigator.of(context).push(NewPage(2)),
              )
            ],
          ),
        ),
      ),
    );
  }
}