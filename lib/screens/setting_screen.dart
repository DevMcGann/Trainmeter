import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainmeter/providers/timeProvider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:trainmeter/widgets/amountOfSets.dart';
import 'package:trainmeter/widgets/setTime.dart';

import 'countdown_screen.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings-screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    // final _preparing =
    //     Provider.of<timeProvider>(context, listen: false).getPreparing;
    // final _working =
    //     Provider.of<timeProvider>(context, listen: false).getWorking;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height * .13,
              child: setTimerWidget(Colors.amber, 'assets/images/prepare.png',
                  'PREPARING...', 'preparing'),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height * .13,
              child: setTimerWidget(Colors.green, 'assets/images/workout.png',
                  'WORKING OUT...', 'working'),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              height: MediaQuery.of(context).size.height * .13,
              child: setTimerWidget(Colors.red, 'assets/images/resting.png',
                  'RESTING...', 'resting'),
            ),
            Container(
              height: MediaQuery.of(context).size.height * .18,
              child: AmountOfSets(),
            ),
            FlatButton(
              onPressed: () {
                // setState(() {});
                // (_working != null || _preparing != null)? 
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => //ManualCounting()
                                CountDownTimer(
                                    Provider.of<timeProvider>(context,listen: false).getPreparing,
                                    Provider.of<timeProvider>(context,listen: false).getWorking,
                                    Provider.of<timeProvider>(context,listen: false).getResting,
                                    Provider.of<timeProvider>(context,listen: false).getSets,
                                    'Preparing',
                                    Colors.amber
                              )));
                    // : Fluttertoast.showToast(
                    //    msg: "Please Set All Timers!",
                    //   toastLength: Toast.LENGTH_SHORT,
                    //   gravity: ToastGravity.CENTER,
                    //   timeInSecForIosWeb: 1,
                    //   backgroundColor: Colors.lightBlueAccent,
                    //   textColor: Colors.white,
                    //   fontSize: 16.0
                    // );
              },
              child: Text(
                "GO",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 65,
                  fontWeight: FontWeight.w900,
                  fontFamily: "Piedra",
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
