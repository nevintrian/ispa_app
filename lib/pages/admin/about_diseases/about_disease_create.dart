import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ispa_app/models/about_disease_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AboutDiseaseCreate extends StatefulWidget {
  const AboutDiseaseCreate({Key? key}) : super(key: key);

  @override
  AboutDiseaseCreateState createState() => AboutDiseaseCreateState();
}

class AboutDiseaseCreateState extends State<AboutDiseaseCreate> {
  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  AboutDiseaseModel aboutDiseaseModel = AboutDiseaseModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Data Tentang ISPA'),
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
                            controller: titleController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                                labelText: 'Judul',
                                hintText: 'Masukkan Judul'),
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
                            controller: descriptionController,
                            maxLines: 8,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.edit),
                                border: OutlineInputBorder(),
                                labelText: 'Deskripsi',
                                hintText: 'Masukkan Deskripsi'),
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

                                aboutDiseaseModel
                                    .addAboutDisease(titleController.text,
                                        descriptionController.text)
                                    .then((value) {
                                  if (value['status'] == 201) {
                                    Fluttertoast.showToast(
                                        msg: value['message'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        backgroundColor: Colors.grey,
                                        timeInSecForIosWeb: 1);
                                    Navigator.pop(context, true);
                                  }
                                });
                              }
                            },
                            child: const Text(
                              'Simpan',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
