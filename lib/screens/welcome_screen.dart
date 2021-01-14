import 'package:flutter/material.dart';
import 'package:trainmeter/screens/setting_screen.dart';

class WelcomeScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
      final alto = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            //stack con la imagen del fonto y texto nombre app
            Stack(
              children: <Widget>[
              ClipPath(
                child: Container(
                  width: double.infinity,
                  height: alto * .4,
                  child: Image.asset("assets/images/splash.jpg",  fit: BoxFit.cover,),
                  ),
                clipper: MyClipper(),
              ),

              Positioned(
                child: Image.asset("assets/images/TrainmeterLogo.png", fit: BoxFit.cover,)
              ),
              ],
            ),

            Text("A simple yet useful Timer",
             style:TextStyle(
               color:Colors.white, 
               fontSize: 25,
               fontFamily: "ArchitectsDaughter",
               ),
               ),

            SizedBox(height: alto * .18,),

            FlatButton(onPressed: (){ 
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsScreen()
                  )
              );
            }, 
               child: Text("START",
               style: TextStyle(
                 color:Colors.white,
                 fontSize: 95,
                 fontWeight: FontWeight.w900,
                 fontFamily: "Piedra",
               ),),
               ),

          ],
        )
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height - 90, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}