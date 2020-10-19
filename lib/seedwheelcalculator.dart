import 'package:farmer_app/seedwheelfactor.dart';

import 'package:flutter/material.dart';
import 'package:farmer_app/globals.dart' as globals;

class seedwheelcalculatorclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'USC Seed Wheel Calibration';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: seedWheelCalcs(),
    );
  }
}

class Item {
  const Item(
    this.name,
  );

  final String name;
}

Item selectedUser;
List<Item> users = <Item>[
  const Item(
    'Corn',
  ),
  const Item(
    'Cotton',
  ),
  const Item(
    'Peas',
  ),
  const Item(
    'Rice',
  ),
  const Item(
    'Soybeans',
  ),
  const Item(
    'Wheat',
  ),
];

// ignore: camel_case_types
class seedWheelCalcs extends StatefulWidget {
  @override
  _allTheCalcsState createState() => _allTheCalcsState();
}

// ignore: camel_case_types
class _allTheCalcsState extends State<seedWheelCalcs> {
  TextEditingController seedWheelFactorText =
      new TextEditingController(text: '100');
  TextEditingController totalToBeTreatedText = new TextEditingController();
  TextEditingController weightOfSeedInCupText = new TextEditingController();
  TextEditingController desiredSeedFlowText = new TextEditingController();
  TextEditingController ozPerCwtText = new TextEditingController();
  // TextEditingController setSeedWheelRPMToText = new TextEditingController();
  // TextEditingController estimatedTimeInSecondsText =
  //     new TextEditingController();
  // TextEditingController estimatedTimeInHrMinSecText =
  //     new TextEditingController();
  // TextEditingController estimatedOuncesPerMinText = new TextEditingController();
  // TextEditingController totalOuncesText = new TextEditingController();

  var seedWheelFactor = 1;

  var weightOfSeedInCup;
  var desiredSeedFlow;
  var ozPerCwt;

  String h = "0";
  String m = "0";
  String s = "0";
  String setSeedWheelRPMTo = "0";

  String estimatedTimeInHrMinSec = "0";
  String estimatedOuncesPerMin = "0";
  String totalOunces = "0";

  var cornConst;
  var cottonConst;
  var peasConst;
  var riceConst;
  var soybeansConst;
  var wheatConst;

  var useConst;
  var whichCrop;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: DropdownButton<Item>(
                      underline: SizedBox(),
                      hint: Text("Select seed type"),
                      value: selectedUser,
                      onChanged: (Item Value) {
                        setState(() {
                          selectedUser = Value;
                          whichCrop = Value.name;
                        });
                      },
                      items: users.map((Item user) {
                        return DropdownMenuItem<Item>(
                          value: user,
                          child: Row(
                            children: <Widget>[
                              Text(
                                user.name,
                                style: TextStyle(color: Colors.black),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: RaisedButton(
                        child: Text(
                          "calculate seed wheel factor",
                          textAlign: TextAlign.center,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      // findSWF
                                      SecondRoute())
                              // (estimatedTimeInSeconds:estimatedTimeInSeconds)),
                              );
                        },
                      )),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Seed wheel factor(%):",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: seedWheelFactorText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Total lb to be treated:",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: totalToBeTreatedText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Weight of seed in cup (lb):",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: weightOfSeedInCupText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Desired seed flow(lb/min): ",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: desiredSeedFlowText,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "oz/cwt:",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: ozPerCwtText,
                  ),
                ),
              ],
            ),
            //555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
            Row(
              children: [
                Container(
                  height: 20,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text("Calculate"),
                  onPressed: () {
                    setState(() {
                      seedWheelFactor = int.parse(seedWheelFactorText.text);

                      cornConst = seedWheelFactor * 0.3808;
                      cottonConst = seedWheelFactor * 0.38153;
                      peasConst = seedWheelFactor * 0.38979;
                      riceConst = seedWheelFactor * 0.37936;
                      soybeansConst = seedWheelFactor * 0.38501;
                      wheatConst = seedWheelFactor * 0.36527;

                      globals.totalToBeTreated =
                          double.parse(totalToBeTreatedText.text);
                      weightOfSeedInCup =
                          double.parse(weightOfSeedInCupText.text);
                      desiredSeedFlow = double.parse(desiredSeedFlowText.text);
                      ozPerCwt = double.parse(ozPerCwtText.text);

                      switch (whichCrop) {
                        case 'Corn':
                          {
                            useConst = cornConst / 100;
                          }
                          break;
                        case 'Cotton':
                          {
                            useConst = cottonConst / 100;
                          }
                          break;
                        case 'Peas':
                          {
                            useConst = peasConst / 100;
                          }
                          break;
                        case 'Rice':
                          {
                            useConst = riceConst / 100;
                          }
                          break;
                        case 'Soybeans':
                          {
                            useConst = soybeansConst / 100;
                          }
                          break;
                        case 'Wheat':
                          {
                            useConst = wheatConst / 100;
                          }
                          break;
                        case 'Select seed type':
                          {
                            useConst = 1;
                          }
                          break;
                      }

                      setSeedWheelRPMTo = (((desiredSeedFlow / 16) /
                                  (weightOfSeedInCup / useConst)) +
                              0.04)
                          .toStringAsFixed(2);

                      globals.estimatedTimeInSeconds =
                          ((globals.totalToBeTreated / desiredSeedFlow) * 60)
                              .toStringAsFixed(0);

                      h = ((((globals.totalToBeTreated / desiredSeedFlow) *
                                      60) /
                                  3600)
                              .floor())
                          .toString();

                      m = (((((globals.totalToBeTreated / desiredSeedFlow) *
                                          60) %
                                      3600) /
                                  60)
                              .floor())
                          .toString();

                      s = ((((globals.totalToBeTreated / desiredSeedFlow) *
                                      60) %
                                  3600) %
                              60)
                          .truncate()
                          .toString();

                      estimatedOuncesPerMin =
                          ((desiredSeedFlow / 100) * ozPerCwt)
                              .toStringAsFixed(2);
                      totalOunces =
                          ((globals.totalToBeTreated / 100) * ozPerCwt)
                              .toStringAsFixed(2);
                    });
                  },
                )
              ],
            ),
            //555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
            Row(
              children: [
                Container(
                  height: 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Set seed wheel RPM to:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    setSeedWheelRPMTo,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Estimated time in seconds:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    globals.estimatedTimeInSeconds,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Estimated time,Hr:min:sec:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    h + ":" + m + ":" + s,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Estimated oz/min: ",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    estimatedOuncesPerMin,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Total oz:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    totalOunces,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
