import 'package:double_back_to_close_app/double_back_to_close_app.dart';
import 'package:flutter/material.dart';
import 'package:ispa_app/models/dashboard_model.dart';
import 'package:ispa_app/models/session_model.dart';
import 'package:ispa_app/pages/admin/diseases/disease_view.dart';
import 'package:ispa_app/pages/admin/patients/patient_view.dart';
import 'package:ispa_app/pages/admin/tests/test_view.dart';
import 'package:ispa_app/pages/admin/visitors/visitor_view.dart';
import 'package:ispa_app/pages/home/about_disease.dart' as home_about_disease;
import 'package:ispa_app/pages/admin/about_diseases/about_disease_view.dart'
    as admin_about_disease;
import 'package:ispa_app/pages/home/about_app.dart' as home_about_app;
import 'package:ispa_app/pages/admin/about_apps/about_app_view.dart'
    as admin_about_app;
import 'package:ispa_app/pages/home/home.dart' as home_user;
import 'package:ispa_app/pages/home/test.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String totalPatient = '0';
  String totalTest = '0';
  String accuracy = '0';

  late Future<dynamic> dashboardList;
  DashboardModel dashboardModel = DashboardModel();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      dashboardList = dashboardModel.getDashboard();
    });
  }

  @override
  void initState() {
    super.initState();
    dashboardList = dashboardModel.getDashboard().then((value) => {
          setState(() {
            totalPatient = value['data']['total_patient'].toString();
            totalTest = value['data']['total_test'].toString();
            accuracy = value['data']['accuracy'].toString();
          })
        });
  }

  Future<void> _pullRefresh() async {
    setState(() {
      dashboardList = dashboardModel.getDashboard().then((value) => {
            setState(() {
              totalPatient = value['data']['total_patient'].toString();
              totalTest = value['data']['total_test'].toString();
              accuracy = value['data']['accuracy'].toString();
            })
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    SessionModel sessionModel = SessionModel();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aplikasi ISPA'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
          content: Text('Tekan sekali lagi untuk keluar aplikasi'),
        ),
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: ListView(
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
                          ListTile(
                            title: const Center(
                                child: Text('Aplikasi Deteksi Penyakit ISPA')),
                            subtitle: Center(
                                child:
                                    Text("Akurasi Deteksi ISPA = $accuracy")),
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
                                                      const PatientView()),
                                            ).then((value) => {_pullRefresh()});
                                          },
                                          child: Center(
                                              child: SizedBox(
                                            height: 100,
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  totalPatient,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Text('Data Pasien')
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
                                            ).then((value) => {_pullRefresh()});
                                          },
                                          child: Center(
                                              child: SizedBox(
                                            height: 100,
                                            child: Center(
                                                child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  totalTest,
                                                  style: const TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Text('Data Pengujian')
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
                                ).then((value) => {_pullRefresh()});
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
                                              sessionModel.removeSession();
                                              Navigator.of(context)
                                                  .pushAndRemoveUntil(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
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
                                          const home_about_disease
                                              .AboutDisease()),
                                ).then((value) => {_pullRefresh()});
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
                                ).then((value) => {_pullRefresh()});
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
                                      builder: (context) =>
                                          const PatientView()),
                                ).then((value) => {_pullRefresh()});
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
                                ).then((value) => {_pullRefresh()});
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
                                          const DiseaseView()),
                                ).then((value) => {_pullRefresh()});
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
                                      const Text('Data Penyakit')
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
                                ).then((value) => {_pullRefresh()});
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
                  )),
              Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                                ).then((value) => {_pullRefresh()});
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
                                          const VisitorView()),
                                ).then((value) => {_pullRefresh()});
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
                                        'assets/images/visitor.png',
                                        height: 75,
                                      ),
                                      const Text('Data Pengunjung')
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
        ),
      ),
    );
  }
}
