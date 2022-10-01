import 'package:flutter/material.dart';
import 'package:ispa_app/pages/home/about.ispa.dart';
import 'package:ispa_app/pages/home/about_app.dart';

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
                                    child: GestureDetector(
                                      onTap: () {},
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
                                              style: TextStyle(fontSize: 20),
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
                                    child: GestureDetector(
                                      onTap: () {},
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
                                              style: TextStyle(fontSize: 20),
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
              padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {},
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Home()),
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
                                  builder: (context) => const AboutIspa()),
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
                                  builder: (context) => const AboutApp()),
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
                                  builder: (context) => const AboutIspa()),
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
                                    'assets/images/data_training.png',
                                    height: 75,
                                  ),
                                  const Text('Data Training')
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
                                  builder: (context) => const AboutApp()),
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
                                    'assets/images/data_uji.png',
                                    height: 75,
                                  ),
                                  const Text('Data Uji')
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
