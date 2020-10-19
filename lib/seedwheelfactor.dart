import 'dart:developer';

import 'package:farmer_app/main.dart';
import 'package:flutter/material.dart';
import 'package:farmer_app/globals.dart' as globals;

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'USC Seed Wheel Calibration';

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: findSWF(),
    );
  }
}

class findSWF extends StatefulWidget {
  @override
  swfCalcs createState() => swfCalcs();
}

class swfCalcs extends State<findSWF> {

  TextEditingController actualTimeInSecondsText =
  new TextEditingController(text: "0");


  String h = "0";
  String m = "0";
  String s = "0";

  var actualTimeInSeconds;
  String accuracyRatePercentage = "0";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                Container(
                  height: 50,
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Actual time in seconds ",
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: new TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    controller: actualTimeInSecondsText,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  height: 20,
                )
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
            // Row(
            //   children: [
            //     Container(
            //       height: 20,
            //     )
            //   ],
            // ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: (Text(
                    "Accuracy rate %:",
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: new Text(
                    accuracyRatePercentage,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
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

                      var acts = double.parse(globals.estimatedTimeInSeconds);

                      actualTimeInSeconds = int.parse
                        (actualTimeInSecondsText.text);

                      accuracyRatePercentage=globals
                          .totalToBeTreated==0?"100%":
                      (((actualTimeInSeconds/acts)*100).toStringAsFixed(0)) + "%";

                      // seedWheelFactor = int.parse(seedWheelFactorText.text);
                      //
                      //
                      //
                      // setSeedWheelRPMTo = (((desiredSeedFlow / 16) /
                      //     (weightOfSeedInCup / useConst)) +
                      //     0.04)
                      //     .toString();
                      //
                      // h = ((((totalToBeTreated / desiredSeedFlow) * 60) / 3600)
                      //     .floor())
                      //     .toString();
                      //
                      // m = (((((totalToBeTreated / desiredSeedFlow) * 60) %
                      //     3600) /
                      //     60)
                      //     .floor())
                      //     .toString();
                      //
                      // s = ((((totalToBeTreated / desiredSeedFlow) * 60) %
                      //     3600) %
                      //     60)
                      //     .truncate()
                      //     .toString();
                      //
                      // estimatedOuncesPerMin =
                      //     ((desiredSeedFlow / 100) * ozPerCwt).toString();

                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
