import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/about_diseases/about_disease_create.dart';
import 'package:ispa_app/pages/admin/about_diseases/about_disease_edit.dart';

class AboutDiseaseView extends StatelessWidget {
  const AboutDiseaseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tentang ISPA'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutDiseaseEdit()),
                    );
                  },
                  title: const Text("Nevin Trian"),
                  subtitle: const Text("Batuk Berdahak"),
                  leading: const Icon(Icons.account_circle),
                  trailing: const Text("Laki laki"))),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutDiseaseEdit()),
                    );
                  },
                  title: const Text("Nevin Trian"),
                  subtitle: const Text("Batuk Berdahak"),
                  leading: const Icon(Icons.account_circle),
                  trailing: const Text("Laki laki"))),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutDiseaseEdit()),
                    );
                  },
                  title: const Text("Nevin Trian"),
                  subtitle: const Text("Batuk Berdahak"),
                  leading: const Icon(Icons.account_circle),
                  trailing: const Text("Laki laki"))),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutDiseaseEdit()),
                    );
                  },
                  title: const Text("Nevin Trian"),
                  subtitle: const Text("Batuk Berdahak"),
                  leading: const Icon(Icons.account_circle),
                  trailing: const Text("Laki laki"))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AboutDiseaseCreate()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
