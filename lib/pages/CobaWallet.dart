import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'Topup.dart';
import 'Withdraw.dart';

class CobaWallet extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  CobaWallet(
      {required this.data, required this.type, required this.data_dompet});

  @override
  State<CobaWallet> createState() => _CobaWalletState();
}

class History {
  final int id_jenis;
  final String nama_transaksi;
  final int jumlah_transaksi;
  final String tanggal;
  final String keterangan;

  History({
    required this.id_jenis,
    required this.nama_transaksi,
    required this.jumlah_transaksi,
    required this.tanggal,
    required this.keterangan,
  });
}

class _CobaWalletState extends State<CobaWallet> {
  late Future<Map<String, dynamic>> userData;
  late Future<List<History>> dataList;

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
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

  Future<List<History>> getHistory(String id) async {
    final hasil =
        await http.get(Uri.parse('http://127.0.0.1:8000/get_id_history/$id'));
    if (hasil.statusCode == 200) {
      final jsonData = jsonDecode(hasil.body);
      List<History> newDataList = [];
      for (var item in jsonData['data']) {
        // Membuat objek History dari item JSON
        History history = History(
          id_jenis: item['id_jenis'],
          nama_transaksi: item['nama'],
          jumlah_transaksi: item['jumlah'],
          tanggal: item['tanggal'],
          keterangan: item['keterangan'],
          // tambahkan atribut lain sesuai dengan struktur JSON
        );
        newDataList.add(history);
      }

      return newDataList;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    userData = getUserData(widget.data, widget.type);
    dataList = getHistory(widget.data_dompet);
  }

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
            final investor = snapshot.data;
            return FutureBuilder<List<History>>(
                future: dataList,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    final listHistory = snapshot.data!;
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
                                        'Wallet',
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
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 50),
                                  margin: EdgeInsets.only(top: 50),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(142, 220, 179, 1),
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                      color: Color.fromRGBO(142, 220, 179, 1),
                                      width: 1,
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
                                  height: 1200,
                                ),
                                Center(
                                  child: Container(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          backgroundImage: NetworkImage(
                                              "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                                        ),
                                        SizedBox(height: 15),
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Halo, ${investor!["data"]["name"]}!',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40, horizontal: 40),
                                          margin: EdgeInsets.only(top: 20),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Color.fromRGBO(142, 220,
                                                  179, 1), // Warna border
                                              width: 1, // Ketebalan border
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                    0.2), // Warna bayangan (black) dengan opasitas 0.2
                                                spreadRadius:
                                                    2, // Jarak penyebaran bayangan
                                                blurRadius:
                                                    4, // Jarak blur bayangan
                                                offset: Offset(0,
                                                    2), // Posisi offset bayangan (horizontal, vertical)
                                              ),
                                            ],
                                          ),
                                          width: 450,
                                          height: 230,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Total Saldo',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .account_balance_wallet,
                                                    size: 30,
                                                    color: Colors.black,
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          10), // Tambahkan jarak antara ikon dan teks nominal
                                                  Text(
                                                    "Rp. " +
                                                        numberFormat.format(
                                                            investor["data"]
                                                                ["saldo"]),
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    'Top Up',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 200),
                                                  Text(
                                                    'Withdraw',
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      size: 30,
                                                      color: Colors.black),
                                                  SizedBox(width: 220),
                                                  Icon(
                                                      Icons
                                                          .add_circle_outline_outlined,
                                                      size: 30,
                                                      color: Colors.black),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 25),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 25, right: 25, bottom: 20),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Activity",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18,
                                                    color: Colors.black,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 0),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  height: 10),
                                                              ListView.builder(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20),
                                                                shrinkWrap:
                                                                    true,
                                                                itemCount:
                                                                    listHistory
                                                                        .length,
                                                                itemBuilder:
                                                                    (context,
                                                                        index) {
                                                                  History
                                                                      walletView =
                                                                      listHistory[
                                                                          index];
                                                                  return GestureDetector(
                                                                    child:
                                                                        Container(
                                                                      child:
                                                                          Column(
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            padding:
                                                                                EdgeInsets.all(10),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: Colors.white,
                                                                              borderRadius: BorderRadius.circular(25),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.black.withOpacity(0.2),
                                                                                  spreadRadius: 2,
                                                                                  blurRadius: 4,
                                                                                  offset: Offset(0, 2),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                Container(
                                                                                  margin: EdgeInsets.only(left: 15, bottom: 10),
                                                                                  width: 10,
                                                                                  height: 15,
                                                                                  child: Center(
                                                                                    child: Icon(Icons.payment, color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Flexible(
                                                                                  child: Container(
                                                                                    margin: EdgeInsets.only(left: 15),
                                                                                    padding: EdgeInsets.all(5),
                                                                                    child: Column(
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Text(
                                                                                          walletView.nama_transaksi,
                                                                                          style: TextStyle(
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontSize: 15,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          walletView.keterangan,
                                                                                          style: TextStyle(
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          walletView.tanggal,
                                                                                          style: TextStyle(
                                                                                            fontSize: 12,
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 20,
                                                                                ),
                                                                                Expanded(
                                                                                  child: Container(
                                                                                    margin: EdgeInsets.only(left: 20),
                                                                                    child: Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                                      children: [
                                                                                        if (walletView.id_jenis == 2)
                                                                                          Text(
                                                                                            "+ " + numberFormat.format(walletView.jumlah_transaksi).toString(),
                                                                                            style: TextStyle(
                                                                                              fontSize: 15,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              color: Color.fromARGB(255, 52, 211, 24),
                                                                                            ),
                                                                                            overflow: TextOverflow.ellipsis,
                                                                                          ),
                                                                                        if (walletView.id_jenis == 1)
                                                                                          Text(
                                                                                            "- " + numberFormat.format(walletView.jumlah_transaksi).toString(),
                                                                                            style: TextStyle(
                                                                                              fontSize: 15,
                                                                                              fontWeight: FontWeight.bold,
                                                                                              color: Color.fromARGB(255, 224, 4, 4),
                                                                                            ),
                                                                                            overflow: TextOverflow.ellipsis,
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
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
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
