import 'package:flutter/material.dart';
import 'package:ispa_app/models/disease_model.dart';
import 'package:ispa_app/models/patient_model.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class VisitorEdit extends StatefulWidget {
  final int id;
  final String name;
  final String gender;
  final String ageYear;
  final String ageMonth;
  final String dateBirth;
  final String x1;
  final String x2;
  final String x3;
  final String x4;
  final String x5;
  final String x6;
  final String x7;
  final String x8;
  final String x9;
  final String resultFromDiseaseId;
  const VisitorEdit(
      {Key? key,
      required this.id,
      required this.name,
      required this.gender,
      required this.ageYear,
      required this.ageMonth,
      required this.dateBirth,
      required this.x1,
      required this.x2,
      required this.x3,
      required this.x4,
      required this.x5,
      required this.x6,
      required this.x7,
      required this.x8,
      required this.x9,
      required this.resultFromDiseaseId})
      : super(key: key);

  @override
  VisitorEditState createState() => VisitorEditState();
}

class VisitorEditState extends State<VisitorEdit>
    with SingleTickerProviderStateMixin {
  int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0;
  late String genderValue;
  late int resultFromDiseaseValue;

  final bool _saving = false;
  var formKey = GlobalKey<FormState>();
  PatientModel patientModel = PatientModel();

  TextEditingController nameController = TextEditingController();
  TextEditingController ageYearController = TextEditingController();
  TextEditingController ageMonthController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();
  late Future<dynamic> diseaseList;
  DiseaseModel diseaseModel = DiseaseModel();
  var resultFromDiseaseData = [];

  var genderData = [
    'Laki-laki',
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
        .then((value) => {resultFromDiseaseData = value!});
    nameController.text = widget.name;
    ageYearController.text = widget.ageYear;
    ageMonthController.text = widget.ageMonth;
    dateBirthController.text = widget.dateBirth;
    resultFromDiseaseValue = int.parse(widget.resultFromDiseaseId);
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
          title: const Text('Lihat Data Pengunjung'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
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
                              readOnly: true,
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
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             top: 10, bottom: 20, right: 5),
                          //         child: TextFormField(
                          //           readOnly: true,
                          //           keyboardType: TextInputType.number,
                          //           controller: ageYearController,
                          //           decoration: const InputDecoration(
                          //               prefixIcon: Icon(Icons.account_circle),
                          //               border: OutlineInputBorder(),
                          //               labelText: 'Umur (Tahun)',
                          //               hintText: '...',
                          //               suffixText: 'Tahun'),
                          //           validator: (value) {
                          //             if (value == null || value.isEmpty) {
                          //               return 'Data belum diisi';
                          //             }
                          //             return null;
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //     Expanded(
                          //       child: Padding(
                          //         padding: const EdgeInsets.only(
                          //             top: 10, bottom: 20, left: 5),
                          //         child: TextFormField(
                          //           readOnly: true,
                          //           keyboardType: TextInputType.number,
                          //           controller: ageMonthController,
                          //           decoration: const InputDecoration(
                          //               prefixIcon: Icon(Icons.account_circle),
                          //               border: OutlineInputBorder(),
                          //               labelText: 'Umur (Bulan)',
                          //               hintText: '...',
                          //               suffixText: 'Bulan'),
                          //           validator: (value) {
                          //             if (value == null || value.isEmpty) {
                          //               return 'Data belum diisi';
                          //             } else if (int.parse(value) > 12) {
                          //               return 'Data tidak sesuai';
                          //             }
                          //             return null;
                          //           },
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
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
                              onChanged: null,
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
                              items: resultFromDiseaseData.map((item) {
                                return DropdownMenuItem(
                                  value: item['id'],
                                  child: Text(item['name']),
                                );
                              }).toList(),
                              onChanged: null,
                              value: resultFromDiseaseValue,
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
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  'assets/images/sneezing.png',
                                  height: 75,
                                ),
                              ),
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "1. Apakah mengalami batuk/pilek?",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 20),
                              GestureDetector(
                                child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xff263238),
                                          width: 0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                          left: 20,
                                          bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Ya"),
                                          Radio(
                                              value: 1,
                                              groupValue: x1,
                                              onChanged: null)
                                        ],
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                child: Container(
                                    height: 60,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: const Color(0xff263238),
                                          width: 0.1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 20,
                                          right: 20,
                                          left: 20,
                                          bottom: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text("Tidak"),
                                          Radio(
                                              value: 0,
                                              groupValue: x1,
                                              onChanged: null)
                                        ],
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/cough.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "2. Apakah batuk berlangsung kurang dari 14 hari atau lebih dari 14 hari?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Lebih dari 14 hari"),
                                            Radio(
                                                value: 1,
                                                groupValue: x2,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Kurang dari 14 hari"),
                                            Radio(
                                                value: 0,
                                                groupValue: x2,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/fever.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "3. Apakah suhu tubuh diatas 37,5°C?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x3,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x3,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/breathing.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "4. Apakah ada napas cepat kurang dari 30x/menit (usia 2 bulan - < 12 bulan) atau kurang dari 40x/menit (12 bulan – 59 bulan)?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x4,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x4,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/lungs.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "5. Adakah tarikan dinding pada dada anak?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x5,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x5,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/difficulty-breathing.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "6. Apakah saat bernapas ada wheezing?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x6,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x6,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/breathe.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "7. Apakah saat bernapas lubang hidung kembang kempis dengan cukup lebar?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x7,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x7,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/tongue-out.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "8. Apakah bibir atau kulit berwarna kebiruan?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x8,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x8,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 10),
                      Card(
                          child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    'assets/images/faint.png',
                                    height: 75,
                                  ),
                                ),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "9. Apakah kesadaran menurun?",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Ya"),
                                            Radio(
                                                value: 1,
                                                groupValue: x9,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  child: Container(
                                      height: 60,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: const Color(0xff263238),
                                            width: 0.1),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 20,
                                            right: 20,
                                            left: 20,
                                            bottom: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text("Tidak"),
                                            Radio(
                                                value: 0,
                                                groupValue: x9,
                                                onChanged: null)
                                          ],
                                        ),
                                      )),
                                ),
                              ]))),
                      const SizedBox(height: 30),
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
