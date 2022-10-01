import 'package:flutter/material.dart';
import 'package:ispa_app/pages/admin/data_uji/data_uji_create.dart';
import 'package:ispa_app/pages/admin/data_uji/data_uji_edit.dart';

class DataUjiView extends StatelessWidget {
  const DataUjiView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Uji'),
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
                        builder: (context) => const DataUjiEdit()),
                  );
                },
                title: const Text("Battery Full"),
                subtitle: const Text("The battery is full."),
                leading: const Icon(Icons.battery_full),
                trailing: const Icon(Icons.star)),
          ),
          Card(
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataUjiEdit()),
                  );
                },
                title: const Text("Anchor"),
                subtitle: const Text("Lower the anchor."),
                leading: const Icon(Icons.anchor),
                trailing: const Icon(Icons.star)),
          ),
          Card(
            child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const DataUjiEdit()),
                  );
                },
                title: const Text("Alarm"),
                subtitle: const Text("This is the time."),
                leading: const Icon(Icons.access_alarm),
                trailing: const Icon(Icons.star)),
          ),
          Card(
              child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DataUjiEdit()),
                    );
                  },
                  title: const Text("Ballot"),
                  subtitle: const Text("Cast your vote."),
                  leading: const Icon(Icons.ballot),
                  trailing: const Icon(Icons.star))),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DataUjiCreate()),
          );
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
