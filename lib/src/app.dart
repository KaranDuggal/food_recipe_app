import 'package:flutter/material.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        // '/home': (context) => HomeScreen(),
        // '/loading': (context) => LoadingScreen(),
        // '/loaction': (context) => LocationScreen(),
      },
    );
  }
}