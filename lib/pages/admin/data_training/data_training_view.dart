import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/data_training/data_training_create.dart';
import 'package:ispa_app/pages/admin/data_training/data_training_edit.dart';

class DataTrainingView extends StatelessWidget {
  const DataTrainingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Training'),
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
                          builder: (context) => const DataTrainingEdit()),
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
                          builder: (context) => const DataTrainingEdit()),
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
                          builder: (context) => const DataTrainingEdit()),
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
                          builder: (context) => const DataTrainingEdit()),
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
            MaterialPageRoute(builder: (context) => const DataTrainingCreate()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
