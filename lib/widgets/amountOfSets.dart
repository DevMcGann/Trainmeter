import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainmeter/providers/timeProvider.dart';

class AmountOfSets extends StatefulWidget {
  @override
  _AmountOfSetsState createState() => _AmountOfSetsState();
}

class _AmountOfSetsState extends State<AmountOfSets> {
  int _sets;  
  @override
  Widget build(BuildContext context) {
    setState(() {
      _sets = Provider.of<timeProvider>(context, listen: true).getSets;
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        
        FlatButton(child: Icon(Icons.arrow_back_ios, color:Colors.white),
        onPressed: (){
          Provider.of<timeProvider>(context, listen:false).quitSets();
        },
        ),

        Text("Sets "+_sets.toString() ,style:TextStyle(color:Colors.white, fontSize: 40)),

        FlatButton(child: Icon(Icons.arrow_forward_ios, color: Colors.white,),
        onPressed: (){
           Provider.of<timeProvider>(context, listen:false).addSets();
        },
        ),

      ],
    );
  }
}