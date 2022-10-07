import 'package:flutter/material.dart';
import 'package:ispa_app/models/about_disease_model.dart';
import 'package:ispa_app/pages/admin/about_diseases/about_disease_create.dart';
import 'package:ispa_app/pages/admin/about_diseases/about_disease_edit.dart';

class AboutDiseaseView extends StatefulWidget {
  const AboutDiseaseView({super.key});

  @override
  State<AboutDiseaseView> createState() => _AboutDiseaseViewState();
}

class _AboutDiseaseViewState extends State<AboutDiseaseView> {
  late Future<List<dynamic>?> aboutDiseaseList;
  AboutDiseaseModel aboutDiseaseModel = AboutDiseaseModel();
  Future<void> _pullRefresh() async {
    setState(() {
      aboutDiseaseList = aboutDiseaseModel.getAboutDisease();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      aboutDiseaseList = aboutDiseaseModel.getAboutDisease();
    });
  }

  @override
  void initState() {
    super.initState();
    aboutDiseaseList = aboutDiseaseModel.getAboutDisease();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tentang ISPA'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: aboutDiseaseList,
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
                                    builder: (context) => AboutDiseaseEdit(
                                          id: snapshot.data[index]['id'],
                                          title: snapshot.data[index]['title'],
                                          description: snapshot.data[index]
                                              ['description'],
                                        )),
                              ).then((value) {
                                if (value == true) {
                                  _pullRefresh();
                                }
                              });
                            },
                            title: Text(snapshot.data[index]['title']),
                            leading: const Icon(Icons.edit),
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
            MaterialPageRoute(builder: (context) => const AboutDiseaseCreate()),
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
