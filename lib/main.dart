import 'package:flutter/material.dart';
import 'package:ispa_app/pages/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ISPA Detection App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
