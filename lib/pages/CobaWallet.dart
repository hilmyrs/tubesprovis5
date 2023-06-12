import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';

class CobaWallet extends StatefulWidget {
  const CobaWallet({Key? key}) : super(key: key);

  @override
  State<CobaWallet> createState() => _CobaWalletState();
}

class Wallet {
  final String jenisTransaksi;
  final String keteranganTransaksi;
  final String tanggal;
  final String nominalTransaksi;

  Wallet({
    required this.jenisTransaksi,
    required this.keteranganTransaksi,
    required this.tanggal,
    required this.nominalTransaksi,
  });
}

class _CobaWalletState extends State<CobaWallet> {
  List<Wallet> WalletList = [
    Wallet(
      jenisTransaksi: "Transfer ke Bank",
      keteranganTransaksi: "Ke BRI C*** P****",
      tanggal: "27 Mei 2023",
      nominalTransaksi: "-Rp1.000.000",
    ),
    Wallet(
      jenisTransaksi: "Isi Saldo dari Bank",
      keteranganTransaksi: "Dari BRI C*** P****",
      tanggal: "26 Mei 2023",
      nominalTransaksi: "+Rp500.000",
    ),
    Wallet(
      jenisTransaksi: "Transfer ke Dana",
      keteranganTransaksi: "Ke Dana A*** Z***",
      tanggal: "25 Mei 2023",
      nominalTransaksi: "-Rp100.000",
    ),
    Wallet(
      jenisTransaksi: "Isi Saldo dari Gopay",
      keteranganTransaksi: "Dari Gopay C***",
      tanggal: "24 Mei 2023",
      nominalTransaksi: "+Rp200.000",
    ),
  ];

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
                      color: Color.fromRGBO(142, 220, 179, 1),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0, 2),
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
                            'Halo, [Investor] !',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 40, horizontal: 40),
                          margin: EdgeInsets.only(top: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromRGBO(142, 220, 179, 1),
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          width: 450,
                          height: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Total Saldo',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
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
                                  SizedBox(width: 10),
                                  Text(
                                    'RpXXX.XXX.XXX',
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Top Up',
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 200),
                                  Text(
                                    'Withdraw',
                                    style: TextStyle(
                                        fontSize: 10, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_circle_outline_outlined,
                                      size: 30, color: Colors.black),
                                  SizedBox(width: 220),
                                  Icon(Icons.add_circle_outline_outlined,
                                      size: 30, color: Colors.black),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Activity",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(height: 10),
                                              ListView.builder(
                                                padding: EdgeInsets.symmetric(horizontal: 20),
                                                shrinkWrap: true,
                                                itemCount: WalletList.length,
                                                itemBuilder: (context, index) {
                                                  Wallet walletView =
                                                      WalletList[index];
                                                  return GestureDetector(
                                                    child: Container(
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: double.infinity,
                                                            padding: EdgeInsets.all(10),
                                                            decoration: BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius:
                                                                  BorderRadius.circular(25),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors.black.withOpacity(
                                                                      0.2),
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius:
                                                                      4,
                                                                  offset: Offset(
                                                                      0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            child: Row(
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
                                                                          walletView.jenisTransaksi,
                                                                          style: TextStyle(
                                                                            fontWeight: FontWeight.bold,
                                                                            fontSize: 15,
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          walletView.keteranganTransaksi,
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
                                                                    child:Row(
                                                                      mainAxisAlignment: MainAxisAlignment.end,
                                                                      children: [
                                                                        Text(
                                                                          walletView.nominalTransaksi,
                                                                          style: TextStyle(
                                                                            fontSize: 15,
                                                                            fontWeight: FontWeight.bold,
                                                                            color: Colors.red,
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
                                                          SizedBox(height: 10),
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
}
