import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ispa_app/models/register_visitor_model.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/home/login_visitor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterVisitor extends StatefulWidget {
  const RegisterVisitor({super.key});

  @override
  State<RegisterVisitor> createState() => _RegisterVisitorState();
}

class _RegisterVisitorState extends State<RegisterVisitor> {
  late String genderValue;

  var genderData = [
    'Laki-laki',
    'Perempuan',
  ];

  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController nikController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  RegisterVisitorModel registerVisitorModel = RegisterVisitorModel();
  SessionModel sessionModel = SessionModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Daftar Pengunjung'),
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
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'Nama',
                                  hintText: 'Masukkan Nama'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: TextFormField(
                              controller: dateBirthController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'Tanggal Lahir',
                                  hintText: 'Masukkan Tanggal Lahir'),
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                }
                                return null;
                              },
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(
                                        2000), //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2101));

                                if (pickedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);

                                  setState(() {
                                    dateBirthController.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'Jenis Kelamin',
                                  hintText: 'Pilih Jenis Kelamin'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: genderData.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  genderValue = newValue!;
                                });
                              },
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
                                  registerVisitorModel
                                      .register(
                                          nameController.text,
                                          genderValue,
                                          nikController.text,
                                          passwordController.text,
                                          dateBirthController.text)
                                      .then((value) {
                                    if (value['status'] == 201) {
                                      Fluttertoast.showToast(
                                          msg: value['message'],
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM,
                                          backgroundColor: Colors.grey,
                                          timeInSecForIosWeb: 1);
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginVisitor()),
                                      );
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text("Daftar Gagal"),
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
                                'Daftar',
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
