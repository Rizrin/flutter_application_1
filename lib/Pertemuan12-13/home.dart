import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pertemuan12-13/Form/input_mobil.dart';
import 'package:flutter_application_1/Pertemuan12-13/Helper/database_helper.dart';
import 'package:flutter_application_1/Pertemuan12-13/Model/mobil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DAFTAR MOBIL'),
      ),
      body: FutureBuilder<List<Mobil>>(
  future: DbHelper.instance.getAllMbl(),
  builder: (BuildContext context, AsyncSnapshot<List<Mobil>> snapshot) {
    if (!snapshot.hasData) {
      return Container(
        alignment: Alignment.center,
        child: const Text('data loading,,,,,'),
      );
    }
    return snapshot.data!.isEmpty
        ? Container(
            alignment: Alignment.center,
            child: const Text('data kosong!'),
          )
        : ListView(
            children: snapshot.data!.map(
              (mobil) {
                return Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.all(10),
                  color: Colors.white70,
                  child: ListTile(
                    title: Text(mobil.nama!),
                  ),
                );
              },
            ).toList(),
          );
  },
),
  floatingActionButton: FloatingActionButton(
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const InputMobil()));
    },
    child: const Icon(Icons.add),
  ),
    );
  }
}
