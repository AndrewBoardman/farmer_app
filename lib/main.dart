import 'package:farmer_app/seedwheelcalculator.dart';
import 'package:farmer_app/flowratecalculator.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'USC Stuff';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: chooseflavour(),
      ),
    );
  }
}

class chooseflavour extends StatefulWidget {
  @override
  _chooseyourapp createState() => _chooseyourapp();
}

class _chooseyourapp extends State<chooseflavour> {
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text(
                "go to seed wheel calculator",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // findSWF
                            seedwheelcalculatorclass()));
              },
            ),
            RaisedButton(
              child: Text(
                "go to flow rate calculator",
                textAlign: TextAlign.center,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            // findSWF
                            flowratecalculatorclass()));
              },
            ),
          ]),
    );
  }
}
