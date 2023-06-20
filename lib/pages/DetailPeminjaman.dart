import 'package:flutter/material.dart';
import 'Peminjaman.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class DetailPeminjaman extends StatefulWidget {
  final ModalUsaha modalUsaha;

  DetailPeminjaman({required this.modalUsaha});

  @override
  _DetailPeminjamanState createState() => _DetailPeminjamanState();
}

class _DetailPeminjamanState extends State<DetailPeminjaman> {
  @override
  Widget build(BuildContext context) {
    final numberFormat = NumberFormat('#,##0.00', 'en_US');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pendanaan',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true, // Menampilkan panah kembali
        iconTheme: IconThemeData(
          color: Colors.black,
        ), // Mengubah warna panah kembali menjadi hitam
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
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
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(
                                    0, 3), // mengatur posisi bayangan (x, y)
                              ),
                            ],
                          ),
                          width: 360,
                          height: 110,
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    NetworkImage(widget.modalUsaha.imageUrl),
                              ),
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Modal Usaha " +
                                              widget.modalUsaha.nama,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          widget.modalUsaha.deskripsi,
                                          overflow: TextOverflow.fade,
                                          maxLines: 2,
                                          style: TextStyle(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Nama Pemilik : " + widget.modalUsaha.pemilik,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Lokasi : " + widget.modalUsaha.lokasi,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Total Pendanaan : Rp." +
                                      numberFormat
                                          .format(
                                              widget.modalUsaha.totalPendanaan)
                                          .toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Bagi Hasil : " +
                                      widget.modalUsaha.bagiHasil.toString() +
                                      "%",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text(
                                  "Lama Tenor : " +
                                      widget.modalUsaha.lamaTenor.toString() +
                                      " Bulan",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Status : ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                    Text(
                                      widget.modalUsaha.status,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: widget.modalUsaha.status ==
                                                "Selesai"
                                            ? Colors.blue
                                            : Colors.green,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 300,
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
