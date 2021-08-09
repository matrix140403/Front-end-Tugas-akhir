import 'dart:async';
import 'package:flutter/material.dart';
import 'package:seluler5/APIHelper.dart';
import 'package:seluler5/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: buildDisplay(),
        ),
      ),
    );
  }

  FutureBuilder<Album> buildDisplay() {
    new Timer.periodic(Duration(seconds: 2), (Timer t) => setState(() {}));
    return FutureBuilder<Album>(
      future: fetchAlbum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return display(snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Widget display(Album prediksi) => Column(children: [
        Text('Akurasi: ${prediksi.Akurasi}'),
        Text('Prediksi: ${prediksi.Prediksi}'),
        Text('getaran: ${prediksi.getaran}'),
        Text('kecepatan: ${prediksi.kecepatan}'),
        Text('tinggi laut dermaga: ${prediksi.tinggi_laut_dermaga}'),
        Text('tinggi laut tengah: ${prediksi.tinggi_laut_tengah}'),
      ]);
}
