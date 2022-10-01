import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/home.dart' as home_admin;

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Login'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Masukkan Email'),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Masukkan Password'),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const home_admin.Home()),
                            (Route<dynamic> route) => false);
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
