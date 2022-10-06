import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/patients/patient_create.dart';
import 'package:ispa_app/pages/admin/patients/patient_edit.dart';

class PatientView extends StatelessWidget {
  const PatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
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
                          builder: (context) => const PatientEdit()),
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
                          builder: (context) => const PatientEdit()),
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
                          builder: (context) => const PatientEdit()),
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
                          builder: (context) => const PatientEdit()),
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
            MaterialPageRoute(builder: (context) => const PatientCreate()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
