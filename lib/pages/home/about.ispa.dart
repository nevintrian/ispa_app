import 'package:flutter/material.dart';

class AboutIspa extends StatelessWidget {
  const AboutIspa({super.key});

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
            child: const Text(
                'Yang termasuk gejala dari ISPA adalah badan pegal pegal (myalgia), beringus (rhinorrhea), batuk, sakit kepala, sakit pada tengorokan. Penyebab terjadinya ISPA adalah virus, bakteri dan jamur. Kebanyakan adalah virus. Diagnosis yang termasuk dalam keadaan ini adalah, rhinitis, sinusitis, faringitis, tosilitis dan laryngitis.'),
          )
        ],
      ),
    );
  }
}
