import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ispa_app/models/disease_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class DiseaseEdit extends StatefulWidget {
  final int id;
  final String name;
  const DiseaseEdit({Key? key, required this.id, required this.name})
      : super(key: key);

  @override
  DiseaseEditState createState() => DiseaseEditState();
}

class DiseaseEditState extends State<DiseaseEdit> {
  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  DiseaseModel diseaseModel = DiseaseModel();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
  }

  Future<void> hapusData() async {
    setState(() {
      _saving = true;
    });
    diseaseModel.deleteDisease(widget.id).then((value) {
      if (value['status'] == 200) {
        Fluttertoast.showToast(
            msg: value['message'],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.grey,
            timeInSecForIosWeb: 1);
        int count = 0;
        Navigator.of(context).popUntil((_) => count++ >= 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ubah Data Penyakit'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Hapus Data Penyakit'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text('Apa anda ingin menghapus data?'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Ya'),
                            onPressed: () {
                              Navigator.of(context).pop();
                              hapusData();
                            },
                          ),
                          TextButton(
                            child: const Text('Tidak'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              child: Container(
                  padding: const EdgeInsets.all(15),
                  child: const Icon(Icons.delete)),
            )
          ],
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
                                    .updateDisease(
                                        widget.id, nameController.text)
                                    .then((value) {
                                  if (value['status'] == 200) {
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
                              'Ubah',
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
