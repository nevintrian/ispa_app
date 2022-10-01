import 'package:flutter/material.dart';

class Ispa extends StatefulWidget {
  const Ispa({Key? key}) : super(key: key);

  @override
  IspaState createState() => IspaState();
}

class IspaState extends State<Ispa> {
  int? x1, x2, x3, x4, x5, x6, x7, x8, x9 = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Deteksi ISPA'),
          centerTitle: true,
          backgroundColor: Colors.red,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Text(
                  "Apakah mengalami batuk/pilek?",
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
                const Text(
                  "Apakah batuk berlangsung kurang dari 14 hari atau lebih dari 14 hari?",
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
                Container(
                  height: 50,
                  width: width,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context, MaterialPageRoute(builder: (_) => HomePage()));
                    },
                    child: const Text(
                      'Lihat Hasil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
