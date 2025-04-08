import 'package:flutter/material.dart';
import 'Sign_Up_Screen.dart';
import 'Sign_in_Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'crud_application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/signin': (context) => SignInPage(),
      },
    );
  }
}
