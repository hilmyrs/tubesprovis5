import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailPortofolio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MyInvest extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  MyInvest({required this.data, required this.type, required this.data_dompet});

  @override
  State<MyInvest> createState() => _MyInvestState();
}

class ModalUsaha {
  // Jumlah dana yang terkumpul
  final String imageUrl;
  final int id_pinjaman;
  final int id_peminjam;
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
    required this.id_pinjaman,
    required this.id_peminjam,
    required this.pemilik,
    required this.totalPendanaan,
    required this.bagiHasil,
    required this.status,
    required this.lokasi,
    required this.lamaTenor,
    required this.deskripsi,
  });
}

class _MyInvestState extends State<MyInvest> {
  late Future<List<ModalUsaha>> modalUsahaList;
  late Future<Map<String, dynamic>> assetData;

  Future<List<ModalUsaha>> getPeminjaman(String id) async {
    final hasil =
        await http.get(Uri.parse('http://127.0.0.1:8000/get_all_pinjaman'));
    if (hasil.statusCode == 200) {
      final jsonData = jsonDecode(hasil.body);
      List<ModalUsaha> newDataList = [];
      for (var item in jsonData['data']) {
        // Membuat objek ModalUsaha dari item JSON
        ModalUsaha modalUsaha = ModalUsaha(
          imageUrl:
              "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
          nama: item['nama_pinjaman'],
          id_pinjaman: item['id_pinjaman'],
          id_peminjam: item['id_peminjam'],
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

  @override
  void initState() {
    super.initState();
    refreshUserData();
  }

  void refreshUserData() {
    setState(() {
      assetData = getAsset(widget.data, widget.type);
      modalUsahaList = getPeminjaman(widget.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                                        'Portofolio',
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
                                              vertical: 20, horizontal: 50),
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
                                          width: 340,
                                          height: 110,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    'Total Aset',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                    textAlign: TextAlign.left,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Rp. " +
                                                        numberFormat.format(
                                                            asset!["data"]
                                                                ["asset"]),
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Total Profit : ',
                                                    style: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Total Profit : Rp. " +
                                                        numberFormat.format(
                                                            asset["data"]
                                                                ["profit"]),
                                                    style: TextStyle(
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
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
                                                itemCount:
                                                    listPeminjaman.length,
                                                itemBuilder: (context, index) {
                                                  ModalUsaha modalUsaha =
                                                      listPeminjaman[index];
                                                  return GestureDetector(
                                                      onTap: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder: (context) =>
                                                                DetailPortofolio2(
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
                                                                  EdgeInsets
                                                                      .all(10),
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
                                                                color: Colors
                                                                    .white,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .black
                                                                        .withOpacity(
                                                                            0.5),
                                                                    spreadRadius:
                                                                        5,
                                                                    blurRadius:
                                                                        7,
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
                                                                            modalUsaha.imageUrl),
                                                                  ),
                                                                  Flexible(
                                                                    child:
                                                                        Container(
                                                                      margin: EdgeInsets.only(
                                                                          left:
                                                                              10),
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              5),
                                                                      child:
                                                                          Column(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Modal Usaha " +
                                                                                modalUsaha.nama,
                                                                            style:
                                                                                TextStyle(
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "Total Pendanaan : Rp. " +
                                                                                numberFormat.format(modalUsaha.totalPendanaan),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            "Bagi Hasil : " +
                                                                                modalUsaha.bagiHasil.toString() +
                                                                                "%",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          Text(
                                                                            modalUsaha.status,
                                                                            style:
                                                                                TextStyle(
                                                                              color: modalUsaha.status == "Selesai" ? Colors.blue : Colors.green,
                                                                              fontSize: 12,
                                                                            ),
                                                                          ),
                                                                          if (modalUsaha.status ==
                                                                              "Selesai")
                                                                            OutlinedButton(
                                                                              onPressed: () {
                                                                                // Tambahkan logika untuk aksi tombol "Beri Rating" di sini
                                                                              },
                                                                              style: OutlinedButton.styleFrom(
                                                                                side: BorderSide(
                                                                                  color: Colors.black,
                                                                                ),
                                                                                minimumSize: Size(30, 20),
                                                                              ),
                                                                              child: Text(
                                                                                "",
                                                                                style: TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 10),
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
                });
          }
        });
  }
}
