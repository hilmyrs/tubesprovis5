import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:icon_badge/icon_badge.dart';
import 'Account.dart';
import 'Withdraw.dart';
import 'Topup.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  final String data;
  final String data_dompet;
  final String type;

  Home({required this.data, required this.type, required this.data_dompet});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<Map<String, dynamic>> userData;
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
          await http.get(Uri.parse('http://127.0.0.1:8000/get_borrower/$id'));
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        throw Exception('Failed to fetch borrower data');
      }
    }
  }

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

  @override
  void initState() {
    super.initState();
    refreshUserData();
  }

  void refreshUserData() {
    setState(() {
      userData = getUserData(widget.data, widget.type);
      assetData = getAsset(widget.data, widget.type);
    });
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
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 50, top: 30),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Hai',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      Text(
                                        'Selamat Datang ${user!["data"]["name"]}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 60),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Account(
                                                    data: widget.data,
                                                    type: widget.type,
                                                  )));
                                    },
                                    child: const CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Stack(
                            children: [
                              //Buat bagian bawah biar kotak
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                margin: EdgeInsets.only(top: 100),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(142, 212, 178, 1),
                                ),
                                width: double.infinity,
                                height: 750,
                              ),
                              //container yg rounded rectangle
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 50),
                                margin: EdgeInsets.only(top: 50),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(142, 212, 178, 1),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: Color.fromRGBO(
                                        142, 220, 179, 1), // Warna border
                                    width: 1, // Ketebalan border
                                  ),
                                ),
                                width: double.infinity,
                                height: 800,
                              ),

                              //buat list view horizontal di stack positioned
                              Positioned(
                                  top: 225,
                                  left: 50,
                                  right: 0,
                                  child: Text(
                                    "Ayo Danai !",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),

                              //buat list view horizontal di stack positioned
                              Positioned(
                                top: 255,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            //margin: EdgeInsets.only(right: 15),
                                            width: 350,
                                            height: 205,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              //buat list view horizontal di stack positioned
                              Positioned(
                                  top: 465,
                                  left: 50,
                                  right: 0,
                                  child: Text(
                                    "Update Terkini",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  )),

                              //list view horizontal bawah
                              Positioned(
                                top: 500,
                                left: 0,
                                right: 0,
                                child: SizedBox(
                                  height: 200,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) => Card(
                                      child: Row(
                                        children: [
                                          Container(
                                            //margin: EdgeInsets.only(right: 15),
                                            width: 300,
                                            height: 205,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  "https://images.unsplash.com/photo-1607355739828-0bf365440db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1444&q=80",
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              Center(
                                child: Container(
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
                                        BoxShadow(
                                            blurRadius: 2.0,
                                            offset: Offset(0, 5))
                                      ]
                                      // Menggunakan BoxConstraints untuk mengubah lebar
                                      ),

                                  constraints: BoxConstraints(
                                      maxWidth: 800), // Lebar maksimum
                                  width: 350,
                                  height: 200,

                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Wrap(
                                        children: [
                                          //kontainer aset dan profit
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Row(
                                                  children: [
                                                    if (widget.type ==
                                                        "investor")
                                                      Text(
                                                        "Total Aset : ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    if (widget.type !=
                                                        "investor")
                                                      Text(
                                                        "Total Tagihan : ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    Spacer(),
                                                    Icon(
                                                      Icons.notifications,
                                                      color: Colors.black,
                                                      size: 30.0,
                                                    ),
                                                  ],
                                                ),
                                                if (widget.type == "investor")
                                                  Text(
                                                    "Rp. " + asset!['asset'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                if (widget.type == "investor")
                                                  Text(
                                                    "Total Profit : Rp. " +
                                                        asset!['profit'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w100,
                                                        fontSize: 10),
                                                  )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 300,
                                            height: 30,
                                          ),
                                          //kontainer dompet
                                          Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                //Row untuk title icon
                                                Row(children: [
                                                  Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            "Dompet Saya",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 11),
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .account_balance_wallet,
                                                                color: Colors
                                                                    .black,
                                                                size: 30.0,
                                                              ),
                                                              SizedBox(
                                                                  width: 5),
                                                              Text(
                                                                "Rp. " +
                                                                    numberFormat.format(
                                                                        user["data"]
                                                                            [
                                                                            "saldo"]),
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w100,
                                                                    fontSize:
                                                                        12),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),

                                                  Spacer(),

                                                  //TOP UP
                                                  //To do pindah ke laman top up
                                                  Row(
                                                    children: [
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Top Up",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 9),
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Topup(
                                                                            data:
                                                                                widget.data,
                                                                            data_dompet:
                                                                                widget.data_dompet,
                                                                            type:
                                                                                widget.type,
                                                                          )));
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .add_circle_outline,
                                                              color:
                                                                  Colors.black,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 10),

                                                      //WITHDRAW
                                                      //To Do pindah ke laman withdraw
                                                      Column(
                                                        children: [
                                                          Text(
                                                            "Withdraw",
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 9),
                                                          ),
                                                          SizedBox(width: 5),
                                                          //Withdraw
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          Withdraw(
                                                                            data:
                                                                                widget.data,
                                                                            data_dompet:
                                                                                widget.data_dompet,
                                                                            type:
                                                                                widget.type,
                                                                          )));
                                                            },
                                                            child: const Icon(
                                                              Icons
                                                                  .add_circle_outline,
                                                              color:
                                                                  Colors.black,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                  //SizedBox(width: 4),
                                                ]),
                                                //Row buat icon
                                              ],
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
              },
            );
          }
        });
  }
}
