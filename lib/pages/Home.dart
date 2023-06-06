import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icon_badge/icon_badge.dart';
import 'Withdraw.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Halo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Selamat Datang [Investor]',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 60),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1531256456869-ce942a665e80?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTI4fHxwcm9maWxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"),
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
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  margin: EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(142, 212, 178, 1),
                  ),
                  width: double.infinity,
                  height: 750,
                ),
                //container yg rounded rectangle
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(142, 212, 178, 1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color.fromRGBO(142, 220, 179, 1), // Warna border
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
                      "Ayo Danai Mereka",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                                borderRadius: BorderRadius.circular(15),
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
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                                borderRadius: BorderRadius.circular(15),
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    margin: EdgeInsets.only(top: 7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color:
                              Color.fromRGBO(175, 175, 175, 1), // Warna border
                          width: 0.5, // Ketebalan border
                        ),
                        boxShadow: [
                          BoxShadow(blurRadius: 2.0, offset: Offset(0, 5))
                        ]
                        // Menggunakan BoxConstraints untuk mengubah lebar
                        ),

                    constraints:
                        BoxConstraints(maxWidth: 800), // Lebar maksimum
                    width: 350,
                    height: 200,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Wrap(
                          children: [
                            //kontainer aset dan profit
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Total Aset : ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Icon(
                                        Icons.notifications,
                                        color: Colors.black,
                                        size: 30.0,
                                      ),
                                    ],
                                  ),

                                  //TO DO Angka
                                  Text(
                                    "Rp. XX.XXX.XXX",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),

                                  //TO DO Tambahin profit + custom color
                                  Text(
                                    "Total Profit : Rp. X.XXX.XXX (+10%)",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w100,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  //Row untuk title icon
                                  Row(children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              "Dompet Saya",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11),
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.account_balance_wallet,
                                                  color: Colors.black,
                                                  size: 30.0,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  "Rp. X.XXX.XXX",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w100,
                                                      fontSize: 12),
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 9),
                                            ),
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.black,
                                              size: 30.0,
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
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 9),
                                            ),
                                            SizedBox(width: 5),
                                            //Withdraw
                                            Icon(
                                              Icons.add_circle_outline,
                                              color: Colors.black,
                                              size: 30.0,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    //SizedBox(width: 4),
                                  ]),
                                  //Row buat icon
                                  Row(
                                    children: [
                                      //Wallet

                                      //Spacer(),
                                    ],
                                  )
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
}
