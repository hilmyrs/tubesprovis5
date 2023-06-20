import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/pages/Peminjaman.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:tubes/pages/MenuFooter2.dart';

class PeminjamanBaru extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  PeminjamanBaru(
      {required this.data, required this.type, required this.data_dompet});

  @override
  State<PeminjamanBaru> createState() => _PeminjamanBaruState();
}

class _PeminjamanBaruState extends State<PeminjamanBaru> {
  TextEditingController namaPinjaman = TextEditingController();
  TextEditingController jumlahPinjaman = TextEditingController();
  TextEditingController lamaTenor = TextEditingController();
  TextEditingController bagiHasil = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController keterangan = TextEditingController();

  Future<void> tambahPeminjaman(
    int id_peminjam,
    String nama_pinjaman,
    int jumlah_pinjaman,
    int lama_tenor,
    int bagi_hasil,
    int sisa_angsuran,
    String status,
    String keterangan,
    BuildContext context,
  ) async {
    var url = Uri.parse('http://127.0.0.1:8000/tambah_pinjaman');
    var data = {
      "id_peminjam": id_peminjam,
      "nama_pinjaman": nama_pinjaman,
      "jumlah_pinjaman": jumlah_pinjaman,
      "lama_tenor": lama_tenor,
      "bagi_hasil": bagi_hasil,
      "sisa_angsuran": sisa_angsuran,
      "status": status,
      "keterangan": keterangan,
    };
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      // Mengajukan Peminjaman berhasil
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success'),
            content: Text('Anda telah berhasil Mengajukan Peminjaman !'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => HomePage2(
                                data: widget.data,
                                data_dompet: widget.data_dompet,
                                type: widget.type,
                              )));
                },
                child: Text('Close'),
              ),
            ],
          );
        },
      );
    } else {
      // Mengajukan Peminjaman gagal
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal'),
            content: Text('Failed to register. Please try again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

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
              controller: namaPinjaman,
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
              controller: jumlahPinjaman,
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
              controller: bagiHasil,
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
              controller: lamaTenor,
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
              controller: keterangan,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            // SizedBox(height: 20),
            // Text(
            //   'Upload Foto IUMK (maks 2 MB)',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 18,
            //   ),
            // ),
            // SizedBox(height: 10),
            // ElevatedButton(
            //   onPressed: () {
            //     // Aksi yang ingin dilakukan saat tombol "Bayar Tagihan" ditekan
            //   },
            //   style: ElevatedButton.styleFrom(
            //     primary: Color.fromARGB(
            //       255,
            //       26,
            //       168,
            //       158,
            //     ), // Warna latar belakang button
            //     onPrimary: Colors.white, // Warna teks pada button
            //   ),
            //   child: Text('Upload Foto'),
            // ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                tambahPeminjaman(
                    int.parse(widget.data),
                    namaPinjaman.text,
                    int.parse(jumlahPinjaman.text),
                    int.parse(lamaTenor.text),
                    int.parse(bagiHasil.text),
                    int.parse(lamaTenor.text),
                    "Berlangsung",
                    keterangan.text,
                    context);
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
