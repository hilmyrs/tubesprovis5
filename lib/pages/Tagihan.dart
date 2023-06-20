import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:tubes/pages/Home.dart';
import 'package:tubes/pages/MenuFooter2.dart';
import 'package:tubes/pages/Peminjaman.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class Tagihan extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;
  final int jumlah;

  Tagihan(
      {required this.data,
      required this.type,
      required this.data_dompet,
      required this.jumlah});

  @override
  _TagihanState createState() => _TagihanState();
}

class _TagihanState extends State<Tagihan> {
  bool isSaldoSelected = false;

  late Future<Map<String, dynamic>> userData;

  /***
     * 
     * get userdata
     * 
     * 
     */

  Future<Map<String, dynamic>> getUserData(String id, String type) async {
    if (type == 'investor') {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_investor/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to fetch investor data');
      }
    } else {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_borrower/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print("borrower");
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

  Future<void> addTransaction(int id_jenis, int id_dompet, String nama,
      int jml_transaksi, String tanggal, String keterangan) async {
    var url = Uri.parse('http://127.0.0.1:8000/add_transaction');
    var data = {
      "id_jenis": id_jenis,
      "id_dompet": id_dompet,
      "nama_transaksi": nama,
      "jml_transaksi": jml_transaksi,
      "tanggal": tanggal,
      "keterangan": keterangan,
    };
    var response = await http.post(
      url,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
  }

  Future<void> updateSaldo(int id, int saldo, int jml,
      Map<String, dynamic> dataUser, String pembayaran, String dompet) async {
    var url = Uri.parse('http://127.0.0.1:8000/update_saldo/');
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({"id_dompet": id, "update_saldo": saldo});

    var response = await http.put(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      DateTime now = DateTime.now();
      String currentDate = DateFormat('yyyy-MM-dd').format(now);
      String keterangan = "";
      if (pembayaran == 'Bank') {
        keterangan = "Transfer ke Bank";
      } else {
        keterangan = "Bayar Tagihan dari $dompet";
      }
      addTransaction(1, dataUser['data']['id_dompet'], "Tarik Dana", jml,
          currentDate, keterangan);
      if (widget.type == "borrower") {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Success'),
              content: Text('Pembayaran Tagihan Berhasil Dilakukan !'),
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
      }
    } else {
      print('Failed to update data. Error code: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    userData = getUserData(widget.data, widget.type);
  }

  //double saldo = 1500000; // Contoh nilai saldo dari database
  int tagihan = 1500000; // contoh nilai tagihan

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return FutureBuilder<Map<String, dynamic>>(
        future: userData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final user = snapshot.data;
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
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color:
                              Color.fromRGBO(142, 220, 179, 1), // Warna border
                          width: 1, // Ketebalan border
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(
                                0.2), // Warna bayangan (black) dengan opasitas 0.2
                            spreadRadius: 2, // Jarak penyebaran bayangan
                            blurRadius: 4, // Jarak blur bayangan
                            offset: Offset(0,
                                2), // Posisi offset bayangan (horizontal, vertical)
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          //Row untuk title icon
                          Row(children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "Total Tagihan",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Rp. " +
                                              numberFormat
                                                  .format(widget.jumlah),
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                  ],
                                ),
                              ],
                            ),

                            //SizedBox(width: 4),
                          ]),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListTile(
                      title: Padding(
                        padding: EdgeInsets.only(left: 20, top: 5),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Saldo",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                color: Colors.black,
                                size: 40.0,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                "Rp. " +
                                    numberFormat.format(user!["data"]["saldo"]),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: user["data"]["saldo"] - tagihan >= 0
                                        ? Colors.green
                                        : Colors.red),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    GestureDetector(
                      onTap: () {
                        updateSaldo(
                            user["data"]["id_dompet"],
                            (user["data"]["saldo"] - widget.jumlah),
                            tagihan,
                            user,
                            "Dompet",
                            "Dompet");
                        print('Container di-tap');
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        decoration: BoxDecoration(
                            color: Color(0xff3e4784),
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                          child: Text(
                            "Bayar",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        });
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
