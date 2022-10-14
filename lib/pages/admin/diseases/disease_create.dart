import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ispa_app/models/disease_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DiseaseCreate extends StatefulWidget {
  const DiseaseCreate({Key? key}) : super(key: key);

  @override
  DiseaseCreateState createState() => DiseaseCreateState();
}

class DiseaseCreateState extends State<DiseaseCreate> {
  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController definitionController = TextEditingController();
  TextEditingController causeController = TextEditingController();
  TextEditingController therapyController = TextEditingController();
  DiseaseModel diseaseModel = DiseaseModel();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Data Penyakit'),
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
                            controller: nameController,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.data_saver_on_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Nama Penyakit',
                                hintText: 'Masukkan Nama Penyakit'),
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
                            controller: definitionController,
                            maxLines: 8,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.data_saver_on_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Definisi Penyakit',
                                hintText: 'Masukkan Definisi Penyakit'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: causeController,
                            maxLines: 8,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.data_saver_on_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Penyebab Penyakit',
                                hintText: 'Masukkan Penyebab Penyakit'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: TextFormField(
                            controller: therapyController,
                            maxLines: 8,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.data_saver_on_outlined),
                                border: OutlineInputBorder(),
                                labelText: 'Pengobatan Penyakit',
                                hintText: 'Masukkan Pengobatan Penyakit'),
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

                                diseaseModel
                                    .addDisease(
                                        nameController.text,
                                        definitionController.text,
                                        causeController.text,
                                        therapyController.text)
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
