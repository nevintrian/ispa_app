import 'package:flutter/material.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/home/home.dart' as home_user;
import 'package:ispa_app/pages/admin/home.dart' as home_admin;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isSession = false;
  @override
  Widget build(BuildContext context) {
    SessionModel sessionModel = SessionModel();
    sessionModel.getSession('id').then((value) {
      setState(() {
        value != null ? isSession = true : isSession = false;
      });
    });
    return MaterialApp(
      title: 'ISPA Detection App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: isSession ? const home_admin.Home() : const home_user.Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
