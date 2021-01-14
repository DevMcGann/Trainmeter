import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainmeter/providers/timeProvider.dart';
import 'package:trainmeter/screens/setting_screen.dart';
import 'package:trainmeter/screens/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => timeProvider()),
        ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trainmeter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        routes:{
          '/': (ctx) => WelcomeScreen(),
          SettingsScreen.routeName: (ctx) => SettingsScreen(),
        },
      ),
    );
  }
}

