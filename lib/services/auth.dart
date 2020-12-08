import 'package:coffee/models/user.dart';
import 'package:coffee/services/database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  // sign in with anon
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create new object for firebase
  User _UserfromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  /// Stream work
  Stream<User> get user {
    return _auth.onAuthStateChanged.map(_UserfromFirebaseUser);
  }

  ///

  Future SignInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _UserfromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign in with registration
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      // create new unique id
      await DatabaseService(uid: user.uid).updateUserData("0", "Coffee", 100);
      return _UserfromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //log out
  Future SignOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
