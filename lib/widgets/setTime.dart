import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainmeter/providers/timeProvider.dart';
import 'package:trainmeter/widgets/showSimpleCustomDialog.dart';


class setTimerWidget extends StatefulWidget {
  final Color color;
  final String imagen;
  final String titulo;
  final String type;  // preparing working resting

  setTimerWidget(this.color, this.imagen, this.titulo, this.type);
    
   
  @override
  _setTimerWidgetState createState() => _setTimerWidgetState();
}

class _setTimerWidgetState extends State<setTimerWidget> {
  Duration _preparing = new Duration(minutes: 00, seconds: 00);
  Duration _working = new Duration(minutes: 00, seconds: 00);
  Duration _resting = new Duration(minutes: 00, seconds: 00);
  

  @override
  Widget build(BuildContext context) {
    setState(() {
      _preparing =   Provider.of<timeProvider>(context, listen: true).getPreparing;
      _working = Provider.of<timeProvider>(context, listen: true).getWorking;
      _resting = Provider.of<timeProvider>(context, listen: true).getResting;
    });
    return Center(
      child: Card(
        color: widget.color,
        child: Column(children: <Widget>[
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(widget.titulo.toString(), style:TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
              ],
            ),
          ),
          Expanded(
            child: GestureDetector(
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset(widget.imagen.toString()),
                  if (widget.type == 'preparing') 
                  Text( _preparing != null ? _preparing.toString().substring(2,7) : "00:00", 
                  style: TextStyle(fontSize: 40)
                  ),
                  if (widget.type == 'working') 
                  Text( _working != null ?_working.toString().substring(2,7) : "00:00" , 
                  style: TextStyle(fontSize: 40)
                  ),
                  if (widget.type == 'resting') 
                  Text( _resting != null ?  _resting.toString().substring(2,7) : "00:00" , 
                  style: TextStyle(fontSize: 40)
                  ),
                  
    
                ],
                ),
                onTap: () {
                  showSimpleCustomDialog(context, widget.color, widget.titulo, widget.type);
                },
            ),
          ),
        ],)
      ),
    );
  }
}

