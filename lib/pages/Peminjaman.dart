import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tubes/pages/DetailPeminjaman.dart';
import 'package:tubes/pages/Tagihan.dart';
import 'package:tubes/pages/PeminjamanBaru.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class Peminjaman extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  Peminjaman(
      {required this.data, required this.type, required this.data_dompet});

  @override
  State<Peminjaman> createState() => _PeminjamanState();
}

class ModalUsaha {
  final String imageUrl;
  final String nama;
  final String pemilik;
  final int totalPendanaan;
  final int bagiHasil;
  final String status;
  final String lokasi;
  final int lamaTenor;
  final String deskripsi;

  ModalUsaha({
    required this.imageUrl,
    required this.nama,
    required this.pemilik,
    required this.totalPendanaan,
    required this.bagiHasil,
    required this.status,
    required this.lokasi,
    required this.lamaTenor,
    required this.deskripsi,
  });
}

class _PeminjamanState extends State<Peminjaman> {
  late Future<List<ModalUsaha>> modalUsahaList;
  late Future<Map<String, dynamic>> assetData;

  Future<Map<String, dynamic>> getAsset(String id, String type) async {
    if (type == 'investor') {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_asset/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to fetch investor data');
      }
    } else {
      final response =
          await http.get(Uri.parse('http://127.0.0.1:8000/get_angsuran/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

  Future<List<ModalUsaha>> getPeminjaman(String id) async {
    final hasil =
        await http.get(Uri.parse('http://127.0.0.1:8000/get_pinjaman/$id'));
    if (hasil.statusCode == 200) {
      final jsonData = jsonDecode(hasil.body);
      List<ModalUsaha> newDataList = [];
      for (var item in jsonData['data']) {
        // Membuat objek ModalUsaha dari item JSON
        ModalUsaha modalUsaha = ModalUsaha(
          imageUrl:
              "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          nama: item['nama_pinjaman'],
          pemilik: item['nama_peminjam'],
          totalPendanaan: item['jumlah'],
          bagiHasil: item['bagi_hasil'],
          status: item['status_pinjaman'],
          lokasi: item['lokasi'],
          lamaTenor: item['lama_tenor'],
          deskripsi: item['keterangan'],
          // tambahkan atribut lain sesuai dengan struktur JSON
        );
        newDataList.add(modalUsaha);
      }

      return newDataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    modalUsahaList = getPeminjaman(widget.data);
    assetData = getAsset(widget.data, widget.type);
  }

  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return FutureBuilder<List<ModalUsaha>>(
        future: modalUsahaList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            final listPeminjaman = snapshot.data!;
            final user = snapshot.data;
            var size = MediaQuery.of(context).size;
            return FutureBuilder<Map<String, dynamic>>(
              future: assetData,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final asset = snapshot.data;
                  return SafeArea(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Peminjaman',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Stack(
                            children: [
                              Positioned.fill(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 50),
                                  margin: EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(142, 220, 179, 1),
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: Color.fromRGBO(
                                          142, 220, 179, 1), // Warna border
                                      width: 1, // Ketebalan border
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(
                                            0.2), // Warna bayangan (black) dengan opasitas 0.2
                                        spreadRadius:
                                            2, // Jarak penyebaran bayangan
                                        blurRadius: 4, // Jarak blur bayangan
                                        offset: Offset(0,
                                            2), // Posisi offset bayangan (horizontal, vertical)
                                      ),
                                    ],
                                  ),
                                  width: double.infinity,
                                  //height: 800,
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 20, horizontal: 30),
                                        margin: EdgeInsets.only(top: 7),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Color.fromRGBO(175, 175,
                                                  175, 1), // Warna border
                                              width: 0.5, // Ketebalan border
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 2.0,
                                                  offset: Offset(0, 5))
                                            ]
                                            // Menggunakan BoxConstraints untuk mengubah lebar
                                            ),
                                        constraints: BoxConstraints(
                                            maxWidth: 800), // Lebar maksimum
                                        width: 380,
                                        height: 125,
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Tagihan Anda',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.left,
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Tagihan(
                                                          data: widget.data,
                                                          type: widget.type,
                                                          data_dompet: widget
                                                              .data_dompet,
                                                          jumlah: asset!["data"]
                                                              ["jumlah"],
                                                        ),
                                                      ),
                                                    ); // Aksi yang ingin dilakukan saat tombol "Bayar Tagihan" ditekan
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Color.fromARGB(
                                                      255,
                                                      26,
                                                      168,
                                                      158,
                                                    ), // Warna latar belakang button
                                                    onPrimary: Colors
                                                        .white, // Warna teks pada button
                                                  ),
                                                  child: Text('Bayar Tagihan'),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. " +
                                                      numberFormat.format(
                                                          asset!["data"]
                                                              ["jumlah"]),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 20),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      PeminjamanBaru(
                                                    data: widget.data,
                                                    data_dompet:
                                                        widget.data_dompet,
                                                    type: widget.type,
                                                  ),
                                                ),
                                              ); // Aksi yang ingin dilakukan saat tombol "Ajuan Peminjaman" ditekan
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color.fromARGB(
                                                255,
                                                26,
                                                168,
                                                158,
                                              ), // Warna latar belakang button
                                              onPrimary: Colors
                                                  .white, // Warna teks pada button
                                            ),
                                            child: Text('Ajuan Peminjaman'),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 10),
                                            ListView.builder(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 20),
                                              shrinkWrap: true,
                                              itemCount: listPeminjaman.length,
                                              itemBuilder: (context, index) {
                                                ModalUsaha modalUsaha =
                                                    listPeminjaman[index];
                                                return GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              DetailPeminjaman(
                                                                  modalUsaha:
                                                                      modalUsaha),
                                                        ),
                                                      );
                                                    },
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            decoration:
                                                                BoxDecoration(
                                                              border:
                                                                  Border.all(
                                                                color: Colors
                                                                    .black,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.5),
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 7,
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // mengatur posisi bayangan (x, y)
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                CircleAvatar(
                                                                  radius: 30,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                          modalUsaha
                                                                              .imageUrl),
                                                                ),
                                                                Flexible(
                                                                  child:
                                                                      Container(
                                                                    margin: EdgeInsets
                                                                        .only(
                                                                            left:
                                                                                10),
                                                                    padding:
                                                                        EdgeInsets
                                                                            .all(5),
                                                                    child:
                                                                        Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Modal Usaha " +
                                                                              modalUsaha.nama,
                                                                          style:
                                                                              TextStyle(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontSize:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "Total Pendanaan : Rp." +
                                                                              numberFormat.format(modalUsaha.totalPendanaan).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          "Bagi Hasil : " +
                                                                              modalUsaha.bagiHasil.toString() +
                                                                              "%",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          modalUsaha
                                                                              .status,
                                                                          style:
                                                                              TextStyle(
                                                                            color: modalUsaha.status == "Selesai"
                                                                                ? Colors.blue
                                                                                : Colors.green,
                                                                            fontSize:
                                                                                12,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 10),
                                                        ],
                                                      ),
                                                    ));
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            );
          }
        });
  }
}
