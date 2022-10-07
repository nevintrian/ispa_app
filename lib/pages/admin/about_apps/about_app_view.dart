import 'package:flutter/material.dart';
import 'package:ispa_app/models/about_app_model.dart';
import 'package:ispa_app/pages/admin/about_apps/about_app_create.dart';
import 'package:ispa_app/pages/admin/about_apps/about_app_edit.dart';

class AboutAppView extends StatefulWidget {
  const AboutAppView({super.key});

  @override
  State<AboutAppView> createState() => _AboutAppViewState();
}

class _AboutAppViewState extends State<AboutAppView> {
  late Future<List<dynamic>?> aboutAppList;
  AboutAppModel aboutAppModel = AboutAppModel();
  Future<void> _pullRefresh() async {
    setState(() {
      aboutAppList = aboutAppModel.getAboutApp();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      aboutAppList = aboutAppModel.getAboutApp();
    });
  }

  @override
  void initState() {
    super.initState();
    aboutAppList = aboutAppModel.getAboutApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Tentang Aplikasi'),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SizedBox(
        child: FutureBuilder<List<dynamic>?>(
            future: aboutAppList,
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
                                    builder: (context) => AboutAppEdit(
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
            MaterialPageRoute(builder: (context) => const AboutAppCreate()),
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
