import 'package:flutter/material.dart';

class AboutDisease extends StatelessWidget {
  const AboutDisease({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang ISPA'),
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
                  'Penyakit ISPA',
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
                    'Infeksi Saluran Pernapasan Akut (ISPA) atau ARI (Acute Respiratory Infection) dalam bahasa Inggris adalah penyakit yang diakibatkan adanya infeksi pada sistem pernapasan atas dan bawah.',
                    textAlign: TextAlign.justify,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Tanda & Gejala : ",
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
                    "Terapi : ",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Terapi yg diberikan pada penyakit ini biasanya pemberian antibiotik walaupun kebanyakan ISPA disebabkan oleh virus yang dapat sembuh dengan sendirinya tanpa pemberian obat obatan terapeutik, pemberian antibiotik dapat mempercepat penyembuhan penyakit ini dibandingkan hanya pemberian obat obatan symptomatic, selain itu dengan pemberian antibiotik dapat mencegah terjadinya infeksi lanjutan dari bakterial, pemberian, pemilihan antibiotik pada penyakit ini harus diperhatikan dengan baik agar tidak terjadi resistensi kuman/baterial di kemudian hari. Namun pada penyakit ISPA yg sudah berlanjut dengan gejala dahak dan ingus yg sudah menjadi hijau, pemberian antibiotik mungkin diperlukan karena dengan gejala tersebut mungkin sudah ada bakteri yg terlibat.',
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
