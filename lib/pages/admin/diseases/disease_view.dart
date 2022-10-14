import 'package:flutter/material.dart';
import 'package:ispa_app/models/disease_model.dart';
import 'package:ispa_app/pages/admin/diseases/disease_create.dart';
import 'package:ispa_app/pages/admin/diseases/disease_edit.dart';

class DiseaseView extends StatefulWidget {
  const DiseaseView({super.key});

  @override
  State<DiseaseView> createState() => _DiseaseViewState();
}

class _DiseaseViewState extends State<DiseaseView> {
  late Future<List<dynamic>?> diseaseList;
  DiseaseModel diseaseModel = DiseaseModel();
  Future<void> _pullRefresh() async {
    setState(() {
      diseaseList = diseaseModel.getDisease();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      diseaseList = diseaseModel.getDisease();
    });
  }

  @override
  void initState() {
    super.initState();
    diseaseList = diseaseModel.getDisease();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Penyakit'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: diseaseList,
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
                                    builder: (context) => DiseaseEdit(
                                          id: snapshot.data[index]['id'],
                                          name: snapshot.data[index]['name'] ??
                                              "",
                                          definition: snapshot.data[index]
                                                  ['definition'] ??
                                              "",
                                          cause: snapshot.data[index]
                                                  ['cause'] ??
                                              "",
                                          therapy: snapshot.data[index]
                                                  ['therapy'] ??
                                              "",
                                        )),
                              ).then((value) {
                                if (value == true) {
                                  _pullRefresh();
                                }
                              });
                            },
                            title: Text(snapshot.data[index]['name']),
                            leading: const Icon(Icons.data_saver_on_outlined),
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
            MaterialPageRoute(builder: (context) => const DiseaseCreate()),
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
