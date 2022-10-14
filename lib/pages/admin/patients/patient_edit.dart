import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ispa_app/models/disease_model.dart';
import 'package:ispa_app/models/patient_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class PatientEdit extends StatefulWidget {
  final int id;
  final String name;
  final String gender;
  final String age;
  final String x1;
  final String x2;
  final String x3;
  final String x4;
  final String x5;
  final String x6;
  final String x7;
  final String x8;
  final String x9;
  final String labelFromDisease;
  const PatientEdit(
      {Key? key,
      required this.id,
      required this.name,
      required this.gender,
      required this.age,
      required this.x1,
      required this.x2,
      required this.x3,
      required this.x4,
      required this.x5,
      required this.x6,
      required this.x7,
      required this.x8,
      required this.x9,
      required this.labelFromDisease})
      : super(key: key);

  @override
  PatientEditState createState() => PatientEditState();
}

class PatientEditState extends State<PatientEdit>
    with SingleTickerProviderStateMixin {
  int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0;
  late String genderValue;
  late int labelFromDiseaseValue;

  bool _saving = false;
  var formKey = GlobalKey<FormState>();
  PatientModel patientModel = PatientModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  late Future<dynamic> diseaseList;
  DiseaseModel diseaseModel = DiseaseModel();
  var labelFromDiseaseData = [];

  var genderData = [
    'Laki laki',
    'Perempuan',
  ];

  late TabController _tabController;

  final List<Tab> myTabs = <Tab>[
    const Tab(
      icon: Icon(Icons.account_circle),
      text: 'Data Diri',
    ),
    const Tab(
      icon: Icon(Icons.book),
      text: 'Data Kuesioner',
    ),
  ];

  changeMyTab() {
    setState(() {
      _tabController.index = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
    diseaseList = diseaseModel
        .getDisease()
        .then((value) => {labelFromDiseaseData = value!});
    nameController.text = widget.name;
    ageController.text = widget.age;
    labelFromDiseaseValue = int.parse(widget.labelFromDisease);
    genderValue = widget.gender;
    x1 = int.parse(widget.x1);
    x2 = int.parse(widget.x2);
    x3 = int.parse(widget.x3);
    x4 = int.parse(widget.x4);
    x5 = int.parse(widget.x5);
    x6 = int.parse(widget.x6);
    x7 = int.parse(widget.x7);
    x8 = int.parse(widget.x8);
    x9 = int.parse(widget.x9);
  }

  Future<void> hapusData() async {
    setState(() {
      _saving = true;
    });
    patientModel.deletePatient(widget.id).then((value) {
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

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
            controller: _tabController,
          ),
          title: const Text('Ubah Data Pasien'),
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
                        title: const Text('Hapus Data Pasien'),
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
          child: TabBarView(
            controller: _tabController,
            children: [
              Form(
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
                            padding: const EdgeInsets.only(top: 10, bottom: 20),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: ageController,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'Umur',
                                  hintText: 'Masukkan Umur'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Data belum diisi';
                                }
                                return null;
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
                          Padding(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            child: DropdownButtonFormField(
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.account_circle),
                                  border: OutlineInputBorder(),
                                  labelText: 'Jenis Penyakit',
                                  hintText: 'Pilih Jenis Penyakit'),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: labelFromDiseaseData.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'],
                                  child: Text(item['name']),
                                );
                              }).toList(),
                              onChanged: (newValue) {
                                setState(() {
                                  labelFromDiseaseValue = newValue as int;
                                });
                              },
                              value: labelFromDiseaseValue,
                              validator: (value) {
                                if (value == null) {
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
                                  changeMyTab();
                                }
                              },
                              child: const Text(
                                'Lanjutkan',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "1. Apakah mengalami batuk/pilek?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x1 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x1,
                                    onChanged: (value) {
                                      setState(() {
                                        x1 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x1 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x1,
                                    onChanged: (value) {
                                      setState(() {
                                        x1 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "2. Apakah batuk berlangsung kurang dari 14 hari atau lebih dari 14 hari?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x2 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x2,
                                    onChanged: (value) {
                                      setState(() {
                                        x2 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x2 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x2,
                                    onChanged: (value) {
                                      setState(() {
                                        x2 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "3. Apakah suhu tubuh diatas 37,5°C?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x3 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x3,
                                    onChanged: (value) {
                                      setState(() {
                                        x3 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x3 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x3,
                                    onChanged: (value) {
                                      setState(() {
                                        x3 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "4. Apakah ada napas cepat kurang dari 50x/menit (usia 2 bulan - < 12 bulan) atau kurang dari 40x/menit (12 bulan – 59 bulan)?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x4 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x4,
                                    onChanged: (value) {
                                      setState(() {
                                        x4 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x4 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x4,
                                    onChanged: (value) {
                                      setState(() {
                                        x4 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "5. Adakah tarikan dinding pada dada anak?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x5 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x5,
                                    onChanged: (value) {
                                      setState(() {
                                        x5 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x5 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x5,
                                    onChanged: (value) {
                                      setState(() {
                                        x5 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "6. Apakah saat bernapas ada wheezing?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x6 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x6,
                                    onChanged: (value) {
                                      setState(() {
                                        x6 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x6 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x6,
                                    onChanged: (value) {
                                      setState(() {
                                        x6 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "7. Apakah saat bernapas lubang hidung kembang kempis dengan cukup lebar?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x7 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x7,
                                    onChanged: (value) {
                                      setState(() {
                                        x7 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x7 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x7,
                                    onChanged: (value) {
                                      setState(() {
                                        x7 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "8. Apakah bibir atau kulit berwarna kebiruan?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x8 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x8,
                                    onChanged: (value) {
                                      setState(() {
                                        x8 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x8 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x8,
                                    onChanged: (value) {
                                      setState(() {
                                        x8 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "9. Apakah kesadaran menurun?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x9 = 1;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Ya"),
                                  Radio(
                                    value: 1,
                                    groupValue: x9,
                                    onChanged: (value) {
                                      setState(() {
                                        x9 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            x9 = 0;
                          });
                        },
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                  color: const Color(0xff263238), width: 0.1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, right: 20, left: 20, bottom: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text("Tidak"),
                                  Radio(
                                    value: 0,
                                    groupValue: x9,
                                    onChanged: (value) {
                                      setState(() {
                                        x9 = value!;
                                      });
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 50),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              _saving = true;
                            });
                            patientModel
                                .updatePatient(
                                    widget.id,
                                    nameController.text,
                                    genderValue,
                                    ageController.text,
                                    x1.toString(),
                                    x2.toString(),
                                    x3.toString(),
                                    x4.toString(),
                                    x5.toString(),
                                    x6.toString(),
                                    x7.toString(),
                                    x8.toString(),
                                    x9.toString(),
                                    labelFromDiseaseValue.toString())
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
                          },
                          child: const Text(
                            'Ubah',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
