import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
                'Aplikasi ini digunakan untuk mendeteksi ISPA menggunakan metode naive bayes. Aplikasi ini berbasis android.'),
          ),
        ],
      ),
    );
  }
}
