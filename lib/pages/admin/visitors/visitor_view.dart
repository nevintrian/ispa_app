import 'package:flutter/material.dart';
import 'package:ispa_app/models/visitor_model.dart';
import 'package:ispa_app/pages/admin/visitors/visitor_nik.dart';

class VisitorView extends StatefulWidget {
  const VisitorView({super.key});

  @override
  State<VisitorView> createState() => _VisitorViewState();
}

class _VisitorViewState extends State<VisitorView> {
  late Future<List<dynamic>?> visitorList;
  VisitorModel visitorModel = VisitorModel();
  Future<void> _pullRefresh() async {
    setState(() {
      visitorList = visitorModel.getVisitor();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      visitorList = visitorModel.getVisitor();
    });
  }

  @override
  void initState() {
    super.initState();
    visitorList = visitorModel.getVisitor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengunjung'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: visitorList,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Container that you just created
              } else {
                if (snapshot.hasData) {
                  return RefreshIndicator(
                    onRefresh: _pullRefresh,
                    child: ListView.builder(
                        padding: const EdgeInsets.all(10),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                              child: ListTile(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => VisitorNik(
                                          nik: snapshot.data[index]['nik'],
                                        )),
                              ).then((value) {
                                if (value == true) {
                                  _pullRefresh();
                                }
                              });
                            },
                            title: Text(snapshot.data[index]['name']),
                            subtitle: Text(snapshot.data[index]['nik']),
                            // trailing: Text(snapshot.data[index]['age_year'] +
                            //     ' Tahun, ' +
                            //     snapshot.data[index]['age_month'] +
                            //     ' Bulan'),
                            trailing:
                                Text(snapshot.data[index]['date_birth'] ?? ''),
                            leading: const Icon(Icons.account_circle),
                          ));
                        }),
                  );
                } else {
                  return const Center(child: Text('Tidak ditemukan data'));
                }
              }
            }),
      ),
    );
  }
}
