class Mobil {
  int? id;
  String? nama;
  String? warna;
  String? tahun;
  String? transmisi;

  Mobil({
    this.id,
    required this.nama,
    required this.warna,
    required this.tahun,
    required this.transmisi,
  });

  // Factory method untuk membuat objek Mobil dari JSON
  factory Mobil.fromMap(Map<String, dynamic> json) => Mobil(
        id: json['id'],
        nama: json['nama'],
        warna: json['warna'],
        tahun: json['tahun'],
        transmisi: json['transmisi'],
      );

  // Method untuk mengubah objek Mobil ke format JSON
  Map<String, dynamic> toMap() => {
        'id': id,
        'nama': nama,
        'warna': warna,
        'tahun': tahun,
        'transmisi': transmisi,
      };
}
