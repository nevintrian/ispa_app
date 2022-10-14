import 'package:flutter/material.dart';

class TestEdit extends StatefulWidget {
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
  final String diseaseLabel;
  final String diseaseResult;
  const TestEdit(
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
      required this.diseaseLabel,
      required this.diseaseResult})
      : super(key: key);

  @override
  TestEditState createState() => TestEditState();
}

class TestEditState extends State<TestEdit>
    with SingleTickerProviderStateMixin {
  int x1 = 0, x2 = 0, x3 = 0, x4 = 0, x5 = 0, x6 = 0, x7 = 0, x8 = 0, x9 = 0;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController diseaseLabelController = TextEditingController();
  TextEditingController diseaseResultController = TextEditingController();

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
    nameController.text = widget.name;
    ageController.text = widget.age;
    genderController.text = widget.gender;
    diseaseLabelController.text = widget.diseaseLabel;
    diseaseResultController.text = widget.diseaseResult;
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: myTabs,
            controller: _tabController,
          ),
          title: const Text('LIhat Data Pengujian'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          readOnly: true,
                          controller: nameController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Nama',
                              hintText: 'Masukkan Nama'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          readOnly: true,
                          keyboardType: TextInputType.number,
                          controller: ageController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Umur',
                              hintText: 'Masukkan Umur'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          readOnly: true,
                          controller: genderController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Jenis Kelamin',
                              hintText: 'Masukkan Jenis Kelamin'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          readOnly: true,
                          controller: diseaseLabelController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Jenis penyakit',
                              hintText: 'Masukkan Jenis Penyakit'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: TextFormField(
                          readOnly: true,
                          controller: diseaseResultController,
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Hasil Penyakit',
                              hintText: 'Masukkan Hasil Penyakit'),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x1,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x1,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x2,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x2,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x3,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x3,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x4,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x4,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x5,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x5,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x6,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x6,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x7,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x7,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x8,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x8,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
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
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Ya"),
                              Radio(
                                value: 1,
                                groupValue: x9,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 10),
                    Container(
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tidak"),
                              Radio(
                                value: 0,
                                groupValue: x9,
                                onChanged: (value) {},
                              )
                            ],
                          ),
                        )),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
