import 'package:flutter/material.dart';

class ManualCounting extends StatefulWidget {
  @override
  _ManualCountingState createState() => _ManualCountingState();
}

class _ManualCountingState extends State<ManualCounting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title:Text('Lets Go')),
      body:SafeArea(child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Contador(Duration(seconds: 20))
          ],  
          )
       ),
    );
  }
}


class Contador extends StatefulWidget {
  final Duration _duration;

  Contador(this._duration);

  @override
  _ContadorState createState() => _ContadorState();
}



class _ContadorState extends State<Contador> {



  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      color: Colors.white,
      child: Card(
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Center(child: Text(widget._duration.toString())),
            FlatButton(onPressed: (){}, child: Text("Arranca Pah")),
          ],
        ),),
    );
  }
}