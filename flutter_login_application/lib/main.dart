import 'package:flutter/material.dart';
import 'Login.dart';
import 'home.dart';

main() => runApp(AddLocation());

class AddLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          Login.routes: (ctx) => Login(),         //Login Page Route
          HomePage.routes: (ctx) => HomePage(),   //Home Page Route
        },
      );
}
