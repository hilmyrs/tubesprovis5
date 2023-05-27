import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class CobaWallet extends StatefulWidget {
  const CobaWallet({super.key});

  @override
  State<CobaWallet> createState() => _CobaWalletState();
}

class _CobaWalletState extends State<CobaWallet> {
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
                        color: Colors.black.withOpacity(0.2), // Warna bayangan (black) dengan opasitas 0.2
                        spreadRadius: 2, // Jarak penyebaran bayangan
                        blurRadius: 4, // Jarak blur bayangan
                        offset: Offset(0, 2), // Posisi offset bayangan (horizontal, vertical)
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: 800,
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
                            'Halo, [Investor / UMKM]!',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(142, 220, 179, 1), // Warna border
                              width: 1, // Ketebalan border
                            ),
                             boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Warna bayangan (black) dengan opasitas 0.2
                                  spreadRadius: 2, // Jarak penyebaran bayangan
                                  blurRadius: 4, // Jarak blur bayangan
                                  offset: Offset(0, 2), // Posisi offset bayangan (horizontal, vertical)
                                ),
                              ],
                          ),
                          width: 450,
                          height: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Total Saldo',
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                        Icon(
                                            Icons.account_balance_wallet,
                                            size: 30,
                                            color: Colors.black,
                                          ),
                                    SizedBox(width: 10), // Tambahkan jarak antara ikon dan teks nominal
                                    Text(
                                      'Rp5.000.000',
                                      style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Top Up', style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    SizedBox(width: 200),
                                     Text('Withdraw', style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle_outline_outlined, size: 30,
                                            color: Colors.black),
                                    SizedBox(width: 220),
                                    Icon(Icons.add_circle_outline_outlined, size: 30,
                                            color: Colors.black),
                                  ],
                                )
                              ],
                          ),

                        ),
                        SizedBox(height: 25),
                        Padding(
                        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Warna bayangan (black) dengan opasitas 0.2
                                  spreadRadius: 2, // Jarak penyebaran bayangan
                                  blurRadius: 4, // Jarak blur bayangan
                                  offset: Offset(0, 2), // Posisi offset bayangan (horizontal, vertical)
                                ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20, right: 20, left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Icon(Icons.payment,color: Colors.black,)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 90) * 0.7,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Transfer ke Bank",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Ke BRI C**** P****",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "27 Mei 2023",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "-Rp1.000.000",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.red),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          left: 25,
                          right: 25,
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black.withOpacity(0.2), // Warna bayangan (black) dengan opasitas 0.2
                                  spreadRadius: 2, // Jarak penyebaran bayangan
                                  blurRadius: 4, // Jarak blur bayangan
                                  offset: Offset(0, 2), // Posisi offset bayangan (horizontal, vertical)
                                ),
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 20, right: 20, left: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                child: Center(
                                    child: Icon(Icons.payment,color: Colors.black,)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  width: (size.width - 90) * 0.7,
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Isi Saldo",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Dari BNI A*** Z***",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                         SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "26 Mei 2023",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ]),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        "+Rp500.000",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.green),
                                      )
                                    ],
                                  ),
                                ),
                              )
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
}
