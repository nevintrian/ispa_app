import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ispa_app/models/visitor_model.dart';
import 'package:ispa_app/pages/admin/visitors/visitor_edit.dart';

class VisitorNik extends StatefulWidget {
  final String nik;
  const VisitorNik({super.key, required this.nik});

  @override
  State<VisitorNik> createState() => _VisitorNikState();
}

class _VisitorNikState extends State<VisitorNik> {
  late Future<List<dynamic>?> visitorList;
  VisitorModel visitorModel = VisitorModel();
  Future<void> _pullRefresh() async {
    setState(() {
      visitorList = visitorModel.getVisitorByNik(widget.nik);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      visitorList = visitorModel.getVisitorByNik(widget.nik);
    });
  }

  @override
  void initState() {
    super.initState();
    visitorList = visitorModel.getVisitorByNik(widget.nik);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Riwayat Pengunjung'),
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
                if (snapshot.hasData && !snapshot.data.isEmpty) {
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
                                    builder: (context) => VisitorEdit(
                                          id: snapshot.data[index]['id'],
                                          name: snapshot.data[index]['name'],
                                          gender: snapshot.data[index]
                                              ['gender'],
                                          ageYear: snapshot.data[index]
                                                  ['age_year'] ??
                                              0,
                                          ageMonth: snapshot.data[index]
                                                  ['age_month'] ??
                                              0,
                                          dateBirth: snapshot.data[index]
                                                  ['date_birth'] ??
                                              '',
                                          x1: snapshot.data[index]['x1'],
                                          x2: snapshot.data[index]['x2'],
                                          x3: snapshot.data[index]['x3'],
                                          x4: snapshot.data[index]['x4'],
                                          x5: snapshot.data[index]['x5'],
                                          x6: snapshot.data[index]['x6'],
                                          x7: snapshot.data[index]['x7'],
                                          x8: snapshot.data[index]['x8'],
                                          x9: snapshot.data[index]['x9'],
                                          resultFromDiseaseId:
                                              snapshot.data[index]
                                                  ['result_from_disease_id'],
                                        )),
                              ).then((value) {
                                if (value == true) {
                                  _pullRefresh();
                                }
                              });
                            },
                            title: Text(DateFormat('dd-mm-yyyy HH:mm').format(
                                DateTime.parse(
                                        snapshot.data[index]['created_at'])
                                    .add(const Duration(hours: 7)))),
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
