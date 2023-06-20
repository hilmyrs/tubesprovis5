import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/pages/Peminjaman.dart';

class Tagihan extends StatefulWidget {
  @override
  _TagihanState createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  bool isSaldoSelected = false;
  double saldo = 1500000; // Contoh nilai saldo dari database

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 197, 177),
        centerTitle: true,
        title: Text(
          'Bayar Tagihan',
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
            Text(
              'Total Tagihan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rp. 1.500.000',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Batas Pembayaran',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            Text(
              '8 April 2023 11:59',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Opsi Pembayaran',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(
                  255,
                  26,
                  168,
                  158,
                ), // Warna latar belakang avatar
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white, // Warna ikon di dalam avatar
                ),
              ),
              title: Text(
                'Saldo: Rp. $saldo', // Mengganti teks statis dengan nilai saldo
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              onTap: () {
                // Aksi yang ingin dilakukan saat opsi pembayaran "Saldo" dipilih
              },
            ),
            SizedBox(height: 20),
            Center(
              child: Container(
                width: double
                    .infinity, // Lebar tombol mengisi seluruh ruang tersedia
                child: ElevatedButton(
                  onPressed: () {
                    // Aksi yang ingin dilakukan saat tombol "Lanjut" ditekan
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(
                      255,
                      26,
                      168,
                      158,
                    ), // Warna latar belakang button
                    onPrimary: Colors.white, // Warna teks pada button
                    padding: EdgeInsets.symmetric(
                        vertical:
                            16), // Padding vertical untuk menambah tinggi tombol
                  ),
                  child: Text(
                    'Lanjut',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// class Tagihan extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Bayar Tagihan'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Total Tagihan',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               'Rp. 1.500.000',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Batas Pembayaran',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//               '8 April 2023 11:59',
//               style: TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Bayar dengan',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(height: 10),
//             ListTile(
//               leading: Icon(Icons.account_balance_wallet),
//               title: Text('Saldo'),
//               onTap: () {
//                 // Aksi yang ingin dilakukan saat opsi pembayaran "Saldo" dipilih
//               },
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Aksi yang ingin dilakukan saat tombol "Lanjut" ditekan
//               },
//               child: Text('Lanjut'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
