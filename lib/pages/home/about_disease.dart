import 'package:flutter/material.dart';
import 'package:ispa_app/models/about_disease_model.dart';

class AboutDisease extends StatefulWidget {
  const AboutDisease({super.key});

  @override
  State<AboutDisease> createState() => _AboutDiseaseState();
}

class _AboutDiseaseState extends State<AboutDisease> {
  late Future<List<dynamic>?> aboutDiseaseList;
  AboutDiseaseModel aboutDiseaseModel = AboutDiseaseModel();

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
        title: const Text('Tentang ISPA'),
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
