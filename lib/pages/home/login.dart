import 'package:flutter/material.dart';
import 'package:ispa_app/models/login_model.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/admin/home.dart' as home_admin;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginModel loginModel = LoginModel();
  SessionModel sessionModel = SessionModel();

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
        body: ModalProgressHUD(
            inAsyncCall: _saving,
            child: Form(
                key: formKey,
                child: ListView(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.email),
                                  border: OutlineInputBorder(),
                                  labelText: 'Email',
                                  hintText: 'Masukkan Email'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                } else if (!value.contains('@')) {
                                  return "Format email tidak sesuai";
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.password),
                                  border: OutlineInputBorder(),
                                  labelText: 'Password',
                                  hintText: 'Masukkan Password'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                }
                                return null;
                              },
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
                                if (formKey.currentState!.validate()) {
                                  setState(() {
                                    _saving = true;
                                  });
                                  loginModel
                                      .login(emailController.text,
                                          passwordController.text)
                                      .then((value) {
                                    if (value['status'] == 200) {
                                      sessionModel.setSession(
                                          'id', value['data']['id'].toString());
                                      Fluttertoast.showToast(
                                          msg: value['message'],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey,
                                          timeInSecForIosWeb: 1);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const home_admin.Home()),
                                          (Route<dynamic> route) => false);
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Login Gagal"),
                                              content: Text(value['message']),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        _saving = false;
                                                      });
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text(
                                                      "OK",
                                                    )),
                                              ],
                                            );
                                          });
                                    }
                                  });
                                }
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
                ))));
  }
}
