import 'package:deneme_app/screens/main_screen.dart';
import 'package:flutter/material.dart';

class NavigateScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlatButton(
            child: Text('Sonraki Sayfa'),
            color: Colors.red,
            onPressed: () {
              return Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => MainScreen(),
              ));
            }),
      ),
    );
  }
}
