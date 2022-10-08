import 'package:flutter/material.dart';
import 'package:ispa_app/models/about_app_model.dart';

class AboutApp extends StatefulWidget {
  const AboutApp({super.key});

  @override
  State<AboutApp> createState() => _AboutAppState();
}

class _AboutAppState extends State<AboutApp> {
  late Future<List<dynamic>?> aboutAppList;
  AboutAppModel aboutAppModel = AboutAppModel();

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
        title: const Text('Tentang Aplikasi'),
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
                  return ListView.builder(
                      padding: const EdgeInsets.all(20),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot.data[index]['title'],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot.data[index]['description'],
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        );
                      });
                } else {
                  return const Center(child: Text('Tidak ditemukan data'));
                }
              }
            }),
      ),
    );
  }
}
