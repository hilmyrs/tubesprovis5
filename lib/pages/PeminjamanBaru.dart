import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/pages/Peminjaman.dart';

class PeminjamanBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 197, 177),
        centerTitle: true,
        title: Text(
          'Peminjaman Baru',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Judul Peminjaman',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Target Pendanaan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Bagi Hasil %',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Lama Tenor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Keterangan Peminjaman',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Lokasi',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Upload Foto IUMK (maks 2 MB)',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
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
              child: Text('Upload Foto'),
            ),
            SizedBox(height: 20),
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
              child: Text('Buat'),
            ),
          ],
        ),
      ),
    );
  }
}
