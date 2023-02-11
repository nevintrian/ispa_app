import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/models/visitor_model.dart';
import 'package:ispa_app/pages/home/login_visitor.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
  VisitorModel visitorModel = VisitorModel();
  SessionModel sessionModel = SessionModel();

  @override
  void initState() {
    super.initState();

    sessionModel.getSession('nik').then((value) {
      setState(() {
        nikController.text = value!;
      });
    });

    sessionModel.getSession('name').then((value) {
      setState(() {
        nameController.text = value!;
      });
    });

    sessionModel.getSession('gender').then((value) {
      setState(() {
        genderValue = value!;
      });
    });
    sessionModel.getSession('date_birth').then((value) {
      setState(() {
        dateBirthController.text = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Halaman Ubah Profil'),
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
                              readOnly: true,
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
                              value: genderValue,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                              "Abaikan jika tidak ingin mengubah password : "),
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
                                  visitorModel
                                      .updateVisitor(
                                          nikController.text,
                                          nameController.text,
                                          genderValue,
                                          dateBirthController.text,
                                          passwordController.text,
                                          passwordController.text != ""
                                              ? "true"
                                              : "false")
                                      .then((value) {
                                    if (value['status'] == 200) {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Logout Pengujung'),
                                              content: SingleChildScrollView(
                                                child: ListBody(
                                                  children: const <Widget>[
                                                    Text(
                                                        'Update profil berhasil, silahkan login kembali'),
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Ya'),
                                                  onPressed: () {
                                                    sessionModel
                                                        .removeSession();
                                                    Navigator.of(context)
                                                        .pushAndRemoveUntil(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        const LoginVisitor()),
                                                            (Route<dynamic>
                                                                    route) =>
                                                                false);
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  "Update profil gagal"),
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
                                'Update',
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
