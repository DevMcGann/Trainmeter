import 'package:flutter/material.dart';
import 'dart:math' as math;


class CountDownTimer extends StatefulWidget {
   final Duration _duration;  //preparing
   final Duration _working;
   final Duration _resting;
   final int sets; 
   final String _title;
   final Color _color;


  CountDownTimer(this._duration, this._working, this._resting, this.sets,
   this._title, this._color);

  
  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer> with TickerProviderStateMixin {
  AnimationController controller;



  String get timerString {
    Duration duration = (controller.duration + Duration(seconds: 1)) * (controller.value);
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }


  @override
  void initState() {
    super.initState();
  
    controller = AnimationController(
      vsync: this,
      duration: widget._duration != null ? widget._duration : 0,
    )..addStatusListener((state) {
      if (state == AnimationStatus.dismissed) {
        
      } 
    })..addListener(() {
        setState(() {});
      });

    controller.reverse(from: controller.value == 0.0  ? 1.0: controller.value);
      
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title:Text('Lets Go')),
      body: SafeArea(
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child:
                    Container(
                      color: widget._color,
                      height:controller.value * MediaQuery.of(context).size.height,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 30,),
                        Text('Sets' ,style:TextStyle(color:Colors.white, fontSize: 35)),
                        Expanded(
                          child: Align(
                            alignment: FractionalOffset.center,
                            child: AspectRatio(
                              aspectRatio: 1.0,
                              child: Stack(
                                children: <Widget>[
                                  Positioned.fill(
                                    child: CustomPaint(
                                        painter: CustomTimerPainter(
                                          animation: controller,
                                          backgroundColor: Colors.white,
                                          color: themeData.indicatorColor,
                                        )),
                                  ),
                                  Align(
                                    alignment: FractionalOffset.center,
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: <Widget>[
                                          //TIMER
                                        Text(
                                          widget._title,
                                          style: TextStyle(fontSize: 30.0,color: Colors.white),),
                                       
                                        Text(
                                          timerString,
                                          style: TextStyle(fontSize: 112.0,color: Colors.white),),
                                      ],

                                    ),

                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        AnimatedBuilder(
                            animation: controller,
                            builder: (context, child) {
                              return FloatingActionButton.extended(
                                  onPressed: () {
                                    
                                    if (controller.isAnimating)
                                      controller.stop();
                                    else {
                                      controller.reverse(
                                          from: controller.value == 0.0
                                              ? 1.0
                                              : controller.value);
                                    }
                                  },
                                  icon: Icon(controller.isAnimating ? Icons.pause : Icons.play_arrow),
                                  label: Text(
                                      controller.isAnimating ? "Pause" : "Play", 
                                        style: TextStyle(fontSize: 30)
                                        )
                                );
                            }),
                            
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 10, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }

}