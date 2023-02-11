import 'package:flutter/material.dart';
import 'package:ispa_app/models/login_visitor_model.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/home/register_visitor.dart';
import 'package:ispa_app/pages/visitor/home.dart' as home_visitor;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginVisitor extends StatefulWidget {
  const LoginVisitor({super.key});

  @override
  State<LoginVisitor> createState() => _LoginVisitorState();
}

class _LoginVisitorState extends State<LoginVisitor> {
  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginVisitorModel loginVisitorModel = LoginVisitorModel();
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
                              controller: nikController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'NIK',
                                  hintText: 'Masukkan NIK'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
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
                                  loginVisitorModel
                                      .login(nikController.text,
                                          passwordController.text)
                                      .then((value) {
                                    if (value['status'] == 200) {
                                      sessionModel.setSession('status',
                                          value['data']['status'].toString());
                                      sessionModel.setSession('nik',
                                          value['data']['nik'].toString());
                                      sessionModel.setSession('name',
                                          value['data']['name'].toString());
                                      sessionModel.setSession(
                                          'date_birth',
                                          value['data']['date_birth']
                                              .toString());
                                      sessionModel.setSession('gender',
                                          value['data']['gender'].toString());
                                      Fluttertoast.showToast(
                                          msg: value['message'],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey,
                                          timeInSecForIosWeb: 1);
                                      Navigator.of(context).pushAndRemoveUntil(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const home_visitor.Home()),
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
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            width: width,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterVisitor()));
                              },
                              child: const Text(
                                'Daftar Pengunjung',
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
