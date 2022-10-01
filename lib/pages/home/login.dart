import 'package:flutter/material.dart';

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
              height: 30,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
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
                        // Navigator.push(
                        //     context, MaterialPageRoute(builder: (_) => HomePage()));
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
