import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'DetailPortofolio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class MyInvest extends StatefulWidget {
  const MyInvest({super.key});

  @override
  State<MyInvest> createState() => _MyInvestState();
}

class ModalUsaha {
  final String imageUrl;
  final String nama;
  final String pemilik;
  final String totalPendanaan;
  final String bagiHasil;
  final String status;
  final String lokasi;
  final String lamaTenor;
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

class _MyInvestState extends State<MyInvest> {
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
  List<ModalUsaha> modalUsahaList = [
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Bubur Bu Kurnia",
      pemilik: "Ibu Kurnia",
      totalPendanaan: "Rp 2.500.000",
      bagiHasil: "12%",
      status: "Sedang Berlangsung",
      lokasi: "Jawa Barat",
      lamaTenor: "10 Bulan",
      deskripsi:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Warung Pak Kardio",
      pemilik: "Bapak Kardio",
      totalPendanaan: "Rp 1.000.000",
      bagiHasil: "10%",
      status: "Selesai",
      lokasi: "Kalimantan Barat",
      lamaTenor: "5 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Petani Bu Asih",
      pemilik: "Ibu Asih",
      totalPendanaan: "Rp 1.500.000",
      bagiHasil: "8%",
      status: "Sedang Berlangsung",
      lokasi: "Bali",
      lamaTenor: "12 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    ),
    ModalUsaha(
      imageUrl:
          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
      nama: "Beras Bu Fitri",
      pemilik: "Ibu Fitri",
      totalPendanaan: "Rp 5.500.000",
      bagiHasil: "20%",
      status: "Selesai",
      lokasi: "Sulawesi Utara",
      lamaTenor: "15 Bulan",
      deskripsi: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    );

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    margin: EdgeInsets.only(top: 50),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(142, 220, 179, 1),
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Color.fromRGBO(142, 220, 179, 1), // Warna border
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
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: Color.fromRGBO(
                                    175, 175, 175, 1), // Warna border
                                width: 0.5, // Ketebalan border
                              ),
                              boxShadow: [
                                BoxShadow(blurRadius: 2.0, offset: Offset(0, 5))
                              ]
                              // Menggunakan BoxConstraints untuk mengubah lebar
                              ),
                          constraints:
                              BoxConstraints(maxWidth: 800), // Lebar maksimum
                          width: 340,
                          height: 110,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Total Aset',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Rp 1,000,000,000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
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
                                    'Rp 1.200.000 (^10%)',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
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
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                shrinkWrap: true,
                                itemCount: modalUsahaList.length,
                                itemBuilder: (context, index) {
                                  ModalUsaha modalUsaha = modalUsahaList[index];
                                  return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPortofolio2(
                                                    modalUsaha: modalUsaha),
                                          ),
                                        );
                                      },
                                      child: Container(
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Colors.white,
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                    spreadRadius: 5,
                                                    blurRadius: 7,
                                                    offset: Offset(0,
                                                        3), // mengatur posisi bayangan (x, y)
                                                  ),
                                                ],
                                              ),
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage:
                                                        NetworkImage(modalUsaha
                                                            .imageUrl),
                                                  ),
                                                  Flexible(
                                                    child: Container(
                                                      margin: EdgeInsets.only(
                                                          left: 10),
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Modal Usaha " +
                                                                modalUsaha.nama,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Total Pendanaan : " +
                                                                modalUsaha
                                                                    .totalPendanaan,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Text(
                                                            "Bagi Hasil : " +
                                                                modalUsaha
                                                                    .bagiHasil,
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          Text(
                                                            modalUsaha.status,
                                                            style: TextStyle(
                                                              color: modalUsaha
                                                                          .status ==
                                                                      "Selesai"
                                                                  ? Colors.blue
                                                                  : Colors
                                                                      .green,
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          if (modalUsaha
                                                                  .status ==
                                                              "Selesai")
                                                            OutlinedButton(
                                                              onPressed: () {
                                                                // Tambahkan logika untuk aksi tombol "Beri Rating" di sini
                                                              },
                                                              style:
                                                                  OutlinedButton
                                                                      .styleFrom(
                                                                side:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                minimumSize:
                                                                    Size(
                                                                        30, 20),
                                                              ),
                                                              child: Text(
                                                                "Beri Rating",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black,
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
}
