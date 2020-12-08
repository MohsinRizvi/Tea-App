import 'package:coffee/authentication/authenticate.dart';
import 'package:coffee/home/home.dart';
import 'package:coffee/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
 if (user==null){
   return authenticate();
 }else{
   return Home();
 }
  }
}