import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/data_training/data_training_view.dart';

class DataTrainingCreate extends StatefulWidget {
  const DataTrainingCreate({Key? key}) : super(key: key);

  @override
  DataTrainingCreateState createState() => DataTrainingCreateState();
}

class DataTrainingCreateState extends State<DataTrainingCreate>
    with SingleTickerProviderStateMixin {
  int? x1, x2, x3, x4, x5, x6, x7, x8, x9;
  late String jenisKelaminValue;
  late String jenisPenyakitValue;

  var jenisKelaminData = [
    'Laki laki',
    'Perempuan',
  ];

  var jenisPenyakitData = [
    'Batuk Bukan Pneumonia',
    'Pneumonia',
    'Pneumonia Berat'
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
          title: const Text('Tambah Data Training'),
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
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Nama',
                              hintText: 'Masukkan Nama'),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10, bottom: 20),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle),
                              border: OutlineInputBorder(),
                              labelText: 'Umur',
                              hintText: 'Masukkan Umur'),
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
                          items: jenisKelaminData.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jenisKelaminValue = newValue!;
                            });
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
                          items: jenisPenyakitData.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              jenisPenyakitValue = newValue!;
                            });
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
                            changeMyTab();
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x1,
                                  onChanged: (value) {
                                    setState(() {
                                      x1 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x1,
                                  onChanged: (value) {
                                    setState(() {
                                      x1 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x2,
                                  onChanged: (value) {
                                    setState(() {
                                      x2 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x2,
                                  onChanged: (value) {
                                    setState(() {
                                      x2 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x3,
                                  onChanged: (value) {
                                    setState(() {
                                      x3 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x3,
                                  onChanged: (value) {
                                    setState(() {
                                      x3 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x4,
                                  onChanged: (value) {
                                    setState(() {
                                      x4 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x4,
                                  onChanged: (value) {
                                    setState(() {
                                      x4 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x5,
                                  onChanged: (value) {
                                    setState(() {
                                      x5 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x5,
                                  onChanged: (value) {
                                    setState(() {
                                      x5 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x6,
                                  onChanged: (value) {
                                    setState(() {
                                      x6 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x6,
                                  onChanged: (value) {
                                    setState(() {
                                      x6 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x7,
                                  onChanged: (value) {
                                    setState(() {
                                      x7 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x7,
                                  onChanged: (value) {
                                    setState(() {
                                      x7 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x8,
                                  onChanged: (value) {
                                    setState(() {
                                      x8 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x8,
                                  onChanged: (value) {
                                    setState(() {
                                      x8 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Ya"),
                                Radio(
                                  value: 1,
                                  groupValue: x9,
                                  onChanged: (value) {
                                    setState(() {
                                      x9 = value;
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text("Tidak"),
                                Radio(
                                  value: 0,
                                  groupValue: x9,
                                  onChanged: (value) {
                                    setState(() {
                                      x9 = value;
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
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const DataTrainingView()));
                        },
                        child: const Text(
                          'Simpan',
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
    );
  }
}
