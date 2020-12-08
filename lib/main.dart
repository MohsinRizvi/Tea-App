import 'package:coffee/Screens/wrapper.dart';
import 'package:coffee/models/user.dart';
import 'package:coffee/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(value: AuthServices().user,
      child: MaterialApp(
      home: Wrapper(),
      )
    );
  }
}
