// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/home.dart';
import 'credentialModal.dart';

class Login extends StatefulWidget {
  static const String routes = '/';
  @override
  _LoginState createState() => _LoginState();
}

final login =
    GlobalKey<ScaffoldState>(); //Key for Showing Snacks Bars for States
String user = 'test';
String password = 'test';

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<
      FormState>(); //Key for using From States(Like Saving & Comparing form Data)
  final _password = FocusNode();
  var contactFormData = Credential(userId: '', password: '');

  void formData() {
    //After Submittting the form

    _formKey.currentState.save();

    if (user == contactFormData.userId &&
        password == contactFormData.password) {
      Navigator.of(context).pushReplacementNamed(HomePage.routes);
    } else {
      login.currentState.showSnackBar(SnackBar(
        backgroundColor: Colors.grey[200],
        content: Text('Wrong Credentials',style: TextStyle(
          color: Colors.redAccent,
          fontSize: 18,
        ),
        textAlign: TextAlign.center,),
      ));
    }
  }

  @override //for Persisiting the value in the field
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: login,
        body: Form(
              key: _formKey,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 8,color:Colors.greenAccent)
                ),
                padding: EdgeInsets.all(30),
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Your User Id',
                          labelText: 'User Id',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue[700],width: 0.5))),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(_password);
                      },
                      onSaved: (value) {
                        contactFormData = Credential(
                          userId: value,
                          password: contactFormData.password,
                        );
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter Your Password',
                          labelText: 'Password',
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.lightBlue[700],width: 0.5))),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      focusNode: _password,
                      onFieldSubmitted: (_) {
                        formData();
                      },
                      onSaved: (value) {
                        contactFormData = Credential(
                          userId: contactFormData.userId,
                          password: value,
                        );
                      },
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15),
                        elevation: 5,
                        shape: Border.all(
                            width: 1.5, color: Colors.greenAccent[400]),
                        focusColor: Colors.amber[200],
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontFamily: 'OpenSans'),
                        ),
                        color: Colors.greenAccent[200],
                        onPressed: formData,
                      ),
                    )
                  ],
                ),
              ),
            )
            ),
    );
  }
}
