import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pertemuan12-13/Helper/database_helper.dart';
import 'package:flutter_application_1/Pertemuan12-13/Model/mobil.dart';
import 'package:flutter_application_1/Pertemuan12-13/home.dart';

class UbahMobil extends StatefulWidget {
  final int? id;
  final String? nama;
  final String? warna;
  final String? tahun;
  final String? transmisi;

  const UbahMobil(
      {Key? key, this.id, this.nama, this.warna, this.tahun, this.transmisi})
      : super(key: key);

  @override
  State<UbahMobil> createState() => _UbahMobilState();
}

class _UbahMobilState extends State<UbahMobil> {
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecWarna = TextEditingController();
  TextEditingController tecTahun = TextEditingController();
  TextEditingController tecTransmisi = TextEditingController();

  @override
  void initState() {
    tecNama.text = widget.nama!;
    tecWarna.text = widget.warna!;
    tecTahun.text = widget.tahun!;
    tecTransmisi.text = widget.transmisi!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Data Mobil'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecNama,
              decoration: const InputDecoration(labelText: 'Nama Mobil'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecWarna,
              decoration: const InputDecoration(labelText: 'Warna Mobil'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecTahun,
              decoration: const InputDecoration(labelText: 'Tahun Mobil'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecTransmisi,
              decoration: const InputDecoration(labelText: 'Transmisi Mobil'),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final result = await DbHelper.instance.updateMbl(Mobil(
                    id: widget.id,
                    nama: tecNama.text,
                    warna: tecWarna.text,
                    tahun: tecTahun.text,
                    transmisi: tecTransmisi.text));
                if (result > 0) {
                  navigator.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => Home()),
                      (route) => false);
                }
              },
              child: const Text('Simpan Data'),
            ),
          ),
        ],
      ),
    );
  }
}