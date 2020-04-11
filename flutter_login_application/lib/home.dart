import 'package:flutter/material.dart';
import 'Login.dart';

class HomePage extends StatelessWidget {
    static const String routes = '/home'; 

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Container(
        color: Colors.white,
        child: Center (
          child: Text('Welcome User !',
          style: TextStyle(
            fontSize: 30,
            color: Colors.cyan[900]
          ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.settings_power,
        color:Colors.cyan[900] ,
        size: 40,),
        backgroundColor: Colors.greenAccent[200],
        onPressed: (){
          Navigator.of(context).pushReplacementNamed(Login.routes);
        },
        ),
    );
  }
}