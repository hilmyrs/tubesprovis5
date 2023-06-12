import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'Peminjaman.dart';

// class PeminjamanBaru extends StatefulWidget {
//   @override
//   _PeminjamanBaruState createState() => _PeminjamanBaruState();
// }

// class _PeminjamanBaruState extends State<PeminjamanBaru> {
//   late File fotoIUMK;
//   String judulPeminjaman = '';
//   String targetPendanaan = '';
//   String bagiHasil = '';
//   String lamaTenor = '';
//   String keteranganPeminjaman = '';
//   String lokasi = '';

//   Future<void> _pickImage() async {
//     final pickedImage =
//         await ImagePicker().getImage(source: ImageSource.gallery);
//     if (pickedImage != null) {
//       setState(() {
//         fotoIUMK = File(pickedImage.path);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Ajuan Peminjaman'),
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Judul Peminjaman',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   judulPeminjaman = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Target Pendanaan',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   targetPendanaan = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Bagi Hasil %',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   bagiHasil = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Lama Tenor',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   lamaTenor = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Keterangan Peminjaman',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   keteranganPeminjaman = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Lokasi',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   lokasi = value;
//                 });
//               },
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Foto IUMK',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             // SizedBox(height: 10),
//             // ElevatedButton(
//             //   onPressed: _pickImage,
//             //   child: Text('Pilih Foto'),
//             // ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Aksi yang ingin dilakukan saat tombol "Buat" ditekan
//               },
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.blue,
//                 onPrimary: Colors.white,
//               ),
//               child: Text('Buat'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class PeminjamanBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajuan Peminjaman'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 64, 197, 177),
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
