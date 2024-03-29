import 'package:flutter/material.dart';
import 'package:ispa_app/models/test_model.dart';
import 'package:ispa_app/pages/admin/tests/test_create.dart';
import 'package:ispa_app/pages/admin/tests/test_edit.dart';

class TestView extends StatefulWidget {
  const TestView({super.key});

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  late Future<List<dynamic>?> testList;
  TestModel testModel = TestModel();
  Future<void> _pullRefresh() async {
    setState(() {
      testList = testModel.getTest();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      testList = testModel.getTest();
    });
  }

  @override
  void initState() {
    super.initState();
    testList = testModel.getTest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Pengujian'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: testList,
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
                                    builder: (context) => TestEdit(
                                          id: snapshot.data[index]['id'],
                                          name: snapshot.data[index]['name'],
                                          gender: snapshot.data[index]
                                              ['gender'],
                                          ageYear: snapshot.data[index]
                                              ['age_year'] ?? 0,
                                          ageMonth: snapshot.data[index]
                                              ['age_month'] ?? 0,
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
                                              ['label_from_disease_id'],
                                          diseaseResult: snapshot.data[index]
                                              ['disease_result']['name'],
                                          diseaseLabel: snapshot.data[index]
                                              ['disease_label']['name'],
                                          isCorrect: snapshot.data[index]
                                              ['is_correct'],
                                        )),
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
            MaterialPageRoute(builder: (context) => const TestCreate()),
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
