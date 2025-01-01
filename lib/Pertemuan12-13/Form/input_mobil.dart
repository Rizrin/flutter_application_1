import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pertemuan12-13/Helper/database_helper.dart';
import 'package:flutter_application_1/Pertemuan12-13/Model/mobil.dart';
import 'package:flutter_application_1/Pertemuan12-13/home.dart';

class InputMobil extends StatefulWidget {
  const InputMobil({super.key});

  @override
  State<InputMobil> createState() => _InputMobilState();
}

class _InputMobilState extends State<InputMobil> {
  TextEditingController tecNama = TextEditingController();
  TextEditingController tecWarna = TextEditingController();
  TextEditingController tecTahun = TextEditingController();
  TextEditingController tecTransmisi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Data Mobil'),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecNama,
              decoration: const InputDecoration(label: Text('Nama Mobil')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecWarna,
              decoration: const InputDecoration(label: Text('Warna Mobil')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecTahun,
              decoration: const InputDecoration(label: Text('Tahun Mobil')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: tecTransmisi,
              decoration: const InputDecoration(label: Text('Transmisi Mobil')),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                final result = await DbHelper.instance.addMbl(
                  Mobil(
                    nama: tecNama.text,
                    warna: tecWarna.text,
                    tahun: tecTahun.text,
                    transmisi: tecTransmisi.text,
                  ),
                );
                if (result != 0) {
                  navigator.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const Home()),
                    (route) => false,
                  );
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
