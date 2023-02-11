import 'package:flutter/material.dart';
import 'package:ispa_app/models/patient_model.dart';
import 'package:ispa_app/pages/admin/patients/patient_create.dart';
import 'package:ispa_app/pages/admin/patients/patient_edit.dart';

class PatientView extends StatefulWidget {
  const PatientView({super.key});

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  late Future<List<dynamic>?> patientList;
  PatientModel patientModel = PatientModel();
  Future<void> _pullRefresh() async {
    setState(() {
      patientList = patientModel.getPatient();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      patientList = patientModel.getPatient();
    });
  }

  @override
  void initState() {
    super.initState();
    patientList = patientModel.getPatient();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pasien'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: patientList,
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
                                    builder: (context) => PatientEdit(
                                        id: snapshot.data[index]['id'],
                                        name: snapshot.data[index]['name'],
                                        gender: snapshot.data[index]['gender'],
                                        ageYear: snapshot.data[index]
                                            ['age_year'] ?? '',
                                        ageMonth: snapshot.data[index]
                                            ['age_month'] ?? '',
                                        dateBirth: snapshot.data[index]
                                            ['date_birth'] ?? '',
                                        x1: snapshot.data[index]['x1'],
                                        x2: snapshot.data[index]['x2'],
                                        x3: snapshot.data[index]['x3'],
                                        x4: snapshot.data[index]['x4'],
                                        x5: snapshot.data[index]['x5'],
                                        x6: snapshot.data[index]['x6'],
                                        x7: snapshot.data[index]['x7'],
                                        x8: snapshot.data[index]['x8'],
                                        x9: snapshot.data[index]['x9'],
                                        labelFromDisease: snapshot.data[index]
                                            ['label_from_disease_id'])),
                              ).then((value) {
                                if (value == true) {
                                  _pullRefresh();
                                }
                              });
                            },
                            title: Text(snapshot.data[index]['name']),
                            subtitle: Text(snapshot.data[index]['gender']),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PatientCreate()),
          ).then((value) {
            if (value == true) {
              _pullRefresh();
            }
          });
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
    );
  }
}
