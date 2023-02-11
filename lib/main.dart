import 'package:flutter/material.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/home/home.dart' as home_user;
import 'package:ispa_app/pages/admin/home.dart' as home_admin;
import 'package:ispa_app/pages/visitor/home.dart' as home_visitor;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String sessionStatus = "";
  @override
  Widget build(BuildContext context) {
    SessionModel sessionModel = SessionModel();
    sessionModel.getSession('status').then((value) {
      setState(() {
        if (value != null) {
          sessionStatus = value;
        }
      });
    });
    return MaterialApp(
      title: 'ISPA Detection App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: sessionStatus == 'admin'
          ? const home_admin.Home()
          : sessionStatus == 'visitor'
              ? const home_visitor.Home()
              : const home_user.Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
