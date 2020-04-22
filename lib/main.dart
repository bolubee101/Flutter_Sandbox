import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'services/authentication.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  MyHomePage({this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(widget.title),
      ),
      resizeToAvoidBottomInset: true,
      child: Center(
        child: CupertinoButton(
          child: Text("Sign In"),
          onPressed: () {
            Authentication.SignInOrSignUp(email: "abass@gmail.com", password: "password");
          },
        ),
      ),
    );
  }
}
