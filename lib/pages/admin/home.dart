import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/patients/patient_view.dart';
import 'package:ispa_app/pages/admin/tests/test_view.dart';
import 'package:ispa_app/pages/home/about_disease.dart' as home_about_disease;
import 'package:ispa_app/pages/admin/about_diseases/about_disease_view.dart'
    as admin_about_disease;
import 'package:ispa_app/pages/home/about_app.dart' as home_about_app;
import 'package:ispa_app/pages/admin/about_apps/about_app_view.dart'
    as admin_about_app;
import 'package:ispa_app/pages/home/home.dart' as home_user;
import 'package:ispa_app/pages/home/test.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi ISPA'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Center(
                            child: Text('Aplikasi Deteksi Penyakit ISPA')),
                        subtitle:
                            Center(child: Text('Akurasi Deteksi ISPA = 88%')),
                      ),
                      const Divider(color: Colors.grey),
                      Container(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 10),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TestView()),
                                        );
                                      },
                                      child: Center(
                                          child: SizedBox(
                                        height: 100,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              '15',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('Total Data Training')
                                          ],
                                        )),
                                      )),
                                    ),
                                  ),
                                  const VerticalDivider(
                                    color: Colors.black,
                                    thickness: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const TestView()),
                                        );
                                      },
                                      child: Center(
                                          child: SizedBox(
                                        height: 100,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: const [
                                            Text(
                                              '15',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text('Total Data Uji')
                                          ],
                                        )),
                                      )),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: const Center(
                child: Text(
              'Halaman Beranda',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Test()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/ispa.png',
                                    height: 75,
                                  ),
                                  const Text('Deteksi ISPA')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Logout Admin'),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: const <Widget>[
                                          Text('Apa anda ingin logout?'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Ya'),
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              const home_user
                                                                  .Home()),
                                                  (Route<dynamic> route) =>
                                                      false);
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
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/logout.png',
                                    height: 75,
                                  ),
                                  const Text('Logout')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const home_about_disease.AboutDisease()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/about_ispa.png',
                                    height: 75,
                                  ),
                                  const Text('Tentang ISPA')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const home_about_app.AboutApp()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/about_app.png',
                                    height: 75,
                                  ),
                                  const Text('Tentang Aplikasi')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
            padding: const EdgeInsets.only(top: 30, bottom: 10),
            child: const Center(
                child: Text(
              'Pengaturan Data',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            )),
          ),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PatientView()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/patient.png',
                                    height: 75,
                                  ),
                                  const Text('Data Pasien')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TestView()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/test.png',
                                    height: 75,
                                  ),
                                  const Text('Data Pengujian')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
          Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const admin_about_app.AboutAppView()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/about_app_data.png',
                                    height: 75,
                                  ),
                                  const Text('Data Tentang Aplikasi')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const admin_about_disease
                                          .AboutDiseaseView()),
                            );
                          },
                          child: Card(
                            elevation: 4, // Change this
                            shadowColor: Colors.black12, // Change this
                            child: Center(
                                child: SizedBox(
                              height: 150,
                              child: Center(
                                  child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Image.asset(
                                    'assets/images/about_ispa_data.png',
                                    height: 75,
                                  ),
                                  const Text('Data Tentang ISPA')
                                ],
                              )),
                            )),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ))
        ],
      ),
    );
  }
}
