import 'package:flutter/material.dart';
import 'source/screens/login.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ManejoDeProviders',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        accentColor: Colors.black,
        primaryColor: Colors.blue,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.yellow,
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      home: PantallaLogin(),
    );
  }
}
