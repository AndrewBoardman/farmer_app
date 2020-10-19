import 'package:farmer_app/seedwheelfactor.dart';

import 'package:flutter/material.dart';
import 'package:farmer_app/globals.dart' as globals;

class flowratecalculatorclass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'USC flow rate calculator';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: seedWheelCalcs(),
    );
  }
}

class seedWheelCalcs extends StatefulWidget {
  @override
  _allTheCalcsState createState() => _allTheCalcsState();
}

// ignore: camel_case_types
class _allTheCalcsState extends State<seedWheelCalcs> {
  TextEditingController seedSizeText =
      new TextEditingController();
  TextEditingController netWeightText = new TextEditingController();
  TextEditingController timeInSecondsText = new TextEditingController();
  TextEditingController chemicalUseRateText = new TextEditingController();

  var seedSize;
  var netWeight;
  var timeInSeconds;
  var chemicalUseRate;

  String adjUseRate = "0";
  var adjUseRateInit;
  String runTotal = "0";
  var runTotalInit;
  String flowRate = "0";
  var flowRateInit;

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
                  child: (Text(
                    "Seed size:",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: seedSizeText,
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
                    "Net weight (lb):",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: netWeightText,
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
                    "Time (s):",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: timeInSecondsText,
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
                    "Chemical use rate (oz/cwt): ",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: chemicalUseRateText,
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

                      seedSize =
                          double.parse(seedSizeText.text);
                      netWeight = double.parse(netWeightText.text);
                      timeInSeconds = double.parse(timeInSecondsText.text);
                      chemicalUseRate = double.parse(chemicalUseRateText.text);


                      adjUseRateInit = ((seedSize / 2800) *
                          chemicalUseRate);

                      adjUseRate=adjUseRateInit.toStringAsFixed(2);

                      runTotalInit = ((netWeight / 100) *
                          adjUseRateInit);

                      runTotal=runTotalInit.toStringAsFixed(2);

                      flowRateInit = ((runTotalInit / timeInSeconds) *60);

                          flowRate=flowRateInit.toStringAsFixed(2);

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
                    "Adj use rate (oz/cwt):",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    adjUseRate,
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
                    "Run total:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    runTotal,
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
                    "Flow rate(oz/min):",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    flowRate,
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
