import 'package:deneme_app/constans.dart';
import 'package:deneme_app/screens/body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigate_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        extendBodyBehindAppBar: false,
        appBar: buildAppBar(),
        body: Body(),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        "Autocar Repair",
        style: TextStyle(fontSize: 16),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return NavigateScreen();
                },
              ));
            },
            child: Icon(CupertinoIcons.bell),
          ),
        )
      ],
    );
  }
}
