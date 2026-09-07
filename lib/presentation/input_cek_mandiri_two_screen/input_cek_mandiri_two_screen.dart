import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TabelScreen extends StatelessWidget {
  const TabelScreen({super.key});

  void main() {
    runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabelScreen(),
    ));
  }

  Stream<List<Map<String, dynamic>>> fetchData() {
    return FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return {
          'id': doc.id,
          'nama': data['nama'] ?? '',
          'nik': data['nik'] ?? '',
          'kabupaten': data['kabupaten'] ?? '',
          'kecamatan': data['kecamatan'] ?? '',
          'desa': data['desa'] ?? '',
          'puskesmas': data['puskesmas'] ?? '',
          'pendamping': data['pendamping'] ?? '',
          'nomer_pendamping': data['nomer_pendamping'] ?? '',
        };
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabel Firebase'),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(
                child: Text('Tidak ada data tersedia'),
              );
            }

            final data = snapshot.data!;

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nama')),
                  DataColumn(label: Text('NIK')),
                  DataColumn(label: Text('Kabupaten')),
                  DataColumn(label: Text('Kecamatan')),
                  DataColumn(label: Text('Desa')),
                  DataColumn(label: Text('Puskesmas')),
                  DataColumn(label: Text('Pendamping')),
                  DataColumn(label: Text('No Pendamping')),
                ],
                rows: data.map((row) {
                  return DataRow(cells: [
                    DataCell(Text(row['id'])),
                    DataCell(Text(row['nama'])),
                    DataCell(Text(row['nik'])),
                    DataCell(Text(row['kabupaten'])),
                    DataCell(Text(row['kecamatan'])),
                    DataCell(Text(row['desa'])),
                    DataCell(Text(row['puskesmas'])),
                    DataCell(Text(row['pendamping'])),
                    DataCell(Text(row['nomer_pendamping'])),
                  ]);
                }).toList(),
              ),
            );
          }),
    );
  }
}
