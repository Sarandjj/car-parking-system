// ignore_for_file: unused_local_variable

import 'package:ak_smart/InsertData.dart';
import 'package:ak_smart/auth/login_page.dart';
import 'package:ak_smart/helper/helper_function.dart';
//import 'package:ak_smart/insertData.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//import 'dart:html';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isSignedIn = false;

  @override
  void initState() {
    super.initState();
    getUserLoggedInStatus();
  }

  getUserLoggedInStatus() async {
    await HelperFunctions.getUserLoggedInStatus().then((value) {
      if (value != null) {
        setState(() {
          _isSignedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          //primaryColor: Constants().primaryColor,
          scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: _isSignedIn ? const InsertData() : const LoginPage(),
    );
  }
}
