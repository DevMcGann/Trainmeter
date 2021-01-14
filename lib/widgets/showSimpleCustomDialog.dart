import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainmeter/providers/timeProvider.dart';

void showSimpleCustomDialog(BuildContext context, Color color, String titulo, String type) {
  Duration _time = new Duration(minutes: 0, seconds: 0);
  //int _minutos;
  //int _segundos; 
    Dialog simpleDialog = Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        color: color,
        height: MediaQuery.of(context).size.height * .49,
        width: 200.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                titulo.toString(),
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),

            CupertinoTimerPicker(
            mode: CupertinoTimerPickerMode.ms,
            initialTimerDuration: new Duration(minutes: 0, seconds: 0),
            secondInterval: 5,
            onTimerDurationChanged: (Duration changedTimer){
              _time = changedTimer; //new Duration(minutes:_minutos, seconds:_segundos);
            },
        ),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.blue,
                    onPressed: () {
                      if (type == 'preparing'){
                        Provider.of<timeProvider>(context, listen: false).setPreparing(_time);
                      }
                      if (type == 'working'){
                        Provider.of<timeProvider>(context, listen: false).setWorking(_time);
                      }
                      if (type == 'resting'){
                        Provider.of<timeProvider>(context, listen: false).setResting(_time);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'SET',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
    showDialog(
        context: context, builder: (BuildContext context) => simpleDialog);
}
