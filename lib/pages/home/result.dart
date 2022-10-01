import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Deteksi ISPA'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Hasil Deteksi ISPA : Pneumonia',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/about_ispa.png',
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Definisi : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Yang termasuk gejala dari ISPA adalah badan pegal pegal (myalgia), beringus (rhinorrhea), batuk, sakit kepala, sakit pada tengorokan. Penyebab terjadinya ISPA adalah virus, bakteri dan jamur. Kebanyakan adalah virus. Diagnosis yang termasuk dalam keadaan ini adalah, rhinitis, sinusitis, faringitis, tosilitis dan laryngitis.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Penyebab : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Yang termasuk gejala dari ISPA adalah badan pegal pegal (myalgia), beringus (rhinorrhea), batuk, sakit kepala, sakit pada tengorokan. Penyebab terjadinya ISPA adalah virus, bakteri dan jamur. Kebanyakan adalah virus. Diagnosis yang termasuk dalam keadaan ini adalah, rhinitis, sinusitis, faringitis, tosilitis dan laryngitis.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Pengobatan : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Yang termasuk gejala dari ISPA adalah badan pegal pegal (myalgia), beringus (rhinorrhea), batuk, sakit kepala, sakit pada tengorokan. Penyebab terjadinya ISPA adalah virus, bakteri dan jamur. Kebanyakan adalah virus. Diagnosis yang termasuk dalam keadaan ini adalah, rhinitis, sinusitis, faringitis, tosilitis dan laryngitis.',
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
