import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:12345/predict'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int Akurasi;
  final String Prediksi;
  final int getaran;
  final int kecepatan;
  final int tinggi_laut_dermaga;
  final int tinggi_laut_tengah;

  Album({
    required this.Akurasi,
    required this.Prediksi,
    required this.getaran,
    required this.kecepatan,
    required this.tinggi_laut_dermaga,
    required this.tinggi_laut_tengah,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      Akurasi: json['Akurasi'],
      Prediksi: json['Prediksi'],
      getaran: json['getaran'],
      kecepatan: json['kecepatan'],
      tinggi_laut_dermaga: json['tinggi_laut_dermaga'],
      tinggi_laut_tengah: json['tinggi_laut_tengah'],
    );
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

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
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return display(snapshot.data!);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
  Widget display(Album prediksi)=>
      Column(children: [
        Text('Akurasi: ${prediksi.Akurasi}'),
        Text('Prediksi: ${prediksi.Prediksi}'),
        Text('getaran: ${prediksi.getaran}'),
        Text('kecepatan: ${prediksi.kecepatan}'),
        Text('tinggi laut dermaga: ${prediksi.tinggi_laut_dermaga}'),
        Text('tinggi laut tengah: ${prediksi.tinggi_laut_tengah}'),
      ]
      );
}