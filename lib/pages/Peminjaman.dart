import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class Peminjaman extends StatefulWidget {
  @override
  State<Peminjaman> createState() => _PeminjamanState();
}

class _PeminjamanState extends State<Peminjaman> {
  List<String> peminjamanSebelumnya = [
    'Peminjaman 1',
    'Peminjaman 2',
    'Peminjaman 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 197, 177),
        centerTitle: true,
        title: Text(
          'Peminjaman',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Tagihan Anda',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin dilakukan saat tombol "Bayar Tagihan" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                      255,
                      26,
                      168,
                      158,
                    ), // Warna latar belakang button
                    onPrimary: Colors.white, // Warna teks pada button
                  ),
                  child: Text('Bayar Tagihan'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Rp. 1.500.000',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Bayar Sebelum 8 April 2023 11:59',
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: Colors.grey),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Aksi yang ingin dilakukan saat tombol "Ajuan Peminjaman" ditekan
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(
                  255,
                  26,
                  168,
                  158,
                ), // Warna latar belakang button
                onPrimary: Colors.white, // Warna teks pada button
              ),
              child: Text('Ajuan Peminjaman'),
            ),
            SizedBox(height: 20),
            Text(
              'Riwayat Peminjaman',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: peminjamanSebelumnya.length,
                itemBuilder: (context, index) {
                  String peminjaman = peminjamanSebelumnya[index];
                  return ListTile(
                    title: Text(peminjaman),
                    onTap: () {
                      // Aksi yang ingin dilakukan saat salah satu peminjaman sebelumnya ditekan
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
