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
